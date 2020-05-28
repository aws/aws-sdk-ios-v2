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

#import "AWSKafkaResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSKafkaResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSKafkaResources

+ (instancetype)sharedInstance {
    static AWSKafkaResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSKafkaResources new];
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
  \"metadata\": {\
    \"apiVersion\": \"2018-11-14\",\
    \"endpointPrefix\": \"kafka\",\
    \"signingName\": \"kafka\",\
    \"serviceFullName\": \"Managed Streaming for Kafka\",\
    \"serviceAbbreviation\": \"Kafka\",\
    \"serviceId\": \"Kafka\",\
    \"protocol\": \"rest-json\",\
    \"jsonVersion\": \"1.1\",\
    \"uid\": \"kafka-2018-11-14\",\
    \"signatureVersion\": \"v4\"\
  },\
  \"operations\": {\
    \"CreateCluster\": {\
      \"name\": \"CreateCluster\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/clusters\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"CreateClusterRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateClusterResponse\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"\\n            <p>The request is not authorized. The provided credentials couldn't be validated.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"\\n            <p>503 response</p>\\n         \"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"\\n            <p>429 response</p>\\n         \"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"\\n            <p>This cluster name already exists. Retry your request using another name.</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Creates a new MSK cluster.</p>\\n         \"\
    },\
    \"CreateConfiguration\": {\
      \"name\": \"CreateConfiguration\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/configurations\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"CreateConfigurationRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateConfigurationResponse\",\
        \"documentation\": \"\\n            <p>200 response</p>\\n         \"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"\\n            <p>The request is not authorized. The provided credentials couldn't be validated.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"\\n            <p>503 response</p>\\n         \"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"\\n            <p>429 response</p>\\n         \"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"\\n            <p>This cluster name already exists. Retry your request using another name.</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Creates a new MSK configuration.</p>\\n         \"\
    },\
    \"DeleteCluster\": {\
      \"name\": \"DeleteCluster\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/clusters/{clusterArn}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteClusterRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteClusterResponse\",\
        \"documentation\": \"\\n            <p>Successful response.</p>\\n         \"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"\\n            <p>The resource could not be found due to incorrect input. Correct the input, then retry the request.</p>\\n         \"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Deletes the MSK cluster specified by the Amazon Resource Name (ARN) in the request.</p>\\n         \"\
    },\
    \"DescribeCluster\": {\
      \"name\": \"DescribeCluster\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/clusters/{clusterArn}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeClusterRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeClusterResponse\",\
        \"documentation\": \"\\n            <p>Successful response.</p>\\n         \"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"\\n            <p>The resource could not be found due to incorrect input. Correct the input, then retry the request.</p>\\n         \"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"\\n            <p>The request is not authorized. The provided credentials couldn't be validated.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Returns a description of the MSK cluster whose Amazon Resource Name (ARN) is specified in the request.</p>\\n         \"\
    },\
    \"DescribeClusterOperation\": {\
      \"name\": \"DescribeClusterOperation\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/operations/{clusterOperationArn}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeClusterOperationRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeClusterOperationResponse\",\
        \"documentation\": \"\\n            <p>200 response</p>\\n         \"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"\\n            <p>The resource could not be found due to incorrect input. Correct the input, then retry the request.</p>\\n         \"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"\\n            <p>The request is not authorized. The provided credentials couldn't be validated.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Returns a description of the cluster operation specified by the ARN.</p>\\n         \"\
    },\
    \"DescribeConfiguration\": {\
      \"name\": \"DescribeConfiguration\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/configurations/{arn}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeConfigurationRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeConfigurationResponse\",\
        \"documentation\": \"\\n            <p>200 response</p>\\n         \"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"\\n            <p>The request is not authorized. The provided credentials couldn't be validated.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n         \"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"\\n            <p>The resource could not be found due to incorrect input. Correct the input, then retry the request.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"\\n            <p>503 response</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Returns a description of this MSK configuration.</p>\\n         \"\
    },\
    \"DescribeConfigurationRevision\": {\
      \"name\": \"DescribeConfigurationRevision\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/configurations/{arn}/revisions/{revision}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeConfigurationRevisionRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeConfigurationRevisionResponse\",\
        \"documentation\": \"\\n            <p>200 response</p>\\n         \"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"\\n            <p>The request is not authorized. The provided credentials couldn't be validated.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n         \"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"\\n            <p>The resource could not be found due to incorrect input. Correct the input, then retry the request.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"\\n            <p>503 response</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Returns a description of this revision of the configuration.</p>\\n         \"\
    },\
    \"GetBootstrapBrokers\": {\
      \"name\": \"GetBootstrapBrokers\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/clusters/{clusterArn}/bootstrap-brokers\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetBootstrapBrokersRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetBootstrapBrokersResponse\",\
        \"documentation\": \"\\n            <p>Successful response.</p>\\n         \"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"\\n            <p>The request is not authorized. The provided credentials couldn't be validated.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"\\n            <p>This cluster name already exists. Retry your request using another name.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>A list of brokers that a client application can use to bootstrap.</p>\\n         \"\
    },\
    \"GetCompatibleKafkaVersions\" : {\
      \"name\" : \"GetCompatibleKafkaVersions\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/compatible-kafka-versions\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetCompatibleKafkaVersionsRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetCompatibleKafkaVersionsResponse\",\
        \"documentation\": \"\\n            <p>Successful response.</p>\\n         \"\
      },\
      \"errors\" : \
      [ \
        {\
          \"shape\" : \"BadRequestException\",\
          \"documentation\" : \"n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>n            \"\
        }, \
        {\
          \"shape\" : \"UnauthorizedException\",\
          \"documentation\" : \"n            <p>The request is not authorized. The provided credentials couldn't be validated.</p>n            \"\
        }, \
        {\
          \"shape\" : \"InternalServerErrorException\",\
          \"documentation\" : \"n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>n            \"\
        }, \
        {\
          \"shape\" : \"ForbiddenException\",\
          \"documentation\" : \"n            <p>Access forbidden. Check your credentials and then retry your request.</p>n            \"\
        }, \
        {\
          \"shape\" : \"NotFoundException\",\
          \"documentation\" : \"n            <p>The resource could not be found due to incorrect input. Correct the input, then retry the request.</p>n            \"\
        }, \
        {\
          \"shape\" : \"ServiceUnavailableException\",\
          \"documentation\" : \"n            <p>503 response</p>n            \"\
        }, \
        {\
          \"shape\" : \"TooManyRequestsException\",\
          \"documentation\" : \"n            <p>429 response</p>n            \"\
        } \
      ],\
      \"documentation\": \"\\n            <p>Gets the Apache Kafka versions to which you can update the MSK cluster.</p>\\n         \"\
    },\
    \"ListClusterOperations\": {\
      \"name\": \"ListClusterOperations\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/clusters/{clusterArn}/operations\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListClusterOperationsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListClusterOperationsResponse\",\
        \"documentation\": \"\\n            <p>Successful response.</p>\\n         \"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"\\n            <p>The request is not authorized. The provided credentials couldn't be validated.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Returns a list of all the operations that have been performed on the specified MSK cluster.</p>\\n         \"\
    },\
    \"ListClusters\": {\
      \"name\": \"ListClusters\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/clusters\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListClustersRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListClustersResponse\",\
        \"documentation\": \"\\n            <p>Successful response.</p>\\n         \"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"\\n            <p>The request is not authorized. The provided credentials couldn't be validated.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Returns a list of all the MSK clusters in the current Region.</p>\\n         \"\
    },\
    \"ListConfigurationRevisions\": {\
      \"name\": \"ListConfigurationRevisions\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/configurations/{arn}/revisions\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListConfigurationRevisionsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListConfigurationRevisionsResponse\",\
        \"documentation\": \"\\n            <p>200 response</p>\\n         \"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"\\n            <p>The request is not authorized. The provided credentials couldn't be validated.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n         \"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"\\n            <p>The resource could not be found due to incorrect input. Correct the input, then retry the request.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"\\n            <p>503 response</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Returns a list of all the MSK configurations in this Region.</p>\\n         \"\
    },\
    \"ListConfigurations\": {\
      \"name\": \"ListConfigurations\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/configurations\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListConfigurationsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListConfigurationsResponse\",\
        \"documentation\": \"\\n            <p>200 response</p>\\n         \"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"\\n            <p>503 response</p>\\n         \"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"\\n            <p>The request is not authorized. The provided credentials couldn't be validated.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Returns a list of all the MSK configurations in this Region.</p>\\n         \"\
    },\
    \"ListKafkaVersions\": {\
      \"name\": \"ListKafkaVersions\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/kafka-versions\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListKafkaVersionsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListKafkaVersionsResponse\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"\\n            <p>The request is not authorized. The provided credentials couldn't be validated.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Returns a list of Kafka versions.</p>\\n         \"\
    },\
    \"ListNodes\": {\
      \"name\": \"ListNodes\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/clusters/{clusterArn}/nodes\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListNodesRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListNodesResponse\",\
        \"documentation\": \"\\n            <p>Successful response.</p>\\n         \"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"\\n            <p>The resource could not be found due to incorrect input. Correct the input, then retry the request.</p>\\n         \"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Returns a list of the broker nodes in the cluster.</p>\\n         \"\
    },\
    \"ListTagsForResource\": {\
      \"name\": \"ListTagsForResource\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/tags/{resourceArn}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListTagsForResourceRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListTagsForResourceResponse\",\
        \"documentation\": \"\\n            <p>Success response.</p>\\n         \"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"\\n            <p>The resource could not be found due to incorrect input. Correct the input, then retry the request.</p>\\n         \"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Returns a list of the tags associated with the specified resource.</p>\\n         \"\
    },\
    \"TagResource\": {\
      \"name\": \"TagResource\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/tags/{resourceArn}\",\
        \"responseCode\": 204\
      },\
      \"input\": {\
        \"shape\": \"TagResourceRequest\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"\\n            <p>The resource could not be found due to incorrect input. Correct the input, then retry the request.</p>\\n         \"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Adds tags to the specified MSK resource.</p>\\n         \"\
    },\
    \"UntagResource\": {\
      \"name\": \"UntagResource\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/tags/{resourceArn}\",\
        \"responseCode\": 204\
      },\
      \"input\": {\
        \"shape\": \"UntagResourceRequest\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"\\n            <p>The resource could not be found due to incorrect input. Correct the input, then retry the request.</p>\\n         \"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Removes the tags associated with the keys that are provided in the query.</p>\\n         \"\
    },\
    \"UpdateBrokerCount\": {\
      \"name\": \"UpdateBrokerCount\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/clusters/{clusterArn}/nodes/count\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateBrokerCountRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateBrokerCountResponse\",\
        \"documentation\": \"\\n            <p>Successful response.</p>\\n         \"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"\\n            <p>503 response</p>\\n         \"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"\\n            <p>The request is not authorized. The provided credentials couldn't be validated.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Updates the number of broker nodes in the cluster.</p>\\n         \"\
    },\
    \"UpdateBrokerStorage\": {\
      \"name\": \"UpdateBrokerStorage\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/clusters/{clusterArn}/nodes/storage\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateBrokerStorageRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateBrokerStorageResponse\",\
        \"documentation\": \"\\n            <p>Successful response.</p>\\n         \"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"\\n            <p>503 response</p>\\n         \"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"\\n            <p>The request is not authorized. The provided credentials couldn't be validated.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Updates the EBS storage associated with MSK brokers.</p>\\n         \"\
    },\
    \"UpdateClusterConfiguration\": {\
      \"name\": \"UpdateClusterConfiguration\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/clusters/{clusterArn}/configuration\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateClusterConfigurationRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateClusterConfigurationResponse\",\
        \"documentation\": \"\\n            <p>Successful response.</p>\\n         \"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n         \"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"\\n            <p>The request is not authorized. The provided credentials couldn't be validated.</p>\\n         \"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n         \"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"\\n            <p>The resource could not be found due to incorrect input. Correct the input, then retry the request.</p>\\n         \"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"\\n            <p>503 response</p>\\n         \"\
        }\
      ],\
      \"documentation\": \"\\n            <p>Updates the cluster with the configuration that is specified in the request body.</p>\\n         \"\
    },\
    \"UpdateClusterKafkaVersion\" : {\
      \"name\" : \"UpdateClusterKafkaVersion\",\
      \"http\" : {\
        \"method\" : \"PUT\",\
        \"requestUri\" : \"/v1/clusters/{clusterArn}/version\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"UpdateClusterKafkaVersionRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"UpdateClusterKafkaVersionResponse\",\
        \"documentation\" : \"\\n            <p>Successful response.</p>\\n            \"\
      },\
      \"errors\" : [ \
        {\
          \"shape\" : \"BadRequestException\",\
          \"documentation\" : \"\\n            <p>The request isn't valid because the input is incorrect. Correct your input and then submit it again.</p>\\n            \"\
        }, \
        {\
          \"shape\" : \"UnauthorizedException\",\
          \"documentation\" : \"\\n            <p>The request is not authorized. The provided credentials couldn't be validated.</p>\\n            \"\
        }, \
        {\
          \"shape\" : \"InternalServerErrorException\",\
          \"documentation\" : \"\\n            <p>There was an unexpected internal server error. Retrying your request might resolve the issue.</p>\\n            \"\
        }, \
        {\
          \"shape\" : \"ForbiddenException\",\
          \"documentation\" : \"\\n            <p>Access forbidden. Check your credentials and then retry your request.</p>\\n            \"\
        }, \
        {\
          \"shape\" : \"NotFoundException\",\
          \"documentation\" : \"\\n            <p>The resource could not be found due to incorrect input. Correct the input, then retry the request.</p>\\n            \"\
        }, \
        {\
          \"shape\" : \"ServiceUnavailableException\",\
          \"documentation\" : \"\\n            <p>503 response</p>\\n            \"\
        }, \
        {\
          \"shape\" : \"TooManyRequestsException\",\
          \"documentation\" : \"\\n            <p>429 response</p>\\n            \"\
        } \
      ],\
      \"documentation\": \"\\n            <p>Updates the Apache Kafka version for the cluster.</p>\\n         \"\
    },\
    \"UpdateMonitoring\" : {\
      \"name\" : \"UpdateMonitoring\",\
      \"http\" : {\
        \"method\" : \"PUT\",\
        \"requestUri\" : \"/v1/clusters/{clusterArn}/monitoring\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"UpdateMonitoringRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"UpdateMonitoringResponse\",\
        \"documentation\" : \"\\n            <p>HTTP Status Code 200: OK.</p>\\n         \"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"ServiceUnavailableException\",\
        \"documentation\" : \"\\n            <p>HTTP Status Code 503: Service Unavailable. Retrying your request in some time might resolve the issue.</p>\\n         \"\
      }, {\
        \"shape\" : \"BadRequestException\",\
        \"documentation\" : \"\\n            <p>HTTP Status Code 400: Bad request due to incorrect input. Correct your request and then retry it.</p>\\n         \"\
      }, {\
        \"shape\" : \"UnauthorizedException\",\
        \"documentation\" : \"\\n            <p>HTTP Status Code 401: Unauthorized request. The provided credentials couldn't be validated.</p>\\n         \"\
      }, {\
        \"shape\" : \"InternalServerErrorException\",\
        \"documentation\" : \"\\n            <p>HTTP Status Code 500: Unexpected internal server error. Retrying your request might resolve the issue.</p>\\n         \"\
      }, {\
        \"shape\" : \"ForbiddenException\",\
        \"documentation\" : \"\\n            <p>HTTP Status Code 403: Access forbidden. Correct your credentials and then retry your request.</p>\\n         \"\
      } ],\
      \"documentation\" : \"\\n            <p>Updates the monitoring settings for the cluster. You can use this operation to specify which Apache Kafka metrics you want Amazon MSK to send to Amazon CloudWatch. You can also specify settings for open monitoring with Prometheus.</p>\\n         \"\
    }\
  },\
  \"shapes\": {\
    \"BadRequestException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InvalidParameter\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"invalidParameter\",\
          \"documentation\": \"\\n            <p>The parameter that caused the error.</p>\\n         \"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\",\
          \"documentation\": \"\\n            <p>The description of the error.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Returns information about an error.</p>\\n         \",\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 400\
      }\
    },\
    \"BrokerAZDistribution\": {\
      \"type\": \"string\",\
      \"documentation\": \"\\n            <p>The distribution of broker nodes across Availability Zones. This is an optional parameter. If you don't specify it, Amazon MSK gives it the value DEFAULT. You can also explicitly set this parameter to the value DEFAULT. No other values are currently allowed.</p>\\n         <p>Amazon MSK distributes the broker nodes evenly across the Availability Zones that correspond to the subnets you provide when you create the cluster.</p>\\n         \",\
      \"enum\": [\
        \"DEFAULT\"\
      ]\
    },\
    \"BrokerEBSVolumeInfo\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"KafkaBrokerNodeId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"kafkaBrokerNodeId\",\
          \"documentation\": \"\\n            <p>The ID of the broker to update.</p>\\n         \"\
        },\
        \"VolumeSizeGB\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"volumeSizeGB\",\
          \"documentation\": \"\\n            <p>Size of the EBS volume to update.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Specifies the EBS volume upgrade information. The broker identifier must be set to the keyword ALL. This means the changes apply to all the brokers in the cluster.</p>\\n         \",\
      \"required\": [\
        \"VolumeSizeGB\",\
        \"KafkaBrokerNodeId\"\
      ]\
    },\
    \"BrokerLogs\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CloudWatchLogs\": {\
          \"shape\": \"CloudWatchLogs\",\
          \"locationName\": \"cloudWatchLogs\"\
        },\
        \"Firehose\": {\
          \"shape\": \"Firehose\",\
          \"locationName\": \"firehose\"\
        },\
        \"S3\": {\
          \"shape\": \"S3\",\
          \"locationName\": \"s3\"\
        }\
      }\
    },\
    \"BrokerNodeGroupInfo\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BrokerAZDistribution\": {\
          \"shape\": \"BrokerAZDistribution\",\
          \"locationName\": \"brokerAZDistribution\",\
          \"documentation\": \"\\n            <p>The distribution of broker nodes across Availability Zones. This is an optional parameter. If you don't specify it, Amazon MSK gives it the value DEFAULT. You can also explicitly set this parameter to the value DEFAULT. No other values are currently allowed.</p>\\n         <p>Amazon MSK distributes the broker nodes evenly across the Availability Zones that correspond to the subnets you provide when you create the cluster.</p>\\n         \"\
        },\
        \"ClientSubnets\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"clientSubnets\",\
          \"documentation\": \"\\n            <p>The list of subnets to connect to in the client virtual private cloud (VPC). AWS creates elastic network interfaces inside these subnets. Client applications use elastic network interfaces to produce and consume data. Client subnets can't be in Availability Zone us-east-1e.</p>\\n         \"\
        },\
        \"InstanceType\": {\
          \"shape\": \"__stringMin5Max32\",\
          \"locationName\": \"instanceType\",\
          \"documentation\": \"\\n            <p>The type of Amazon EC2 instances to use for Kafka brokers. The following instance types are allowed: kafka.m5.large, kafka.m5.xlarge, kafka.m5.2xlarge,\\nkafka.m5.4xlarge, kafka.m5.12xlarge, and kafka.m5.24xlarge.</p>\\n         \"\
        },\
        \"SecurityGroups\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"securityGroups\",\
          \"documentation\": \"\\n            <p>The AWS security groups to associate with the elastic network interfaces in order to specify who can connect to and communicate with the Amazon MSK cluster. If you don't specify a security group, Amazon MSK uses the default security group associated with the VPC.</p>\\n         \"\
        },\
        \"StorageInfo\": {\
          \"shape\": \"StorageInfo\",\
          \"locationName\": \"storageInfo\",\
          \"documentation\": \"\\n            <p>Contains information about storage volumes attached to MSK broker nodes.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Describes the setup to be used for Kafka broker nodes in the cluster.</p>\\n         \",\
      \"required\": [\
        \"ClientSubnets\",\
        \"InstanceType\"\
      ]\
    },\
    \"BrokerNodeInfo\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AttachedENIId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"attachedENIId\",\
          \"documentation\": \"\\n            <p>The attached elastic network interface of the broker.</p>\\n         \"\
        },\
        \"BrokerId\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"brokerId\",\
          \"documentation\": \"\\n            <p>The ID of the broker.</p>\\n         \"\
        },\
        \"ClientSubnet\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"clientSubnet\",\
          \"documentation\": \"\\n            <p>The client subnet to which this broker node belongs.</p>\\n         \"\
        },\
        \"ClientVpcIpAddress\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"clientVpcIpAddress\",\
          \"documentation\": \"\\n            <p>The virtual private cloud (VPC) of the client.</p>\\n         \"\
        },\
        \"CurrentBrokerSoftwareInfo\": {\
          \"shape\": \"BrokerSoftwareInfo\",\
          \"locationName\": \"currentBrokerSoftwareInfo\",\
          \"documentation\": \"\\n            <p>Information about the version of software currently deployed on the Kafka brokers in the cluster.</p>\\n         \"\
        },\
        \"Endpoints\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"endpoints\",\
          \"documentation\": \"\\n            <p>Endpoints for accessing the broker.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>BrokerNodeInfo</p>\\n         \"\
    },\
    \"BrokerSoftwareInfo\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ConfigurationArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"configurationArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) of the configuration used for the cluster. This field isn't visible in this preview release.</p>\\n         \"\
        },\
        \"ConfigurationRevision\": {\
          \"shape\": \"__long\",\
          \"locationName\": \"configurationRevision\",\
          \"documentation\": \"\\n            <p>The revision of the configuration to use. This field isn't visible in this preview release.</p>\\n         \"\
        },\
        \"KafkaVersion\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"kafkaVersion\",\
          \"documentation\": \"\\n            <p>The version of Apache Kafka.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Information about the current software installed on the cluster.</p>\\n         \"\
    },\
    \"ClientAuthentication\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Tls\": {\
          \"shape\": \"Tls\",\
          \"locationName\": \"tls\",\
          \"documentation\": \"\\n            <p>Details for ClientAuthentication using TLS.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Includes all client authentication information.</p>\\n         \"\
    },\
    \"ClientBroker\": {\
      \"type\": \"string\",\
      \"documentation\": \"\\n            <p>Client-broker encryption in transit setting.</p>\\n         \",\
      \"enum\": [\
        \"TLS\",\
        \"TLS_PLAINTEXT\",\
        \"PLAINTEXT\"\
      ]\
    },\
    \"CloudWatchLogs\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Enabled\" : {\
          \"shape\" : \"__boolean\",\
          \"locationName\" : \"enabled\"\
        },\
        \"LogGroup\" : {\
          \"shape\" : \"__string\",\
          \"locationName\" : \"logGroup\"\
        }\
      },\
      \"required\" : [ \"Enabled\" ]\
    },\
    \"ClusterInfo\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ActiveOperationArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"activeOperationArn\",\
          \"documentation\": \"\\n            <p>Arn of active cluster operation.</p>\\n         \"\
        },\
        \"BrokerNodeGroupInfo\": {\
          \"shape\": \"BrokerNodeGroupInfo\",\
          \"locationName\": \"brokerNodeGroupInfo\",\
          \"documentation\": \"\\n            <p>Information about the broker nodes.</p>\\n         \"\
        },\
        \"ClientAuthentication\": {\
          \"shape\": \"ClientAuthentication\",\
          \"locationName\": \"clientAuthentication\",\
          \"documentation\": \"\\n            <p>Includes all client authentication information.</p>\\n         \"\
        },\
        \"ClusterArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"clusterArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>\\n         \"\
        },\
        \"ClusterName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"clusterName\",\
          \"documentation\": \"\\n            <p>The name of the cluster.</p>\\n         \"\
        },\
        \"CreationTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"locationName\": \"creationTime\",\
          \"documentation\": \"\\n            <p>The time when the cluster was created.</p>\\n         \"\
        },\
        \"CurrentBrokerSoftwareInfo\": {\
          \"shape\": \"BrokerSoftwareInfo\",\
          \"locationName\": \"currentBrokerSoftwareInfo\",\
          \"documentation\": \"\\n            <p>Information about the version of software currently deployed on the Kafka brokers in the cluster.</p>\\n         \"\
        },\
        \"CurrentVersion\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"currentVersion\",\
          \"documentation\": \"\\n            <p>The current version of the MSK cluster.</p>\\n         \"\
        },\
        \"EncryptionInfo\": {\
          \"shape\": \"EncryptionInfo\",\
          \"locationName\": \"encryptionInfo\",\
          \"documentation\": \"\\n            <p>Includes all encryption-related information.</p>\\n         \"\
        },\
        \"EnhancedMonitoring\": {\
          \"shape\": \"EnhancedMonitoring\",\
          \"locationName\": \"enhancedMonitoring\",\
          \"documentation\": \"\\n            <p>Specifies which metrics are gathered for the MSK cluster. This property has three possible values: DEFAULT, PER_BROKER, and PER_TOPIC_PER_BROKER. For a list of the metrics associated with each of these three levels of monitoring, see <a href=\\\"https://docs.aws.amazon.com/msk/latest/developerguide/monitoring.html\\\">Monitoring</a>.</p>\\n         \"\
        },\
        \"OpenMonitoring\" : {\
          \"shape\" : \"OpenMonitoring\",\
          \"locationName\" : \"openMonitoring\",\
          \"documentation\" : \"\\n            <p>Settings for open monitoring using Prometheus.</p>\\n         \"\
        },\
        \"LoggingInfo\": {\
          \"shape\": \"LoggingInfo\",\
          \"locationName\": \"loggingInfo\"\
         },\
        \"NumberOfBrokerNodes\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"numberOfBrokerNodes\",\
          \"documentation\": \"\\n            <p>The number of broker nodes in the cluster.</p>\\n         \"\
        },\
        \"State\": {\
          \"shape\": \"ClusterState\",\
          \"locationName\": \"state\",\
          \"documentation\": \"\\n            <p>The state of the cluster. The possible states are CREATING, ACTIVE, and FAILED.</p>\\n         \"\
        },\
        \"StateInfo\" : {\
          \"shape\" : \"StateInfo\",\
          \"locationName\" : \"stateInfo\"\
        },\
        \"Tags\": {\
          \"shape\": \"__mapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"\\n            <p>Tags attached to the cluster.</p>\\n         \"\
        },\
        \"ZookeeperConnectString\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"zookeeperConnectString\",\
          \"documentation\": \"\\n            <p>The connection string to use to connect to the Apache ZooKeeper cluster.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Returns information about a cluster.</p>\\n         \"\
    },\
    \"ClusterOperationInfo\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClientRequestId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"clientRequestId\",\
          \"documentation\": \"\\n            <p>The ID of the API request that triggered this operation.</p>\\n         \"\
        },\
        \"ClusterArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"clusterArn\",\
          \"documentation\": \"\\n            <p>ARN of the cluster.</p>\\n         \"\
        },\
        \"CreationTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"locationName\": \"creationTime\",\
          \"documentation\": \"\\n            <p>The time that the operation was created.</p>\\n         \"\
        },\
        \"EndTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"locationName\": \"endTime\",\
          \"documentation\": \"\\n            <p>The time at which the operation finished.</p>\\n         \"\
        },\
        \"ErrorInfo\": {\
          \"shape\": \"ErrorInfo\",\
          \"locationName\": \"errorInfo\",\
          \"documentation\": \"\\n            <p>Describes the error if the operation fails.</p>\\n         \"\
        },\
        \"OperationArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"operationArn\",\
          \"documentation\": \"\\n            <p>ARN of the cluster operation.</p>\\n         \"\
        },\
        \"OperationState\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"operationState\",\
          \"documentation\": \"\\n            <p>State of the cluster operation.</p>\\n         \"\
        },\
        \"OperationSteps\" : {\
          \"shape\" : \"__listOfClusterOperationStep\",\
          \"locationName\" : \"operationSteps\",\
          \"documentation\" : \"\\n            <p>Steps completed during the operation.</p>\\n         \"\
        },\
        \"OperationType\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"operationType\",\
          \"documentation\": \"\\n            <p>Type of the cluster operation.</p>\\n         \"\
        },\
        \"SourceClusterInfo\": {\
          \"shape\": \"MutableClusterInfo\",\
          \"locationName\": \"sourceClusterInfo\",\
          \"documentation\": \"\\n            <p>Information about cluster attributes before a cluster is updated.</p>\\n         \"\
        },\
        \"TargetClusterInfo\": {\
          \"shape\": \"MutableClusterInfo\",\
          \"locationName\": \"targetClusterInfo\",\
          \"documentation\": \"\\n            <p>Information about cluster attributes after a cluster is updated.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Returns information about a cluster operation.</p>\\n         \"\
    },\
    \"ClusterOperationStep\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"StepInfo\" : {\
          \"shape\" : \"ClusterOperationStepInfo\",\
          \"locationName\" : \"stepInfo\",\
          \"documentation\" : \"\\n            <p>Information about the step and its status.</p>\\n         \"\
        },\
        \"StepName\" : {\
          \"shape\" : \"__string\",\
          \"locationName\" : \"stepName\",\
          \"documentation\" : \"\\n            <p>The name of the step.</p>\\n         \"\
        }\
      },\
      \"documentation\" : \"\\n            <p>Step taken during a cluster operation.</p>\\n         \"\
    },\
    \"ClusterOperationStepInfo\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"StepStatus\" : {\
          \"shape\" : \"__string\",\
          \"locationName\" : \"stepStatus\",\
          \"documentation\" : \"\\n            <p>The steps current status.</p>\\n         \"\
        }\
      },\
      \"documentation\" : \"\\n            <p>State information about the operation step.</p>\\n         \"\
    },\
    \"ClusterState\": {\
      \"type\": \"string\",\
      \"documentation\": \"\\n            <p>The state of a Kafka cluster.</p>\\n         \",\
      \"enum\": [\
        \"ACTIVE\",\
        \"CREATING\",\
        \"UPDATING\",\
        \"DELETING\",\
        \"FAILED\"\
      ]\
    },\
    \"CompatibleKafkaVersion\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"SourceVersion\" : {\
          \"shape\" : \"__string\",\
          \"locationName\" : \"sourceVersion\",\
          \"documentation\": \"\\n            <p>A Kafka version.</p>\\n            \"\
        },\
        \"TargetVersions\" : {\
          \"shape\" : \"__listOf__string\",\
          \"locationName\" : \"targetVersions\",\
          \"documentation\": \"\\n            <p>A list of Kafka versions.</p>\\n            \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Contains source Kafka versions and compatible target Kafka versions.</p>\\n        \"\
    },\
    \"Configuration\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) of the configuration.</p>\\n         \"\
        },\
        \"CreationTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"locationName\": \"creationTime\",\
          \"documentation\": \"\\n            <p>The time when the configuration was created.</p>\\n         \"\
        },\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"description\",\
          \"documentation\": \"\\n            <p>The description of the configuration.</p>\\n         \"\
        },\
        \"KafkaVersions\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"kafkaVersions\",\
          \"documentation\": \"\\n            <p>An array of the versions of Apache Kafka with which you can use this MSK configuration. You can use this configuration for an MSK cluster only if the Apache Kafka version specified for the cluster appears in this array.</p>\\n         \"\
        },\
        \"LatestRevision\": {\
          \"shape\": \"ConfigurationRevision\",\
          \"locationName\": \"latestRevision\",\
          \"documentation\": \"\\n            <p>Latest revision of the configuration.</p>\\n         \"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"\\n            <p>The name of the configuration.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Represents an MSK Configuration.</p>\\n         \",\
      \"required\": [\
        \"Description\",\
        \"LatestRevision\",\
        \"CreationTime\",\
        \"KafkaVersions\",\
        \"Arn\",\
        \"Name\"\
      ]\
    },\
    \"ConfigurationInfo\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"\\n            <p>ARN of the configuration to use.</p>\\n         \"\
        },\
        \"Revision\": {\
          \"shape\": \"__long\",\
          \"locationName\": \"revision\",\
          \"documentation\": \"\\n            <p>The revision of the configuration to use.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Specifies the configuration to use for the brokers.</p>\\n         \",\
      \"required\": [\
        \"Revision\",\
        \"Arn\"\
      ]\
    },\
    \"ConfigurationRevision\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreationTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"locationName\": \"creationTime\",\
          \"documentation\": \"\\n            <p>The time when the configuration revision was created.</p>\\n         \"\
        },\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"description\",\
          \"documentation\": \"\\n            <p>The description of the configuration revision.</p>\\n         \"\
        },\
        \"Revision\": {\
          \"shape\": \"__long\",\
          \"locationName\": \"revision\",\
          \"documentation\": \"\\n            <p>The revision number.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Describes a configuration revision.</p>\\n         \",\
      \"required\": [\
        \"Revision\",\
        \"CreationTime\"\
      ]\
    },\
    \"ConflictException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InvalidParameter\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"invalidParameter\",\
          \"documentation\": \"\\n            <p>The parameter that caused the error.</p>\\n         \"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\",\
          \"documentation\": \"\\n            <p>The description of the error.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Returns information about an error.</p>\\n         \",\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 409\
      }\
    },\
    \"CreateClusterRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BrokerNodeGroupInfo\": {\
          \"shape\": \"BrokerNodeGroupInfo\",\
          \"locationName\": \"brokerNodeGroupInfo\",\
          \"documentation\": \"\\n            <p>Information about the broker nodes in the cluster.</p>\\n         \"\
        },\
        \"ClientAuthentication\": {\
          \"shape\": \"ClientAuthentication\",\
          \"locationName\": \"clientAuthentication\",\
          \"documentation\": \"\\n            <p>Includes all client authentication related information.</p>\\n         \"\
        },\
        \"ClusterName\": {\
          \"shape\": \"__stringMin1Max64\",\
          \"locationName\": \"clusterName\",\
          \"documentation\": \"\\n            <p>The name of the cluster.</p>\\n         \"\
        },\
        \"ConfigurationInfo\": {\
          \"shape\": \"ConfigurationInfo\",\
          \"locationName\": \"configurationInfo\",\
          \"documentation\": \"\\n            <p>Represents the configuration that you want MSK to use for the brokers in a cluster.</p>\\n         \"\
        },\
        \"EncryptionInfo\": {\
          \"shape\": \"EncryptionInfo\",\
          \"locationName\": \"encryptionInfo\",\
          \"documentation\": \"\\n            <p>Includes all encryption-related information.</p>\\n         \"\
        },\
        \"EnhancedMonitoring\": {\
          \"shape\": \"EnhancedMonitoring\",\
          \"locationName\": \"enhancedMonitoring\",\
          \"documentation\": \"\\n            <p>Specifies the level of monitoring for the MSK cluster. The possible values are DEFAULT, PER_BROKER, and PER_TOPIC_PER_BROKER.</p>\\n         \"\
        },\
        \"OpenMonitoring\" : {\
          \"shape\" : \"OpenMonitoringInfo\",\
          \"locationName\" : \"openMonitoring\",\
          \"documentation\" : \"\\n            <p>The settings for open monitoring.</p>\\n         \"\
        },\
        \"KafkaVersion\": {\
          \"shape\": \"__stringMin1Max128\",\
          \"locationName\": \"kafkaVersion\",\
          \"documentation\": \"\\n            <p>The version of Apache Kafka.</p>\\n         \"\
        },\
        \"LoggingInfo\": {\
          \"shape\": \"LoggingInfo\",\
          \"locationName\": \"loggingInfo\"\
         },\
        \"NumberOfBrokerNodes\": {\
          \"shape\": \"__integerMin1Max15\",\
          \"locationName\": \"numberOfBrokerNodes\",\
          \"documentation\": \"\\n            <p>The number of broker nodes in the cluster.</p>\\n         \"\
        },\
        \"Tags\": {\
          \"shape\": \"__mapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"\\n            <p>Create tags when creating the cluster.</p>\\n         \"\
        }\
      },\
      \"required\": [\
        \"BrokerNodeGroupInfo\",\
        \"KafkaVersion\",\
        \"NumberOfBrokerNodes\",\
        \"ClusterName\"\
      ]\
    },\
    \"CreateClusterResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"clusterArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) of the cluster.</p>\\n         \"\
        },\
        \"ClusterName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"clusterName\",\
          \"documentation\": \"\\n            <p>The name of the MSK cluster.</p>\\n         \"\
        },\
        \"State\": {\
          \"shape\": \"ClusterState\",\
          \"locationName\": \"state\",\
          \"documentation\": \"\\n            <p>The state of the cluster. The possible states are CREATING, ACTIVE, and FAILED.</p>\\n         \"\
        }\
      }\
    },\
    \"CreateConfigurationRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"description\",\
          \"documentation\": \"\\n            <p>The description of the configuration.</p>\\n         \"\
        },\
        \"KafkaVersions\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"kafkaVersions\",\
          \"documentation\": \"\\n            <p>The versions of Apache Kafka with which you can use this MSK configuration.</p>\\n         \"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"\\n            <p>The name of the configuration.</p>\\n         \"\
        },\
        \"ServerProperties\": {\
          \"shape\": \"__blob\",\
          \"locationName\": \"serverProperties\",\
          \"documentation\": \"\\n            <p>Contents of the <filename>server.properties</filename> file. When using the API, you must ensure that the contents of the file are base64 encoded. \\n               When using the AWS Management Console, the SDK, or the AWS CLI, the contents of <filename>server.properties</filename> can be in plaintext.</p>\\n         \"\
        }\
      },\
      \"required\": [\
        \"ServerProperties\",\
        \"Name\"\
      ]\
    },\
    \"CreateConfigurationResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) of the configuration.</p>\\n         \"\
        },\
        \"CreationTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"locationName\": \"creationTime\",\
          \"documentation\": \"\\n            <p>The time when the configuration was created.</p>\\n         \"\
        },\
        \"LatestRevision\": {\
          \"shape\": \"ConfigurationRevision\",\
          \"locationName\": \"latestRevision\",\
          \"documentation\": \"\\n            <p>Latest revision of the configuration.</p>\\n         \"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"\\n            <p>The name of the configuration.</p>\\n         \"\
        }\
      }\
    },\
    \"DeleteClusterRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"clusterArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>\\n         \"\
        },\
        \"CurrentVersion\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"currentVersion\",\
          \"documentation\": \"\\n            <p>The current version of the MSK cluster.</p>\\n         \"\
        }\
      },\
      \"required\": [\
        \"ClusterArn\"\
      ]\
    },\
    \"DeleteClusterResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"clusterArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) of the cluster.</p>\\n         \"\
        },\
        \"State\": {\
          \"shape\": \"ClusterState\",\
          \"locationName\": \"state\",\
          \"documentation\": \"\\n            <p>The state of the cluster. The possible states are CREATING, ACTIVE, and FAILED.</p>\\n         \"\
        }\
      }\
    },\
    \"DescribeClusterOperationRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterOperationArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"clusterOperationArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) that uniquely identifies the MSK cluster operation.</p>\\n         \"\
        }\
      },\
      \"required\": [\
        \"ClusterOperationArn\"\
      ]\
    },\
    \"DescribeClusterOperationResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterOperationInfo\": {\
          \"shape\": \"ClusterOperationInfo\",\
          \"locationName\": \"clusterOperationInfo\",\
          \"documentation\": \"\\n            <p>Cluster operation information</p>\\n         \"\
        }\
      }\
    },\
    \"DescribeClusterRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"clusterArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>\\n         \"\
        }\
      },\
      \"required\": [\
        \"ClusterArn\"\
      ]\
    },\
    \"DescribeClusterResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterInfo\": {\
          \"shape\": \"ClusterInfo\",\
          \"locationName\": \"clusterInfo\",\
          \"documentation\": \"\\n            <p>The cluster information.</p>\\n         \"\
        }\
      }\
    },\
    \"DescribeConfigurationRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) that uniquely identifies an MSK configuration and all of its revisions.</p>\\n         \"\
        }\
      },\
      \"required\": [\
        \"Arn\"\
      ]\
    },\
    \"DescribeConfigurationResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) of the configuration.</p>\\n         \"\
        },\
        \"CreationTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"locationName\": \"creationTime\",\
          \"documentation\": \"\\n            <p>The time when the configuration was created.</p>\\n         \"\
        },\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"description\",\
          \"documentation\": \"\\n            <p>The description of the configuration.</p>\\n         \"\
        },\
        \"KafkaVersions\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"kafkaVersions\",\
          \"documentation\": \"\\n            <p>The versions of Apache Kafka with which you can use this MSK configuration.</p>\\n         \"\
        },\
        \"LatestRevision\": {\
          \"shape\": \"ConfigurationRevision\",\
          \"locationName\": \"latestRevision\",\
          \"documentation\": \"\\n            <p>Latest revision of the configuration.</p>\\n         \"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"\\n            <p>The name of the configuration.</p>\\n         \"\
        }\
      }\
    },\
    \"DescribeConfigurationRevisionRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) that uniquely identifies an MSK configuration and all of its revisions.</p>\\n         \"\
        },\
        \"Revision\": {\
          \"shape\": \"__long\",\
          \"location\": \"uri\",\
          \"locationName\": \"revision\",\
          \"documentation\": \"\\n            <p>A string that uniquely identifies a revision of an MSK configuration.</p>\\n         \"\
        }\
      },\
      \"required\": [\
        \"Revision\",\
        \"Arn\"\
      ]\
    },\
    \"DescribeConfigurationRevisionResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) of the configuration.</p>\\n         \"\
        },\
        \"CreationTime\": {\
          \"shape\": \"__timestampIso8601\",\
          \"locationName\": \"creationTime\",\
          \"documentation\": \"\\n            <p>The time when the configuration was created.</p>\\n         \"\
        },\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"description\",\
          \"documentation\": \"\\n            <p>The description of the configuration.</p>\\n         \"\
        },\
        \"Revision\": {\
          \"shape\": \"__long\",\
          \"locationName\": \"revision\",\
          \"documentation\": \"\\n            <p>The revision number.</p>\\n         \"\
        },\
        \"ServerProperties\": {\
          \"shape\": \"__blob\",\
          \"locationName\": \"serverProperties\",\
          \"documentation\": \"\\n            <p>Contents of the <filename>server.properties</filename> file. When using the API, you must ensure that the contents of the file are base64 encoded. \\n               When using the AWS Management Console, the SDK, or the AWS CLI, the contents of <filename>server.properties</filename> can be in plaintext.</p>\\n         \"\
        }\
      }\
    },\
    \"EBSStorageInfo\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"VolumeSize\": {\
          \"shape\": \"__integerMin1Max16384\",\
          \"locationName\": \"volumeSize\",\
          \"documentation\": \"\\n            <p>The size in GiB of the EBS volume for the data drive on each broker node.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Contains information about the EBS storage volumes attached to Kafka broker nodes.</p>\\n         \"\
    },\
    \"EncryptionAtRest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DataVolumeKMSKeyId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"dataVolumeKMSKeyId\",\
          \"documentation\": \"\\n            <p>The ARN of the AWS KMS key for encrypting data at rest. If you don't specify a KMS key, MSK creates one for you and uses it.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>The data-volume encryption details.</p>\\n         \",\
      \"required\": [\
        \"DataVolumeKMSKeyId\"\
      ]\
    },\
    \"EncryptionInTransit\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClientBroker\": {\
          \"shape\": \"ClientBroker\",\
          \"locationName\": \"clientBroker\",\
          \"documentation\": \"\\n            <p>Indicates the encryption setting for data in transit between clients and brokers. The following are the possible values.</p>\\n            <p>\\n               TLS means that client-broker communication is enabled with TLS only.</p>\\n            <p>\\n               TLS_PLAINTEXT means that client-broker communication is enabled for both TLS-encrypted, as well as plaintext data.</p>\\n            <p>\\n               PLAINTEXT means that client-broker communication is enabled in plaintext only.</p>\\n            <p>The default value is TLS_PLAINTEXT.</p>\\n         \"\
        },\
        \"InCluster\": {\
          \"shape\": \"__boolean\",\
          \"locationName\": \"inCluster\",\
          \"documentation\": \"\\n            <p>When set to true, it indicates that data communication among the broker nodes of the cluster is encrypted. When set to false, the communication happens in plaintext.</p>\\n            <p>The default value is true.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>The settings for encrypting data in transit.</p>\\n         \"\
    },\
    \"EncryptionInfo\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EncryptionAtRest\": {\
          \"shape\": \"EncryptionAtRest\",\
          \"locationName\": \"encryptionAtRest\",\
          \"documentation\": \"\\n            <p>The data-volume encryption details.</p>\\n         \"\
        },\
        \"EncryptionInTransit\": {\
          \"shape\": \"EncryptionInTransit\",\
          \"locationName\": \"encryptionInTransit\",\
          \"documentation\": \"\\n            <p>The details for encryption in transit.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Includes encryption-related information, such as the AWS KMS key used for encrypting data at rest and whether you want MSK to encrypt your data in transit.</p>\\n         \"\
    },\
    \"EnhancedMonitoring\": {\
      \"type\": \"string\",\
      \"documentation\": \"\\n            <p>Specifies which metrics are gathered for the MSK cluster. This property has three possible values: DEFAULT, PER_BROKER, and PER_TOPIC_PER_BROKER. For a list of the metrics associated with each of these three levels of monitoring, see <a href=\\\"https://docs.aws.amazon.com/msk/latest/developerguide/monitoring.html\\\">Monitoring</a>.</p>\\n         \",\
      \"enum\": [\
        \"DEFAULT\",\
        \"PER_BROKER\",\
        \"PER_TOPIC_PER_BROKER\"\
      ]\
    },\
    \"Error\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InvalidParameter\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"invalidParameter\",\
          \"documentation\": \"\\n            <p>The parameter that caused the error.</p>\\n         \"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\",\
          \"documentation\": \"\\n            <p>The description of the error.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Returns information about an error.</p>\\n         \"\
    },\
    \"ErrorInfo\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ErrorCode\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"errorCode\",\
          \"documentation\": \"\\n            <p>A number describing the error programmatically.</p>\\n         \"\
        },\
        \"ErrorString\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"errorString\",\
          \"documentation\": \"\\n            <p>An optional field to provide more details about the error.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Returns information about an error state of the cluster.</p>\\n         \"\
    },\
    \"Firehose\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"DeliveryStream\" : {\
          \"shape\" : \"__string\",\
          \"locationName\" : \"deliveryStream\"\
        },\
        \"Enabled\" : {\
          \"shape\" : \"__boolean\",\
          \"locationName\" : \"enabled\"\
        }\
      },\
      \"required\" : [ \"Enabled\" ]\
    },\
    \"ForbiddenException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InvalidParameter\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"invalidParameter\",\
          \"documentation\": \"\\n            <p>The parameter that caused the error.</p>\\n         \"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\",\
          \"documentation\": \"\\n            <p>The description of the error.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Returns information about an error.</p>\\n         \",\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 403\
      }\
    },\
    \"GetBootstrapBrokersRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"clusterArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>\\n         \"\
        }\
      },\
      \"required\": [\
        \"ClusterArn\"\
      ]\
    },\
    \"GetBootstrapBrokersResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BootstrapBrokerString\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"bootstrapBrokerString\",\
          \"documentation\": \"\\n            <p>A string containing one or more hostname:port pairs.</p>\\n         \"\
        },\
        \"BootstrapBrokerStringTls\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"bootstrapBrokerStringTls\",\
          \"documentation\": \"\\n            <p>A string containing one or more DNS names (or IP) and TLS port pairs.</p>\\n         \"\
        }\
      }\
    },\
    \"GetCompatibleKafkaVersionsRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ClusterArn\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"querystring\",\
          \"locationName\" : \"clusterArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) of the cluster check.</p>\\n            \"\
        }\
      }\
    },\
    \"GetCompatibleKafkaVersionsResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"CompatibleKafkaVersions\" : {\
          \"shape\" : \"__listOfCompatibleKafkaVersion\",\
          \"locationName\" : \"compatibleKafkaVersions\",\
          \"documentation\": \"\\n            <p>A list of CompatibleKafkaVersion objects.</p>\\n            \"\
        }\
      }\
    },\
    \"InternalServerErrorException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InvalidParameter\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"invalidParameter\",\
          \"documentation\": \"\\n            <p>The parameter that caused the error.</p>\\n         \"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\",\
          \"documentation\": \"\\n            <p>The description of the error.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Returns information about an error.</p>\\n         \",\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 500\
      }\
    },\
    \"KafkaVersion\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Version\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"version\"\
        },\
        \"Status\": {\
          \"shape\": \"KafkaVersionStatus\",\
          \"locationName\": \"status\"\
        }\
      }\
    },\
    \"KafkaVersionStatus\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"ACTIVE\",\
        \"DEPRECATED\"\
      ]\
    },\
    \"ListClusterOperationsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"clusterArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>\\n         \"\
        },\
        \"MaxResults\": {\
          \"shape\": \"MaxResults\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maxResults\",\
          \"documentation\": \"\\n            <p>The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.</p>\\n         \"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"\\n            <p>The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response. \\n            To get the next batch, provide this token in your next request.</p>\\n         \"\
        }\
      },\
      \"required\": [\
        \"ClusterArn\"\
      ]\
    },\
    \"ListClusterOperationsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterOperationInfoList\": {\
          \"shape\": \"__listOfClusterOperationInfo\",\
          \"locationName\": \"clusterOperationInfoList\",\
          \"documentation\": \"\\n            <p>An array of cluster operation information objects.</p>\\n         \"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"\\n            <p>If the response of ListClusterOperations is truncated, it returns a NextToken in the response. This Nexttoken should be sent in the subsequent request to ListClusterOperations.</p>\\n         \"\
        }\
      }\
    },\
    \"ListClustersRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterNameFilter\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"clusterNameFilter\",\
          \"documentation\": \"\\n            <p>Specify a prefix of the name of the clusters that you want to list. The service lists all the clusters whose names start with this prefix.</p>\\n         \"\
        },\
        \"MaxResults\": {\
          \"shape\": \"MaxResults\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maxResults\",\
          \"documentation\": \"\\n            <p>The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.</p>\\n         \"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"\\n            <p>The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response. \\n            To get the next batch, provide this token in your next request.</p>\\n         \"\
        }\
      }\
    },\
    \"ListClustersResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterInfoList\": {\
          \"shape\": \"__listOfClusterInfo\",\
          \"locationName\": \"clusterInfoList\",\
          \"documentation\": \"\\n            <p>Information on each of the MSK clusters in the response.</p>\\n         \"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"\\n            <p>The paginated results marker. When the result of a ListClusters operation is truncated, the call returns NextToken in the response. \\n               To get another batch of clusters, provide this token in your next request.</p>\\n         \"\
        }\
      }\
    },\
    \"ListConfigurationRevisionsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) that uniquely identifies an MSK configuration and all of its revisions.</p>\\n         \"\
        },\
        \"MaxResults\": {\
          \"shape\": \"MaxResults\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maxResults\",\
          \"documentation\": \"\\n            <p>The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.</p>\\n         \"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"\\n            <p>The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response. \\n            To get the next batch, provide this token in your next request.</p>\\n         \"\
        }\
      },\
      \"required\": [\
        \"Arn\"\
      ]\
    },\
    \"ListConfigurationRevisionsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"\\n            <p>Paginated results marker.</p>\\n         \"\
        },\
        \"Revisions\": {\
          \"shape\": \"__listOfConfigurationRevision\",\
          \"locationName\": \"revisions\",\
          \"documentation\": \"\\n            <p>List of ConfigurationRevision objects.</p>\\n         \"\
        }\
      }\
    },\
    \"ListConfigurationsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MaxResults\": {\
          \"shape\": \"MaxResults\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maxResults\",\
          \"documentation\": \"\\n            <p>The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.</p>\\n         \"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"\\n            <p>The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response. \\n            To get the next batch, provide this token in your next request.</p>\\n         \"\
        }\
      }\
    },\
    \"ListConfigurationsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Configurations\": {\
          \"shape\": \"__listOfConfiguration\",\
          \"locationName\": \"configurations\",\
          \"documentation\": \"\\n            <p>An array of MSK configurations.</p>\\n         \"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"\\n            <p>The paginated results marker. When the result of a ListConfigurations operation is truncated, the call returns NextToken in the response. \\n               To get another batch of configurations, provide this token in your next request.</p>\\n         \"\
        }\
      }\
    },\
    \"ListKafkaVersionsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MaxResults\": {\
          \"shape\": \"MaxResults\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maxResults\",\
          \"documentation\": \"\\n            <p>The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"\\n            <p>The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response. To get the next batch, provide this token in your next request.</p>\"\
        }\
      }\
    },\
    \"ListKafkaVersionsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"KafkaVersions\": {\
          \"shape\": \"__listOfKafkaVersion\",\
          \"locationName\": \"kafkaVersions\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\"\
        }\
      }\
    },\
    \"ListNodesRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"clusterArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>\\n         \"\
        },\
        \"MaxResults\": {\
          \"shape\": \"MaxResults\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maxResults\",\
          \"documentation\": \"\\n            <p>The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.</p>\\n         \"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"\\n            <p>The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response. \\n            To get the next batch, provide this token in your next request.</p>\\n         \"\
        }\
      },\
      \"required\": [\
        \"ClusterArn\"\
      ]\
    },\
    \"ListNodesResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"\\n            <p>The paginated results marker. When the result of a ListNodes operation is truncated, the call returns NextToken in the response. \\n               To get another batch of nodes, provide this token in your next request.</p>\\n         \"\
        },\
        \"NodeInfoList\": {\
          \"shape\": \"__listOfNodeInfo\",\
          \"locationName\": \"nodeInfoList\",\
          \"documentation\": \"\\n            <p>List containing a NodeInfo object.</p>\\n         \"\
        }\
      }\
    },\
    \"ListTagsForResourceRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ResourceArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"resourceArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) that uniquely identifies the resource that's associated with the tags.</p>\\n         \"\
        }\
      },\
      \"required\": [\
        \"ResourceArn\"\
      ]\
    },\
    \"ListTagsForResourceResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Tags\": {\
          \"shape\": \"__mapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"\\n            <p>The key-value pair for the resource tag.</p>\\n         \"\
        }\
      }\
    },\
    \"MaxResults\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 100\
    },\
    \"LoggingInfo\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BrokerLogs\": {\
          \"shape\": \"BrokerLogs\",\
          \"locationName\": \"brokerLogs\"\
        }\
      },\
      \"required\": [ \"BrokerLogs\" ]\
    },\
    \"MutableClusterInfo\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BrokerEBSVolumeInfo\": {\
          \"shape\": \"__listOfBrokerEBSVolumeInfo\",\
          \"locationName\": \"brokerEBSVolumeInfo\",\
          \"documentation\": \"\\n            <p>Specifies the size of the EBS volume and the ID of the associated broker.</p>\\n         \"\
        },\
        \"ConfigurationInfo\": {\
          \"shape\": \"ConfigurationInfo\",\
          \"locationName\": \"configurationInfo\",\
          \"documentation\": \"\\n            <p>Information about the changes in the configuration of the brokers.</p>\\n         \"\
        },\
        \"NumberOfBrokerNodes\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"numberOfBrokerNodes\",\
          \"documentation\": \"\\n            <p>The number of broker nodes in the cluster.</p>\\n         \"\
        },\
        \"EnhancedMonitoring\" : {\
          \"shape\" : \"EnhancedMonitoring\",\
          \"locationName\" : \"enhancedMonitoring\",\
          \"documentation\" : \"\\n            <p>Specifies which Apache Kafka metrics Amazon MSK gathers and sends to Amazon CloudWatch for this cluster.</p>\\n         \"\
        },\
        \"OpenMonitoring\" : {\
          \"shape\" : \"OpenMonitoring\",\
          \"locationName\" : \"openMonitoring\",\
          \"documentation\" : \"\\n            <p>The settings for open monitoring.</p>\\n         \"\
        },\
        \"KafkaVersion\" : {\
          \"shape\" : \"__string\",\
          \"locationName\" : \"kafkaVersion\",\
          \"documentation\" : \"\\n            <p>The Kafka version.</p>\\n            \"\
        },\
        \"LoggingInfo\": {\
          \"shape\": \"LoggingInfo\",\
          \"locationName\": \"loggingInfo\"\
         }\
      },\
      \"documentation\": \"\\n            <p>Information about cluster attributes that can be updated via update APIs.</p>\\n         \"\
    },\
    \"NodeExporter\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"EnabledInBroker\" : {\
          \"shape\" : \"__boolean\",\
          \"locationName\" : \"enabledInBroker\",\
          \"documentation\" : \"\\n            <p>Indicates whether you want to enable or disable the Node Exporter.</p>\\n         \"\
        }\
      },\
      \"documentation\" : \"\\n            <p>Indicates whether you want to enable or disable the Node Exporter.</p>\\n         \",\
      \"required\" : [ \"EnabledInBroker\" ]\
    },\
    \"NodeExporterInfo\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"EnabledInBroker\" : {\
          \"shape\" : \"__boolean\",\
          \"locationName\" : \"enabledInBroker\",\
          \"documentation\" : \"\\n            <p>Indicates whether you want to enable or disable the Node Exporter.</p>\\n         \"\
        }\
      },\
      \"documentation\" : \"\\n            <p>Indicates whether you want to enable or disable the Node Exporter.</p>\\n         \",\
      \"required\" : [ \"EnabledInBroker\" ]\
    },\
    \"JmxExporter\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"EnabledInBroker\" : {\
          \"shape\" : \"__boolean\",\
          \"locationName\" : \"enabledInBroker\",\
          \"documentation\" : \"\\n            <p>Indicates whether you want to enable or disable the JMX Exporter.</p>\\n         \"\
        }\
      },\
      \"documentation\" : \"\\n            <p>Indicates whether you want to enable or disable the JMX Exporter.</p>\\n         \",\
      \"required\" : [ \"EnabledInBroker\" ]\
    },\
    \"JmxExporterInfo\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"EnabledInBroker\" : {\
          \"shape\" : \"__boolean\",\
          \"locationName\" : \"enabledInBroker\",\
          \"documentation\" : \"\\n            <p>Indicates whether you want to enable or disable the JMX Exporter.</p>\\n         \"\
        }\
      },\
      \"documentation\" : \"\\n            <p>Indicates whether you want to enable or disable the JMX Exporter.</p>\\n         \",\
      \"required\" : [ \"EnabledInBroker\" ]\
    },\
    \"OpenMonitoring\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Prometheus\" : {\
          \"shape\" : \"Prometheus\",\
          \"locationName\" : \"prometheus\",\
          \"documentation\" : \"\\n            <p>Prometheus settings.</p>\\n         \"\
        }\
      },\
      \"documentation\" : \"\\n            <p>JMX and Node monitoring for the MSK cluster.</p>\\n         \",\
      \"required\" : [ \"Prometheus\" ]\
    },\
    \"OpenMonitoringInfo\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Prometheus\" : {\
          \"shape\" : \"PrometheusInfo\",\
          \"locationName\" : \"prometheus\",\
          \"documentation\" : \"\\n            <p>Prometheus settings.</p>\\n         \"\
        }\
      },\
      \"documentation\" : \"\\n            <p>JMX and Node monitoring for the MSK cluster.</p>\\n         \",\
      \"required\" : [ \"Prometheus\" ]\
    },\
    \"Prometheus\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"JmxExporter\" : {\
          \"shape\" : \"JmxExporter\",\
          \"locationName\" : \"jmxExporter\",\
          \"documentation\" : \"\\n            <p>Indicates whether you want to enable or disable the JMX Exporter.</p>\\n         \"\
        },\
        \"NodeExporter\" : {\
          \"shape\" : \"NodeExporter\",\
          \"locationName\" : \"nodeExporter\",\
          \"documentation\" : \"\\n            <p>Indicates whether you want to enable or disable the Node Exporter.</p>\\n         \"\
        }\
      },\
      \"documentation\" : \"\\n            <p>Prometheus settings.</p>\\n         \"\
    },\
    \"PrometheusInfo\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"JmxExporter\" : {\
          \"shape\" : \"JmxExporterInfo\",\
          \"locationName\" : \"jmxExporter\",\
          \"documentation\" : \"\\n            <p>Indicates whether you want to enable or disable the JMX Exporter.</p>\\n         \"\
        },\
        \"NodeExporter\" : {\
          \"shape\" : \"NodeExporterInfo\",\
          \"locationName\" : \"nodeExporter\",\
          \"documentation\" : \"\\n            <p>Indicates whether you want to enable or disable the Node Exporter.</p>\\n         \"\
        }\
      },\
      \"documentation\" : \"\\n            <p>Prometheus settings.</p>\\n         \"\
    },\
    \"S3\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Bucket\" : {\
          \"shape\" : \"__string\",\
          \"locationName\" : \"bucket\"\
        },\
        \"Enabled\" : {\
          \"shape\" : \"__boolean\",\
          \"locationName\" : \"enabled\"\
        },\
        \"Prefix\" : {\
          \"shape\" : \"__string\",\
          \"locationName\" : \"prefix\"\
        }\
      },\
      \"required\" : [ \"Enabled\" ]\
    },\
    \"NodeInfo\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AddedToClusterTime\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"addedToClusterTime\",\
          \"documentation\": \"\\n            <p>The start time.</p>\\n         \"\
        },\
        \"BrokerNodeInfo\": {\
          \"shape\": \"BrokerNodeInfo\",\
          \"locationName\": \"brokerNodeInfo\",\
          \"documentation\": \"\\n            <p>The broker node info.</p>\\n         \"\
        },\
        \"InstanceType\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"instanceType\",\
          \"documentation\": \"\\n            <p>The instance type.</p>\\n         \"\
        },\
        \"NodeARN\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nodeARN\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) of the node.</p>\\n         \"\
        },\
        \"NodeType\": {\
          \"shape\": \"NodeType\",\
          \"locationName\": \"nodeType\",\
          \"documentation\": \"\\n            <p>The node type.</p>\\n         \"\
        },\
        \"ZookeeperNodeInfo\": {\
          \"shape\": \"ZookeeperNodeInfo\",\
          \"locationName\": \"zookeeperNodeInfo\",\
          \"documentation\": \"\\n            <p>The ZookeeperNodeInfo.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>The node information object.</p>\\n         \"\
    },\
    \"NodeType\": {\
      \"type\": \"string\",\
      \"documentation\": \"\\n            <p>The broker or Zookeeper node.</p>\\n         \",\
      \"enum\": [\
        \"BROKER\"\
      ]\
    },\
    \"NotFoundException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InvalidParameter\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"invalidParameter\",\
          \"documentation\": \"\\n            <p>The parameter that caused the error.</p>\\n         \"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\",\
          \"documentation\": \"\\n            <p>The description of the error.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Returns information about an error.</p>\\n         \",\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 404\
      }\
    },\
    \"ServiceUnavailableException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InvalidParameter\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"invalidParameter\",\
          \"documentation\": \"\\n            <p>The parameter that caused the error.</p>\\n         \"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\",\
          \"documentation\": \"\\n            <p>The description of the error.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Returns information about an error.</p>\\n         \",\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 503\
      }\
    },\
    \"StateInfo\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Code\" : {\
          \"shape\" : \"__string\",\
          \"locationName\" : \"code\"\
        },\
        \"Message\" : {\
          \"shape\" : \"__string\",\
          \"locationName\" : \"message\"\
        }\
      }\
    },\
    \"StorageInfo\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EbsStorageInfo\": {\
          \"shape\": \"EBSStorageInfo\",\
          \"locationName\": \"ebsStorageInfo\",\
          \"documentation\": \"\\n            <p>EBS volume information.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Contains information about storage volumes attached to MSK broker nodes.</p>\\n         \"\
    },\
    \"TagResourceRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ResourceArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"resourceArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) that uniquely identifies the resource that's associated with the tags.</p>\\n         \"\
        },\
        \"Tags\": {\
          \"shape\": \"__mapOf__string\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"\\n            <p>The key-value pair for the resource tag.</p>\\n         \"\
        }\
      },\
      \"required\": [\
        \"ResourceArn\",\
        \"Tags\"\
      ]\
    },\
    \"Tls\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CertificateAuthorityArnList\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"certificateAuthorityArnList\",\
          \"documentation\": \"\\n            <p>List of ACM Certificate Authority ARNs.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Details for client authentication using TLS.</p>\\n         \"\
    },\
    \"TooManyRequestsException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InvalidParameter\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"invalidParameter\",\
          \"documentation\": \"\\n            <p>The parameter that caused the error.</p>\\n         \"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\",\
          \"documentation\": \"\\n            <p>The description of the error.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Returns information about an error.</p>\\n         \",\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 429\
      }\
    },\
    \"UnauthorizedException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InvalidParameter\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"invalidParameter\",\
          \"documentation\": \"\\n            <p>The parameter that caused the error.</p>\\n         \"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\",\
          \"documentation\": \"\\n            <p>The description of the error.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Returns information about an error.</p>\\n         \",\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 401\
      }\
    },\
    \"UntagResourceRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ResourceArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"resourceArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) that uniquely identifies the resource that's associated with the tags.</p>\\n         \"\
        },\
        \"TagKeys\": {\
          \"shape\": \"__listOf__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"tagKeys\",\
          \"documentation\": \"\\n            <p>Tag keys must be unique for a given cluster. In addition, the following restrictions apply:</p>\\n            <ul>\\n               <li>\\n                  <p>Each tag key must be unique. If you add a tag with a key that's already in\\n                  use, your new tag overwrites the existing key-value pair. </p>\\n               </li>\\n               <li>\\n                  <p>You can't start a tag key with aws: because this prefix is reserved for use\\n                  by  AWS.  AWS creates tags that begin with this prefix on your behalf, but\\n                  you can't edit or delete them.</p>\\n               </li>\\n               <li>\\n                  <p>Tag keys must be between 1 and 128 Unicode characters in length.</p>\\n               </li>\\n               <li>\\n                  <p>Tag keys must consist of the following characters: Unicode letters, digits,\\n                  white space, and the following special characters: _ . / = + -\\n                     @.</p>\\n               </li>\\n            </ul>\\n         \"\
        }\
      },\
      \"required\": [\
        \"TagKeys\",\
        \"ResourceArn\"\
      ]\
    },\
    \"UpdateBrokerCountRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"clusterArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>\\n         \"\
        },\
        \"CurrentVersion\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"currentVersion\",\
          \"documentation\": \"\\n            <p>The version of cluster to update from. A successful operation will then generate a new version.</p>\\n         \"\
        },\
        \"TargetNumberOfBrokerNodes\": {\
          \"shape\": \"__integerMin1Max15\",\
          \"locationName\": \"targetNumberOfBrokerNodes\",\
          \"documentation\": \"\\n            <p>The number of broker nodes that you want the cluster to have after this operation completes successfully.</p>\\n         \"\
        }\
      },\
      \"required\": [\
        \"ClusterArn\",\
        \"CurrentVersion\",\
        \"TargetNumberOfBrokerNodes\"\
      ]\
    },\
    \"UpdateBrokerCountResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"clusterArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) of the cluster.</p>\\n         \"\
        },\
        \"ClusterOperationArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"clusterOperationArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) of the cluster operation.</p>\\n         \"\
        }\
      }\
    },\
    \"UpdateBrokerStorageRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"clusterArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>\\n         \"\
        },\
        \"CurrentVersion\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"currentVersion\",\
          \"documentation\": \"\\n            <p>The version of cluster to update from. A successful operation will then generate a new version.</p>\\n         \"\
        },\
        \"TargetBrokerEBSVolumeInfo\": {\
          \"shape\": \"__listOfBrokerEBSVolumeInfo\",\
          \"locationName\": \"targetBrokerEBSVolumeInfo\",\
          \"documentation\": \"\\n            <p>Describes the target volume size and the ID of the broker to apply the update to.</p>\\n         \"\
        }\
      },\
      \"required\": [\
        \"ClusterArn\",\
        \"TargetBrokerEBSVolumeInfo\",\
        \"CurrentVersion\"\
      ]\
    },\
    \"UpdateBrokerStorageResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"clusterArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) of the cluster.</p>\\n         \"\
        },\
        \"ClusterOperationArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"clusterOperationArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) of the cluster operation.</p>\\n         \"\
        }\
      }\
    },\
    \"UpdateClusterConfigurationRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"clusterArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>\\n         \"\
        },\
        \"ConfigurationInfo\": {\
          \"shape\": \"ConfigurationInfo\",\
          \"locationName\": \"configurationInfo\",\
          \"documentation\": \"\\n            <p>Represents the configuration that you want MSK to use for the brokers in a cluster.</p>\\n         \"\
        },\
        \"CurrentVersion\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"currentVersion\",\
          \"documentation\": \"\\n            <p>The version of the cluster that needs to be updated.</p>\\n         \"\
        }\
      },\
      \"required\": [\
        \"ClusterArn\",\
        \"CurrentVersion\",\
        \"ConfigurationInfo\"\
      ]\
    },\
    \"UpdateClusterConfigurationResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClusterArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"clusterArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) of the cluster.</p>\\n         \"\
        },\
        \"ClusterOperationArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"clusterOperationArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) of the cluster operation.</p>\\n         \"\
        }\
      }\
    },\
    \"UpdateClusterKafkaVersionRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ClusterArn\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"clusterArn\",\
          \"documentation\" : \"\\n            <p>The Amazon Resource Name (ARN) of the cluster to be updated.</p>\\n            \"\
        },\
        \"ConfigurationInfo\" : {\
          \"shape\" : \"ConfigurationInfo\",\
          \"locationName\" : \"configurationInfo\",\
          \"documentation\": \"\\n            <p>The custom configuration that should be applied on the new version of cluster.</p>\\n            \"\
        },\
        \"CurrentVersion\" : {\
          \"shape\" : \"__string\",\
          \"locationName\" : \"currentVersion\",\
          \"documentation\": \"\\n            <p>Current cluster version.</p>\\n            \"\
        },\
        \"TargetKafkaVersion\" : {\
          \"shape\" : \"__string\",\
          \"locationName\" : \"targetKafkaVersion\"\
          ,\"documentation\": \"\\n            <p>Target Kafka version.</p>\\n            \"\
        }\
      },\
      \"required\" : [ \"ClusterArn\", \"TargetKafkaVersion\", \"CurrentVersion\" ]\
    },\
    \"UpdateClusterKafkaVersionResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ClusterArn\" : {\
          \"shape\" : \"__string\",\
          \"locationName\" : \"clusterArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) of the cluster.</p>\\n            \"\
        },\
        \"ClusterOperationArn\" : {\
          \"shape\" : \"__string\",\
          \"locationName\" : \"clusterOperationArn\",\
          \"documentation\": \"\\n            <p>The Amazon Resource Name (ARN) of the cluster operation.</p>\\n            \"\
        }\
      }\
    },\
    \"UpdateMonitoringRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ClusterArn\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"clusterArn\",\
          \"documentation\" : \"\\n            <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>\\n         \"\
        },\
        \"CurrentVersion\" : {\
          \"shape\" : \"__string\",\
          \"locationName\" : \"currentVersion\",\
          \"documentation\" : \"\\n            <p>The version of the MSK cluster to update. Cluster versions aren't simple numbers. You can describe an MSK cluster to find its version. When this update operation is successful, it generates a new cluster version.</p>\\n         \"\
        },\
        \"EnhancedMonitoring\" : {\
          \"shape\" : \"EnhancedMonitoring\",\
          \"locationName\" : \"enhancedMonitoring\",\
          \"documentation\" : \"\\n            <p>Specifies which Apache Kafka metrics Amazon MSK gathers and sends to Amazon CloudWatch for this cluster.</p>\\n         \"\
        },\
        \"OpenMonitoring\" : {\
          \"shape\" : \"OpenMonitoringInfo\",\
          \"locationName\" : \"openMonitoring\",\
          \"documentation\" : \"\\n            <p>The settings for open monitoring.</p>\\n         \"\
        },\
        \"LoggingInfo\": {\
          \"shape\": \"LoggingInfo\",\
          \"locationName\": \"loggingInfo\"\
        }\
      },\
      \"documentation\" : \"Request body for UpdateMonitoring.\",\
      \"required\" : [ \"ClusterArn\", \"CurrentVersion\" ]\
    },\
    \"UpdateMonitoringResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ClusterArn\" : {\
          \"shape\" : \"__string\",\
          \"locationName\" : \"clusterArn\",\
          \"documentation\" : \"\\n            <p>The Amazon Resource Name (ARN) of the cluster.</p>\\n         \"\
        },\
        \"ClusterOperationArn\" : {\
          \"shape\" : \"__string\",\
          \"locationName\" : \"clusterOperationArn\",\
          \"documentation\" : \"\\n            <p>The Amazon Resource Name (ARN) of the cluster operation.</p>\\n         \"\
        }\
      }\
    },\
    \"ZookeeperNodeInfo\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AttachedENIId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"attachedENIId\",\
          \"documentation\": \"\\n            <p>The attached elastic network interface of the broker.</p>\\n         \"\
        },\
        \"ClientVpcIpAddress\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"clientVpcIpAddress\",\
          \"documentation\": \"\\n            <p>The virtual private cloud (VPC) IP address of the client.</p>\\n         \"\
        },\
        \"Endpoints\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"endpoints\",\
          \"documentation\": \"\\n            <p>Endpoints for accessing the ZooKeeper.</p>\\n         \"\
        },\
        \"ZookeeperId\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"zookeeperId\",\
          \"documentation\": \"\\n            <p>The role-specific ID for Zookeeper.</p>\\n         \"\
        },\
        \"ZookeeperVersion\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"zookeeperVersion\",\
          \"documentation\": \"\\n            <p>The version of Zookeeper.</p>\\n         \"\
        }\
      },\
      \"documentation\": \"\\n            <p>Zookeeper node information.</p>\\n         \"\
    },\
    \"__boolean\": {\
      \"type\": \"boolean\"\
    },\
    \"__blob\": {\
      \"type\": \"blob\"\
    },\
    \"__double\": {\
      \"type\": \"double\"\
    },\
    \"__integer\": {\
      \"type\": \"integer\"\
    },\
    \"__integerMin1Max15\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 15\
    },\
    \"__integerMin1Max16384\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 16384\
    },\
    \"__listOfBrokerEBSVolumeInfo\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"BrokerEBSVolumeInfo\"\
      }\
    },\
    \"__listOfClusterInfo\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"ClusterInfo\"\
      }\
    },\
    \"__listOfClusterOperationInfo\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"ClusterOperationInfo\"\
      }\
    },\
    \"__listOfClusterOperationStep\" : {\
      \"type\" : \"list\",\
      \"member\" : {\
        \"shape\" : \"ClusterOperationStep\"\
      }\
    },\
    \"__listOfCompatibleKafkaVersion\" : {\
      \"type\" : \"list\",\
      \"member\" : {\
        \"shape\" : \"CompatibleKafkaVersion\"\
      }\
    },\
    \"__listOfConfiguration\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"Configuration\"\
      }\
    },\
    \"__listOfConfigurationRevision\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"ConfigurationRevision\"\
      }\
    },\
    \"__listOfKafkaVersion\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"KafkaVersion\"\
      }\
    },\
    \"__listOfNodeInfo\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"NodeInfo\"\
      }\
    },\
    \"__listOf__string\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"__string\"\
      }\
    },\
    \"__long\": {\
      \"type\": \"long\"\
    },\
    \"__mapOf__string\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"__string\"\
      }\
    },\
    \"__string\": {\
      \"type\": \"string\"\
    },\
    \"__stringMin1Max128\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"max\": 128\
    },\
    \"__stringMin1Max64\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"max\": 64\
    },\
    \"__stringMin5Max32\": {\
      \"type\": \"string\",\
      \"min\": 5,\
      \"max\": 32\
    },\
    \"__timestampIso8601\": {\
      \"type\": \"timestamp\",\
      \"timestampFormat\": \"iso8601\"\
    }\
  },\
  \"documentation\": \"\\n               <p>The operations for managing an Amazon MSK cluster.</p>\\n            \"\
}\
";
}

@end
