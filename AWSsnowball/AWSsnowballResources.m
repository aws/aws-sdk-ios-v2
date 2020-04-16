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

#import "AWSsnowballResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSsnowballResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSsnowballResources

+ (instancetype)sharedInstance {
    static AWSsnowballResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSsnowballResources new];
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
    \"apiVersion\":\"2016-06-30\",\
    \"endpointPrefix\":\"snowball\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceAbbreviation\":\"Amazon Snowball\",\
    \"serviceFullName\":\"Amazon Import/Export Snowball\",\
    \"serviceId\":\"Snowball\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"AWSIESnowballJobManagementService\",\
    \"uid\":\"snowball-2016-06-30\"\
  },\
  \"operations\":{\
    \"CancelCluster\":{\
      \"name\":\"CancelCluster\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelClusterRequest\"},\
      \"output\":{\"shape\":\"CancelClusterResult\"},\
      \"errors\":[\
        {\"shape\":\"KMSRequestFailedException\"},\
        {\"shape\":\"InvalidJobStateException\"},\
        {\"shape\":\"InvalidResourceException\"}\
      ],\
      \"documentation\":\"<p>Cancels a cluster job. You can only cancel a cluster job while it's in the <code>AwaitingQuorum</code> status. You'll have at least an hour after creating a cluster job to cancel it.</p>\"\
    },\
    \"CancelJob\":{\
      \"name\":\"CancelJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelJobRequest\"},\
      \"output\":{\"shape\":\"CancelJobResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidResourceException\"},\
        {\"shape\":\"InvalidJobStateException\"},\
        {\"shape\":\"KMSRequestFailedException\"}\
      ],\
      \"documentation\":\"<p>Cancels the specified job. You can only cancel a job before its <code>JobState</code> value changes to <code>PreparingAppliance</code>. Requesting the <code>ListJobs</code> or <code>DescribeJob</code> action returns a job's <code>JobState</code> as part of the response element data returned.</p>\"\
    },\
    \"CreateAddress\":{\
      \"name\":\"CreateAddress\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateAddressRequest\"},\
      \"output\":{\"shape\":\"CreateAddressResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidAddressException\"},\
        {\"shape\":\"UnsupportedAddressException\"}\
      ],\
      \"documentation\":\"<p>Creates an address for a Snowball to be shipped to. In most regions, addresses are validated at the time of creation. The address you provide must be located within the serviceable area of your region. If the address is invalid or unsupported, then an exception is thrown.</p>\"\
    },\
    \"CreateCluster\":{\
      \"name\":\"CreateCluster\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateClusterRequest\"},\
      \"output\":{\"shape\":\"CreateClusterResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidResourceException\"},\
        {\"shape\":\"KMSRequestFailedException\"},\
        {\"shape\":\"InvalidInputCombinationException\"},\
        {\"shape\":\"Ec2RequestFailedException\"}\
      ],\
      \"documentation\":\"<p>Creates an empty cluster. Each cluster supports five nodes. You use the <a>CreateJob</a> action separately to create the jobs for each of these nodes. The cluster does not ship until these five node jobs have been created.</p>\"\
    },\
    \"CreateJob\":{\
      \"name\":\"CreateJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateJobRequest\"},\
      \"output\":{\"shape\":\"CreateJobResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidResourceException\"},\
        {\"shape\":\"KMSRequestFailedException\"},\
        {\"shape\":\"InvalidInputCombinationException\"},\
        {\"shape\":\"ClusterLimitExceededException\"},\
        {\"shape\":\"Ec2RequestFailedException\"}\
      ],\
      \"documentation\":\"<p>Creates a job to import or export data between Amazon S3 and your on-premises data center. Your AWS account must have the right trust policies and permissions in place to create a job for Snowball. If you're creating a job for a node in a cluster, you only need to provide the <code>clusterId</code> value; the other job attributes are inherited from the cluster. </p>\"\
    },\
    \"DescribeAddress\":{\
      \"name\":\"DescribeAddress\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeAddressRequest\"},\
      \"output\":{\"shape\":\"DescribeAddressResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidResourceException\"}\
      ],\
      \"documentation\":\"<p>Takes an <code>AddressId</code> and returns specific details about that address in the form of an <code>Address</code> object.</p>\"\
    },\
    \"DescribeAddresses\":{\
      \"name\":\"DescribeAddresses\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeAddressesRequest\"},\
      \"output\":{\"shape\":\"DescribeAddressesResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidResourceException\"},\
        {\"shape\":\"InvalidNextTokenException\"}\
      ],\
      \"documentation\":\"<p>Returns a specified number of <code>ADDRESS</code> objects. Calling this API in one of the US regions will return addresses from the list of all addresses associated with this account in all US regions.</p>\"\
    },\
    \"DescribeCluster\":{\
      \"name\":\"DescribeCluster\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeClusterRequest\"},\
      \"output\":{\"shape\":\"DescribeClusterResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidResourceException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a specific cluster including shipping information, cluster status, and other important metadata.</p>\"\
    },\
    \"DescribeJob\":{\
      \"name\":\"DescribeJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeJobRequest\"},\
      \"output\":{\"shape\":\"DescribeJobResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidResourceException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a specific job including shipping information, job status, and other important metadata. </p>\"\
    },\
    \"GetJobManifest\":{\
      \"name\":\"GetJobManifest\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetJobManifestRequest\"},\
      \"output\":{\"shape\":\"GetJobManifestResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidResourceException\"},\
        {\"shape\":\"InvalidJobStateException\"}\
      ],\
      \"documentation\":\"<p>Returns a link to an Amazon S3 presigned URL for the manifest file associated with the specified <code>JobId</code> value. You can access the manifest file for up to 60 minutes after this request has been made. To access the manifest file after 60 minutes have passed, you'll have to make another call to the <code>GetJobManifest</code> action.</p> <p>The manifest is an encrypted file that you can download after your job enters the <code>WithCustomer</code> status. The manifest is decrypted by using the <code>UnlockCode</code> code value, when you pass both values to the Snowball through the Snowball client when the client is started for the first time.</p> <p>As a best practice, we recommend that you don't save a copy of an <code>UnlockCode</code> value in the same location as the manifest file for that job. Saving these separately helps prevent unauthorized parties from gaining access to the Snowball associated with that job.</p> <p>The credentials of a given job, including its manifest file and unlock code, expire 90 days after the job is created.</p>\"\
    },\
    \"GetJobUnlockCode\":{\
      \"name\":\"GetJobUnlockCode\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetJobUnlockCodeRequest\"},\
      \"output\":{\"shape\":\"GetJobUnlockCodeResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidResourceException\"},\
        {\"shape\":\"InvalidJobStateException\"}\
      ],\
      \"documentation\":\"<p>Returns the <code>UnlockCode</code> code value for the specified job. A particular <code>UnlockCode</code> value can be accessed for up to 90 days after the associated job has been created.</p> <p>The <code>UnlockCode</code> value is a 29-character code with 25 alphanumeric characters and 4 hyphens. This code is used to decrypt the manifest file when it is passed along with the manifest to the Snowball through the Snowball client when the client is started for the first time.</p> <p>As a best practice, we recommend that you don't save a copy of the <code>UnlockCode</code> in the same location as the manifest file for that job. Saving these separately helps prevent unauthorized parties from gaining access to the Snowball associated with that job.</p>\"\
    },\
    \"GetSnowballUsage\":{\
      \"name\":\"GetSnowballUsage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetSnowballUsageRequest\"},\
      \"output\":{\"shape\":\"GetSnowballUsageResult\"},\
      \"documentation\":\"<p>Returns information about the Snowball service limit for your account, and also the number of Snowballs your account has in use.</p> <p>The default service limit for the number of Snowballs that you can have at one time is 1. If you want to increase your service limit, contact AWS Support.</p>\"\
    },\
    \"GetSoftwareUpdates\":{\
      \"name\":\"GetSoftwareUpdates\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetSoftwareUpdatesRequest\"},\
      \"output\":{\"shape\":\"GetSoftwareUpdatesResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidResourceException\"},\
        {\"shape\":\"InvalidJobStateException\"}\
      ],\
      \"documentation\":\"<p>Returns an Amazon S3 presigned URL for an update file associated with a specified <code>JobId</code>.</p>\"\
    },\
    \"ListClusterJobs\":{\
      \"name\":\"ListClusterJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListClusterJobsRequest\"},\
      \"output\":{\"shape\":\"ListClusterJobsResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidResourceException\"},\
        {\"shape\":\"InvalidNextTokenException\"}\
      ],\
      \"documentation\":\"<p>Returns an array of <code>JobListEntry</code> objects of the specified length. Each <code>JobListEntry</code> object is for a job in the specified cluster and contains a job's state, a job's ID, and other information.</p>\"\
    },\
    \"ListClusters\":{\
      \"name\":\"ListClusters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListClustersRequest\"},\
      \"output\":{\"shape\":\"ListClustersResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidNextTokenException\"}\
      ],\
      \"documentation\":\"<p>Returns an array of <code>ClusterListEntry</code> objects of the specified length. Each <code>ClusterListEntry</code> object contains a cluster's state, a cluster's ID, and other important status information.</p>\"\
    },\
    \"ListCompatibleImages\":{\
      \"name\":\"ListCompatibleImages\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListCompatibleImagesRequest\"},\
      \"output\":{\"shape\":\"ListCompatibleImagesResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"Ec2RequestFailedException\"}\
      ],\
      \"documentation\":\"<p>This action returns a list of the different Amazon EC2 Amazon Machine Images (AMIs) that are owned by your AWS account that would be supported for use on a Snowball Edge device. Currently, supported AMIs are based on the CentOS 7 (x86_64) - with Updates HVM, Ubuntu Server 14.04 LTS (HVM), and Ubuntu 16.04 LTS - Xenial (HVM) images, available on the AWS Marketplace.</p>\"\
    },\
    \"ListJobs\":{\
      \"name\":\"ListJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListJobsRequest\"},\
      \"output\":{\"shape\":\"ListJobsResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidNextTokenException\"}\
      ],\
      \"documentation\":\"<p>Returns an array of <code>JobListEntry</code> objects of the specified length. Each <code>JobListEntry</code> object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of export jobs. Calling this API action in one of the US regions will return jobs from the list of all jobs associated with this account in all US regions.</p>\"\
    },\
    \"UpdateCluster\":{\
      \"name\":\"UpdateCluster\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateClusterRequest\"},\
      \"output\":{\"shape\":\"UpdateClusterResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidResourceException\"},\
        {\"shape\":\"InvalidJobStateException\"},\
        {\"shape\":\"KMSRequestFailedException\"},\
        {\"shape\":\"InvalidInputCombinationException\"},\
        {\"shape\":\"Ec2RequestFailedException\"}\
      ],\
      \"documentation\":\"<p>While a cluster's <code>ClusterState</code> value is in the <code>AwaitingQuorum</code> state, you can update some of the information associated with a cluster. Once the cluster changes to a different job state, usually 60 minutes after the cluster being created, this action is no longer available.</p>\"\
    },\
    \"UpdateJob\":{\
      \"name\":\"UpdateJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateJobRequest\"},\
      \"output\":{\"shape\":\"UpdateJobResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidResourceException\"},\
        {\"shape\":\"InvalidJobStateException\"},\
        {\"shape\":\"KMSRequestFailedException\"},\
        {\"shape\":\"InvalidInputCombinationException\"},\
        {\"shape\":\"ClusterLimitExceededException\"},\
        {\"shape\":\"Ec2RequestFailedException\"}\
      ],\
      \"documentation\":\"<p>While a job's <code>JobState</code> value is <code>New</code>, you can update some of the information associated with a job. Once the job changes to a different job state, usually within 60 minutes of the job being created, this action is no longer available.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"Address\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AddressId\":{\
          \"shape\":\"AddressId\",\
          \"documentation\":\"<p>The unique ID for an address.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of a person to receive a Snowball at an address.</p>\"\
        },\
        \"Company\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the company to receive a Snowball at an address.</p>\"\
        },\
        \"Street1\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The first line in a street address that a Snowball is to be delivered to.</p>\"\
        },\
        \"Street2\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The second line in a street address that a Snowball is to be delivered to.</p>\"\
        },\
        \"Street3\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The third line in a street address that a Snowball is to be delivered to.</p>\"\
        },\
        \"City\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The city in an address that a Snowball is to be delivered to.</p>\"\
        },\
        \"StateOrProvince\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The state or province in an address that a Snowball is to be delivered to.</p>\"\
        },\
        \"PrefectureOrDistrict\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>This field is no longer used and the value is ignored.</p>\"\
        },\
        \"Landmark\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>This field is no longer used and the value is ignored.</p>\"\
        },\
        \"Country\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The country in an address that a Snowball is to be delivered to.</p>\"\
        },\
        \"PostalCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The postal code in an address that a Snowball is to be delivered to.</p>\"\
        },\
        \"PhoneNumber\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The phone number associated with an address that a Snowball is to be delivered to.</p>\"\
        },\
        \"IsRestricted\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If the address you are creating is a primary address, then set this option to true. This field is not supported in most regions.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The address that you want the Snowball or Snowballs associated with a specific job to be shipped to. Addresses are validated at the time of creation. The address you provide must be located within the serviceable area of your region. Although no individual elements of the <code>Address</code> are required, if the address is invalid or unsupported, then an exception is thrown.</p>\"\
    },\
    \"AddressId\":{\
      \"type\":\"string\",\
      \"max\":40,\
      \"min\":40,\
      \"pattern\":\"ADID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\"\
    },\
    \"AddressList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Address\"}\
    },\
    \"AmiId\":{\
      \"type\":\"string\",\
      \"max\":21,\
      \"min\":12,\
      \"pattern\":\"(ami-[0-9a-f]{8})|(ami-[0-9a-f]{17})\"\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"CancelClusterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ClusterId\"],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>The 39-character ID for the cluster that you want to cancel, for example <code>CID123e4567-e89b-12d3-a456-426655440000</code>.</p>\"\
        }\
      }\
    },\
    \"CancelClusterResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"CancelJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The 39-character job ID for the job that you want to cancel, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>\"\
        }\
      }\
    },\
    \"CancelJobResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"ClusterId\":{\
      \"type\":\"string\",\
      \"max\":39,\
      \"min\":39,\
      \"pattern\":\"CID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\"\
    },\
    \"ClusterLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Job creation failed. Currently, clusters support five nodes. If you have less than five nodes for your cluster and you have more nodes to create for this cluster, try again and create jobs until your cluster has exactly five notes.</p>\",\
      \"exception\":true\
    },\
    \"ClusterListEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The 39-character ID for the cluster that you want to list, for example <code>CID123e4567-e89b-12d3-a456-426655440000</code>.</p>\"\
        },\
        \"ClusterState\":{\
          \"shape\":\"ClusterState\",\
          \"documentation\":\"<p>The current state of this cluster. For information about the state of a specific node, see <a>JobListEntry$JobState</a>.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation date for this cluster.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Defines an optional description of the cluster, for example <code>Environmental Data Cluster-01</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains a cluster's state, a cluster's ID, and other important information.</p>\"\
    },\
    \"ClusterListEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ClusterListEntry\"}\
    },\
    \"ClusterMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The automatically generated ID for a cluster.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The optional description of the cluster.</p>\"\
        },\
        \"KmsKeyARN\":{\
          \"shape\":\"KmsKeyARN\",\
          \"documentation\":\"<p>The <code>KmsKeyARN</code> Amazon Resource Name (ARN) associated with this cluster. This ARN was created using the <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html\\\">CreateKey</a> API action in AWS Key Management Service (AWS KMS).</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The role ARN associated with this cluster. This ARN was created using the <a href=\\\"https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html\\\">CreateRole</a> API action in AWS Identity and Access Management (IAM).</p>\"\
        },\
        \"ClusterState\":{\
          \"shape\":\"ClusterState\",\
          \"documentation\":\"<p>The current status of the cluster.</p>\"\
        },\
        \"JobType\":{\
          \"shape\":\"JobType\",\
          \"documentation\":\"<p>The type of job for this cluster. Currently, the only job type supported for clusters is <code>LOCAL_USE</code>.</p>\"\
        },\
        \"SnowballType\":{\
          \"shape\":\"SnowballType\",\
          \"documentation\":\"<p>The type of AWS Snowball device to use for this cluster. Currently, the only supported device type for cluster jobs is <code>EDGE</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/snowball/latest/developer-guide/device-differences.html\\\">Snowball Edge Device Options</a> in the Snowball Edge Developer Guide.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation date for this cluster.</p>\"\
        },\
        \"Resources\":{\
          \"shape\":\"JobResource\",\
          \"documentation\":\"<p>The arrays of <a>JobResource</a> objects that can include updated <a>S3Resource</a> objects or <a>LambdaResource</a> objects.</p>\"\
        },\
        \"AddressId\":{\
          \"shape\":\"AddressId\",\
          \"documentation\":\"<p>The automatically generated ID for a specific address.</p>\"\
        },\
        \"ShippingOption\":{\
          \"shape\":\"ShippingOption\",\
          \"documentation\":\"<p>The shipping speed for each node in this cluster. This speed doesn't dictate how soon you'll get each Snowball Edge device, rather it represents how quickly each device moves to its destination while in transit. Regional shipping speeds are as follows:</p> <ul> <li> <p>In Australia, you have access to express shipping. Typically, devices shipped express are delivered in about a day.</p> </li> <li> <p>In the European Union (EU), you have access to express shipping. Typically, Snowball Edges shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.</p> </li> <li> <p>In India, Snowball Edges are delivered in one to seven days.</p> </li> <li> <p>In the US, you have access to one-day shipping and two-day shipping.</p> </li> </ul>\"\
        },\
        \"Notification\":{\
          \"shape\":\"Notification\",\
          \"documentation\":\"<p>The Amazon Simple Notification Service (Amazon SNS) notification settings for this cluster.</p>\"\
        },\
        \"ForwardingAddressId\":{\
          \"shape\":\"AddressId\",\
          \"documentation\":\"<p>The ID of the address that you want a cluster shipped to, after it will be shipped to its primary address. This field is not supported in most regions.</p>\"\
        },\
        \"TaxDocuments\":{\
          \"shape\":\"TaxDocuments\",\
          \"documentation\":\"<p>The tax documents required in your AWS Region.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains metadata about a specific cluster.</p>\"\
    },\
    \"ClusterState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AwaitingQuorum\",\
        \"Pending\",\
        \"InUse\",\
        \"Complete\",\
        \"Cancelled\"\
      ]\
    },\
    \"CompatibleImage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AmiId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The unique identifier for an individual Snowball Edge AMI.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The optional name of a compatible image.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A JSON-formatted object that describes a compatible Amazon Machine Image (AMI), including the ID and name for a Snowball Edge AMI. This AMI is compatible with the device's physical hardware requirements, and it should be able to be run in an SBE1 instance on the device.</p>\"\
    },\
    \"CompatibleImageList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CompatibleImage\"}\
    },\
    \"CreateAddressRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Address\"],\
      \"members\":{\
        \"Address\":{\
          \"shape\":\"Address\",\
          \"documentation\":\"<p>The address that you want the Snowball shipped to.</p>\"\
        }\
      }\
    },\
    \"CreateAddressResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AddressId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The automatically generated ID for a specific address. You'll use this ID when you create a job to specify which address you want the Snowball for that job shipped to.</p>\"\
        }\
      }\
    },\
    \"CreateClusterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"JobType\",\
        \"Resources\",\
        \"AddressId\",\
        \"RoleARN\",\
        \"ShippingOption\"\
      ],\
      \"members\":{\
        \"JobType\":{\
          \"shape\":\"JobType\",\
          \"documentation\":\"<p>The type of job for this cluster. Currently, the only job type supported for clusters is <code>LOCAL_USE</code>.</p>\"\
        },\
        \"Resources\":{\
          \"shape\":\"JobResource\",\
          \"documentation\":\"<p>The resources associated with the cluster job. These resources include Amazon S3 buckets and optional AWS Lambda functions written in the Python language. </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional description of this specific cluster, for example <code>Environmental Data Cluster-01</code>.</p>\"\
        },\
        \"AddressId\":{\
          \"shape\":\"AddressId\",\
          \"documentation\":\"<p>The ID for the address that you want the cluster shipped to.</p>\"\
        },\
        \"KmsKeyARN\":{\
          \"shape\":\"KmsKeyARN\",\
          \"documentation\":\"<p>The <code>KmsKeyARN</code> value that you want to associate with this cluster. <code>KmsKeyARN</code> values are created by using the <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html\\\">CreateKey</a> API action in AWS Key Management Service (AWS KMS). </p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The <code>RoleARN</code> that you want to associate with this cluster. <code>RoleArn</code> values are created by using the <a href=\\\"https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html\\\">CreateRole</a> API action in AWS Identity and Access Management (IAM).</p>\"\
        },\
        \"SnowballType\":{\
          \"shape\":\"SnowballType\",\
          \"documentation\":\"<p>The type of AWS Snowball device to use for this cluster. Currently, the only supported device type for cluster jobs is <code>EDGE</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/snowball/latest/developer-guide/device-differences.html\\\">Snowball Edge Device Options</a> in the Snowball Edge Developer Guide.</p>\"\
        },\
        \"ShippingOption\":{\
          \"shape\":\"ShippingOption\",\
          \"documentation\":\"<p>The shipping speed for each node in this cluster. This speed doesn't dictate how soon you'll get each Snowball Edge device, rather it represents how quickly each device moves to its destination while in transit. Regional shipping speeds are as follows:</p> <ul> <li> <p>In Australia, you have access to express shipping. Typically, devices shipped express are delivered in about a day.</p> </li> <li> <p>In the European Union (EU), you have access to express shipping. Typically, Snowball Edges shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.</p> </li> <li> <p>In India, Snowball Edges are delivered in one to seven days.</p> </li> <li> <p>In the US, you have access to one-day shipping and two-day shipping.</p> </li> </ul>\"\
        },\
        \"Notification\":{\
          \"shape\":\"Notification\",\
          \"documentation\":\"<p>The Amazon Simple Notification Service (Amazon SNS) notification settings for this cluster.</p>\"\
        },\
        \"ForwardingAddressId\":{\
          \"shape\":\"AddressId\",\
          \"documentation\":\"<p>The forwarding address ID for a cluster. This field is not supported in most regions.</p>\"\
        },\
        \"TaxDocuments\":{\
          \"shape\":\"TaxDocuments\",\
          \"documentation\":\"<p>The tax documents required in your AWS Region.</p>\"\
        }\
      }\
    },\
    \"CreateClusterResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>The automatically generated ID for a cluster.</p>\"\
        }\
      }\
    },\
    \"CreateJobRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobType\":{\
          \"shape\":\"JobType\",\
          \"documentation\":\"<p>Defines the type of job that you're creating. </p>\"\
        },\
        \"Resources\":{\
          \"shape\":\"JobResource\",\
          \"documentation\":\"<p>Defines the Amazon S3 buckets associated with this job.</p> <p>With <code>IMPORT</code> jobs, you specify the bucket or buckets that your transferred data will be imported into.</p> <p>With <code>EXPORT</code> jobs, you specify the bucket or buckets that your transferred data will be exported from. Optionally, you can also specify a <code>KeyRange</code> value. If you choose to export a range, you define the length of the range by providing either an inclusive <code>BeginMarker</code> value, an inclusive <code>EndMarker</code> value, or both. Ranges are UTF-8 binary sorted.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Defines an optional description of this specific job, for example <code>Important Photos 2016-08-11</code>.</p>\"\
        },\
        \"AddressId\":{\
          \"shape\":\"AddressId\",\
          \"documentation\":\"<p>The ID for the address that you want the Snowball shipped to.</p>\"\
        },\
        \"KmsKeyARN\":{\
          \"shape\":\"KmsKeyARN\",\
          \"documentation\":\"<p>The <code>KmsKeyARN</code> that you want to associate with this job. <code>KmsKeyARN</code>s are created using the <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html\\\">CreateKey</a> AWS Key Management Service (KMS) API action.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The <code>RoleARN</code> that you want to associate with this job. <code>RoleArn</code>s are created using the <a href=\\\"https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html\\\">CreateRole</a> AWS Identity and Access Management (IAM) API action.</p>\"\
        },\
        \"SnowballCapacityPreference\":{\
          \"shape\":\"SnowballCapacity\",\
          \"documentation\":\"<p>If your job is being created in one of the US regions, you have the option of specifying what size Snowball you'd like for this job. In all other regions, Snowballs come with 80 TB in storage capacity.</p>\"\
        },\
        \"ShippingOption\":{\
          \"shape\":\"ShippingOption\",\
          \"documentation\":\"<p>The shipping speed for this job. This speed doesn't dictate how soon you'll get the Snowball, rather it represents how quickly the Snowball moves to its destination while in transit. Regional shipping speeds are as follows:</p> <ul> <li> <p>In Australia, you have access to express shipping. Typically, Snowballs shipped express are delivered in about a day.</p> </li> <li> <p>In the European Union (EU), you have access to express shipping. Typically, Snowballs shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.</p> </li> <li> <p>In India, Snowballs are delivered in one to seven days.</p> </li> <li> <p>In the US, you have access to one-day shipping and two-day shipping.</p> </li> </ul>\"\
        },\
        \"Notification\":{\
          \"shape\":\"Notification\",\
          \"documentation\":\"<p>Defines the Amazon Simple Notification Service (Amazon SNS) notification settings for this job.</p>\"\
        },\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>The ID of a cluster. If you're creating a job for a node in a cluster, you need to provide only this <code>clusterId</code> value. The other job attributes are inherited from the cluster.</p>\"\
        },\
        \"SnowballType\":{\
          \"shape\":\"SnowballType\",\
          \"documentation\":\"<p>The type of AWS Snowball device to use for this job. Currently, the only supported device type for cluster jobs is <code>EDGE</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/snowball/latest/developer-guide/device-differences.html\\\">Snowball Edge Device Options</a> in the Snowball Edge Developer Guide.</p>\"\
        },\
        \"ForwardingAddressId\":{\
          \"shape\":\"AddressId\",\
          \"documentation\":\"<p>The forwarding address ID for a job. This field is not supported in most regions.</p>\"\
        },\
        \"TaxDocuments\":{\
          \"shape\":\"TaxDocuments\",\
          \"documentation\":\"<p>The tax documents required in your AWS Region.</p>\"\
        }\
      }\
    },\
    \"CreateJobResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The automatically generated ID for a job, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>\"\
        }\
      }\
    },\
    \"DataTransfer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BytesTransferred\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The number of bytes transferred between a Snowball and Amazon S3.</p>\"\
        },\
        \"ObjectsTransferred\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The number of objects transferred between a Snowball and Amazon S3.</p>\"\
        },\
        \"TotalBytes\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The total bytes of data for a transfer between a Snowball and Amazon S3. This value is set to 0 (zero) until all the keys that will be transferred have been listed.</p>\"\
        },\
        \"TotalObjects\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The total number of objects for a transfer between a Snowball and Amazon S3. This value is set to 0 (zero) until all the keys that will be transferred have been listed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Defines the real-time status of a Snowball's data transfer while the device is at AWS. This data is only available while a job has a <code>JobState</code> value of <code>InProgress</code>, for both import and export jobs.</p>\"\
    },\
    \"DescribeAddressRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AddressId\"],\
      \"members\":{\
        \"AddressId\":{\
          \"shape\":\"AddressId\",\
          \"documentation\":\"<p>The automatically generated ID for a specific address.</p>\"\
        }\
      }\
    },\
    \"DescribeAddressResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Address\":{\
          \"shape\":\"Address\",\
          \"documentation\":\"<p>The address that you want the Snowball or Snowballs associated with a specific job to be shipped to.</p>\"\
        }\
      }\
    },\
    \"DescribeAddressesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListLimit\",\
          \"documentation\":\"<p>The number of <code>ADDRESS</code> objects to return.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>HTTP requests are stateless. To identify what object comes \\\"next\\\" in the list of <code>ADDRESS</code> objects, you have the option of specifying a value for <code>NextToken</code> as the starting point for your list of returned addresses.</p>\"\
        }\
      }\
    },\
    \"DescribeAddressesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Addresses\":{\
          \"shape\":\"AddressList\",\
          \"documentation\":\"<p>The Snowball shipping addresses that were created for this account.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>HTTP requests are stateless. If you use the automatically generated <code>NextToken</code> value in your next <code>DescribeAddresses</code> call, your list of returned addresses will start from this point in the array.</p>\"\
        }\
      }\
    },\
    \"DescribeClusterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ClusterId\"],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>The automatically generated ID for a cluster.</p>\"\
        }\
      }\
    },\
    \"DescribeClusterResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ClusterMetadata\":{\
          \"shape\":\"ClusterMetadata\",\
          \"documentation\":\"<p>Information about a specific cluster, including shipping information, cluster status, and other important metadata.</p>\"\
        }\
      }\
    },\
    \"DescribeJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The automatically generated ID for a job, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>\"\
        }\
      }\
    },\
    \"DescribeJobResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobMetadata\":{\
          \"shape\":\"JobMetadata\",\
          \"documentation\":\"<p>Information about a specific job, including shipping information, job status, and other important metadata.</p>\"\
        },\
        \"SubJobMetadata\":{\
          \"shape\":\"JobMetadataList\",\
          \"documentation\":\"<p>Information about a specific job part (in the case of an export job), including shipping information, job status, and other important metadata.</p>\"\
        }\
      }\
    },\
    \"Ec2AmiResource\":{\
      \"type\":\"structure\",\
      \"required\":[\"AmiId\"],\
      \"members\":{\
        \"AmiId\":{\
          \"shape\":\"AmiId\",\
          \"documentation\":\"<p>The ID of the AMI in Amazon EC2.</p>\"\
        },\
        \"SnowballAmiId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AMI on the Snowball Edge device.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A JSON-formatted object that contains the IDs for an Amazon Machine Image (AMI), including the Amazon EC2 AMI ID and the Snowball Edge AMI ID. Each AMI has these two IDs to simplify identifying the AMI in both the AWS Cloud and on the device.</p>\"\
    },\
    \"Ec2AmiResourceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Ec2AmiResource\"}\
    },\
    \"Ec2RequestFailedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Your IAM user lacks the necessary Amazon EC2 permissions to perform the attempted action.</p>\",\
      \"exception\":true\
    },\
    \"EventTriggerDefinition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EventResourceARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for any local Amazon S3 resource that is an AWS Lambda function's event trigger associated with this job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The container for the <a>EventTriggerDefinition$EventResourceARN</a>.</p>\"\
    },\
    \"EventTriggerDefinitionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EventTriggerDefinition\"}\
    },\
    \"GSTIN\":{\
      \"type\":\"string\",\
      \"pattern\":\"\\\\d{2}[A-Z]{5}\\\\d{4}[A-Z]{1}[A-Z\\\\d]{1}[Z]{1}[A-Z\\\\d]{1}\"\
    },\
    \"GetJobManifestRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The ID for a job that you want to get the manifest file for, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>\"\
        }\
      }\
    },\
    \"GetJobManifestResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ManifestURI\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon S3 presigned URL for the manifest file associated with the specified <code>JobId</code> value.</p>\"\
        }\
      }\
    },\
    \"GetJobUnlockCodeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The ID for the job that you want to get the <code>UnlockCode</code> value for, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>\"\
        }\
      }\
    },\
    \"GetJobUnlockCodeResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UnlockCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The <code>UnlockCode</code> value for the specified job. The <code>UnlockCode</code> value can be accessed for up to 90 days after the job has been created.</p>\"\
        }\
      }\
    },\
    \"GetSnowballUsageRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"GetSnowballUsageResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SnowballLimit\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The service limit for number of Snowballs this account can have at once. The default service limit is 1 (one).</p>\"\
        },\
        \"SnowballsInUse\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of Snowballs that this account is currently using.</p>\"\
        }\
      }\
    },\
    \"GetSoftwareUpdatesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The ID for a job that you want to get the software update file for, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>\"\
        }\
      }\
    },\
    \"GetSoftwareUpdatesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UpdatesURI\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon S3 presigned URL for the update file associated with the specified <code>JobId</code> value. The software update will be available for 2 days after this request is made. To access an update after the 2 days have passed, you'll have to make another call to <code>GetSoftwareUpdates</code>.</p>\"\
        }\
      }\
    },\
    \"INDTaxDocuments\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GSTIN\":{\
          \"shape\":\"GSTIN\",\
          \"documentation\":\"<p>The Goods and Services Tax (GST) documents required in AWS Regions in India.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The tax documents required in AWS Regions in India.</p>\"\
    },\
    \"Integer\":{\"type\":\"integer\"},\
    \"InvalidAddressException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The address provided was invalid. Check the address with your region's carrier, and try again.</p>\",\
      \"exception\":true\
    },\
    \"InvalidInputCombinationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Job or cluster creation failed. One ore more inputs were invalid. Confirm that the <a>CreateClusterRequest$SnowballType</a> value supports your <a>CreateJobRequest$JobType</a>, and try again.</p>\",\
      \"exception\":true\
    },\
    \"InvalidJobStateException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The action can't be performed because the job's current state doesn't allow that action to be performed.</p>\",\
      \"exception\":true\
    },\
    \"InvalidNextTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The <code>NextToken</code> string was altered unexpectedly, and the operation has stopped. Run the operation without changing the <code>NextToken</code> string, and try again.</p>\",\
      \"exception\":true\
    },\
    \"InvalidResourceException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"ResourceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The provided resource value is invalid.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified resource can't be found. Check the information you provided in your last request, and try again.</p>\",\
      \"exception\":true\
    },\
    \"JobId\":{\
      \"type\":\"string\",\
      \"max\":39,\
      \"min\":39,\
      \"pattern\":\"(M|J)ID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\"\
    },\
    \"JobListEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The automatically generated ID for a job, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>\"\
        },\
        \"JobState\":{\
          \"shape\":\"JobState\",\
          \"documentation\":\"<p>The current state of this job.</p>\"\
        },\
        \"IsMaster\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>A value that indicates that this job is a master job. A master job represents a successful request to create an export job. Master jobs aren't associated with any Snowballs. Instead, each master job will have at least one job part, and each job part is associated with a Snowball. It might take some time before the job parts associated with a particular master job are listed, because they are created after the master job is created.</p>\"\
        },\
        \"JobType\":{\
          \"shape\":\"JobType\",\
          \"documentation\":\"<p>The type of job.</p>\"\
        },\
        \"SnowballType\":{\
          \"shape\":\"SnowballType\",\
          \"documentation\":\"<p>The type of device used with this job.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation date for this job.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The optional description of this specific job, for example <code>Important Photos 2016-08-11</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Each <code>JobListEntry</code> object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of an export job.</p>\"\
    },\
    \"JobListEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"JobListEntry\"}\
    },\
    \"JobLogs\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobCompletionReportURI\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A link to an Amazon S3 presigned URL where the job completion report is located.</p>\"\
        },\
        \"JobSuccessLogURI\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A link to an Amazon S3 presigned URL where the job success log is located.</p>\"\
        },\
        \"JobFailureLogURI\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A link to an Amazon S3 presigned URL where the job failure log is located.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains job logs. Whenever Snowball is used to import data into or export data out of Amazon S3, you'll have the option of downloading a PDF job report. Job logs are returned as a part of the response syntax of the <code>DescribeJob</code> action in the <code>JobMetadata</code> data type. The job logs can be accessed for up to 60 minutes after this request has been made. To access any of the job logs after 60 minutes have passed, you'll have to make another call to the <code>DescribeJob</code> action.</p> <p>For import jobs, the PDF job report becomes available at the end of the import process. For export jobs, your job report typically becomes available while the Snowball for your job part is being delivered to you.</p> <p>The job report provides you insight into the state of your Amazon S3 data transfer. The report includes details about your job or job part for your records.</p> <p>For deeper visibility into the status of your transferred objects, you can look at the two associated logs: a success log and a failure log. The logs are saved in comma-separated value (CSV) format, and the name of each log includes the ID of the job or job part that the log describes.</p>\"\
    },\
    \"JobMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The automatically generated ID for a job, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>\"\
        },\
        \"JobState\":{\
          \"shape\":\"JobState\",\
          \"documentation\":\"<p>The current status of the jobs.</p>\"\
        },\
        \"JobType\":{\
          \"shape\":\"JobType\",\
          \"documentation\":\"<p>The type of job.</p>\"\
        },\
        \"SnowballType\":{\
          \"shape\":\"SnowballType\",\
          \"documentation\":\"<p>The type of device used with this job.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation date for this job.</p>\"\
        },\
        \"Resources\":{\
          \"shape\":\"JobResource\",\
          \"documentation\":\"<p>An array of <code>S3Resource</code> objects. Each <code>S3Resource</code> object represents an Amazon S3 bucket that your transferred data will be exported from or imported into.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description of the job, provided at job creation.</p>\"\
        },\
        \"KmsKeyARN\":{\
          \"shape\":\"KmsKeyARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the AWS Key Management Service (AWS KMS) key associated with this job. This ARN was created using the <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html\\\">CreateKey</a> API action in AWS KMS.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The role ARN associated with this job. This ARN was created using the <a href=\\\"https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html\\\">CreateRole</a> API action in AWS Identity and Access Management (IAM).</p>\"\
        },\
        \"AddressId\":{\
          \"shape\":\"AddressId\",\
          \"documentation\":\"<p>The ID for the address that you want the Snowball shipped to.</p>\"\
        },\
        \"ShippingDetails\":{\
          \"shape\":\"ShippingDetails\",\
          \"documentation\":\"<p>A job's shipping information, including inbound and outbound tracking numbers and shipping speed options.</p>\"\
        },\
        \"SnowballCapacityPreference\":{\
          \"shape\":\"SnowballCapacity\",\
          \"documentation\":\"<p>The Snowball capacity preference for this job, specified at job creation. In US regions, you can choose between 50 TB and 80 TB Snowballs. All other regions use 80 TB capacity Snowballs.</p>\"\
        },\
        \"Notification\":{\
          \"shape\":\"Notification\",\
          \"documentation\":\"<p>The Amazon Simple Notification Service (Amazon SNS) notification settings associated with a specific job. The <code>Notification</code> object is returned as a part of the response syntax of the <code>DescribeJob</code> action in the <code>JobMetadata</code> data type.</p>\"\
        },\
        \"DataTransferProgress\":{\
          \"shape\":\"DataTransfer\",\
          \"documentation\":\"<p>A value that defines the real-time status of a Snowball's data transfer while the device is at AWS. This data is only available while a job has a <code>JobState</code> value of <code>InProgress</code>, for both import and export jobs.</p>\"\
        },\
        \"JobLogInfo\":{\
          \"shape\":\"JobLogs\",\
          \"documentation\":\"<p>Links to Amazon S3 presigned URLs for the job report and logs. For import jobs, the PDF job report becomes available at the end of the import process. For export jobs, your job report typically becomes available while the Snowball for your job part is being delivered to you.</p>\"\
        },\
        \"ClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The 39-character ID for the cluster, for example <code>CID123e4567-e89b-12d3-a456-426655440000</code>.</p>\"\
        },\
        \"ForwardingAddressId\":{\
          \"shape\":\"AddressId\",\
          \"documentation\":\"<p>The ID of the address that you want a job shipped to, after it will be shipped to its primary address. This field is not supported in most regions.</p>\"\
        },\
        \"TaxDocuments\":{\
          \"shape\":\"TaxDocuments\",\
          \"documentation\":\"<p>The metadata associated with the tax documents required in your AWS Region.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a specific job including shipping information, job status, and other important metadata. This information is returned as a part of the response syntax of the <code>DescribeJob</code> action.</p>\"\
    },\
    \"JobMetadataList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"JobMetadata\"}\
    },\
    \"JobResource\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3Resources\":{\
          \"shape\":\"S3ResourceList\",\
          \"documentation\":\"<p>An array of <code>S3Resource</code> objects.</p>\"\
        },\
        \"LambdaResources\":{\
          \"shape\":\"LambdaResourceList\",\
          \"documentation\":\"<p>The Python-language Lambda functions for this job.</p>\"\
        },\
        \"Ec2AmiResources\":{\
          \"shape\":\"Ec2AmiResourceList\",\
          \"documentation\":\"<p>The Amazon Machine Images (AMIs) associated with this job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains an array of AWS resource objects. Each object represents an Amazon S3 bucket, an AWS Lambda function, or an Amazon Machine Image (AMI) based on Amazon EC2 that is associated with a particular job.</p>\"\
    },\
    \"JobState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"New\",\
        \"PreparingAppliance\",\
        \"PreparingShipment\",\
        \"InTransitToCustomer\",\
        \"WithCustomer\",\
        \"InTransitToAWS\",\
        \"WithAWSSortingFacility\",\
        \"WithAWS\",\
        \"InProgress\",\
        \"Complete\",\
        \"Cancelled\",\
        \"Listing\",\
        \"Pending\"\
      ]\
    },\
    \"JobStateList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"JobState\"}\
    },\
    \"JobType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IMPORT\",\
        \"EXPORT\",\
        \"LOCAL_USE\"\
      ]\
    },\
    \"KMSRequestFailedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The provided AWS Key Management Service key lacks the permissions to perform the specified <a>CreateJob</a> or <a>UpdateJob</a> action.</p>\",\
      \"exception\":true\
    },\
    \"KeyRange\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BeginMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The key that starts an optional key range for an export job. Ranges are inclusive and UTF-8 binary sorted.</p>\"\
        },\
        \"EndMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The key that ends an optional key range for an export job. Ranges are inclusive and UTF-8 binary sorted.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains a key range. For export jobs, a <code>S3Resource</code> object can have an optional <code>KeyRange</code> value. The length of the range is defined at job creation, and has either an inclusive <code>BeginMarker</code>, an inclusive <code>EndMarker</code>, or both. Ranges are UTF-8 binary sorted.</p>\"\
    },\
    \"KmsKeyARN\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"pattern\":\"arn:aws.*:kms:.*:[0-9]{12}:key/.*\"\
    },\
    \"LambdaResource\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LambdaArn\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that represents an AWS Lambda function to be triggered by PUT object actions on the associated local Amazon S3 resource.</p>\"\
        },\
        \"EventTriggers\":{\
          \"shape\":\"EventTriggerDefinitionList\",\
          \"documentation\":\"<p>The array of ARNs for <a>S3Resource</a> objects to trigger the <a>LambdaResource</a> objects associated with this job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies </p>\"\
    },\
    \"LambdaResourceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LambdaResource\"}\
    },\
    \"ListClusterJobsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ClusterId\"],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>The 39-character ID for the cluster that you want to list, for example <code>CID123e4567-e89b-12d3-a456-426655440000</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"ListLimit\",\
          \"documentation\":\"<p>The number of <code>JobListEntry</code> objects to return.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>HTTP requests are stateless. To identify what object comes \\\"next\\\" in the list of <code>JobListEntry</code> objects, you have the option of specifying <code>NextToken</code> as the starting point for your returned list.</p>\"\
        }\
      }\
    },\
    \"ListClusterJobsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobListEntries\":{\
          \"shape\":\"JobListEntryList\",\
          \"documentation\":\"<p>Each <code>JobListEntry</code> object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of export jobs. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>HTTP requests are stateless. If you use the automatically generated <code>NextToken</code> value in your next <code>ListClusterJobsResult</code> call, your list of returned jobs will start from this point in the array.</p>\"\
        }\
      }\
    },\
    \"ListClustersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListLimit\",\
          \"documentation\":\"<p>The number of <code>ClusterListEntry</code> objects to return.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>HTTP requests are stateless. To identify what object comes \\\"next\\\" in the list of <code>ClusterListEntry</code> objects, you have the option of specifying <code>NextToken</code> as the starting point for your returned list.</p>\"\
        }\
      }\
    },\
    \"ListClustersResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ClusterListEntries\":{\
          \"shape\":\"ClusterListEntryList\",\
          \"documentation\":\"<p>Each <code>ClusterListEntry</code> object contains a cluster's state, a cluster's ID, and other important status information.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>HTTP requests are stateless. If you use the automatically generated <code>NextToken</code> value in your next <code>ClusterListEntry</code> call, your list of returned clusters will start from this point in the array.</p>\"\
        }\
      }\
    },\
    \"ListCompatibleImagesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListLimit\",\
          \"documentation\":\"<p>The maximum number of results for the list of compatible images. Currently, a Snowball Edge device can store 10 AMIs.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>HTTP requests are stateless. To identify what object comes \\\"next\\\" in the list of compatible images, you can specify a value for <code>NextToken</code> as the starting point for your list of returned images.</p>\"\
        }\
      }\
    },\
    \"ListCompatibleImagesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CompatibleImages\":{\
          \"shape\":\"CompatibleImageList\",\
          \"documentation\":\"<p>A JSON-formatted object that describes a compatible AMI, including the ID and name for a Snowball Edge AMI.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Because HTTP requests are stateless, this is the starting point for your next list of returned images.</p>\"\
        }\
      }\
    },\
    \"ListJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListLimit\",\
          \"documentation\":\"<p>The number of <code>JobListEntry</code> objects to return.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>HTTP requests are stateless. To identify what object comes \\\"next\\\" in the list of <code>JobListEntry</code> objects, you have the option of specifying <code>NextToken</code> as the starting point for your returned list.</p>\"\
        }\
      }\
    },\
    \"ListJobsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobListEntries\":{\
          \"shape\":\"JobListEntryList\",\
          \"documentation\":\"<p>Each <code>JobListEntry</code> object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of export jobs. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>HTTP requests are stateless. If you use this automatically generated <code>NextToken</code> value in your next <code>ListJobs</code> call, your returned <code>JobListEntry</code> objects will start from this point in the array.</p>\"\
        }\
      }\
    },\
    \"ListLimit\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"Long\":{\"type\":\"long\"},\
    \"Notification\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SnsTopicARN\":{\
          \"shape\":\"SnsTopicARN\",\
          \"documentation\":\"<p>The new SNS <code>TopicArn</code> that you want to associate with this job. You can create Amazon Resource Names (ARNs) for topics by using the <a href=\\\"https://docs.aws.amazon.com/sns/latest/api/API_CreateTopic.html\\\">CreateTopic</a> Amazon SNS API action.</p> <p>You can subscribe email addresses to an Amazon SNS topic through the AWS Management Console, or by using the <a href=\\\"https://docs.aws.amazon.com/sns/latest/api/API_Subscribe.html\\\">Subscribe</a> AWS Simple Notification Service (SNS) API action.</p>\"\
        },\
        \"JobStatesToNotify\":{\
          \"shape\":\"JobStateList\",\
          \"documentation\":\"<p>The list of job states that will trigger a notification for this job.</p>\"\
        },\
        \"NotifyAll\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Any change in job state will trigger a notification for this job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Amazon Simple Notification Service (Amazon SNS) notification settings associated with a specific job. The <code>Notification</code> object is returned as a part of the response syntax of the <code>DescribeJob</code> action in the <code>JobMetadata</code> data type.</p> <p>When the notification settings are defined during job creation, you can choose to notify based on a specific set of job states using the <code>JobStatesToNotify</code> array of strings, or you can specify that you want to have Amazon SNS notifications sent out for all job states with <code>NotifyAll</code> set to true.</p>\"\
    },\
    \"ResourceARN\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"RoleARN\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"pattern\":\"arn:aws.*:iam::[0-9]{12}:role/.*\"\
    },\
    \"S3Resource\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BucketArn\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an Amazon S3 bucket.</p>\"\
        },\
        \"KeyRange\":{\
          \"shape\":\"KeyRange\",\
          \"documentation\":\"<p>For export jobs, you can provide an optional <code>KeyRange</code> within a specific Amazon S3 bucket. The length of the range is defined at job creation, and has either an inclusive <code>BeginMarker</code>, an inclusive <code>EndMarker</code>, or both. Ranges are UTF-8 binary sorted.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Each <code>S3Resource</code> object represents an Amazon S3 bucket that your transferred data will be exported from or imported into. For export jobs, this object can have an optional <code>KeyRange</code> value. The length of the range is defined at job creation, and has either an inclusive <code>BeginMarker</code>, an inclusive <code>EndMarker</code>, or both. Ranges are UTF-8 binary sorted.</p>\"\
    },\
    \"S3ResourceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"S3Resource\"}\
    },\
    \"Shipment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Status information for a shipment.</p>\"\
        },\
        \"TrackingNumber\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The tracking number for this job. Using this tracking number with your region's carrier's website, you can track a Snowball as the carrier transports it.</p> <p>For India, the carrier is Amazon Logistics. For all other regions, UPS is the carrier.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The <code>Status</code> and <code>TrackingNumber</code> information for an inbound or outbound shipment.</p>\"\
    },\
    \"ShippingDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ShippingOption\":{\
          \"shape\":\"ShippingOption\",\
          \"documentation\":\"<p>The shipping speed for a particular job. This speed doesn't dictate how soon you'll get the Snowball from the job's creation date. This speed represents how quickly it moves to its destination while in transit. Regional shipping speeds are as follows:</p> <ul> <li> <p>In Australia, you have access to express shipping. Typically, Snowballs shipped express are delivered in about a day.</p> </li> <li> <p>In the European Union (EU), you have access to express shipping. Typically, Snowballs shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.</p> </li> <li> <p>In India, Snowballs are delivered in one to seven days.</p> </li> <li> <p>In the United States of America (US), you have access to one-day shipping and two-day shipping.</p> </li> </ul>\"\
        },\
        \"InboundShipment\":{\
          \"shape\":\"Shipment\",\
          \"documentation\":\"<p>The <code>Status</code> and <code>TrackingNumber</code> values for a Snowball being returned to AWS for a particular job.</p>\"\
        },\
        \"OutboundShipment\":{\
          \"shape\":\"Shipment\",\
          \"documentation\":\"<p>The <code>Status</code> and <code>TrackingNumber</code> values for a Snowball being delivered to the address that you specified for a particular job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A job's shipping information, including inbound and outbound tracking numbers and shipping speed options.</p>\"\
    },\
    \"ShippingOption\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SECOND_DAY\",\
        \"NEXT_DAY\",\
        \"EXPRESS\",\
        \"STANDARD\"\
      ]\
    },\
    \"SnowballCapacity\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"T50\",\
        \"T80\",\
        \"T100\",\
        \"T42\",\
        \"T98\",\
        \"NoPreference\"\
      ]\
    },\
    \"SnowballType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STANDARD\",\
        \"EDGE\",\
        \"EDGE_C\",\
        \"EDGE_CG\",\
        \"EDGE_S\"\
      ]\
    },\
    \"SnsTopicARN\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"pattern\":\"arn:aws.*:sns:.*:[0-9]{12}:.*\"\
    },\
    \"String\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"TaxDocuments\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IND\":{\
          \"shape\":\"INDTaxDocuments\",\
          \"documentation\":\"<p>The tax documents required in AWS Regions in India.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The tax documents required in your AWS Region.</p>\"\
    },\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"UnsupportedAddressException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The address is either outside the serviceable area for your region, or an error occurred. Check the address with your region's carrier and try again. If the issue persists, contact AWS Support.</p>\",\
      \"exception\":true\
    },\
    \"UpdateClusterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ClusterId\"],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>The cluster ID of the cluster that you want to update, for example <code>CID123e4567-e89b-12d3-a456-426655440000</code>.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The new role Amazon Resource Name (ARN) that you want to associate with this cluster. To create a role ARN, use the <a href=\\\"https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html\\\">CreateRole</a> API action in AWS Identity and Access Management (IAM).</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The updated description of this cluster.</p>\"\
        },\
        \"Resources\":{\
          \"shape\":\"JobResource\",\
          \"documentation\":\"<p>The updated arrays of <a>JobResource</a> objects that can include updated <a>S3Resource</a> objects or <a>LambdaResource</a> objects.</p>\"\
        },\
        \"AddressId\":{\
          \"shape\":\"AddressId\",\
          \"documentation\":\"<p>The ID of the updated <a>Address</a> object.</p>\"\
        },\
        \"ShippingOption\":{\
          \"shape\":\"ShippingOption\",\
          \"documentation\":\"<p>The updated shipping option value of this cluster's <a>ShippingDetails</a> object.</p>\"\
        },\
        \"Notification\":{\
          \"shape\":\"Notification\",\
          \"documentation\":\"<p>The new or updated <a>Notification</a> object.</p>\"\
        },\
        \"ForwardingAddressId\":{\
          \"shape\":\"AddressId\",\
          \"documentation\":\"<p>The updated ID for the forwarding address for a cluster. This field is not supported in most regions.</p>\"\
        }\
      }\
    },\
    \"UpdateClusterResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The job ID of the job that you want to update, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The new role Amazon Resource Name (ARN) that you want to associate with this job. To create a role ARN, use the <a href=\\\"https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html\\\">CreateRole</a>AWS Identity and Access Management (IAM) API action.</p>\"\
        },\
        \"Notification\":{\
          \"shape\":\"Notification\",\
          \"documentation\":\"<p>The new or updated <a>Notification</a> object.</p>\"\
        },\
        \"Resources\":{\
          \"shape\":\"JobResource\",\
          \"documentation\":\"<p>The updated <code>JobResource</code> object, or the updated <a>JobResource</a> object. </p>\"\
        },\
        \"AddressId\":{\
          \"shape\":\"AddressId\",\
          \"documentation\":\"<p>The ID of the updated <a>Address</a> object.</p>\"\
        },\
        \"ShippingOption\":{\
          \"shape\":\"ShippingOption\",\
          \"documentation\":\"<p>The updated shipping option value of this job's <a>ShippingDetails</a> object.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The updated description of this job's <a>JobMetadata</a> object.</p>\"\
        },\
        \"SnowballCapacityPreference\":{\
          \"shape\":\"SnowballCapacity\",\
          \"documentation\":\"<p>The updated <code>SnowballCapacityPreference</code> of this job's <a>JobMetadata</a> object. The 50 TB Snowballs are only available in the US regions.</p>\"\
        },\
        \"ForwardingAddressId\":{\
          \"shape\":\"AddressId\",\
          \"documentation\":\"<p>The updated ID for the forwarding address for a job. This field is not supported in most regions.</p>\"\
        }\
      }\
    },\
    \"UpdateJobResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    }\
  },\
  \"documentation\":\"<p>AWS Snowball is a petabyte-scale data transport solution that uses secure devices to transfer large amounts of data between your on-premises data centers and Amazon Simple Storage Service (Amazon S3). The Snowball commands described here provide access to the same functionality that is available in the AWS Snowball Management Console, which enables you to create and manage jobs for Snowball. To transfer data locally with a Snowball device, you'll need to use the Snowball client or the Amazon S3 API adapter for Snowball. For more information, see the <a href=\\\"https://docs.aws.amazon.com/AWSImportExport/latest/ug/api-reference.html\\\">User Guide</a>.</p>\"\
}\
";
}

@end
