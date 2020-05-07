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

#import "AWSLightsailResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSLightsailResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSLightsailResources

+ (instancetype)sharedInstance {
    static AWSLightsailResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSLightsailResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2016-11-28\",\
    \"endpointPrefix\":\"lightsail\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Lightsail\",\
    \"serviceId\":\"Lightsail\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"Lightsail_20161128\",\
    \"uid\":\"lightsail-2016-11-28\"\
  },\
  \"operations\":{\
    \"AllocateStaticIp\":{\
      \"name\":\"AllocateStaticIp\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AllocateStaticIpRequest\"},\
      \"output\":{\"shape\":\"AllocateStaticIpResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Allocates a static IP address.</p>\"\
    },\
    \"AttachDisk\":{\
      \"name\":\"AttachDisk\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AttachDiskRequest\"},\
      \"output\":{\"shape\":\"AttachDiskResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Attaches a block storage disk to a running or stopped Lightsail instance and exposes it to the instance with the specified disk name.</p> <p>The <code>attach disk</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>disk name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"AttachInstancesToLoadBalancer\":{\
      \"name\":\"AttachInstancesToLoadBalancer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AttachInstancesToLoadBalancerRequest\"},\
      \"output\":{\"shape\":\"AttachInstancesToLoadBalancerResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Attaches one or more Lightsail instances to a load balancer.</p> <p>After some time, the instances are attached to the load balancer and the health check status is available.</p> <p>The <code>attach instances to load balancer</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"AttachLoadBalancerTlsCertificate\":{\
      \"name\":\"AttachLoadBalancerTlsCertificate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AttachLoadBalancerTlsCertificateRequest\"},\
      \"output\":{\"shape\":\"AttachLoadBalancerTlsCertificateResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Attaches a Transport Layer Security (TLS) certificate to your load balancer. TLS is just an updated, more secure version of Secure Socket Layer (SSL).</p> <p>Once you create and validate your certificate, you can attach it to your load balancer. You can also use this API to rotate the certificates on your account. Use the <code>AttachLoadBalancerTlsCertificate</code> action with the non-attached certificate, and it will replace the existing one and become the attached certificate.</p> <p>The <code>AttachLoadBalancerTlsCertificate</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"AttachStaticIp\":{\
      \"name\":\"AttachStaticIp\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AttachStaticIpRequest\"},\
      \"output\":{\"shape\":\"AttachStaticIpResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Attaches a static IP address to a specific Amazon Lightsail instance.</p>\"\
    },\
    \"CloseInstancePublicPorts\":{\
      \"name\":\"CloseInstancePublicPorts\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CloseInstancePublicPortsRequest\"},\
      \"output\":{\"shape\":\"CloseInstancePublicPortsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Closes ports for a specific Amazon Lightsail instance.</p> <p>The <code>CloseInstancePublicPorts</code> action supports tag-based access control via resource tags applied to the resource identified by <code>instanceName</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"CopySnapshot\":{\
      \"name\":\"CopySnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CopySnapshotRequest\"},\
      \"output\":{\"shape\":\"CopySnapshotResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Copies a manual snapshot of an instance or disk as another manual snapshot, or copies an automatic snapshot of an instance or disk as a manual snapshot. This operation can also be used to copy a manual or automatic snapshot of an instance or a disk from one AWS Region to another in Amazon Lightsail.</p> <p>When copying a <i>manual snapshot</i>, be sure to define the <code>source region</code>, <code>source snapshot name</code>, and <code>target snapshot name</code> parameters.</p> <p>When copying an <i>automatic snapshot</i>, be sure to define the <code>source region</code>, <code>source resource name</code>, <code>target snapshot name</code>, and either the <code>restore date</code> or the <code>use latest restorable auto snapshot</code> parameters.</p>\"\
    },\
    \"CreateCloudFormationStack\":{\
      \"name\":\"CreateCloudFormationStack\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateCloudFormationStackRequest\"},\
      \"output\":{\"shape\":\"CreateCloudFormationStackResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Creates an AWS CloudFormation stack, which creates a new Amazon EC2 instance from an exported Amazon Lightsail snapshot. This operation results in a CloudFormation stack record that can be used to track the AWS CloudFormation stack created. Use the <code>get cloud formation stack records</code> operation to get a list of the CloudFormation stacks created.</p> <important> <p>Wait until after your new Amazon EC2 instance is created before running the <code>create cloud formation stack</code> operation again with the same export snapshot record.</p> </important>\"\
    },\
    \"CreateContactMethod\":{\
      \"name\":\"CreateContactMethod\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateContactMethodRequest\"},\
      \"output\":{\"shape\":\"CreateContactMethodResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Creates an email or SMS text message contact method.</p> <p>A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each AWS Region. However, SMS text messaging is not supported in some AWS Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications\\\">Notifications in Amazon Lightsail</a>.</p>\"\
    },\
    \"CreateDisk\":{\
      \"name\":\"CreateDisk\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateDiskRequest\"},\
      \"output\":{\"shape\":\"CreateDiskResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Creates a block storage disk that can be attached to an Amazon Lightsail instance in the same Availability Zone (e.g., <code>us-east-2a</code>).</p> <p>The <code>create disk</code> operation supports tag-based access control via request tags. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"CreateDiskFromSnapshot\":{\
      \"name\":\"CreateDiskFromSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateDiskFromSnapshotRequest\"},\
      \"output\":{\"shape\":\"CreateDiskFromSnapshotResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Creates a block storage disk from a manual or automatic snapshot of a disk. The resulting disk can be attached to an Amazon Lightsail instance in the same Availability Zone (e.g., <code>us-east-2a</code>).</p> <p>The <code>create disk from snapshot</code> operation supports tag-based access control via request tags and resource tags applied to the resource identified by <code>disk snapshot name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"CreateDiskSnapshot\":{\
      \"name\":\"CreateDiskSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateDiskSnapshotRequest\"},\
      \"output\":{\"shape\":\"CreateDiskSnapshotResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Creates a snapshot of a block storage disk. You can use snapshots for backups, to make copies of disks, and to save data before shutting down a Lightsail instance.</p> <p>You can take a snapshot of an attached disk that is in use; however, snapshots only capture data that has been written to your disk at the time the snapshot command is issued. This may exclude any data that has been cached by any applications or the operating system. If you can pause any file systems on the disk long enough to take a snapshot, your snapshot should be complete. Nevertheless, if you cannot pause all file writes to the disk, you should unmount the disk from within the Lightsail instance, issue the create disk snapshot command, and then remount the disk to ensure a consistent and complete snapshot. You may remount and use your disk while the snapshot status is pending.</p> <p>You can also use this operation to create a snapshot of an instance's system volume. You might want to do this, for example, to recover data from the system volume of a botched instance or to create a backup of the system volume like you would for a block storage disk. To create a snapshot of a system volume, just define the <code>instance name</code> parameter when issuing the snapshot command, and a snapshot of the defined instance's system volume will be created. After the snapshot is available, you can create a block storage disk from the snapshot and attach it to a running instance to access the data on the disk.</p> <p>The <code>create disk snapshot</code> operation supports tag-based access control via request tags. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"CreateDomain\":{\
      \"name\":\"CreateDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateDomainRequest\"},\
      \"output\":{\"shape\":\"CreateDomainResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Creates a domain resource for the specified domain (e.g., example.com).</p> <p>The <code>create domain</code> operation supports tag-based access control via request tags. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"CreateDomainEntry\":{\
      \"name\":\"CreateDomainEntry\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateDomainEntryRequest\"},\
      \"output\":{\"shape\":\"CreateDomainEntryResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Creates one of the following entry records associated with the domain: Address (A), canonical name (CNAME), mail exchanger (MX), name server (NS), start of authority (SOA), service locator (SRV), or text (TXT).</p> <p>The <code>create domain entry</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>domain name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"CreateInstanceSnapshot\":{\
      \"name\":\"CreateInstanceSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateInstanceSnapshotRequest\"},\
      \"output\":{\"shape\":\"CreateInstanceSnapshotResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Creates a snapshot of a specific virtual private server, or <i>instance</i>. You can use a snapshot to create a new instance that is based on that snapshot.</p> <p>The <code>create instance snapshot</code> operation supports tag-based access control via request tags. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"CreateInstances\":{\
      \"name\":\"CreateInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateInstancesRequest\"},\
      \"output\":{\"shape\":\"CreateInstancesResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Creates one or more Amazon Lightsail instances.</p> <p>The <code>create instances</code> operation supports tag-based access control via request tags. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"CreateInstancesFromSnapshot\":{\
      \"name\":\"CreateInstancesFromSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateInstancesFromSnapshotRequest\"},\
      \"output\":{\"shape\":\"CreateInstancesFromSnapshotResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Creates one or more new instances from a manual or automatic snapshot of an instance.</p> <p>The <code>create instances from snapshot</code> operation supports tag-based access control via request tags and resource tags applied to the resource identified by <code>instance snapshot name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"CreateKeyPair\":{\
      \"name\":\"CreateKeyPair\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateKeyPairRequest\"},\
      \"output\":{\"shape\":\"CreateKeyPairResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Creates an SSH key pair.</p> <p>The <code>create key pair</code> operation supports tag-based access control via request tags. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"CreateLoadBalancer\":{\
      \"name\":\"CreateLoadBalancer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLoadBalancerRequest\"},\
      \"output\":{\"shape\":\"CreateLoadBalancerResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Creates a Lightsail load balancer. To learn more about deciding whether to load balance your application, see <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/how-to/article/configure-lightsail-instances-for-load-balancing\\\">Configure your Lightsail instances for load balancing</a>. You can create up to 5 load balancers per AWS Region in your account.</p> <p>When you create a load balancer, you can specify a unique name and port settings. To change additional load balancer settings, use the <code>UpdateLoadBalancerAttribute</code> operation.</p> <p>The <code>create load balancer</code> operation supports tag-based access control via request tags. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"CreateLoadBalancerTlsCertificate\":{\
      \"name\":\"CreateLoadBalancerTlsCertificate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLoadBalancerTlsCertificateRequest\"},\
      \"output\":{\"shape\":\"CreateLoadBalancerTlsCertificateResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Creates a Lightsail load balancer TLS certificate.</p> <p>TLS is just an updated, more secure version of Secure Socket Layer (SSL).</p> <p>The <code>CreateLoadBalancerTlsCertificate</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"CreateRelationalDatabase\":{\
      \"name\":\"CreateRelationalDatabase\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateRelationalDatabaseRequest\"},\
      \"output\":{\"shape\":\"CreateRelationalDatabaseResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Creates a new database in Amazon Lightsail.</p> <p>The <code>create relational database</code> operation supports tag-based access control via request tags. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"CreateRelationalDatabaseFromSnapshot\":{\
      \"name\":\"CreateRelationalDatabaseFromSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateRelationalDatabaseFromSnapshotRequest\"},\
      \"output\":{\"shape\":\"CreateRelationalDatabaseFromSnapshotResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Creates a new database from an existing database snapshot in Amazon Lightsail.</p> <p>You can create a new database from a snapshot in if something goes wrong with your original database, or to change it to a different plan, such as a high availability or standard plan.</p> <p>The <code>create relational database from snapshot</code> operation supports tag-based access control via request tags and resource tags applied to the resource identified by relationalDatabaseSnapshotName. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"CreateRelationalDatabaseSnapshot\":{\
      \"name\":\"CreateRelationalDatabaseSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateRelationalDatabaseSnapshotRequest\"},\
      \"output\":{\"shape\":\"CreateRelationalDatabaseSnapshotResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Creates a snapshot of your database in Amazon Lightsail. You can use snapshots for backups, to make copies of a database, and to save data before deleting a database.</p> <p>The <code>create relational database snapshot</code> operation supports tag-based access control via request tags. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"DeleteAlarm\":{\
      \"name\":\"DeleteAlarm\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteAlarmRequest\"},\
      \"output\":{\"shape\":\"DeleteAlarmResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"UnauthenticatedException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes an alarm.</p> <p>An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms\\\">Alarms in Amazon Lightsail</a>.</p>\"\
    },\
    \"DeleteAutoSnapshot\":{\
      \"name\":\"DeleteAutoSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteAutoSnapshotRequest\"},\
      \"output\":{\"shape\":\"DeleteAutoSnapshotResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Deletes an automatic snapshot of an instance or disk. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"DeleteContactMethod\":{\
      \"name\":\"DeleteContactMethod\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteContactMethodRequest\"},\
      \"output\":{\"shape\":\"DeleteContactMethodResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"UnauthenticatedException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes a contact method.</p> <p>A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each AWS Region. However, SMS text messaging is not supported in some AWS Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications\\\">Notifications in Amazon Lightsail</a>.</p>\"\
    },\
    \"DeleteDisk\":{\
      \"name\":\"DeleteDisk\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDiskRequest\"},\
      \"output\":{\"shape\":\"DeleteDiskResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified block storage disk. The disk must be in the <code>available</code> state (not attached to a Lightsail instance).</p> <note> <p>The disk may remain in the <code>deleting</code> state for several minutes.</p> </note> <p>The <code>delete disk</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>disk name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"DeleteDiskSnapshot\":{\
      \"name\":\"DeleteDiskSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDiskSnapshotRequest\"},\
      \"output\":{\"shape\":\"DeleteDiskSnapshotResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified disk snapshot.</p> <p>When you make periodic snapshots of a disk, the snapshots are incremental, and only the blocks on the device that have changed since your last snapshot are saved in the new snapshot. When you delete a snapshot, only the data not needed for any other snapshot is removed. So regardless of which prior snapshots have been deleted, all active snapshots will have access to all the information needed to restore the disk.</p> <p>The <code>delete disk snapshot</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>disk snapshot name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"DeleteDomain\":{\
      \"name\":\"DeleteDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDomainRequest\"},\
      \"output\":{\"shape\":\"DeleteDomainResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified domain recordset and all of its domain records.</p> <p>The <code>delete domain</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>domain name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"DeleteDomainEntry\":{\
      \"name\":\"DeleteDomainEntry\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDomainEntryRequest\"},\
      \"output\":{\"shape\":\"DeleteDomainEntryResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Deletes a specific domain entry.</p> <p>The <code>delete domain entry</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>domain name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"DeleteInstance\":{\
      \"name\":\"DeleteInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteInstanceRequest\"},\
      \"output\":{\"shape\":\"DeleteInstanceResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Deletes an Amazon Lightsail instance.</p> <p>The <code>delete instance</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"DeleteInstanceSnapshot\":{\
      \"name\":\"DeleteInstanceSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteInstanceSnapshotRequest\"},\
      \"output\":{\"shape\":\"DeleteInstanceSnapshotResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Deletes a specific snapshot of a virtual private server (or <i>instance</i>).</p> <p>The <code>delete instance snapshot</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance snapshot name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"DeleteKeyPair\":{\
      \"name\":\"DeleteKeyPair\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteKeyPairRequest\"},\
      \"output\":{\"shape\":\"DeleteKeyPairResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Deletes a specific SSH key pair.</p> <p>The <code>delete key pair</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>key pair name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"DeleteKnownHostKeys\":{\
      \"name\":\"DeleteKnownHostKeys\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteKnownHostKeysRequest\"},\
      \"output\":{\"shape\":\"DeleteKnownHostKeysResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Deletes the known host key or certificate used by the Amazon Lightsail browser-based SSH or RDP clients to authenticate an instance. This operation enables the Lightsail browser-based SSH or RDP clients to connect to the instance after a host key mismatch.</p> <important> <p>Perform this operation only if you were expecting the host key or certificate mismatch or if you are familiar with the new host key or certificate on the instance. For more information, see <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-troubleshooting-browser-based-ssh-rdp-client-connection\\\">Troubleshooting connection issues when using the Amazon Lightsail browser-based SSH or RDP client</a>.</p> </important>\"\
    },\
    \"DeleteLoadBalancer\":{\
      \"name\":\"DeleteLoadBalancer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteLoadBalancerRequest\"},\
      \"output\":{\"shape\":\"DeleteLoadBalancerResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Deletes a Lightsail load balancer and all its associated SSL/TLS certificates. Once the load balancer is deleted, you will need to create a new load balancer, create a new certificate, and verify domain ownership again.</p> <p>The <code>delete load balancer</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"DeleteLoadBalancerTlsCertificate\":{\
      \"name\":\"DeleteLoadBalancerTlsCertificate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteLoadBalancerTlsCertificateRequest\"},\
      \"output\":{\"shape\":\"DeleteLoadBalancerTlsCertificateResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Deletes an SSL/TLS certificate associated with a Lightsail load balancer.</p> <p>The <code>DeleteLoadBalancerTlsCertificate</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"DeleteRelationalDatabase\":{\
      \"name\":\"DeleteRelationalDatabase\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteRelationalDatabaseRequest\"},\
      \"output\":{\"shape\":\"DeleteRelationalDatabaseResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Deletes a database in Amazon Lightsail.</p> <p>The <code>delete relational database</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"DeleteRelationalDatabaseSnapshot\":{\
      \"name\":\"DeleteRelationalDatabaseSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteRelationalDatabaseSnapshotRequest\"},\
      \"output\":{\"shape\":\"DeleteRelationalDatabaseSnapshotResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Deletes a database snapshot in Amazon Lightsail.</p> <p>The <code>delete relational database snapshot</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"DetachDisk\":{\
      \"name\":\"DetachDisk\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetachDiskRequest\"},\
      \"output\":{\"shape\":\"DetachDiskResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Detaches a stopped block storage disk from a Lightsail instance. Make sure to unmount any file systems on the device within your operating system before stopping the instance and detaching the disk.</p> <p>The <code>detach disk</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>disk name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"DetachInstancesFromLoadBalancer\":{\
      \"name\":\"DetachInstancesFromLoadBalancer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetachInstancesFromLoadBalancerRequest\"},\
      \"output\":{\"shape\":\"DetachInstancesFromLoadBalancerResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Detaches the specified instances from a Lightsail load balancer.</p> <p>This operation waits until the instances are no longer needed before they are detached from the load balancer.</p> <p>The <code>detach instances from load balancer</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"DetachStaticIp\":{\
      \"name\":\"DetachStaticIp\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetachStaticIpRequest\"},\
      \"output\":{\"shape\":\"DetachStaticIpResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Detaches a static IP from the Amazon Lightsail instance to which it is attached.</p>\"\
    },\
    \"DisableAddOn\":{\
      \"name\":\"DisableAddOn\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisableAddOnRequest\"},\
      \"output\":{\"shape\":\"DisableAddOnResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Disables an add-on for an Amazon Lightsail resource. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"DownloadDefaultKeyPair\":{\
      \"name\":\"DownloadDefaultKeyPair\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DownloadDefaultKeyPairRequest\"},\
      \"output\":{\"shape\":\"DownloadDefaultKeyPairResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Downloads the default SSH key pair from the user's account.</p>\"\
    },\
    \"EnableAddOn\":{\
      \"name\":\"EnableAddOn\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"EnableAddOnRequest\"},\
      \"output\":{\"shape\":\"EnableAddOnResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Enables or modifies an add-on for an Amazon Lightsail resource. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"ExportSnapshot\":{\
      \"name\":\"ExportSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ExportSnapshotRequest\"},\
      \"output\":{\"shape\":\"ExportSnapshotResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Exports an Amazon Lightsail instance or block storage disk snapshot to Amazon Elastic Compute Cloud (Amazon EC2). This operation results in an export snapshot record that can be used with the <code>create cloud formation stack</code> operation to create new Amazon EC2 instances.</p> <p>Exported instance snapshots appear in Amazon EC2 as Amazon Machine Images (AMIs), and the instance system disk appears as an Amazon Elastic Block Store (Amazon EBS) volume. Exported disk snapshots appear in Amazon EC2 as Amazon EBS volumes. Snapshots are exported to the same Amazon Web Services Region in Amazon EC2 as the source Lightsail snapshot.</p> <p/> <p>The <code>export snapshot</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>source snapshot name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p> <note> <p>Use the <code>get instance snapshots</code> or <code>get disk snapshots</code> operations to get a list of snapshots that you can export to Amazon EC2.</p> </note>\"\
    },\
    \"GetActiveNames\":{\
      \"name\":\"GetActiveNames\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetActiveNamesRequest\"},\
      \"output\":{\"shape\":\"GetActiveNamesResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns the names of all active (not deleted) resources.</p>\"\
    },\
    \"GetAlarms\":{\
      \"name\":\"GetAlarms\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetAlarmsRequest\"},\
      \"output\":{\"shape\":\"GetAlarmsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"UnauthenticatedException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns information about the configured alarms. Specify an alarm name in your request to return information about a specific alarm, or specify a monitored resource name to return information about all alarms for a specific resource.</p> <p>An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms\\\">Alarms in Amazon Lightsail</a>.</p>\"\
    },\
    \"GetAutoSnapshots\":{\
      \"name\":\"GetAutoSnapshots\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetAutoSnapshotsRequest\"},\
      \"output\":{\"shape\":\"GetAutoSnapshotsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns the available automatic snapshots for an instance or disk. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"GetBlueprints\":{\
      \"name\":\"GetBlueprints\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetBlueprintsRequest\"},\
      \"output\":{\"shape\":\"GetBlueprintsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns the list of available instance images, or <i>blueprints</i>. You can use a blueprint to create a new instance already running a specific operating system, as well as a preinstalled app or development stack. The software each instance is running depends on the blueprint image you choose.</p> <note> <p>Use active blueprints when creating new instances. Inactive blueprints are listed to support customers with existing instances and are not necessarily available to create new instances. Blueprints are marked inactive when they become outdated due to operating system updates or new application releases.</p> </note>\"\
    },\
    \"GetBundles\":{\
      \"name\":\"GetBundles\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetBundlesRequest\"},\
      \"output\":{\"shape\":\"GetBundlesResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns the list of bundles that are available for purchase. A bundle describes the specs for your virtual private server (or <i>instance</i>).</p>\"\
    },\
    \"GetCloudFormationStackRecords\":{\
      \"name\":\"GetCloudFormationStackRecords\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetCloudFormationStackRecordsRequest\"},\
      \"output\":{\"shape\":\"GetCloudFormationStackRecordsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns the CloudFormation stack record created as a result of the <code>create cloud formation stack</code> operation.</p> <p>An AWS CloudFormation stack is used to create a new Amazon EC2 instance from an exported Lightsail snapshot.</p>\"\
    },\
    \"GetContactMethods\":{\
      \"name\":\"GetContactMethods\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetContactMethodsRequest\"},\
      \"output\":{\"shape\":\"GetContactMethodsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about the configured contact methods. Specify a protocol in your request to return information about a specific contact method.</p> <p>A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each AWS Region. However, SMS text messaging is not supported in some AWS Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications\\\">Notifications in Amazon Lightsail</a>.</p>\"\
    },\
    \"GetDisk\":{\
      \"name\":\"GetDisk\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDiskRequest\"},\
      \"output\":{\"shape\":\"GetDiskResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a specific block storage disk.</p>\"\
    },\
    \"GetDiskSnapshot\":{\
      \"name\":\"GetDiskSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDiskSnapshotRequest\"},\
      \"output\":{\"shape\":\"GetDiskSnapshotResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a specific block storage disk snapshot.</p>\"\
    },\
    \"GetDiskSnapshots\":{\
      \"name\":\"GetDiskSnapshots\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDiskSnapshotsRequest\"},\
      \"output\":{\"shape\":\"GetDiskSnapshotsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about all block storage disk snapshots in your AWS account and region.</p>\"\
    },\
    \"GetDisks\":{\
      \"name\":\"GetDisks\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDisksRequest\"},\
      \"output\":{\"shape\":\"GetDisksResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about all block storage disks in your AWS account and region.</p>\"\
    },\
    \"GetDomain\":{\
      \"name\":\"GetDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDomainRequest\"},\
      \"output\":{\"shape\":\"GetDomainResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a specific domain recordset.</p>\"\
    },\
    \"GetDomains\":{\
      \"name\":\"GetDomains\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDomainsRequest\"},\
      \"output\":{\"shape\":\"GetDomainsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of all domains in the user's account.</p>\"\
    },\
    \"GetExportSnapshotRecords\":{\
      \"name\":\"GetExportSnapshotRecords\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetExportSnapshotRecordsRequest\"},\
      \"output\":{\"shape\":\"GetExportSnapshotRecordsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns the export snapshot record created as a result of the <code>export snapshot</code> operation.</p> <p>An export snapshot record can be used to create a new Amazon EC2 instance and its related resources with the <code>create cloud formation stack</code> operation.</p>\"\
    },\
    \"GetInstance\":{\
      \"name\":\"GetInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetInstanceRequest\"},\
      \"output\":{\"shape\":\"GetInstanceResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a specific Amazon Lightsail instance, which is a virtual private server.</p>\"\
    },\
    \"GetInstanceAccessDetails\":{\
      \"name\":\"GetInstanceAccessDetails\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetInstanceAccessDetailsRequest\"},\
      \"output\":{\"shape\":\"GetInstanceAccessDetailsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns temporary SSH keys you can use to connect to a specific virtual private server, or <i>instance</i>.</p> <p>The <code>get instance access details</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"GetInstanceMetricData\":{\
      \"name\":\"GetInstanceMetricData\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetInstanceMetricDataRequest\"},\
      \"output\":{\"shape\":\"GetInstanceMetricDataResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns the data points for the specified Amazon Lightsail instance metric, given an instance name.</p>\"\
    },\
    \"GetInstancePortStates\":{\
      \"name\":\"GetInstancePortStates\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetInstancePortStatesRequest\"},\
      \"output\":{\"shape\":\"GetInstancePortStatesResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns the firewall port states for a specific Amazon Lightsail instance, the IP addresses allowed to connect to the instance through the ports, and the protocol.</p>\"\
    },\
    \"GetInstanceSnapshot\":{\
      \"name\":\"GetInstanceSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetInstanceSnapshotRequest\"},\
      \"output\":{\"shape\":\"GetInstanceSnapshotResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a specific instance snapshot.</p>\"\
    },\
    \"GetInstanceSnapshots\":{\
      \"name\":\"GetInstanceSnapshots\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetInstanceSnapshotsRequest\"},\
      \"output\":{\"shape\":\"GetInstanceSnapshotsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns all instance snapshots for the user's account.</p>\"\
    },\
    \"GetInstanceState\":{\
      \"name\":\"GetInstanceState\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetInstanceStateRequest\"},\
      \"output\":{\"shape\":\"GetInstanceStateResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns the state of a specific instance. Works on one instance at a time.</p>\"\
    },\
    \"GetInstances\":{\
      \"name\":\"GetInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetInstancesRequest\"},\
      \"output\":{\"shape\":\"GetInstancesResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about all Amazon Lightsail virtual private servers, or <i>instances</i>.</p>\"\
    },\
    \"GetKeyPair\":{\
      \"name\":\"GetKeyPair\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetKeyPairRequest\"},\
      \"output\":{\"shape\":\"GetKeyPairResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a specific key pair.</p>\"\
    },\
    \"GetKeyPairs\":{\
      \"name\":\"GetKeyPairs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetKeyPairsRequest\"},\
      \"output\":{\"shape\":\"GetKeyPairsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about all key pairs in the user's account.</p>\"\
    },\
    \"GetLoadBalancer\":{\
      \"name\":\"GetLoadBalancer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetLoadBalancerRequest\"},\
      \"output\":{\"shape\":\"GetLoadBalancerResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about the specified Lightsail load balancer.</p>\"\
    },\
    \"GetLoadBalancerMetricData\":{\
      \"name\":\"GetLoadBalancerMetricData\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetLoadBalancerMetricDataRequest\"},\
      \"output\":{\"shape\":\"GetLoadBalancerMetricDataResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about health metrics for your Lightsail load balancer.</p>\"\
    },\
    \"GetLoadBalancerTlsCertificates\":{\
      \"name\":\"GetLoadBalancerTlsCertificates\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetLoadBalancerTlsCertificatesRequest\"},\
      \"output\":{\"shape\":\"GetLoadBalancerTlsCertificatesResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about the TLS certificates that are associated with the specified Lightsail load balancer.</p> <p>TLS is just an updated, more secure version of Secure Socket Layer (SSL).</p> <p>You can have a maximum of 2 certificates associated with a Lightsail load balancer. One is active and the other is inactive.</p>\"\
    },\
    \"GetLoadBalancers\":{\
      \"name\":\"GetLoadBalancers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetLoadBalancersRequest\"},\
      \"output\":{\"shape\":\"GetLoadBalancersResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about all load balancers in an account.</p>\"\
    },\
    \"GetOperation\":{\
      \"name\":\"GetOperation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetOperationRequest\"},\
      \"output\":{\"shape\":\"GetOperationResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a specific operation. Operations include events such as when you create an instance, allocate a static IP, attach a static IP, and so on.</p>\"\
    },\
    \"GetOperations\":{\
      \"name\":\"GetOperations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetOperationsRequest\"},\
      \"output\":{\"shape\":\"GetOperationsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about all operations.</p> <p>Results are returned from oldest to newest, up to a maximum of 200. Results can be paged by making each subsequent call to <code>GetOperations</code> use the maximum (last) <code>statusChangedAt</code> value from the previous request.</p>\"\
    },\
    \"GetOperationsForResource\":{\
      \"name\":\"GetOperationsForResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetOperationsForResourceRequest\"},\
      \"output\":{\"shape\":\"GetOperationsForResourceResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Gets operations for a specific resource (e.g., an instance or a static IP).</p>\"\
    },\
    \"GetRegions\":{\
      \"name\":\"GetRegions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetRegionsRequest\"},\
      \"output\":{\"shape\":\"GetRegionsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of all valid regions for Amazon Lightsail. Use the <code>include availability zones</code> parameter to also return the Availability Zones in a region.</p>\"\
    },\
    \"GetRelationalDatabase\":{\
      \"name\":\"GetRelationalDatabase\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetRelationalDatabaseRequest\"},\
      \"output\":{\"shape\":\"GetRelationalDatabaseResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a specific database in Amazon Lightsail.</p>\"\
    },\
    \"GetRelationalDatabaseBlueprints\":{\
      \"name\":\"GetRelationalDatabaseBlueprints\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetRelationalDatabaseBlueprintsRequest\"},\
      \"output\":{\"shape\":\"GetRelationalDatabaseBlueprintsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of available database blueprints in Amazon Lightsail. A blueprint describes the major engine version of a database.</p> <p>You can use a blueprint ID to create a new database that runs a specific database engine.</p>\"\
    },\
    \"GetRelationalDatabaseBundles\":{\
      \"name\":\"GetRelationalDatabaseBundles\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetRelationalDatabaseBundlesRequest\"},\
      \"output\":{\"shape\":\"GetRelationalDatabaseBundlesResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns the list of bundles that are available in Amazon Lightsail. A bundle describes the performance specifications for a database.</p> <p>You can use a bundle ID to create a new database with explicit performance specifications.</p>\"\
    },\
    \"GetRelationalDatabaseEvents\":{\
      \"name\":\"GetRelationalDatabaseEvents\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetRelationalDatabaseEventsRequest\"},\
      \"output\":{\"shape\":\"GetRelationalDatabaseEventsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of events for a specific database in Amazon Lightsail.</p>\"\
    },\
    \"GetRelationalDatabaseLogEvents\":{\
      \"name\":\"GetRelationalDatabaseLogEvents\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetRelationalDatabaseLogEventsRequest\"},\
      \"output\":{\"shape\":\"GetRelationalDatabaseLogEventsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of log events for a database in Amazon Lightsail.</p>\"\
    },\
    \"GetRelationalDatabaseLogStreams\":{\
      \"name\":\"GetRelationalDatabaseLogStreams\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetRelationalDatabaseLogStreamsRequest\"},\
      \"output\":{\"shape\":\"GetRelationalDatabaseLogStreamsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of available log streams for a specific database in Amazon Lightsail.</p>\"\
    },\
    \"GetRelationalDatabaseMasterUserPassword\":{\
      \"name\":\"GetRelationalDatabaseMasterUserPassword\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetRelationalDatabaseMasterUserPasswordRequest\"},\
      \"output\":{\"shape\":\"GetRelationalDatabaseMasterUserPasswordResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns the current, previous, or pending versions of the master user password for a Lightsail database.</p> <p>The <code>GetRelationalDatabaseMasterUserPassword</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName.</p>\"\
    },\
    \"GetRelationalDatabaseMetricData\":{\
      \"name\":\"GetRelationalDatabaseMetricData\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetRelationalDatabaseMetricDataRequest\"},\
      \"output\":{\"shape\":\"GetRelationalDatabaseMetricDataResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns the data points of the specified metric for a database in Amazon Lightsail.</p>\"\
    },\
    \"GetRelationalDatabaseParameters\":{\
      \"name\":\"GetRelationalDatabaseParameters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetRelationalDatabaseParametersRequest\"},\
      \"output\":{\"shape\":\"GetRelationalDatabaseParametersResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns all of the runtime parameters offered by the underlying database software, or engine, for a specific database in Amazon Lightsail.</p> <p>In addition to the parameter names and values, this operation returns other information about each parameter. This information includes whether changes require a reboot, whether the parameter is modifiable, the allowed values, and the data types.</p>\"\
    },\
    \"GetRelationalDatabaseSnapshot\":{\
      \"name\":\"GetRelationalDatabaseSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetRelationalDatabaseSnapshotRequest\"},\
      \"output\":{\"shape\":\"GetRelationalDatabaseSnapshotResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a specific database snapshot in Amazon Lightsail.</p>\"\
    },\
    \"GetRelationalDatabaseSnapshots\":{\
      \"name\":\"GetRelationalDatabaseSnapshots\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetRelationalDatabaseSnapshotsRequest\"},\
      \"output\":{\"shape\":\"GetRelationalDatabaseSnapshotsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about all of your database snapshots in Amazon Lightsail.</p>\"\
    },\
    \"GetRelationalDatabases\":{\
      \"name\":\"GetRelationalDatabases\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetRelationalDatabasesRequest\"},\
      \"output\":{\"shape\":\"GetRelationalDatabasesResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about all of your databases in Amazon Lightsail.</p>\"\
    },\
    \"GetStaticIp\":{\
      \"name\":\"GetStaticIp\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetStaticIpRequest\"},\
      \"output\":{\"shape\":\"GetStaticIpResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a specific static IP.</p>\"\
    },\
    \"GetStaticIps\":{\
      \"name\":\"GetStaticIps\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetStaticIpsRequest\"},\
      \"output\":{\"shape\":\"GetStaticIpsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns information about all static IPs in the user's account.</p>\"\
    },\
    \"ImportKeyPair\":{\
      \"name\":\"ImportKeyPair\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ImportKeyPairRequest\"},\
      \"output\":{\"shape\":\"ImportKeyPairResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Imports a public SSH key from a specific key pair.</p>\"\
    },\
    \"IsVpcPeered\":{\
      \"name\":\"IsVpcPeered\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"IsVpcPeeredRequest\"},\
      \"output\":{\"shape\":\"IsVpcPeeredResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Returns a Boolean value indicating whether your Lightsail VPC is peered.</p>\"\
    },\
    \"OpenInstancePublicPorts\":{\
      \"name\":\"OpenInstancePublicPorts\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"OpenInstancePublicPortsRequest\"},\
      \"output\":{\"shape\":\"OpenInstancePublicPortsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses allowed to connect to the instance through the ports, and the protocol.</p> <p>The <code>OpenInstancePublicPorts</code> action supports tag-based access control via resource tags applied to the resource identified by <code>instanceName</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"PeerVpc\":{\
      \"name\":\"PeerVpc\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PeerVpcRequest\"},\
      \"output\":{\"shape\":\"PeerVpcResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Tries to peer the Lightsail VPC with the user's default VPC.</p>\"\
    },\
    \"PutAlarm\":{\
      \"name\":\"PutAlarm\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutAlarmRequest\"},\
      \"output\":{\"shape\":\"PutAlarmResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"UnauthenticatedException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates an alarm, and associates it with the specified metric.</p> <p>An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms\\\">Alarms in Amazon Lightsail</a>.</p> <p>When this action creates an alarm, the alarm state is immediately set to <code>INSUFFICIENT_DATA</code>. The alarm is then evaluated and its state is set appropriately. Any actions associated with the new state are then executed.</p> <p>When you update an existing alarm, its state is left unchanged, but the update completely overwrites the previous configuration of the alarm. The alarm is then evaluated with the updated configuration.</p>\"\
    },\
    \"PutInstancePublicPorts\":{\
      \"name\":\"PutInstancePublicPorts\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutInstancePublicPortsRequest\"},\
      \"output\":{\"shape\":\"PutInstancePublicPortsResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses allowed to connect to the instance through the ports, and the protocol. This action also closes all currently open ports that are not included in the request. Include all of the ports and the protocols you want to open in your <code>PutInstancePublicPorts</code>request. Or use the <code>OpenInstancePublicPorts</code> action to open ports without closing currently open ports.</p> <p>The <code>PutInstancePublicPorts</code> action supports tag-based access control via resource tags applied to the resource identified by <code>instanceName</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"RebootInstance\":{\
      \"name\":\"RebootInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RebootInstanceRequest\"},\
      \"output\":{\"shape\":\"RebootInstanceResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Restarts a specific instance.</p> <p>The <code>reboot instance</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"RebootRelationalDatabase\":{\
      \"name\":\"RebootRelationalDatabase\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RebootRelationalDatabaseRequest\"},\
      \"output\":{\"shape\":\"RebootRelationalDatabaseResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Restarts a specific database in Amazon Lightsail.</p> <p>The <code>reboot relational database</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"ReleaseStaticIp\":{\
      \"name\":\"ReleaseStaticIp\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ReleaseStaticIpRequest\"},\
      \"output\":{\"shape\":\"ReleaseStaticIpResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Deletes a specific static IP from your account.</p>\"\
    },\
    \"SendContactMethodVerification\":{\
      \"name\":\"SendContactMethodVerification\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SendContactMethodVerificationRequest\"},\
      \"output\":{\"shape\":\"SendContactMethodVerificationResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"UnauthenticatedException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Sends a verification request to an email contact method to ensure it's owned by the requester. SMS contact methods don't need to be verified.</p> <p>A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each AWS Region. However, SMS text messaging is not supported in some AWS Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications\\\">Notifications in Amazon Lightsail</a>.</p> <p>A verification request is sent to the contact method when you initially create it. Use this action to send another verification request if a previous verification request was deleted, or has expired.</p> <important> <p>Notifications are not sent to an email contact method until after it is verified, and confirmed as valid.</p> </important>\"\
    },\
    \"StartInstance\":{\
      \"name\":\"StartInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartInstanceRequest\"},\
      \"output\":{\"shape\":\"StartInstanceResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Starts a specific Amazon Lightsail instance from a stopped state. To restart an instance, use the <code>reboot instance</code> operation.</p> <note> <p>When you start a stopped instance, Lightsail assigns a new public IP address to the instance. To use the same IP address after stopping and starting an instance, create a static IP address and attach it to the instance. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/lightsail-create-static-ip\\\">Lightsail Dev Guide</a>.</p> </note> <p>The <code>start instance</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"StartRelationalDatabase\":{\
      \"name\":\"StartRelationalDatabase\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartRelationalDatabaseRequest\"},\
      \"output\":{\"shape\":\"StartRelationalDatabaseResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Starts a specific database from a stopped state in Amazon Lightsail. To restart a database, use the <code>reboot relational database</code> operation.</p> <p>The <code>start relational database</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"StopInstance\":{\
      \"name\":\"StopInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopInstanceRequest\"},\
      \"output\":{\"shape\":\"StopInstanceResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Stops a specific Amazon Lightsail instance that is currently running.</p> <note> <p>When you start a stopped instance, Lightsail assigns a new public IP address to the instance. To use the same IP address after stopping and starting an instance, create a static IP address and attach it to the instance. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/lightsail-create-static-ip\\\">Lightsail Dev Guide</a>.</p> </note> <p>The <code>stop instance</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>instance name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"StopRelationalDatabase\":{\
      \"name\":\"StopRelationalDatabase\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopRelationalDatabaseRequest\"},\
      \"output\":{\"shape\":\"StopRelationalDatabaseResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Stops a specific database that is currently running in Amazon Lightsail.</p> <p>The <code>stop relational database</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"output\":{\"shape\":\"TagResourceResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Adds one or more tags to the specified Amazon Lightsail resource. Each resource can have a maximum of 50 tags. Each tag consists of a key and an optional value. Tag keys must be unique per resource. For more information about tags, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags\\\">Lightsail Dev Guide</a>.</p> <p>The <code>tag resource</code> operation supports tag-based access control via request tags and resource tags applied to the resource identified by <code>resource name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"TestAlarm\":{\
      \"name\":\"TestAlarm\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TestAlarmRequest\"},\
      \"output\":{\"shape\":\"TestAlarmResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"UnauthenticatedException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Tests an alarm by displaying a banner on the Amazon Lightsail console. If a notification trigger is configured for the specified alarm, the test also sends a notification to the notification protocol (<code>Email</code> and/or <code>SMS</code>) configured for the alarm.</p> <p>An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms\\\">Alarms in Amazon Lightsail</a>.</p>\"\
    },\
    \"UnpeerVpc\":{\
      \"name\":\"UnpeerVpc\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UnpeerVpcRequest\"},\
      \"output\":{\"shape\":\"UnpeerVpcResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Attempts to unpeer the Lightsail VPC from the user's default VPC.</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"output\":{\"shape\":\"UntagResourceResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified set of tag keys and their values from the specified Amazon Lightsail resource.</p> <p>The <code>untag resource</code> operation supports tag-based access control via request tags and resource tags applied to the resource identified by <code>resource name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"UpdateDomainEntry\":{\
      \"name\":\"UpdateDomainEntry\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateDomainEntryRequest\"},\
      \"output\":{\"shape\":\"UpdateDomainEntryResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Updates a domain recordset after it is created.</p> <p>The <code>update domain entry</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>domain name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"UpdateLoadBalancerAttribute\":{\
      \"name\":\"UpdateLoadBalancerAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateLoadBalancerAttributeRequest\"},\
      \"output\":{\"shape\":\"UpdateLoadBalancerAttributeResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified attribute for a load balancer. You can only update one attribute at a time.</p> <p>The <code>update load balancer attribute</code> operation supports tag-based access control via resource tags applied to the resource identified by <code>load balancer name</code>. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"UpdateRelationalDatabase\":{\
      \"name\":\"UpdateRelationalDatabase\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateRelationalDatabaseRequest\"},\
      \"output\":{\"shape\":\"UpdateRelationalDatabaseResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Allows the update of one or more attributes of a database in Amazon Lightsail.</p> <p>Updates are applied immediately, or in cases where the updates could result in an outage, are applied during the database's predefined maintenance window.</p> <p>The <code>update relational database</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"UpdateRelationalDatabaseParameters\":{\
      \"name\":\"UpdateRelationalDatabaseParameters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateRelationalDatabaseParametersRequest\"},\
      \"output\":{\"shape\":\"UpdateRelationalDatabaseParametersResult\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"OperationFailureException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"AccountSetupInProgressException\"},\
        {\"shape\":\"UnauthenticatedException\"}\
      ],\
      \"documentation\":\"<p>Allows the update of one or more parameters of a database in Amazon Lightsail.</p> <p>Parameter updates don't cause outages; therefore, their application is not subject to the preferred maintenance window. However, there are two ways in which parameter updates are applied: <code>dynamic</code> or <code>pending-reboot</code>. Parameters marked with a <code>dynamic</code> apply type are applied immediately. Parameters marked with a <code>pending-reboot</code> apply type are applied only after the database is rebooted using the <code>reboot relational database</code> operation.</p> <p>The <code>update relational database parameters</code> operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"code\":{\"shape\":\"string\"},\
        \"docs\":{\"shape\":\"string\"},\
        \"message\":{\"shape\":\"string\"},\
        \"tip\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Lightsail throws this exception when the user cannot be authenticated or uses invalid credentials to access a resource.</p>\",\
      \"exception\":true\
    },\
    \"AccessDirection\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"inbound\",\
        \"outbound\"\
      ]\
    },\
    \"AccountSetupInProgressException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"code\":{\"shape\":\"string\"},\
        \"docs\":{\"shape\":\"string\"},\
        \"message\":{\"shape\":\"string\"},\
        \"tip\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Lightsail throws this exception when an account is still in the setup in progress state.</p>\",\
      \"exception\":true\
    },\
    \"AddOn\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The name of the add-on.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The status of the add-on.</p>\"\
        },\
        \"snapshotTimeOfDay\":{\
          \"shape\":\"TimeOfDay\",\
          \"documentation\":\"<p>The daily time when an automatic snapshot is created.</p> <p>The time shown is in <code>HH:00</code> format, and in Coordinated Universal Time (UTC).</p> <p>The snapshot is automatically created between the time shown and up to 45 minutes after.</p>\"\
        },\
        \"nextSnapshotTimeOfDay\":{\
          \"shape\":\"TimeOfDay\",\
          \"documentation\":\"<p>The next daily time an automatic snapshot will be created.</p> <p>The time shown is in <code>HH:00</code> format, and in Coordinated Universal Time (UTC).</p> <p>The snapshot is automatically created between the time shown and up to 45 minutes after.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an add-on that is enabled for an Amazon Lightsail resource.</p>\"\
    },\
    \"AddOnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AddOn\"}\
    },\
    \"AddOnRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"addOnType\"],\
      \"members\":{\
        \"addOnType\":{\
          \"shape\":\"AddOnType\",\
          \"documentation\":\"<p>The add-on type.</p>\"\
        },\
        \"autoSnapshotAddOnRequest\":{\
          \"shape\":\"AutoSnapshotAddOnRequest\",\
          \"documentation\":\"<p>An object that represents additional parameters when enabling or modifying the automatic snapshot add-on.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a request to enable, modify, or disable an add-on for an Amazon Lightsail resource.</p> <note> <p>An additional cost may be associated with enabling add-ons. For more information, see the <a href=\\\"https://aws.amazon.com/lightsail/pricing/\\\">Lightsail pricing page</a>.</p> </note>\"\
    },\
    \"AddOnRequestList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AddOnRequest\"}\
    },\
    \"AddOnType\":{\
      \"type\":\"string\",\
      \"enum\":[\"AutoSnapshot\"]\
    },\
    \"Alarm\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the alarm.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the alarm.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The timestamp when the alarm was created.</p>\"\
        },\
        \"location\":{\
          \"shape\":\"ResourceLocation\",\
          \"documentation\":\"<p>An object that lists information about the location of the alarm.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The Lightsail resource type (e.g., <code>Alarm</code>).</p>\"\
        },\
        \"supportCode\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The support code. Include this code in your email to support when you have questions about your Lightsail alarm. This code enables our support team to look up your Lightsail information more easily.</p>\"\
        },\
        \"monitoredResourceInfo\":{\
          \"shape\":\"MonitoredResourceInfo\",\
          \"documentation\":\"<p>An object that lists information about the resource monitored by the alarm.</p>\"\
        },\
        \"comparisonOperator\":{\
          \"shape\":\"ComparisonOperator\",\
          \"documentation\":\"<p>The arithmetic operation used when comparing the specified statistic and threshold.</p>\"\
        },\
        \"evaluationPeriods\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The number of periods over which data is compared to the specified threshold.</p>\"\
        },\
        \"period\":{\
          \"shape\":\"MetricPeriod\",\
          \"documentation\":\"<p>The period, in seconds, over which the statistic is applied.</p>\"\
        },\
        \"threshold\":{\
          \"shape\":\"double\",\
          \"documentation\":\"<p>The value against which the specified statistic is compared.</p>\"\
        },\
        \"datapointsToAlarm\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The number of data points that must not within the specified threshold to trigger the alarm.</p>\"\
        },\
        \"treatMissingData\":{\
          \"shape\":\"TreatMissingData\",\
          \"documentation\":\"<p>Specifies how the alarm handles missing data points.</p> <p>An alarm can treat missing data in the following ways:</p> <ul> <li> <p> <code>breaching</code> - Assume the missing data is not within the threshold. Missing data counts towards the number of times the metric is not within the threshold.</p> </li> <li> <p> <code>notBreaching</code> - Assume the missing data is within the threshold. Missing data does not count towards the number of times the metric is not within the threshold.</p> </li> <li> <p> <code>ignore</code> - Ignore the missing data. Maintains the current alarm state.</p> </li> <li> <p> <code>missing</code> - Missing data is treated as missing.</p> </li> </ul>\"\
        },\
        \"statistic\":{\
          \"shape\":\"MetricStatistic\",\
          \"documentation\":\"<p>The statistic for the metric associated with the alarm.</p> <p>The following statistics are available:</p> <ul> <li> <p> <code>Minimum</code> - The lowest value observed during the specified period. Use this value to determine low volumes of activity for your application.</p> </li> <li> <p> <code>Maximum</code> - The highest value observed during the specified period. Use this value to determine high volumes of activity for your application.</p> </li> <li> <p> <code>Sum</code> - All values submitted for the matching metric added together. You can use this statistic to determine the total volume of a metric.</p> </li> <li> <p> <code>Average</code> - The value of Sum / SampleCount during the specified period. By comparing this statistic with the Minimum and Maximum values, you can determine the full scope of a metric and how close the average use is to the Minimum and Maximum values. This comparison helps you to know when to increase or decrease your resources.</p> </li> <li> <p> <code>SampleCount</code> - The count, or number, of data points used for the statistical calculation.</p> </li> </ul>\"\
        },\
        \"metricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the metric associated with the alarm.</p>\"\
        },\
        \"state\":{\
          \"shape\":\"AlarmState\",\
          \"documentation\":\"<p>The current state of the alarm.</p> <p>An alarm has the following possible states:</p> <ul> <li> <p> <code>ALARM</code> - The metric is outside of the defined threshold.</p> </li> <li> <p> <code>INSUFFICIENT_DATA</code> - The alarm has just started, the metric is not available, or not enough data is available for the metric to determine the alarm state.</p> </li> <li> <p> <code>OK</code> - The metric is within the defined threshold.</p> </li> </ul>\"\
        },\
        \"unit\":{\
          \"shape\":\"MetricUnit\",\
          \"documentation\":\"<p>The unit of the metric associated with the alarm.</p>\"\
        },\
        \"contactProtocols\":{\
          \"shape\":\"ContactProtocolsList\",\
          \"documentation\":\"<p>The contact protocols for the alarm, such as <code>Email</code>, <code>SMS</code> (text messaging), or both.</p>\"\
        },\
        \"notificationTriggers\":{\
          \"shape\":\"NotificationTriggerList\",\
          \"documentation\":\"<p>The alarm states that trigger a notification.</p>\"\
        },\
        \"notificationEnabled\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>Indicates whether the alarm is enabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an alarm.</p> <p>An alarm is a way to monitor your Amazon Lightsail resource metrics. For more information, see <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms\\\">Alarms in Amazon Lightsail</a>.</p>\"\
    },\
    \"AlarmState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"OK\",\
        \"ALARM\",\
        \"INSUFFICIENT_DATA\"\
      ]\
    },\
    \"AlarmsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Alarm\"}\
    },\
    \"AllocateStaticIpRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"staticIpName\"],\
      \"members\":{\
        \"staticIpName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the static IP address.</p>\"\
        }\
      }\
    },\
    \"AllocateStaticIpResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"AttachDiskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"diskName\",\
        \"instanceName\",\
        \"diskPath\"\
      ],\
      \"members\":{\
        \"diskName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The unique Lightsail disk name (e.g., <code>my-disk</code>).</p>\"\
        },\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the Lightsail instance where you want to utilize the storage disk.</p>\"\
        },\
        \"diskPath\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The disk path to expose to the instance (e.g., <code>/dev/xvdf</code>).</p>\"\
        }\
      }\
    },\
    \"AttachDiskResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"AttachInstancesToLoadBalancerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"loadBalancerName\",\
        \"instanceNames\"\
      ],\
      \"members\":{\
        \"loadBalancerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"instanceNames\":{\
          \"shape\":\"ResourceNameList\",\
          \"documentation\":\"<p>An array of strings representing the instance name(s) you want to attach to your load balancer.</p> <p>An instance must be <code>running</code> before you can attach it to your load balancer.</p> <p>There are no additional limits on the number of instances you can attach to your load balancer, aside from the limit of Lightsail instances you can create in your account (20).</p>\"\
        }\
      }\
    },\
    \"AttachInstancesToLoadBalancerResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"AttachLoadBalancerTlsCertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"loadBalancerName\",\
        \"certificateName\"\
      ],\
      \"members\":{\
        \"loadBalancerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the load balancer to which you want to associate the SSL/TLS certificate.</p>\"\
        },\
        \"certificateName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of your SSL/TLS certificate.</p>\"\
        }\
      }\
    },\
    \"AttachLoadBalancerTlsCertificateResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p> <p>These SSL/TLS certificates are only usable by Lightsail load balancers. You can't get the certificate and use it for another purpose.</p>\"\
        }\
      }\
    },\
    \"AttachStaticIpRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"staticIpName\",\
        \"instanceName\"\
      ],\
      \"members\":{\
        \"staticIpName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the static IP.</p>\"\
        },\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The instance name to which you want to attach the static IP address.</p>\"\
        }\
      }\
    },\
    \"AttachStaticIpResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"AttachedDisk\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"path\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The path of the disk (e.g., <code>/dev/xvdf</code>).</p>\"\
        },\
        \"sizeInGb\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The size of the disk in GB.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a block storage disk that is attached to an instance, and is included in an automatic snapshot.</p>\"\
    },\
    \"AttachedDiskList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AttachedDisk\"}\
    },\
    \"AttachedDiskMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ResourceName\"},\
      \"value\":{\"shape\":\"DiskMapList\"}\
    },\
    \"AutoSnapshotAddOnRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"snapshotTimeOfDay\":{\
          \"shape\":\"TimeOfDay\",\
          \"documentation\":\"<p>The daily time when an automatic snapshot will be created.</p> <p>Constraints:</p> <ul> <li> <p>Must be in <code>HH:00</code> format, and in an hourly increment.</p> </li> <li> <p>Specified in Coordinated Universal Time (UTC).</p> </li> <li> <p>The snapshot will be automatically created between the time specified and up to 45 minutes after.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a request to enable or modify the automatic snapshot add-on for an Amazon Lightsail instance or disk.</p> <p>When you modify the automatic snapshot time for a resource, it is typically effective immediately except under the following conditions:</p> <ul> <li> <p>If an automatic snapshot has been created for the current day, and you change the snapshot time to a later time of day, then the new snapshot time will be effective the following day. This ensures that two snapshots are not created for the current day.</p> </li> <li> <p>If an automatic snapshot has not yet been created for the current day, and you change the snapshot time to an earlier time of day, then the new snapshot time will be effective the following day and a snapshot is automatically created at the previously set time for the current day. This ensures that a snapshot is created for the current day.</p> </li> <li> <p>If an automatic snapshot has not yet been created for the current day, and you change the snapshot time to a time that is within 30 minutes from your current time, then the new snapshot time will be effective the following day and a snapshot is automatically created at the previously set time for the current day. This ensures that a snapshot is created for the current day, because 30 minutes is required between your current time and the new snapshot time that you specify.</p> </li> <li> <p>If an automatic snapshot is scheduled to be created within 30 minutes from your current time and you change the snapshot time, then the new snapshot time will be effective the following day and a snapshot is automatically created at the previously set time for the current day. This ensures that a snapshot is created for the current day, because 30 minutes is required between your current time and the new snapshot time that you specify.</p> </li> </ul>\"\
    },\
    \"AutoSnapshotDate\":{\
      \"type\":\"string\",\
      \"pattern\":\"^[0-9]{4}-[0-9]{2}-[0-9]{2}$\"\
    },\
    \"AutoSnapshotDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"date\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The date of the automatic snapshot in <code>YYYY-MM-DD</code> format.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The timestamp when the automatic snapshot was created.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"AutoSnapshotStatus\",\
          \"documentation\":\"<p>The status of the automatic snapshot.</p>\"\
        },\
        \"fromAttachedDisks\":{\
          \"shape\":\"AttachedDiskList\",\
          \"documentation\":\"<p>An array of objects that describe the block storage disks attached to the instance when the automatic snapshot was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an automatic snapshot.</p>\"\
    },\
    \"AutoSnapshotDetailsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AutoSnapshotDetails\"}\
    },\
    \"AutoSnapshotStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Success\",\
        \"Failed\",\
        \"InProgress\",\
        \"NotFound\"\
      ]\
    },\
    \"AvailabilityZone\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"zoneName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the Availability Zone. The format is <code>us-east-2a</code> (case-sensitive).</p>\"\
        },\
        \"state\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The state of the Availability Zone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an Availability Zone.</p>\"\
    },\
    \"AvailabilityZoneList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AvailabilityZone\"}\
    },\
    \"Base64\":{\"type\":\"string\"},\
    \"Blueprint\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"blueprintId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID for the virtual private server image (e.g., <code>app_wordpress_4_4</code> or <code>app_lamp_7_0</code>).</p>\"\
        },\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The friendly name of the blueprint (e.g., <code>Amazon Linux</code>).</p>\"\
        },\
        \"group\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The group name of the blueprint (e.g., <code>amazon-linux</code>).</p>\"\
        },\
        \"type\":{\
          \"shape\":\"BlueprintType\",\
          \"documentation\":\"<p>The type of the blueprint (e.g., <code>os</code> or <code>app</code>).</p>\"\
        },\
        \"description\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The description of the blueprint.</p>\"\
        },\
        \"isActive\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether the blueprint is active. Inactive blueprints are listed to support customers with existing instances but are not necessarily available for launch of new instances. Blueprints are marked inactive when they become outdated due to operating system updates or new application releases.</p>\"\
        },\
        \"minPower\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The minimum bundle power required to run this blueprint. For example, you need a bundle with a power value of 500 or more to create an instance that uses a blueprint with a minimum power value of 500. <code>0</code> indicates that the blueprint runs on all instance sizes. </p>\"\
        },\
        \"version\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The version number of the operating system, application, or stack (e.g., <code>2016.03.0</code>).</p>\"\
        },\
        \"versionCode\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The version code.</p>\"\
        },\
        \"productUrl\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The product URL to learn more about the image or blueprint.</p>\"\
        },\
        \"licenseUrl\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The end-user license agreement URL for the image or blueprint.</p>\"\
        },\
        \"platform\":{\
          \"shape\":\"InstancePlatform\",\
          \"documentation\":\"<p>The operating system platform (either Linux/Unix-based or Windows Server-based) of the blueprint.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a blueprint (a virtual private server image).</p>\"\
    },\
    \"BlueprintList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Blueprint\"}\
    },\
    \"BlueprintType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"os\",\
        \"app\"\
      ]\
    },\
    \"Bundle\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"price\":{\
          \"shape\":\"float\",\
          \"documentation\":\"<p>The price in US dollars (e.g., <code>5.0</code>).</p>\"\
        },\
        \"cpuCount\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The number of vCPUs included in the bundle (e.g., <code>2</code>).</p>\"\
        },\
        \"diskSizeInGb\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The size of the SSD (e.g., <code>30</code>).</p>\"\
        },\
        \"bundleId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The bundle ID (e.g., <code>micro_1_0</code>).</p>\"\
        },\
        \"instanceType\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The Amazon EC2 instance type (e.g., <code>t2.micro</code>).</p>\"\
        },\
        \"isActive\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether the bundle is active.</p>\"\
        },\
        \"name\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A friendly name for the bundle (e.g., <code>Micro</code>).</p>\"\
        },\
        \"power\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>A numeric value that represents the power of the bundle (e.g., <code>500</code>). You can use the bundle's power value in conjunction with a blueprint's minimum power value to determine whether the blueprint will run on the bundle. For example, you need a bundle with a power value of 500 or more to create an instance that uses a blueprint with a minimum power value of 500.</p>\"\
        },\
        \"ramSizeInGb\":{\
          \"shape\":\"float\",\
          \"documentation\":\"<p>The amount of RAM in GB (e.g., <code>2.0</code>).</p>\"\
        },\
        \"transferPerMonthInGb\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The data transfer rate per month in GB (e.g., <code>2000</code>).</p>\"\
        },\
        \"supportedPlatforms\":{\
          \"shape\":\"InstancePlatformList\",\
          \"documentation\":\"<p>The operating system platform (Linux/Unix-based or Windows Server-based) that the bundle supports. You can only launch a <code>WINDOWS</code> bundle on a blueprint that supports the <code>WINDOWS</code> platform. <code>LINUX_UNIX</code> blueprints require a <code>LINUX_UNIX</code> bundle.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a bundle, which is a set of specs describing your virtual private server (or <i>instance</i>).</p>\"\
    },\
    \"BundleList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Bundle\"}\
    },\
    \"CloseInstancePublicPortsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"portInfo\",\
        \"instanceName\"\
      ],\
      \"members\":{\
        \"portInfo\":{\
          \"shape\":\"PortInfo\",\
          \"documentation\":\"<p>An object to describe the ports to close for the specified instance.</p>\"\
        },\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the instance for which to close ports.</p>\"\
        }\
      }\
    },\
    \"CloseInstancePublicPortsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operation\":{\
          \"shape\":\"Operation\",\
          \"documentation\":\"<p>An object that describes the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"CloudFormationStackRecord\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the CloudFormation stack record. It starts with <code>CloudFormationStackRecord</code> followed by a GUID.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the CloudFormation stack record.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The date when the CloudFormation stack record was created.</p>\"\
        },\
        \"location\":{\
          \"shape\":\"ResourceLocation\",\
          \"documentation\":\"<p>A list of objects describing the Availability Zone and AWS Region of the CloudFormation stack record.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The Lightsail resource type (e.g., <code>CloudFormationStackRecord</code>).</p>\"\
        },\
        \"state\":{\
          \"shape\":\"RecordState\",\
          \"documentation\":\"<p>The current state of the CloudFormation stack record.</p>\"\
        },\
        \"sourceInfo\":{\
          \"shape\":\"CloudFormationStackRecordSourceInfoList\",\
          \"documentation\":\"<p>A list of objects describing the source of the CloudFormation stack record.</p>\"\
        },\
        \"destinationInfo\":{\
          \"shape\":\"DestinationInfo\",\
          \"documentation\":\"<p>A list of objects describing the destination service, which is AWS CloudFormation, and the Amazon Resource Name (ARN) of the AWS CloudFormation stack.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a CloudFormation stack record created as a result of the <code>create cloud formation stack</code> operation.</p> <p>A CloudFormation stack record provides information about the AWS CloudFormation stack used to create a new Amazon Elastic Compute Cloud instance from an exported Lightsail instance snapshot.</p>\"\
    },\
    \"CloudFormationStackRecordList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CloudFormationStackRecord\"}\
    },\
    \"CloudFormationStackRecordSourceInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceType\":{\
          \"shape\":\"CloudFormationStackRecordSourceType\",\
          \"documentation\":\"<p>The Lightsail resource type (e.g., <code>ExportSnapshotRecord</code>).</p>\"\
        },\
        \"name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the record.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the export snapshot record.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the source of a CloudFormation stack record (i.e., the export snapshot record).</p>\"\
    },\
    \"CloudFormationStackRecordSourceInfoList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CloudFormationStackRecordSourceInfo\"}\
    },\
    \"CloudFormationStackRecordSourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\"ExportSnapshotRecord\"]\
    },\
    \"ComparisonOperator\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"GreaterThanOrEqualToThreshold\",\
        \"GreaterThanThreshold\",\
        \"LessThanThreshold\",\
        \"LessThanOrEqualToThreshold\"\
      ]\
    },\
    \"ContactMethod\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"contactEndpoint\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The destination of the contact method, such as an email address or a mobile phone number.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"ContactMethodStatus\",\
          \"documentation\":\"<p>The current status of the contact method.</p> <p>A contact method has the following possible status:</p> <ul> <li> <p> <code>PendingVerification</code> - The contact method has not yet been verified, and the verification has not yet expired.</p> </li> <li> <p> <code>Valid</code> - The contact method has been verified.</p> </li> <li> <p> <code>InValid</code> - An attempt was made to verify the contact method, but the verification has expired.</p> </li> </ul>\"\
        },\
        \"protocol\":{\
          \"shape\":\"ContactProtocol\",\
          \"documentation\":\"<p>The protocol of the contact method, such as email or SMS (text messaging).</p>\"\
        },\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the contact method.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the contact method.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The timestamp when the contact method was created.</p>\"\
        },\
        \"location\":{\"shape\":\"ResourceLocation\"},\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The Lightsail resource type (e.g., <code>ContactMethod</code>).</p>\"\
        },\
        \"supportCode\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The support code. Include this code in your email to support when you have questions about your Lightsail contact method. This code enables our support team to look up your Lightsail information more easily.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a contact method.</p> <p>A contact method is a way to send you notifications. For more information, see <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications\\\">Notifications in Amazon Lightsail</a>.</p>\"\
    },\
    \"ContactMethodStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PendingVerification\",\
        \"Valid\",\
        \"Invalid\"\
      ]\
    },\
    \"ContactMethodVerificationProtocol\":{\
      \"type\":\"string\",\
      \"enum\":[\"Email\"]\
    },\
    \"ContactMethodsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContactMethod\"}\
    },\
    \"ContactProtocol\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Email\",\
        \"SMS\"\
      ]\
    },\
    \"ContactProtocolsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContactProtocol\"}\
    },\
    \"CopySnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"targetSnapshotName\",\
        \"sourceRegion\"\
      ],\
      \"members\":{\
        \"sourceSnapshotName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the source manual snapshot to copy.</p> <p>Constraint:</p> <ul> <li> <p>Define this parameter only when copying a manual snapshot as another manual snapshot.</p> </li> </ul>\"\
        },\
        \"sourceResourceName\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The name of the source instance or disk from which the source automatic snapshot was created.</p> <p>Constraint:</p> <ul> <li> <p>Define this parameter only when copying an automatic snapshot as a manual snapshot. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots\\\">Lightsail Dev Guide</a>.</p> </li> </ul>\"\
        },\
        \"restoreDate\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The date of the source automatic snapshot to copy. Use the <code>get auto snapshots</code> operation to identify the dates of the available automatic snapshots.</p> <p>Constraints:</p> <ul> <li> <p>Must be specified in <code>YYYY-MM-DD</code> format.</p> </li> <li> <p>This parameter cannot be defined together with the <code>use latest restorable auto snapshot</code> parameter. The <code>restore date</code> and <code>use latest restorable auto snapshot</code> parameters are mutually exclusive.</p> </li> <li> <p>Define this parameter only when copying an automatic snapshot as a manual snapshot. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots\\\">Lightsail Dev Guide</a>.</p> </li> </ul>\"\
        },\
        \"useLatestRestorableAutoSnapshot\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value to indicate whether to use the latest available automatic snapshot of the specified source instance or disk.</p> <p>Constraints:</p> <ul> <li> <p>This parameter cannot be defined together with the <code>restore date</code> parameter. The <code>use latest restorable auto snapshot</code> and <code>restore date</code> parameters are mutually exclusive.</p> </li> <li> <p>Define this parameter only when copying an automatic snapshot as a manual snapshot. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots\\\">Lightsail Dev Guide</a>.</p> </li> </ul>\"\
        },\
        \"targetSnapshotName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the new manual snapshot to be created as a copy.</p>\"\
        },\
        \"sourceRegion\":{\
          \"shape\":\"RegionName\",\
          \"documentation\":\"<p>The AWS Region where the source manual or automatic snapshot is located.</p>\"\
        }\
      }\
    },\
    \"CopySnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"CreateCloudFormationStackRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"instances\"],\
      \"members\":{\
        \"instances\":{\
          \"shape\":\"InstanceEntryList\",\
          \"documentation\":\"<p>An array of parameters that will be used to create the new Amazon EC2 instance. You can only pass one instance entry at a time in this array. You will get an invalid parameter error if you pass more than one instance entry in this array.</p>\"\
        }\
      }\
    },\
    \"CreateCloudFormationStackResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"CreateContactMethodRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"protocol\",\
        \"contactEndpoint\"\
      ],\
      \"members\":{\
        \"protocol\":{\
          \"shape\":\"ContactProtocol\",\
          \"documentation\":\"<p>The protocol of the contact method, such as <code>Email</code> or <code>SMS</code> (text messaging).</p> <p>The <code>SMS</code> protocol is supported only in the following AWS Regions.</p> <ul> <li> <p>US East (N. Virginia) (<code>us-east-1</code>)</p> </li> <li> <p>US West (Oregon) (<code>us-west-2</code>)</p> </li> <li> <p>Europe (Ireland) (<code>eu-west-1</code>)</p> </li> <li> <p>Asia Pacific (Tokyo) (<code>ap-northeast-1</code>)</p> </li> <li> <p>Asia Pacific (Singapore) (<code>ap-southeast-1</code>)</p> </li> <li> <p>Asia Pacific (Sydney) (<code>ap-southeast-2</code>)</p> </li> </ul> <p>For a list of countries/regions where SMS text messages can be sent, and the latest AWS Regions where SMS text messaging is supported, see <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/sns-supported-regions-countries.html\\\">Supported Regions and Countries</a> in the <i>Amazon SNS Developer Guide</i>.</p> <p>For more information about notifications in Amazon Lightsail, see <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications\\\">Notifications in Amazon Lightsail</a>.</p>\"\
        },\
        \"contactEndpoint\":{\
          \"shape\":\"StringMax256\",\
          \"documentation\":\"<p>The destination of the contact method, such as an email address or a mobile phone number.</p> <p>Use the E.164 format when specifying a mobile phone number. E.164 is a standard for the phone number structure used for international telecommunication. Phone numbers that follow this format can have a maximum of 15 digits, and they are prefixed with the plus character (+) and the country code. For example, a U.S. phone number in E.164 format would be specified as +1XXX5550100. For more information, see <a href=\\\"https://en.wikipedia.org/wiki/E.164\\\">E.164</a> on <i>Wikipedia</i>.</p>\"\
        }\
      }\
    },\
    \"CreateContactMethodResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"CreateDiskFromSnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"diskName\",\
        \"availabilityZone\",\
        \"sizeInGb\"\
      ],\
      \"members\":{\
        \"diskName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The unique Lightsail disk name (e.g., <code>my-disk</code>).</p>\"\
        },\
        \"diskSnapshotName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the disk snapshot (e.g., <code>my-snapshot</code>) from which to create the new storage disk.</p> <p>Constraint:</p> <ul> <li> <p>This parameter cannot be defined together with the <code>source disk name</code> parameter. The <code>disk snapshot name</code> and <code>source disk name</code> parameters are mutually exclusive.</p> </li> </ul>\"\
        },\
        \"availabilityZone\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Availability Zone where you want to create the disk (e.g., <code>us-east-2a</code>). Choose the same Availability Zone as the Lightsail instance where you want to create the disk.</p> <p>Use the GetRegions operation to list the Availability Zones where Lightsail is currently available.</p>\"\
        },\
        \"sizeInGb\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The size of the disk in GB (e.g., <code>32</code>).</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values to add to the resource during create.</p> <p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>\"\
        },\
        \"addOns\":{\
          \"shape\":\"AddOnRequestList\",\
          \"documentation\":\"<p>An array of objects that represent the add-ons to enable for the new disk.</p>\"\
        },\
        \"sourceDiskName\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The name of the source disk from which the source automatic snapshot was created.</p> <p>Constraints:</p> <ul> <li> <p>This parameter cannot be defined together with the <code>disk snapshot name</code> parameter. The <code>source disk name</code> and <code>disk snapshot name</code> parameters are mutually exclusive.</p> </li> <li> <p>Define this parameter only when creating a new disk from an automatic snapshot. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots\\\">Lightsail Dev Guide</a>.</p> </li> </ul>\"\
        },\
        \"restoreDate\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The date of the automatic snapshot to use for the new disk. Use the <code>get auto snapshots</code> operation to identify the dates of the available automatic snapshots.</p> <p>Constraints:</p> <ul> <li> <p>Must be specified in <code>YYYY-MM-DD</code> format.</p> </li> <li> <p>This parameter cannot be defined together with the <code>use latest restorable auto snapshot</code> parameter. The <code>restore date</code> and <code>use latest restorable auto snapshot</code> parameters are mutually exclusive.</p> </li> <li> <p>Define this parameter only when creating a new disk from an automatic snapshot. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots\\\">Lightsail Dev Guide</a>.</p> </li> </ul>\"\
        },\
        \"useLatestRestorableAutoSnapshot\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value to indicate whether to use the latest available automatic snapshot.</p> <p>Constraints:</p> <ul> <li> <p>This parameter cannot be defined together with the <code>restore date</code> parameter. The <code>use latest restorable auto snapshot</code> and <code>restore date</code> parameters are mutually exclusive.</p> </li> <li> <p>Define this parameter only when creating a new disk from an automatic snapshot. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots\\\">Lightsail Dev Guide</a>.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"CreateDiskFromSnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"CreateDiskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"diskName\",\
        \"availabilityZone\",\
        \"sizeInGb\"\
      ],\
      \"members\":{\
        \"diskName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The unique Lightsail disk name (e.g., <code>my-disk</code>).</p>\"\
        },\
        \"availabilityZone\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Availability Zone where you want to create the disk (e.g., <code>us-east-2a</code>). Use the same Availability Zone as the Lightsail instance to which you want to attach the disk.</p> <p>Use the <code>get regions</code> operation to list the Availability Zones where Lightsail is currently available.</p>\"\
        },\
        \"sizeInGb\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The size of the disk in GB (e.g., <code>32</code>).</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values to add to the resource during create.</p> <p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>\"\
        },\
        \"addOns\":{\
          \"shape\":\"AddOnRequestList\",\
          \"documentation\":\"<p>An array of objects that represent the add-ons to enable for the new disk.</p>\"\
        }\
      }\
    },\
    \"CreateDiskResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"CreateDiskSnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"diskSnapshotName\"],\
      \"members\":{\
        \"diskName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The unique name of the source disk (e.g., <code>Disk-Virginia-1</code>).</p> <note> <p>This parameter cannot be defined together with the <code>instance name</code> parameter. The <code>disk name</code> and <code>instance name</code> parameters are mutually exclusive.</p> </note>\"\
        },\
        \"diskSnapshotName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the destination disk snapshot (e.g., <code>my-disk-snapshot</code>) based on the source disk.</p>\"\
        },\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The unique name of the source instance (e.g., <code>Amazon_Linux-512MB-Virginia-1</code>). When this is defined, a snapshot of the instance's system volume is created.</p> <note> <p>This parameter cannot be defined together with the <code>disk name</code> parameter. The <code>instance name</code> and <code>disk name</code> parameters are mutually exclusive.</p> </note>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values to add to the resource during create.</p> <p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>\"\
        }\
      }\
    },\
    \"CreateDiskSnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"CreateDomainEntryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"domainName\",\
        \"domainEntry\"\
      ],\
      \"members\":{\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The domain name (e.g., <code>example.com</code>) for which you want to create the domain entry.</p>\"\
        },\
        \"domainEntry\":{\
          \"shape\":\"DomainEntry\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about the domain entry request.</p>\"\
        }\
      }\
    },\
    \"CreateDomainEntryResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operation\":{\
          \"shape\":\"Operation\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"CreateDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"domainName\"],\
      \"members\":{\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The domain name to manage (e.g., <code>example.com</code>).</p> <note> <p>You cannot register a new domain name using Lightsail. You must register a domain name using Amazon Route 53 or another domain name registrar. If you have already registered your domain, you can enter its name in this parameter to manage the DNS records for that domain.</p> </note>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values to add to the resource during create.</p> <p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>\"\
        }\
      }\
    },\
    \"CreateDomainResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operation\":{\
          \"shape\":\"Operation\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"CreateInstanceSnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"instanceSnapshotName\",\
        \"instanceName\"\
      ],\
      \"members\":{\
        \"instanceSnapshotName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name for your new snapshot.</p>\"\
        },\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The Lightsail instance on which to base your snapshot.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values to add to the resource during create.</p> <p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>\"\
        }\
      }\
    },\
    \"CreateInstanceSnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"CreateInstancesFromSnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"instanceNames\",\
        \"availabilityZone\",\
        \"bundleId\"\
      ],\
      \"members\":{\
        \"instanceNames\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>The names for your new instances.</p>\"\
        },\
        \"attachedDiskMapping\":{\
          \"shape\":\"AttachedDiskMap\",\
          \"documentation\":\"<p>An object containing information about one or more disk mappings.</p>\"\
        },\
        \"availabilityZone\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The Availability Zone where you want to create your instances. Use the following formatting: <code>us-east-2a</code> (case sensitive). You can get a list of Availability Zones by using the <a href=\\\"http://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetRegions.html\\\">get regions</a> operation. Be sure to add the <code>include Availability Zones</code> parameter to your request.</p>\"\
        },\
        \"instanceSnapshotName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the instance snapshot on which you are basing your new instances. Use the get instance snapshots operation to return information about your existing snapshots.</p> <p>Constraint:</p> <ul> <li> <p>This parameter cannot be defined together with the <code>source instance name</code> parameter. The <code>instance snapshot name</code> and <code>source instance name</code> parameters are mutually exclusive.</p> </li> </ul>\"\
        },\
        \"bundleId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The bundle of specification information for your virtual private server (or <i>instance</i>), including the pricing plan (e.g., <code>micro_1_0</code>).</p>\"\
        },\
        \"userData\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>You can create a launch script that configures a server with additional user data. For example, <code>apt-get -y update</code>.</p> <note> <p>Depending on the machine image you choose, the command to get software on your instance varies. Amazon Linux and CentOS use <code>yum</code>, Debian and Ubuntu use <code>apt-get</code>, and FreeBSD uses <code>pkg</code>. For a complete list, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/getting-started/article/compare-options-choose-lightsail-instance-image\\\">Dev Guide</a>.</p> </note>\"\
        },\
        \"keyPairName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name for your key pair.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values to add to the resource during create.</p> <p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>\"\
        },\
        \"addOns\":{\
          \"shape\":\"AddOnRequestList\",\
          \"documentation\":\"<p>An array of objects representing the add-ons to enable for the new instance.</p>\"\
        },\
        \"sourceInstanceName\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The name of the source instance from which the source automatic snapshot was created.</p> <p>Constraints:</p> <ul> <li> <p>This parameter cannot be defined together with the <code>instance snapshot name</code> parameter. The <code>source instance name</code> and <code>instance snapshot name</code> parameters are mutually exclusive.</p> </li> <li> <p>Define this parameter only when creating a new instance from an automatic snapshot. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots\\\">Lightsail Dev Guide</a>.</p> </li> </ul>\"\
        },\
        \"restoreDate\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The date of the automatic snapshot to use for the new instance. Use the <code>get auto snapshots</code> operation to identify the dates of the available automatic snapshots.</p> <p>Constraints:</p> <ul> <li> <p>Must be specified in <code>YYYY-MM-DD</code> format.</p> </li> <li> <p>This parameter cannot be defined together with the <code>use latest restorable auto snapshot</code> parameter. The <code>restore date</code> and <code>use latest restorable auto snapshot</code> parameters are mutually exclusive.</p> </li> <li> <p>Define this parameter only when creating a new instance from an automatic snapshot. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots\\\">Lightsail Dev Guide</a>.</p> </li> </ul>\"\
        },\
        \"useLatestRestorableAutoSnapshot\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value to indicate whether to use the latest available automatic snapshot.</p> <p>Constraints:</p> <ul> <li> <p>This parameter cannot be defined together with the <code>restore date</code> parameter. The <code>use latest restorable auto snapshot</code> and <code>restore date</code> parameters are mutually exclusive.</p> </li> <li> <p>Define this parameter only when creating a new instance from an automatic snapshot. For more information, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots\\\">Lightsail Dev Guide</a>.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"CreateInstancesFromSnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"CreateInstancesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"instanceNames\",\
        \"availabilityZone\",\
        \"blueprintId\",\
        \"bundleId\"\
      ],\
      \"members\":{\
        \"instanceNames\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>The names to use for your new Lightsail instances. Separate multiple values using quotation marks and commas, for example: <code>[\\\"MyFirstInstance\\\",\\\"MySecondInstance\\\"]</code> </p>\"\
        },\
        \"availabilityZone\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The Availability Zone in which to create your instance. Use the following format: <code>us-east-2a</code> (case sensitive). You can get a list of Availability Zones by using the <a href=\\\"http://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetRegions.html\\\">get regions</a> operation. Be sure to add the <code>include Availability Zones</code> parameter to your request.</p>\"\
        },\
        \"customImageName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>(Deprecated) The name for your custom image.</p> <note> <p>In releases prior to June 12, 2017, this parameter was ignored by the API. It is now deprecated.</p> </note>\",\
          \"deprecated\":true\
        },\
        \"blueprintId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID for a virtual private server image (e.g., <code>app_wordpress_4_4</code> or <code>app_lamp_7_0</code>). Use the <code>get blueprints</code> operation to return a list of available images (or <i>blueprints</i>).</p> <note> <p>Use active blueprints when creating new instances. Inactive blueprints are listed to support customers with existing instances and are not necessarily available to create new instances. Blueprints are marked inactive when they become outdated due to operating system updates or new application releases.</p> </note>\"\
        },\
        \"bundleId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The bundle of specification information for your virtual private server (or <i>instance</i>), including the pricing plan (e.g., <code>micro_1_0</code>).</p>\"\
        },\
        \"userData\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A launch script you can create that configures a server with additional user data. For example, you might want to run <code>apt-get -y update</code>.</p> <note> <p>Depending on the machine image you choose, the command to get software on your instance varies. Amazon Linux and CentOS use <code>yum</code>, Debian and Ubuntu use <code>apt-get</code>, and FreeBSD uses <code>pkg</code>. For a complete list, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/getting-started/article/compare-options-choose-lightsail-instance-image\\\">Dev Guide</a>.</p> </note>\"\
        },\
        \"keyPairName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of your key pair.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values to add to the resource during create.</p> <p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>\"\
        },\
        \"addOns\":{\
          \"shape\":\"AddOnRequestList\",\
          \"documentation\":\"<p>An array of objects representing the add-ons to enable for the new instance.</p>\"\
        }\
      }\
    },\
    \"CreateInstancesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"CreateKeyPairRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"keyPairName\"],\
      \"members\":{\
        \"keyPairName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name for your new key pair.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values to add to the resource during create.</p> <p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>\"\
        }\
      }\
    },\
    \"CreateKeyPairResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"keyPair\":{\
          \"shape\":\"KeyPair\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about the new key pair you just created.</p>\"\
        },\
        \"publicKeyBase64\":{\
          \"shape\":\"Base64\",\
          \"documentation\":\"<p>A base64-encoded public key of the <code>ssh-rsa</code> type.</p>\"\
        },\
        \"privateKeyBase64\":{\
          \"shape\":\"Base64\",\
          \"documentation\":\"<p>A base64-encoded RSA private key.</p>\"\
        },\
        \"operation\":{\
          \"shape\":\"Operation\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"CreateLoadBalancerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"loadBalancerName\",\
        \"instancePort\"\
      ],\
      \"members\":{\
        \"loadBalancerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of your load balancer.</p>\"\
        },\
        \"instancePort\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>The instance port where you're creating your load balancer.</p>\"\
        },\
        \"healthCheckPath\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The path you provided to perform the load balancer health check. If you didn't specify a health check path, Lightsail uses the root path of your website (e.g., <code>\\\"/\\\"</code>).</p> <p>You may want to specify a custom health check path other than the root of your application if your home page loads slowly or has a lot of media or scripting on it.</p>\"\
        },\
        \"certificateName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the SSL/TLS certificate.</p> <p>If you specify <code>certificateName</code>, then <code>certificateDomainName</code> is required (and vice-versa).</p>\"\
        },\
        \"certificateDomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The domain name with which your certificate is associated (e.g., <code>example.com</code>).</p> <p>If you specify <code>certificateDomainName</code>, then <code>certificateName</code> is required (and vice-versa).</p>\"\
        },\
        \"certificateAlternativeNames\":{\
          \"shape\":\"DomainNameList\",\
          \"documentation\":\"<p>The optional alternative domains and subdomains to use with your SSL/TLS certificate (e.g., <code>www.example.com</code>, <code>example.com</code>, <code>m.example.com</code>, <code>blog.example.com</code>).</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values to add to the resource during create.</p> <p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>\"\
        }\
      }\
    },\
    \"CreateLoadBalancerResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"CreateLoadBalancerTlsCertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"loadBalancerName\",\
        \"certificateName\",\
        \"certificateDomainName\"\
      ],\
      \"members\":{\
        \"loadBalancerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The load balancer name where you want to create the SSL/TLS certificate.</p>\"\
        },\
        \"certificateName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The SSL/TLS certificate name.</p> <p>You can have up to 10 certificates in your account at one time. Each Lightsail load balancer can have up to 2 certificates associated with it at one time. There is also an overall limit to the number of certificates that can be issue in a 365-day period. For more information, see <a href=\\\"http://docs.aws.amazon.com/acm/latest/userguide/acm-limits.html\\\">Limits</a>.</p>\"\
        },\
        \"certificateDomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The domain name (e.g., <code>example.com</code>) for your SSL/TLS certificate.</p>\"\
        },\
        \"certificateAlternativeNames\":{\
          \"shape\":\"DomainNameList\",\
          \"documentation\":\"<p>An array of strings listing alternative domains and subdomains for your SSL/TLS certificate. Lightsail will de-dupe the names for you. You can have a maximum of 9 alternative names (in addition to the 1 primary domain). We do not support wildcards (e.g., <code>*.example.com</code>).</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values to add to the resource during create.</p> <p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>\"\
        }\
      }\
    },\
    \"CreateLoadBalancerTlsCertificateResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"CreateRelationalDatabaseFromSnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"relationalDatabaseName\"],\
      \"members\":{\
        \"relationalDatabaseName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name to use for your new database.</p> <p>Constraints:</p> <ul> <li> <p>Must contain from 2 to 255 alphanumeric characters, or hyphens.</p> </li> <li> <p>The first and last character must be a letter or number.</p> </li> </ul>\"\
        },\
        \"availabilityZone\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The Availability Zone in which to create your new database. Use the <code>us-east-2a</code> case-sensitive format.</p> <p>You can get a list of Availability Zones by using the <code>get regions</code> operation. Be sure to add the <code>include relational database Availability Zones</code> parameter to your request.</p>\"\
        },\
        \"publiclyAccessible\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>Specifies the accessibility options for your new database. A value of <code>true</code> specifies a database that is available to resources outside of your Lightsail account. A value of <code>false</code> specifies a database that is available only to your Lightsail resources in the same region as your database.</p>\"\
        },\
        \"relationalDatabaseSnapshotName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the database snapshot from which to create your new database.</p>\"\
        },\
        \"relationalDatabaseBundleId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The bundle ID for your new database. A bundle describes the performance specifications for your database.</p> <p>You can get a list of database bundle IDs by using the <code>get relational database bundles</code> operation.</p> <p>When creating a new database from a snapshot, you cannot choose a bundle that is smaller than the bundle of the source database.</p>\"\
        },\
        \"sourceRelationalDatabaseName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the source database.</p>\"\
        },\
        \"restoreTime\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The date and time to restore your database from.</p> <p>Constraints:</p> <ul> <li> <p>Must be before the latest restorable time for the database.</p> </li> <li> <p>Cannot be specified if the <code>use latest restorable time</code> parameter is <code>true</code>.</p> </li> <li> <p>Specified in Coordinated Universal Time (UTC).</p> </li> <li> <p>Specified in the Unix time format.</p> <p>For example, if you wish to use a restore time of October 1, 2018, at 8 PM UTC, then you input <code>1538424000</code> as the restore time.</p> </li> </ul>\"\
        },\
        \"useLatestRestorableTime\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>Specifies whether your database is restored from the latest backup time. A value of <code>true</code> restores from the latest backup time. </p> <p>Default: <code>false</code> </p> <p>Constraints: Cannot be specified if the <code>restore time</code> parameter is provided.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values to add to the resource during create.</p> <p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>\"\
        }\
      }\
    },\
    \"CreateRelationalDatabaseFromSnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"CreateRelationalDatabaseRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"relationalDatabaseName\",\
        \"relationalDatabaseBlueprintId\",\
        \"relationalDatabaseBundleId\",\
        \"masterDatabaseName\",\
        \"masterUsername\"\
      ],\
      \"members\":{\
        \"relationalDatabaseName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name to use for your new database.</p> <p>Constraints:</p> <ul> <li> <p>Must contain from 2 to 255 alphanumeric characters, or hyphens.</p> </li> <li> <p>The first and last character must be a letter or number.</p> </li> </ul>\"\
        },\
        \"availabilityZone\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The Availability Zone in which to create your new database. Use the <code>us-east-2a</code> case-sensitive format.</p> <p>You can get a list of Availability Zones by using the <code>get regions</code> operation. Be sure to add the <code>include relational database Availability Zones</code> parameter to your request.</p>\"\
        },\
        \"relationalDatabaseBlueprintId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The blueprint ID for your new database. A blueprint describes the major engine version of a database.</p> <p>You can get a list of database blueprints IDs by using the <code>get relational database blueprints</code> operation.</p>\"\
        },\
        \"relationalDatabaseBundleId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The bundle ID for your new database. A bundle describes the performance specifications for your database.</p> <p>You can get a list of database bundle IDs by using the <code>get relational database bundles</code> operation.</p>\"\
        },\
        \"masterDatabaseName\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The name of the master database created when the Lightsail database resource is created.</p> <p>Constraints:</p> <ul> <li> <p>Must contain from 1 to 64 alphanumeric characters.</p> </li> <li> <p>Cannot be a word reserved by the specified database engine</p> </li> </ul>\"\
        },\
        \"masterUsername\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The master user name for your new database.</p> <p>Constraints:</p> <ul> <li> <p>Master user name is required.</p> </li> <li> <p>Must contain from 1 to 16 alphanumeric characters.</p> </li> <li> <p>The first character must be a letter.</p> </li> <li> <p>Cannot be a reserved word for the database engine you choose.</p> <p>For more information about reserved words in MySQL 5.6 or 5.7, see the Keywords and Reserved Words articles for <a href=\\\"https://dev.mysql.com/doc/refman/5.6/en/keywords.html\\\">MySQL 5.6</a> or <a href=\\\"https://dev.mysql.com/doc/refman/5.7/en/keywords.html\\\">MySQL 5.7</a> respectively.</p> </li> </ul>\"\
        },\
        \"masterUserPassword\":{\
          \"shape\":\"SensitiveString\",\
          \"documentation\":\"<p>The password for the master user of your new database. The password can include any printable ASCII character except \\\"/\\\", \\\"\\\"\\\", or \\\"@\\\".</p> <p>Constraints: Must contain 8 to 41 characters.</p>\"\
        },\
        \"preferredBackupWindow\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The daily time range during which automated backups are created for your new database if automated backups are enabled.</p> <p>The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region. For more information about the preferred backup window time blocks for each region, see the <a href=\\\"https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html#USER_WorkingWithAutomatedBackups.BackupWindow\\\">Working With Backups</a> guide in the Amazon Relational Database Service (Amazon RDS) documentation.</p> <p>Constraints:</p> <ul> <li> <p>Must be in the <code>hh24:mi-hh24:mi</code> format.</p> <p>Example: <code>16:00-16:30</code> </p> </li> <li> <p>Specified in Coordinated Universal Time (UTC).</p> </li> <li> <p>Must not conflict with the preferred maintenance window.</p> </li> <li> <p>Must be at least 30 minutes.</p> </li> </ul>\"\
        },\
        \"preferredMaintenanceWindow\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The weekly time range during which system maintenance can occur on your new database.</p> <p>The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week.</p> <p>Constraints:</p> <ul> <li> <p>Must be in the <code>ddd:hh24:mi-ddd:hh24:mi</code> format.</p> </li> <li> <p>Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.</p> </li> <li> <p>Must be at least 30 minutes.</p> </li> <li> <p>Specified in Coordinated Universal Time (UTC).</p> </li> <li> <p>Example: <code>Tue:17:00-Tue:17:30</code> </p> </li> </ul>\"\
        },\
        \"publiclyAccessible\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>Specifies the accessibility options for your new database. A value of <code>true</code> specifies a database that is available to resources outside of your Lightsail account. A value of <code>false</code> specifies a database that is available only to your Lightsail resources in the same region as your database.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values to add to the resource during create.</p> <p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>\"\
        }\
      }\
    },\
    \"CreateRelationalDatabaseResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"CreateRelationalDatabaseSnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"relationalDatabaseName\",\
        \"relationalDatabaseSnapshotName\"\
      ],\
      \"members\":{\
        \"relationalDatabaseName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the database on which to base your new snapshot.</p>\"\
        },\
        \"relationalDatabaseSnapshotName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name for your new database snapshot.</p> <p>Constraints:</p> <ul> <li> <p>Must contain from 2 to 255 alphanumeric characters, or hyphens.</p> </li> <li> <p>The first and last character must be a letter or number.</p> </li> </ul>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values to add to the resource during create.</p> <p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>\"\
        }\
      }\
    },\
    \"CreateRelationalDatabaseSnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DeleteAlarmRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"alarmName\"],\
      \"members\":{\
        \"alarmName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the alarm to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteAlarmResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DeleteAutoSnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceName\",\
        \"date\"\
      ],\
      \"members\":{\
        \"resourceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the source instance or disk from which to delete the automatic snapshot.</p>\"\
        },\
        \"date\":{\
          \"shape\":\"AutoSnapshotDate\",\
          \"documentation\":\"<p>The date of the automatic snapshot to delete in <code>YYYY-MM-DD</code> format. Use the <code>get auto snapshots</code> operation to get the available automatic snapshots for a resource.</p>\"\
        }\
      }\
    },\
    \"DeleteAutoSnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DeleteContactMethodRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"protocol\"],\
      \"members\":{\
        \"protocol\":{\
          \"shape\":\"ContactProtocol\",\
          \"documentation\":\"<p>The protocol that will be deleted, such as <code>Email</code> or <code>SMS</code> (text messaging).</p> <note> <p>To delete an <code>Email</code> and an <code>SMS</code> contact method if you added both, you must run separate <code>DeleteContactMethod</code> actions to delete each protocol.</p> </note>\"\
        }\
      }\
    },\
    \"DeleteContactMethodResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DeleteDiskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"diskName\"],\
      \"members\":{\
        \"diskName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The unique name of the disk you want to delete (e.g., <code>my-disk</code>).</p>\"\
        },\
        \"forceDeleteAddOns\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value to indicate whether to delete the enabled add-ons for the disk.</p>\"\
        }\
      }\
    },\
    \"DeleteDiskResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DeleteDiskSnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"diskSnapshotName\"],\
      \"members\":{\
        \"diskSnapshotName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the disk snapshot you want to delete (e.g., <code>my-disk-snapshot</code>).</p>\"\
        }\
      }\
    },\
    \"DeleteDiskSnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DeleteDomainEntryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"domainName\",\
        \"domainEntry\"\
      ],\
      \"members\":{\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain entry to delete.</p>\"\
        },\
        \"domainEntry\":{\
          \"shape\":\"DomainEntry\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about your domain entries.</p>\"\
        }\
      }\
    },\
    \"DeleteDomainEntryResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operation\":{\
          \"shape\":\"Operation\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DeleteDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"domainName\"],\
      \"members\":{\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The specific domain name to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteDomainResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operation\":{\
          \"shape\":\"Operation\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DeleteInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"instanceName\"],\
      \"members\":{\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the instance to delete.</p>\"\
        },\
        \"forceDeleteAddOns\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value to indicate whether to delete the enabled add-ons for the disk.</p>\"\
        }\
      }\
    },\
    \"DeleteInstanceResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DeleteInstanceSnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"instanceSnapshotName\"],\
      \"members\":{\
        \"instanceSnapshotName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the snapshot to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteInstanceSnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DeleteKeyPairRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"keyPairName\"],\
      \"members\":{\
        \"keyPairName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the key pair to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteKeyPairResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operation\":{\
          \"shape\":\"Operation\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DeleteKnownHostKeysRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"instanceName\"],\
      \"members\":{\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the instance for which you want to reset the host key or certificate.</p>\"\
        }\
      }\
    },\
    \"DeleteKnownHostKeysResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DeleteLoadBalancerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"loadBalancerName\"],\
      \"members\":{\
        \"loadBalancerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the load balancer you want to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteLoadBalancerResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DeleteLoadBalancerTlsCertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"loadBalancerName\",\
        \"certificateName\"\
      ],\
      \"members\":{\
        \"loadBalancerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The load balancer name.</p>\"\
        },\
        \"certificateName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The SSL/TLS certificate name.</p>\"\
        },\
        \"force\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>When <code>true</code>, forces the deletion of an SSL/TLS certificate.</p> <p>There can be two certificates associated with a Lightsail load balancer: the primary and the backup. The <code>force</code> parameter is required when the primary SSL/TLS certificate is in use by an instance attached to the load balancer.</p>\"\
        }\
      }\
    },\
    \"DeleteLoadBalancerTlsCertificateResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DeleteRelationalDatabaseRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"relationalDatabaseName\"],\
      \"members\":{\
        \"relationalDatabaseName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the database that you are deleting.</p>\"\
        },\
        \"skipFinalSnapshot\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>Determines whether a final database snapshot is created before your database is deleted. If <code>true</code> is specified, no database snapshot is created. If <code>false</code> is specified, a database snapshot is created before your database is deleted.</p> <p>You must specify the <code>final relational database snapshot name</code> parameter if the <code>skip final snapshot</code> parameter is <code>false</code>.</p> <p>Default: <code>false</code> </p>\"\
        },\
        \"finalRelationalDatabaseSnapshotName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the database snapshot created if <code>skip final snapshot</code> is <code>false</code>, which is the default value for that parameter.</p> <note> <p>Specifying this parameter and also specifying the <code>skip final snapshot</code> parameter to <code>true</code> results in an error.</p> </note> <p>Constraints:</p> <ul> <li> <p>Must contain from 2 to 255 alphanumeric characters, or hyphens.</p> </li> <li> <p>The first and last character must be a letter or number.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"DeleteRelationalDatabaseResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DeleteRelationalDatabaseSnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"relationalDatabaseSnapshotName\"],\
      \"members\":{\
        \"relationalDatabaseSnapshotName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the database snapshot that you are deleting.</p>\"\
        }\
      }\
    },\
    \"DeleteRelationalDatabaseSnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DestinationInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"id\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the resource created at the destination.</p>\"\
        },\
        \"service\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The destination service of the record.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the destination of a record.</p>\"\
    },\
    \"DetachDiskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"diskName\"],\
      \"members\":{\
        \"diskName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The unique name of the disk you want to detach from your instance (e.g., <code>my-disk</code>).</p>\"\
        }\
      }\
    },\
    \"DetachDiskResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DetachInstancesFromLoadBalancerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"loadBalancerName\",\
        \"instanceNames\"\
      ],\
      \"members\":{\
        \"loadBalancerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the Lightsail load balancer.</p>\"\
        },\
        \"instanceNames\":{\
          \"shape\":\"ResourceNameList\",\
          \"documentation\":\"<p>An array of strings containing the names of the instances you want to detach from the load balancer.</p>\"\
        }\
      }\
    },\
    \"DetachInstancesFromLoadBalancerResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DetachStaticIpRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"staticIpName\"],\
      \"members\":{\
        \"staticIpName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the static IP to detach from the instance.</p>\"\
        }\
      }\
    },\
    \"DetachStaticIpResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"DisableAddOnRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"addOnType\",\
        \"resourceName\"\
      ],\
      \"members\":{\
        \"addOnType\":{\
          \"shape\":\"AddOnType\",\
          \"documentation\":\"<p>The add-on type to disable.</p>\"\
        },\
        \"resourceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the source resource for which to disable the add-on.</p>\"\
        }\
      }\
    },\
    \"DisableAddOnResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"Disk\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The unique name of the disk.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the disk.</p>\"\
        },\
        \"supportCode\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The date when the disk was created.</p>\"\
        },\
        \"location\":{\
          \"shape\":\"ResourceLocation\",\
          \"documentation\":\"<p>The AWS Region and Availability Zone where the disk is located.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The Lightsail resource type (e.g., <code>Disk</code>).</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags\\\">Lightsail Dev Guide</a>.</p>\"\
        },\
        \"addOns\":{\
          \"shape\":\"AddOnList\",\
          \"documentation\":\"<p>An array of objects representing the add-ons enabled on the disk.</p>\"\
        },\
        \"sizeInGb\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The size of the disk in GB.</p>\"\
        },\
        \"isSystemDisk\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether this disk is a system disk (has an operating system loaded on it).</p>\"\
        },\
        \"iops\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The input/output operations per second (IOPS) of the disk.</p>\"\
        },\
        \"path\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The disk path.</p>\"\
        },\
        \"state\":{\
          \"shape\":\"DiskState\",\
          \"documentation\":\"<p>Describes the status of the disk.</p>\"\
        },\
        \"attachedTo\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The resources to which the disk is attached.</p>\"\
        },\
        \"isAttached\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether the disk is attached.</p>\"\
        },\
        \"attachmentState\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>(Deprecated) The attachment state of the disk.</p> <note> <p>In releases prior to November 14, 2017, this parameter returned <code>attached</code> for system disks in the API response. It is now deprecated, but still included in the response. Use <code>isAttached</code> instead.</p> </note>\",\
          \"deprecated\":true\
        },\
        \"gbInUse\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>(Deprecated) The number of GB in use by the disk.</p> <note> <p>In releases prior to November 14, 2017, this parameter was not included in the API response. It is now deprecated.</p> </note>\",\
          \"deprecated\":true\
        }\
      },\
      \"documentation\":\"<p>Describes a system disk or a block storage disk.</p>\"\
    },\
    \"DiskInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The disk name.</p>\"\
        },\
        \"path\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The disk path.</p>\"\
        },\
        \"sizeInGb\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The size of the disk in GB (e.g., <code>32</code>).</p>\"\
        },\
        \"isSystemDisk\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether this disk is a system disk (has an operating system loaded on it).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a disk.</p>\"\
    },\
    \"DiskInfoList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DiskInfo\"}\
    },\
    \"DiskList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Disk\"}\
    },\
    \"DiskMap\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"originalDiskPath\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The original disk path exposed to the instance (for example, <code>/dev/sdh</code>).</p>\"\
        },\
        \"newDiskName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The new disk name (e.g., <code>my-new-disk</code>).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a block storage disk mapping.</p>\"\
    },\
    \"DiskMapList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DiskMap\"}\
    },\
    \"DiskSnapshot\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the disk snapshot (e.g., <code>my-disk-snapshot</code>).</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the disk snapshot.</p>\"\
        },\
        \"supportCode\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The date when the disk snapshot was created.</p>\"\
        },\
        \"location\":{\
          \"shape\":\"ResourceLocation\",\
          \"documentation\":\"<p>The AWS Region and Availability Zone where the disk snapshot was created.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The Lightsail resource type (e.g., <code>DiskSnapshot</code>).</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags\\\">Lightsail Dev Guide</a>.</p>\"\
        },\
        \"sizeInGb\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The size of the disk in GB.</p>\"\
        },\
        \"state\":{\
          \"shape\":\"DiskSnapshotState\",\
          \"documentation\":\"<p>The status of the disk snapshot operation.</p>\"\
        },\
        \"progress\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The progress of the disk snapshot operation.</p>\"\
        },\
        \"fromDiskName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The unique name of the source disk from which the disk snapshot was created.</p>\"\
        },\
        \"fromDiskArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the source disk from which the disk snapshot was created.</p>\"\
        },\
        \"fromInstanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The unique name of the source instance from which the disk (system volume) snapshot was created.</p>\"\
        },\
        \"fromInstanceArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the source instance from which the disk (system volume) snapshot was created.</p>\"\
        },\
        \"isFromAutoSnapshot\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether the snapshot was created from an automatic snapshot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a block storage disk snapshot.</p>\"\
    },\
    \"DiskSnapshotInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"sizeInGb\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The size of the disk in GB (e.g., <code>32</code>).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a disk snapshot.</p>\"\
    },\
    \"DiskSnapshotList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DiskSnapshot\"}\
    },\
    \"DiskSnapshotState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"pending\",\
        \"completed\",\
        \"error\",\
        \"unknown\"\
      ]\
    },\
    \"DiskState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"pending\",\
        \"error\",\
        \"available\",\
        \"in-use\",\
        \"unknown\"\
      ]\
    },\
    \"Domain\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the domain.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the domain recordset (e.g., <code>arn:aws:lightsail:global:123456789101:Domain/824cede0-abc7-4f84-8dbc-12345EXAMPLE</code>).</p>\"\
        },\
        \"supportCode\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The date when the domain recordset was created.</p>\"\
        },\
        \"location\":{\
          \"shape\":\"ResourceLocation\",\
          \"documentation\":\"<p>The AWS Region and Availability Zones where the domain recordset was created.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The resource type. </p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags\\\">Lightsail Dev Guide</a>.</p>\"\
        },\
        \"domainEntries\":{\
          \"shape\":\"DomainEntryList\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about the domain entries.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a domain where you are storing recordsets in Lightsail.</p>\"\
    },\
    \"DomainEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"id\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the domain recordset entry.</p>\"\
        },\
        \"name\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain.</p>\"\
        },\
        \"target\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The target AWS name server (e.g., <code>ns-111.awsdns-22.com.</code>).</p> <p>For Lightsail load balancers, the value looks like <code>ab1234c56789c6b86aba6fb203d443bc-123456789.us-east-2.elb.amazonaws.com</code>. Be sure to also set <code>isAlias</code> to <code>true</code> when setting up an A record for a load balancer.</p>\"\
        },\
        \"isAlias\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>When <code>true</code>, specifies whether the domain entry is an alias used by the Lightsail load balancer. You can include an alias (A type) record in your request, which points to a load balancer DNS name and routes traffic to your load balancer</p>\"\
        },\
        \"type\":{\
          \"shape\":\"DomainEntryType\",\
          \"documentation\":\"<p>The type of domain entry, such as address (A), canonical name (CNAME), mail exchanger (MX), name server (NS), start of authority (SOA), service locator (SRV), or text (TXT).</p> <p>The following domain entry types can be used:</p> <ul> <li> <p> <code>A</code> </p> </li> <li> <p> <code>CNAME</code> </p> </li> <li> <p> <code>MX</code> </p> </li> <li> <p> <code>NS</code> </p> </li> <li> <p> <code>SOA</code> </p> </li> <li> <p> <code>SRV</code> </p> </li> <li> <p> <code>TXT</code> </p> </li> </ul>\"\
        },\
        \"options\":{\
          \"shape\":\"DomainEntryOptions\",\
          \"documentation\":\"<p>(Deprecated) The options for the domain entry.</p> <note> <p>In releases prior to November 29, 2017, this parameter was not included in the API response. It is now deprecated.</p> </note>\",\
          \"deprecated\":true\
        }\
      },\
      \"documentation\":\"<p>Describes a domain recordset entry.</p>\"\
    },\
    \"DomainEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DomainEntry\"}\
    },\
    \"DomainEntryOptions\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"DomainEntryOptionsKeys\"},\
      \"value\":{\"shape\":\"string\"}\
    },\
    \"DomainEntryOptionsKeys\":{\"type\":\"string\"},\
    \"DomainEntryType\":{\"type\":\"string\"},\
    \"DomainList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Domain\"}\
    },\
    \"DomainName\":{\"type\":\"string\"},\
    \"DomainNameList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DomainName\"}\
    },\
    \"DownloadDefaultKeyPairRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DownloadDefaultKeyPairResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"publicKeyBase64\":{\
          \"shape\":\"Base64\",\
          \"documentation\":\"<p>A base64-encoded public key of the <code>ssh-rsa</code> type.</p>\"\
        },\
        \"privateKeyBase64\":{\
          \"shape\":\"Base64\",\
          \"documentation\":\"<p>A base64-encoded RSA private key.</p>\"\
        }\
      }\
    },\
    \"EnableAddOnRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceName\",\
        \"addOnRequest\"\
      ],\
      \"members\":{\
        \"resourceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the source resource for which to enable or modify the add-on.</p>\"\
        },\
        \"addOnRequest\":{\
          \"shape\":\"AddOnRequest\",\
          \"documentation\":\"<p>An array of strings representing the add-on to enable or modify.</p>\"\
        }\
      }\
    },\
    \"EnableAddOnResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"ExportSnapshotRecord\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The export snapshot record name.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the export snapshot record.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The date when the export snapshot record was created.</p>\"\
        },\
        \"location\":{\
          \"shape\":\"ResourceLocation\",\
          \"documentation\":\"<p>The AWS Region and Availability Zone where the export snapshot record is located.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The Lightsail resource type (e.g., <code>ExportSnapshotRecord</code>).</p>\"\
        },\
        \"state\":{\
          \"shape\":\"RecordState\",\
          \"documentation\":\"<p>The state of the export snapshot record.</p>\"\
        },\
        \"sourceInfo\":{\
          \"shape\":\"ExportSnapshotRecordSourceInfo\",\
          \"documentation\":\"<p>A list of objects describing the source of the export snapshot record.</p>\"\
        },\
        \"destinationInfo\":{\
          \"shape\":\"DestinationInfo\",\
          \"documentation\":\"<p>A list of objects describing the destination of the export snapshot record.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an export snapshot record.</p>\"\
    },\
    \"ExportSnapshotRecordList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ExportSnapshotRecord\"}\
    },\
    \"ExportSnapshotRecordSourceInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceType\":{\
          \"shape\":\"ExportSnapshotRecordSourceType\",\
          \"documentation\":\"<p>The Lightsail resource type (e.g., <code>InstanceSnapshot</code> or <code>DiskSnapshot</code>).</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The date when the source instance or disk snapshot was created.</p>\"\
        },\
        \"name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the source instance or disk snapshot.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the source instance or disk snapshot.</p>\"\
        },\
        \"fromResourceName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the snapshot's source instance or disk.</p>\"\
        },\
        \"fromResourceArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the snapshot's source instance or disk.</p>\"\
        },\
        \"instanceSnapshotInfo\":{\
          \"shape\":\"InstanceSnapshotInfo\",\
          \"documentation\":\"<p>A list of objects describing an instance snapshot.</p>\"\
        },\
        \"diskSnapshotInfo\":{\
          \"shape\":\"DiskSnapshotInfo\",\
          \"documentation\":\"<p>A list of objects describing a disk snapshot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the source of an export snapshot record.</p>\"\
    },\
    \"ExportSnapshotRecordSourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"InstanceSnapshot\",\
        \"DiskSnapshot\"\
      ]\
    },\
    \"ExportSnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"sourceSnapshotName\"],\
      \"members\":{\
        \"sourceSnapshotName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the instance or disk snapshot to be exported to Amazon EC2.</p>\"\
        }\
      }\
    },\
    \"ExportSnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"GetActiveNamesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetActiveNames</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetActiveNamesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"activeNames\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>The list of active names returned by the get active names request.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetActiveNames</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetAlarmsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"alarmName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the alarm.</p> <p>Specify an alarm name to return information about a specific alarm.</p>\"\
        },\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetAlarms</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        },\
        \"monitoredResourceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the Lightsail resource being monitored by the alarm.</p> <p>Specify a monitored resource name to return information about all alarms for a specific resource.</p>\"\
        }\
      }\
    },\
    \"GetAlarmsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"alarms\":{\
          \"shape\":\"AlarmsList\",\
          \"documentation\":\"<p>An array of objects that describe the alarms.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetAlarms</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetAutoSnapshotsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceName\"],\
      \"members\":{\
        \"resourceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the source instance or disk from which to get automatic snapshot information.</p>\"\
        }\
      }\
    },\
    \"GetAutoSnapshotsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the source instance or disk for the automatic snapshots.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The resource type (e.g., <code>Instance</code> or <code>Disk</code>).</p>\"\
        },\
        \"autoSnapshots\":{\
          \"shape\":\"AutoSnapshotDetailsList\",\
          \"documentation\":\"<p>An array of objects that describe the automatic snapshots that are available for the specified source instance or disk.</p>\"\
        }\
      }\
    },\
    \"GetBlueprintsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"includeInactive\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether to include inactive results in your request.</p>\"\
        },\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetBlueprints</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetBlueprintsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"blueprints\":{\
          \"shape\":\"BlueprintList\",\
          \"documentation\":\"<p>An array of key-value pairs that contains information about the available blueprints.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetBlueprints</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetBundlesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"includeInactive\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value that indicates whether to include inactive bundle results in your request.</p>\"\
        },\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetBundles</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetBundlesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"bundles\":{\
          \"shape\":\"BundleList\",\
          \"documentation\":\"<p>An array of key-value pairs that contains information about the available bundles.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetBundles</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetCloudFormationStackRecordsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetClouFormationStackRecords</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetCloudFormationStackRecordsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"cloudFormationStackRecords\":{\
          \"shape\":\"CloudFormationStackRecordList\",\
          \"documentation\":\"<p>A list of objects describing the CloudFormation stack records.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetCloudFormationStackRecords</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetContactMethodsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"protocols\":{\
          \"shape\":\"ContactProtocolsList\",\
          \"documentation\":\"<p>The protocols used to send notifications, such as <code>Email</code>, or <code>SMS</code> (text messaging).</p> <p>Specify a protocol in your request to return information about a specific contact method protocol.</p>\"\
        }\
      }\
    },\
    \"GetContactMethodsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"contactMethods\":{\
          \"shape\":\"ContactMethodsList\",\
          \"documentation\":\"<p>An array of objects that describe the contact methods.</p>\"\
        }\
      }\
    },\
    \"GetDiskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"diskName\"],\
      \"members\":{\
        \"diskName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the disk (e.g., <code>my-disk</code>).</p>\"\
        }\
      }\
    },\
    \"GetDiskResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"disk\":{\
          \"shape\":\"Disk\",\
          \"documentation\":\"<p>An object containing information about the disk.</p>\"\
        }\
      }\
    },\
    \"GetDiskSnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"diskSnapshotName\"],\
      \"members\":{\
        \"diskSnapshotName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the disk snapshot (e.g., <code>my-disk-snapshot</code>).</p>\"\
        }\
      }\
    },\
    \"GetDiskSnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"diskSnapshot\":{\
          \"shape\":\"DiskSnapshot\",\
          \"documentation\":\"<p>An object containing information about the disk snapshot.</p>\"\
        }\
      }\
    },\
    \"GetDiskSnapshotsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetDiskSnapshots</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetDiskSnapshotsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"diskSnapshots\":{\
          \"shape\":\"DiskSnapshotList\",\
          \"documentation\":\"<p>An array of objects containing information about all block storage disk snapshots.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetDiskSnapshots</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetDisksRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetDisks</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetDisksResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"disks\":{\
          \"shape\":\"DiskList\",\
          \"documentation\":\"<p>An array of objects containing information about all block storage disks.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetDisks</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"domainName\"],\
      \"members\":{\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The domain name for which your want to return information about.</p>\"\
        }\
      }\
    },\
    \"GetDomainResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"domain\":{\
          \"shape\":\"Domain\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about your get domain request.</p>\"\
        }\
      }\
    },\
    \"GetDomainsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetDomains</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetDomainsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"domains\":{\
          \"shape\":\"DomainList\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about each of the domain entries in the user's account.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetDomains</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetExportSnapshotRecordsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetExportSnapshotRecords</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetExportSnapshotRecordsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"exportSnapshotRecords\":{\
          \"shape\":\"ExportSnapshotRecordList\",\
          \"documentation\":\"<p>A list of objects describing the export snapshot records.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetExportSnapshotRecords</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetInstanceAccessDetailsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"instanceName\"],\
      \"members\":{\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the instance to access.</p>\"\
        },\
        \"protocol\":{\
          \"shape\":\"InstanceAccessProtocol\",\
          \"documentation\":\"<p>The protocol to use to connect to your instance. Defaults to <code>ssh</code>.</p>\"\
        }\
      }\
    },\
    \"GetInstanceAccessDetailsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"accessDetails\":{\
          \"shape\":\"InstanceAccessDetails\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about a get instance access request.</p>\"\
        }\
      }\
    },\
    \"GetInstanceMetricDataRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"instanceName\",\
        \"metricName\",\
        \"period\",\
        \"startTime\",\
        \"endTime\",\
        \"unit\",\
        \"statistics\"\
      ],\
      \"members\":{\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the instance for which you want to get metrics data.</p>\"\
        },\
        \"metricName\":{\
          \"shape\":\"InstanceMetricName\",\
          \"documentation\":\"<p>The metric for which you want to return information.</p> <p>Valid instance metric names are listed below, along with the most useful <code>statistics</code> to include in your request, and the published <code>unit</code> value.</p> <ul> <li> <p> <b> <code>CPUUtilization</code> </b> - The percentage of allocated compute units that are currently in use on the instance. This metric identifies the processing power to run the applications on the instance. Tools in your operating system can show a lower percentage than Lightsail when the instance is not allocated a full processor core.</p> <p> <code>Statistics</code>: The most useful statistics are <code>Maximum</code> and <code>Average</code>.</p> <p> <code>Unit</code>: The published unit is <code>Percent</code>.</p> </li> <li> <p> <b> <code>NetworkIn</code> </b> - The number of bytes received on all network interfaces by the instance. This metric identifies the volume of incoming network traffic to the instance. The number reported is the number of bytes received during the period. Because this metric is reported in 5-minute intervals, divide the reported number by 300 to find Bytes/second.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p> <p> <code>Unit</code>: The published unit is <code>Bytes</code>.</p> </li> <li> <p> <b> <code>NetworkOut</code> </b> - The number of bytes sent out on all network interfaces by the instance. This metric identifies the volume of outgoing network traffic from the instance. The number reported is the number of bytes sent during the period. Because this metric is reported in 5-minute intervals, divide the reported number by 300 to find Bytes/second.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p> <p> <code>Unit</code>: The published unit is <code>Bytes</code>.</p> </li> <li> <p> <b> <code>StatusCheckFailed</code> </b> - Reports whether the instance passed or failed both the instance status check and the system status check. This metric can be either 0 (passed) or 1 (failed). This metric data is available in 1-minute (60 seconds) granularity.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p> <p> <code>Unit</code>: The published unit is <code>Count</code>.</p> </li> <li> <p> <b> <code>StatusCheckFailed_Instance</code> </b> - Reports whether the instance passed or failed the instance status check. This metric can be either 0 (passed) or 1 (failed). This metric data is available in 1-minute (60 seconds) granularity.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p> <p> <code>Unit</code>: The published unit is <code>Count</code>.</p> </li> <li> <p> <b> <code>StatusCheckFailed_System</code> </b> - Reports whether the instance passed or failed the system status check. This metric can be either 0 (passed) or 1 (failed). This metric data is available in 1-minute (60 seconds) granularity.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p> <p> <code>Unit</code>: The published unit is <code>Count</code>.</p> </li> </ul>\"\
        },\
        \"period\":{\
          \"shape\":\"MetricPeriod\",\
          \"documentation\":\"<p>The granularity, in seconds, of the returned data points.</p> <p>The <code>StatusCheckFailed</code>, <code>StatusCheckFailed_Instance</code>, and <code>StatusCheckFailed_System</code> instance metric data is available in 1-minute (60 seconds) granularity. All other instance metric data is available in 5-minute (300 seconds) granularity.</p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The start time of the time period.</p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The end time of the time period.</p>\"\
        },\
        \"unit\":{\
          \"shape\":\"MetricUnit\",\
          \"documentation\":\"<p>The unit for the metric data request. Valid units depend on the metric data being requested. For the valid units to specify with each available metric, see the <code>metricName</code> parameter.</p>\"\
        },\
        \"statistics\":{\
          \"shape\":\"MetricStatisticList\",\
          \"documentation\":\"<p>The statistic for the metric.</p> <p>The following statistics are available:</p> <ul> <li> <p> <code>Minimum</code> - The lowest value observed during the specified period. Use this value to determine low volumes of activity for your application.</p> </li> <li> <p> <code>Maximum</code> - The highest value observed during the specified period. Use this value to determine high volumes of activity for your application.</p> </li> <li> <p> <code>Sum</code> - All values submitted for the matching metric added together. You can use this statistic to determine the total volume of a metric.</p> </li> <li> <p> <code>Average</code> - The value of Sum / SampleCount during the specified period. By comparing this statistic with the Minimum and Maximum values, you can determine the full scope of a metric and how close the average use is to the Minimum and Maximum values. This comparison helps you to know when to increase or decrease your resources.</p> </li> <li> <p> <code>SampleCount</code> - The count, or number, of data points used for the statistical calculation.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"GetInstanceMetricDataResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"InstanceMetricName\",\
          \"documentation\":\"<p>The metric name to return data for.</p>\"\
        },\
        \"metricData\":{\
          \"shape\":\"MetricDatapointList\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about the results of your get instance metric data request.</p>\"\
        }\
      }\
    },\
    \"GetInstancePortStatesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"instanceName\"],\
      \"members\":{\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the instance for which to return firewall port states.</p>\"\
        }\
      }\
    },\
    \"GetInstancePortStatesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"portStates\":{\
          \"shape\":\"InstancePortStateList\",\
          \"documentation\":\"<p>An array of objects that describe the firewall port states for the specified instance.</p>\"\
        }\
      }\
    },\
    \"GetInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"instanceName\"],\
      \"members\":{\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the instance.</p>\"\
        }\
      }\
    },\
    \"GetInstanceResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"instance\":{\
          \"shape\":\"Instance\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about the specified instance.</p>\"\
        }\
      }\
    },\
    \"GetInstanceSnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"instanceSnapshotName\"],\
      \"members\":{\
        \"instanceSnapshotName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the snapshot for which you are requesting information.</p>\"\
        }\
      }\
    },\
    \"GetInstanceSnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"instanceSnapshot\":{\
          \"shape\":\"InstanceSnapshot\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about the results of your get instance snapshot request.</p>\"\
        }\
      }\
    },\
    \"GetInstanceSnapshotsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetInstanceSnapshots</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetInstanceSnapshotsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"instanceSnapshots\":{\
          \"shape\":\"InstanceSnapshotList\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about the results of your get instance snapshots request.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetInstanceSnapshots</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetInstanceStateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"instanceName\"],\
      \"members\":{\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the instance to get state information about.</p>\"\
        }\
      }\
    },\
    \"GetInstanceStateResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"state\":{\
          \"shape\":\"InstanceState\",\
          \"documentation\":\"<p>The state of the instance.</p>\"\
        }\
      }\
    },\
    \"GetInstancesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetInstances</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetInstancesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"instances\":{\
          \"shape\":\"InstanceList\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about your instances.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetInstances</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetKeyPairRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"keyPairName\"],\
      \"members\":{\
        \"keyPairName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the key pair for which you are requesting information.</p>\"\
        }\
      }\
    },\
    \"GetKeyPairResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"keyPair\":{\
          \"shape\":\"KeyPair\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about the key pair.</p>\"\
        }\
      }\
    },\
    \"GetKeyPairsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetKeyPairs</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetKeyPairsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"keyPairs\":{\
          \"shape\":\"KeyPairList\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about the key pairs.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetKeyPairs</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetLoadBalancerMetricDataRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"loadBalancerName\",\
        \"metricName\",\
        \"period\",\
        \"startTime\",\
        \"endTime\",\
        \"unit\",\
        \"statistics\"\
      ],\
      \"members\":{\
        \"loadBalancerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"metricName\":{\
          \"shape\":\"LoadBalancerMetricName\",\
          \"documentation\":\"<p>The metric for which you want to return information.</p> <p>Valid load balancer metric names are listed below, along with the most useful <code>statistics</code> to include in your request, and the published <code>unit</code> value.</p> <ul> <li> <p> <b> <code>ClientTLSNegotiationErrorCount</code> </b> - The number of TLS connections initiated by the client that did not establish a session with the load balancer due to a TLS error generated by the load balancer. Possible causes include a mismatch of ciphers or protocols.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p> <p> <code>Unit</code>: The published unit is <code>Count</code>.</p> </li> <li> <p> <b> <code>HealthyHostCount</code> </b> - The number of target instances that are considered healthy.</p> <p> <code>Statistics</code>: The most useful statistic are <code>Average</code>, <code>Minimum</code>, and <code>Maximum</code>.</p> <p> <code>Unit</code>: The published unit is <code>Count</code>.</p> </li> <li> <p> <b> <code>HTTPCode_Instance_2XX_Count</code> </b> - The number of HTTP 2XX response codes generated by the target instances. This does not include any response codes generated by the load balancer.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p> <p> <code>Unit</code>: The published unit is <code>Count</code>.</p> </li> <li> <p> <b> <code>HTTPCode_Instance_3XX_Count</code> </b> - The number of HTTP 3XX response codes generated by the target instances. This does not include any response codes generated by the load balancer.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p> <p> <code>Unit</code>: The published unit is <code>Count</code>.</p> </li> <li> <p> <b> <code>HTTPCode_Instance_4XX_Count</code> </b> - The number of HTTP 4XX response codes generated by the target instances. This does not include any response codes generated by the load balancer.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p> <p> <code>Unit</code>: The published unit is <code>Count</code>.</p> </li> <li> <p> <b> <code>HTTPCode_Instance_5XX_Count</code> </b> - The number of HTTP 5XX response codes generated by the target instances. This does not include any response codes generated by the load balancer.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p> <p> <code>Unit</code>: The published unit is <code>Count</code>.</p> </li> <li> <p> <b> <code>HTTPCode_LB_4XX_Count</code> </b> - The number of HTTP 4XX client error codes that originated from the load balancer. Client errors are generated when requests are malformed or incomplete. These requests were not received by the target instance. This count does not include response codes generated by the target instances.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p> <p> <code>Unit</code>: The published unit is <code>Count</code>.</p> </li> <li> <p> <b> <code>HTTPCode_LB_5XX_Count</code> </b> - The number of HTTP 5XX server error codes that originated from the load balancer. This does not include any response codes generated by the target instance. This metric is reported if there are no healthy instances attached to the load balancer, or if the request rate exceeds the capacity of the instances (spillover) or the load balancer.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p> <p> <code>Unit</code>: The published unit is <code>Count</code>.</p> </li> <li> <p> <b> <code>InstanceResponseTime</code> </b> - The time elapsed, in seconds, after the request leaves the load balancer until a response from the target instance is received.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Average</code>.</p> <p> <code>Unit</code>: The published unit is <code>Seconds</code>.</p> </li> <li> <p> <b> <code>RejectedConnectionCount</code> </b> - The number of connections that were rejected because the load balancer had reached its maximum number of connections.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p> <p> <code>Unit</code>: The published unit is <code>Count</code>.</p> </li> <li> <p> <b> <code>RequestCount</code> </b> - The number of requests processed over IPv4. This count includes only the requests with a response generated by a target instance of the load balancer.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p> <p> <code>Unit</code>: The published unit is <code>Count</code>.</p> </li> <li> <p> <b> <code>UnhealthyHostCount</code> </b> - The number of target instances that are considered unhealthy.</p> <p> <code>Statistics</code>: The most useful statistic are <code>Average</code>, <code>Minimum</code>, and <code>Maximum</code>.</p> <p> <code>Unit</code>: The published unit is <code>Count</code>.</p> </li> </ul>\"\
        },\
        \"period\":{\
          \"shape\":\"MetricPeriod\",\
          \"documentation\":\"<p>The granularity, in seconds, of the returned data points.</p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The start time of the period.</p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The end time of the period.</p>\"\
        },\
        \"unit\":{\
          \"shape\":\"MetricUnit\",\
          \"documentation\":\"<p>The unit for the metric data request. Valid units depend on the metric data being required. For the valid units with each available metric, see the <code>metricName</code> parameter.</p>\"\
        },\
        \"statistics\":{\
          \"shape\":\"MetricStatisticList\",\
          \"documentation\":\"<p>The statistic for the metric.</p> <p>The following statistics are available:</p> <ul> <li> <p> <code>Minimum</code> - The lowest value observed during the specified period. Use this value to determine low volumes of activity for your application.</p> </li> <li> <p> <code>Maximum</code> - The highest value observed during the specified period. Use this value to determine high volumes of activity for your application.</p> </li> <li> <p> <code>Sum</code> - All values submitted for the matching metric added together. You can use this statistic to determine the total volume of a metric.</p> </li> <li> <p> <code>Average</code> - The value of Sum / SampleCount during the specified period. By comparing this statistic with the Minimum and Maximum values, you can determine the full scope of a metric and how close the average use is to the Minimum and Maximum values. This comparison helps you to know when to increase or decrease your resources.</p> </li> <li> <p> <code>SampleCount</code> - The count, or number, of data points used for the statistical calculation.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"GetLoadBalancerMetricDataResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"LoadBalancerMetricName\",\
          \"documentation\":\"<p>The metric about which you are receiving information. Valid values are listed below, along with the most useful <code>statistics</code> to include in your request.</p> <ul> <li> <p> <b> <code>ClientTLSNegotiationErrorCount</code> </b> - The number of TLS connections initiated by the client that did not establish a session with the load balancer. Possible causes include a mismatch of ciphers or protocols.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p> </li> <li> <p> <b> <code>HealthyHostCount</code> </b> - The number of target instances that are considered healthy.</p> <p> <code>Statistics</code>: The most useful statistic are <code>Average</code>, <code>Minimum</code>, and <code>Maximum</code>.</p> </li> <li> <p> <b> <code>UnhealthyHostCount</code> </b> - The number of target instances that are considered unhealthy.</p> <p> <code>Statistics</code>: The most useful statistic are <code>Average</code>, <code>Minimum</code>, and <code>Maximum</code>.</p> </li> <li> <p> <b> <code>HTTPCode_LB_4XX_Count</code> </b> - The number of HTTP 4XX client error codes that originate from the load balancer. Client errors are generated when requests are malformed or incomplete. These requests have not been received by the target instance. This count does not include any response codes generated by the target instances.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p> </li> <li> <p> <b> <code>HTTPCode_LB_5XX_Count</code> </b> - The number of HTTP 5XX server error codes that originate from the load balancer. This count does not include any response codes generated by the target instances.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p> </li> <li> <p> <b> <code>HTTPCode_Instance_2XX_Count</code> </b> - The number of HTTP response codes generated by the target instances. This does not include any response codes generated by the load balancer.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p> </li> <li> <p> <b> <code>HTTPCode_Instance_3XX_Count</code> </b> - The number of HTTP response codes generated by the target instances. This does not include any response codes generated by the load balancer. </p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p> </li> <li> <p> <b> <code>HTTPCode_Instance_4XX_Count</code> </b> - The number of HTTP response codes generated by the target instances. This does not include any response codes generated by the load balancer.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p> </li> <li> <p> <b> <code>HTTPCode_Instance_5XX_Count</code> </b> - The number of HTTP response codes generated by the target instances. This does not include any response codes generated by the load balancer.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p> </li> <li> <p> <b> <code>InstanceResponseTime</code> </b> - The time elapsed, in seconds, after the request leaves the load balancer until a response from the target instance is received.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Average</code>.</p> </li> <li> <p> <b> <code>RejectedConnectionCount</code> </b> - The number of connections that were rejected because the load balancer had reached its maximum number of connections.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p> </li> <li> <p> <b> <code>RequestCount</code> </b> - The number of requests processed over IPv4. This count includes only the requests with a response generated by a target instance of the load balancer.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p> </li> </ul>\"\
        },\
        \"metricData\":{\
          \"shape\":\"MetricDatapointList\",\
          \"documentation\":\"<p>An array of metric datapoint objects.</p>\"\
        }\
      }\
    },\
    \"GetLoadBalancerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"loadBalancerName\"],\
      \"members\":{\
        \"loadBalancerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        }\
      }\
    },\
    \"GetLoadBalancerResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"loadBalancer\":{\
          \"shape\":\"LoadBalancer\",\
          \"documentation\":\"<p>An object containing information about your load balancer.</p>\"\
        }\
      }\
    },\
    \"GetLoadBalancerTlsCertificatesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"loadBalancerName\"],\
      \"members\":{\
        \"loadBalancerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the load balancer you associated with your SSL/TLS certificate.</p>\"\
        }\
      }\
    },\
    \"GetLoadBalancerTlsCertificatesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tlsCertificates\":{\
          \"shape\":\"LoadBalancerTlsCertificateList\",\
          \"documentation\":\"<p>An array of LoadBalancerTlsCertificate objects describing your SSL/TLS certificates.</p>\"\
        }\
      }\
    },\
    \"GetLoadBalancersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetLoadBalancers</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetLoadBalancersResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"loadBalancers\":{\
          \"shape\":\"LoadBalancerList\",\
          \"documentation\":\"<p>An array of LoadBalancer objects describing your load balancers.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetLoadBalancers</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetOperationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"operationId\"],\
      \"members\":{\
        \"operationId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A GUID used to identify the operation.</p>\"\
        }\
      }\
    },\
    \"GetOperationResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operation\":{\
          \"shape\":\"Operation\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"GetOperationsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceName\"],\
      \"members\":{\
        \"resourceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the resource for which you are requesting information.</p>\"\
        },\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetOperationsForResource</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetOperationsForResourceResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        },\
        \"nextPageCount\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>(Deprecated) Returns the number of pages of results that remain.</p> <note> <p>In releases prior to June 12, 2017, this parameter returned <code>null</code> by the API. It is now deprecated, and the API returns the <code>next page token</code> parameter instead.</p> </note>\",\
          \"deprecated\":true\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetOperationsForResource</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetOperationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetOperations</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetOperationsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetOperations</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetRegionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"includeAvailabilityZones\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether to also include Availability Zones in your get regions request. Availability Zones are indicated with a letter: e.g., <code>us-east-2a</code>.</p>\"\
        },\
        \"includeRelationalDatabaseAvailabilityZones\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>&gt;A Boolean value indicating whether to also include Availability Zones for databases in your get regions request. Availability Zones are indicated with a letter (e.g., <code>us-east-2a</code>).</p>\"\
        }\
      }\
    },\
    \"GetRegionsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"regions\":{\
          \"shape\":\"RegionList\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about your get regions request.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseBlueprintsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetRelationalDatabaseBlueprints</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseBlueprintsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"blueprints\":{\
          \"shape\":\"RelationalDatabaseBlueprintList\",\
          \"documentation\":\"<p>An object describing the result of your get relational database blueprints request.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetRelationalDatabaseBlueprints</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseBundlesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetRelationalDatabaseBundles</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseBundlesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"bundles\":{\
          \"shape\":\"RelationalDatabaseBundleList\",\
          \"documentation\":\"<p>An object describing the result of your get relational database bundles request.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetRelationalDatabaseBundles</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseEventsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"relationalDatabaseName\"],\
      \"members\":{\
        \"relationalDatabaseName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the database from which to get events.</p>\"\
        },\
        \"durationInMinutes\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The number of minutes in the past from which to retrieve events. For example, to get all events from the past 2 hours, enter 120.</p> <p>Default: <code>60</code> </p> <p>The minimum is 1 and the maximum is 14 days (20160 minutes).</p>\"\
        },\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetRelationalDatabaseEvents</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseEventsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"relationalDatabaseEvents\":{\
          \"shape\":\"RelationalDatabaseEventList\",\
          \"documentation\":\"<p>An object describing the result of your get relational database events request.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetRelationalDatabaseEvents</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseLogEventsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"relationalDatabaseName\",\
        \"logStreamName\"\
      ],\
      \"members\":{\
        \"relationalDatabaseName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of your database for which to get log events.</p>\"\
        },\
        \"logStreamName\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The name of the log stream.</p> <p>Use the <code>get relational database log streams</code> operation to get a list of available log streams.</p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The start of the time interval from which to get log events.</p> <p>Constraints:</p> <ul> <li> <p>Specified in Coordinated Universal Time (UTC).</p> </li> <li> <p>Specified in the Unix time format.</p> <p>For example, if you wish to use a start time of October 1, 2018, at 8 PM UTC, then you input <code>1538424000</code> as the start time.</p> </li> </ul>\"\
        },\
        \"endTime\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The end of the time interval from which to get log events.</p> <p>Constraints:</p> <ul> <li> <p>Specified in Coordinated Universal Time (UTC).</p> </li> <li> <p>Specified in the Unix time format.</p> <p>For example, if you wish to use an end time of October 1, 2018, at 8 PM UTC, then you input <code>1538424000</code> as the end time.</p> </li> </ul>\"\
        },\
        \"startFromHead\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>Parameter to specify if the log should start from head or tail. If <code>true</code> is specified, the log event starts from the head of the log. If <code>false</code> is specified, the log event starts from the tail of the log.</p> <note> <p>For PostgreSQL, the default value of <code>false</code> is the only option available.</p> </note>\"\
        },\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next or previous page of results from your request.</p> <p>To get a page token, perform an initial <code>GetRelationalDatabaseLogEvents</code> request. If your results are paginated, the response will return a next forward token and/or next backward token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseLogEventsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceLogEvents\":{\
          \"shape\":\"LogEventList\",\
          \"documentation\":\"<p>An object describing the result of your get relational database log events request.</p>\"\
        },\
        \"nextBackwardToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A token used for advancing to the previous page of results from your get relational database log events request.</p>\"\
        },\
        \"nextForwardToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A token used for advancing to the next page of results from your get relational database log events request.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseLogStreamsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"relationalDatabaseName\"],\
      \"members\":{\
        \"relationalDatabaseName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of your database for which to get log streams.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseLogStreamsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logStreams\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>An object describing the result of your get relational database log streams request.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseMasterUserPasswordRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"relationalDatabaseName\"],\
      \"members\":{\
        \"relationalDatabaseName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of your database for which to get the master user password.</p>\"\
        },\
        \"passwordVersion\":{\
          \"shape\":\"RelationalDatabasePasswordVersion\",\
          \"documentation\":\"<p>The password version to return.</p> <p>Specifying <code>CURRENT</code> or <code>PREVIOUS</code> returns the current or previous passwords respectively. Specifying <code>PENDING</code> returns the newest version of the password that will rotate to <code>CURRENT</code>. After the <code>PENDING</code> password rotates to <code>CURRENT</code>, the <code>PENDING</code> password is no longer available.</p> <p>Default: <code>CURRENT</code> </p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseMasterUserPasswordResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"masterUserPassword\":{\
          \"shape\":\"SensitiveString\",\
          \"documentation\":\"<p>The master user password for the <code>password version</code> specified.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The timestamp when the specified version of the master user password was created.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseMetricDataRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"relationalDatabaseName\",\
        \"metricName\",\
        \"period\",\
        \"startTime\",\
        \"endTime\",\
        \"unit\",\
        \"statistics\"\
      ],\
      \"members\":{\
        \"relationalDatabaseName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of your database from which to get metric data.</p>\"\
        },\
        \"metricName\":{\
          \"shape\":\"RelationalDatabaseMetricName\",\
          \"documentation\":\"<p>The metric for which you want to return information.</p> <p>Valid relational database metric names are listed below, along with the most useful <code>statistics</code> to include in your request, and the published <code>unit</code> value. All relational database metric data is available in 1-minute (60 seconds) granularity.</p> <ul> <li> <p> <b> <code>CPUUtilization</code> </b> - The percentage of CPU utilization currently in use on the database.</p> <p> <code>Statistics</code>: The most useful statistics are <code>Maximum</code> and <code>Average</code>.</p> <p> <code>Unit</code>: The published unit is <code>Percent</code>.</p> </li> <li> <p> <b> <code>DatabaseConnections</code> </b> - The number of database connections in use.</p> <p> <code>Statistics</code>: The most useful statistics are <code>Maximum</code> and <code>Sum</code>.</p> <p> <code>Unit</code>: The published unit is <code>Count</code>.</p> </li> <li> <p> <b> <code>DiskQueueDepth</code> </b> - The number of outstanding IOs (read/write requests) that are waiting to access the disk.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p> <p> <code>Unit</code>: The published unit is <code>Count</code>.</p> </li> <li> <p> <b> <code>FreeStorageSpace</code> </b> - The amount of available storage space.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p> <p> <code>Unit</code>: The published unit is <code>Bytes</code>.</p> </li> <li> <p> <b> <code>NetworkReceiveThroughput</code> </b> - The incoming (Receive) network traffic on the database, including both customer database traffic and AWS traffic used for monitoring and replication.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Average</code>.</p> <p> <code>Unit</code>: The published unit is <code>Bytes/Second</code>.</p> </li> <li> <p> <b> <code>NetworkTransmitThroughput</code> </b> - The outgoing (Transmit) network traffic on the database, including both customer database traffic and AWS traffic used for monitoring and replication.</p> <p> <code>Statistics</code>: The most useful statistic is <code>Average</code>.</p> <p> <code>Unit</code>: The published unit is <code>Bytes/Second</code>.</p> </li> </ul>\"\
        },\
        \"period\":{\
          \"shape\":\"MetricPeriod\",\
          \"documentation\":\"<p>The granularity, in seconds, of the returned data points.</p> <p>All relational database metric data is available in 1-minute (60 seconds) granularity.</p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The start of the time interval from which to get metric data.</p> <p>Constraints:</p> <ul> <li> <p>Specified in Coordinated Universal Time (UTC).</p> </li> <li> <p>Specified in the Unix time format.</p> <p>For example, if you wish to use a start time of October 1, 2018, at 8 PM UTC, then you input <code>1538424000</code> as the start time.</p> </li> </ul>\"\
        },\
        \"endTime\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The end of the time interval from which to get metric data.</p> <p>Constraints:</p> <ul> <li> <p>Specified in Coordinated Universal Time (UTC).</p> </li> <li> <p>Specified in the Unix time format.</p> <p>For example, if you wish to use an end time of October 1, 2018, at 8 PM UTC, then you input <code>1538424000</code> as the end time.</p> </li> </ul>\"\
        },\
        \"unit\":{\
          \"shape\":\"MetricUnit\",\
          \"documentation\":\"<p>The unit for the metric data request. Valid units depend on the metric data being required. For the valid units with each available metric, see the <code>metricName</code> parameter.</p>\"\
        },\
        \"statistics\":{\
          \"shape\":\"MetricStatisticList\",\
          \"documentation\":\"<p>The statistic for the metric.</p> <p>The following statistics are available:</p> <ul> <li> <p> <code>Minimum</code> - The lowest value observed during the specified period. Use this value to determine low volumes of activity for your application.</p> </li> <li> <p> <code>Maximum</code> - The highest value observed during the specified period. Use this value to determine high volumes of activity for your application.</p> </li> <li> <p> <code>Sum</code> - All values submitted for the matching metric added together. You can use this statistic to determine the total volume of a metric.</p> </li> <li> <p> <code>Average</code> - The value of Sum / SampleCount during the specified period. By comparing this statistic with the Minimum and Maximum values, you can determine the full scope of a metric and how close the average use is to the Minimum and Maximum values. This comparison helps you to know when to increase or decrease your resources.</p> </li> <li> <p> <code>SampleCount</code> - The count, or number, of data points used for the statistical calculation.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseMetricDataResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"RelationalDatabaseMetricName\",\
          \"documentation\":\"<p>The name of the metric.</p>\"\
        },\
        \"metricData\":{\
          \"shape\":\"MetricDatapointList\",\
          \"documentation\":\"<p>An object describing the result of your get relational database metric data request.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseParametersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"relationalDatabaseName\"],\
      \"members\":{\
        \"relationalDatabaseName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of your database for which to get parameters.</p>\"\
        },\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetRelationalDatabaseParameters</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseParametersResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"parameters\":{\
          \"shape\":\"RelationalDatabaseParameterList\",\
          \"documentation\":\"<p>An object describing the result of your get relational database parameters request.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetRelationalDatabaseParameters</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"relationalDatabaseName\"],\
      \"members\":{\
        \"relationalDatabaseName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the database that you are looking up.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"relationalDatabase\":{\
          \"shape\":\"RelationalDatabase\",\
          \"documentation\":\"<p>An object describing the specified database.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseSnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"relationalDatabaseSnapshotName\"],\
      \"members\":{\
        \"relationalDatabaseSnapshotName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the database snapshot for which to get information.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseSnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"relationalDatabaseSnapshot\":{\
          \"shape\":\"RelationalDatabaseSnapshot\",\
          \"documentation\":\"<p>An object describing the specified database snapshot.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseSnapshotsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetRelationalDatabaseSnapshots</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabaseSnapshotsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"relationalDatabaseSnapshots\":{\
          \"shape\":\"RelationalDatabaseSnapshotList\",\
          \"documentation\":\"<p>An object describing the result of your get relational database snapshots request.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetRelationalDatabaseSnapshots</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabasesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetRelationalDatabases</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetRelationalDatabasesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"relationalDatabases\":{\
          \"shape\":\"RelationalDatabaseList\",\
          \"documentation\":\"<p>An object describing the result of your get relational databases request.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetRelationalDatabases</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"GetStaticIpRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"staticIpName\"],\
      \"members\":{\
        \"staticIpName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the static IP in Lightsail.</p>\"\
        }\
      }\
    },\
    \"GetStaticIpResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"staticIp\":{\
          \"shape\":\"StaticIp\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about the requested static IP.</p>\"\
        }\
      }\
    },\
    \"GetStaticIpsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of results from your request.</p> <p>To get a page token, perform an initial <code>GetStaticIps</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>\"\
        }\
      }\
    },\
    \"GetStaticIpsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"staticIps\":{\
          \"shape\":\"StaticIpList\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about your get static IPs request.</p>\"\
        },\
        \"nextPageToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token to advance to the next page of resutls from your request.</p> <p>A next page token is not returned if there are no more results to display.</p> <p>To get the next page of results, perform another <code>GetStaticIps</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>\"\
        }\
      }\
    },\
    \"HostKeyAttributes\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"algorithm\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The SSH host key algorithm or the RDP certificate format.</p> <p>For SSH host keys, the algorithm may be <code>ssh-rsa</code>, <code>ecdsa-sha2-nistp256</code>, <code>ssh-ed25519</code>, etc. For RDP certificates, the algorithm is always <code>x509-cert</code>.</p>\"\
        },\
        \"publicKey\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The public SSH host key or the RDP certificate.</p>\"\
        },\
        \"witnessedAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The time that the SSH host key or RDP certificate was recorded by Lightsail.</p>\"\
        },\
        \"fingerprintSHA1\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The SHA-1 fingerprint of the returned SSH host key or RDP certificate.</p> <ul> <li> <p>Example of an SHA-1 SSH fingerprint:</p> <p> <code>SHA1:1CHH6FaAaXjtFOsR/t83vf91SR0</code> </p> </li> <li> <p>Example of an SHA-1 RDP fingerprint:</p> <p> <code>af:34:51:fe:09:f0:e0:da:b8:4e:56:ca:60:c2:10:ff:38:06:db:45</code> </p> </li> </ul>\"\
        },\
        \"fingerprintSHA256\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The SHA-256 fingerprint of the returned SSH host key or RDP certificate.</p> <ul> <li> <p>Example of an SHA-256 SSH fingerprint:</p> <p> <code>SHA256:KTsMnRBh1IhD17HpdfsbzeGA4jOijm5tyXsMjKVbB8o</code> </p> </li> <li> <p>Example of an SHA-256 RDP fingerprint:</p> <p> <code>03:9b:36:9f:4b:de:4e:61:70:fc:7c:c9:78:e7:d2:1a:1c:25:a8:0c:91:f6:7c:e4:d6:a0:85:c8:b4:53:99:68</code> </p> </li> </ul>\"\
        },\
        \"notValidBefore\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The returned RDP certificate is valid after this point in time.</p> <p>This value is listed only for RDP certificates.</p>\"\
        },\
        \"notValidAfter\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The returned RDP certificate is not valid after this point in time.</p> <p>This value is listed only for RDP certificates.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the public SSH host keys or the RDP certificate.</p>\"\
    },\
    \"HostKeysList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HostKeyAttributes\"}\
    },\
    \"ImportKeyPairRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"keyPairName\",\
        \"publicKeyBase64\"\
      ],\
      \"members\":{\
        \"keyPairName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the key pair for which you want to import the public key.</p>\"\
        },\
        \"publicKeyBase64\":{\
          \"shape\":\"Base64\",\
          \"documentation\":\"<p>A base64-encoded public key of the <code>ssh-rsa</code> type.</p>\"\
        }\
      }\
    },\
    \"ImportKeyPairResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operation\":{\
          \"shape\":\"Operation\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"Instance\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name the user gave the instance (e.g., <code>Amazon_Linux-1GB-Ohio-1</code>).</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the instance (e.g., <code>arn:aws:lightsail:us-east-2:123456789101:Instance/244ad76f-8aad-4741-809f-12345EXAMPLE</code>).</p>\"\
        },\
        \"supportCode\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The timestamp when the instance was created (e.g., <code>1479734909.17</code>).</p>\"\
        },\
        \"location\":{\
          \"shape\":\"ResourceLocation\",\
          \"documentation\":\"<p>The region name and Availability Zone where the instance is located.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of resource (usually <code>Instance</code>).</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags\\\">Lightsail Dev Guide</a>.</p>\"\
        },\
        \"blueprintId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The blueprint ID (e.g., <code>os_amlinux_2016_03</code>).</p>\"\
        },\
        \"blueprintName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The friendly name of the blueprint (e.g., <code>Amazon Linux</code>).</p>\"\
        },\
        \"bundleId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The bundle for the instance (e.g., <code>micro_1_0</code>).</p>\"\
        },\
        \"addOns\":{\
          \"shape\":\"AddOnList\",\
          \"documentation\":\"<p>An array of objects representing the add-ons enabled on the instance.</p>\"\
        },\
        \"isStaticIp\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether this instance has a static IP assigned to it.</p>\"\
        },\
        \"privateIpAddress\":{\
          \"shape\":\"IpAddress\",\
          \"documentation\":\"<p>The private IP address of the instance.</p>\"\
        },\
        \"publicIpAddress\":{\
          \"shape\":\"IpAddress\",\
          \"documentation\":\"<p>The public IP address of the instance.</p>\"\
        },\
        \"ipv6Address\":{\
          \"shape\":\"IpV6Address\",\
          \"documentation\":\"<p>The IPv6 address of the instance.</p>\"\
        },\
        \"hardware\":{\
          \"shape\":\"InstanceHardware\",\
          \"documentation\":\"<p>The size of the vCPU and the amount of RAM for the instance.</p>\"\
        },\
        \"networking\":{\
          \"shape\":\"InstanceNetworking\",\
          \"documentation\":\"<p>Information about the public ports and monthly data transfer rates for the instance.</p>\"\
        },\
        \"state\":{\
          \"shape\":\"InstanceState\",\
          \"documentation\":\"<p>The status code and the state (e.g., <code>running</code>) for the instance.</p>\"\
        },\
        \"username\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The user name for connecting to the instance (e.g., <code>ec2-user</code>).</p>\"\
        },\
        \"sshKeyName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the SSH key being used to connect to the instance (e.g., <code>LightsailDefaultKeyPair</code>).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an instance (a virtual private server).</p>\"\
    },\
    \"InstanceAccessDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certKey\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>For SSH access, the public key to use when accessing your instance For OpenSSH clients (e.g., command line SSH), you should save this value to <code>tempkey-cert.pub</code>.</p>\"\
        },\
        \"expiresAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>For SSH access, the date on which the temporary keys expire.</p>\"\
        },\
        \"ipAddress\":{\
          \"shape\":\"IpAddress\",\
          \"documentation\":\"<p>The public IP address of the Amazon Lightsail instance.</p>\"\
        },\
        \"password\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>For RDP access, the password for your Amazon Lightsail instance. Password will be an empty string if the password for your new instance is not ready yet. When you create an instance, it can take up to 15 minutes for the instance to be ready.</p> <note> <p>If you create an instance using any key pair other than the default (<code>LightsailDefaultKeyPair</code>), <code>password</code> will always be an empty string.</p> <p>If you change the Administrator password on the instance, Lightsail will continue to return the original password value. When accessing the instance using RDP, you need to manually enter the Administrator password after changing it from the default.</p> </note>\"\
        },\
        \"passwordData\":{\
          \"shape\":\"PasswordData\",\
          \"documentation\":\"<p>For a Windows Server-based instance, an object with the data you can use to retrieve your password. This is only needed if <code>password</code> is empty and the instance is not new (and therefore the password is not ready yet). When you create an instance, it can take up to 15 minutes for the instance to be ready.</p>\"\
        },\
        \"privateKey\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>For SSH access, the temporary private key. For OpenSSH clients (e.g., command line SSH), you should save this value to <code>tempkey</code>).</p>\"\
        },\
        \"protocol\":{\
          \"shape\":\"InstanceAccessProtocol\",\
          \"documentation\":\"<p>The protocol for these Amazon Lightsail instance access details.</p>\"\
        },\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of this Amazon Lightsail instance.</p>\"\
        },\
        \"username\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The user name to use when logging in to the Amazon Lightsail instance.</p>\"\
        },\
        \"hostKeys\":{\
          \"shape\":\"HostKeysList\",\
          \"documentation\":\"<p>Describes the public SSH host keys or the RDP certificate.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The parameters for gaining temporary access to one of your Amazon Lightsail instances.</p>\"\
    },\
    \"InstanceAccessProtocol\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ssh\",\
        \"rdp\"\
      ]\
    },\
    \"InstanceEntry\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"sourceName\",\
        \"instanceType\",\
        \"portInfoSource\",\
        \"availabilityZone\"\
      ],\
      \"members\":{\
        \"sourceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the export snapshot record, which contains the exported Lightsail instance snapshot that will be used as the source of the new Amazon EC2 instance.</p> <p>Use the <code>get export snapshot records</code> operation to get a list of export snapshot records that you can use to create a CloudFormation stack.</p>\"\
        },\
        \"instanceType\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The instance type (e.g., <code>t2.micro</code>) to use for the new Amazon EC2 instance.</p>\"\
        },\
        \"portInfoSource\":{\
          \"shape\":\"PortInfoSourceType\",\
          \"documentation\":\"<p>The port configuration to use for the new Amazon EC2 instance.</p> <p>The following configuration options are available:</p> <ul> <li> <p> <code>DEFAULT</code> - Use the default firewall settings from the Lightsail instance blueprint.</p> </li> <li> <p> <code>INSTANCE</code> - Use the configured firewall settings from the source Lightsail instance.</p> </li> <li> <p> <code>NONE</code> - Use the default Amazon EC2 security group.</p> </li> <li> <p> <code>CLOSED</code> - All ports closed.</p> </li> </ul> <note> <p>If you configured <code>lightsail-connect</code> as a <code>cidrListAliases</code> on your instance, or if you chose to allow the Lightsail browser-based SSH or RDP clients to connect to your instance, that configuration is not carried over to your new Amazon EC2 instance.</p> </note>\"\
        },\
        \"userData\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A launch script you can create that configures a server with additional user data. For example, you might want to run <code>apt-get -y update</code>.</p> <note> <p>Depending on the machine image you choose, the command to get software on your instance varies. Amazon Linux and CentOS use <code>yum</code>, Debian and Ubuntu use <code>apt-get</code>, and FreeBSD uses <code>pkg</code>.</p> </note>\"\
        },\
        \"availabilityZone\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The Availability Zone for the new Amazon EC2 instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the Amazon Elastic Compute Cloud instance and related resources to be created using the <code>create cloud formation stack</code> operation.</p>\"\
    },\
    \"InstanceEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceEntry\"}\
    },\
    \"InstanceHardware\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"cpuCount\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The number of vCPUs the instance has.</p>\"\
        },\
        \"disks\":{\
          \"shape\":\"DiskList\",\
          \"documentation\":\"<p>The disks attached to the instance.</p>\"\
        },\
        \"ramSizeInGb\":{\
          \"shape\":\"float\",\
          \"documentation\":\"<p>The amount of RAM in GB on the instance (e.g., <code>1.0</code>).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the hardware for the instance.</p>\"\
    },\
    \"InstanceHealthReason\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Lb.RegistrationInProgress\",\
        \"Lb.InitialHealthChecking\",\
        \"Lb.InternalError\",\
        \"Instance.ResponseCodeMismatch\",\
        \"Instance.Timeout\",\
        \"Instance.FailedHealthChecks\",\
        \"Instance.NotRegistered\",\
        \"Instance.NotInUse\",\
        \"Instance.DeregistrationInProgress\",\
        \"Instance.InvalidState\",\
        \"Instance.IpUnusable\"\
      ]\
    },\
    \"InstanceHealthState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"initial\",\
        \"healthy\",\
        \"unhealthy\",\
        \"unused\",\
        \"draining\",\
        \"unavailable\"\
      ]\
    },\
    \"InstanceHealthSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the Lightsail instance for which you are requesting health check data.</p>\"\
        },\
        \"instanceHealth\":{\
          \"shape\":\"InstanceHealthState\",\
          \"documentation\":\"<p>Describes the overall instance health. Valid values are below.</p>\"\
        },\
        \"instanceHealthReason\":{\
          \"shape\":\"InstanceHealthReason\",\
          \"documentation\":\"<p>More information about the instance health. If the <code>instanceHealth</code> is <code>healthy</code>, then an <code>instanceHealthReason</code> value is not provided.</p> <p>If <b> <code>instanceHealth</code> </b> is <code>initial</code>, the <b> <code>instanceHealthReason</code> </b> value can be one of the following:</p> <ul> <li> <p> <b> <code>Lb.RegistrationInProgress</code> </b> - The target instance is in the process of being registered with the load balancer.</p> </li> <li> <p> <b> <code>Lb.InitialHealthChecking</code> </b> - The Lightsail load balancer is still sending the target instance the minimum number of health checks required to determine its health status.</p> </li> </ul> <p>If <b> <code>instanceHealth</code> </b> is <code>unhealthy</code>, the <b> <code>instanceHealthReason</code> </b> value can be one of the following:</p> <ul> <li> <p> <b> <code>Instance.ResponseCodeMismatch</code> </b> - The health checks did not return an expected HTTP code.</p> </li> <li> <p> <b> <code>Instance.Timeout</code> </b> - The health check requests timed out.</p> </li> <li> <p> <b> <code>Instance.FailedHealthChecks</code> </b> - The health checks failed because the connection to the target instance timed out, the target instance response was malformed, or the target instance failed the health check for an unknown reason.</p> </li> <li> <p> <b> <code>Lb.InternalError</code> </b> - The health checks failed due to an internal error.</p> </li> </ul> <p>If <b> <code>instanceHealth</code> </b> is <code>unused</code>, the <b> <code>instanceHealthReason</code> </b> value can be one of the following:</p> <ul> <li> <p> <b> <code>Instance.NotRegistered</code> </b> - The target instance is not registered with the target group.</p> </li> <li> <p> <b> <code>Instance.NotInUse</code> </b> - The target group is not used by any load balancer, or the target instance is in an Availability Zone that is not enabled for its load balancer.</p> </li> <li> <p> <b> <code>Instance.IpUnusable</code> </b> - The target IP address is reserved for use by a Lightsail load balancer.</p> </li> <li> <p> <b> <code>Instance.InvalidState</code> </b> - The target is in the stopped or terminated state.</p> </li> </ul> <p>If <b> <code>instanceHealth</code> </b> is <code>draining</code>, the <b> <code>instanceHealthReason</code> </b> value can be one of the following:</p> <ul> <li> <p> <b> <code>Instance.DeregistrationInProgress</code> </b> - The target instance is in the process of being deregistered and the deregistration delay period has not expired.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Describes information about the health of the instance.</p>\"\
    },\
    \"InstanceHealthSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceHealthSummary\"}\
    },\
    \"InstanceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Instance\"}\
    },\
    \"InstanceMetricName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CPUUtilization\",\
        \"NetworkIn\",\
        \"NetworkOut\",\
        \"StatusCheckFailed\",\
        \"StatusCheckFailed_Instance\",\
        \"StatusCheckFailed_System\"\
      ]\
    },\
    \"InstanceNetworking\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"monthlyTransfer\":{\
          \"shape\":\"MonthlyTransfer\",\
          \"documentation\":\"<p>The amount of data in GB allocated for monthly data transfers.</p>\"\
        },\
        \"ports\":{\
          \"shape\":\"InstancePortInfoList\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about the ports on the instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes monthly data transfer rates and port information for an instance.</p>\"\
    },\
    \"InstancePlatform\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"LINUX_UNIX\",\
        \"WINDOWS\"\
      ]\
    },\
    \"InstancePlatformList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstancePlatform\"}\
    },\
    \"InstancePortInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"fromPort\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>The first port in a range of open ports on an instance.</p> <p>Allowed ports:</p> <ul> <li> <p>TCP and UDP - <code>0</code> to <code>65535</code> </p> </li> <li> <p>ICMP - <code>8</code> (to configure Ping)</p> <note> <p>Ping is the only communication supported through the ICMP protocol in Lightsail. To configure ping, specify the <code>fromPort</code> parameter as <code>8</code>, and the <code>toPort</code> parameter as <code>-1</code>.</p> </note> </li> </ul>\"\
        },\
        \"toPort\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>The last port in a range of open ports on an instance.</p> <p>Allowed ports:</p> <ul> <li> <p>TCP and UDP - <code>0</code> to <code>65535</code> </p> </li> <li> <p>ICMP - <code>-1</code> (to configure Ping)</p> <note> <p>Ping is the only communication supported through the ICMP protocol in Lightsail. To configure ping, specify the <code>fromPort</code> parameter as <code>8</code>, and the <code>toPort</code> parameter as <code>-1</code>.</p> </note> </li> </ul>\"\
        },\
        \"protocol\":{\
          \"shape\":\"NetworkProtocol\",\
          \"documentation\":\"<p>The IP protocol name.</p> <p>The name can be one of the following:</p> <ul> <li> <p> <code>tcp</code> - Transmission Control Protocol (TCP) provides reliable, ordered, and error-checked delivery of streamed data between applications running on hosts communicating by an IP network. If you have an application that doesn't require reliable data stream service, use UDP instead.</p> </li> <li> <p> <code>all</code> - All transport layer protocol types. For more general information, see <a href=\\\"https://en.wikipedia.org/wiki/Transport_layer\\\">Transport layer</a> on <i>Wikipedia</i>.</p> </li> <li> <p> <code>udp</code> - With User Datagram Protocol (UDP), computer applications can send messages (or datagrams) to other hosts on an Internet Protocol (IP) network. Prior communications are not required to set up transmission channels or data paths. Applications that don't require reliable data stream service can use UDP, which provides a connectionless datagram service that emphasizes reduced latency over reliability. If you do require reliable data stream service, use TCP instead.</p> </li> <li> <p> <code>icmp</code> - Internet Control Message Protocol (ICMP) is used to send error messages and operational information indicating success or failure when communicating with an instance. For example, an error is indicated when an instance could not be reached.</p> <note> <p>Ping is the only communication supported through the ICMP protocol in Lightsail. To configure ping, specify the <code>fromPort</code> parameter as <code>8</code>, and the <code>toPort</code> parameter as <code>-1</code>.</p> </note> </li> </ul>\"\
        },\
        \"accessFrom\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The location from which access is allowed. For example, <code>Anywhere (0.0.0.0/0)</code>, or <code>Custom</code> if a specific IP address or range of IP addresses is allowed.</p>\"\
        },\
        \"accessType\":{\
          \"shape\":\"PortAccessType\",\
          \"documentation\":\"<p>The type of access (<code>Public</code> or <code>Private</code>).</p>\"\
        },\
        \"commonName\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The common name of the port information.</p>\"\
        },\
        \"accessDirection\":{\
          \"shape\":\"AccessDirection\",\
          \"documentation\":\"<p>The access direction (<code>inbound</code> or <code>outbound</code>).</p> <note> <p>Lightsail currently supports only <code>inbound</code> access direction.</p> </note>\"\
        },\
        \"cidrs\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>The IP address, or range of IP addresses in CIDR notation, that are allowed to connect to an instance through the ports, and the protocol. Lightsail supports IPv4 addresses.</p> <p>For more information about CIDR block notation, see <a href=\\\"https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation\\\">Classless Inter-Domain Routing</a> on <i>Wikipedia</i>.</p>\"\
        },\
        \"cidrListAliases\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>An alias that defines access for a preconfigured range of IP addresses.</p> <p>The only alias currently supported is <code>lightsail-connect</code>, which allows IP addresses of the browser-based RDP/SSH client in the Lightsail console to connect to your instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes information about ports for an Amazon Lightsail instance.</p>\"\
    },\
    \"InstancePortInfoList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstancePortInfo\"}\
    },\
    \"InstancePortState\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"fromPort\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>The first port in a range of open ports on an instance.</p> <p>Allowed ports:</p> <ul> <li> <p>TCP and UDP - <code>0</code> to <code>65535</code> </p> </li> <li> <p>ICMP - <code>8</code> (to configure Ping)</p> <note> <p>Ping is the only communication supported through the ICMP protocol in Lightsail. To configure ping, specify the <code>fromPort</code> parameter as <code>8</code>, and the <code>toPort</code> parameter as <code>-1</code>.</p> </note> </li> </ul>\"\
        },\
        \"toPort\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>The last port in a range of open ports on an instance.</p> <p>Allowed ports:</p> <ul> <li> <p>TCP and UDP - <code>0</code> to <code>65535</code> </p> </li> <li> <p>ICMP - <code>-1</code> (to configure Ping)</p> <note> <p>Ping is the only communication supported through the ICMP protocol in Lightsail. To configure ping, specify the <code>fromPort</code> parameter as <code>8</code>, and the <code>toPort</code> parameter as <code>-1</code>.</p> </note> </li> </ul>\"\
        },\
        \"protocol\":{\
          \"shape\":\"NetworkProtocol\",\
          \"documentation\":\"<p>The IP protocol name.</p> <p>The name can be one of the following:</p> <ul> <li> <p> <code>tcp</code> - Transmission Control Protocol (TCP) provides reliable, ordered, and error-checked delivery of streamed data between applications running on hosts communicating by an IP network. If you have an application that doesn't require reliable data stream service, use UDP instead.</p> </li> <li> <p> <code>all</code> - All transport layer protocol types. For more general information, see <a href=\\\"https://en.wikipedia.org/wiki/Transport_layer\\\">Transport layer</a> on <i>Wikipedia</i>.</p> </li> <li> <p> <code>udp</code> - With User Datagram Protocol (UDP), computer applications can send messages (or datagrams) to other hosts on an Internet Protocol (IP) network. Prior communications are not required to set up transmission channels or data paths. Applications that don't require reliable data stream service can use UDP, which provides a connectionless datagram service that emphasizes reduced latency over reliability. If you do require reliable data stream service, use TCP instead.</p> </li> <li> <p> <code>icmp</code> - Internet Control Message Protocol (ICMP) is used to send error messages and operational information indicating success or failure when communicating with an instance. For example, an error is indicated when an instance could not be reached.</p> <note> <p>Ping is the only communication supported through the ICMP protocol in Lightsail. To configure ping, specify the <code>fromPort</code> parameter as <code>8</code>, and the <code>toPort</code> parameter as <code>-1</code>.</p> </note> </li> </ul>\"\
        },\
        \"state\":{\
          \"shape\":\"PortState\",\
          \"documentation\":\"<p>Specifies whether the instance port is <code>open</code> or <code>closed</code>.</p> <note> <p>The port state for Lightsail instances is always <code>open</code>.</p> </note>\"\
        },\
        \"cidrs\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>The IP address, or range of IP addresses in CIDR notation, that are allowed to connect to an instance through the ports, and the protocol. Lightsail supports IPv4 addresses.</p> <p>For more information about CIDR block notation, see <a href=\\\"https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation\\\">Classless Inter-Domain Routing</a> on <i>Wikipedia</i>.</p>\"\
        },\
        \"cidrListAliases\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>An alias that defines access for a preconfigured range of IP addresses.</p> <p>The only alias currently supported is <code>lightsail-connect</code>, which allows IP addresses of the browser-based RDP/SSH client in the Lightsail console to connect to your instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes open ports on an instance, the IP addresses allowed to connect to the instance through the ports, and the protocol.</p>\"\
    },\
    \"InstancePortStateList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstancePortState\"}\
    },\
    \"InstanceSnapshot\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the snapshot.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the snapshot (e.g., <code>arn:aws:lightsail:us-east-2:123456789101:InstanceSnapshot/d23b5706-3322-4d83-81e5-12345EXAMPLE</code>).</p>\"\
        },\
        \"supportCode\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The timestamp when the snapshot was created (e.g., <code>1479907467.024</code>).</p>\"\
        },\
        \"location\":{\
          \"shape\":\"ResourceLocation\",\
          \"documentation\":\"<p>The region name and Availability Zone where you created the snapshot.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of resource (usually <code>InstanceSnapshot</code>).</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags\\\">Lightsail Dev Guide</a>.</p>\"\
        },\
        \"state\":{\
          \"shape\":\"InstanceSnapshotState\",\
          \"documentation\":\"<p>The state the snapshot is in.</p>\"\
        },\
        \"progress\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The progress of the snapshot.</p>\"\
        },\
        \"fromAttachedDisks\":{\
          \"shape\":\"DiskList\",\
          \"documentation\":\"<p>An array of disk objects containing information about all block storage disks.</p>\"\
        },\
        \"fromInstanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The instance from which the snapshot was created.</p>\"\
        },\
        \"fromInstanceArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the instance from which the snapshot was created (e.g., <code>arn:aws:lightsail:us-east-2:123456789101:Instance/64b8404c-ccb1-430b-8daf-12345EXAMPLE</code>).</p>\"\
        },\
        \"fromBlueprintId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The blueprint ID from which you created the snapshot (e.g., <code>os_debian_8_3</code>). A blueprint is a virtual private server (or <i>instance</i>) image used to create instances quickly.</p>\"\
        },\
        \"fromBundleId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The bundle ID from which you created the snapshot (e.g., <code>micro_1_0</code>).</p>\"\
        },\
        \"isFromAutoSnapshot\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether the snapshot was created from an automatic snapshot.</p>\"\
        },\
        \"sizeInGb\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The size in GB of the SSD.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an instance snapshot.</p>\"\
    },\
    \"InstanceSnapshotInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"fromBundleId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The bundle ID from which the source instance was created (e.g., <code>micro_1_0</code>).</p>\"\
        },\
        \"fromBlueprintId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The blueprint ID from which the source instance (e.g., <code>os_debian_8_3</code>).</p>\"\
        },\
        \"fromDiskInfo\":{\
          \"shape\":\"DiskInfoList\",\
          \"documentation\":\"<p>A list of objects describing the disks that were attached to the source instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an instance snapshot.</p>\"\
    },\
    \"InstanceSnapshotList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceSnapshot\"}\
    },\
    \"InstanceSnapshotState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"pending\",\
        \"error\",\
        \"available\"\
      ]\
    },\
    \"InstanceState\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"code\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The status code for the instance.</p>\"\
        },\
        \"name\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The state of the instance (e.g., <code>running</code> or <code>pending</code>).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the virtual private server (or <i>instance</i>) status.</p>\"\
    },\
    \"InvalidInputException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"code\":{\"shape\":\"string\"},\
        \"docs\":{\"shape\":\"string\"},\
        \"message\":{\"shape\":\"string\"},\
        \"tip\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Lightsail throws this exception when user input does not conform to the validation rules of an input field.</p> <note> <p>Domain-related APIs are only available in the N. Virginia (us-east-1) Region. Please set your AWS Region configuration to us-east-1 to create, view, or edit these resources.</p> </note>\",\
      \"exception\":true\
    },\
    \"IpAddress\":{\
      \"type\":\"string\",\
      \"pattern\":\"([0-9]{1,3}\\\\.){3}[0-9]{1,3}\"\
    },\
    \"IpV6Address\":{\
      \"type\":\"string\",\
      \"pattern\":\"([A-F0-9]{1,4}:){7}[A-F0-9]{1,4}\"\
    },\
    \"IsVpcPeeredRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"IsVpcPeeredResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"isPeered\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>Returns <code>true</code> if the Lightsail VPC is peered; otherwise, <code>false</code>.</p>\"\
        }\
      }\
    },\
    \"IsoDate\":{\"type\":\"timestamp\"},\
    \"KeyPair\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The friendly name of the SSH key pair.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the key pair (e.g., <code>arn:aws:lightsail:us-east-2:123456789101:KeyPair/05859e3d-331d-48ba-9034-12345EXAMPLE</code>).</p>\"\
        },\
        \"supportCode\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The timestamp when the key pair was created (e.g., <code>1479816991.349</code>).</p>\"\
        },\
        \"location\":{\
          \"shape\":\"ResourceLocation\",\
          \"documentation\":\"<p>The region name and Availability Zone where the key pair was created.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The resource type (usually <code>KeyPair</code>).</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags\\\">Lightsail Dev Guide</a>.</p>\"\
        },\
        \"fingerprint\":{\
          \"shape\":\"Base64\",\
          \"documentation\":\"<p>The RSA fingerprint of the key pair.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the SSH key pair.</p>\"\
    },\
    \"KeyPairList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"KeyPair\"}\
    },\
    \"LoadBalancer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the load balancer (e.g., <code>my-load-balancer</code>).</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the load balancer.</p>\"\
        },\
        \"supportCode\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The support code. Include this code in your email to support when you have questions about your Lightsail load balancer. This code enables our support team to look up your Lightsail information more easily.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The date when your load balancer was created.</p>\"\
        },\
        \"location\":{\
          \"shape\":\"ResourceLocation\",\
          \"documentation\":\"<p>The AWS Region where your load balancer was created (e.g., <code>us-east-2a</code>). Lightsail automatically creates your load balancer across Availability Zones.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The resource type (e.g., <code>LoadBalancer</code>.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags\\\">Lightsail Dev Guide</a>.</p>\"\
        },\
        \"dnsName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The DNS name of your Lightsail load balancer.</p>\"\
        },\
        \"state\":{\
          \"shape\":\"LoadBalancerState\",\
          \"documentation\":\"<p>The status of your load balancer. Valid values are below.</p>\"\
        },\
        \"protocol\":{\
          \"shape\":\"LoadBalancerProtocol\",\
          \"documentation\":\"<p>The protocol you have enabled for your load balancer. Valid values are below.</p> <p>You can't just have <code>HTTP_HTTPS</code>, but you can have just <code>HTTP</code>.</p>\"\
        },\
        \"publicPorts\":{\
          \"shape\":\"PortList\",\
          \"documentation\":\"<p>An array of public port settings for your load balancer. For HTTP, use port 80. For HTTPS, use port 443.</p>\"\
        },\
        \"healthCheckPath\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The path you specified to perform your health checks. If no path is specified, the load balancer tries to make a request to the default (root) page.</p>\"\
        },\
        \"instancePort\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The port where the load balancer will direct traffic to your Lightsail instances. For HTTP traffic, it's port 80. For HTTPS traffic, it's port 443.</p>\"\
        },\
        \"instanceHealthSummary\":{\
          \"shape\":\"InstanceHealthSummaryList\",\
          \"documentation\":\"<p>An array of InstanceHealthSummary objects describing the health of the load balancer.</p>\"\
        },\
        \"tlsCertificateSummaries\":{\
          \"shape\":\"LoadBalancerTlsCertificateSummaryList\",\
          \"documentation\":\"<p>An array of LoadBalancerTlsCertificateSummary objects that provide additional information about the SSL/TLS certificates. For example, if <code>true</code>, the certificate is attached to the load balancer.</p>\"\
        },\
        \"configurationOptions\":{\
          \"shape\":\"LoadBalancerConfigurationOptions\",\
          \"documentation\":\"<p>A string to string map of the configuration options for your load balancer. Valid values are listed below.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the Lightsail load balancer.</p>\"\
    },\
    \"LoadBalancerAttributeName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"HealthCheckPath\",\
        \"SessionStickinessEnabled\",\
        \"SessionStickiness_LB_CookieDurationSeconds\"\
      ]\
    },\
    \"LoadBalancerConfigurationOptions\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"LoadBalancerAttributeName\"},\
      \"value\":{\"shape\":\"string\"}\
    },\
    \"LoadBalancerList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LoadBalancer\"}\
    },\
    \"LoadBalancerMetricName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ClientTLSNegotiationErrorCount\",\
        \"HealthyHostCount\",\
        \"UnhealthyHostCount\",\
        \"HTTPCode_LB_4XX_Count\",\
        \"HTTPCode_LB_5XX_Count\",\
        \"HTTPCode_Instance_2XX_Count\",\
        \"HTTPCode_Instance_3XX_Count\",\
        \"HTTPCode_Instance_4XX_Count\",\
        \"HTTPCode_Instance_5XX_Count\",\
        \"InstanceResponseTime\",\
        \"RejectedConnectionCount\",\
        \"RequestCount\"\
      ]\
    },\
    \"LoadBalancerProtocol\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"HTTP_HTTPS\",\
        \"HTTP\"\
      ]\
    },\
    \"LoadBalancerState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"active\",\
        \"provisioning\",\
        \"active_impaired\",\
        \"failed\",\
        \"unknown\"\
      ]\
    },\
    \"LoadBalancerTlsCertificate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the SSL/TLS certificate (e.g., <code>my-certificate</code>).</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the SSL/TLS certificate.</p>\"\
        },\
        \"supportCode\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The support code. Include this code in your email to support when you have questions about your Lightsail load balancer or SSL/TLS certificate. This code enables our support team to look up your Lightsail information more easily.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The time when you created your SSL/TLS certificate.</p>\"\
        },\
        \"location\":{\
          \"shape\":\"ResourceLocation\",\
          \"documentation\":\"<p>The AWS Region and Availability Zone where you created your certificate.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The resource type (e.g., <code>LoadBalancerTlsCertificate</code>).</p> <ul> <li> <p> <b> <code>Instance</code> </b> - A Lightsail instance (a virtual private server)</p> </li> <li> <p> <b> <code>StaticIp</code> </b> - A static IP address</p> </li> <li> <p> <b> <code>KeyPair</code> </b> - The key pair used to connect to a Lightsail instance</p> </li> <li> <p> <b> <code>InstanceSnapshot</code> </b> - A Lightsail instance snapshot</p> </li> <li> <p> <b> <code>Domain</code> </b> - A DNS zone</p> </li> <li> <p> <b> <code>PeeredVpc</code> </b> - A peered VPC</p> </li> <li> <p> <b> <code>LoadBalancer</code> </b> - A Lightsail load balancer</p> </li> <li> <p> <b> <code>LoadBalancerTlsCertificate</code> </b> - An SSL/TLS certificate associated with a Lightsail load balancer</p> </li> <li> <p> <b> <code>Disk</code> </b> - A Lightsail block storage disk</p> </li> <li> <p> <b> <code>DiskSnapshot</code> </b> - A block storage disk snapshot</p> </li> </ul>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags\\\">Lightsail Dev Guide</a>.</p>\"\
        },\
        \"loadBalancerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The load balancer name where your SSL/TLS certificate is attached.</p>\"\
        },\
        \"isAttached\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>When <code>true</code>, the SSL/TLS certificate is attached to the Lightsail load balancer.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"LoadBalancerTlsCertificateStatus\",\
          \"documentation\":\"<p>The status of the SSL/TLS certificate. Valid values are below.</p>\"\
        },\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The domain name for your SSL/TLS certificate.</p>\"\
        },\
        \"domainValidationRecords\":{\
          \"shape\":\"LoadBalancerTlsCertificateDomainValidationRecordList\",\
          \"documentation\":\"<p>An array of LoadBalancerTlsCertificateDomainValidationRecord objects describing the records.</p>\"\
        },\
        \"failureReason\":{\
          \"shape\":\"LoadBalancerTlsCertificateFailureReason\",\
          \"documentation\":\"<p>The reason for the SSL/TLS certificate validation failure.</p>\"\
        },\
        \"issuedAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The time when the SSL/TLS certificate was issued.</p>\"\
        },\
        \"issuer\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The issuer of the certificate.</p>\"\
        },\
        \"keyAlgorithm\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The algorithm that was used to generate the key pair (the public and private key).</p>\"\
        },\
        \"notAfter\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The timestamp when the SSL/TLS certificate expires.</p>\"\
        },\
        \"notBefore\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The timestamp when the SSL/TLS certificate is first valid.</p>\"\
        },\
        \"renewalSummary\":{\
          \"shape\":\"LoadBalancerTlsCertificateRenewalSummary\",\
          \"documentation\":\"<p>An object containing information about the status of Lightsail's managed renewal for the certificate.</p>\"\
        },\
        \"revocationReason\":{\
          \"shape\":\"LoadBalancerTlsCertificateRevocationReason\",\
          \"documentation\":\"<p>The reason the certificate was revoked. Valid values are below.</p>\"\
        },\
        \"revokedAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The timestamp when the SSL/TLS certificate was revoked.</p>\"\
        },\
        \"serial\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The serial number of the certificate.</p>\"\
        },\
        \"signatureAlgorithm\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The algorithm that was used to sign the certificate.</p>\"\
        },\
        \"subject\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the entity that is associated with the public key contained in the certificate.</p>\"\
        },\
        \"subjectAlternativeNames\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>One or more domains or subdomains included in the certificate. This list contains the domain names that are bound to the public key that is contained in the certificate. The subject alternative names include the canonical domain name (CNAME) of the certificate and additional domain names that can be used to connect to the website, such as <code>example.com</code>, <code>www.example.com</code>, or <code>m.example.com</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a load balancer SSL/TLS certificate.</p> <p>TLS is just an updated, more secure version of Secure Socket Layer (SSL).</p>\"\
    },\
    \"LoadBalancerTlsCertificateDomainStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING_VALIDATION\",\
        \"FAILED\",\
        \"SUCCESS\"\
      ]\
    },\
    \"LoadBalancerTlsCertificateDomainValidationOption\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The fully qualified domain name in the certificate request.</p>\"\
        },\
        \"validationStatus\":{\
          \"shape\":\"LoadBalancerTlsCertificateDomainStatus\",\
          \"documentation\":\"<p>The status of the domain validation. Valid values are listed below.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the domain names on an SSL/TLS certificate that you will use to validate domain ownership.</p>\"\
    },\
    \"LoadBalancerTlsCertificateDomainValidationOptionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LoadBalancerTlsCertificateDomainValidationOption\"}\
    },\
    \"LoadBalancerTlsCertificateDomainValidationRecord\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A fully qualified domain name in the certificate. For example, <code>example.com</code>.</p>\"\
        },\
        \"type\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The type of validation record. For example, <code>CNAME</code> for domain validation.</p>\"\
        },\
        \"value\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The value for that type.</p>\"\
        },\
        \"validationStatus\":{\
          \"shape\":\"LoadBalancerTlsCertificateDomainStatus\",\
          \"documentation\":\"<p>The validation status. Valid values are listed below.</p>\"\
        },\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The domain name against which your SSL/TLS certificate was validated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the validation record of each domain name in the SSL/TLS certificate.</p>\"\
    },\
    \"LoadBalancerTlsCertificateDomainValidationRecordList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LoadBalancerTlsCertificateDomainValidationRecord\"}\
    },\
    \"LoadBalancerTlsCertificateFailureReason\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NO_AVAILABLE_CONTACTS\",\
        \"ADDITIONAL_VERIFICATION_REQUIRED\",\
        \"DOMAIN_NOT_ALLOWED\",\
        \"INVALID_PUBLIC_DOMAIN\",\
        \"OTHER\"\
      ]\
    },\
    \"LoadBalancerTlsCertificateList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LoadBalancerTlsCertificate\"}\
    },\
    \"LoadBalancerTlsCertificateRenewalStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING_AUTO_RENEWAL\",\
        \"PENDING_VALIDATION\",\
        \"SUCCESS\",\
        \"FAILED\"\
      ]\
    },\
    \"LoadBalancerTlsCertificateRenewalSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"renewalStatus\":{\
          \"shape\":\"LoadBalancerTlsCertificateRenewalStatus\",\
          \"documentation\":\"<p>The status of Lightsail's managed renewal of the certificate. Valid values are listed below.</p>\"\
        },\
        \"domainValidationOptions\":{\
          \"shape\":\"LoadBalancerTlsCertificateDomainValidationOptionList\",\
          \"documentation\":\"<p>Contains information about the validation of each domain name in the certificate, as it pertains to Lightsail's managed renewal. This is different from the initial validation that occurs as a result of the RequestCertificate request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the status of Lightsail's managed renewal for the certificate.</p>\"\
    },\
    \"LoadBalancerTlsCertificateRevocationReason\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"UNSPECIFIED\",\
        \"KEY_COMPROMISE\",\
        \"CA_COMPROMISE\",\
        \"AFFILIATION_CHANGED\",\
        \"SUPERCEDED\",\
        \"CESSATION_OF_OPERATION\",\
        \"CERTIFICATE_HOLD\",\
        \"REMOVE_FROM_CRL\",\
        \"PRIVILEGE_WITHDRAWN\",\
        \"A_A_COMPROMISE\"\
      ]\
    },\
    \"LoadBalancerTlsCertificateStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING_VALIDATION\",\
        \"ISSUED\",\
        \"INACTIVE\",\
        \"EXPIRED\",\
        \"VALIDATION_TIMED_OUT\",\
        \"REVOKED\",\
        \"FAILED\",\
        \"UNKNOWN\"\
      ]\
    },\
    \"LoadBalancerTlsCertificateSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the SSL/TLS certificate.</p>\"\
        },\
        \"isAttached\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>When <code>true</code>, the SSL/TLS certificate is attached to the Lightsail load balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides a summary of SSL/TLS certificate metadata.</p>\"\
    },\
    \"LoadBalancerTlsCertificateSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LoadBalancerTlsCertificateSummary\"}\
    },\
    \"LogEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The timestamp when the database log event was created.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The message of the database log event.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a database log event.</p>\"\
    },\
    \"LogEventList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogEvent\"}\
    },\
    \"MetricDatapoint\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"average\":{\
          \"shape\":\"double\",\
          \"documentation\":\"<p>The average.</p>\"\
        },\
        \"maximum\":{\
          \"shape\":\"double\",\
          \"documentation\":\"<p>The maximum.</p>\"\
        },\
        \"minimum\":{\
          \"shape\":\"double\",\
          \"documentation\":\"<p>The minimum.</p>\"\
        },\
        \"sampleCount\":{\
          \"shape\":\"double\",\
          \"documentation\":\"<p>The sample count.</p>\"\
        },\
        \"sum\":{\
          \"shape\":\"double\",\
          \"documentation\":\"<p>The sum.</p>\"\
        },\
        \"timestamp\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp (e.g., <code>1479816991.349</code>).</p>\"\
        },\
        \"unit\":{\
          \"shape\":\"MetricUnit\",\
          \"documentation\":\"<p>The unit. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the metric data point.</p>\"\
    },\
    \"MetricDatapointList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricDatapoint\"}\
    },\
    \"MetricName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CPUUtilization\",\
        \"NetworkIn\",\
        \"NetworkOut\",\
        \"StatusCheckFailed\",\
        \"StatusCheckFailed_Instance\",\
        \"StatusCheckFailed_System\",\
        \"ClientTLSNegotiationErrorCount\",\
        \"HealthyHostCount\",\
        \"UnhealthyHostCount\",\
        \"HTTPCode_LB_4XX_Count\",\
        \"HTTPCode_LB_5XX_Count\",\
        \"HTTPCode_Instance_2XX_Count\",\
        \"HTTPCode_Instance_3XX_Count\",\
        \"HTTPCode_Instance_4XX_Count\",\
        \"HTTPCode_Instance_5XX_Count\",\
        \"InstanceResponseTime\",\
        \"RejectedConnectionCount\",\
        \"RequestCount\",\
        \"DatabaseConnections\",\
        \"DiskQueueDepth\",\
        \"FreeStorageSpace\",\
        \"NetworkReceiveThroughput\",\
        \"NetworkTransmitThroughput\"\
      ]\
    },\
    \"MetricPeriod\":{\
      \"type\":\"integer\",\
      \"max\":86400,\
      \"min\":60\
    },\
    \"MetricStatistic\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Minimum\",\
        \"Maximum\",\
        \"Sum\",\
        \"Average\",\
        \"SampleCount\"\
      ]\
    },\
    \"MetricStatisticList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricStatistic\"}\
    },\
    \"MetricUnit\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Seconds\",\
        \"Microseconds\",\
        \"Milliseconds\",\
        \"Bytes\",\
        \"Kilobytes\",\
        \"Megabytes\",\
        \"Gigabytes\",\
        \"Terabytes\",\
        \"Bits\",\
        \"Kilobits\",\
        \"Megabits\",\
        \"Gigabits\",\
        \"Terabits\",\
        \"Percent\",\
        \"Count\",\
        \"Bytes/Second\",\
        \"Kilobytes/Second\",\
        \"Megabytes/Second\",\
        \"Gigabytes/Second\",\
        \"Terabytes/Second\",\
        \"Bits/Second\",\
        \"Kilobits/Second\",\
        \"Megabits/Second\",\
        \"Gigabits/Second\",\
        \"Terabits/Second\",\
        \"Count/Second\",\
        \"None\"\
      ]\
    },\
    \"MonitoredResourceInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"arn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource being monitored.</p>\"\
        },\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the Lightsail resource being monitored.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The Lightsail resource type of the resource being monitored.</p> <p>Instances, load balancers, and relational databases are the only Lightsail resources that can currently be monitored by alarms.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes resource being monitored by an alarm.</p> <p>An alarm is a way to monitor your Amazon Lightsail resource metrics. For more information, see <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms\\\">Alarms in Amazon Lightsail</a>.</p>\"\
    },\
    \"MonthlyTransfer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"gbPerMonthAllocated\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The amount allocated per month (in GB).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the monthly data transfer in and out of your virtual private server (or <i>instance</i>).</p>\"\
    },\
    \"NetworkProtocol\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"tcp\",\
        \"all\",\
        \"udp\",\
        \"icmp\"\
      ]\
    },\
    \"NonEmptyString\":{\
      \"type\":\"string\",\
      \"pattern\":\".*\\\\S.*\"\
    },\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"code\":{\"shape\":\"string\"},\
        \"docs\":{\"shape\":\"string\"},\
        \"message\":{\"shape\":\"string\"},\
        \"tip\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Lightsail throws this exception when it cannot find a resource.</p>\",\
      \"exception\":true\
    },\
    \"NotificationTriggerList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AlarmState\"}\
    },\
    \"OpenInstancePublicPortsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"portInfo\",\
        \"instanceName\"\
      ],\
      \"members\":{\
        \"portInfo\":{\
          \"shape\":\"PortInfo\",\
          \"documentation\":\"<p>An object to describe the ports to open for the specified instance.</p>\"\
        },\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the instance for which to open ports.</p>\"\
        }\
      }\
    },\
    \"OpenInstancePublicPortsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operation\":{\
          \"shape\":\"Operation\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"Operation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"id\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the operation.</p>\"\
        },\
        \"resourceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The resource name.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The resource type. </p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The timestamp when the operation was initialized (e.g., <code>1479816991.349</code>).</p>\"\
        },\
        \"location\":{\
          \"shape\":\"ResourceLocation\",\
          \"documentation\":\"<p>The AWS Region and Availability Zone.</p>\"\
        },\
        \"isTerminal\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether the operation is terminal.</p>\"\
        },\
        \"operationDetails\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Details about the operation (e.g., <code>Debian-1GB-Ohio-1</code>).</p>\"\
        },\
        \"operationType\":{\
          \"shape\":\"OperationType\",\
          \"documentation\":\"<p>The type of operation. </p>\"\
        },\
        \"status\":{\
          \"shape\":\"OperationStatus\",\
          \"documentation\":\"<p>The status of the operation. </p>\"\
        },\
        \"statusChangedAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The timestamp when the status was changed (e.g., <code>1479816991.349</code>).</p>\"\
        },\
        \"errorCode\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The error code.</p>\"\
        },\
        \"errorDetails\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The error details.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the API operation.</p>\"\
    },\
    \"OperationFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"code\":{\"shape\":\"string\"},\
        \"docs\":{\"shape\":\"string\"},\
        \"message\":{\"shape\":\"string\"},\
        \"tip\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Lightsail throws this exception when an operation fails to execute.</p>\",\
      \"exception\":true\
    },\
    \"OperationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Operation\"}\
    },\
    \"OperationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NotStarted\",\
        \"Started\",\
        \"Failed\",\
        \"Completed\",\
        \"Succeeded\"\
      ]\
    },\
    \"OperationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DeleteKnownHostKeys\",\
        \"DeleteInstance\",\
        \"CreateInstance\",\
        \"StopInstance\",\
        \"StartInstance\",\
        \"RebootInstance\",\
        \"OpenInstancePublicPorts\",\
        \"PutInstancePublicPorts\",\
        \"CloseInstancePublicPorts\",\
        \"AllocateStaticIp\",\
        \"ReleaseStaticIp\",\
        \"AttachStaticIp\",\
        \"DetachStaticIp\",\
        \"UpdateDomainEntry\",\
        \"DeleteDomainEntry\",\
        \"CreateDomain\",\
        \"DeleteDomain\",\
        \"CreateInstanceSnapshot\",\
        \"DeleteInstanceSnapshot\",\
        \"CreateInstancesFromSnapshot\",\
        \"CreateLoadBalancer\",\
        \"DeleteLoadBalancer\",\
        \"AttachInstancesToLoadBalancer\",\
        \"DetachInstancesFromLoadBalancer\",\
        \"UpdateLoadBalancerAttribute\",\
        \"CreateLoadBalancerTlsCertificate\",\
        \"DeleteLoadBalancerTlsCertificate\",\
        \"AttachLoadBalancerTlsCertificate\",\
        \"CreateDisk\",\
        \"DeleteDisk\",\
        \"AttachDisk\",\
        \"DetachDisk\",\
        \"CreateDiskSnapshot\",\
        \"DeleteDiskSnapshot\",\
        \"CreateDiskFromSnapshot\",\
        \"CreateRelationalDatabase\",\
        \"UpdateRelationalDatabase\",\
        \"DeleteRelationalDatabase\",\
        \"CreateRelationalDatabaseFromSnapshot\",\
        \"CreateRelationalDatabaseSnapshot\",\
        \"DeleteRelationalDatabaseSnapshot\",\
        \"UpdateRelationalDatabaseParameters\",\
        \"StartRelationalDatabase\",\
        \"RebootRelationalDatabase\",\
        \"StopRelationalDatabase\",\
        \"EnableAddOn\",\
        \"DisableAddOn\",\
        \"PutAlarm\",\
        \"GetAlarms\",\
        \"DeleteAlarm\",\
        \"TestAlarm\",\
        \"CreateContactMethod\",\
        \"GetContactMethods\",\
        \"SendContactMethodVerification\",\
        \"DeleteContactMethod\"\
      ]\
    },\
    \"PasswordData\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ciphertext\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The encrypted password. Ciphertext will be an empty string if access to your new instance is not ready yet. When you create an instance, it can take up to 15 minutes for the instance to be ready.</p> <note> <p>If you use the default key pair (<code>LightsailDefaultKeyPair</code>), the decrypted password will be available in the password field.</p> <p>If you are using a custom key pair, you need to use your own means of decryption.</p> <p>If you change the Administrator password on the instance, Lightsail will continue to return the original ciphertext value. When accessing the instance using RDP, you need to manually enter the Administrator password after changing it from the default.</p> </note>\"\
        },\
        \"keyPairName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the key pair that you used when creating your instance. If no key pair name was specified when creating the instance, Lightsail uses the default key pair (<code>LightsailDefaultKeyPair</code>).</p> <p>If you are using a custom key pair, you need to use your own means of decrypting your password using the <code>ciphertext</code>. Lightsail creates the ciphertext by encrypting your password with the public key part of this key pair.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The password data for the Windows Server-based instance, including the ciphertext and the key pair name.</p>\"\
    },\
    \"PeerVpcRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"PeerVpcResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operation\":{\
          \"shape\":\"Operation\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"PendingMaintenanceAction\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"action\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The type of pending database maintenance action.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Additional detail about the pending database maintenance action.</p>\"\
        },\
        \"currentApplyDate\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The effective date of the pending database maintenance action.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a pending database maintenance action.</p>\"\
    },\
    \"PendingMaintenanceActionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PendingMaintenanceAction\"}\
    },\
    \"PendingModifiedRelationalDatabaseValues\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"masterUserPassword\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The password for the master user of the database.</p>\"\
        },\
        \"engineVersion\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The database engine version.</p>\"\
        },\
        \"backupRetentionEnabled\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether automated backup retention is enabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a pending database value modification.</p>\"\
    },\
    \"Port\":{\
      \"type\":\"integer\",\
      \"max\":65535,\
      \"min\":-1\
    },\
    \"PortAccessType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Public\",\
        \"Private\"\
      ]\
    },\
    \"PortInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"fromPort\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>The first port in a range of open ports on an instance.</p> <p>Allowed ports:</p> <ul> <li> <p>TCP and UDP - <code>0</code> to <code>65535</code> </p> </li> <li> <p>ICMP - <code>8</code> (to configure Ping)</p> <note> <p>Ping is the only communication supported through the ICMP protocol in Lightsail. To configure ping, specify the <code>fromPort</code> parameter as <code>8</code>, and the <code>toPort</code> parameter as <code>-1</code>.</p> </note> </li> </ul>\"\
        },\
        \"toPort\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>The last port in a range of open ports on an instance.</p> <p>Allowed ports:</p> <ul> <li> <p>TCP and UDP - <code>0</code> to <code>65535</code> </p> </li> <li> <p>ICMP - <code>-1</code> (to configure Ping)</p> <note> <p>Ping is the only communication supported through the ICMP protocol in Lightsail. To configure ping, specify the <code>fromPort</code> parameter as <code>8</code>, and the <code>toPort</code> parameter as <code>-1</code>.</p> </note> </li> </ul>\"\
        },\
        \"protocol\":{\
          \"shape\":\"NetworkProtocol\",\
          \"documentation\":\"<p>The IP protocol name.</p> <p>The name can be one of the following:</p> <ul> <li> <p> <code>tcp</code> - Transmission Control Protocol (TCP) provides reliable, ordered, and error-checked delivery of streamed data between applications running on hosts communicating by an IP network. If you have an application that doesn't require reliable data stream service, use UDP instead.</p> </li> <li> <p> <code>all</code> - All transport layer protocol types. For more general information, see <a href=\\\"https://en.wikipedia.org/wiki/Transport_layer\\\">Transport layer</a> on <i>Wikipedia</i>.</p> </li> <li> <p> <code>udp</code> - With User Datagram Protocol (UDP), computer applications can send messages (or datagrams) to other hosts on an Internet Protocol (IP) network. Prior communications are not required to set up transmission channels or data paths. Applications that don't require reliable data stream service can use UDP, which provides a connectionless datagram service that emphasizes reduced latency over reliability. If you do require reliable data stream service, use TCP instead.</p> </li> <li> <p> <code>icmp</code> - Internet Control Message Protocol (ICMP) is used to send error messages and operational information indicating success or failure when communicating with an instance. For example, an error is indicated when an instance could not be reached.</p> <note> <p>Ping is the only communication supported through the ICMP protocol in Lightsail. To configure ping, specify the <code>fromPort</code> parameter as <code>8</code>, and the <code>toPort</code> parameter as <code>-1</code>.</p> </note> </li> </ul>\"\
        },\
        \"cidrs\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>The IP address, or range of IP addresses in CIDR notation, that are allowed to connect to an instance through the ports, and the protocol. Lightsail supports IPv4 addresses.</p> <p>Examples:</p> <ul> <li> <p>To allow the IP address <code>192.0.2.44</code>, specify <code>192.0.2.44</code> or <code>192.0.2.44/32</code>. </p> </li> <li> <p>To allow the IP addresses <code>192.0.2.0</code> to <code>192.0.2.255</code>, specify <code>192.0.2.0/24</code>.</p> </li> </ul> <p>For more information about CIDR block notation, see <a href=\\\"https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation\\\">Classless Inter-Domain Routing</a> on <i>Wikipedia</i>.</p>\"\
        },\
        \"cidrListAliases\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>An alias that defines access for a preconfigured range of IP addresses.</p> <p>The only alias currently supported is <code>lightsail-connect</code>, which allows IP addresses of the browser-based RDP/SSH client in the Lightsail console to connect to your instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes ports to open on an instance, the IP addresses allowed to connect to the instance through the ports, and the protocol.</p>\"\
    },\
    \"PortInfoList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PortInfo\"}\
    },\
    \"PortInfoSourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DEFAULT\",\
        \"INSTANCE\",\
        \"NONE\",\
        \"CLOSED\"\
      ]\
    },\
    \"PortList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Port\"}\
    },\
    \"PortState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"open\",\
        \"closed\"\
      ]\
    },\
    \"PutAlarmRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"alarmName\",\
        \"metricName\",\
        \"monitoredResourceName\",\
        \"comparisonOperator\",\
        \"threshold\",\
        \"evaluationPeriods\"\
      ],\
      \"members\":{\
        \"alarmName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name for the alarm. Specify the name of an existing alarm to update, and overwrite the previous configuration of the alarm.</p>\"\
        },\
        \"metricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the metric to associate with the alarm.</p> <p>You can configure up to two alarms per metric.</p> <p>The following metrics are available for each resource type:</p> <ul> <li> <p> <b>Instances</b>: <code>CPUUtilization</code>, <code>NetworkIn</code>, <code>NetworkOut</code>, <code>StatusCheckFailed</code>, <code>StatusCheckFailed_Instance</code>, and <code>StatusCheckFailed_System</code>.</p> </li> <li> <p> <b>Load balancers</b>: <code>ClientTLSNegotiationErrorCount</code>, <code>HealthyHostCount</code>, <code>UnhealthyHostCount</code>, <code>HTTPCode_LB_4XX_Count</code>, <code>HTTPCode_LB_5XX_Count</code>, <code>HTTPCode_Instance_2XX_Count</code>, <code>HTTPCode_Instance_3XX_Count</code>, <code>HTTPCode_Instance_4XX_Count</code>, <code>HTTPCode_Instance_5XX_Count</code>, <code>InstanceResponseTime</code>, <code>RejectedConnectionCount</code>, and <code>RequestCount</code>.</p> </li> <li> <p> <b>Relational databases</b>: <code>CPUUtilization</code>, <code>DatabaseConnections</code>, <code>DiskQueueDepth</code>, <code>FreeStorageSpace</code>, <code>NetworkReceiveThroughput</code>, and <code>NetworkTransmitThroughput</code>.</p> </li> </ul>\"\
        },\
        \"monitoredResourceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the Lightsail resource that will be monitored.</p> <p>Instances, load balancers, and relational databases are the only Lightsail resources that can currently be monitored by alarms.</p>\"\
        },\
        \"comparisonOperator\":{\
          \"shape\":\"ComparisonOperator\",\
          \"documentation\":\"<p>The arithmetic operation to use when comparing the specified statistic to the threshold. The specified statistic value is used as the first operand.</p>\"\
        },\
        \"threshold\":{\
          \"shape\":\"double\",\
          \"documentation\":\"<p>The value against which the specified statistic is compared.</p>\"\
        },\
        \"evaluationPeriods\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The number of most recent periods over which data is compared to the specified threshold. If you are setting an \\\"M out of N\\\" alarm, this value (<code>evaluationPeriods</code>) is the N.</p> <p>If you are setting an alarm that requires that a number of consecutive data points be breaching to trigger the alarm, this value specifies the rolling period of time in which data points are evaluated.</p> <p>Each evaluation period is five minutes long. For example, specify an evaluation period of 24 to evaluate a metric over a rolling period of two hours.</p> <p>You can specify a minimum valuation period of 1 (5 minutes), and a maximum evaluation period of 288 (24 hours).</p>\"\
        },\
        \"datapointsToAlarm\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The number of data points that must be not within the specified threshold to trigger the alarm. If you are setting an \\\"M out of N\\\" alarm, this value (<code>datapointsToAlarm</code>) is the M.</p>\"\
        },\
        \"treatMissingData\":{\
          \"shape\":\"TreatMissingData\",\
          \"documentation\":\"<p>Sets how this alarm will handle missing data points.</p> <p>An alarm can treat missing data in the following ways:</p> <ul> <li> <p> <code>breaching</code> - Assume the missing data is not within the threshold. Missing data counts towards the number of times the metric is not within the threshold.</p> </li> <li> <p> <code>notBreaching</code> - Assume the missing data is within the threshold. Missing data does not count towards the number of times the metric is not within the threshold.</p> </li> <li> <p> <code>ignore</code> - Ignore the missing data. Maintains the current alarm state.</p> </li> <li> <p> <code>missing</code> - Missing data is treated as missing.</p> </li> </ul> <p>If <code>treatMissingData</code> is not specified, the default behavior of <code>missing</code> is used.</p>\"\
        },\
        \"contactProtocols\":{\
          \"shape\":\"ContactProtocolsList\",\
          \"documentation\":\"<p>The contact protocols to use for the alarm, such as <code>Email</code>, <code>SMS</code> (text messaging), or both.</p> <p>A notification is sent via the specified contact protocol if notifications are enabled for the alarm, and when the alarm is triggered.</p> <p>A notification is not sent if a contact protocol is not specified, if the specified contact protocol is not configured in the AWS Region, or if notifications are not enabled for the alarm using the <code>notificationEnabled</code> paramater.</p> <p>Use the <code>CreateContactMethod</code> action to configure a contact protocol in an AWS Region.</p>\"\
        },\
        \"notificationTriggers\":{\
          \"shape\":\"NotificationTriggerList\",\
          \"documentation\":\"<p>The alarm states that trigger a notification.</p> <p>An alarm has the following possible states:</p> <ul> <li> <p> <code>ALARM</code> - The metric is outside of the defined threshold.</p> </li> <li> <p> <code>INSUFFICIENT_DATA</code> - The alarm has just started, the metric is not available, or not enough data is available for the metric to determine the alarm state.</p> </li> <li> <p> <code>OK</code> - The metric is within the defined threshold.</p> </li> </ul> <p>When you specify a notification trigger, the <code>ALARM</code> state must be specified. The <code>INSUFFICIENT_DATA</code> and <code>OK</code> states can be specified in addition to the <code>ALARM</code> state.</p> <ul> <li> <p>If you specify <code>OK</code> as an alarm trigger, a notification is sent when the alarm switches from an <code>ALARM</code> or <code>INSUFFICIENT_DATA</code> alarm state to an <code>OK</code> state. This can be thought of as an <i>all clear</i> alarm notification.</p> </li> <li> <p>If you specify <code>INSUFFICIENT_DATA</code> as the alarm trigger, a notification is sent when the alarm switches from an <code>OK</code> or <code>ALARM</code> alarm state to an <code>INSUFFICIENT_DATA</code> state.</p> </li> </ul> <p>The notification trigger defaults to <code>ALARM</code> if you don't specify this parameter.</p>\"\
        },\
        \"notificationEnabled\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>Indicates whether the alarm is enabled.</p> <p>Notifications are enabled by default if you don't specify this parameter.</p>\"\
        }\
      }\
    },\
    \"PutAlarmResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"PutInstancePublicPortsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"portInfos\",\
        \"instanceName\"\
      ],\
      \"members\":{\
        \"portInfos\":{\
          \"shape\":\"PortInfoList\",\
          \"documentation\":\"<p>An array of objects to describe the ports to open for the specified instance.</p>\"\
        },\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the instance for which to open ports.</p>\"\
        }\
      }\
    },\
    \"PutInstancePublicPortsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operation\":{\
          \"shape\":\"Operation\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"RebootInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"instanceName\"],\
      \"members\":{\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the instance to reboot.</p>\"\
        }\
      }\
    },\
    \"RebootInstanceResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"RebootRelationalDatabaseRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"relationalDatabaseName\"],\
      \"members\":{\
        \"relationalDatabaseName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of your database to reboot.</p>\"\
        }\
      }\
    },\
    \"RebootRelationalDatabaseResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"RecordState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Started\",\
        \"Succeeded\",\
        \"Failed\"\
      ]\
    },\
    \"Region\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"continentCode\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The continent code (e.g., <code>NA</code>, meaning North America).</p>\"\
        },\
        \"description\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The description of the AWS Region (e.g., <code>This region is recommended to serve users in the eastern United States and eastern Canada</code>).</p>\"\
        },\
        \"displayName\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The display name (e.g., <code>Ohio</code>).</p>\"\
        },\
        \"name\":{\
          \"shape\":\"RegionName\",\
          \"documentation\":\"<p>The region name (e.g., <code>us-east-2</code>).</p>\"\
        },\
        \"availabilityZones\":{\
          \"shape\":\"AvailabilityZoneList\",\
          \"documentation\":\"<p>The Availability Zones. Follows the format <code>us-east-2a</code> (case-sensitive).</p>\"\
        },\
        \"relationalDatabaseAvailabilityZones\":{\
          \"shape\":\"AvailabilityZoneList\",\
          \"documentation\":\"<p>The Availability Zones for databases. Follows the format <code>us-east-2a</code> (case-sensitive).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the AWS Region.</p>\"\
    },\
    \"RegionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Region\"}\
    },\
    \"RegionName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"us-east-1\",\
        \"us-east-2\",\
        \"us-west-1\",\
        \"us-west-2\",\
        \"eu-west-1\",\
        \"eu-west-2\",\
        \"eu-west-3\",\
        \"eu-central-1\",\
        \"ca-central-1\",\
        \"ap-south-1\",\
        \"ap-southeast-1\",\
        \"ap-southeast-2\",\
        \"ap-northeast-1\",\
        \"ap-northeast-2\"\
      ]\
    },\
    \"RelationalDatabase\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The unique name of the database resource in Lightsail.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the database.</p>\"\
        },\
        \"supportCode\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The support code for the database. Include this code in your email to support when you have questions about a database in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The timestamp when the database was created. Formatted in Unix time.</p>\"\
        },\
        \"location\":{\
          \"shape\":\"ResourceLocation\",\
          \"documentation\":\"<p>The Region name and Availability Zone where the database is located.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The Lightsail resource type for the database (for example, <code>RelationalDatabase</code>).</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags\\\">Lightsail Dev Guide</a>.</p>\"\
        },\
        \"relationalDatabaseBlueprintId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The blueprint ID for the database. A blueprint describes the major engine version of a database.</p>\"\
        },\
        \"relationalDatabaseBundleId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The bundle ID for the database. A bundle describes the performance specifications for your database.</p>\"\
        },\
        \"masterDatabaseName\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The name of the master database created when the Lightsail database resource is created.</p>\"\
        },\
        \"hardware\":{\
          \"shape\":\"RelationalDatabaseHardware\",\
          \"documentation\":\"<p>Describes the hardware of the database.</p>\"\
        },\
        \"state\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Describes the current state of the database.</p>\"\
        },\
        \"secondaryAvailabilityZone\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Describes the secondary Availability Zone of a high availability database.</p> <p>The secondary database is used for failover support of a high availability database.</p>\"\
        },\
        \"backupRetentionEnabled\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether automated backup retention is enabled for the database.</p>\"\
        },\
        \"pendingModifiedValues\":{\
          \"shape\":\"PendingModifiedRelationalDatabaseValues\",\
          \"documentation\":\"<p>Describes pending database value modifications.</p>\"\
        },\
        \"engine\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The database software (for example, <code>MySQL</code>).</p>\"\
        },\
        \"engineVersion\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The database engine version (for example, <code>5.7.23</code>).</p>\"\
        },\
        \"latestRestorableTime\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The latest point in time to which the database can be restored. Formatted in Unix time.</p>\"\
        },\
        \"masterUsername\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The master user name of the database.</p>\"\
        },\
        \"parameterApplyStatus\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The status of parameter updates for the database.</p>\"\
        },\
        \"preferredBackupWindow\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The daily time range during which automated backups are created for the database (for example, <code>16:00-16:30</code>).</p>\"\
        },\
        \"preferredMaintenanceWindow\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The weekly time range during which system maintenance can occur on the database.</p> <p>In the format <code>ddd:hh24:mi-ddd:hh24:mi</code>. For example, <code>Tue:17:00-Tue:17:30</code>.</p>\"\
        },\
        \"publiclyAccessible\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether the database is publicly accessible.</p>\"\
        },\
        \"masterEndpoint\":{\
          \"shape\":\"RelationalDatabaseEndpoint\",\
          \"documentation\":\"<p>The master endpoint for the database.</p>\"\
        },\
        \"pendingMaintenanceActions\":{\
          \"shape\":\"PendingMaintenanceActionList\",\
          \"documentation\":\"<p>Describes the pending maintenance actions for the database.</p>\"\
        },\
        \"caCertificateIdentifier\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The certificate associated with the database.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a database.</p>\"\
    },\
    \"RelationalDatabaseBlueprint\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"blueprintId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The ID for the database blueprint.</p>\"\
        },\
        \"engine\":{\
          \"shape\":\"RelationalDatabaseEngine\",\
          \"documentation\":\"<p>The database software of the database blueprint (for example, <code>MySQL</code>).</p>\"\
        },\
        \"engineVersion\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The database engine version for the database blueprint (for example, <code>5.7.23</code>).</p>\"\
        },\
        \"engineDescription\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The description of the database engine for the database blueprint.</p>\"\
        },\
        \"engineVersionDescription\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The description of the database engine version for the database blueprint.</p>\"\
        },\
        \"isEngineDefault\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether the engine version is the default for the database blueprint.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a database image, or blueprint. A blueprint describes the major engine version of a database.</p>\"\
    },\
    \"RelationalDatabaseBlueprintList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RelationalDatabaseBlueprint\"}\
    },\
    \"RelationalDatabaseBundle\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"bundleId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The ID for the database bundle.</p>\"\
        },\
        \"name\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The name for the database bundle.</p>\"\
        },\
        \"price\":{\
          \"shape\":\"float\",\
          \"documentation\":\"<p>The cost of the database bundle in US currency.</p>\"\
        },\
        \"ramSizeInGb\":{\
          \"shape\":\"float\",\
          \"documentation\":\"<p>The amount of RAM in GB (for example, <code>2.0</code>) for the database bundle.</p>\"\
        },\
        \"diskSizeInGb\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The size of the disk for the database bundle.</p>\"\
        },\
        \"transferPerMonthInGb\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The data transfer rate per month in GB for the database bundle.</p>\"\
        },\
        \"cpuCount\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The number of virtual CPUs (vCPUs) for the database bundle.</p>\"\
        },\
        \"isEncrypted\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether the database bundle is encrypted.</p>\"\
        },\
        \"isActive\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether the database bundle is active.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a database bundle. A bundle describes the performance specifications of the database.</p>\"\
    },\
    \"RelationalDatabaseBundleList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RelationalDatabaseBundle\"}\
    },\
    \"RelationalDatabaseEndpoint\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"port\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>Specifies the port that the database is listening on.</p>\"\
        },\
        \"address\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Specifies the DNS address of the database.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an endpoint for a database.</p>\"\
    },\
    \"RelationalDatabaseEngine\":{\
      \"type\":\"string\",\
      \"enum\":[\"mysql\"]\
    },\
    \"RelationalDatabaseEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resource\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The database that the database event relates to.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The timestamp when the database event was created.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The message of the database event.</p>\"\
        },\
        \"eventCategories\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>The category that the database event belongs to.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an event for a database.</p>\"\
    },\
    \"RelationalDatabaseEventList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RelationalDatabaseEvent\"}\
    },\
    \"RelationalDatabaseHardware\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"cpuCount\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The number of vCPUs for the database.</p>\"\
        },\
        \"diskSizeInGb\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The size of the disk for the database.</p>\"\
        },\
        \"ramSizeInGb\":{\
          \"shape\":\"float\",\
          \"documentation\":\"<p>The amount of RAM in GB for the database.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the hardware of a database.</p>\"\
    },\
    \"RelationalDatabaseList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RelationalDatabase\"}\
    },\
    \"RelationalDatabaseMetricName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CPUUtilization\",\
        \"DatabaseConnections\",\
        \"DiskQueueDepth\",\
        \"FreeStorageSpace\",\
        \"NetworkReceiveThroughput\",\
        \"NetworkTransmitThroughput\"\
      ]\
    },\
    \"RelationalDatabaseParameter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"allowedValues\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Specifies the valid range of values for the parameter.</p>\"\
        },\
        \"applyMethod\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Indicates when parameter updates are applied.</p> <p>Can be <code>immediate</code> or <code>pending-reboot</code>.</p>\"\
        },\
        \"applyType\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Specifies the engine-specific parameter type.</p>\"\
        },\
        \"dataType\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Specifies the valid data type for the parameter.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Provides a description of the parameter.</p>\"\
        },\
        \"isModifiable\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether the parameter can be modified.</p>\"\
        },\
        \"parameterName\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Specifies the name of the parameter.</p>\"\
        },\
        \"parameterValue\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Specifies the value of the parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the parameters of a database.</p>\"\
    },\
    \"RelationalDatabaseParameterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RelationalDatabaseParameter\"}\
    },\
    \"RelationalDatabasePasswordVersion\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CURRENT\",\
        \"PREVIOUS\",\
        \"PENDING\"\
      ]\
    },\
    \"RelationalDatabaseSnapshot\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the database snapshot.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the database snapshot.</p>\"\
        },\
        \"supportCode\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The support code for the database snapshot. Include this code in your email to support when you have questions about a database snapshot in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The timestamp when the database snapshot was created.</p>\"\
        },\
        \"location\":{\
          \"shape\":\"ResourceLocation\",\
          \"documentation\":\"<p>The Region name and Availability Zone where the database snapshot is located.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The Lightsail resource type.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags\\\">Lightsail Dev Guide</a>.</p>\"\
        },\
        \"engine\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The software of the database snapshot (for example, <code>MySQL</code>)</p>\"\
        },\
        \"engineVersion\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The database engine version for the database snapshot (for example, <code>5.7.23</code>).</p>\"\
        },\
        \"sizeInGb\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The size of the disk in GB (for example, <code>32</code>) for the database snapshot.</p>\"\
        },\
        \"state\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The state of the database snapshot.</p>\"\
        },\
        \"fromRelationalDatabaseName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the source database from which the database snapshot was created.</p>\"\
        },\
        \"fromRelationalDatabaseArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the database from which the database snapshot was created.</p>\"\
        },\
        \"fromRelationalDatabaseBundleId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The bundle ID of the database from which the database snapshot was created.</p>\"\
        },\
        \"fromRelationalDatabaseBlueprintId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The blueprint ID of the database from which the database snapshot was created. A blueprint describes the major engine version of a database.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a database snapshot.</p>\"\
    },\
    \"RelationalDatabaseSnapshotList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RelationalDatabaseSnapshot\"}\
    },\
    \"ReleaseStaticIpRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"staticIpName\"],\
      \"members\":{\
        \"staticIpName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the static IP to delete.</p>\"\
        }\
      }\
    },\
    \"ReleaseStaticIpResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"ResourceArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"^arn:(aws[^:]*):([a-zA-Z0-9-]+):([a-z0-9-]+):([0-9]+):([a-zA-Z]+)/([a-zA-Z0-9-]+)$\"\
    },\
    \"ResourceLocation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"availabilityZone\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The Availability Zone. Follows the format <code>us-east-2a</code> (case-sensitive).</p>\"\
        },\
        \"regionName\":{\
          \"shape\":\"RegionName\",\
          \"documentation\":\"<p>The AWS Region name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the resource location.</p>\"\
    },\
    \"ResourceName\":{\
      \"type\":\"string\",\
      \"pattern\":\"\\\\w[\\\\w\\\\-]*\\\\w\"\
    },\
    \"ResourceNameList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceName\"}\
    },\
    \"ResourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Instance\",\
        \"StaticIp\",\
        \"KeyPair\",\
        \"InstanceSnapshot\",\
        \"Domain\",\
        \"PeeredVpc\",\
        \"LoadBalancer\",\
        \"LoadBalancerTlsCertificate\",\
        \"Disk\",\
        \"DiskSnapshot\",\
        \"RelationalDatabase\",\
        \"RelationalDatabaseSnapshot\",\
        \"ExportSnapshotRecord\",\
        \"CloudFormationStackRecord\",\
        \"Alarm\",\
        \"ContactMethod\"\
      ]\
    },\
    \"SendContactMethodVerificationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"protocol\"],\
      \"members\":{\
        \"protocol\":{\
          \"shape\":\"ContactMethodVerificationProtocol\",\
          \"documentation\":\"<p>The protocol to verify, such as <code>Email</code> or <code>SMS</code> (text messaging).</p>\"\
        }\
      }\
    },\
    \"SendContactMethodVerificationResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"SensitiveString\":{\
      \"type\":\"string\",\
      \"sensitive\":true\
    },\
    \"ServiceException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"code\":{\"shape\":\"string\"},\
        \"docs\":{\"shape\":\"string\"},\
        \"message\":{\"shape\":\"string\"},\
        \"tip\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>A general service exception.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"StartInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"instanceName\"],\
      \"members\":{\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the instance (a virtual private server) to start.</p>\"\
        }\
      }\
    },\
    \"StartInstanceResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"StartRelationalDatabaseRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"relationalDatabaseName\"],\
      \"members\":{\
        \"relationalDatabaseName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of your database to start.</p>\"\
        }\
      }\
    },\
    \"StartRelationalDatabaseResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"StaticIp\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the static IP (e.g., <code>StaticIP-Ohio-EXAMPLE</code>).</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the static IP (e.g., <code>arn:aws:lightsail:us-east-2:123456789101:StaticIp/9cbb4a9e-f8e3-4dfe-b57e-12345EXAMPLE</code>).</p>\"\
        },\
        \"supportCode\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"IsoDate\",\
          \"documentation\":\"<p>The timestamp when the static IP was created (e.g., <code>1479735304.222</code>).</p>\"\
        },\
        \"location\":{\
          \"shape\":\"ResourceLocation\",\
          \"documentation\":\"<p>The region and Availability Zone where the static IP was created.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The resource type (usually <code>StaticIp</code>).</p>\"\
        },\
        \"ipAddress\":{\
          \"shape\":\"IpAddress\",\
          \"documentation\":\"<p>The static IP address.</p>\"\
        },\
        \"attachedTo\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The instance where the static IP is attached (e.g., <code>Amazon_Linux-1GB-Ohio-1</code>).</p>\"\
        },\
        \"isAttached\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value indicating whether the static IP is attached.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the static IP.</p>\"\
    },\
    \"StaticIpList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StaticIp\"}\
    },\
    \"StopInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"instanceName\"],\
      \"members\":{\
        \"instanceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the instance (a virtual private server) to stop.</p>\"\
        },\
        \"force\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>When set to <code>True</code>, forces a Lightsail instance that is stuck in a <code>stopping</code> state to stop.</p> <important> <p>Only use the <code>force</code> parameter if your instance is stuck in the <code>stopping</code> state. In any other state, your instance should stop normally without adding this parameter to your API request.</p> </important>\"\
        }\
      }\
    },\
    \"StopInstanceResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"StopRelationalDatabaseRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"relationalDatabaseName\"],\
      \"members\":{\
        \"relationalDatabaseName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of your database to stop.</p>\"\
        },\
        \"relationalDatabaseSnapshotName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of your new database snapshot to be created before stopping your database.</p>\"\
        }\
      }\
    },\
    \"StopRelationalDatabaseResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"StringList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"string\"}\
    },\
    \"StringMax256\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The key of the tag.</p> <p>Constraints: Tag keys accept a maximum of 128 letters, numbers, spaces in UTF-8, or the following characters: + - = . _ : / @</p>\"\
        },\
        \"value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The value of the tag.</p> <p>Constraints: Tag values accept a maximum of 256 letters, numbers, spaces in UTF-8, or the following characters: + - = . _ : / @</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a tag key and optional value assigned to an Amazon Lightsail resource.</p> <p>For more information about tags in Lightsail, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags\\\">Lightsail Dev Guide</a>.</p>\"\
    },\
    \"TagKey\":{\"type\":\"string\"},\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"}\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"}\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceName\",\
        \"tags\"\
      ],\
      \"members\":{\
        \"resourceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the resource to which you are adding tags.</p>\"\
        },\
        \"resourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource to which you want to add a tag.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag key and optional value.</p>\"\
        }\
      }\
    },\
    \"TagResourceResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"TagValue\":{\"type\":\"string\"},\
    \"TestAlarmRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"alarmName\",\
        \"state\"\
      ],\
      \"members\":{\
        \"alarmName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the alarm to test.</p>\"\
        },\
        \"state\":{\
          \"shape\":\"AlarmState\",\
          \"documentation\":\"<p>The alarm state to test.</p> <p>An alarm has the following possible states that can be tested:</p> <ul> <li> <p> <code>ALARM</code> - The metric is outside of the defined threshold.</p> </li> <li> <p> <code>INSUFFICIENT_DATA</code> - The alarm has just started, the metric is not available, or not enough data is available for the metric to determine the alarm state.</p> </li> <li> <p> <code>OK</code> - The metric is within the defined threshold.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"TestAlarmResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"TimeOfDay\":{\
      \"type\":\"string\",\
      \"pattern\":\"^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$\"\
    },\
    \"TreatMissingData\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"breaching\",\
        \"notBreaching\",\
        \"ignore\",\
        \"missing\"\
      ]\
    },\
    \"UnauthenticatedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"code\":{\"shape\":\"string\"},\
        \"docs\":{\"shape\":\"string\"},\
        \"message\":{\"shape\":\"string\"},\
        \"tip\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>Lightsail throws this exception when the user has not been authenticated.</p>\",\
      \"exception\":true\
    },\
    \"UnpeerVpcRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UnpeerVpcResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operation\":{\
          \"shape\":\"Operation\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceName\",\
        \"tagKeys\"\
      ],\
      \"members\":{\
        \"resourceName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the resource from which you are removing a tag.</p>\"\
        },\
        \"resourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource from which you want to remove a tag.</p>\"\
        },\
        \"tagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The tag keys to delete from the specified resource.</p>\"\
        }\
      }\
    },\
    \"UntagResourceResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"UpdateDomainEntryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"domainName\",\
        \"domainEntry\"\
      ],\
      \"members\":{\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain recordset to update.</p>\"\
        },\
        \"domainEntry\":{\
          \"shape\":\"DomainEntry\",\
          \"documentation\":\"<p>An array of key-value pairs containing information about the domain entry.</p>\"\
        }\
      }\
    },\
    \"UpdateDomainEntryResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"UpdateLoadBalancerAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"loadBalancerName\",\
        \"attributeName\",\
        \"attributeValue\"\
      ],\
      \"members\":{\
        \"loadBalancerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the load balancer that you want to modify (e.g., <code>my-load-balancer</code>.</p>\"\
        },\
        \"attributeName\":{\
          \"shape\":\"LoadBalancerAttributeName\",\
          \"documentation\":\"<p>The name of the attribute you want to update. Valid values are below.</p>\"\
        },\
        \"attributeValue\":{\
          \"shape\":\"StringMax256\",\
          \"documentation\":\"<p>The value that you want to specify for the attribute name.</p>\"\
        }\
      }\
    },\
    \"UpdateLoadBalancerAttributeResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"UpdateRelationalDatabaseParametersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"relationalDatabaseName\",\
        \"parameters\"\
      ],\
      \"members\":{\
        \"relationalDatabaseName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of your database for which to update parameters.</p>\"\
        },\
        \"parameters\":{\
          \"shape\":\"RelationalDatabaseParameterList\",\
          \"documentation\":\"<p>The database parameters to update.</p>\"\
        }\
      }\
    },\
    \"UpdateRelationalDatabaseParametersResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"UpdateRelationalDatabaseRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"relationalDatabaseName\"],\
      \"members\":{\
        \"relationalDatabaseName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of your database to update.</p>\"\
        },\
        \"masterUserPassword\":{\
          \"shape\":\"SensitiveString\",\
          \"documentation\":\"<p>The password for the master user of your database. The password can include any printable ASCII character except \\\"/\\\", \\\"\\\"\\\", or \\\"@\\\".</p> <p>Constraints: Must contain 8 to 41 characters.</p>\"\
        },\
        \"rotateMasterUserPassword\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>When <code>true</code>, the master user password is changed to a new strong password generated by Lightsail.</p> <p>Use the <code>get relational database master user password</code> operation to get the new password.</p>\"\
        },\
        \"preferredBackupWindow\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The daily time range during which automated backups are created for your database if automated backups are enabled.</p> <p>Constraints:</p> <ul> <li> <p>Must be in the <code>hh24:mi-hh24:mi</code> format.</p> <p>Example: <code>16:00-16:30</code> </p> </li> <li> <p>Specified in Coordinated Universal Time (UTC).</p> </li> <li> <p>Must not conflict with the preferred maintenance window.</p> </li> <li> <p>Must be at least 30 minutes.</p> </li> </ul>\"\
        },\
        \"preferredMaintenanceWindow\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The weekly time range during which system maintenance can occur on your database.</p> <p>The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week.</p> <p>Constraints:</p> <ul> <li> <p>Must be in the <code>ddd:hh24:mi-ddd:hh24:mi</code> format.</p> </li> <li> <p>Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.</p> </li> <li> <p>Must be at least 30 minutes.</p> </li> <li> <p>Specified in Coordinated Universal Time (UTC).</p> </li> <li> <p>Example: <code>Tue:17:00-Tue:17:30</code> </p> </li> </ul>\"\
        },\
        \"enableBackupRetention\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>When <code>true</code>, enables automated backup retention for your database.</p> <p>Updates are applied during the next maintenance window because this can result in an outage.</p>\"\
        },\
        \"disableBackupRetention\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>When <code>true</code>, disables automated backup retention for your database.</p> <p>Disabling backup retention deletes all automated database backups. Before disabling this, you may want to create a snapshot of your database using the <code>create relational database snapshot</code> operation.</p> <p>Updates are applied during the next maintenance window because this can result in an outage.</p>\"\
        },\
        \"publiclyAccessible\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>Specifies the accessibility options for your database. A value of <code>true</code> specifies a database that is available to resources outside of your Lightsail account. A value of <code>false</code> specifies a database that is available only to your Lightsail resources in the same region as your database.</p>\"\
        },\
        \"applyImmediately\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>When <code>true</code>, applies changes immediately. When <code>false</code>, applies changes during the preferred maintenance window. Some changes may cause an outage.</p> <p>Default: <code>false</code> </p>\"\
        },\
        \"caCertificateIdentifier\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Indicates the certificate that needs to be associated with the database.</p>\"\
        }\
      }\
    },\
    \"UpdateRelationalDatabaseResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"operations\":{\
          \"shape\":\"OperationList\",\
          \"documentation\":\"<p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>\"\
        }\
      }\
    },\
    \"boolean\":{\"type\":\"boolean\"},\
    \"double\":{\"type\":\"double\"},\
    \"float\":{\"type\":\"float\"},\
    \"integer\":{\"type\":\"integer\"},\
    \"string\":{\"type\":\"string\"},\
    \"timestamp\":{\"type\":\"timestamp\"}\
  },\
  \"documentation\":\"<p>Amazon Lightsail is the easiest way to get started with AWS for developers who just need virtual private servers. Lightsail includes everything you need to launch your project quickly - a virtual machine, a managed database, SSD-based storage, data transfer, DNS management, and a static IP - for a low, predictable price. You manage those Lightsail servers through the Lightsail console or by using the API or command-line interface (CLI).</p> <p>For more information about Lightsail concepts and tasks, see the <a href=\\\"https://lightsail.aws.amazon.com/ls/docs/all\\\">Lightsail Dev Guide</a>.</p> <p>To use the Lightsail API or the CLI, you will need to use AWS Identity and Access Management (IAM) to generate access keys. For details about how to set this up, see the <a href=\\\"http://lightsail.aws.amazon.com/ls/docs/how-to/article/lightsail-how-to-set-up-access-keys-to-use-sdk-api-cli\\\">Lightsail Dev Guide</a>.</p>\"\
}\
";
}

@end
