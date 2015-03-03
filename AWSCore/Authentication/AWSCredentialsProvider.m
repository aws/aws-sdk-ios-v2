/*
 * Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "AWSCredentialsProvider.h"
#import "STS.h"
#import "UICKeyChainStore.h"
#import "AWSLogging.h"
#import "Bolts.h"

NSString *const AWSCognitoCredentialsProviderErrorDomain = @"com.amazonaws.AWSCognitoCredentialsProviderErrorDomain";

NSString *const AWSCredentialsProviderKeychainAccessKeyId = @"accessKey";
NSString *const AWSCredentialsProviderKeychainSecretAccessKey = @"secretKey";
NSString *const AWSCredentialsProviderKeychainSessionToken = @"sessionKey";
NSString *const AWSCredentialsProviderKeychainExpiration = @"expiration";
NSString *const AWSCredentialsProviderKeychainIdentityId = @"identityId";

@interface AWSStaticCredentialsProvider()

@property (nonatomic, strong) NSString *accessKey;
@property (nonatomic, strong) NSString *secretKey;

@end

@implementation AWSStaticCredentialsProvider

+ (instancetype)credentialsWithAccessKey:(NSString *)accessKey secretKey:(NSString *)secretKey {
    AWSStaticCredentialsProvider *credentials = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:accessKey
                                                                                              secretKey:secretKey];
    return credentials;
}

+ (instancetype)credentialsWithCredentialsFilename:(NSString *)credentialsFilename {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:credentialsFilename ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    AWSStaticCredentialsProvider *credentials = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKey"]
                                                                                              secretKey:credentialsJson[@"secretKey"]];
    return credentials;
}

- (instancetype)initWithAccessKey:(NSString *)accessKey
                        secretKey:(NSString *)secretKey {
    if (self = [super init]) {
        _accessKey = accessKey;
        _secretKey = secretKey;
    }
    return self;
}

@end

@interface AWSAnonymousCredentialsProvider()

@end

@implementation AWSAnonymousCredentialsProvider

@end

@interface AWSWebIdentityCredentialsProvider()

@property (nonatomic, strong) AWSSTS *sts;
@property (nonatomic, strong) UICKeyChainStore *keychain;
@property (nonatomic, strong) NSString *accessKey;
@property (nonatomic, strong) NSString *secretKey;
@property (nonatomic, strong) NSString *sessionKey;
@property (nonatomic, strong) NSDate *expiration;

@end

@implementation AWSWebIdentityCredentialsProvider
@synthesize accessKey=_accessKey;
@synthesize secretKey=_secretKey;
@synthesize sessionKey=_sessionKey;
@synthesize expiration=_expiration;

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                               providerId:(NSString *)providerId
                                  roleArn:(NSString *)roleArn
                          roleSessionName:(NSString *)roleSessionName
                         webIdentityToken:(NSString *)webIdentityToken {
    AWSWebIdentityCredentialsProvider *credentialsProvider = [[AWSWebIdentityCredentialsProvider alloc] initWithRegionType:regionType
                                                                                                                providerId:providerId
                                                                                                                   roleArn:roleArn
                                                                                                           roleSessionName:roleSessionName
                                                                                                          webIdentityToken:webIdentityToken];
    return credentialsProvider;
}

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                        providerId:(NSString *)providerId
                           roleArn:(NSString *)roleArn
                   roleSessionName:(NSString *)roleSessionName
                  webIdentityToken:(NSString *)webIdentityToken {
    if (self = [super init]) {
        _keychain = [UICKeyChainStore keyChainStoreWithService:[NSString stringWithFormat:@"%@.%@.%@", providerId, webIdentityToken, roleArn]];
        _providerId = providerId;
        _roleArn = roleArn;
        _roleSessionName = roleSessionName;
        _webIdentityToken = webIdentityToken;

        AWSAnonymousCredentialsProvider *credentialsProvider = [AWSAnonymousCredentialsProvider new];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration configurationWithRegion:regionType
                                                                              credentialsProvider:credentialsProvider];

        _sts = [[AWSSTS new] initWithConfiguration:configuration];
    }

    return self;
}

- (BFTask *)refresh {
    // request new credentials
    AWSSTSAssumeRoleWithWebIdentityRequest *webIdentityRequest = [AWSSTSAssumeRoleWithWebIdentityRequest new];
    webIdentityRequest.providerId = self.providerId;
    webIdentityRequest.roleArn = self.roleArn;
    webIdentityRequest.roleSessionName = self.roleSessionName;
    webIdentityRequest.webIdentityToken = self.webIdentityToken;

    return [[self.sts assumeRoleWithWebIdentity:webIdentityRequest] continueWithBlock:^id(BFTask *task) {
        if (task.result) {
            AWSSTSAssumeRoleWithWebIdentityResponse *wifResponse = task.result;
            @synchronized(self) {
                self.accessKey = wifResponse.credentials.accessKeyId;
                self.secretKey = wifResponse.credentials.secretAccessKey;
                self.sessionKey = wifResponse.credentials.sessionToken;
                self.expiration = wifResponse.credentials.expiration;
            }
        } else {
            // reset the values for the credentials
            @synchronized(self) {
                self.accessKey = nil;
                self.secretKey = nil;
                self.sessionKey = nil;
                self.expiration = nil;
            }
        }

        return task;
    }];
}

- (NSString *)accessKey {
    @synchronized(self) {
        if (!_accessKey) {
            _accessKey = self.keychain[AWSCredentialsProviderKeychainAccessKeyId];
        }
        return _accessKey;
    }
}

- (NSString *)secretKey {
    @synchronized(self) {
        if (!_secretKey) {
            _secretKey = self.keychain[AWSCredentialsProviderKeychainSecretAccessKey];
        }
        return _secretKey;
    }
}

- (NSString *)sessionKey {
    @synchronized(self) {
        if (!_sessionKey) {
            _sessionKey = self.keychain[AWSCredentialsProviderKeychainSessionToken];
        }
        return _sessionKey;
    }
}

- (NSDate *)expiration {
    @synchronized(self) {
        if (!_expiration) {
            NSString *expirationString = self.keychain[AWSCredentialsProviderKeychainExpiration];
            if (expirationString) {
                _expiration = [NSDate dateWithTimeIntervalSince1970:[expirationString doubleValue]];
            }
        }
        return _expiration;
    }
}

- (void)setAccessKey:(NSString *)accessKey {
    @synchronized(self) {
        _accessKey = accessKey;
        self.keychain[AWSCredentialsProviderKeychainAccessKeyId] = accessKey;
    }
}

- (void) setSecretKey:(NSString *)secretKey {
    @synchronized(self) {
        _secretKey = secretKey;
        self.keychain[AWSCredentialsProviderKeychainSecretAccessKey] = secretKey;
    }
}

- (void) setSessionKey:(NSString *)sessionKey {
    @synchronized(self) {
        _sessionKey = sessionKey;
        self.keychain[AWSCredentialsProviderKeychainSessionToken] = sessionKey;
    }
}

- (void) setExpiration:(NSDate *)expiration {
    @synchronized(self) {
        _expiration = expiration;
        if (expiration) {
            self.keychain[AWSCredentialsProviderKeychainExpiration] = [NSString stringWithFormat:@"%f", [expiration timeIntervalSince1970]];
        }
        else {
            self.keychain[AWSCredentialsProviderKeychainExpiration] = nil;
        }
    }
}


@end

@interface AWSCognitoCredentialsProvider()

@property (nonatomic, strong) NSString *authRoleArn;
@property (nonatomic, strong) NSString *unAuthRoleArn;
@property (nonatomic, strong) AWSSTS *sts;
@property (nonatomic, strong) AWSCognitoIdentity *cib;
@property (nonatomic, strong) UICKeyChainStore *keychain;
@property (nonatomic, strong) BFExecutor *refreshExecutor;
@property (atomic, assign) int32_t count;
@property (nonatomic) dispatch_semaphore_t semaphore;
@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSString *accessKey;
@property (nonatomic, strong) NSString *secretKey;
@property (nonatomic, strong) NSString *sessionKey;
@property (nonatomic, strong) NSDate *expiration;
@property (atomic, assign) BOOL useEnhancedFlow;

@end

@implementation AWSCognitoCredentialsProvider

@synthesize identityId=_identityId;
@synthesize accessKey=_accessKey;
@synthesize secretKey=_secretKey;
@synthesize sessionKey=_sessionKey;
@synthesize expiration=_expiration;

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                                accountId:(NSString *)accountId
                           identityPoolId:(NSString *)identityPoolId
                            unauthRoleArn:(NSString *)unauthRoleArn
                              authRoleArn:(NSString *)authRoleArn {
    AWSCognitoCredentialsProvider *credentials = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:regionType
                                                                                                identityId:nil
                                                                                                 accountId:accountId
                                                                                            identityPoolId:identityPoolId
                                                                                             unauthRoleArn:unauthRoleArn
                                                                                               authRoleArn:authRoleArn
                                                                                                    logins:nil];
    return credentials;
}

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                                accountId:(NSString *)accountId
                           identityPoolId:(NSString *)identityPoolId
                            unauthRoleArn:(NSString *)unauthRoleArn
                              authRoleArn:(NSString *)authRoleArn
                                   logins:(NSDictionary *)logins {
    AWSCognitoCredentialsProvider *credentials = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:regionType
                                                                                                identityId:nil
                                                                                                 accountId:accountId
                                                                                            identityPoolId:identityPoolId
                                                                                             unauthRoleArn:unauthRoleArn
                                                                                               authRoleArn:authRoleArn
                                                                                                    logins:logins];
    return credentials;
}

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                               identityId:(NSString *)identityId
                                accountId:(NSString *)accountId
                           identityPoolId:(NSString *)identityPoolId
                            unauthRoleArn:(NSString *)unauthRoleArn
                              authRoleArn:(NSString *)authRoleArn
                                   logins:(NSDictionary *)logins {
    AWSCognitoCredentialsProvider *credentials = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:regionType
                                                                                                identityId:identityId
                                                                                                 accountId:accountId
                                                                                            identityPoolId:identityPoolId
                                                                                             unauthRoleArn:unauthRoleArn
                                                                                               authRoleArn:authRoleArn
                                                                                                    logins:logins];
    return credentials;
}

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                         identityProvider:(id<AWSCognitoIdentityProvider>)identityProvider
                            unauthRoleArn:(NSString *)unauthRoleArn
                              authRoleArn:(NSString *)authRoleArn {

    AWSCognitoCredentialsProvider *credentials = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:regionType
                                                                                          identityProvider:identityProvider
                                                                                             unauthRoleArn:unauthRoleArn
                                                                                               authRoleArn:authRoleArn];
    return credentials;
}

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                           identityPoolId:(NSString *)identityPoolId {

    return [AWSCognitoCredentialsProvider credentialsWithRegionType:regionType
                                                         identityId:nil
                                                     identityPoolId:identityPoolId
                                                             logins:nil];
}

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                               identityId:(NSString *)identityId
                           identityPoolId:(NSString *)identityPoolId
                                   logins:(NSDictionary *)logins {

    AWSCognitoCredentialsProvider *credentials = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:regionType
                                                                                                identityId:identityId
                                                                                            identityPoolId:identityPoolId
                                                                                                    logins:logins];
    return credentials;

}


- (instancetype)initWithRegionType:(AWSRegionType)regionType
                        identityId:(NSString *)identityId
                    identityPoolId:(NSString *)identityPoolId
                            logins:(NSDictionary *)logins {

    AWSEnhancedCognitoIdentityProvider *identityProvider = [[AWSEnhancedCognitoIdentityProvider alloc]
                                                            initWithRegionType:regionType
                                                            identityId:identityId
                                                            identityPoolId:identityPoolId
                                                            logins:logins];


    AWSCognitoCredentialsProvider *credentials = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:regionType
                                                                                          identityProvider:identityProvider
                                                                                             unauthRoleArn:nil
                                                                                               authRoleArn:nil];

    credentials.useEnhancedFlow = YES;

    return credentials;
}


- (instancetype)initWithRegionType:(AWSRegionType)regionType
                        identityId:(NSString *)identityId
                         accountId:(NSString *)accountId
                    identityPoolId:(NSString *)identityPoolId
                     unauthRoleArn:(NSString *)unauthRoleArn
                       authRoleArn:(NSString *)authRoleArn
                            logins:(NSDictionary *)logins {

    AWSBasicCognitoIdentityProvider *identityProvider = [[AWSBasicCognitoIdentityProvider alloc]
                                                         initWithRegionType:regionType
                                                         identityId:identityId
                                                         accountId:accountId
                                                         identityPoolId:identityPoolId
                                                         logins:logins];


    AWSCognitoCredentialsProvider *credentials = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:regionType
                                                                                          identityProvider:identityProvider
                                                                                             unauthRoleArn:unauthRoleArn
                                                                                               authRoleArn:authRoleArn];

    return credentials;
}

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                  identityProvider:(id<AWSCognitoIdentityProvider>) identityProvider
                     unauthRoleArn:(NSString *)unauthRoleArn
                       authRoleArn:(NSString *)authRoleArn {
    if (self = [super init]) {
        _refreshExecutor = [BFExecutor executorWithOperationQueue:[NSOperationQueue new]];
        _count = 0;
        _semaphore = dispatch_semaphore_create(0);

        _unAuthRoleArn = unauthRoleArn;
        _authRoleArn = authRoleArn;
        _identityProvider = identityProvider;

        // initialize keychain - name spaced by app bundle and identity pool id
        _keychain = [UICKeyChainStore keyChainStoreWithService:[NSString stringWithFormat:@"%@.%@.%@", [NSBundle mainBundle].bundleIdentifier, [AWSCognitoCredentialsProvider class], identityProvider.identityPoolId]];

        // If the identity provider has an identity id, use it
        if (identityProvider.identityId) {
            _keychain[AWSCredentialsProviderKeychainIdentityId] = identityProvider.identityId;
        }
        // Otherwise push whatever is in the keychain down to the identity provider
        else {
            identityProvider.identityId = _keychain[AWSCredentialsProviderKeychainIdentityId];
        }

        AWSAnonymousCredentialsProvider *credentialsProvider = [AWSAnonymousCredentialsProvider new];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration configurationWithRegion:regionType
                                                                              credentialsProvider:credentialsProvider];

        _sts = [[AWSSTS alloc] initWithConfiguration:configuration];
        _cib = [[AWSCognitoIdentity new] initWithConfiguration:configuration];

        // Use the new flow if we explictly created an ehancedProvider
        // or if the roles are both nil (developer authenticated identities flow)
        _useEnhancedFlow = [identityProvider isKindOfClass:[AWSEnhancedCognitoIdentityProvider class]] || ((unauthRoleArn == nil) && (authRoleArn == nil));
    }

    return self;
}

- (BFTask *)getCredentialsWithSTS:(NSString *)token authenticated:(BOOL)auth {
    NSString *roleArn = self.unAuthRoleArn;
    if (auth) {
        roleArn = self.authRoleArn;
    }

    if (roleArn == nil) {
        return [BFTask taskWithError:[NSError errorWithDomain:AWSCognitoCredentialsProviderErrorDomain
                                                         code:AWSCognitoCredentialsProviderInvalidConfiguration
                                                     userInfo:@{NSLocalizedDescriptionKey: @"Required role ARN is nil"}]
                ];
    }

    AWSSTSAssumeRoleWithWebIdentityRequest *webIdentityRequest = [AWSSTSAssumeRoleWithWebIdentityRequest new];
    webIdentityRequest.roleArn = roleArn;
    webIdentityRequest.webIdentityToken = token;
    webIdentityRequest.roleSessionName = @"iOS-Provider";
    return [[self.sts assumeRoleWithWebIdentity:webIdentityRequest] continueWithBlock:^id(BFTask *task) {
        if (task.result) {
            AWSSTSAssumeRoleWithWebIdentityResponse *webIdentityResponse = task.result;
            @synchronized(self) {
                self.accessKey = webIdentityResponse.credentials.accessKeyId;
                self.secretKey = webIdentityResponse.credentials.secretAccessKey;
                self.sessionKey = webIdentityResponse.credentials.sessionToken;
                self.expiration = webIdentityResponse.credentials.expiration;
            }
        } else {
            // reset the values for the credentials
            [self clearCredentials];
        }

        return task;
    }];
}

- (BFTask *)getCredentialsWithCognito:(NSString *)token authenticated:(BOOL)auth {
    // Grab a reference to our provider in case it changes out from under us
    id<AWSCognitoIdentityProvider> providerRef = self.identityProvider;

    AWSCognitoIdentityGetCredentialsForIdentityInput *getCredentialsInput = [AWSCognitoIdentityGetCredentialsForIdentityInput new];
    getCredentialsInput.identityId = self.identityId;
    if (token) {
        getCredentialsInput.logins = @{ @"cognito-identity.amazonaws.com": token };
    }
    else {
        getCredentialsInput.logins = self.logins;
    }


    return [[[self.cib getCredentialsForIdentity:getCredentialsInput] continueWithBlock:^id(BFTask *task) {
        // When an invalid identityId is cached in the keychain for auth,
        // we will refresh the identityId and try to get credentials token again.
        if (task.error) {
            AWSLogError(@"GetCredentialsForIdentity failed. Error is [%@]", task.error);

            // If it's auth or we caught a not found or validation error
            // we want to reset the identity id, otherwise, just return
            // the error to our caller
            if (!(auth || [AWSCognitoCredentialsProvider shouldResetIdentityId:task.error])) {
                return task;
            }

            AWSLogVerbose(@"Resetting identity Id and calling getIdentityId");
            // if it's auth, reset id and refetch
            self.identityId = nil;
            providerRef.identityId = nil;

            return [[providerRef getIdentityId] continueWithSuccessBlock:^id(BFTask *task) {
                // This should never happen, but just in case
                if (!providerRef.identityId) {
                    AWSLogError(@"In refresh, but identitId is nil.");
                    AWSLogError(@"Result from getIdentityId is %@", task.result);
                    return [BFTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain
                                                                     code:AWSCognitoIdentityProviderErrorIdentityIsNil
                                                                 userInfo:@{NSLocalizedDescriptionKey: @"identityId shouldn't be nil"}]
                            ];
                }
                self.identityId = providerRef.identityId;

                AWSLogVerbose(@"Retrying GetCredentialsForIdentity");

                // retry get credentials
                AWSCognitoIdentityGetCredentialsForIdentityInput *getCredentialsRetry = [AWSCognitoIdentityGetCredentialsForIdentityInput new];
                getCredentialsRetry.identityId = self.identityId;
                getCredentialsRetry.logins = self.logins;

                return [self.cib getCredentialsForIdentity:getCredentialsRetry];
            }];
        }
        if (task.exception) {
            AWSLogError(@"GetCredentialsForIdentity failed. Exception is [%@]", task.exception);
        }
        return task;
    }] continueWithSuccessBlock:^id(BFTask *task) {
        AWSCognitoIdentityGetCredentialsForIdentityResponse *getCredentialsResponse = task.result;
        self.accessKey = getCredentialsResponse.credentials.accessKeyId;
        self.secretKey = getCredentialsResponse.credentials.secretKey;
        self.sessionKey = getCredentialsResponse.credentials.sessionToken;
        self.expiration = getCredentialsResponse.credentials.expiration;

        NSString *identityIdFromResponse = getCredentialsResponse.identityId;

        // This should never happen, but just in case
        if (!identityIdFromResponse) {
            AWSLogError(@"identityId from getCredentialsForIdentity is nil");
            return [BFTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain
                                                             code:AWSCognitoIdentityProviderErrorIdentityIsNil
                                                         userInfo:@{NSLocalizedDescriptionKey: @"identityId shouldn't be nil"}]
                    ];
        }

        if (![self.identityId isEqualToString:identityIdFromResponse]) {
            self.identityId = identityIdFromResponse;
            providerRef.identityId = identityIdFromResponse;
        }

        return [BFTask taskWithResult:self.identityId];
    }];
}

- (BFTask *)refresh {
    // Grab a reference to our provider in case it changes out from under us
    id<AWSCognitoIdentityProvider> providerRef = self.identityProvider;

    return [[[BFTask taskWithResult:nil] continueWithExecutor:self.refreshExecutor withSuccessBlock:^id(BFTask *task) {
        self.count++;
        if (self.count <= 1) {
            return [[providerRef refresh] continueWithSuccessBlock:^id(BFTask *task) {
                // This should never happen, but just in case
                if (!providerRef.identityId) {
                    AWSLogError(@"In refresh, but identityId is nil.");
                    return [BFTask taskWithError:[NSError errorWithDomain:AWSCognitoCredentialsProviderErrorDomain
                                                                     code:AWSCognitoCredentialsProviderIdentityIdIsNil
                                                                 userInfo:@{NSLocalizedDescriptionKey: @"identityId shouldn't be nil"}]
                            ];
                }

                self.identityId = providerRef.identityId;

                if (self.useEnhancedFlow) {
                    return [self getCredentialsWithCognito:providerRef.token authenticated:[providerRef isAuthenticated]];
                }
                else {
                    return [self getCredentialsWithSTS:providerRef.token authenticated:[providerRef isAuthenticated]];
                }
            }];
        } else {
            dispatch_semaphore_wait(self.semaphore, dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC));
            return [BFTask taskWithResult:nil];
        }
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            AWSLogError(@"Unable to refresh. Error is [%@]", task.error);
        }
        if (task.exception) {
            AWSLogError(@"Unable to refresh. Exception is [%@]", task.exception);
        }

        self.count--;
        dispatch_semaphore_signal(self.semaphore);

        return task;
    }];
}

- (BFTask *)getIdentityId {
    // Grab a reference to our provider in case it changes out from under us
    id<AWSCognitoIdentityProvider> providerRef = self.identityProvider;

    return [[providerRef getIdentityId] continueWithSuccessBlock:^id(BFTask *task) {
        // This should never happen, but just in case
        if (!providerRef.identityId) {
            AWSLogError(@"In refresh, but identityId is nil.");
            AWSLogError(@"Result from getIdentityId is %@", task.result);
            return [BFTask taskWithError:[NSError errorWithDomain:AWSCognitoCredentialsProviderErrorDomain
                                                             code:AWSCognitoCredentialsProviderIdentityIdIsNil
                                                         userInfo:@{NSLocalizedDescriptionKey: @"identityId shouldn't be nil"}]
                    ];
        }
        self.identityId = providerRef.identityId;
        return task;
    }];
}

- (void)clearKeychain {
    @synchronized(self) {
        [self.identityProvider clear];
        self.identityId = nil;
        [self clearCredentials];
    }
}

- (void)clearCredentials {
    @synchronized(self) {
        self.accessKey = nil;
        self.secretKey = nil;
        self.sessionKey = nil;
        self.expiration = nil;
    }
}

- (NSString *)identityId {
    @synchronized(self) {
        if (!_identityId) {
            _identityId = [self.keychain stringForKey:AWSCredentialsProviderKeychainIdentityId];
        }
        return _identityId;
    }
}

- (NSString *)accessKey {
    @synchronized(self) {
        if (!_accessKey) {
            _accessKey = self.keychain[AWSCredentialsProviderKeychainAccessKeyId];
        }
        return _accessKey;
    }
}

- (NSString *)secretKey {
    @synchronized(self) {
        if (!_secretKey) {
            _secretKey = self.keychain[AWSCredentialsProviderKeychainSecretAccessKey];
        }
        return _secretKey;
    }
}

- (NSString *)sessionKey {
    @synchronized(self) {
        if (!_sessionKey) {
            _sessionKey = self.keychain[AWSCredentialsProviderKeychainSessionToken];
        }
        return _sessionKey;
    }
}

- (NSDate *)expiration {
    @synchronized(self) {
        if (!_expiration) {
            NSString *expirationString = self.keychain[AWSCredentialsProviderKeychainExpiration];
            if (expirationString) {
                _expiration = [NSDate dateWithTimeIntervalSince1970:[expirationString doubleValue]];
            }
        }
        return _expiration;
    }
}

- (void)setIdentityId:(NSString *)identityId {
    @synchronized(self) {
        _identityId = identityId;
        self.keychain[AWSCredentialsProviderKeychainIdentityId] = identityId;
    }
}

- (void)setAccessKey:(NSString *)accessKey {
    @synchronized(self) {
        _accessKey = accessKey;
        self.keychain[AWSCredentialsProviderKeychainAccessKeyId] = accessKey;
    }
}

- (void)setSecretKey:(NSString *)secretKey {
    @synchronized(self) {
        _secretKey = secretKey;
        self.keychain[AWSCredentialsProviderKeychainSecretAccessKey] = secretKey;
    }
}

- (void)setSessionKey:(NSString *)sessionKey {
    @synchronized(self) {
        _sessionKey = sessionKey;
        self.keychain[AWSCredentialsProviderKeychainSessionToken] = sessionKey;
    }
}

- (void)setExpiration:(NSDate *)expiration {
    @synchronized(self) {
        _expiration = expiration;
        if (expiration) {
            self.keychain[AWSCredentialsProviderKeychainExpiration] = [NSString stringWithFormat:@"%f", [expiration timeIntervalSince1970]];
        }
        else {
            self.keychain[AWSCredentialsProviderKeychainExpiration] = nil;
        }
    }
}

- (void)setLogins:(NSDictionary *)logins {
    self.identityProvider.logins = logins;
    // invalidate the credentials, so next time we
    // are forced to get a new token (and perhaps merge)
    [self clearCredentials];
}

- (NSDictionary *)logins {
    return self.identityProvider.logins;
}

- (NSString *)identityPoolId {
    return self.identityProvider.identityPoolId;
}

+ (BOOL)shouldResetIdentityId:(NSError *)error {
    if ([error.domain isEqualToString:AWSCognitoIdentityErrorDomain]) {
        switch (error.code) {
            case AWSCognitoIdentityErrorResourceNotFound:
                return YES;
            case AWSCognitoIdentityErrorUnknown: {
                NSString *errorMsg = [error.userInfo objectForKey:@"__type"];
                return [errorMsg isEqualToString:@"ValidationException"];
            }
        }
    }
    return NO;
}

@end
