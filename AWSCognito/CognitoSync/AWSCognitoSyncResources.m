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

#import "AWSCognitoSyncResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSCognitoSyncResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSCognitoSyncResources

+ (instancetype)sharedInstance {
    static AWSCognitoSyncResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSCognitoSyncResources new];
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
    \"apiVersion\":\"2014-06-30\",\
    \"endpointPrefix\":\"cognito-sync\",\
    \"jsonVersion\":\"1.1\",\
    \"serviceFullName\":\"Amazon Cognito Sync\",\
    \"signatureVersion\":\"v4\",\
    \"protocol\":\"rest-json\",\
    \"uid\":\"cognito-sync-2014-06-30\"\
  },\
  \"documentation\":\"<fullname>Amazon Cognito Sync</fullname> <p>Amazon Cognito Sync provides an AWS service and client library that enable cross-device syncing of application-related user data. High-level client libraries are available for both iOS and Android. You can use these libraries to persist data locally so that it's available even if the device is offline. Developer credentials don't need to be stored on the mobile device to access the service. You can use Amazon Cognito to obtain a normalized user ID and credentials. User data is persisted in a dataset that can store up to 1 MB of key-value pairs, and you can have up to 20 datasets per user identity.</p> <p>With Amazon Cognito Sync, the data stored for each identity is accessible only to credentials assigned to that identity. In order to use the Cognito Sync service, you need to make API calls using credentials retrieved with <a href=\\\"http://docs.aws.amazon.com/cognitoidentity/latest/APIReference/Welcome.html\\\">Amazon Cognito Identity service</a>.</p> <p>If you want to use Cognito Sync in an Android or iOS application, you will probably want to make API calls via the AWS Mobile SDK. To learn more, see the <a href=\\\"http://docs.aws.amazon.com/mobile/sdkforandroid/developerguide/cognito-sync.html\\\">Developer Guide for Android</a> and the <a href=\\\"http://docs.aws.amazon.com/mobile/sdkforios/developerguide/cognito-sync.html\\\">Developer Guide for iOS</a>.</p>\",\
  \"operations\":{\
    \"BulkPublish\":{\
      \"name\":\"BulkPublish\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/identitypools/{IdentityPoolId}/bulkpublish\",\
        \"responseCode\":200\
      },\
      \"input\":{\
        \"shape\":\"BulkPublishRequest\",\
        \"documentation\":\"The input for the BulkPublish operation.\"\
      },\
      \"output\":{\
        \"shape\":\"BulkPublishResponse\",\
        \"documentation\":\"The output for the BulkPublish operation.\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"NotAuthorizedException\",\
          \"error\":{\
            \"code\":\"NotAuthorizedError\",\
            \"httpStatusCode\":403,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
        },\
        {\
          \"shape\":\"InvalidParameterException\",\
          \"error\":{\
            \"code\":\"InvalidParameter\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\
            \"code\":\"ResourceNotFound\",\
            \"httpStatusCode\":404,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the resource doesn't exist.\"\
        },\
        {\
          \"shape\":\"InternalErrorException\",\
          \"error\":{\
            \"code\":\"InternalError\",\
            \"httpStatusCode\":500\
          },\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"Indicates an internal service error.\"\
        },\
        {\
          \"shape\":\"DuplicateRequestException\",\
          \"error\":{\
            \"code\":\"DuplicateRequest\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"An exception thrown when there is an IN_PROGRESS bulk publish operation for the given identity pool.\"\
        },\
        {\
          \"shape\":\"AlreadyStreamedException\",\
          \"error\":{\
            \"code\":\"AlreadyStreamed\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"An exception thrown when a bulk publish operation is requested less than 24 hours after a previous bulk publish operation completed successfully.\"\
        }\
      ],\
      \"documentation\":\"<p>Initiates a bulk publish of all existing datasets for an Identity Pool to the configured stream. Customers are limited to one successful bulk publish per 24 hours. Bulk publish is an asynchronous request, customers can see the status of the request via the GetBulkPublishDetails operation.</p> <p>This API can only be called with developer credentials. You cannot call this API with the temporary user credentials provided by Cognito Identity.</p>\"\
    },\
    \"DeleteDataset\":{\
      \"name\":\"DeleteDataset\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\
        \"shape\":\"DeleteDatasetRequest\",\
        \"documentation\":\"A request to delete the specific dataset.\"\
      },\
      \"output\":{\
        \"shape\":\"DeleteDatasetResponse\",\
        \"documentation\":\"Response to a successful DeleteDataset request.\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"NotAuthorizedException\",\
          \"error\":{\
            \"code\":\"NotAuthorizedError\",\
            \"httpStatusCode\":403,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
        },\
        {\
          \"shape\":\"InvalidParameterException\",\
          \"error\":{\
            \"code\":\"InvalidParameter\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\
            \"code\":\"ResourceNotFound\",\
            \"httpStatusCode\":404,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the resource doesn't exist.\"\
        },\
        {\
          \"shape\":\"InternalErrorException\",\
          \"error\":{\
            \"code\":\"InternalError\",\
            \"httpStatusCode\":500\
          },\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"Indicates an internal service error.\"\
        },\
        {\
          \"shape\":\"TooManyRequestsException\",\
          \"error\":{\
            \"code\":\"TooManyRequests\",\
            \"httpStatusCode\":429,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the request is throttled.\"\
        },\
        {\
          \"shape\":\"ResourceConflictException\",\
          \"error\":{\
            \"code\":\"ResourceConflict\",\
            \"httpStatusCode\":409,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if an update can't be applied because the resource was changed by another call and this would result in a conflict.\"\
        }\
      ],\
      \"documentation\":\"<p>Deletes the specific dataset. The dataset will be deleted permanently, and the action can't be undone. Datasets that this dataset was merged with will no longer report the merge. Any subsequent operation on this dataset will result in a ResourceNotFoundException.</p> <p>This API can be called with temporary user credentials provided by Cognito Identity or with developer credentials.</p>\"\
    },\
    \"DescribeDataset\":{\
      \"name\":\"DescribeDataset\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\
        \"shape\":\"DescribeDatasetRequest\",\
        \"documentation\":\"A request for meta data about a dataset (creation date, number of records, size) by owner and dataset name.\"\
      },\
      \"output\":{\
        \"shape\":\"DescribeDatasetResponse\",\
        \"documentation\":\"Response to a successful DescribeDataset request.\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"NotAuthorizedException\",\
          \"error\":{\
            \"code\":\"NotAuthorizedError\",\
            \"httpStatusCode\":403,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
        },\
        {\
          \"shape\":\"InvalidParameterException\",\
          \"error\":{\
            \"code\":\"InvalidParameter\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\
            \"code\":\"ResourceNotFound\",\
            \"httpStatusCode\":404,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the resource doesn't exist.\"\
        },\
        {\
          \"shape\":\"InternalErrorException\",\
          \"error\":{\
            \"code\":\"InternalError\",\
            \"httpStatusCode\":500\
          },\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"Indicates an internal service error.\"\
        },\
        {\
          \"shape\":\"TooManyRequestsException\",\
          \"error\":{\
            \"code\":\"TooManyRequests\",\
            \"httpStatusCode\":429,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the request is throttled.\"\
        }\
      ],\
      \"documentation\":\"<p>Gets meta data about a dataset by identity and dataset name. With Amazon Cognito Sync, each identity has access only to its own data. Thus, the credentials used to make this API call need to have access to the identity data.</p> <p>This API can be called with temporary user credentials provided by Cognito Identity or with developer credentials. You should use Cognito Identity credentials to make this API call.</p>\"\
    },\
    \"DescribeIdentityPoolUsage\":{\
      \"name\":\"DescribeIdentityPoolUsage\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/identitypools/{IdentityPoolId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\
        \"shape\":\"DescribeIdentityPoolUsageRequest\",\
        \"documentation\":\"A request for usage information about the identity pool.\"\
      },\
      \"output\":{\
        \"shape\":\"DescribeIdentityPoolUsageResponse\",\
        \"documentation\":\"Response to a successful DescribeIdentityPoolUsage request.\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"NotAuthorizedException\",\
          \"error\":{\
            \"code\":\"NotAuthorizedError\",\
            \"httpStatusCode\":403,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
        },\
        {\
          \"shape\":\"InvalidParameterException\",\
          \"error\":{\
            \"code\":\"InvalidParameter\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\
            \"code\":\"ResourceNotFound\",\
            \"httpStatusCode\":404,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the resource doesn't exist.\"\
        },\
        {\
          \"shape\":\"InternalErrorException\",\
          \"error\":{\
            \"code\":\"InternalError\",\
            \"httpStatusCode\":500\
          },\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"Indicates an internal service error.\"\
        },\
        {\
          \"shape\":\"TooManyRequestsException\",\
          \"error\":{\
            \"code\":\"TooManyRequests\",\
            \"httpStatusCode\":429,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the request is throttled.\"\
        }\
      ],\
      \"documentation\":\"<p>Gets usage details (for example, data storage) about a particular identity pool.</p> <p>This API can only be called with developer credentials. You cannot call this API with the temporary user credentials provided by Cognito Identity.</p>\"\
    },\
    \"DescribeIdentityUsage\":{\
      \"name\":\"DescribeIdentityUsage\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/identitypools/{IdentityPoolId}/identities/{IdentityId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\
        \"shape\":\"DescribeIdentityUsageRequest\",\
        \"documentation\":\"A request for information about the usage of an identity pool.\"\
      },\
      \"output\":{\
        \"shape\":\"DescribeIdentityUsageResponse\",\
        \"documentation\":\"The response to a successful DescribeIdentityUsage request.\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"NotAuthorizedException\",\
          \"error\":{\
            \"code\":\"NotAuthorizedError\",\
            \"httpStatusCode\":403,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
        },\
        {\
          \"shape\":\"InvalidParameterException\",\
          \"error\":{\
            \"code\":\"InvalidParameter\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\
            \"code\":\"ResourceNotFound\",\
            \"httpStatusCode\":404,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the resource doesn't exist.\"\
        },\
        {\
          \"shape\":\"InternalErrorException\",\
          \"error\":{\
            \"code\":\"InternalError\",\
            \"httpStatusCode\":500\
          },\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"Indicates an internal service error.\"\
        },\
        {\
          \"shape\":\"TooManyRequestsException\",\
          \"error\":{\
            \"code\":\"TooManyRequests\",\
            \"httpStatusCode\":429,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the request is throttled.\"\
        }\
      ],\
      \"documentation\":\"<p>Gets usage information for an identity, including number of datasets and data usage.</p> <p>This API can be called with temporary user credentials provided by Cognito Identity or with developer credentials.</p>\"\
    },\
    \"GetBulkPublishDetails\":{\
      \"name\":\"GetBulkPublishDetails\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/identitypools/{IdentityPoolId}/getBulkPublishDetails\",\
        \"responseCode\":200\
      },\
      \"input\":{\
        \"shape\":\"GetBulkPublishDetailsRequest\",\
        \"documentation\":\"The input for the GetBulkPublishDetails operation.\"\
      },\
      \"output\":{\
        \"shape\":\"GetBulkPublishDetailsResponse\",\
        \"documentation\":\"The output for the GetBulkPublishDetails operation.\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"NotAuthorizedException\",\
          \"error\":{\
            \"code\":\"NotAuthorizedError\",\
            \"httpStatusCode\":403,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
        },\
        {\
          \"shape\":\"InvalidParameterException\",\
          \"error\":{\
            \"code\":\"InvalidParameter\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\
            \"code\":\"ResourceNotFound\",\
            \"httpStatusCode\":404,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the resource doesn't exist.\"\
        },\
        {\
          \"shape\":\"InternalErrorException\",\
          \"error\":{\
            \"code\":\"InternalError\",\
            \"httpStatusCode\":500\
          },\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"Indicates an internal service error.\"\
        }\
      ],\
      \"documentation\":\"<p>Get the status of the last BulkPublish operation for an identity pool.</p> <p>This API can only be called with developer credentials. You cannot call this API with the temporary user credentials provided by Cognito Identity.</p>\"\
    },\
    \"GetCognitoEvents\":{\
      \"name\":\"GetCognitoEvents\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/identitypools/{IdentityPoolId}/events\",\
        \"responseCode\":200\
      },\
      \"input\":{\
        \"shape\":\"GetCognitoEventsRequest\",\
        \"documentation\":\"<p>A request for a list of the configured Cognito Events</p>\"\
      },\
      \"output\":{\
        \"shape\":\"GetCognitoEventsResponse\",\
        \"documentation\":\"<p>The response from the GetCognitoEvents request</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidParameterException\",\
          \"error\":{\
            \"code\":\"InvalidParameter\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\
            \"code\":\"ResourceNotFound\",\
            \"httpStatusCode\":404,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the resource doesn't exist.\"\
        },\
        {\
          \"shape\":\"NotAuthorizedException\",\
          \"error\":{\
            \"code\":\"NotAuthorizedError\",\
            \"httpStatusCode\":403,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
        },\
        {\
          \"shape\":\"InternalErrorException\",\
          \"error\":{\
            \"code\":\"InternalError\",\
            \"httpStatusCode\":500\
          },\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"Indicates an internal service error.\"\
        },\
        {\
          \"shape\":\"TooManyRequestsException\",\
          \"error\":{\
            \"code\":\"TooManyRequests\",\
            \"httpStatusCode\":429,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the request is throttled.\"\
        }\
      ],\
      \"documentation\":\"<p>Gets the events and the corresponding Lambda functions associated with an identity pool.</p> <p>This API can only be called with developer credentials. You cannot call this API with the temporary user credentials provided by Cognito Identity.</p>\"\
    },\
    \"GetIdentityPoolConfiguration\":{\
      \"name\":\"GetIdentityPoolConfiguration\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/identitypools/{IdentityPoolId}/configuration\",\
        \"responseCode\":200\
      },\
      \"input\":{\
        \"shape\":\"GetIdentityPoolConfigurationRequest\",\
        \"documentation\":\"<p>The input for the GetIdentityPoolConfiguration operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"GetIdentityPoolConfigurationResponse\",\
        \"documentation\":\"<p>The output for the GetIdentityPoolConfiguration operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"NotAuthorizedException\",\
          \"error\":{\
            \"code\":\"NotAuthorizedError\",\
            \"httpStatusCode\":403,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
        },\
        {\
          \"shape\":\"InvalidParameterException\",\
          \"error\":{\
            \"code\":\"InvalidParameter\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\
            \"code\":\"ResourceNotFound\",\
            \"httpStatusCode\":404,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the resource doesn't exist.\"\
        },\
        {\
          \"shape\":\"InternalErrorException\",\
          \"error\":{\
            \"code\":\"InternalError\",\
            \"httpStatusCode\":500\
          },\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"Indicates an internal service error.\"\
        },\
        {\
          \"shape\":\"TooManyRequestsException\",\
          \"error\":{\
            \"code\":\"TooManyRequests\",\
            \"httpStatusCode\":429,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the request is throttled.\"\
        }\
      ],\
      \"documentation\":\"<p>Gets the configuration settings of an identity pool.</p> <p>This API can only be called with developer credentials. You cannot call this API with the temporary user credentials provided by Cognito Identity.</p>\"\
    },\
    \"ListDatasets\":{\
      \"name\":\"ListDatasets\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets\",\
        \"responseCode\":200\
      },\
      \"input\":{\
        \"shape\":\"ListDatasetsRequest\",\
        \"documentation\":\"Request for a list of datasets for an identity.\"\
      },\
      \"output\":{\
        \"shape\":\"ListDatasetsResponse\",\
        \"documentation\":\"Returned for a successful ListDatasets request.\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"NotAuthorizedException\",\
          \"error\":{\
            \"code\":\"NotAuthorizedError\",\
            \"httpStatusCode\":403,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
        },\
        {\
          \"shape\":\"InvalidParameterException\",\
          \"error\":{\
            \"code\":\"InvalidParameter\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
        },\
        {\
          \"shape\":\"InternalErrorException\",\
          \"error\":{\
            \"code\":\"InternalError\",\
            \"httpStatusCode\":500\
          },\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"Indicates an internal service error.\"\
        },\
        {\
          \"shape\":\"TooManyRequestsException\",\
          \"error\":{\
            \"code\":\"TooManyRequests\",\
            \"httpStatusCode\":429,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the request is throttled.\"\
        }\
      ],\
      \"documentation\":\"<p>Lists datasets for an identity. With Amazon Cognito Sync, each identity has access only to its own data. Thus, the credentials used to make this API call need to have access to the identity data.</p> <p>ListDatasets can be called with temporary user credentials provided by Cognito Identity or with developer credentials. You should use the Cognito Identity credentials to make this API call.</p>\"\
    },\
    \"ListIdentityPoolUsage\":{\
      \"name\":\"ListIdentityPoolUsage\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/identitypools\",\
        \"responseCode\":200\
      },\
      \"input\":{\
        \"shape\":\"ListIdentityPoolUsageRequest\",\
        \"documentation\":\"A request for usage information on an identity pool.\"\
      },\
      \"output\":{\
        \"shape\":\"ListIdentityPoolUsageResponse\",\
        \"documentation\":\"Returned for a successful ListIdentityPoolUsage request.\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"NotAuthorizedException\",\
          \"error\":{\
            \"code\":\"NotAuthorizedError\",\
            \"httpStatusCode\":403,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
        },\
        {\
          \"shape\":\"InvalidParameterException\",\
          \"error\":{\
            \"code\":\"InvalidParameter\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
        },\
        {\
          \"shape\":\"InternalErrorException\",\
          \"error\":{\
            \"code\":\"InternalError\",\
            \"httpStatusCode\":500\
          },\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"Indicates an internal service error.\"\
        },\
        {\
          \"shape\":\"TooManyRequestsException\",\
          \"error\":{\
            \"code\":\"TooManyRequests\",\
            \"httpStatusCode\":429,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the request is throttled.\"\
        }\
      ],\
      \"documentation\":\"<p>Gets a list of identity pools registered with Cognito.</p> <p>ListIdentityPoolUsage can only be called with developer credentials. You cannot make this API call with the temporary user credentials provided by Cognito Identity.</p>\"\
    },\
    \"ListRecords\":{\
      \"name\":\"ListRecords\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}/records\",\
        \"responseCode\":200\
      },\
      \"input\":{\
        \"shape\":\"ListRecordsRequest\",\
        \"documentation\":\"A request for a list of records.\"\
      },\
      \"output\":{\
        \"shape\":\"ListRecordsResponse\",\
        \"documentation\":\"Returned for a successful ListRecordsRequest.\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidParameterException\",\
          \"error\":{\
            \"code\":\"InvalidParameter\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
        },\
        {\
          \"shape\":\"NotAuthorizedException\",\
          \"error\":{\
            \"code\":\"NotAuthorizedError\",\
            \"httpStatusCode\":403,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
        },\
        {\
          \"shape\":\"TooManyRequestsException\",\
          \"error\":{\
            \"code\":\"TooManyRequests\",\
            \"httpStatusCode\":429,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the request is throttled.\"\
        },\
        {\
          \"shape\":\"InternalErrorException\",\
          \"error\":{\
            \"code\":\"InternalError\",\
            \"httpStatusCode\":500\
          },\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"Indicates an internal service error.\"\
        }\
      ],\
      \"documentation\":\"<p>Gets paginated records, optionally changed after a particular sync count for a dataset and identity. With Amazon Cognito Sync, each identity has access only to its own data. Thus, the credentials used to make this API call need to have access to the identity data.</p> <p>ListRecords can be called with temporary user credentials provided by Cognito Identity or with developer credentials. You should use Cognito Identity credentials to make this API call.</p>\"\
    },\
    \"RegisterDevice\":{\
      \"name\":\"RegisterDevice\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/identitypools/{IdentityPoolId}/identity/{IdentityId}/device\",\
        \"responseCode\":200\
      },\
      \"input\":{\
        \"shape\":\"RegisterDeviceRequest\",\
        \"documentation\":\"<p>A request to RegisterDevice.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"RegisterDeviceResponse\",\
        \"documentation\":\"<p>Response to a RegisterDevice request.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"NotAuthorizedException\",\
          \"error\":{\
            \"code\":\"NotAuthorizedError\",\
            \"httpStatusCode\":403,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
        },\
        {\
          \"shape\":\"InvalidParameterException\",\
          \"error\":{\
            \"code\":\"InvalidParameter\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\
            \"code\":\"ResourceNotFound\",\
            \"httpStatusCode\":404,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the resource doesn't exist.\"\
        },\
        {\
          \"shape\":\"InternalErrorException\",\
          \"error\":{\
            \"code\":\"InternalError\",\
            \"httpStatusCode\":500\
          },\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"Indicates an internal service error.\"\
        },\
        {\
          \"shape\":\"InvalidConfigurationException\",\
          \"error\":{\
            \"code\":\"InvalidConfiguration\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true\
        },\
        {\
          \"shape\":\"TooManyRequestsException\",\
          \"error\":{\
            \"code\":\"TooManyRequests\",\
            \"httpStatusCode\":429,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the request is throttled.\"\
        }\
      ],\
      \"documentation\":\"<p>Registers a device to receive push sync notifications.</p> <p>This API can only be called with temporary credentials provided by Cognito Identity. You cannot call this API with developer credentials.</p>\"\
    },\
    \"SetCognitoEvents\":{\
      \"name\":\"SetCognitoEvents\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/identitypools/{IdentityPoolId}/events\",\
        \"responseCode\":200\
      },\
      \"input\":{\
        \"shape\":\"SetCognitoEventsRequest\",\
        \"documentation\":\"<p>A request to configure Cognito Events\\\"</p>\\\"\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidParameterException\",\
          \"error\":{\
            \"code\":\"InvalidParameter\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\
            \"code\":\"ResourceNotFound\",\
            \"httpStatusCode\":404,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the resource doesn't exist.\"\
        },\
        {\
          \"shape\":\"NotAuthorizedException\",\
          \"error\":{\
            \"code\":\"NotAuthorizedError\",\
            \"httpStatusCode\":403,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
        },\
        {\
          \"shape\":\"InternalErrorException\",\
          \"error\":{\
            \"code\":\"InternalError\",\
            \"httpStatusCode\":500\
          },\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"Indicates an internal service error.\"\
        },\
        {\
          \"shape\":\"TooManyRequestsException\",\
          \"error\":{\
            \"code\":\"TooManyRequests\",\
            \"httpStatusCode\":429,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the request is throttled.\"\
        }\
      ],\
      \"documentation\":\"<p>Sets the AWS Lambda function for a given event type for an identity pool. This request only updates the key/value pair specified. Other key/values pairs are not updated. To remove a key value pair, pass a empty value for the particular key.</p> <p>This API can only be called with developer credentials. You cannot call this API with the temporary user credentials provided by Cognito Identity.</p>\"\
    },\
    \"SetIdentityPoolConfiguration\":{\
      \"name\":\"SetIdentityPoolConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/identitypools/{IdentityPoolId}/configuration\",\
        \"responseCode\":200\
      },\
      \"input\":{\
        \"shape\":\"SetIdentityPoolConfigurationRequest\",\
        \"documentation\":\"<p>The input for the SetIdentityPoolConfiguration operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"SetIdentityPoolConfigurationResponse\",\
        \"documentation\":\"<p>The output for the SetIdentityPoolConfiguration operation</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"NotAuthorizedException\",\
          \"error\":{\
            \"code\":\"NotAuthorizedError\",\
            \"httpStatusCode\":403,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
        },\
        {\
          \"shape\":\"InvalidParameterException\",\
          \"error\":{\
            \"code\":\"InvalidParameter\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\
            \"code\":\"ResourceNotFound\",\
            \"httpStatusCode\":404,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the resource doesn't exist.\"\
        },\
        {\
          \"shape\":\"InternalErrorException\",\
          \"error\":{\
            \"code\":\"InternalError\",\
            \"httpStatusCode\":500\
          },\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"Indicates an internal service error.\"\
        },\
        {\
          \"shape\":\"TooManyRequestsException\",\
          \"error\":{\
            \"code\":\"TooManyRequests\",\
            \"httpStatusCode\":429,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the request is throttled.\"\
        },\
        {\
          \"shape\":\"ConcurrentModificationException\",\
          \"error\":{\
            \"code\":\"ConcurrentModification\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"<p>Thrown if there are parallel requests to modify a resource.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Sets the necessary configuration for push sync.</p> <p>This API can only be called with developer credentials. You cannot call this API with the temporary user credentials provided by Cognito Identity.</p>\"\
    },\
    \"SubscribeToDataset\":{\
      \"name\":\"SubscribeToDataset\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}/subscriptions/{DeviceId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\
        \"shape\":\"SubscribeToDatasetRequest\",\
        \"documentation\":\"<p>A request to SubscribeToDatasetRequest.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"SubscribeToDatasetResponse\",\
        \"documentation\":\"<p>Response to a SubscribeToDataset request.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"NotAuthorizedException\",\
          \"error\":{\
            \"code\":\"NotAuthorizedError\",\
            \"httpStatusCode\":403,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
        },\
        {\
          \"shape\":\"InvalidParameterException\",\
          \"error\":{\
            \"code\":\"InvalidParameter\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\
            \"code\":\"ResourceNotFound\",\
            \"httpStatusCode\":404,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the resource doesn't exist.\"\
        },\
        {\
          \"shape\":\"InternalErrorException\",\
          \"error\":{\
            \"code\":\"InternalError\",\
            \"httpStatusCode\":500\
          },\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"Indicates an internal service error.\"\
        },\
        {\
          \"shape\":\"InvalidConfigurationException\",\
          \"error\":{\
            \"code\":\"InvalidConfiguration\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true\
        },\
        {\
          \"shape\":\"TooManyRequestsException\",\
          \"error\":{\
            \"code\":\"TooManyRequests\",\
            \"httpStatusCode\":429,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the request is throttled.\"\
        }\
      ],\
      \"documentation\":\"<p>Subscribes to receive notifications when a dataset is modified by another device.</p> <p>This API can only be called with temporary credentials provided by Cognito Identity. You cannot call this API with developer credentials.</p>\"\
    },\
    \"UnsubscribeFromDataset\":{\
      \"name\":\"UnsubscribeFromDataset\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}/subscriptions/{DeviceId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\
        \"shape\":\"UnsubscribeFromDatasetRequest\",\
        \"documentation\":\"<p>A request to UnsubscribeFromDataset.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"UnsubscribeFromDatasetResponse\",\
        \"documentation\":\"<p>Response to an UnsubscribeFromDataset request.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"NotAuthorizedException\",\
          \"error\":{\
            \"code\":\"NotAuthorizedError\",\
            \"httpStatusCode\":403,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
        },\
        {\
          \"shape\":\"InvalidParameterException\",\
          \"error\":{\
            \"code\":\"InvalidParameter\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\
            \"code\":\"ResourceNotFound\",\
            \"httpStatusCode\":404,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the resource doesn't exist.\"\
        },\
        {\
          \"shape\":\"InternalErrorException\",\
          \"error\":{\
            \"code\":\"InternalError\",\
            \"httpStatusCode\":500\
          },\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"Indicates an internal service error.\"\
        },\
        {\
          \"shape\":\"InvalidConfigurationException\",\
          \"error\":{\
            \"code\":\"InvalidConfiguration\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true\
        },\
        {\
          \"shape\":\"TooManyRequestsException\",\
          \"error\":{\
            \"code\":\"TooManyRequests\",\
            \"httpStatusCode\":429,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the request is throttled.\"\
        }\
      ],\
      \"documentation\":\"<p>Unsubscribes from receiving notifications when a dataset is modified by another device.</p> <p>This API can only be called with temporary credentials provided by Cognito Identity. You cannot call this API with developer credentials.</p>\"\
    },\
    \"UpdateRecords\":{\
      \"name\":\"UpdateRecords\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\
        \"shape\":\"UpdateRecordsRequest\",\
        \"documentation\":\"A request to post updates to records or add and delete records for a dataset and user.\"\
      },\
      \"output\":{\
        \"shape\":\"UpdateRecordsResponse\",\
        \"documentation\":\"Returned for a successful UpdateRecordsRequest.\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidParameterException\",\
          \"error\":{\
            \"code\":\"InvalidParameter\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
        },\
        {\
          \"shape\":\"LimitExceededException\",\
          \"error\":{\
            \"code\":\"LimitExceeded\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when the limit on the number of objects or operations has been exceeded.\"\
        },\
        {\
          \"shape\":\"NotAuthorizedException\",\
          \"error\":{\
            \"code\":\"NotAuthorizedError\",\
            \"httpStatusCode\":403,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\
            \"code\":\"ResourceNotFound\",\
            \"httpStatusCode\":404,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the resource doesn't exist.\"\
        },\
        {\
          \"shape\":\"ResourceConflictException\",\
          \"error\":{\
            \"code\":\"ResourceConflict\",\
            \"httpStatusCode\":409,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if an update can't be applied because the resource was changed by another call and this would result in a conflict.\"\
        },\
        {\
          \"shape\":\"InvalidLambdaFunctionOutputException\",\
          \"error\":{\
            \"code\":\"InvalidLambdaFunctionOutput\",\
            \"httpStatusCode\":400,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"<p>The AWS Lambda function returned invalid output or an exception.</p>\"\
        },\
        {\
          \"shape\":\"LambdaThrottledException\",\
          \"error\":{\
            \"code\":\"LambdaThrottled\",\
            \"httpStatusCode\":429,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"<p>AWS Lambda throttled your account, please contact AWS Support</p>\"\
        },\
        {\
          \"shape\":\"TooManyRequestsException\",\
          \"error\":{\
            \"code\":\"TooManyRequests\",\
            \"httpStatusCode\":429,\
            \"senderFault\":true\
          },\
          \"exception\":true,\
          \"documentation\":\"Thrown if the request is throttled.\"\
        },\
        {\
          \"shape\":\"InternalErrorException\",\
          \"error\":{\
            \"code\":\"InternalError\",\
            \"httpStatusCode\":500\
          },\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"Indicates an internal service error.\"\
        }\
      ],\
      \"documentation\":\"<p>Posts updates to records and adds and deletes records for a dataset and user.</p> <p>The sync count in the record patch is your last known sync count for that record. The server will reject an UpdateRecords request with a ResourceConflictException if you try to patch a record with a new value but a stale sync count.</p> <p>For example, if the sync count on the server is 5 for a key called highScore and you try and submit a new highScore with sync count of 4, the request will be rejected. To obtain the current sync count for a record, call ListRecords. On a successful update of the record, the response returns the new sync count for that record. You should present that sync count the next time you try to update that same record. When the record does not exist, specify the sync count as 0.</p> <p>This API can be called with temporary user credentials provided by Cognito Identity or with developer credentials.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AlreadyStreamedException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ExceptionMessage\",\
          \"documentation\":\"The message associated with the AlreadyStreamedException exception.\"\
        }\
      },\
      \"error\":{\
        \"code\":\"AlreadyStreamed\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true,\
      \"documentation\":\"An exception thrown when a bulk publish operation is requested less than 24 hours after a previous bulk publish operation completed successfully.\"\
    },\
    \"ApplicationArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"arn:aws:sns:[-0-9a-z]+:\\\\d+:app/[A-Z_]+/[a-zA-Z0-9_.-]+\"\
    },\
    \"ApplicationArnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ApplicationArn\"}\
    },\
    \"AssumeRoleArn\":{\
      \"type\":\"string\",\
      \"min\":20,\
      \"max\":2048,\
      \"pattern\":\"arn:aws:iam::\\\\d+:role/.*\"\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"BulkPublishRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityPoolId\"],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityPoolId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        }\
      },\
      \"documentation\":\"The input for the BulkPublish operation.\"\
    },\
    \"BulkPublishResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        }\
      },\
      \"documentation\":\"The output for the BulkPublish operation.\"\
    },\
    \"BulkPublishStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NOT_STARTED\",\
        \"IN_PROGRESS\",\
        \"FAILED\",\
        \"SUCCEEDED\"\
      ]\
    },\
    \"ClientContext\":{\"type\":\"string\"},\
    \"CognitoEventType\":{\"type\":\"string\"},\
    \"CognitoStreams\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"The name of the Cognito stream to receive updates. This stream must be in the developers account and in the same region as the identity pool.\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"AssumeRoleArn\",\
          \"documentation\":\"The ARN of the role Amazon Cognito can assume in order to publish to the stream. This role must grant access to Amazon Cognito (cognito-sync) to invoke PutRecord on your Cognito stream.\"\
        },\
        \"StreamingStatus\":{\
          \"shape\":\"StreamingStatus\",\
          \"documentation\":\"Status of the Cognito streams. Valid values are: <p>ENABLED - Streaming of updates to identity pool is enabled.</p> <p>DISABLED - Streaming of updates to identity pool is disabled. Bulk publish will also fail if StreamingStatus is DISABLED.</p>\"\
        }\
      },\
      \"documentation\":\"Configuration options for configure Cognito streams.\"\
    },\
    \"ConcurrentModificationException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The message returned by a ConcurrentModicationException.</p>\"\
        }\
      },\
      \"error\":{\
        \"code\":\"ConcurrentModification\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true,\
      \"documentation\":\"<p>Thrown if there are parallel requests to modify a resource.</p>\"\
    },\
    \"Dataset\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        },\
        \"DatasetName\":{\
          \"shape\":\"DatasetName\",\
          \"documentation\":\"A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9, '_' (underscore), '-' (dash), and '.' (dot).\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"Date on which the dataset was created.\"\
        },\
        \"LastModifiedDate\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"Date when the dataset was last modified.\"\
        },\
        \"LastModifiedBy\":{\
          \"shape\":\"String\",\
          \"documentation\":\"The device that made the last change to this dataset.\"\
        },\
        \"DataStorage\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"Total size in bytes of the records in this dataset.\"\
        },\
        \"NumRecords\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"Number of records in this dataset.\"\
        }\
      },\
      \"documentation\":\"A collection of data for an identity pool. An identity pool can have multiple datasets. A dataset is per identity and can be general or associated with a particular entity in an application (like a saved game). Datasets are automatically created if they don't exist. Data is synced by dataset, and a dataset can hold up to 1MB of key-value pairs.\"\
    },\
    \"DatasetList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Dataset\"}\
    },\
    \"DatasetName\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"max\":128,\
      \"pattern\":\"[a-zA-Z0-9_.:-]+\"\
    },\
    \"Date\":{\"type\":\"timestamp\"},\
    \"DeleteDatasetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityPoolId\",\
        \"IdentityId\",\
        \"DatasetName\"\
      ],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityPoolId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        },\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        },\
        \"DatasetName\":{\
          \"shape\":\"DatasetName\",\
          \"location\":\"uri\",\
          \"locationName\":\"DatasetName\",\
          \"documentation\":\"A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9, '_' (underscore), '-' (dash), and '.' (dot).\"\
        }\
      },\
      \"documentation\":\"A request to delete the specific dataset.\"\
    },\
    \"DeleteDatasetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Dataset\":{\
          \"shape\":\"Dataset\",\
          \"documentation\":\"A collection of data for an identity pool. An identity pool can have multiple datasets. A dataset is per identity and can be general or associated with a particular entity in an application (like a saved game). Datasets are automatically created if they don't exist. Data is synced by dataset, and a dataset can hold up to 1MB of key-value pairs.\"\
        }\
      },\
      \"documentation\":\"Response to a successful DeleteDataset request.\"\
    },\
    \"DescribeDatasetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityPoolId\",\
        \"IdentityId\",\
        \"DatasetName\"\
      ],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityPoolId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        },\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        },\
        \"DatasetName\":{\
          \"shape\":\"DatasetName\",\
          \"location\":\"uri\",\
          \"locationName\":\"DatasetName\",\
          \"documentation\":\"A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9, '_' (underscore), '-' (dash), and '.' (dot).\"\
        }\
      },\
      \"documentation\":\"A request for meta data about a dataset (creation date, number of records, size) by owner and dataset name.\"\
    },\
    \"DescribeDatasetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Dataset\":{\
          \"shape\":\"Dataset\",\
          \"documentation\":\"Meta data for a collection of data for an identity. An identity can have multiple datasets. A dataset can be general or associated with a particular entity in an application (like a saved game). Datasets are automatically created if they don't exist. Data is synced by dataset, and a dataset can hold up to 1MB of key-value pairs.\"\
        }\
      },\
      \"documentation\":\"Response to a successful DescribeDataset request.\"\
    },\
    \"DescribeIdentityPoolUsageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityPoolId\"],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityPoolId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        }\
      },\
      \"documentation\":\"A request for usage information about the identity pool.\"\
    },\
    \"DescribeIdentityPoolUsageResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityPoolUsage\":{\
          \"shape\":\"IdentityPoolUsage\",\
          \"documentation\":\"Information about the usage of the identity pool.\"\
        }\
      },\
      \"documentation\":\"Response to a successful DescribeIdentityPoolUsage request.\"\
    },\
    \"DescribeIdentityUsageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityPoolId\",\
        \"IdentityId\"\
      ],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityPoolId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        },\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        }\
      },\
      \"documentation\":\"A request for information about the usage of an identity pool.\"\
    },\
    \"DescribeIdentityUsageResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityUsage\":{\
          \"shape\":\"IdentityUsage\",\
          \"documentation\":\"Usage information for the identity.\"\
        }\
      },\
      \"documentation\":\"The response to a successful DescribeIdentityUsage request.\"\
    },\
    \"DeviceId\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"max\":256\
    },\
    \"DuplicateRequestException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ExceptionMessage\",\
          \"documentation\":\"The message associated with the DuplicateRequestException exception.\"\
        }\
      },\
      \"error\":{\
        \"code\":\"DuplicateRequest\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true,\
      \"documentation\":\"An exception thrown when there is an IN_PROGRESS bulk publish operation for the given identity pool.\"\
    },\
    \"Events\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"CognitoEventType\"},\
      \"value\":{\"shape\":\"LambdaFunctionArn\"},\
      \"max\":1\
    },\
    \"ExceptionMessage\":{\"type\":\"string\"},\
    \"GetBulkPublishDetailsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityPoolId\"],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityPoolId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        }\
      },\
      \"documentation\":\"The input for the GetBulkPublishDetails operation.\"\
    },\
    \"GetBulkPublishDetailsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        },\
        \"BulkPublishStartTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"The date/time at which the last bulk publish was initiated.\"\
        },\
        \"BulkPublishCompleteTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"If BulkPublishStatus is SUCCEEDED, the time the last bulk publish operation completed.\"\
        },\
        \"BulkPublishStatus\":{\
          \"shape\":\"BulkPublishStatus\",\
          \"documentation\":\"Status of the last bulk publish operation, valid values are: <p>NOT_STARTED - No bulk publish has been requested for this identity pool</p> <p>IN_PROGRESS - Data is being published to the configured stream</p> <p>SUCCEEDED - All data for the identity pool has been published to the configured stream</p> <p>FAILED - Some portion of the data has failed to publish, check FailureMessage for the cause.</p>\"\
        },\
        \"FailureMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"If BulkPublishStatus is FAILED this field will contain the error message that caused the bulk publish to fail.\"\
        }\
      },\
      \"documentation\":\"The output for the GetBulkPublishDetails operation.\"\
    },\
    \"GetCognitoEventsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityPoolId\"],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityPoolId\",\
          \"documentation\":\"<p>The Cognito Identity Pool ID for the request</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request for a list of the configured Cognito Events</p>\"\
    },\
    \"GetCognitoEventsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Events\":{\
          \"shape\":\"Events\",\
          \"documentation\":\"<p>The Cognito Events returned from the GetCognitoEvents request</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response from the GetCognitoEvents request</p>\"\
    },\
    \"GetIdentityPoolConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityPoolId\"],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityPoolId\",\
          \"documentation\":\"<p>A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. This is the ID of the pool for which to return a configuration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the GetIdentityPoolConfiguration operation.</p>\"\
    },\
    \"GetIdentityPoolConfigurationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"<p>A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.</p>\"\
        },\
        \"PushSync\":{\
          \"shape\":\"PushSync\",\
          \"documentation\":\"<p>Options to apply to this identity pool for push synchronization.</p>\"\
        },\
        \"CognitoStreams\":{\
          \"shape\":\"CognitoStreams\",\
          \"documentation\":\"Options to apply to this identity pool for Amazon Cognito streams.\"\
        }\
      },\
      \"documentation\":\"<p>The output for the GetIdentityPoolConfiguration operation.</p>\"\
    },\
    \"IdentityId\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"max\":55,\
      \"pattern\":\"[\\\\w-]+:[0-9a-f-]+\"\
    },\
    \"IdentityPoolId\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"max\":55,\
      \"pattern\":\"[\\\\w-]+:[0-9a-f-]+\"\
    },\
    \"IdentityPoolUsage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        },\
        \"SyncSessionsCount\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"Number of sync sessions for the identity pool.\"\
        },\
        \"DataStorage\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"Data storage information for the identity pool.\"\
        },\
        \"LastModifiedDate\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"Date on which the identity pool was last modified.\"\
        }\
      },\
      \"documentation\":\"Usage information for the identity pool.\"\
    },\
    \"IdentityPoolUsageList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IdentityPoolUsage\"}\
    },\
    \"IdentityUsage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        },\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        },\
        \"LastModifiedDate\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"Date on which the identity was last modified.\"\
        },\
        \"DatasetCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"Number of datasets for the identity.\"\
        },\
        \"DataStorage\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"Total data storage for this identity.\"\
        }\
      },\
      \"documentation\":\"Usage information for the identity.\"\
    },\
    \"Integer\":{\"type\":\"integer\"},\
    \"IntegerString\":{\"type\":\"integer\"},\
    \"InternalErrorException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ExceptionMessage\",\
          \"documentation\":\"Message returned by InternalErrorException.\"\
        }\
      },\
      \"error\":{\
        \"code\":\"InternalError\",\
        \"httpStatusCode\":500\
      },\
      \"exception\":true,\
      \"fault\":true,\
      \"documentation\":\"Indicates an internal service error.\"\
    },\
    \"InvalidConfigurationException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ExceptionMessage\",\
          \"documentation\":\"Message returned by InvalidConfigurationException.\"\
        }\
      },\
      \"error\":{\
        \"code\":\"InvalidConfiguration\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidLambdaFunctionOutputException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ExceptionMessage\",\
          \"documentation\":\"<p>A message returned when an InvalidLambdaFunctionOutputException occurs</p>\"\
        }\
      },\
      \"error\":{\
        \"code\":\"InvalidLambdaFunctionOutput\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true,\
      \"documentation\":\"<p>The AWS Lambda function returned invalid output or an exception.</p>\"\
    },\
    \"InvalidParameterException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ExceptionMessage\",\
          \"documentation\":\"Message returned by InvalidParameterException.\"\
        }\
      },\
      \"error\":{\
        \"code\":\"InvalidParameter\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true,\
      \"documentation\":\"Thrown when a request parameter does not comply with the associated constraints.\"\
    },\
    \"LambdaFunctionArn\":{\"type\":\"string\"},\
    \"LambdaThrottledException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ExceptionMessage\",\
          \"documentation\":\"<p>A message returned when an LambdaThrottledException is thrown</p>\"\
        }\
      },\
      \"error\":{\
        \"code\":\"LambdaThrottled\",\
        \"httpStatusCode\":429,\
        \"senderFault\":true\
      },\
      \"exception\":true,\
      \"documentation\":\"<p>AWS Lambda throttled your account, please contact AWS Support</p>\"\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ExceptionMessage\",\
          \"documentation\":\"Message returned by LimitExceededException.\"\
        }\
      },\
      \"error\":{\
        \"code\":\"LimitExceeded\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true,\
      \"documentation\":\"Thrown when the limit on the number of objects or operations has been exceeded.\"\
    },\
    \"ListDatasetsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityId\",\
        \"IdentityPoolId\"\
      ],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityPoolId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        },\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\",\
          \"documentation\":\"A pagination token for obtaining the next page of results.\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"IntegerString\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\",\
          \"documentation\":\"The maximum number of results to be returned.\"\
        }\
      },\
      \"documentation\":\"Request for a list of datasets for an identity.\"\
    },\
    \"ListDatasetsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Datasets\":{\
          \"shape\":\"DatasetList\",\
          \"documentation\":\"A set of datasets.\"\
        },\
        \"Count\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"Number of datasets returned.\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"A pagination token for obtaining the next page of results.\"\
        }\
      },\
      \"documentation\":\"Returned for a successful ListDatasets request.\"\
    },\
    \"ListIdentityPoolUsageRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\",\
          \"documentation\":\"A pagination token for obtaining the next page of results.\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"IntegerString\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\",\
          \"documentation\":\"The maximum number of results to be returned.\"\
        }\
      },\
      \"documentation\":\"A request for usage information on an identity pool.\"\
    },\
    \"ListIdentityPoolUsageResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityPoolUsages\":{\
          \"shape\":\"IdentityPoolUsageList\",\
          \"documentation\":\"Usage information for the identity pools.\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"The maximum number of results to be returned.\"\
        },\
        \"Count\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"Total number of identities for the identity pool.\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"A pagination token for obtaining the next page of results.\"\
        }\
      },\
      \"documentation\":\"Returned for a successful ListIdentityPoolUsage request.\"\
    },\
    \"ListRecordsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityPoolId\",\
        \"IdentityId\",\
        \"DatasetName\"\
      ],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityPoolId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        },\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        },\
        \"DatasetName\":{\
          \"shape\":\"DatasetName\",\
          \"location\":\"uri\",\
          \"locationName\":\"DatasetName\",\
          \"documentation\":\"A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9, '_' (underscore), '-' (dash), and '.' (dot).\"\
        },\
        \"LastSyncCount\":{\
          \"shape\":\"Long\",\
          \"location\":\"querystring\",\
          \"locationName\":\"lastSyncCount\",\
          \"documentation\":\"The last server sync count for this record.\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\",\
          \"documentation\":\"A pagination token for obtaining the next page of results.\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"IntegerString\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\",\
          \"documentation\":\"The maximum number of results to be returned.\"\
        },\
        \"SyncSessionToken\":{\
          \"shape\":\"SyncSessionToken\",\
          \"location\":\"querystring\",\
          \"locationName\":\"syncSessionToken\",\
          \"documentation\":\"A token containing a session ID, identity ID, and expiration.\"\
        }\
      },\
      \"documentation\":\"A request for a list of records.\"\
    },\
    \"ListRecordsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Records\":{\
          \"shape\":\"RecordList\",\
          \"documentation\":\"A list of all records.\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"A pagination token for obtaining the next page of results.\"\
        },\
        \"Count\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"Total number of records.\"\
        },\
        \"DatasetSyncCount\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"Server sync count for this dataset.\"\
        },\
        \"LastModifiedBy\":{\
          \"shape\":\"String\",\
          \"documentation\":\"The user/device that made the last change to this record.\"\
        },\
        \"MergedDatasetNames\":{\
          \"shape\":\"MergedDatasetNameList\",\
          \"documentation\":\"Names of merged datasets.\"\
        },\
        \"DatasetExists\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"Indicates whether the dataset exists.\"\
        },\
        \"DatasetDeletedAfterRequestedSyncCount\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"A boolean value specifying whether to delete the dataset locally.\"\
        },\
        \"SyncSessionToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"A token containing a session ID, identity ID, and expiration.\"\
        }\
      },\
      \"documentation\":\"Returned for a successful ListRecordsRequest.\"\
    },\
    \"Long\":{\"type\":\"long\"},\
    \"MergedDatasetNameList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"NotAuthorizedException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ExceptionMessage\",\
          \"documentation\":\"The message returned by a NotAuthorizedException.\"\
        }\
      },\
      \"error\":{\
        \"code\":\"NotAuthorizedError\",\
        \"httpStatusCode\":403,\
        \"senderFault\":true\
      },\
      \"exception\":true,\
      \"documentation\":\"Thrown when a user is not authorized to access the requested resource.\"\
    },\
    \"Operation\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"replace\",\
        \"remove\"\
      ]\
    },\
    \"Platform\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"APNS\",\
        \"APNS_SANDBOX\",\
        \"GCM\",\
        \"ADM\"\
      ]\
    },\
    \"PushSync\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ApplicationArns\":{\
          \"shape\":\"ApplicationArnList\",\
          \"documentation\":\"<p>List of SNS platform application ARNs that could be used by clients.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"AssumeRoleArn\",\
          \"documentation\":\"<p>A role configured to allow Cognito to call SNS on behalf of the developer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration options to be applied to the identity pool.</p>\"\
    },\
    \"PushToken\":{\"type\":\"string\"},\
    \"Record\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"RecordKey\",\
          \"documentation\":\"The key for the record.\"\
        },\
        \"Value\":{\
          \"shape\":\"RecordValue\",\
          \"documentation\":\"The value for the record.\"\
        },\
        \"SyncCount\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"The server sync count for this record.\"\
        },\
        \"LastModifiedDate\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"The date on which the record was last modified.\"\
        },\
        \"LastModifiedBy\":{\
          \"shape\":\"String\",\
          \"documentation\":\"The user/device that made the last change to this record.\"\
        },\
        \"DeviceLastModifiedDate\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"The last modified date of the client device.\"\
        }\
      },\
      \"documentation\":\"The basic data structure of a dataset.\"\
    },\
    \"RecordKey\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"max\":1024\
    },\
    \"RecordList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Record\"}\
    },\
    \"RecordPatch\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Op\",\
        \"Key\",\
        \"SyncCount\"\
      ],\
      \"members\":{\
        \"Op\":{\
          \"shape\":\"Operation\",\
          \"documentation\":\"An operation, either replace or remove.\"\
        },\
        \"Key\":{\
          \"shape\":\"RecordKey\",\
          \"documentation\":\"The key associated with the record patch.\"\
        },\
        \"Value\":{\
          \"shape\":\"RecordValue\",\
          \"documentation\":\"The value associated with the record patch.\"\
        },\
        \"SyncCount\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"Last known server sync count for this record. Set to 0 if unknown.\"\
        },\
        \"DeviceLastModifiedDate\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"The last modified date of the client device.\"\
        }\
      },\
      \"documentation\":\"An update operation for a record.\"\
    },\
    \"RecordPatchList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RecordPatch\"}\
    },\
    \"RecordValue\":{\
      \"type\":\"string\",\
      \"max\":1048575\
    },\
    \"RegisterDeviceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityPoolId\",\
        \"IdentityId\",\
        \"Platform\",\
        \"Token\"\
      ],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityPoolId\",\
          \"documentation\":\"<p>A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. Here, the ID of the pool that the identity belongs to.</p>\"\
        },\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityId\",\
          \"documentation\":\"<p>The unique ID for this identity.</p>\"\
        },\
        \"Platform\":{\
          \"shape\":\"Platform\",\
          \"documentation\":\"<p>The SNS platform type (e.g. GCM, SDM, APNS, APNS_SANDBOX).</p>\"\
        },\
        \"Token\":{\
          \"shape\":\"PushToken\",\
          \"documentation\":\"<p>The push token.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to RegisterDevice.</p>\"\
    },\
    \"RegisterDeviceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"DeviceId\",\
          \"documentation\":\"<p>The unique ID generated for this device by Cognito.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response to a RegisterDevice request.</p>\"\
    },\
    \"ResourceConflictException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ExceptionMessage\",\
          \"documentation\":\"The message returned by a ResourceConflictException.\"\
        }\
      },\
      \"error\":{\
        \"code\":\"ResourceConflict\",\
        \"httpStatusCode\":409,\
        \"senderFault\":true\
      },\
      \"exception\":true,\
      \"documentation\":\"Thrown if an update can't be applied because the resource was changed by another call and this would result in a conflict.\"\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ExceptionMessage\",\
          \"documentation\":\"Message returned by a ResourceNotFoundException.\"\
        }\
      },\
      \"error\":{\
        \"code\":\"ResourceNotFound\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true,\
      \"documentation\":\"Thrown if the resource doesn't exist.\"\
    },\
    \"SetCognitoEventsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityPoolId\",\
        \"Events\"\
      ],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityPoolId\",\
          \"documentation\":\"<p>The Cognito Identity Pool to use when configuring Cognito Events</p>\"\
        },\
        \"Events\":{\
          \"shape\":\"Events\",\
          \"documentation\":\"<p>The events to configure</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to configure Cognito Events\\\"</p>\\\"\"\
    },\
    \"SetIdentityPoolConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityPoolId\"],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityPoolId\",\
          \"documentation\":\"<p>A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. This is the ID of the pool to modify.</p>\"\
        },\
        \"PushSync\":{\
          \"shape\":\"PushSync\",\
          \"documentation\":\"<p>Options to apply to this identity pool for push synchronization.</p>\"\
        },\
        \"CognitoStreams\":{\
          \"shape\":\"CognitoStreams\",\
          \"documentation\":\"Options to apply to this identity pool for Amazon Cognito streams.\"\
        }\
      },\
      \"documentation\":\"<p>The input for the SetIdentityPoolConfiguration operation.</p>\"\
    },\
    \"SetIdentityPoolConfigurationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"documentation\":\"<p>A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.</p>\"\
        },\
        \"PushSync\":{\
          \"shape\":\"PushSync\",\
          \"documentation\":\"<p>Options to apply to this identity pool for push synchronization.</p>\"\
        },\
        \"CognitoStreams\":{\
          \"shape\":\"CognitoStreams\",\
          \"documentation\":\"Options to apply to this identity pool for Amazon Cognito streams.\"\
        }\
      },\
      \"documentation\":\"<p>The output for the SetIdentityPoolConfiguration operation</p>\"\
    },\
    \"StreamName\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"max\":128\
    },\
    \"StreamingStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENABLED\",\
        \"DISABLED\"\
      ]\
    },\
    \"String\":{\"type\":\"string\"},\
    \"SubscribeToDatasetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityPoolId\",\
        \"IdentityId\",\
        \"DatasetName\",\
        \"DeviceId\"\
      ],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityPoolId\",\
          \"documentation\":\"<p>A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. The ID of the pool to which the identity belongs.</p>\"\
        },\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityId\",\
          \"documentation\":\"<p>Unique ID for this identity.</p>\"\
        },\
        \"DatasetName\":{\
          \"shape\":\"DatasetName\",\
          \"location\":\"uri\",\
          \"locationName\":\"DatasetName\",\
          \"documentation\":\"<p>The name of the dataset to subcribe to.</p>\"\
        },\
        \"DeviceId\":{\
          \"shape\":\"DeviceId\",\
          \"location\":\"uri\",\
          \"locationName\":\"DeviceId\",\
          \"documentation\":\"<p>The unique ID generated for this device by Cognito.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to SubscribeToDatasetRequest.</p>\"\
    },\
    \"SubscribeToDatasetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Response to a SubscribeToDataset request.</p>\"\
    },\
    \"SyncSessionToken\":{\"type\":\"string\"},\
    \"TooManyRequestsException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ExceptionMessage\",\
          \"documentation\":\"Message returned by a TooManyRequestsException.\"\
        }\
      },\
      \"error\":{\
        \"code\":\"TooManyRequests\",\
        \"httpStatusCode\":429,\
        \"senderFault\":true\
      },\
      \"exception\":true,\
      \"documentation\":\"Thrown if the request is throttled.\"\
    },\
    \"UnsubscribeFromDatasetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityPoolId\",\
        \"IdentityId\",\
        \"DatasetName\",\
        \"DeviceId\"\
      ],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityPoolId\",\
          \"documentation\":\"<p>A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. The ID of the pool to which this identity belongs.</p>\"\
        },\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityId\",\
          \"documentation\":\"<p>Unique ID for this identity.</p>\"\
        },\
        \"DatasetName\":{\
          \"shape\":\"DatasetName\",\
          \"location\":\"uri\",\
          \"locationName\":\"DatasetName\",\
          \"documentation\":\"<p>The name of the dataset from which to unsubcribe.</p>\"\
        },\
        \"DeviceId\":{\
          \"shape\":\"DeviceId\",\
          \"location\":\"uri\",\
          \"locationName\":\"DeviceId\",\
          \"documentation\":\"<p>The unique ID generated for this device by Cognito.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to UnsubscribeFromDataset.</p>\"\
    },\
    \"UnsubscribeFromDatasetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Response to an UnsubscribeFromDataset request.</p>\"\
    },\
    \"UpdateRecordsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityPoolId\",\
        \"IdentityId\",\
        \"DatasetName\",\
        \"SyncSessionToken\"\
      ],\
      \"members\":{\
        \"IdentityPoolId\":{\
          \"shape\":\"IdentityPoolId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityPoolId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        },\
        \"IdentityId\":{\
          \"shape\":\"IdentityId\",\
          \"location\":\"uri\",\
          \"locationName\":\"IdentityId\",\
          \"documentation\":\"A name-spaced GUID (for example, us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito. GUID generation is unique within a region.\"\
        },\
        \"DatasetName\":{\
          \"shape\":\"DatasetName\",\
          \"location\":\"uri\",\
          \"locationName\":\"DatasetName\",\
          \"documentation\":\"A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9, '_' (underscore), '-' (dash), and '.' (dot).\"\
        },\
        \"DeviceId\":{\
          \"shape\":\"DeviceId\",\
          \"documentation\":\"<p>The unique ID generated for this device by Cognito.</p>\"\
        },\
        \"RecordPatches\":{\
          \"shape\":\"RecordPatchList\",\
          \"documentation\":\"A list of patch operations.\"\
        },\
        \"SyncSessionToken\":{\
          \"shape\":\"SyncSessionToken\",\
          \"documentation\":\"The SyncSessionToken returned by a previous call to ListRecords for this dataset and identity.\"\
        },\
        \"ClientContext\":{\
          \"shape\":\"ClientContext\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-Client-Context\",\
          \"documentation\":\"Intended to supply a device ID that will populate the lastModifiedBy field referenced in other methods. The ClientContext field is not yet implemented.\"\
        }\
      },\
      \"documentation\":\"A request to post updates to records or add and delete records for a dataset and user.\"\
    },\
    \"UpdateRecordsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Records\":{\
          \"shape\":\"RecordList\",\
          \"documentation\":\"A list of records that have been updated.\"\
        }\
      },\
      \"documentation\":\"Returned for a successful UpdateRecordsRequest.\"\
    }\
  },\
  \"examples\":{\
  }\
}\
";
}

@end
