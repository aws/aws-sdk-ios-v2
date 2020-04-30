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

#import "AWSschemasResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSschemasResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSschemasResources

+ (instancetype)sharedInstance {
    static AWSschemasResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSschemasResources new];
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
    \"apiVersion\": \"2019-12-02\",\
    \"endpointPrefix\": \"schemas\",\
    \"signingName\": \"schemas\",\
    \"serviceFullName\": \"Schemas\",\
    \"serviceId\": \"schemas\",\
    \"protocol\": \"rest-json\",\
    \"jsonVersion\": \"1.1\",\
    \"uid\": \"schemas-2019-12-02\",\
    \"signatureVersion\": \"v4\"\
  },\
  \"operations\": {\
    \"CreateDiscoverer\": {\
      \"name\": \"CreateDiscoverer\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/discoverers\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreateDiscovererRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateDiscovererResponse\",\
        \"documentation\": \"<p>201 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"<p>409 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a discoverer.</p>\"\
    },\
    \"CreateRegistry\": {\
      \"name\": \"CreateRegistry\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/registries/name/{registryName}\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreateRegistryRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateRegistryResponse\",\
        \"documentation\": \"<p>201 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"<p>409 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a registry.</p>\"\
    },\
    \"CreateSchema\": {\
      \"name\": \"CreateSchema\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/registries/name/{registryName}/schemas/name/{schemaName}\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreateSchemaRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateSchemaResponse\",\
        \"documentation\": \"<p>201 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a schema definition.</p> <note><p>Inactive schemas will be deleted after two years.</p></note>\"\
    },\
    \"DeleteDiscoverer\": {\
      \"name\": \"DeleteDiscoverer\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/discoverers/id/{discovererId}\",\
        \"responseCode\": 204\
      },\
      \"input\": {\
        \"shape\": \"DeleteDiscovererRequest\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes a discoverer.</p>\"\
    },\
    \"DeleteRegistry\": {\
      \"name\": \"DeleteRegistry\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/registries/name/{registryName}\",\
        \"responseCode\": 204\
      },\
      \"input\": {\
        \"shape\": \"DeleteRegistryRequest\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes a Registry.</p>\"\
    },\
    \"DeleteResourcePolicy\": {\
      \"name\": \"DeleteResourcePolicy\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/policy\",\
        \"responseCode\": 204\
      },\
      \"input\": {\
        \"shape\": \"DeleteResourcePolicyRequest\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Delete the resource-based policy attached to the specified registry.</p>\"\
    },\
    \"DeleteSchema\": {\
      \"name\": \"DeleteSchema\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/registries/name/{registryName}/schemas/name/{schemaName}\",\
        \"responseCode\": 204\
      },\
      \"input\": {\
        \"shape\": \"DeleteSchemaRequest\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Delete a schema definition.</p>\"\
    },\
    \"DeleteSchemaVersion\": {\
      \"name\": \"DeleteSchemaVersion\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v1/registries/name/{registryName}/schemas/name/{schemaName}/version/{schemaVersion}\",\
        \"responseCode\": 204\
      },\
      \"input\": {\
        \"shape\": \"DeleteSchemaVersionRequest\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Delete the schema version definition</p>\"\
    },\
    \"DescribeCodeBinding\": {\
      \"name\": \"DescribeCodeBinding\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/registries/name/{registryName}/schemas/name/{schemaName}/language/{language}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeCodeBindingRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeCodeBindingResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>429 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Describe the code binding URI.</p>\"\
    },\
    \"DescribeDiscoverer\": {\
      \"name\": \"DescribeDiscoverer\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/discoverers/id/{discovererId}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeDiscovererRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeDiscovererResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Describes the discoverer.</p>\"\
    },\
    \"DescribeRegistry\": {\
      \"name\": \"DescribeRegistry\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/registries/name/{registryName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeRegistryRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeRegistryResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Describes the registry.</p>\"\
    },\
    \"DescribeSchema\": {\
      \"name\": \"DescribeSchema\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/registries/name/{registryName}/schemas/name/{schemaName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeSchemaRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeSchemaResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieve the schema definition.</p>\"\
    },\
    \"GetCodeBindingSource\": {\
      \"name\": \"GetCodeBindingSource\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/registries/name/{registryName}/schemas/name/{schemaName}/language/{language}/source\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetCodeBindingSourceRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetCodeBindingSourceResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>429 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Get the code binding source URI.</p>\"\
    },\
    \"GetDiscoveredSchema\": {\
      \"name\": \"GetDiscoveredSchema\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/discover\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetDiscoveredSchemaRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetDiscoveredSchemaResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Get the discovered schema that was generated based on sampled events.</p>\"\
    },\
    \"GetResourcePolicy\": {\
      \"name\": \"GetResourcePolicy\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/policy\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"GetResourcePolicyRequest\"\
      },\
      \"output\": {\
        \"shape\": \"GetResourcePolicyResponse\",\
        \"documentation\": \"<p>Get Resource-Based Policy Response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Retrieves the resource-based policy attached to a given registry.</p>\"\
    },\
    \"ListDiscoverers\": {\
      \"name\": \"ListDiscoverers\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/discoverers\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListDiscoverersRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListDiscoverersResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>List the discoverers.</p>\"\
    },\
    \"ListRegistries\": {\
      \"name\": \"ListRegistries\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/registries\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListRegistriesRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListRegistriesResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>List the registries.</p>\"\
    },\
    \"ListSchemaVersions\": {\
      \"name\": \"ListSchemaVersions\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/registries/name/{registryName}/schemas/name/{schemaName}/versions\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListSchemaVersionsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListSchemaVersionsResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Provides a list of the schema versions and related information.</p>\"\
    },\
    \"ListSchemas\": {\
      \"name\": \"ListSchemas\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/registries/name/{registryName}/schemas\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListSchemasRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListSchemasResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>List the schemas.</p>\"\
    },\
    \"ListTagsForResource\": {\
      \"name\": \"ListTagsForResource\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/tags/{resource-arn}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListTagsForResourceRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListTagsForResourceResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Get tags for resource.</p>\"\
    },\
    \"PutCodeBinding\": {\
      \"name\": \"PutCodeBinding\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/registries/name/{registryName}/schemas/name/{schemaName}/language/{language}\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"PutCodeBindingRequest\"\
      },\
      \"output\": {\
        \"shape\": \"PutCodeBindingResponse\",\
        \"documentation\": \"<p>202 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"GoneException\",\
          \"documentation\": \"<p>410 response</p>\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"<p>429 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Put code binding URI</p>\"\
    },\
    \"PutResourcePolicy\": {\
      \"name\": \"PutResourcePolicy\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/policy\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"PutResourcePolicyRequest\"\
      },\
      \"output\": {\
        \"shape\": \"PutResourcePolicyResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"PreconditionFailedException\",\
          \"documentation\": \"<p>412 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>The name of the policy.</p>\"\
    },\
    \"SearchSchemas\": {\
      \"name\": \"SearchSchemas\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v1/registries/name/{registryName}/schemas/search\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"SearchSchemasRequest\"\
      },\
      \"output\": {\
        \"shape\": \"SearchSchemasResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Search the schemas</p>\"\
    },\
    \"StartDiscoverer\": {\
      \"name\": \"StartDiscoverer\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/discoverers/id/{discovererId}/start\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"StartDiscovererRequest\"\
      },\
      \"output\": {\
        \"shape\": \"StartDiscovererResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Starts the discoverer</p>\"\
    },\
    \"StopDiscoverer\": {\
      \"name\": \"StopDiscoverer\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/v1/discoverers/id/{discovererId}/stop\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"StopDiscovererRequest\"\
      },\
      \"output\": {\
        \"shape\": \"StopDiscovererResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Stops the discoverer</p>\"\
    },\
    \"TagResource\": {\
      \"name\": \"TagResource\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/tags/{resource-arn}\",\
        \"responseCode\": 204\
      },\
      \"input\": {\
        \"shape\": \"TagResourceRequest\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Add tags to a resource.</p>\"\
    },\
    \"UntagResource\": {\
      \"name\": \"UntagResource\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/tags/{resource-arn}\",\
        \"responseCode\": 204\
      },\
      \"input\": {\
        \"shape\": \"UntagResourceRequest\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Removes tags from a resource.</p>\"\
    },\
    \"UpdateDiscoverer\": {\
      \"name\": \"UpdateDiscoverer\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/discoverers/id/{discovererId}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateDiscovererRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateDiscovererResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Updates the discoverer</p>\"\
    },\
    \"UpdateRegistry\": {\
      \"name\": \"UpdateRegistry\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/registries/name/{registryName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateRegistryRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateRegistryResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"UnauthorizedException\",\
          \"documentation\": \"<p>401 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Updates a registry.</p>\"\
    },\
    \"UpdateSchema\": {\
      \"name\": \"UpdateSchema\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v1/registries/name/{registryName}/schemas/name/{schemaName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateSchemaRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateSchemaResponse\",\
        \"documentation\": \"<p>200 response</p>\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"<p>400 response</p>\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"<p>500 response</p>\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"<p>403 response</p>\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"<p>404 response</p>\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\",\
          \"documentation\": \"<p>503 response</p>\"\
        }\
      ],\
      \"documentation\": \"<p>Updates the schema definition</p> <note><p>Inactive schemas will be deleted after two years.</p></note>\"\
    }\
  },\
  \"shapes\": {\
    \"BadRequestException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Code\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The error code.</p>\"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message string of the error output.</p>\"\
        }\
      },\
      \"required\": [\
        \"Message\",\
        \"Code\"\
      ],\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 400\
      }\
    },\
    \"CodeBindingOutput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreationDate\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The time and date that the code binding was created.</p>\"\
        },\
        \"LastModified\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The date and time that code bindings were modified.</p>\"\
        },\
        \"SchemaVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The version number of the schema.</p>\"\
        },\
        \"Status\": {\
          \"shape\": \"CodeGenerationStatus\",\
          \"documentation\": \"<p>The current status of code binding generation.</p>\"\
        }\
      }\
    },\
    \"CodeGenerationStatus\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"CREATE_IN_PROGRESS\",\
        \"CREATE_COMPLETE\",\
        \"CREATE_FAILED\"\
      ]\
    },\
    \"ConflictException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Code\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The error code.</p>\"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message string of the error output.</p>\"\
        }\
      },\
      \"required\": [\
        \"Message\",\
        \"Code\"\
      ],\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 409\
      }\
    },\
    \"CreateDiscovererInput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__stringMin0Max256\",\
          \"documentation\": \"<p>A description for the discoverer.</p>\"\
        },\
        \"SourceArn\": {\
          \"shape\": \"__stringMin20Max1600\",\
          \"documentation\": \"<p>The ARN of the event bus.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the resource.</p>\"\
        }\
      },\
      \"required\": [\
        \"SourceArn\"\
      ]\
    },\
    \"CreateDiscovererRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__stringMin0Max256\",\
          \"documentation\": \"<p>A description for the discoverer.</p>\"\
        },\
        \"SourceArn\": {\
          \"shape\": \"__stringMin20Max1600\",\
          \"documentation\": \"<p>The ARN of the event bus.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the resource.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"required\": [\
        \"SourceArn\"\
      ]\
    },\
    \"CreateDiscovererResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The description of the discoverer.</p>\"\
        },\
        \"DiscovererArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the discoverer.</p>\"\
        },\
        \"DiscovererId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ID of the discoverer.</p>\"\
        },\
        \"SourceArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the event bus.</p>\"\
        },\
        \"State\": {\
          \"shape\": \"DiscovererState\",\
          \"documentation\": \"<p>The state of the discoverer.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the resource.</p>\"\
        }\
      }\
    },\
    \"CreateRegistryInput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__stringMin0Max256\",\
          \"documentation\": \"<p>A description of the registry to be created.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags to associate with the registry.</p>\"\
        }\
      }\
    },\
    \"CreateRegistryRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__stringMin0Max256\",\
          \"documentation\": \"<p>A description of the registry to be created.</p>\"\
        },\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags to associate with the registry.</p>\"\
        }\
      },\
      \"required\": [\
        \"RegistryName\"\
      ]\
    },\
    \"CreateRegistryResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The description of the registry.</p>\"\
        },\
        \"RegistryArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the registry.</p>\"\
        },\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the registry.</p>\"\
        }\
      }\
    },\
    \"CreateSchemaInput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Content\": {\
          \"shape\": \"__stringMin1Max100000\",\
          \"documentation\": \"<p>The source of the schema definition.</p>\"\
        },\
        \"Description\": {\
          \"shape\": \"__stringMin0Max256\",\
          \"documentation\": \"<p>A description of the schema.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the schema.</p>\"\
        },\
        \"Type\": {\
          \"shape\": \"Type\",\
          \"documentation\": \"<p>The type of schema.</p>\"\
        }\
      },\
      \"required\": [\
        \"Type\",\
        \"Content\"\
      ]\
    },\
    \"CreateSchemaRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Content\": {\
          \"shape\": \"__stringMin1Max100000\",\
          \"documentation\": \"<p>The source of the schema definition.</p>\"\
        },\
        \"Description\": {\
          \"shape\": \"__stringMin0Max256\",\
          \"documentation\": \"<p>A description of the schema.</p>\"\
        },\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"SchemaName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"schemaName\",\
          \"documentation\": \"<p>The name of the schema.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the schema.</p>\"\
        },\
        \"Type\": {\
          \"shape\": \"Type\",\
          \"documentation\": \"<p>The type of schema.</p>\"\
        }\
      },\
      \"required\": [\
        \"RegistryName\",\
        \"SchemaName\",\
        \"Type\",\
        \"Content\"\
      ]\
    },\
    \"CreateSchemaResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The description of the schema.</p>\"\
        },\
        \"LastModified\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The date and time that schema was modified.</p>\"\
        },\
        \"SchemaArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the schema.</p>\"\
        },\
        \"SchemaName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the schema.</p>\"\
        },\
        \"SchemaVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The version number of the schema</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\"\
        },\
        \"Type\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of the schema.</p>\"\
        },\
        \"VersionCreatedDate\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The date the schema version was created.</p>\"\
        }\
      }\
    },\
    \"DeleteDiscovererRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DiscovererId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"discovererId\",\
          \"documentation\": \"<p>The ID of the discoverer.</p>\"\
        }\
      },\
      \"required\": [\
        \"DiscovererId\"\
      ]\
    },\
    \"DeleteRegistryRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        }\
      },\
      \"required\": [\
        \"RegistryName\"\
      ]\
    },\
    \"DeleteResourcePolicyRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        }\
      }\
    },\
    \"DeleteSchemaRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"SchemaName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"schemaName\",\
          \"documentation\": \"<p>The name of the schema.</p>\"\
        }\
      },\
      \"required\": [\
        \"RegistryName\",\
        \"SchemaName\"\
      ]\
    },\
    \"DeleteSchemaVersionRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"SchemaName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"schemaName\",\
          \"documentation\": \"<p>The name of the schema.</p>\"\
        },\
        \"SchemaVersion\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"schemaVersion\",\
          \"documentation\": \"The version number of the schema\"\
        }\
      },\
      \"required\": [\
        \"SchemaVersion\",\
        \"RegistryName\",\
        \"SchemaName\"\
      ]\
    },\
    \"DescribeCodeBindingRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Language\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"language\",\
          \"documentation\": \"<p>The language of the code binding.</p>\"\
        },\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"SchemaName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"schemaName\",\
          \"documentation\": \"<p>The name of the schema.</p>\"\
        },\
        \"SchemaVersion\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"schemaVersion\",\
          \"documentation\": \"<p>Specifying this limits the results to only this schema version.</p>\"\
        }\
      },\
      \"required\": [\
        \"RegistryName\",\
        \"SchemaName\",\
        \"Language\"\
      ]\
    },\
    \"DescribeCodeBindingResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreationDate\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The time and date that the code binding was created.</p>\"\
        },\
        \"LastModified\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The date and time that code bindings were modified.</p>\"\
        },\
        \"SchemaVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The version number of the schema.</p>\"\
        },\
        \"Status\": {\
          \"shape\": \"CodeGenerationStatus\",\
          \"documentation\": \"<p>The current status of code binding generation.</p>\"\
        }\
      }\
    },\
    \"DescribeDiscovererRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DiscovererId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"discovererId\",\
          \"documentation\": \"<p>The ID of the discoverer.</p>\"\
        }\
      },\
      \"required\": [\
        \"DiscovererId\"\
      ]\
    },\
    \"DescribeDiscovererResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The description of the discoverer.</p>\"\
        },\
        \"DiscovererArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the discoverer.</p>\"\
        },\
        \"DiscovererId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ID of the discoverer.</p>\"\
        },\
        \"SourceArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the event bus.</p>\"\
        },\
        \"State\": {\
          \"shape\": \"DiscovererState\",\
          \"documentation\": \"<p>The state of the discoverer.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the resource.</p>\"\
        }\
      }\
    },\
    \"DescribeRegistryRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        }\
      },\
      \"required\": [\
        \"RegistryName\"\
      ]\
    },\
    \"DescribeRegistryResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The description of the registry.</p>\"\
        },\
        \"RegistryArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the registry.</p>\"\
        },\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the registry.</p>\"\
        }\
      }\
    },\
    \"DescribeSchemaOutput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Content\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The source of the schema definition.</p>\"\
        },\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The description of the schema.</p>\"\
        },\
        \"LastModified\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The date and time that schema was modified.</p>\"\
        },\
        \"SchemaArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the schema.</p>\"\
        },\
        \"SchemaName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the schema.</p>\"\
        },\
        \"SchemaVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The version number of the schema</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the resource.</p>\"\
        },\
        \"Type\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of the schema.</p>\"\
        },\
        \"VersionCreatedDate\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The date the schema version was created.</p>\"\
        }\
      }\
    },\
    \"DescribeSchemaRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"SchemaName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"schemaName\",\
          \"documentation\": \"<p>The name of the schema.</p>\"\
        },\
        \"SchemaVersion\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"schemaVersion\",\
          \"documentation\": \"<p>Specifying this limits the results to only this schema version.</p>\"\
        }\
      },\
      \"required\": [\
        \"RegistryName\",\
        \"SchemaName\"\
      ]\
    },\
    \"DescribeSchemaResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Content\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The source of the schema definition.</p>\"\
        },\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The description of the schema.</p>\"\
        },\
        \"LastModified\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The date and time that schema was modified.</p>\"\
        },\
        \"SchemaArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the schema.</p>\"\
        },\
        \"SchemaName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the schema.</p>\"\
        },\
        \"SchemaVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The version number of the schema</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the resource.</p>\"\
        },\
        \"Type\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of the schema.</p>\"\
        },\
        \"VersionCreatedDate\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The date the schema version was created.</p>\"\
        }\
      }\
    },\
    \"DiscovererOutput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The description of the discoverer.</p>\"\
        },\
        \"DiscovererArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the discoverer.</p>\"\
        },\
        \"DiscovererId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ID of the discoverer.</p>\"\
        },\
        \"SourceArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the event bus.</p>\"\
        },\
        \"State\": {\
          \"shape\": \"DiscovererState\",\
          \"documentation\": \"<p>The state of the discoverer.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the resource.</p>\"\
        }\
      }\
    },\
    \"DiscovererState\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"STARTED\",\
        \"STOPPED\"\
      ]\
    },\
    \"DiscovererStateOutput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DiscovererId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ID of the discoverer.</p>\"\
        },\
        \"State\": {\
          \"shape\": \"DiscovererState\",\
          \"documentation\": \"<p>The state of the discoverer.</p>\"\
        }\
      }\
    },\
    \"DiscovererSummary\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DiscovererArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the discoverer.</p>\"\
        },\
        \"DiscovererId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ID of the discoverer.</p>\"\
        },\
        \"SourceArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the event bus.</p>\"\
        },\
        \"State\": {\
          \"shape\": \"DiscovererState\",\
          \"documentation\": \"<p>The state of the discoverer.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the resource.</p>\"\
        }\
      }\
    },\
    \"ErrorOutput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Code\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The error code.</p>\"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message string of the error output.</p>\"\
        }\
      },\
      \"required\": [\
        \"Message\",\
        \"Code\"\
      ]\
    },\
    \"ForbiddenException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Code\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The error code.</p>\"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message string of the error output.</p>\"\
        }\
      },\
      \"required\": [\
        \"Message\",\
        \"Code\"\
      ],\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 403\
      }\
    },\
    \"GetCodeBindingSourceOutput\": {\
      \"type\": \"string\"\
    },\
    \"GetCodeBindingSourceRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Language\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"language\",\
          \"documentation\": \"<p>The language of the code binding.</p>\"\
        },\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"SchemaName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"schemaName\",\
          \"documentation\": \"<p>The name of the schema.</p>\"\
        },\
        \"SchemaVersion\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"schemaVersion\",\
          \"documentation\": \"<p>Specifying this limits the results to only this schema version.</p>\"\
        }\
      },\
      \"required\": [\
        \"RegistryName\",\
        \"SchemaName\",\
        \"Language\"\
      ]\
    },\
    \"GetCodeBindingSourceResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Body\": {\
          \"shape\": \"Body\"\
        }\
      },\
      \"payload\": \"Body\"\
    },\
    \"GetDiscoveredSchemaInput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Events\": {\
          \"shape\": \"__listOfGetDiscoveredSchemaVersionItemInput\",\
          \"documentation\": \"<p>An array of strings where each string is a JSON event. These are the events that were used to generate the schema. The array includes a single type of event and has a maximum size of 10 events.</p>\"\
        },\
        \"Type\": {\
          \"shape\": \"Type\",\
          \"documentation\": \"<p>The type of event.</p>\"\
        }\
      },\
      \"required\": [\
        \"Type\",\
        \"Events\"\
      ]\
    },\
    \"GetDiscoveredSchemaOutput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Content\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The source of the schema definition.</p>\"\
        }\
      },\
      \"documentation\": \"<p></p>\"\
    },\
    \"GetDiscoveredSchemaRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Events\": {\
          \"shape\": \"__listOfGetDiscoveredSchemaVersionItemInput\",\
          \"documentation\": \"<p>An array of strings where each string is a JSON event. These are the events that were used to generate the schema. The array includes a single type of event and has a maximum size of 10 events.</p>\"\
        },\
        \"Type\": {\
          \"shape\": \"Type\",\
          \"documentation\": \"<p>The type of event.</p>\"\
        }\
      },\
      \"required\": [\
        \"Type\",\
        \"Events\"\
      ]\
    },\
    \"GetDiscoveredSchemaResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Content\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The source of the schema definition.</p>\"\
        }\
      }\
    },\
    \"GetDiscoveredSchemaVersionItemInput\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"max\": 100000\
    },\
    \"GetResourcePolicyOutput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Policy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The resource-based policy.</p>\",\
          \"jsonvalue\": true\
        },\
        \"RevisionId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The revision ID.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Information about the policy.</p>\"\
    },\
    \"GetResourcePolicyRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        }\
      }\
    },\
    \"GetResourcePolicyResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Policy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The resource-based policy.</p>\",\
          \"jsonvalue\": true\
        },\
        \"RevisionId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The revision ID.</p>\"\
        }\
      }\
    },\
    \"GoneException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Code\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The error code.</p>\"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message string of the error output.</p>\"\
        }\
      },\
      \"required\": [\
        \"Message\",\
        \"Code\"\
      ],\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 410\
      }\
    },\
    \"InternalServerErrorException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Code\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The error code.</p>\"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message string of the error output.</p>\"\
        }\
      },\
      \"required\": [\
        \"Message\",\
        \"Code\"\
      ],\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 500\
      }\
    },\
    \"Limit\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 100\
    },\
    \"ListDiscoverersOutput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Discoverers\": {\
          \"shape\": \"__listOfDiscovererSummary\",\
          \"documentation\": \"<p>An array of DiscovererSummary information.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>\"\
        }\
      }\
    },\
    \"ListDiscoverersRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DiscovererIdPrefix\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"discovererIdPrefix\",\
          \"documentation\": \"<p>Specifying this limits the results to only those discoverer IDs that start with the specified prefix.</p>\"\
        },\
        \"Limit\": {\
          \"shape\": \"__integer\",\
          \"location\": \"querystring\",\
          \"locationName\": \"limit\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"<p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>\"\
        },\
        \"SourceArnPrefix\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"sourceArnPrefix\",\
          \"documentation\": \"<p>Specifying this limits the results to only those ARNs that start with the specified prefix.</p>\"\
        }\
      }\
    },\
    \"ListDiscoverersResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Discoverers\": {\
          \"shape\": \"__listOfDiscovererSummary\",\
          \"documentation\": \"<p>An array of DiscovererSummary information.</p>\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>\"\
        }\
      }\
    },\
    \"ListRegistriesOutput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>\"\
        },\
        \"Registries\": {\
          \"shape\": \"__listOfRegistrySummary\",\
          \"documentation\": \"<p>An array of registry summaries.</p>\"\
        }\
      },\
      \"documentation\": \"<p>List the registries.</p>\"\
    },\
    \"ListRegistriesRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Limit\": {\
          \"shape\": \"__integer\",\
          \"location\": \"querystring\",\
          \"locationName\": \"limit\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"<p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>\"\
        },\
        \"RegistryNamePrefix\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"registryNamePrefix\",\
          \"documentation\": \"<p>Specifying this limits the results to only those registry names that start with the specified prefix.</p>\"\
        },\
        \"Scope\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"scope\",\
          \"documentation\": \"<p>Can be set to Local or AWS to limit responses to your custom registries, or the ones provided by AWS.</p>\"\
        }\
      }\
    },\
    \"ListRegistriesResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>\"\
        },\
        \"Registries\": {\
          \"shape\": \"__listOfRegistrySummary\",\
          \"documentation\": \"<p>An array of registry summaries.</p>\"\
        }\
      }\
    },\
    \"ListSchemaVersionsOutput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>\"\
        },\
        \"SchemaVersions\": {\
          \"shape\": \"__listOfSchemaVersionSummary\",\
          \"documentation\": \"<p>An array of schema version summaries.</p>\"\
        }\
      }\
    },\
    \"ListSchemaVersionsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Limit\": {\
          \"shape\": \"__integer\",\
          \"location\": \"querystring\",\
          \"locationName\": \"limit\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"<p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>\"\
        },\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"SchemaName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"schemaName\",\
          \"documentation\": \"<p>The name of the schema.</p>\"\
        }\
      },\
      \"required\": [\
        \"RegistryName\",\
        \"SchemaName\"\
      ]\
    },\
    \"ListSchemaVersionsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>\"\
        },\
        \"SchemaVersions\": {\
          \"shape\": \"__listOfSchemaVersionSummary\",\
          \"documentation\": \"<p>An array of schema version summaries.</p>\"\
        }\
      }\
    },\
    \"ListSchemasOutput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>\"\
        },\
        \"Schemas\": {\
          \"shape\": \"__listOfSchemaSummary\",\
          \"documentation\": \"<p>An array of schema summaries.</p>\"\
        }\
      }\
    },\
    \"ListSchemasRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Limit\": {\
          \"shape\": \"__integer\",\
          \"location\": \"querystring\",\
          \"locationName\": \"limit\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"<p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>\"\
        },\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"SchemaNamePrefix\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"schemaNamePrefix\",\
          \"documentation\": \"<p>Specifying this limits the results to only those schema names that start with the specified prefix.</p>\"\
        }\
      },\
      \"required\": [\
        \"RegistryName\"\
      ]\
    },\
    \"ListSchemasResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>\"\
        },\
        \"Schemas\": {\
          \"shape\": \"__listOfSchemaSummary\",\
          \"documentation\": \"<p>An array of schema summaries.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceOutput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\"\
        }\
      }\
    },\
    \"ListTagsForResourceRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ResourceArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"resource-arn\",\
          \"documentation\": \"<p>The ARN of the resource.</p>\"\
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
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\"\
        }\
      }\
    },\
    \"LockServiceLinkedRoleInput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RoleArn\": {\
          \"shape\": \"__stringMin1Max1600\"\
        },\
        \"Timeout\": {\
          \"shape\": \"__integerMin1Max29000\"\
        }\
      },\
      \"required\": [\
        \"Timeout\",\
        \"RoleArn\"\
      ]\
    },\
    \"LockServiceLinkedRoleOutput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CanBeDeleted\": {\
          \"shape\": \"__boolean\"\
        },\
        \"ReasonOfFailure\": {\
          \"shape\": \"__stringMin1Max1600\"\
        },\
        \"RelatedResources\": {\
          \"shape\": \"__listOfDiscovererSummary\"\
        }\
      }\
    },\
    \"LockServiceLinkedRoleRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RoleArn\": {\
          \"shape\": \"__stringMin1Max1600\"\
        },\
        \"Timeout\": {\
          \"shape\": \"__integerMin1Max29000\"\
        }\
      },\
      \"documentation\": \"\",\
      \"required\": [\
        \"Timeout\",\
        \"RoleArn\"\
      ]\
    },\
    \"LockServiceLinkedRoleResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CanBeDeleted\": {\
          \"shape\": \"__boolean\"\
        },\
        \"ReasonOfFailure\": {\
          \"shape\": \"__stringMin1Max1600\"\
        },\
        \"RelatedResources\": {\
          \"shape\": \"__listOfDiscovererSummary\"\
        }\
      }\
    },\
    \"NotFoundException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Code\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The error code.</p>\"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message string of the error output.</p>\"\
        }\
      },\
      \"required\": [\
        \"Message\",\
        \"Code\"\
      ],\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 404\
      }\
    },\
    \"PreconditionFailedException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Code\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The error code.</p>\"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message string of the error output.</p>\"\
        }\
      },\
      \"required\": [\
        \"Message\",\
        \"Code\"\
      ],\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 412\
      }\
    },\
    \"PutCodeBindingRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Language\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"language\",\
          \"documentation\": \"<p>The language of the code binding.</p>\"\
        },\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"SchemaName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"schemaName\",\
          \"documentation\": \"<p>The name of the schema.</p>\"\
        },\
        \"SchemaVersion\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"schemaVersion\",\
          \"documentation\": \"<p>Specifying this limits the results to only this schema version.</p>\"\
        }\
      },\
      \"required\": [\
        \"RegistryName\",\
        \"SchemaName\",\
        \"Language\"\
      ]\
    },\
    \"PutCodeBindingResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreationDate\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The time and date that the code binding was created.</p>\"\
        },\
        \"LastModified\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The date and time that code bindings were modified.</p>\"\
        },\
        \"SchemaVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The version number of the schema.</p>\"\
        },\
        \"Status\": {\
          \"shape\": \"CodeGenerationStatus\",\
          \"documentation\": \"<p>The current status of code binding generation.</p>\"\
        }\
      }\
    },\
    \"PutResourcePolicyInput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Policy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The resource-based policy.</p>\",\
          \"jsonvalue\": true\
        },\
        \"RevisionId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The revision ID of the policy.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Only update the policy if the revision ID matches the ID that's specified. Use this option to avoid modifying a policy that has changed since you last read it.</p>\",\
      \"required\": [\
        \"Policy\"\
      ]\
    },\
    \"PutResourcePolicyOutput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Policy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The resource-based policy.</p>\",\
          \"jsonvalue\": true\
        },\
        \"RevisionId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The revision ID of the policy.</p>\"\
        }\
      },\
      \"documentation\": \"<p>The resource-based policy.</p>\"\
    },\
    \"PutResourcePolicyRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Policy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The resource-based policy.</p>\",\
          \"jsonvalue\": true\
        },\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"RevisionId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The revision ID of the policy.</p>\"\
        }\
      },\
      \"documentation\": \"<p>The name of the policy.</p>\",\
      \"required\": [\
        \"Policy\"\
      ]\
    },\
    \"PutResourcePolicyResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Policy\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The resource-based policy.</p>\",\
          \"jsonvalue\": true\
        },\
        \"RevisionId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The revision ID of the policy.</p>\"\
        }\
      }\
    },\
    \"RegistryOutput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The description of the registry.</p>\"\
        },\
        \"RegistryArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the registry.</p>\"\
        },\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the registry.</p>\"\
        }\
      }\
    },\
    \"RegistrySummary\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RegistryArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the registry.</p>\"\
        },\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the registry.</p>\"\
        }\
      }\
    },\
    \"SchemaOutput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The description of the schema.</p>\"\
        },\
        \"LastModified\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The date and time that schema was modified.</p>\"\
        },\
        \"SchemaArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the schema.</p>\"\
        },\
        \"SchemaName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the schema.</p>\"\
        },\
        \"SchemaVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The version number of the schema</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\"\
        },\
        \"Type\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of the schema.</p>\"\
        },\
        \"VersionCreatedDate\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The date the schema version was created.</p>\"\
        }\
      }\
    },\
    \"SchemaSummary\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"LastModified\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The date and time that schema was modified.</p>\"\
        },\
        \"SchemaArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the schema.</p>\"\
        },\
        \"SchemaName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the schema.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the schema.</p>\"\
        },\
        \"VersionCount\": {\
          \"shape\": \"__long\",\
          \"documentation\": \"<p>The number of versions available for the schema.</p>\"\
        }\
      },\
      \"documentation\": \"<p>A summary of schema details.</p>\"\
    },\
    \"SchemaVersionSummary\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SchemaArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the schema version.</p>\"\
        },\
        \"SchemaName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the schema.</p>\"\
        },\
        \"SchemaVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The version number of the schema.</p>\"\
        }\
      }\
    },\
    \"SearchSchemaSummary\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"SchemaArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the schema.</p>\"\
        },\
        \"SchemaName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the schema.</p>\"\
        },\
        \"SchemaVersions\": {\
          \"shape\": \"__listOfSearchSchemaVersionSummary\",\
          \"documentation\": \"<p>An array of schema version summaries.</p>\"\
        }\
      }\
    },\
    \"SearchSchemaVersionSummary\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CreatedDate\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The date the schema version was created.</p>\"\
        },\
        \"SchemaVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The version number of the schema</p>\"\
        }\
      }\
    },\
    \"SearchSchemasOutput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>\"\
        },\
        \"Schemas\": {\
          \"shape\": \"__listOfSearchSchemaSummary\",\
          \"documentation\": \"<p>An array of SearchSchemaSummary information.</p>\"\
        }\
      }\
    },\
    \"SearchSchemasRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Keywords\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"keywords\",\
          \"documentation\": \"<p>Specifying this limits the results to only schemas that include the provided keywords.</p>\"\
        },\
        \"Limit\": {\
          \"shape\": \"__integer\",\
          \"location\": \"querystring\",\
          \"locationName\": \"limit\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"<p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>\"\
        },\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        }\
      },\
      \"required\": [\
        \"RegistryName\",\
        \"Keywords\"\
      ]\
    },\
    \"SearchSchemasResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The token that specifies the next page of results to return. To request the first page, leave NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.</p>\"\
        },\
        \"Schemas\": {\
          \"shape\": \"__listOfSearchSchemaSummary\",\
          \"documentation\": \"<p>An array of SearchSchemaSummary information.</p>\"\
        }\
      }\
    },\
    \"ServiceUnavailableException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Code\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The error code.</p>\"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message string of the error output.</p>\"\
        }\
      },\
      \"required\": [\
        \"Message\",\
        \"Code\"\
      ],\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 503\
      }\
    },\
    \"StartDiscovererRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DiscovererId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"discovererId\",\
          \"documentation\": \"<p>The ID of the discoverer.</p>\"\
        }\
      },\
      \"required\": [\
        \"DiscovererId\"\
      ]\
    },\
    \"StartDiscovererResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DiscovererId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ID of the discoverer.</p>\"\
        },\
        \"State\": {\
          \"shape\": \"DiscovererState\",\
          \"documentation\": \"<p>The state of the discoverer.</p>\"\
        }\
      }\
    },\
    \"StopDiscovererRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DiscovererId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"discovererId\",\
          \"documentation\": \"<p>The ID of the discoverer.</p>\"\
        }\
      },\
      \"required\": [\
        \"DiscovererId\"\
      ]\
    },\
    \"StopDiscovererResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DiscovererId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ID of the discoverer.</p>\"\
        },\
        \"State\": {\
          \"shape\": \"DiscovererState\",\
          \"documentation\": \"<p>The state of the discoverer.</p>\"\
        }\
      }\
    },\
    \"TagResourceInput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the resource.</p>\"\
        }\
      },\
      \"required\": [\
        \"Tags\"\
      ]\
    },\
    \"TagResourceRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ResourceArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"resource-arn\",\
          \"documentation\": \"<p>The ARN of the resource.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the resource.</p>\"\
        }\
      },\
      \"documentation\": \"<p></p>\",\
      \"required\": [\
        \"ResourceArn\",\
        \"Tags\"\
      ]\
    },\
    \"Tags\": {\
      \"type\": \"map\",\
      \"documentation\": \"<p>Key-value pairs associated with a resource.</p>\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"__string\"\
      }\
    },\
    \"TooManyRequestsException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Code\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The error code.</p>\"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message string of the error output.</p>\"\
        }\
      },\
      \"required\": [\
        \"Message\",\
        \"Code\"\
      ],\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 429\
      }\
    },\
    \"Type\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"OpenApi3\"\
      ]\
    },\
    \"UnauthorizedException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Code\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The error code.</p>\"\
        },\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The message string of the error output.</p>\"\
        }\
      },\
      \"required\": [\
        \"Message\",\
        \"Code\"\
      ],\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 401\
      }\
    },\
    \"UnlockServiceLinkedRoleInput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RoleArn\": {\
          \"shape\": \"__stringMin1Max1600\"\
        }\
      },\
      \"required\": [\
        \"RoleArn\"\
      ]\
    },\
    \"UnlockServiceLinkedRoleRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RoleArn\": {\
          \"shape\": \"__stringMin1Max1600\"\
        }\
      },\
      \"required\": [\
        \"RoleArn\"\
      ]\
    },\
    \"UnlockServiceLinkedRoleResponse\": {\
      \"type\": \"structure\",\
      \"members\": {}\
    },\
    \"UntagResourceRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ResourceArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"resource-arn\",\
          \"documentation\": \"<p>The ARN of the resource.</p>\"\
        },\
        \"TagKeys\": {\
          \"shape\": \"__listOf__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"tagKeys\",\
          \"documentation\": \"<p>Keys of key-value pairs.</p>\"\
        }\
      },\
      \"required\": [\
        \"TagKeys\",\
        \"ResourceArn\"\
      ]\
    },\
    \"UpdateDiscovererInput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__stringMin0Max256\",\
          \"documentation\": \"<p>The description of the discoverer to update.</p>\"\
        }\
      }\
    },\
    \"UpdateDiscovererRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__stringMin0Max256\",\
          \"documentation\": \"<p>The description of the discoverer to update.</p>\"\
        },\
        \"DiscovererId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"discovererId\",\
          \"documentation\": \"<p>The ID of the discoverer.</p>\"\
        }\
      },\
      \"required\": [\
        \"DiscovererId\"\
      ]\
    },\
    \"UpdateDiscovererResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The description of the discoverer.</p>\"\
        },\
        \"DiscovererArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the discoverer.</p>\"\
        },\
        \"DiscovererId\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ID of the discoverer.</p>\"\
        },\
        \"SourceArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the event bus.</p>\"\
        },\
        \"State\": {\
          \"shape\": \"DiscovererState\",\
          \"documentation\": \"<p>The state of the discoverer.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the resource.</p>\"\
        }\
      }\
    },\
    \"UpdateRegistryInput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__stringMin0Max256\",\
          \"documentation\": \"<p>The description of the registry to update.</p>\"\
        }\
      }\
    },\
    \"UpdateRegistryRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__stringMin0Max256\",\
          \"documentation\": \"<p>The description of the registry to update.</p>\"\
        },\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        }\
      },\
      \"documentation\": \"<p>Updates the registry.</p>\",\
      \"required\": [\
        \"RegistryName\"\
      ]\
    },\
    \"UpdateRegistryResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The description of the registry.</p>\"\
        },\
        \"RegistryArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the registry.</p>\"\
        },\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"<p>Tags associated with the registry.</p>\"\
        }\
      }\
    },\
    \"UpdateSchemaInput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClientTokenId\": {\
          \"shape\": \"__stringMin0Max36\",\
          \"documentation\": \"<p>The ID of the client token.</p>\",\
          \"idempotencyToken\": true\
        },\
        \"Content\": {\
          \"shape\": \"__stringMin1Max100000\",\
          \"documentation\": \"<p>The source of the schema definition.</p>\"\
        },\
        \"Description\": {\
          \"shape\": \"__stringMin0Max256\",\
          \"documentation\": \"<p>The description of the schema.</p>\"\
        },\
        \"Type\": {\
          \"shape\": \"Type\",\
          \"documentation\": \"<p>The schema type for the events schema.</p>\"\
        }\
      }\
    },\
    \"UpdateSchemaRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ClientTokenId\": {\
          \"shape\": \"__stringMin0Max36\",\
          \"documentation\": \"<p>The ID of the client token.</p>\",\
          \"idempotencyToken\": true\
        },\
        \"Content\": {\
          \"shape\": \"__stringMin1Max100000\",\
          \"documentation\": \"<p>The source of the schema definition.</p>\"\
        },\
        \"Description\": {\
          \"shape\": \"__stringMin0Max256\",\
          \"documentation\": \"<p>The description of the schema.</p>\"\
        },\
        \"RegistryName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"registryName\",\
          \"documentation\": \"<p>The name of the registry.</p>\"\
        },\
        \"SchemaName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"schemaName\",\
          \"documentation\": \"<p>The name of the schema.</p>\"\
        },\
        \"Type\": {\
          \"shape\": \"Type\",\
          \"documentation\": \"<p>The schema type for the events schema.</p>\"\
        }\
      },\
      \"required\": [\
        \"RegistryName\",\
        \"SchemaName\"\
      ]\
    },\
    \"UpdateSchemaResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Description\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The description of the schema.</p>\"\
        },\
        \"LastModified\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The date and time that schema was modified.</p>\"\
        },\
        \"SchemaArn\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The ARN of the schema.</p>\"\
        },\
        \"SchemaName\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The name of the schema.</p>\"\
        },\
        \"SchemaVersion\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The version number of the schema</p>\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\"\
        },\
        \"Type\": {\
          \"shape\": \"__string\",\
          \"documentation\": \"<p>The type of the schema.</p>\"\
        },\
        \"VersionCreatedDate\": {\
          \"shape\": \"__timestampIso8601\",\
          \"documentation\": \"<p>The date the schema version was created.</p>\"\
        }\
      }\
    },\
    \"__boolean\": {\
      \"type\": \"boolean\"\
    },\
    \"__double\": {\
      \"type\": \"double\"\
    },\
    \"__integer\": {\
      \"type\": \"integer\"\
    },\
    \"__integerMin1Max29000\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 29000\
    },\
    \"__listOfDiscovererSummary\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"DiscovererSummary\"\
      }\
    },\
    \"__listOfGetDiscoveredSchemaVersionItemInput\": {\
      \"type\": \"list\",\
      \"min\": 1,\
      \"max\": 10,\
      \"member\": {\
        \"shape\": \"GetDiscoveredSchemaVersionItemInput\"\
      }\
    },\
    \"__listOfRegistrySummary\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"RegistrySummary\"\
      }\
    },\
    \"__listOfSchemaSummary\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"SchemaSummary\"\
      }\
    },\
    \"__listOfSchemaVersionSummary\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"SchemaVersionSummary\"\
      }\
    },\
    \"__listOfSearchSchemaSummary\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"SearchSchemaSummary\"\
      }\
    },\
    \"__listOfSearchSchemaVersionSummary\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"SearchSchemaVersionSummary\"\
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
    \"__string\": {\
      \"type\": \"string\"\
    },\
    \"__stringMin0Max256\": {\
      \"type\": \"string\",\
      \"min\": 0,\
      \"max\": 256\
    },\
    \"__stringMin0Max36\": {\
      \"type\": \"string\",\
      \"min\": 0,\
      \"max\": 36\
    },\
    \"__stringMin1Max100000\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"max\": 100000\
    },\
    \"__stringMin1Max1600\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"max\": 1600\
    },\
    \"__stringMin20Max1600\": {\
      \"type\": \"string\",\
      \"min\": 20,\
      \"max\": 1600\
    },\
    \"__timestampIso8601\": {\
      \"type\": \"timestamp\",\
      \"timestampFormat\": \"iso8601\"\
    },\
    \"__timestampUnix\": {\
      \"type\": \"timestamp\",\
      \"timestampFormat\": \"unixTimestamp\"\
    },\
    \"Body\": {\
      \"type\": \"blob\"\
    }\
  },\
  \"documentation\": \"<p>Amazon EventBridge Schema Registry</p>\"\
}\
";
}

@end
