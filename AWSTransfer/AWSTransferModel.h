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
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSTransferErrorDomain;

typedef NS_ENUM(NSInteger, AWSTransferErrorType) {
    AWSTransferErrorUnknown,
    AWSTransferErrorAccessDenied,
    AWSTransferErrorConflict,
    AWSTransferErrorInternalService,
    AWSTransferErrorInvalidNextToken,
    AWSTransferErrorInvalidRequest,
    AWSTransferErrorResourceExists,
    AWSTransferErrorResourceNotFound,
    AWSTransferErrorServiceUnavailable,
    AWSTransferErrorThrottling,
};

typedef NS_ENUM(NSInteger, AWSTransferEndpointType) {
    AWSTransferEndpointTypeUnknown,
    AWSTransferEndpointTypePublic,
    AWSTransferEndpointTypeVpc,
    AWSTransferEndpointTypeVpcEndpoint,
};

typedef NS_ENUM(NSInteger, AWSTransferHomeDirectoryType) {
    AWSTransferHomeDirectoryTypeUnknown,
    AWSTransferHomeDirectoryTypePath,
    AWSTransferHomeDirectoryTypeLogical,
};

typedef NS_ENUM(NSInteger, AWSTransferIdentityProviderType) {
    AWSTransferIdentityProviderTypeUnknown,
    AWSTransferIdentityProviderTypeServiceManaged,
    AWSTransferIdentityProviderTypeApiGateway,
};

typedef NS_ENUM(NSInteger, AWSTransferProtocols) {
    AWSTransferProtocolsUnknown,
    AWSTransferProtocolsSftp,
    AWSTransferProtocolsFtp,
    AWSTransferProtocolsFtps,
};

typedef NS_ENUM(NSInteger, AWSTransferState) {
    AWSTransferStateUnknown,
    AWSTransferStateOffline,
    AWSTransferStateOnline,
    AWSTransferStateStarting,
    AWSTransferStateStopping,
    AWSTransferStateStartFailed,
    AWSTransferStateStopFailed,
};

@class AWSTransferCreateServerRequest;
@class AWSTransferCreateServerResponse;
@class AWSTransferCreateUserRequest;
@class AWSTransferCreateUserResponse;
@class AWSTransferDeleteServerRequest;
@class AWSTransferDeleteSshPublicKeyRequest;
@class AWSTransferDeleteUserRequest;
@class AWSTransferDescribeServerRequest;
@class AWSTransferDescribeServerResponse;
@class AWSTransferDescribeUserRequest;
@class AWSTransferDescribeUserResponse;
@class AWSTransferDescribedServer;
@class AWSTransferDescribedUser;
@class AWSTransferEndpointDetails;
@class AWSTransferHomeDirectoryMapEntry;
@class AWSTransferIdentityProviderDetails;
@class AWSTransferImportSshPublicKeyRequest;
@class AWSTransferImportSshPublicKeyResponse;
@class AWSTransferListServersRequest;
@class AWSTransferListServersResponse;
@class AWSTransferListTagsForResourceRequest;
@class AWSTransferListTagsForResourceResponse;
@class AWSTransferListUsersRequest;
@class AWSTransferListUsersResponse;
@class AWSTransferListedServer;
@class AWSTransferListedUser;
@class AWSTransferSshPublicKey;
@class AWSTransferStartServerRequest;
@class AWSTransferStopServerRequest;
@class AWSTransferTag;
@class AWSTransferTagResourceRequest;
@class AWSTransferTestIdentityProviderRequest;
@class AWSTransferTestIdentityProviderResponse;
@class AWSTransferUntagResourceRequest;
@class AWSTransferUpdateServerRequest;
@class AWSTransferUpdateServerResponse;
@class AWSTransferUpdateUserRequest;
@class AWSTransferUpdateUserResponse;

/**
 
 */
@interface AWSTransferCreateServerRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the AWS Certificate Manager (ACM) certificate. Required when <code>Protocols</code> is set to <code>FTPS</code>.</p><p>To request a new public certificate, see <a href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html">Request a public certificate</a> in the <i> AWS Certificate Manager User Guide</i>.</p><p>To import an existing certificate into ACM, see <a href="https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html">Importing certificates into ACM</a> in the <i> AWS Certificate Manager User Guide</i>.</p><p>To request a private certificate to use FTPS through private IP addresses, see <a href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-private.html">Request a private certificate</a> in the <i> AWS Certificate Manager User Guide</i>.</p><p>Certificates with the following cryptographic algorithms and key sizes are supported:</p><ul><li><p>2048-bit RSA (RSA_2048)</p></li><li><p>4096-bit RSA (RSA_4096)</p></li><li><p>Elliptic Prime Curve 256 bit (EC_prime256v1)</p></li><li><p>Elliptic Prime Curve 384 bit (EC_secp384r1)</p></li><li><p>Elliptic Prime Curve 521 bit (EC_secp521r1)</p></li></ul><note><p>The certificate must be a valid SSL/TLS X.509 version 3 certificate with FQDN or IP address specified and information about the issuer.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 <p>The virtual private cloud (VPC) endpoint settings that are configured for your file transfer protocol-enabled server. When you host your endpoint within your VPC, you can make it accessible only to resources within your VPC, or you can attach Elastic IPs and make it accessible to clients over the internet. Your VPC's default security groups are automatically assigned to your endpoint.</p>
 */
@property (nonatomic, strong) AWSTransferEndpointDetails * _Nullable endpointDetails;

/**
 <p>The type of VPC endpoint that you want your file transfer protocol-enabled server to connect to. You can choose to connect to the public internet or a VPC endpoint. With a VPC endpoint, you can restrict access to your server and resources only within your VPC.</p><note><p>It is recommended that you use <code>VPC</code> as the <code>EndpointType</code>. With this endpoint type, you have the option to directly associate up to three Elastic IPv4 addresses (BYO IP included) with your server's endpoint and use VPC security groups to restrict traffic by the client's public IP address. This is not possible with <code>EndpointType</code> set to <code>VPC_ENDPOINT</code>.</p></note>
 */
@property (nonatomic, assign) AWSTransferEndpointType endpointType;

/**
 <p>The RSA private key as generated by the <code>ssh-keygen -N "" -m PEM -f my-new-server-key</code> command.</p><important><p>If you aren't planning to migrate existing users from an existing SFTP-enabled server to a new server, don't update the host key. Accidentally changing a server's host key can be disruptive.</p></important><p>For more information, see <a href="https://docs.aws.amazon.com/transfer/latest/userguide/edit-server-config.html#configuring-servers-change-host-key">Change the host key for your SFTP-enabled server</a> in the <i>AWS Transfer Family User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostKey;

/**
 <p>Required when <code>IdentityProviderType</code> is set to <code>API_GATEWAY</code>. Accepts an array containing all of the information required to call a customer-supplied authentication API, including the API Gateway URL. Not required when <code>IdentityProviderType</code> is set to <code>SERVICE_MANAGED</code>.</p>
 */
@property (nonatomic, strong) AWSTransferIdentityProviderDetails * _Nullable identityProviderDetails;

/**
 <p>Specifies the mode of authentication for a file transfer protocol-enabled server. The default value is <code>SERVICE_MANAGED</code>, which allows you to store and access user credentials within the AWS Transfer Family service. Use the <code>API_GATEWAY</code> value to integrate with an identity provider of your choosing. The <code>API_GATEWAY</code> setting requires you to provide an API Gateway endpoint URL to call for authentication using the <code>IdentityProviderDetails</code> parameter.</p>
 */
@property (nonatomic, assign) AWSTransferIdentityProviderType identityProviderType;

/**
 <p>Allows the service to write your users' activity to your Amazon CloudWatch logs for monitoring and auditing purposes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loggingRole;

/**
 <p>Specifies the file transfer protocol or protocols over which your file transfer protocol client can connect to your server's endpoint. The available protocols are:</p><ul><li><p><code>SFTP</code> (Secure Shell (SSH) File Transfer Protocol): File transfer over SSH</p></li><li><p><code>FTPS</code> (File Transfer Protocol Secure): File transfer with TLS encryption</p></li><li><p><code>FTP</code> (File Transfer Protocol): Unencrypted file transfer</p></li></ul><note><p>If you select <code>FTPS</code>, you must choose a certificate stored in AWS Certificate Manager (ACM) which will be used to identify your server when clients connect to it over FTPS.</p><p>If <code>Protocol</code> includes either <code>FTP</code> or <code>FTPS</code>, then the <code>EndpointType</code> must be <code>VPC</code> and the <code>IdentityProviderType</code> must be <code>API_GATEWAY</code>.</p><p>If <code>Protocol</code> includes <code>FTP</code>, then <code>AddressAllocationIds</code> cannot be associated.</p><p>If <code>Protocol</code> is set only to <code>SFTP</code>, the <code>EndpointType</code> can be set to <code>PUBLIC</code> and the <code>IdentityProviderType</code> can be set to <code>SERVICE_MANAGED</code>.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable protocols;

/**
 <p>Key-value pairs that can be used to group and search for file transfer protocol-enabled servers.</p>
 */
@property (nonatomic, strong) NSArray<AWSTransferTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSTransferCreateServerResponse : AWSModel


/**
 <p>The service-assigned ID of the file transfer protocol-enabled server that is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

@end

/**
 
 */
@interface AWSTransferCreateUserRequest : AWSRequest


/**
 <p>The landing directory (folder) for a user when they log in to the file transfer protocol-enabled server using the client.</p><p>An example is <i><code>your-Amazon-S3-bucket-name&gt;/home/username</code></i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable homeDirectory;

/**
 <p>Logical directory mappings that specify what Amazon S3 paths and keys should be visible to your user and how you want to make them visible. You will need to specify the "<code>Entry</code>" and "<code>Target</code>" pair, where <code>Entry</code> shows how the path is made visible and <code>Target</code> is the actual Amazon S3 path. If you only specify a target, it will be displayed as is. You will need to also make sure that your IAM role provides access to paths in <code>Target</code>. The following is an example.</p><p><code>'[ "/bucket2/documentation", { "Entry": "your-personal-report.pdf", "Target": "/bucket3/customized-reports/${transfer:UserName}.pdf" } ]'</code></p><p>In most cases, you can use this value instead of the scope-down policy to lock your user down to the designated home directory ("chroot"). To do this, you can set <code>Entry</code> to '/' and set <code>Target</code> to the HomeDirectory parameter value.</p><note><p>If the target of a logical directory entry does not exist in Amazon S3, the entry will be ignored. As a workaround, you can use the Amazon S3 api to create 0 byte objects as place holders for your directory. If using the CLI, use the <code>s3api</code> call instead of <code>s3</code> so you can use the put-object operation. For example, you use the following: <code>aws s3api put-object --bucket bucketname --key path/to/folder/</code>. Make sure that the end of the key name ends in a '/' for it to be considered a folder.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSTransferHomeDirectoryMapEntry *> * _Nullable homeDirectoryMappings;

/**
 <p>The type of landing directory (folder) you want your users' home directory to be when they log into the file transfer protocol-enabled server. If you set it to <code>PATH</code>, the user will see the absolute Amazon S3 bucket paths as is in their file transfer protocol clients. If you set it <code>LOGICAL</code>, you will need to provide mappings in the <code>HomeDirectoryMappings</code> for how you want to make Amazon S3 paths visible to your users.</p>
 */
@property (nonatomic, assign) AWSTransferHomeDirectoryType homeDirectoryType;

/**
 <p>A scope-down policy for your user so you can use the same IAM role across multiple users. This policy scopes down user access to portions of their Amazon S3 bucket. Variables that you can use inside this policy include <code>${Transfer:UserName}</code>, <code>${Transfer:HomeDirectory}</code>, and <code>${Transfer:HomeBucket}</code>.</p><note><p>For scope-down policies, AWS Transfer Family stores the policy as a JSON blob, instead of the Amazon Resource Name (ARN) of the policy. You save the policy as a JSON blob and pass it in the <code>Policy</code> argument.</p><p>For an example of a scope-down policy, see <a href="https://docs.aws.amazon.com/transfer/latest/userguide/users.html#users-policies-scope-down">Creating a scope-down policy</a>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html">AssumeRole</a> in the <i>AWS Security Token Service API Reference</i>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The IAM role that controls your users' access to your Amazon S3 bucket. The policies attached to this role will determine the level of access you want to provide your users when transferring files into and out of your Amazon S3 bucket or buckets. The IAM role should also contain a trust relationship that allows the file transfer protocol-enabled server to access your resources when servicing your users' transfer requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>A system-assigned unique identifier for a file transfer protocol-enabled server instance. This is the specific server that you added your user to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

/**
 <p>The public portion of the Secure Shell (SSH) key used to authenticate the user to the file transfer protocol-enabled server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sshPublicKeyBody;

/**
 <p>Key-value pairs that can be used to group and search for users. Tags are metadata attached to users for any purpose.</p>
 */
@property (nonatomic, strong) NSArray<AWSTransferTag *> * _Nullable tags;

/**
 <p>A unique string that identifies a user and is associated with a file transfer protocol-enabled server as specified by the <code>ServerId</code>. This user name must be a minimum of 3 and a maximum of 32 characters long. The following are valid characters: a-z, A-Z, 0-9, underscore, and hyphen. The user name can't start with a hyphen.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSTransferCreateUserResponse : AWSModel


/**
 <p>The ID of the file transfer protocol-enabled server that the user is attached to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

/**
 <p>A unique string that identifies a user account associated with a file transfer protocol-enabled server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSTransferDeleteServerRequest : AWSRequest


/**
 <p>A unique system-assigned identifier for a file transfer protocol-enabled server instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

@end

/**
 
 */
@interface AWSTransferDeleteSshPublicKeyRequest : AWSRequest


/**
 <p>A system-assigned unique identifier for a file transfer protocol-enabled server instance that has the user assigned to it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

/**
 <p>A unique identifier used to reference your user's specific SSH key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sshPublicKeyId;

/**
 <p>A unique string that identifies a user whose public key is being deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSTransferDeleteUserRequest : AWSRequest


/**
 <p>A system-assigned unique identifier for a file transfer protocol-enabled server instance that has the user assigned to it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

/**
 <p>A unique string that identifies a user that is being deleted from a file transfer protocol-enabled server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSTransferDescribeServerRequest : AWSRequest


/**
 <p>A system-assigned unique identifier for a file transfer protocol-enabled server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

@end

/**
 
 */
@interface AWSTransferDescribeServerResponse : AWSModel


/**
 <p>An array containing the properties of a file transfer protocol-enabled server with the <code>ServerID</code> you specified.</p>
 */
@property (nonatomic, strong) AWSTransferDescribedServer * _Nullable server;

@end

/**
 
 */
@interface AWSTransferDescribeUserRequest : AWSRequest


/**
 <p>A system-assigned unique identifier for a file transfer protocol-enabled server that has this user assigned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

/**
 <p>The name of the user assigned to one or more file transfer protocol-enabled servers. User names are part of the sign-in credentials to use the AWS Transfer Family service and perform file transfer tasks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSTransferDescribeUserResponse : AWSModel


/**
 <p>A system-assigned unique identifier for a file transfer protocol-enabled server that has this user assigned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

/**
 <p>An array containing the properties of the user account for the <code>ServerID</code> value that you specified.</p>
 */
@property (nonatomic, strong) AWSTransferDescribedUser * _Nullable user;

@end

/**
 <p>Describes the properties of a file transfer protocol-enabled server that was specified. Information returned includes the following: the server Amazon Resource Name (ARN), the certificate ARN (if the FTPS protocol was selected), the endpoint type and details, the authentication configuration and type, the logging role, the file transfer protocol or protocols, the server ID and state, and assigned tags or metadata.</p>
 Required parameters: [Arn]
 */
@interface AWSTransferDescribedServer : AWSModel


/**
 <p>Specifies the unique Amazon Resource Name (ARN) for a file transfer protocol-enabled server to be described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Specifies the ARN of the AWS Certificate Manager (ACM) certificate. Required when <code>Protocols</code> is set to <code>FTPS</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 <p>Specifies the virtual private cloud (VPC) endpoint settings that you configured for your file transfer protocol-enabled server.</p>
 */
@property (nonatomic, strong) AWSTransferEndpointDetails * _Nullable endpointDetails;

/**
 <p>Defines the type of endpoint that your file transfer protocol-enabled server is connected to. If your server is connected to a VPC endpoint, your server isn't accessible over the public internet.</p>
 */
@property (nonatomic, assign) AWSTransferEndpointType endpointType;

/**
 <p>Specifies the Base64-encoded SHA256 fingerprint of the server's host key. This value is equivalent to the output of the <code>ssh-keygen -l -f my-new-server-key</code> command.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostKeyFingerprint;

/**
 <p>Specifies information to call a customer-supplied authentication API. This field is not populated when the <code>IdentityProviderType</code> of a file transfer protocol-enabled server is <code>SERVICE_MANAGED</code>.</p>
 */
@property (nonatomic, strong) AWSTransferIdentityProviderDetails * _Nullable identityProviderDetails;

/**
 <p>Specifies the mode of authentication method enabled for this service. A value of <code>SERVICE_MANAGED</code> means that you are using this file transfer protocol-enabled server to store and access user credentials within the service. A value of <code>API_GATEWAY</code> indicates that you have integrated an API Gateway endpoint that will be invoked for authenticating your user into the service.</p>
 */
@property (nonatomic, assign) AWSTransferIdentityProviderType identityProviderType;

/**
 <p>Specifies the AWS Identity and Access Management (IAM) role that allows a file transfer protocol-enabled server to turn on Amazon CloudWatch logging for Amazon S3 events. When set, user activity can be viewed in your CloudWatch logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loggingRole;

/**
 <p>Specifies the file transfer protocol or protocols over which your file transfer protocol client can connect to your server's endpoint. The available protocols are:</p><ul><li><p><code>SFTP</code> (Secure Shell (SSH) File Transfer Protocol): File transfer over SSH</p></li><li><p><code>FTPS</code> (File Transfer Protocol Secure): File transfer with TLS encryption</p></li><li><p><code>FTP</code> (File Transfer Protocol): Unencrypted file transfer</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable protocols;

/**
 <p>Specifies the unique system-assigned identifier for a file transfer protocol-enabled server that you instantiate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

/**
 <p>Specifies the condition of a file transfer protocol-enabled server for the server that was described. A value of <code>ONLINE</code> indicates that the server can accept jobs and transfer files. A <code>State</code> value of <code>OFFLINE</code> means that the server cannot perform file transfer operations.</p><p>The states of <code>STARTING</code> and <code>STOPPING</code> indicate that the server is in an intermediate state, either not fully able to respond, or not fully offline. The values of <code>START_FAILED</code> or <code>STOP_FAILED</code> can indicate an error condition.</p>
 */
@property (nonatomic, assign) AWSTransferState state;

/**
 <p>Specifies the key-value pairs that you can use to search for and group file transfer protocol-enabled servers that were assigned to the server that was described.</p>
 */
@property (nonatomic, strong) NSArray<AWSTransferTag *> * _Nullable tags;

/**
 <p>Specifies the number of users that are assigned to a file transfer protocol-enabled server you specified with the <code>ServerId</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable userCount;

@end

/**
 <p>Returns properties of the user that you want to describe.</p>
 Required parameters: [Arn]
 */
@interface AWSTransferDescribedUser : AWSModel


/**
 <p>Specifies the unique Amazon Resource Name (ARN) for the user that was requested to be described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Specifies the landing directory (or folder), which is the location that files are written to or read from in an Amazon S3 bucket, for the described user. An example is <i><code>your-Amazon-S3-bucket-name&gt;/home/username</code></i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable homeDirectory;

/**
 <p>Specifies the logical directory mappings that specify what Amazon S3 paths and keys should be visible to your user and how you want to make them visible. You will need to specify the "<code>Entry</code>" and "<code>Target</code>" pair, where <code>Entry</code> shows how the path is made visible and <code>Target</code> is the actual Amazon S3 path. If you only specify a target, it will be displayed as is. You will need to also make sure that your AWS Identity and Access Management (IAM) role provides access to paths in <code>Target</code>.</p><p>In most cases, you can use this value instead of the scope-down policy to lock your user down to the designated home directory ("chroot"). To do this, you can set <code>Entry</code> to '/' and set <code>Target</code> to the HomeDirectory parameter value.</p>
 */
@property (nonatomic, strong) NSArray<AWSTransferHomeDirectoryMapEntry *> * _Nullable homeDirectoryMappings;

/**
 <p>Specifies the type of landing directory (folder) you mapped for your users to see when they log into the file transfer protocol-enabled server. If you set it to <code>PATH</code>, the user will see the absolute Amazon S3 bucket paths as is in their file transfer protocol clients. If you set it <code>LOGICAL</code>, you will need to provide mappings in the <code>HomeDirectoryMappings</code> for how you want to make Amazon S3 paths visible to your users.</p>
 */
@property (nonatomic, assign) AWSTransferHomeDirectoryType homeDirectoryType;

/**
 <p>Specifies the name of the policy in use for the described user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>Specifies the IAM role that controls your users' access to your Amazon S3 bucket. The policies attached to this role will determine the level of access you want to provide your users when transferring files into and out of your Amazon S3 bucket or buckets. The IAM role should also contain a trust relationship that allows a file transfer protocol-enabled server to access your resources when servicing your users' transfer requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>Specifies the public key portion of the Secure Shell (SSH) keys stored for the described user.</p>
 */
@property (nonatomic, strong) NSArray<AWSTransferSshPublicKey *> * _Nullable sshPublicKeys;

/**
 <p>Specifies the key-value pairs for the user requested. Tag can be used to search for and group users for a variety of purposes.</p>
 */
@property (nonatomic, strong) NSArray<AWSTransferTag *> * _Nullable tags;

/**
 <p>Specifies the name of the user that was requested to be described. User names are used for authentication purposes. This is the string that will be used by your user when they log in to your file transfer protocol-enabled server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>The virtual private cloud (VPC) endpoint settings that are configured for your file transfer protocol-enabled server. With a VPC endpoint, you can restrict access to your server and resources only within your VPC. To control incoming internet traffic, invoke the <code>UpdateServer</code> API and attach an Elastic IP to your server's endpoint.</p>
 */
@interface AWSTransferEndpointDetails : AWSModel


/**
 <p>A list of address allocation IDs that are required to attach an Elastic IP address to your file transfer protocol-enabled server's endpoint. This is only valid in the <code>UpdateServer</code> API.</p><note><p>This property can only be use when <code>EndpointType</code> is set to <code>VPC</code>.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable addressAllocationIds;

/**
 <p>A list of subnet IDs that are required to host your file transfer protocol-enabled server endpoint in your VPC.</p><note><p>This property can only be used when <code>EndpointType</code> is set to <code>VPC</code>.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>The ID of the VPC endpoint.</p><note><p>This property can only be used when <code>EndpointType</code> is set to <code>VPC_ENDPOINT</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable vpcEndpointId;

/**
 <p>The VPC ID of the VPC in which a file transfer protocol-enabled server's endpoint will be hosted.</p><note><p>This property can only be used when <code>EndpointType</code> is set to <code>VPC</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Represents an object that contains entries and a targets for <code>HomeDirectoryMappings</code>.</p>
 Required parameters: [Entry, Target]
 */
@interface AWSTransferHomeDirectoryMapEntry : AWSModel


/**
 <p>Represents an entry and a target for <code>HomeDirectoryMappings</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entry;

/**
 <p>Represents the map target that is used in a <code>HomeDirectorymapEntry</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 <p>Returns information related to the type of user authentication that is in use for a file transfer protocol-enabled server's users. A server can have only one method of authentication.</p>
 */
@interface AWSTransferIdentityProviderDetails : AWSModel


/**
 <p>Provides the type of <code>InvocationRole</code> used to authenticate the user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invocationRole;

/**
 <p>Provides the location of the service endpoint used to authenticate users.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 
 */
@interface AWSTransferImportSshPublicKeyRequest : AWSRequest


/**
 <p>A system-assigned unique identifier for a file transfer protocol-enabled server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

/**
 <p>The public key portion of an SSH key pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sshPublicKeyBody;

/**
 <p>The name of the user account that is assigned to one or more file transfer protocol-enabled servers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Identifies the user, the file transfer protocol-enabled server they belong to, and the identifier of the SSH public key associated with that user. A user can have more than one key on each server that they are associated with.</p>
 Required parameters: [ServerId, SshPublicKeyId, UserName]
 */
@interface AWSTransferImportSshPublicKeyResponse : AWSModel


/**
 <p>A system-assigned unique identifier for a file transfer protocol-enabled server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

/**
 <p>The name given to a public key by the system that was imported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sshPublicKeyId;

/**
 <p>A user name assigned to the <code>ServerID</code> value that you specified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSTransferListServersRequest : AWSRequest


/**
 <p>Specifies the number of file transfer protocol-enabled servers to return as a response to the <code>ListServers</code> query.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>When additional results are obtained from the<code>ListServers</code> command, a <code>NextToken</code> parameter is returned in the output. You can then pass the <code>NextToken</code> parameter in a subsequent command to continue listing additional file transfer protocol-enabled servers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSTransferListServersResponse : AWSModel


/**
 <p>When you can get additional results from the <code>ListServers</code> operation, a <code>NextToken</code> parameter is returned in the output. In a following command, you can pass in the <code>NextToken</code> parameter to continue listing additional file transfer protocol-enabled servers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of file transfer protocol-enabled servers that were listed.</p>
 */
@property (nonatomic, strong) NSArray<AWSTransferListedServer *> * _Nullable servers;

@end

/**
 
 */
@interface AWSTransferListTagsForResourceRequest : AWSRequest


/**
 <p>Requests the tags associated with a particular Amazon Resource Name (ARN). An ARN is an identifier for a specific AWS resource, such as a server, user, or role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Specifies the number of tags to return as a response to the <code>ListTagsForResource</code> request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>When you request additional results from the <code>ListTagsForResource</code> operation, a <code>NextToken</code> parameter is returned in the input. You can then pass in a subsequent command to the <code>NextToken</code> parameter to continue listing additional tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSTransferListTagsForResourceResponse : AWSModel


/**
 <p>The ARN you specified to list the tags of.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>When you can get additional results from the <code>ListTagsForResource</code> call, a <code>NextToken</code> parameter is returned in the output. You can then pass in a subsequent command to the <code>NextToken</code> parameter to continue listing additional tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Key-value pairs that are assigned to a resource, usually for the purpose of grouping and searching for items. Tags are metadata that you define.</p>
 */
@property (nonatomic, strong) NSArray<AWSTransferTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSTransferListUsersRequest : AWSRequest


/**
 <p>Specifies the number of users to return as a response to the <code>ListUsers</code> request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>When you can get additional results from the <code>ListUsers</code> call, a <code>NextToken</code> parameter is returned in the output. You can then pass in a subsequent command to the <code>NextToken</code> parameter to continue listing additional users.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A system-assigned unique identifier for a file transfer protocol-enabled server that has users assigned to it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

@end

/**
 
 */
@interface AWSTransferListUsersResponse : AWSModel


/**
 <p>When you can get additional results from the <code>ListUsers</code> call, a <code>NextToken</code> parameter is returned in the output. You can then pass in a subsequent command to the <code>NextToken</code> parameter to continue listing additional users.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A system-assigned unique identifier for a file transfer protocol-enabled server that the users are assigned to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

/**
 <p>Returns the user accounts and their properties for the <code>ServerId</code> value that you specify.</p>
 */
@property (nonatomic, strong) NSArray<AWSTransferListedUser *> * _Nullable users;

@end

/**
 <p>Returns properties of a file transfer protocol-enabled server that was specified.</p>
 Required parameters: [Arn]
 */
@interface AWSTransferListedServer : AWSModel


/**
 <p>Specifies the unique Amazon Resource Name (ARN) for a file transfer protocol-enabled server to be listed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Specifies the type of VPC endpoint that your file transfer protocol-enabled server is connected to. If your server is connected to a VPC endpoint, your server isn't accessible over the public internet.</p>
 */
@property (nonatomic, assign) AWSTransferEndpointType endpointType;

/**
 <p>Specifies the authentication method used to validate a user for a file transfer protocol-enabled server that was specified. This can include Secure Shell (SSH), user name and password combinations, or your own custom authentication method. Valid values include <code>SERVICE_MANAGED</code> or <code>API_GATEWAY</code>.</p>
 */
@property (nonatomic, assign) AWSTransferIdentityProviderType identityProviderType;

/**
 <p>Specifies the AWS Identity and Access Management (IAM) role that allows a file transfer protocol-enabled server to turn on Amazon CloudWatch logging.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loggingRole;

/**
 <p>Specifies the unique system assigned identifier for a file transfer protocol-enabled servers that were listed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

/**
 <p>Specifies the condition of a file transfer protocol-enabled server for the server that was described. A value of <code>ONLINE</code> indicates that the server can accept jobs and transfer files. A <code>State</code> value of <code>OFFLINE</code> means that the server cannot perform file transfer operations.</p><p>The states of <code>STARTING</code> and <code>STOPPING</code> indicate that the server is in an intermediate state, either not fully able to respond, or not fully offline. The values of <code>START_FAILED</code> or <code>STOP_FAILED</code> can indicate an error condition.</p>
 */
@property (nonatomic, assign) AWSTransferState state;

/**
 <p>Specifies the number of users that are assigned to a file transfer protocol-enabled server you specified with the <code>ServerId</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable userCount;

@end

/**
 <p>Returns properties of the user that you specify.</p>
 Required parameters: [Arn]
 */
@interface AWSTransferListedUser : AWSModel


/**
 <p>Provides the unique Amazon Resource Name (ARN) for the user that you want to learn about.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Specifies the location that files are written to or read from an Amazon S3 bucket for the user you specify by their ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable homeDirectory;

/**
 <p>Specifies the type of landing directory (folder) you mapped for your users' home directory. If you set it to <code>PATH</code>, the user will see the absolute Amazon S3 bucket paths as is in their file transfer protocol clients. If you set it <code>LOGICAL</code>, you will need to provide mappings in the <code>HomeDirectoryMappings</code> for how you want to make Amazon S3 paths visible to your users.</p>
 */
@property (nonatomic, assign) AWSTransferHomeDirectoryType homeDirectoryType;

/**
 <p>Specifies the role that is in use by this user. A <i>role</i> is an AWS Identity and Access Management (IAM) entity that, in this case, allows a file transfer protocol-enabled server to act on a user's behalf. It allows the server to inherit the trust relationship that enables that user to perform file operations to their Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>Specifies the number of SSH public keys stored for the user you specified.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sshPublicKeyCount;

/**
 <p>Specifies the name of the user whose ARN was specified. User names are used for authentication purposes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Provides information about the public Secure Shell (SSH) key that is associated with a user account for the specific file transfer protocol-enabled server (as identified by <code>ServerId</code>). The information returned includes the date the key was imported, the public key contents, and the public key ID. A user can store more than one SSH public key associated with their user name on a specific server.</p>
 Required parameters: [DateImported, SshPublicKeyBody, SshPublicKeyId]
 */
@interface AWSTransferSshPublicKey : AWSModel


/**
 <p>Specifies the date that the public key was added to the user account.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dateImported;

/**
 <p>Specifies the content of the SSH public key as specified by the <code>PublicKeyId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sshPublicKeyBody;

/**
 <p>Specifies the <code>SshPublicKeyId</code> parameter contains the identifier of the public key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sshPublicKeyId;

@end

/**
 
 */
@interface AWSTransferStartServerRequest : AWSRequest


/**
 <p>A system-assigned unique identifier for a file transfer protocol-enabled server that you start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

@end

/**
 
 */
@interface AWSTransferStopServerRequest : AWSRequest


/**
 <p>A system-assigned unique identifier for a file transfer protocol-enabled server that you stopped.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

@end

/**
 <p>Creates a key-value pair for a specific resource. Tags are metadata that you can use to search for and group a resource for various purposes. You can apply tags to servers, users, and roles. A tag key can take more than one value. For example, to group servers for accounting purposes, you might create a tag called <code>Group</code> and assign the values <code>Research</code> and <code>Accounting</code> to that group.</p>
 Required parameters: [Key, Value]
 */
@interface AWSTransferTag : AWSModel


/**
 <p>The name assigned to the tag that you create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Contains one or more values that you assigned to the key name you create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSTransferTagResourceRequest : AWSRequest


/**
 <p>An Amazon Resource Name (ARN) for a specific AWS resource, such as a server, user, or role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Key-value pairs assigned to ARNs that you can use to group and search for resources by type. You can attach this metadata to user accounts for any purpose.</p>
 */
@property (nonatomic, strong) NSArray<AWSTransferTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSTransferTestIdentityProviderRequest : AWSRequest


/**
 <p>A system-assigned identifier for a specific file transfer protocol-enabled server. That server's user authentication method is tested with a user name and password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

/**
 <p>The type of file transfer protocol to be tested.</p><p>The available protocols are:</p><ul><li><p>Secure Shell (SSH) File Transfer Protocol (SFTP)</p></li><li><p>File Transfer Protocol Secure (FTPS)</p></li><li><p>File Transfer Protocol (FTP)</p></li></ul>
 */
@property (nonatomic, assign) AWSTransferProtocols serverProtocol;

/**
 <p>The source IP address of the user account to be tested.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIp;

/**
 <p>The name of the user account to be tested.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

/**
 <p>The password of the user account to be tested.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPassword;

@end

/**
 
 */
@interface AWSTransferTestIdentityProviderResponse : AWSModel


/**
 <p>A message that indicates whether the test was successful or not.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The response that is returned from your API Gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable response;

/**
 <p>The HTTP status code that is the response from your API Gateway.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable statusCode;

/**
 <p>The endpoint of the service used to authenticate a user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 
 */
@interface AWSTransferUntagResourceRequest : AWSRequest


/**
 <p>The value of the resource that will have the tag removed. An Amazon Resource Name (ARN) is an identifier for a specific AWS resource, such as a server, user, or role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>TagKeys are key-value pairs assigned to ARNs that can be used to group and search for resources by type. This metadata can be attached to resources for any purpose.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSTransferUpdateServerRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the AWS Certificate Manager (ACM) certificate. Required when <code>Protocols</code> is set to <code>FTPS</code>.</p><p>To request a new public certificate, see <a href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html">Request a public certificate</a> in the <i> AWS Certificate Manager User Guide</i>.</p><p>To import an existing certificate into ACM, see <a href="https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html">Importing certificates into ACM</a> in the <i> AWS Certificate Manager User Guide</i>.</p><p>To request a private certificate to use FTPS through private IP addresses, see <a href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-private.html">Request a private certificate</a> in the <i> AWS Certificate Manager User Guide</i>.</p><p>Certificates with the following cryptographic algorithms and key sizes are supported:</p><ul><li><p>2048-bit RSA (RSA_2048)</p></li><li><p>4096-bit RSA (RSA_4096)</p></li><li><p>Elliptic Prime Curve 256 bit (EC_prime256v1)</p></li><li><p>Elliptic Prime Curve 384 bit (EC_secp384r1)</p></li><li><p>Elliptic Prime Curve 521 bit (EC_secp521r1)</p></li></ul><note><p>The certificate must be a valid SSL/TLS X.509 version 3 certificate with FQDN or IP address specified and information about the issuer.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 <p>The virtual private cloud (VPC) endpoint settings that are configured for your file transfer protocol-enabled server. With a VPC endpoint, you can restrict access to your server to resources only within your VPC. To control incoming internet traffic, you will need to associate one or more Elastic IP addresses with your server's endpoint.</p>
 */
@property (nonatomic, strong) AWSTransferEndpointDetails * _Nullable endpointDetails;

/**
 <p>The type of endpoint that you want your file transfer protocol-enabled server to connect to. You can choose to connect to the public internet or a VPC endpoint. With a VPC endpoint, you can restrict access to your server and resources only within your VPC.</p><note><p>It is recommended that you use <code>VPC</code> as the <code>EndpointType</code>. With this endpoint type, you have the option to directly associate up to three Elastic IPv4 addresses (BYO IP included) with your server's endpoint and use VPC security groups to restrict traffic by the client's public IP address. This is not possible with <code>EndpointType</code> set to <code>VPC_ENDPOINT</code>.</p></note>
 */
@property (nonatomic, assign) AWSTransferEndpointType endpointType;

/**
 <p>The RSA private key as generated by <code>ssh-keygen -N "" -m PEM -f my-new-server-key</code>.</p><important><p>If you aren't planning to migrate existing users from an existing file transfer protocol-enabled server to a new server, don't update the host key. Accidentally changing a server's host key can be disruptive.</p></important><p>For more information, see <a href="https://docs.aws.amazon.com/transfer/latest/userguide/edit-server-config.html#configuring-servers-change-host-key">Change the host key for your SFTP-enabled server</a> in the <i>AWS Transfer Family User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostKey;

/**
 <p>An array containing all of the information required to call a customer's authentication API method.</p>
 */
@property (nonatomic, strong) AWSTransferIdentityProviderDetails * _Nullable identityProviderDetails;

/**
 <p>Changes the AWS Identity and Access Management (IAM) role that allows Amazon S3 events to be logged in Amazon CloudWatch, turning logging on or off.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loggingRole;

/**
 <p>Specifies the file transfer protocol or protocols over which your file transfer protocol client can connect to your server's endpoint. The available protocols are:</p><ul><li><p>Secure Shell (SSH) File Transfer Protocol (SFTP): File transfer over SSH</p></li><li><p>File Transfer Protocol Secure (FTPS): File transfer with TLS encryption</p></li><li><p>File Transfer Protocol (FTP): Unencrypted file transfer</p></li></ul><note><p>If you select <code>FTPS</code>, you must choose a certificate stored in AWS Certificate Manager (ACM) which will be used to identify your server when clients connect to it over FTPS.</p><p>If <code>Protocol</code> includes either <code>FTP</code> or <code>FTPS</code>, then the <code>EndpointType</code> must be <code>VPC</code> and the <code>IdentityProviderType</code> must be <code>API_GATEWAY</code>.</p><p>If <code>Protocol</code> includes <code>FTP</code>, then <code>AddressAllocationIds</code> cannot be associated.</p><p>If <code>Protocol</code> is set only to <code>SFTP</code>, the <code>EndpointType</code> can be set to <code>PUBLIC</code> and the <code>IdentityProviderType</code> can be set to <code>SERVICE_MANAGED</code>.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable protocols;

/**
 <p>A system-assigned unique identifier for a file transfer protocol-enabled server instance that the user account is assigned to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

@end

/**
 
 */
@interface AWSTransferUpdateServerResponse : AWSModel


/**
 <p>A system-assigned unique identifier for a file transfer protocol-enabled server that the user account is assigned to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

@end

/**
 
 */
@interface AWSTransferUpdateUserRequest : AWSRequest


/**
 <p>Specifies the landing directory (folder) for a user when they log in to the file transfer protocol-enabled server using their file transfer protocol client.</p><p>An example is <code>your-Amazon-S3-bucket-name&gt;/home/username</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable homeDirectory;

/**
 <p>Logical directory mappings that specify what Amazon S3 paths and keys should be visible to your user and how you want to make them visible. You will need to specify the "<code>Entry</code>" and "<code>Target</code>" pair, where <code>Entry</code> shows how the path is made visible and <code>Target</code> is the actual Amazon S3 path. If you only specify a target, it will be displayed as is. You will need to also make sure that your IAM role provides access to paths in <code>Target</code>. The following is an example.</p><p><code>'[ "/bucket2/documentation", { "Entry": "your-personal-report.pdf", "Target": "/bucket3/customized-reports/${transfer:UserName}.pdf" } ]'</code></p><p>In most cases, you can use this value instead of the scope-down policy to lock your user down to the designated home directory ("chroot"). To do this, you can set <code>Entry</code> to '/' and set <code>Target</code> to the HomeDirectory parameter value.</p><note><p>If the target of a logical directory entry does not exist in Amazon S3, the entry will be ignored. As a workaround, you can use the Amazon S3 api to create 0 byte objects as place holders for your directory. If using the CLI, use the <code>s3api</code> call instead of <code>s3</code> so you can use the put-object operation. For example, you use the following: <code>aws s3api put-object --bucket bucketname --key path/to/folder/</code>. Make sure that the end of the key name ends in a / for it to be considered a folder.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSTransferHomeDirectoryMapEntry *> * _Nullable homeDirectoryMappings;

/**
 <p>The type of landing directory (folder) you want your users' home directory to be when they log into the file transfer protocol-enabled server. If you set it to <code>PATH</code>, the user will see the absolute Amazon S3 bucket paths as is in their file transfer protocol clients. If you set it <code>LOGICAL</code>, you will need to provide mappings in the <code>HomeDirectoryMappings</code> for how you want to make Amazon S3 paths visible to your users.</p>
 */
@property (nonatomic, assign) AWSTransferHomeDirectoryType homeDirectoryType;

/**
 <p>Allows you to supply a scope-down policy for your user so you can use the same IAM role across multiple users. The policy scopes down user access to portions of your Amazon S3 bucket. Variables you can use inside this policy include <code>${Transfer:UserName}</code>, <code>${Transfer:HomeDirectory}</code>, and <code>${Transfer:HomeBucket}</code>.</p><note><p>For scope-down policies, AWS Transfer Family stores the policy as a JSON blob, instead of the Amazon Resource Name (ARN) of the policy. You save the policy as a JSON blob and pass it in the <code>Policy</code> argument.</p><p>For an example of a scope-down policy, see <a href="https://docs.aws.amazon.com/transfer/latest/userguide/users.html#users-policies-scope-down">Creating a scope-down policy</a>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html">AssumeRole</a> in the <i>AWS Security Token Service API Reference</i>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The IAM role that controls your users' access to your Amazon S3 bucket. The policies attached to this role will determine the level of access you want to provide your users when transferring files into and out of your Amazon S3 bucket or buckets. The IAM role should also contain a trust relationship that allows the file transfer protocol-enabled server to access your resources when servicing your users' transfer requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>A system-assigned unique identifier for a file transfer protocol-enabled server instance that the user account is assigned to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

/**
 <p>A unique string that identifies a user and is associated with a file transfer protocol-enabled server as specified by the <code>ServerId</code>. This is the string that will be used by your user when they log in to your server. This user name is a minimum of 3 and a maximum of 32 characters long. The following are valid characters: a-z, A-Z, 0-9, underscore, and hyphen. The user name can't start with a hyphen.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p><code>UpdateUserResponse</code> returns the user name and file transfer protocol-enabled server identifier for the request to update a user's properties.</p>
 Required parameters: [ServerId, UserName]
 */
@interface AWSTransferUpdateUserResponse : AWSModel


/**
 <p>A system-assigned unique identifier for a file transfer protocol-enabled server instance that the user account is assigned to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverId;

/**
 <p>The unique identifier for a user that is assigned to a file transfer protocol-enabled server instance that was specified in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

NS_ASSUME_NONNULL_END
