//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSNetworking.h"
#import "AWSModel.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSSTSErrorDomain;

typedef NS_ENUM(NSInteger, AWSSTSErrorType) {
    AWSSTSErrorUnknown,
    AWSSTSErrorExpiredToken,
    AWSSTSErrorIDPCommunicationError,
    AWSSTSErrorIDPRejectedClaim,
    AWSSTSErrorInvalidAuthorizationMessage,
    AWSSTSErrorInvalidIdentityToken,
    AWSSTSErrorMalformedPolicyDocument,
    AWSSTSErrorPackedPolicyTooLarge,
    AWSSTSErrorRegionDisabled,
};

@class AWSSTSAssumeRoleRequest;
@class AWSSTSAssumeRoleResponse;
@class AWSSTSAssumeRoleWithSAMLRequest;
@class AWSSTSAssumeRoleWithSAMLResponse;
@class AWSSTSAssumeRoleWithWebIdentityRequest;
@class AWSSTSAssumeRoleWithWebIdentityResponse;
@class AWSSTSAssumedRoleUser;
@class AWSSTSCredentials;
@class AWSSTSDecodeAuthorizationMessageRequest;
@class AWSSTSDecodeAuthorizationMessageResponse;
@class AWSSTSFederatedUser;
@class AWSSTSGetCallerIdentityRequest;
@class AWSSTSGetCallerIdentityResponse;
@class AWSSTSGetFederationTokenRequest;
@class AWSSTSGetFederationTokenResponse;
@class AWSSTSGetSessionTokenRequest;
@class AWSSTSGetSessionTokenResponse;
@class AWSSTSPolicyDescriptorType;

/**
 
 */
@interface AWSSTSAssumeRoleRequest : AWSRequest


/**
 <p>The duration, in seconds, of the role session. The value can range from 900 seconds (15 minutes) up to the maximum session duration setting for the role. This setting can have a value from 1 hour to 12 hours. If you specify a value higher than this setting, the operation fails. For example, if you specify a session duration of 12 hours, but your administrator set the maximum session duration to 6 hours, your operation fails. To learn how to view the maximum value for your role, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session">View the Maximum Session Duration Setting for a Role</a> in the <i>IAM User Guide</i>.</p><p>By default, the value is set to <code>3600</code> seconds. </p><note><p>The <code>DurationSeconds</code> parameter is separate from the duration of a console session that you might request using the returned credentials. The request to the federation endpoint for a console sign-in token takes a <code>SessionDuration</code> parameter that specifies the maximum length of the console session. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-custom-url.html">Creating a URL that Enables Federated Users to Access the AWS Management Console</a> in the <i>IAM User Guide</i>.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>A unique identifier that might be required when you assume a role in another account. If the administrator of the account to which the role belongs provided you with an external ID, then provide that value in the <code>ExternalId</code> parameter. This value can be any string, such as a passphrase or account number. A cross-account role is usually set up to trust everyone in an account. Therefore, the administrator of the trusting account might send an external ID to the administrator of the trusted account. That way, only someone with the ID can assume the role, rather than everyone in the account. For more information about the external ID, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html">How to Use an External ID When Granting Access to Your AWS Resources to a Third Party</a> in the <i>IAM User Guide</i>.</p><p>The regex used to validate this parameter is a string of characters consisting of upper- and lower-case alphanumeric characters with no spaces. You can also include underscores or any of the following characters: =,.@:/-</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 <p>An IAM policy in JSON format that you want to use as an inline session policy.</p><p>This parameter is optional. Passing policies to this operation returns new temporary credentials. The resulting session's permissions are the intersection of the role's identity-based policy and the session policies. You can use the role's temporary credentials in subsequent AWS API calls to access resources in the account that owns the role. You cannot use session policies to grant more permissions than those allowed by the identity-based policy of the role that is being assumed. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session Policies</a> in the <i>IAM User Guide</i>.</p><p>The plain text that you use for both inline and managed session policies shouldn't exceed 2048 characters. The JSON policy characters can be any ASCII character from the space character to the end of the valid character list (\u0020 through \u00FF). It can also include the tab (\u0009), linefeed (\u000A), and carriage return (\u000D) characters.</p><note><p>The characters in this parameter count towards the 2048 character session policy guideline. However, an AWS conversion compresses the session policies into a packed binary format that has a separate limit. This is the enforced limit. The <code>PackedPolicySize</code> response element indicates by percentage how close the policy is to the upper size limit.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The Amazon Resource Names (ARNs) of the IAM managed policies that you want to use as managed session policies. The policies must exist in the same account as the role.</p><p>This parameter is optional. You can provide up to 10 managed policy ARNs. However, the plain text that you use for both inline and managed session policies shouldn't exceed 2048 characters. For more information about ARNs, see <a href="general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the AWS General Reference.</p><note><p>The characters in this parameter count towards the 2048 character session policy guideline. However, an AWS conversion compresses the session policies into a packed binary format that has a separate limit. This is the enforced limit. The <code>PackedPolicySize</code> response element indicates by percentage how close the policy is to the upper size limit.</p></note><p>Passing policies to this operation returns new temporary credentials. The resulting session's permissions are the intersection of the role's identity-based policy and the session policies. You can use the role's temporary credentials in subsequent AWS API calls to access resources in the account that owns the role. You cannot use session policies to grant more permissions than those allowed by the identity-based policy of the role that is being assumed. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session Policies</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSTSPolicyDescriptorType *> * _Nullable policyArns;

/**
 <p>The Amazon Resource Name (ARN) of the role to assume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>An identifier for the assumed role session.</p><p>Use the role session name to uniquely identify a session when the same role is assumed by different principals or for different reasons. In cross-account scenarios, the role session name is visible to, and can be logged by the account that owns the role. The role session name is also used in the ARN of the assumed role principal. This means that subsequent cross-account API requests that use the temporary security credentials will expose the role session name to the external account in their AWS CloudTrail logs.</p><p>The regex used to validate this parameter is a string of characters consisting of upper- and lower-case alphanumeric characters with no spaces. You can also include underscores or any of the following characters: =,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleSessionName;

/**
 <p>The identification number of the MFA device that is associated with the user who is making the <code>AssumeRole</code> call. Specify this value if the trust policy of the role being assumed includes a condition that requires MFA authentication. The value is either the serial number for a hardware device (such as <code>GAHT12345678</code>) or an Amazon Resource Name (ARN) for a virtual device (such as <code>arn:aws:iam::123456789012:mfa/user</code>).</p><p>The regex used to validate this parameter is a string of characters consisting of upper- and lower-case alphanumeric characters with no spaces. You can also include underscores or any of the following characters: =,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable serialNumber;

/**
 <p>The value provided by the MFA device, if the trust policy of the role being assumed requires MFA (that is, if the policy includes a condition that tests for MFA). If the role being assumed requires MFA and if the <code>TokenCode</code> value is missing or expired, the <code>AssumeRole</code> call returns an "access denied" error.</p><p>The format for this parameter, as described by its regex pattern, is a sequence of six numeric digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenCode;

@end

/**
 <p>Contains the response to a successful <a>AssumeRole</a> request, including temporary AWS credentials that can be used to make AWS requests. </p>
 */
@interface AWSSTSAssumeRoleResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) and the assumed role ID, which are identifiers that you can use to refer to the resulting temporary security credentials. For example, you can reference these credentials as a principal in a resource-based policy by using the ARN or assumed role ID. The ARN and ID include the <code>RoleSessionName</code> that you specified when you called <code>AssumeRole</code>. </p>
 */
@property (nonatomic, strong) AWSSTSAssumedRoleUser * _Nullable assumedRoleUser;

/**
 <p>The temporary security credentials, which include an access key ID, a secret access key, and a security (or session) token.</p><note><p>The size of the security token that STS API operations return is not fixed. We strongly recommend that you make no assumptions about the maximum size.</p></note>
 */
@property (nonatomic, strong) AWSSTSCredentials * _Nullable credentials;

/**
 <p>A percentage value that indicates the size of the policy in packed form. The service rejects any policy with a packed size greater than 100 percent, which means the policy exceeded the allowed space.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable packedPolicySize;

@end

/**
 
 */
@interface AWSSTSAssumeRoleWithSAMLRequest : AWSRequest


/**
 <p>The duration, in seconds, of the role session. Your role session lasts for the duration that you specify for the <code>DurationSeconds</code> parameter, or until the time specified in the SAML authentication response's <code>SessionNotOnOrAfter</code> value, whichever is shorter. You can provide a <code>DurationSeconds</code> value from 900 seconds (15 minutes) up to the maximum session duration setting for the role. This setting can have a value from 1 hour to 12 hours. If you specify a value higher than this setting, the operation fails. For example, if you specify a session duration of 12 hours, but your administrator set the maximum session duration to 6 hours, your operation fails. To learn how to view the maximum value for your role, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session">View the Maximum Session Duration Setting for a Role</a> in the <i>IAM User Guide</i>.</p><p>By default, the value is set to <code>3600</code> seconds. </p><note><p>The <code>DurationSeconds</code> parameter is separate from the duration of a console session that you might request using the returned credentials. The request to the federation endpoint for a console sign-in token takes a <code>SessionDuration</code> parameter that specifies the maximum length of the console session. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-custom-url.html">Creating a URL that Enables Federated Users to Access the AWS Management Console</a> in the <i>IAM User Guide</i>.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>An IAM policy in JSON format that you want to use as an inline session policy.</p><p>This parameter is optional. Passing policies to this operation returns new temporary credentials. The resulting session's permissions are the intersection of the role's identity-based policy and the session policies. You can use the role's temporary credentials in subsequent AWS API calls to access resources in the account that owns the role. You cannot use session policies to grant more permissions than those allowed by the identity-based policy of the role that is being assumed. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session Policies</a> in the <i>IAM User Guide</i>. </p><p>The plain text that you use for both inline and managed session policies shouldn't exceed 2048 characters. The JSON policy characters can be any ASCII character from the space character to the end of the valid character list (\u0020 through \u00FF). It can also include the tab (\u0009), linefeed (\u000A), and carriage return (\u000D) characters.</p><note><p>The characters in this parameter count towards the 2048 character session policy guideline. However, an AWS conversion compresses the session policies into a packed binary format that has a separate limit. This is the enforced limit. The <code>PackedPolicySize</code> response element indicates by percentage how close the policy is to the upper size limit.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The Amazon Resource Names (ARNs) of the IAM managed policies that you want to use as managed session policies. The policies must exist in the same account as the role.</p><p>This parameter is optional. You can provide up to 10 managed policy ARNs. However, the plain text that you use for both inline and managed session policies shouldn't exceed 2048 characters. For more information about ARNs, see <a href="general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the AWS General Reference.</p><note><p>The characters in this parameter count towards the 2048 character session policy guideline. However, an AWS conversion compresses the session policies into a packed binary format that has a separate limit. This is the enforced limit. The <code>PackedPolicySize</code> response element indicates by percentage how close the policy is to the upper size limit.</p></note><p>Passing policies to this operation returns new temporary credentials. The resulting session's permissions are the intersection of the role's identity-based policy and the session policies. You can use the role's temporary credentials in subsequent AWS API calls to access resources in the account that owns the role. You cannot use session policies to grant more permissions than those allowed by the identity-based policy of the role that is being assumed. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session Policies</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSTSPolicyDescriptorType *> * _Nullable policyArns;

/**
 <p>The Amazon Resource Name (ARN) of the SAML provider in IAM that describes the IdP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principalArn;

/**
 <p>The Amazon Resource Name (ARN) of the role that the caller is assuming.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The base-64 encoded SAML authentication response provided by the IdP.</p><p>For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/create-role-saml-IdP-tasks.html">Configuring a Relying Party and Adding Claims</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable SAMLAssertion;

@end

/**
 <p>Contains the response to a successful <a>AssumeRoleWithSAML</a> request, including temporary AWS credentials that can be used to make AWS requests. </p>
 */
@interface AWSSTSAssumeRoleWithSAMLResponse : AWSModel


/**
 <p>The identifiers for the temporary security credentials that the operation returns.</p>
 */
@property (nonatomic, strong) AWSSTSAssumedRoleUser * _Nullable assumedRoleUser;

/**
 <p> The value of the <code>Recipient</code> attribute of the <code>SubjectConfirmationData</code> element of the SAML assertion. </p>
 */
@property (nonatomic, strong) NSString * _Nullable audience;

/**
 <p>The temporary security credentials, which include an access key ID, a secret access key, and a security (or session) token.</p><note><p>The size of the security token that STS API operations return is not fixed. We strongly recommend that you make no assumptions about the maximum size.</p></note>
 */
@property (nonatomic, strong) AWSSTSCredentials * _Nullable credentials;

/**
 <p>The value of the <code>Issuer</code> element of the SAML assertion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable issuer;

/**
 <p>A hash value based on the concatenation of the <code>Issuer</code> response value, the AWS account ID, and the friendly name (the last part of the ARN) of the SAML provider in IAM. The combination of <code>NameQualifier</code> and <code>Subject</code> can be used to uniquely identify a federated user. </p><p>The following pseudocode shows how the hash value is calculated:</p><p><code>BASE64 ( SHA1 ( "https://example.com/saml" + "123456789012" + "/MySAMLIdP" ) )</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nameQualifier;

/**
 <p>A percentage value that indicates the size of the policy in packed form. The service rejects any policy with a packed size greater than 100 percent, which means the policy exceeded the allowed space.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable packedPolicySize;

/**
 <p>The value of the <code>NameID</code> element in the <code>Subject</code> element of the SAML assertion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subject;

/**
 <p> The format of the name ID, as defined by the <code>Format</code> attribute in the <code>NameID</code> element of the SAML assertion. Typical examples of the format are <code>transient</code> or <code>persistent</code>. </p><p> If the format includes the prefix <code>urn:oasis:names:tc:SAML:2.0:nameid-format</code>, that prefix is removed. For example, <code>urn:oasis:names:tc:SAML:2.0:nameid-format:transient</code> is returned as <code>transient</code>. If the format includes any other prefix, the format is returned with no modifications.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subjectType;

@end

/**
 
 */
@interface AWSSTSAssumeRoleWithWebIdentityRequest : AWSRequest


/**
 <p>The duration, in seconds, of the role session. The value can range from 900 seconds (15 minutes) up to the maximum session duration setting for the role. This setting can have a value from 1 hour to 12 hours. If you specify a value higher than this setting, the operation fails. For example, if you specify a session duration of 12 hours, but your administrator set the maximum session duration to 6 hours, your operation fails. To learn how to view the maximum value for your role, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session">View the Maximum Session Duration Setting for a Role</a> in the <i>IAM User Guide</i>.</p><p>By default, the value is set to <code>3600</code> seconds. </p><note><p>The <code>DurationSeconds</code> parameter is separate from the duration of a console session that you might request using the returned credentials. The request to the federation endpoint for a console sign-in token takes a <code>SessionDuration</code> parameter that specifies the maximum length of the console session. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-custom-url.html">Creating a URL that Enables Federated Users to Access the AWS Management Console</a> in the <i>IAM User Guide</i>.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>An IAM policy in JSON format that you want to use as an inline session policy.</p><p>This parameter is optional. Passing policies to this operation returns new temporary credentials. The resulting session's permissions are the intersection of the role's identity-based policy and the session policies. You can use the role's temporary credentials in subsequent AWS API calls to access resources in the account that owns the role. You cannot use session policies to grant more permissions than those allowed by the identity-based policy of the role that is being assumed. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session Policies</a> in the <i>IAM User Guide</i>.</p><p>The plain text that you use for both inline and managed session policies shouldn't exceed 2048 characters. The JSON policy characters can be any ASCII character from the space character to the end of the valid character list (\u0020 through \u00FF). It can also include the tab (\u0009), linefeed (\u000A), and carriage return (\u000D) characters.</p><note><p>The characters in this parameter count towards the 2048 character session policy guideline. However, an AWS conversion compresses the session policies into a packed binary format that has a separate limit. This is the enforced limit. The <code>PackedPolicySize</code> response element indicates by percentage how close the policy is to the upper size limit.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The Amazon Resource Names (ARNs) of the IAM managed policies that you want to use as managed session policies. The policies must exist in the same account as the role.</p><p>This parameter is optional. You can provide up to 10 managed policy ARNs. However, the plain text that you use for both inline and managed session policies shouldn't exceed 2048 characters. For more information about ARNs, see <a href="general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the AWS General Reference.</p><note><p>The characters in this parameter count towards the 2048 character session policy guideline. However, an AWS conversion compresses the session policies into a packed binary format that has a separate limit. This is the enforced limit. The <code>PackedPolicySize</code> response element indicates by percentage how close the policy is to the upper size limit.</p></note><p>Passing policies to this operation returns new temporary credentials. The resulting session's permissions are the intersection of the role's identity-based policy and the session policies. You can use the role's temporary credentials in subsequent AWS API calls to access resources in the account that owns the role. You cannot use session policies to grant more permissions than those allowed by the identity-based policy of the role that is being assumed. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session Policies</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSTSPolicyDescriptorType *> * _Nullable policyArns;

/**
 <p>The fully qualified host component of the domain name of the identity provider.</p><p>Specify this value only for OAuth 2.0 access tokens. Currently <code>www.amazon.com</code> and <code>graph.facebook.com</code> are the only supported identity providers for OAuth 2.0 access tokens. Do not include URL schemes and port numbers.</p><p>Do not specify this value for OpenID Connect ID tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerId;

/**
 <p>The Amazon Resource Name (ARN) of the role that the caller is assuming.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>An identifier for the assumed role session. Typically, you pass the name or identifier that is associated with the user who is using your application. That way, the temporary security credentials that your application will use are associated with that user. This session name is included as part of the ARN and assumed role ID in the <code>AssumedRoleUser</code> response element.</p><p>The regex used to validate this parameter is a string of characters consisting of upper- and lower-case alphanumeric characters with no spaces. You can also include underscores or any of the following characters: =,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleSessionName;

/**
 <p>The OAuth 2.0 access token or OpenID Connect ID token that is provided by the identity provider. Your application must get this token by authenticating the user who is using your application with a web identity provider before the application makes an <code>AssumeRoleWithWebIdentity</code> call. </p>
 */
@property (nonatomic, strong) NSString * _Nullable webIdentityToken;

@end

/**
 <p>Contains the response to a successful <a>AssumeRoleWithWebIdentity</a> request, including temporary AWS credentials that can be used to make AWS requests. </p>
 */
@interface AWSSTSAssumeRoleWithWebIdentityResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) and the assumed role ID, which are identifiers that you can use to refer to the resulting temporary security credentials. For example, you can reference these credentials as a principal in a resource-based policy by using the ARN or assumed role ID. The ARN and ID include the <code>RoleSessionName</code> that you specified when you called <code>AssumeRole</code>. </p>
 */
@property (nonatomic, strong) AWSSTSAssumedRoleUser * _Nullable assumedRoleUser;

/**
 <p>The intended audience (also known as client ID) of the web identity token. This is traditionally the client identifier issued to the application that requested the web identity token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable audience;

/**
 <p>The temporary security credentials, which include an access key ID, a secret access key, and a security token.</p><note><p>The size of the security token that STS API operations return is not fixed. We strongly recommend that you make no assumptions about the maximum size.</p></note>
 */
@property (nonatomic, strong) AWSSTSCredentials * _Nullable credentials;

/**
 <p>A percentage value that indicates the size of the policy in packed form. The service rejects any policy with a packed size greater than 100 percent, which means the policy exceeded the allowed space.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable packedPolicySize;

/**
 <p> The issuing authority of the web identity token presented. For OpenID Connect ID tokens, this contains the value of the <code>iss</code> field. For OAuth 2.0 access tokens, this contains the value of the <code>ProviderId</code> parameter that was passed in the <code>AssumeRoleWithWebIdentity</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provider;

/**
 <p>The unique user identifier that is returned by the identity provider. This identifier is associated with the <code>WebIdentityToken</code> that was submitted with the <code>AssumeRoleWithWebIdentity</code> call. The identifier is typically unique to the user and the application that acquired the <code>WebIdentityToken</code> (pairwise identifier). For OpenID Connect ID tokens, this field contains the value returned by the identity provider as the token's <code>sub</code> (Subject) claim. </p>
 */
@property (nonatomic, strong) NSString * _Nullable subjectFromWebIdentityToken;

@end

/**
 <p>The identifiers for the temporary security credentials that the operation returns.</p>
 Required parameters: [AssumedRoleId, Arn]
 */
@interface AWSSTSAssumedRoleUser : AWSModel


/**
 <p>The ARN of the temporary security credentials that are returned from the <a>AssumeRole</a> action. For more information about ARNs and how to use them in policies, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM Identifiers</a> in <i>Using IAM</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>A unique identifier that contains the role ID and the role session name of the role that is being assumed. The role ID is generated by AWS when the role is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assumedRoleId;

@end

/**
 <p>AWS credentials for API authentication.</p>
 Required parameters: [AccessKeyId, SecretAccessKey, SessionToken, Expiration]
 */
@interface AWSSTSCredentials : AWSModel


/**
 <p>The access key ID that identifies the temporary security credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessKeyId;

/**
 <p>The date on which the current credentials expire.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expiration;

/**
 <p>The secret access key that can be used to sign requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretAccessKey;

/**
 <p>The token that users must pass to the service API to use the temporary credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionToken;

@end

/**
 
 */
@interface AWSSTSDecodeAuthorizationMessageRequest : AWSRequest


/**
 <p>The encoded message that was returned with the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable encodedMessage;

@end

/**
 <p>A document that contains additional information about the authorization status of a request from an encoded message that is returned in response to an AWS request.</p>
 */
@interface AWSSTSDecodeAuthorizationMessageResponse : AWSModel


/**
 <p>An XML document that contains the decoded message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable decodedMessage;

@end

/**
 <p>Identifiers for the federated user that is associated with the credentials.</p>
 Required parameters: [FederatedUserId, Arn]
 */
@interface AWSSTSFederatedUser : AWSModel


/**
 <p>The ARN that specifies the federated user that is associated with the credentials. For more information about ARNs and how to use them in policies, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM Identifiers</a> in <i>Using IAM</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The string that identifies the federated user associated with the credentials, similar to the unique ID of an IAM user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable federatedUserId;

@end

/**
 
 */
@interface AWSSTSGetCallerIdentityRequest : AWSRequest


@end

/**
 <p>Contains the response to a successful <a>GetCallerIdentity</a> request, including information about the entity making the request.</p>
 */
@interface AWSSTSGetCallerIdentityResponse : AWSModel


/**
 <p>The AWS account ID number of the account that owns or contains the calling entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable account;

/**
 <p>The AWS ARN associated with the calling entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The unique identifier of the calling entity. The exact value depends on the type of entity that is making the call. The values returned are those listed in the <b>aws:userid</b> column in the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_variables.html#principaltable">Principal table</a> found on the <b>Policy Variables</b> reference page in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSSTSGetFederationTokenRequest : AWSRequest


/**
 <p>The duration, in seconds, that the session should last. Acceptable durations for federation sessions range from 900 seconds (15 minutes) to 129,600 seconds (36 hours), with 43,200 seconds (12 hours) as the default. Sessions obtained using AWS account root user credentials are restricted to a maximum of 3,600 seconds (one hour). If the specified duration is longer than one hour, the session obtained by using root user credentials defaults to one hour.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>The name of the federated user. The name is used as an identifier for the temporary security credentials (such as <code>Bob</code>). For example, you can reference the federated user name in a resource-based policy, such as in an Amazon S3 bucket policy.</p><p>The regex used to validate this parameter is a string of characters consisting of upper- and lower-case alphanumeric characters with no spaces. You can also include underscores or any of the following characters: =,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An IAM policy in JSON format that you want to use as an inline session policy.</p><p>You must pass an inline or managed <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">session policy</a> to this operation. You can pass a single JSON policy document to use as an inline session policy. You can also specify up to 10 managed policies to use as managed session policies.</p><p>This parameter is optional. However, if you do not pass any session policies, then the resulting federated user session has no permissions. The only exception is when the credentials are used to access a resource that has a resource-based policy that specifically references the federated user session in the <code>Principal</code> element of the policy.</p><p>When you pass session policies, the session permissions are the intersection of the IAM user policies and the session policies that you pass. This gives you a way to further restrict the permissions for a federated user. You cannot use session policies to grant more permissions than those that are defined in the permissions policy of the IAM user. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session Policies</a> in the <i>IAM User Guide</i>.</p><p>The plain text that you use for both inline and managed session policies shouldn't exceed 2048 characters. The JSON policy characters can be any ASCII character from the space character to the end of the valid character list (\u0020 through \u00FF). It can also include the tab (\u0009), linefeed (\u000A), and carriage return (\u000D) characters.</p><note><p>The characters in this parameter count towards the 2048 character session policy guideline. However, an AWS conversion compresses the session policies into a packed binary format that has a separate limit. This is the enforced limit. The <code>PackedPolicySize</code> response element indicates by percentage how close the policy is to the upper size limit.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The Amazon Resource Names (ARNs) of the IAM managed policies that you want to use as a managed session policy. The policies must exist in the same account as the IAM user that is requesting federated access.</p><p>You must pass an inline or managed <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">session policy</a> to this operation. You can pass a single JSON policy document to use as an inline session policy. You can also specify up to 10 managed policies to use as managed session policies. The plain text that you use for both inline and managed session policies shouldn't exceed 2048 characters. You can provide up to 10 managed policy ARNs. For more information about ARNs, see <a href="general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the AWS General Reference.</p><p>This parameter is optional. However, if you do not pass any session policies, then the resulting federated user session has no permissions. The only exception is when the credentials are used to access a resource that has a resource-based policy that specifically references the federated user session in the <code>Principal</code> element of the policy.</p><p>When you pass session policies, the session permissions are the intersection of the IAM user policies and the session policies that you pass. This gives you a way to further restrict the permissions for a federated user. You cannot use session policies to grant more permissions than those that are defined in the permissions policy of the IAM user. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session Policies</a> in the <i>IAM User Guide</i>.</p><note><p>The characters in this parameter count towards the 2048 character session policy guideline. However, an AWS conversion compresses the session policies into a packed binary format that has a separate limit. This is the enforced limit. The <code>PackedPolicySize</code> response element indicates by percentage how close the policy is to the upper size limit.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSSTSPolicyDescriptorType *> * _Nullable policyArns;

@end

/**
 <p>Contains the response to a successful <a>GetFederationToken</a> request, including temporary AWS credentials that can be used to make AWS requests. </p>
 */
@interface AWSSTSGetFederationTokenResponse : AWSModel


/**
 <p>The temporary security credentials, which include an access key ID, a secret access key, and a security (or session) token.</p><note><p>The size of the security token that STS API operations return is not fixed. We strongly recommend that you make no assumptions about the maximum size.</p></note>
 */
@property (nonatomic, strong) AWSSTSCredentials * _Nullable credentials;

/**
 <p>Identifiers for the federated user associated with the credentials (such as <code>arn:aws:sts::123456789012:federated-user/Bob</code> or <code>123456789012:Bob</code>). You can use the federated user's ARN in your resource-based policies, such as an Amazon S3 bucket policy. </p>
 */
@property (nonatomic, strong) AWSSTSFederatedUser * _Nullable federatedUser;

/**
 <p>A percentage value indicating the size of the policy in packed form. The service rejects policies for which the packed size is greater than 100 percent of the allowed value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable packedPolicySize;

@end

/**
 
 */
@interface AWSSTSGetSessionTokenRequest : AWSRequest


/**
 <p>The duration, in seconds, that the credentials should remain valid. Acceptable durations for IAM user sessions range from 900 seconds (15 minutes) to 129,600 seconds (36 hours), with 43,200 seconds (12 hours) as the default. Sessions for AWS account owners are restricted to a maximum of 3,600 seconds (one hour). If the duration is longer than one hour, the session for AWS account owners defaults to one hour.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>The identification number of the MFA device that is associated with the IAM user who is making the <code>GetSessionToken</code> call. Specify this value if the IAM user has a policy that requires MFA authentication. The value is either the serial number for a hardware device (such as <code>GAHT12345678</code>) or an Amazon Resource Name (ARN) for a virtual device (such as <code>arn:aws:iam::123456789012:mfa/user</code>). You can find the device for an IAM user by going to the AWS Management Console and viewing the user's security credentials. </p><p>The regex used to validate this parameter is a string of characters consisting of upper- and lower-case alphanumeric characters with no spaces. You can also include underscores or any of the following characters: =,.@:/-</p>
 */
@property (nonatomic, strong) NSString * _Nullable serialNumber;

/**
 <p>The value provided by the MFA device, if MFA is required. If any policy requires the IAM user to submit an MFA code, specify this value. If MFA authentication is required, the user must provide a code when requesting a set of temporary security credentials. A user who fails to provide the code receives an "access denied" response when requesting resources that require MFA authentication.</p><p>The format for this parameter, as described by its regex pattern, is a sequence of six numeric digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenCode;

@end

/**
 <p>Contains the response to a successful <a>GetSessionToken</a> request, including temporary AWS credentials that can be used to make AWS requests. </p>
 */
@interface AWSSTSGetSessionTokenResponse : AWSModel


/**
 <p>The temporary security credentials, which include an access key ID, a secret access key, and a security (or session) token.</p><note><p>The size of the security token that STS API operations return is not fixed. We strongly recommend that you make no assumptions about the maximum size.</p></note>
 */
@property (nonatomic, strong) AWSSTSCredentials * _Nullable credentials;

@end

/**
 <p>A reference to the IAM managed policy that is passed as a session policy for a role session or a federated user session.</p>
 */
@interface AWSSTSPolicyDescriptorType : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the IAM managed policy to use as a session policy for the role. For more information about ARNs, see <a href="general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

NS_ASSUME_NONNULL_END
