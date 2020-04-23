//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWStransferModel.h"
#import "AWStransferResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWStransfer
FOUNDATION_EXPORT NSString *const AWStransferSDKVersion;

/**
 <p>AWS Transfer Family is a fully managed service that enables the transfer of files over the the File Transfer Protocol (FTP), File Transfer Protocol over SSL (FTPS), or Secure Shell (SSH) File Transfer Protocol (SFTP) directly into and out of Amazon Simple Storage Service (Amazon S3). AWS helps you seamlessly migrate your file transfer workflows to AWS Transfer Family by integrating with existing authentication systems, and providing DNS routing with Amazon Route 53 so nothing changes for your customers and partners, or their applications. With your data in Amazon S3, you can use it with AWS services for processing, analytics, machine learning, and archiving. Getting started with AWS Transfer Family is easy since there is no infrastructure to buy and set up.</p>
 */
@interface AWStransfer : AWSService

/**
 The service configuration used to instantiate this service client.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
          AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                          identityPoolId:@"YourIdentityPoolId"];
          AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
          [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

          return YES;
      }

 Then call the following to get the default service client:

 *Swift*

     let transfer = AWStransfer.default()

 *Objective-C*

     AWStransfer *transfer = [AWStransfer defaulttransfer];

 @return The default service client.
 */
+ (instancetype)defaulttransfer;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWStransfer.register(with: configuration!, forKey: "USWest2transfer")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWStransfer registertransferWithConfiguration:configuration forKey:@"USWest2transfer"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let transfer = AWStransfer(forKey: "USWest2transfer")

 *Objective-C*

     AWStransfer *transfer = [AWStransfer transferForKey:@"USWest2transfer"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registertransferWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registertransferWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWStransfer.register(with: configuration!, forKey: "USWest2transfer")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWStransfer registertransferWithConfiguration:configuration forKey:@"USWest2transfer"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let transfer = AWStransfer(forKey: "USWest2transfer")

 *Objective-C*

     AWStransfer *transfer = [AWStransfer transferForKey:@"USWest2transfer"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)transferForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removetransferForKey:(NSString *)key;

/**
 <p>Instantiates an autoscaling virtual server based on the selected file transfer protocol in AWS. When you make updates to your file transfer protocol-enabled server or when you work with users, use the service-generated <code>ServerId</code> property that is assigned to the newly created server.</p>
 
 @param request A container for the necessary parameters to execute the CreateServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWStransferCreateServerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorAccessDenied`, `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceExists`, `AWStransferErrorThrottling`.
 
 @see AWStransferCreateServerRequest
 @see AWStransferCreateServerResponse
 */
- (AWSTask<AWStransferCreateServerResponse *> *)createServer:(AWStransferCreateServerRequest *)request;

/**
 <p>Instantiates an autoscaling virtual server based on the selected file transfer protocol in AWS. When you make updates to your file transfer protocol-enabled server or when you work with users, use the service-generated <code>ServerId</code> property that is assigned to the newly created server.</p>
 
 @param request A container for the necessary parameters to execute the CreateServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorAccessDenied`, `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceExists`, `AWStransferErrorThrottling`.
 
 @see AWStransferCreateServerRequest
 @see AWStransferCreateServerResponse
 */
- (void)createServer:(AWStransferCreateServerRequest *)request completionHandler:(void (^ _Nullable)(AWStransferCreateServerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a user and associates them with an existing file transfer protocol-enabled server. You can only create and associate users with servers that have the <code>IdentityProviderType</code> set to <code>SERVICE_MANAGED</code>. Using parameters for <code>CreateUser</code>, you can specify the user name, set the home directory, store the user's public key, and assign the user's AWS Identity and Access Management (IAM) role. You can also optionally add a scope-down policy, and assign metadata with tags that can be used to group and search for users.</p>
 
 @param request A container for the necessary parameters to execute the CreateUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWStransferCreateUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceExists`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferCreateUserRequest
 @see AWStransferCreateUserResponse
 */
- (AWSTask<AWStransferCreateUserResponse *> *)createUser:(AWStransferCreateUserRequest *)request;

/**
 <p>Creates a user and associates them with an existing file transfer protocol-enabled server. You can only create and associate users with servers that have the <code>IdentityProviderType</code> set to <code>SERVICE_MANAGED</code>. Using parameters for <code>CreateUser</code>, you can specify the user name, set the home directory, store the user's public key, and assign the user's AWS Identity and Access Management (IAM) role. You can also optionally add a scope-down policy, and assign metadata with tags that can be used to group and search for users.</p>
 
 @param request A container for the necessary parameters to execute the CreateUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceExists`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferCreateUserRequest
 @see AWStransferCreateUserResponse
 */
- (void)createUser:(AWStransferCreateUserRequest *)request completionHandler:(void (^ _Nullable)(AWStransferCreateUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the file transfer protocol-enabled server that you specify.</p><p>No response returns from this operation.</p>
 
 @param request A container for the necessary parameters to execute the DeleteServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorAccessDenied`, `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferDeleteServerRequest
 */
- (AWSTask *)deleteServer:(AWStransferDeleteServerRequest *)request;

/**
 <p>Deletes the file transfer protocol-enabled server that you specify.</p><p>No response returns from this operation.</p>
 
 @param request A container for the necessary parameters to execute the DeleteServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorAccessDenied`, `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferDeleteServerRequest
 */
- (void)deleteServer:(AWStransferDeleteServerRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a user's Secure Shell (SSH) public key.</p><p>No response is returned from this operation.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSshPublicKey service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`, `AWStransferErrorThrottling`.
 
 @see AWStransferDeleteSshPublicKeyRequest
 */
- (AWSTask *)deleteSshPublicKey:(AWStransferDeleteSshPublicKeyRequest *)request;

/**
 <p>Deletes a user's Secure Shell (SSH) public key.</p><p>No response is returned from this operation.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSshPublicKey service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`, `AWStransferErrorThrottling`.
 
 @see AWStransferDeleteSshPublicKeyRequest
 */
- (void)deleteSshPublicKey:(AWStransferDeleteSshPublicKeyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the user belonging to a file transfer protocol-enabled server you specify.</p><p>No response returns from this operation.</p><note><p>When you delete a user from a server, the user's information is lost.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferDeleteUserRequest
 */
- (AWSTask *)deleteUser:(AWStransferDeleteUserRequest *)request;

/**
 <p>Deletes the user belonging to a file transfer protocol-enabled server you specify.</p><p>No response returns from this operation.</p><note><p>When you delete a user from a server, the user's information is lost.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferDeleteUserRequest
 */
- (void)deleteUser:(AWStransferDeleteUserRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Describes a file transfer protocol-enabled server that you specify by passing the <code>ServerId</code> parameter.</p><p>The response contains a description of a server's properties. When you set <code>EndpointType</code> to VPC, the response will contain the <code>EndpointDetails</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWStransferDescribeServerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferDescribeServerRequest
 @see AWStransferDescribeServerResponse
 */
- (AWSTask<AWStransferDescribeServerResponse *> *)describeServer:(AWStransferDescribeServerRequest *)request;

/**
 <p>Describes a file transfer protocol-enabled server that you specify by passing the <code>ServerId</code> parameter.</p><p>The response contains a description of a server's properties. When you set <code>EndpointType</code> to VPC, the response will contain the <code>EndpointDetails</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferDescribeServerRequest
 @see AWStransferDescribeServerResponse
 */
- (void)describeServer:(AWStransferDescribeServerRequest *)request completionHandler:(void (^ _Nullable)(AWStransferDescribeServerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the user assigned to the specific file transfer protocol-enabled server, as identified by its <code>ServerId</code> property.</p><p>The response from this call returns the properties of the user associated with the <code>ServerId</code> value that was specified.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWStransferDescribeUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferDescribeUserRequest
 @see AWStransferDescribeUserResponse
 */
- (AWSTask<AWStransferDescribeUserResponse *> *)describeUser:(AWStransferDescribeUserRequest *)request;

/**
 <p>Describes the user assigned to the specific file transfer protocol-enabled server, as identified by its <code>ServerId</code> property.</p><p>The response from this call returns the properties of the user associated with the <code>ServerId</code> value that was specified.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferDescribeUserRequest
 @see AWStransferDescribeUserResponse
 */
- (void)describeUser:(AWStransferDescribeUserRequest *)request completionHandler:(void (^ _Nullable)(AWStransferDescribeUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a Secure Shell (SSH) public key to a user account identified by a <code>UserName</code> value assigned to the specific file transfer protocol-enabled server, identified by <code>ServerId</code>.</p><p>The response returns the <code>UserName</code> value, the <code>ServerId</code> value, and the name of the <code>SshPublicKeyId</code>.</p>
 
 @param request A container for the necessary parameters to execute the ImportSshPublicKey service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWStransferImportSshPublicKeyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceExists`, `AWStransferErrorResourceNotFound`, `AWStransferErrorThrottling`.
 
 @see AWStransferImportSshPublicKeyRequest
 @see AWStransferImportSshPublicKeyResponse
 */
- (AWSTask<AWStransferImportSshPublicKeyResponse *> *)importSshPublicKey:(AWStransferImportSshPublicKeyRequest *)request;

/**
 <p>Adds a Secure Shell (SSH) public key to a user account identified by a <code>UserName</code> value assigned to the specific file transfer protocol-enabled server, identified by <code>ServerId</code>.</p><p>The response returns the <code>UserName</code> value, the <code>ServerId</code> value, and the name of the <code>SshPublicKeyId</code>.</p>
 
 @param request A container for the necessary parameters to execute the ImportSshPublicKey service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceExists`, `AWStransferErrorResourceNotFound`, `AWStransferErrorThrottling`.
 
 @see AWStransferImportSshPublicKeyRequest
 @see AWStransferImportSshPublicKeyResponse
 */
- (void)importSshPublicKey:(AWStransferImportSshPublicKeyRequest *)request completionHandler:(void (^ _Nullable)(AWStransferImportSshPublicKeyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the file transfer protocol-enabled servers that are associated with your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListServers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWStransferListServersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidNextToken`, `AWStransferErrorInvalidRequest`.
 
 @see AWStransferListServersRequest
 @see AWStransferListServersResponse
 */
- (AWSTask<AWStransferListServersResponse *> *)listServers:(AWStransferListServersRequest *)request;

/**
 <p>Lists the file transfer protocol-enabled servers that are associated with your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListServers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidNextToken`, `AWStransferErrorInvalidRequest`.
 
 @see AWStransferListServersRequest
 @see AWStransferListServersResponse
 */
- (void)listServers:(AWStransferListServersRequest *)request completionHandler:(void (^ _Nullable)(AWStransferListServersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all of the tags associated with the Amazon Resource Number (ARN) you specify. The resource can be a user, server, or role.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWStransferListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidNextToken`, `AWStransferErrorInvalidRequest`.
 
 @see AWStransferListTagsForResourceRequest
 @see AWStransferListTagsForResourceResponse
 */
- (AWSTask<AWStransferListTagsForResourceResponse *> *)listTagsForResource:(AWStransferListTagsForResourceRequest *)request;

/**
 <p>Lists all of the tags associated with the Amazon Resource Number (ARN) you specify. The resource can be a user, server, or role.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidNextToken`, `AWStransferErrorInvalidRequest`.
 
 @see AWStransferListTagsForResourceRequest
 @see AWStransferListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWStransferListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWStransferListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the users for a file transfer protocol-enabled server that you specify by passing the <code>ServerId</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the ListUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWStransferListUsersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidNextToken`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferListUsersRequest
 @see AWStransferListUsersResponse
 */
- (AWSTask<AWStransferListUsersResponse *> *)listUsers:(AWStransferListUsersRequest *)request;

/**
 <p>Lists the users for a file transfer protocol-enabled server that you specify by passing the <code>ServerId</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the ListUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidNextToken`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferListUsersRequest
 @see AWStransferListUsersResponse
 */
- (void)listUsers:(AWStransferListUsersRequest *)request completionHandler:(void (^ _Nullable)(AWStransferListUsersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Changes the state of a file transfer protocol-enabled server from <code>OFFLINE</code> to <code>ONLINE</code>. It has no impact on a server that is already <code>ONLINE</code>. An <code>ONLINE</code> server can accept and process file transfer jobs.</p><p>The state of <code>STARTING</code> indicates that the server is in an intermediate state, either not fully able to respond, or not fully online. The values of <code>START_FAILED</code> can indicate an error condition.</p><p>No response is returned from this call.</p>
 
 @param request A container for the necessary parameters to execute the StartServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`, `AWStransferErrorThrottling`.
 
 @see AWStransferStartServerRequest
 */
- (AWSTask *)startServer:(AWStransferStartServerRequest *)request;

/**
 <p>Changes the state of a file transfer protocol-enabled server from <code>OFFLINE</code> to <code>ONLINE</code>. It has no impact on a server that is already <code>ONLINE</code>. An <code>ONLINE</code> server can accept and process file transfer jobs.</p><p>The state of <code>STARTING</code> indicates that the server is in an intermediate state, either not fully able to respond, or not fully online. The values of <code>START_FAILED</code> can indicate an error condition.</p><p>No response is returned from this call.</p>
 
 @param request A container for the necessary parameters to execute the StartServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`, `AWStransferErrorThrottling`.
 
 @see AWStransferStartServerRequest
 */
- (void)startServer:(AWStransferStartServerRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Changes the state of a file transfer protocol-enabled server from <code>ONLINE</code> to <code>OFFLINE</code>. An <code>OFFLINE</code> server cannot accept and process file transfer jobs. Information tied to your server, such as server and user properties, are not affected by stopping your server. Stopping the server will not reduce or impact your file transfer protocol endpoint billing.</p><p>The state of <code>STOPPING</code> indicates that the server is in an intermediate state, either not fully able to respond, or not fully offline. The values of <code>STOP_FAILED</code> can indicate an error condition.</p><p>No response is returned from this call.</p>
 
 @param request A container for the necessary parameters to execute the StopServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`, `AWStransferErrorThrottling`.
 
 @see AWStransferStopServerRequest
 */
- (AWSTask *)stopServer:(AWStransferStopServerRequest *)request;

/**
 <p>Changes the state of a file transfer protocol-enabled server from <code>ONLINE</code> to <code>OFFLINE</code>. An <code>OFFLINE</code> server cannot accept and process file transfer jobs. Information tied to your server, such as server and user properties, are not affected by stopping your server. Stopping the server will not reduce or impact your file transfer protocol endpoint billing.</p><p>The state of <code>STOPPING</code> indicates that the server is in an intermediate state, either not fully able to respond, or not fully offline. The values of <code>STOP_FAILED</code> can indicate an error condition.</p><p>No response is returned from this call.</p>
 
 @param request A container for the necessary parameters to execute the StopServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`, `AWStransferErrorThrottling`.
 
 @see AWStransferStopServerRequest
 */
- (void)stopServer:(AWStransferStopServerRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Attaches a key-value pair to a resource, as identified by its Amazon Resource Name (ARN). Resources are users, servers, roles, and other entities.</p><p>There is no response returned from this call.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferTagResourceRequest
 */
- (AWSTask *)tagResource:(AWStransferTagResourceRequest *)request;

/**
 <p>Attaches a key-value pair to a resource, as identified by its Amazon Resource Name (ARN). Resources are users, servers, roles, and other entities.</p><p>There is no response returned from this call.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferTagResourceRequest
 */
- (void)tagResource:(AWStransferTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>If the <code>IdentityProviderType</code> of a file transfer protocol-enabled server is <code>API_Gateway</code>, tests whether your API Gateway is set up successfully. We highly recommend that you call this operation to test your authentication method as soon as you create your server. By doing so, you can troubleshoot issues with the API Gateway integration to ensure that your users can successfully use the service.</p>
 
 @param request A container for the necessary parameters to execute the TestIdentityProvider service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWStransferTestIdentityProviderResponse`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferTestIdentityProviderRequest
 @see AWStransferTestIdentityProviderResponse
 */
- (AWSTask<AWStransferTestIdentityProviderResponse *> *)testIdentityProvider:(AWStransferTestIdentityProviderRequest *)request;

/**
 <p>If the <code>IdentityProviderType</code> of a file transfer protocol-enabled server is <code>API_Gateway</code>, tests whether your API Gateway is set up successfully. We highly recommend that you call this operation to test your authentication method as soon as you create your server. By doing so, you can troubleshoot issues with the API Gateway integration to ensure that your users can successfully use the service.</p>
 
 @param request A container for the necessary parameters to execute the TestIdentityProvider service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferTestIdentityProviderRequest
 @see AWStransferTestIdentityProviderResponse
 */
- (void)testIdentityProvider:(AWStransferTestIdentityProviderRequest *)request completionHandler:(void (^ _Nullable)(AWStransferTestIdentityProviderResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detaches a key-value pair from a resource, as identified by its Amazon Resource Name (ARN). Resources are users, servers, roles, and other entities.</p><p>No response is returned from this call.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWStransferUntagResourceRequest *)request;

/**
 <p>Detaches a key-value pair from a resource, as identified by its Amazon Resource Name (ARN). Resources are users, servers, roles, and other entities.</p><p>No response is returned from this call.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`.
 
 @see AWStransferUntagResourceRequest
 */
- (void)untagResource:(AWStransferUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the file transfer protocol-enabled server's properties after that server has been created.</p><p>The <code>UpdateServer</code> call returns the <code>ServerId</code> of the server you updated.</p>
 
 @param request A container for the necessary parameters to execute the UpdateServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWStransferUpdateServerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorAccessDenied`, `AWStransferErrorServiceUnavailable`, `AWStransferErrorConflict`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceExists`, `AWStransferErrorResourceNotFound`, `AWStransferErrorThrottling`.
 
 @see AWStransferUpdateServerRequest
 @see AWStransferUpdateServerResponse
 */
- (AWSTask<AWStransferUpdateServerResponse *> *)updateServer:(AWStransferUpdateServerRequest *)request;

/**
 <p>Updates the file transfer protocol-enabled server's properties after that server has been created.</p><p>The <code>UpdateServer</code> call returns the <code>ServerId</code> of the server you updated.</p>
 
 @param request A container for the necessary parameters to execute the UpdateServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorAccessDenied`, `AWStransferErrorServiceUnavailable`, `AWStransferErrorConflict`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceExists`, `AWStransferErrorResourceNotFound`, `AWStransferErrorThrottling`.
 
 @see AWStransferUpdateServerRequest
 @see AWStransferUpdateServerResponse
 */
- (void)updateServer:(AWStransferUpdateServerRequest *)request completionHandler:(void (^ _Nullable)(AWStransferUpdateServerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Assigns new properties to a user. Parameters you pass modify any or all of the following: the home directory, role, and policy for the <code>UserName</code> and <code>ServerId</code> you specify.</p><p>The response returns the <code>ServerId</code> and the <code>UserName</code> for the updated user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUser service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWStransferUpdateUserResponse`. On failed execution, `task.error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`, `AWStransferErrorThrottling`.
 
 @see AWStransferUpdateUserRequest
 @see AWStransferUpdateUserResponse
 */
- (AWSTask<AWStransferUpdateUserResponse *> *)updateUser:(AWStransferUpdateUserRequest *)request;

/**
 <p>Assigns new properties to a user. Parameters you pass modify any or all of the following: the home directory, role, and policy for the <code>UserName</code> and <code>ServerId</code> you specify.</p><p>The response returns the <code>ServerId</code> and the <code>UserName</code> for the updated user.</p>
 
 @param request A container for the necessary parameters to execute the UpdateUser service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWStransferErrorDomain` domain and the following error code: `AWStransferErrorServiceUnavailable`, `AWStransferErrorInternalService`, `AWStransferErrorInvalidRequest`, `AWStransferErrorResourceNotFound`, `AWStransferErrorThrottling`.
 
 @see AWStransferUpdateUserRequest
 @see AWStransferUpdateUserResponse
 */
- (void)updateUser:(AWStransferUpdateUserRequest *)request completionHandler:(void (^ _Nullable)(AWStransferUpdateUserResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
