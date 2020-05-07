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

#import "AWSAppConfigResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSAppConfigResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSAppConfigResources

+ (instancetype)sharedInstance {
    static AWSAppConfigResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSAppConfigResources new];
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
    \"apiVersion\":\"2019-10-09\",\
    \"endpointPrefix\":\"appconfig\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"rest-json\",\
    \"serviceAbbreviation\":\"AppConfig\",\
    \"serviceFullName\":\"Amazon AppConfig\",\
    \"serviceId\":\"AppConfig\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"appconfig\",\
    \"uid\":\"appconfig-2019-10-09\"\
  },\
  \"operations\":{\
    \"CreateApplication\":{\
      \"name\":\"CreateApplication\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/applications\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateApplicationRequest\"},\
      \"output\":{\"shape\":\"Application\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>An application in AppConfig is a logical unit of code that provides capabilities for your customers. For example, an application can be a microservice that runs on Amazon EC2 instances, a mobile application installed by your users, a serverless application using Amazon API Gateway and AWS Lambda, or any system you run on behalf of others.</p>\"\
    },\
    \"CreateConfigurationProfile\":{\
      \"name\":\"CreateConfigurationProfile\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/applications/{ApplicationId}/configurationprofiles\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateConfigurationProfileRequest\"},\
      \"output\":{\"shape\":\"ConfigurationProfile\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Information that enables AppConfig to access the configuration source. Valid configuration sources include Systems Manager (SSM) documents, SSM Parameter Store parameters, and Amazon S3 objects. A configuration profile includes the following information.</p> <ul> <li> <p>The Uri location of the configuration data.</p> </li> <li> <p>The AWS Identity and Access Management (IAM) role that provides access to the configuration data.</p> </li> <li> <p>A validator for the configuration data. Available validators include either a JSON Schema or an AWS Lambda function.</p> </li> </ul> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/systems-manager/latest/userguide/appconfig-creating-configuration-and-profile.html\\\">Create a Configuration and a Configuration Profile</a> in the <i>AWS AppConfig User Guide</i>.</p>\"\
    },\
    \"CreateDeploymentStrategy\":{\
      \"name\":\"CreateDeploymentStrategy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/deploymentstrategies\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateDeploymentStrategyRequest\"},\
      \"output\":{\"shape\":\"DeploymentStrategy\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>A deployment strategy defines important criteria for rolling out your configuration to the designated targets. A deployment strategy includes: the overall duration required, a percentage of targets to receive the deployment during each interval, an algorithm that defines how percentage grows, and bake time.</p>\"\
    },\
    \"CreateEnvironment\":{\
      \"name\":\"CreateEnvironment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/applications/{ApplicationId}/environments\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateEnvironmentRequest\"},\
      \"output\":{\"shape\":\"Environment\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>For each application, you define one or more environments. An environment is a logical deployment group of AppConfig targets, such as applications in a <code>Beta</code> or <code>Production</code> environment. You can also define environments for application subcomponents such as the <code>Web</code>, <code>Mobile</code> and <code>Back-end</code> components for your application. You can configure Amazon CloudWatch alarms for each environment. The system monitors alarms during a configuration deployment. If an alarm is triggered, the system rolls back the configuration.</p>\"\
    },\
    \"DeleteApplication\":{\
      \"name\":\"DeleteApplication\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/applications/{ApplicationId}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteApplicationRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Delete an application. Deleting an application does not delete a configuration from a host.</p>\"\
    },\
    \"DeleteConfigurationProfile\":{\
      \"name\":\"DeleteConfigurationProfile\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteConfigurationProfileRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Delete a configuration profile. Deleting a configuration profile does not delete a configuration from a host.</p>\"\
    },\
    \"DeleteDeploymentStrategy\":{\
      \"name\":\"DeleteDeploymentStrategy\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/deployementstrategies/{DeploymentStrategyId}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteDeploymentStrategyRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Delete a deployment strategy. Deleting a deployment strategy does not delete a configuration from a host.</p>\"\
    },\
    \"DeleteEnvironment\":{\
      \"name\":\"DeleteEnvironment\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/applications/{ApplicationId}/environments/{EnvironmentId}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteEnvironmentRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Delete an environment. Deleting an environment does not delete a configuration from a host.</p>\"\
    },\
    \"GetApplication\":{\
      \"name\":\"GetApplication\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/applications/{ApplicationId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetApplicationRequest\"},\
      \"output\":{\"shape\":\"Application\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Retrieve information about an application.</p>\"\
    },\
    \"GetConfiguration\":{\
      \"name\":\"GetConfiguration\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/applications/{Application}/environments/{Environment}/configurations/{Configuration}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetConfigurationRequest\"},\
      \"output\":{\"shape\":\"Configuration\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Receive information about a configuration.</p> <important> <p>AWS AppConfig uses the value of the <code>ClientConfigurationVersion</code> parameter to identify the configuration version on your clients. If you donât send <code>ClientConfigurationVersion</code> with each call to <code>GetConfiguration</code>, your clients receive the current configuration. You are charged each time your clients receive a configuration.</p> <p>To avoid excess charges, we recommend that you include the <code>ClientConfigurationVersion</code> value with every call to <code>GetConfiguration</code>. This value must be saved on your client. Subsequent calls to <code>GetConfiguration</code> must pass this value by using the <code>ClientConfigurationVersion</code> parameter. </p> </important>\"\
    },\
    \"GetConfigurationProfile\":{\
      \"name\":\"GetConfigurationProfile\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetConfigurationProfileRequest\"},\
      \"output\":{\"shape\":\"ConfigurationProfile\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Retrieve information about a configuration profile.</p>\"\
    },\
    \"GetDeployment\":{\
      \"name\":\"GetDeployment\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/applications/{ApplicationId}/environments/{EnvironmentId}/deployments/{DeploymentNumber}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetDeploymentRequest\"},\
      \"output\":{\"shape\":\"Deployment\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Retrieve information about a configuration deployment.</p>\"\
    },\
    \"GetDeploymentStrategy\":{\
      \"name\":\"GetDeploymentStrategy\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/deploymentstrategies/{DeploymentStrategyId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetDeploymentStrategyRequest\"},\
      \"output\":{\"shape\":\"DeploymentStrategy\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Retrieve information about a deployment strategy. A deployment strategy defines important criteria for rolling out your configuration to the designated targets. A deployment strategy includes: the overall duration required, a percentage of targets to receive the deployment during each interval, an algorithm that defines how percentage grows, and bake time.</p>\"\
    },\
    \"GetEnvironment\":{\
      \"name\":\"GetEnvironment\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/applications/{ApplicationId}/environments/{EnvironmentId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetEnvironmentRequest\"},\
      \"output\":{\"shape\":\"Environment\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Retrieve information about an environment. An environment is a logical deployment group of AppConfig applications, such as applications in a <code>Production</code> environment or in an <code>EU_Region</code> environment. Each configuration deployment targets an environment. You can enable one or more Amazon CloudWatch alarms for an environment. If an alarm is triggered during a deployment, AppConfig roles back the configuration.</p>\"\
    },\
    \"ListApplications\":{\
      \"name\":\"ListApplications\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/applications\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListApplicationsRequest\"},\
      \"output\":{\"shape\":\"Applications\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>List all applications in your AWS account.</p>\"\
    },\
    \"ListConfigurationProfiles\":{\
      \"name\":\"ListConfigurationProfiles\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/applications/{ApplicationId}/configurationprofiles\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListConfigurationProfilesRequest\"},\
      \"output\":{\"shape\":\"ConfigurationProfiles\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Lists the configuration profiles for an application.</p>\"\
    },\
    \"ListDeploymentStrategies\":{\
      \"name\":\"ListDeploymentStrategies\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/deploymentstrategies\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListDeploymentStrategiesRequest\"},\
      \"output\":{\"shape\":\"DeploymentStrategies\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>List deployment strategies.</p>\"\
    },\
    \"ListDeployments\":{\
      \"name\":\"ListDeployments\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/applications/{ApplicationId}/environments/{EnvironmentId}/deployments\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListDeploymentsRequest\"},\
      \"output\":{\"shape\":\"Deployments\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Lists the deployments for an environment.</p>\"\
    },\
    \"ListEnvironments\":{\
      \"name\":\"ListEnvironments\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/applications/{ApplicationId}/environments\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListEnvironmentsRequest\"},\
      \"output\":{\"shape\":\"Environments\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>List the environments for an application.</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/tags/{ResourceArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ResourceTags\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the list of key-value tags assigned to the resource.</p>\"\
    },\
    \"StartDeployment\":{\
      \"name\":\"StartDeployment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/applications/{ApplicationId}/environments/{EnvironmentId}/deployments\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"StartDeploymentRequest\"},\
      \"output\":{\"shape\":\"Deployment\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts a deployment.</p>\"\
    },\
    \"StopDeployment\":{\
      \"name\":\"StopDeployment\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/applications/{ApplicationId}/environments/{EnvironmentId}/deployments/{DeploymentNumber}\",\
        \"responseCode\":202\
      },\
      \"input\":{\"shape\":\"StopDeploymentRequest\"},\
      \"output\":{\"shape\":\"Deployment\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Stops a deployment. This API action works only on deployments that have a status of <code>DEPLOYING</code>. This action moves the deployment to a status of <code>ROLLED_BACK</code>.</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tags/{ResourceArn}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Metadata to assign to an AppConfig resource. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define. You can specify a maximum of 50 tags for a resource.</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/tags/{ResourceArn}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Deletes a tag key and value from an AppConfig resource.</p>\"\
    },\
    \"UpdateApplication\":{\
      \"name\":\"UpdateApplication\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/applications/{ApplicationId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateApplicationRequest\"},\
      \"output\":{\"shape\":\"Application\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Updates an application.</p>\"\
    },\
    \"UpdateConfigurationProfile\":{\
      \"name\":\"UpdateConfigurationProfile\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateConfigurationProfileRequest\"},\
      \"output\":{\"shape\":\"ConfigurationProfile\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Updates a configuration profile.</p>\"\
    },\
    \"UpdateDeploymentStrategy\":{\
      \"name\":\"UpdateDeploymentStrategy\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/deploymentstrategies/{DeploymentStrategyId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateDeploymentStrategyRequest\"},\
      \"output\":{\"shape\":\"DeploymentStrategy\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Updates a deployment strategy.</p>\"\
    },\
    \"UpdateEnvironment\":{\
      \"name\":\"UpdateEnvironment\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/applications/{ApplicationId}/environments/{EnvironmentId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateEnvironmentRequest\"},\
      \"output\":{\"shape\":\"Environment\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Updates an environment.</p>\"\
    },\
    \"ValidateConfiguration\":{\
      \"name\":\"ValidateConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/validators\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"ValidateConfigurationRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Uses the validators in a configuration profile to validate a configuration.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"Application\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The application ID.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The application name.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the application.</p>\"\
        }\
      }\
    },\
    \"ApplicationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Application\"}\
    },\
    \"Applications\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Items\":{\
          \"shape\":\"ApplicationList\",\
          \"documentation\":\"<p>The elements from this collection.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. Use this token to get the next set of results.</p>\"\
        }\
      }\
    },\
    \"Arn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20,\
      \"pattern\":\"arn:(aws[a-zA-Z-]*)?:[a-z]+:([a-z]{2}((-gov)|(-iso(b?)))?-[a-z]+-\\\\d{1})?:(\\\\d{12})?:[a-zA-Z0-9-_/:.]+\"\
    },\
    \"BadRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The input fails to satisfy the constraints specified by an AWS service.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"Blob\":{\"type\":\"blob\"},\
    \"Configuration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Content\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>The content of the configuration or the configuration data.</p>\"\
        },\
        \"ConfigurationVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The configuration version.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Configuration-Version\"\
        },\
        \"ContentType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A standard MIME type describing the format of the configuration content. For more information, see <a href=\\\"http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17\\\">Content-Type</a>.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        }\
      },\
      \"payload\":\"Content\"\
    },\
    \"ConfigurationProfile\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The application ID.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The configuration profile ID.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the configuration profile.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The configuration profile description.</p>\"\
        },\
        \"LocationUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The URI location of the configuration.</p>\"\
        },\
        \"RetrievalRoleArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of an IAM role with permission to access the configuration at the specified LocationUri.</p>\"\
        },\
        \"Validators\":{\
          \"shape\":\"ValidatorList\",\
          \"documentation\":\"<p>A list of methods for validating the configuration.</p>\"\
        }\
      }\
    },\
    \"ConfigurationProfileSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The application ID.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the configuration profile.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the configuration profile.</p>\"\
        },\
        \"LocationUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The URI location of the configuration.</p>\"\
        },\
        \"ValidatorTypes\":{\
          \"shape\":\"ValidatorTypeList\",\
          \"documentation\":\"<p>The types of validators in the configuration profile.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A summary of a configuration profile.</p>\"\
    },\
    \"ConfigurationProfileSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ConfigurationProfileSummary\"}\
    },\
    \"ConfigurationProfiles\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Items\":{\
          \"shape\":\"ConfigurationProfileSummaryList\",\
          \"documentation\":\"<p>The elements from this collection.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. Use this token to get the next set of results.</p>\"\
        }\
      }\
    },\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The request could not be processed because of conflict in the current state of the resource.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"CreateApplicationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>A name for the application.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the application.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Metadata to assign to the application. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define.</p>\"\
        }\
      }\
    },\
    \"CreateConfigurationProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ApplicationId\",\
        \"Name\",\
        \"LocationUri\",\
        \"RetrievalRoleArn\"\
      ],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The application ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>A name for the configuration profile.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the configuration profile.</p>\"\
        },\
        \"LocationUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>A URI to locate the configuration. You can specify a Systems Manager (SSM) document, an SSM Parameter Store parameter, or an Amazon S3 object. For an SSM document, specify either the document name in the format <code>ssm-document://&lt;Document_name&gt;</code> or the Amazon Resource Name (ARN). For a parameter, specify either the parameter name in the format <code>ssm-parameter://&lt;Parameter_name&gt;</code> or the ARN. For an Amazon S3 object, specify the URI in the following format: <code>s3://&lt;bucket&gt;/&lt;objectKey&gt; </code>. Here is an example: s3://my-bucket/my-app/us-east-1/my-config.json</p>\"\
        },\
        \"RetrievalRoleArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of an IAM role with permission to access the configuration at the specified LocationUri.</p>\"\
        },\
        \"Validators\":{\
          \"shape\":\"ValidatorList\",\
          \"documentation\":\"<p>A list of methods for validating the configuration.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Metadata to assign to the configuration profile. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define.</p>\"\
        }\
      }\
    },\
    \"CreateDeploymentStrategyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"DeploymentDurationInMinutes\",\
        \"GrowthFactor\",\
        \"ReplicateTo\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>A name for the deployment strategy.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the deployment strategy.</p>\"\
        },\
        \"DeploymentDurationInMinutes\":{\
          \"shape\":\"MinutesBetween0And24Hours\",\
          \"documentation\":\"<p>Total amount of time for a deployment to last.</p>\",\
          \"box\":true\
        },\
        \"FinalBakeTimeInMinutes\":{\
          \"shape\":\"MinutesBetween0And24Hours\",\
          \"documentation\":\"<p>The amount of time AppConfig monitors for alarms before considering the deployment to be complete and no longer eligible for automatic roll back.</p>\"\
        },\
        \"GrowthFactor\":{\
          \"shape\":\"GrowthFactor\",\
          \"documentation\":\"<p>The percentage of targets to receive a deployed configuration during each interval.</p>\",\
          \"box\":true\
        },\
        \"GrowthType\":{\
          \"shape\":\"GrowthType\",\
          \"documentation\":\"<p>The algorithm used to define how percentage grows over time. AWS AppConfig supports the following growth types:</p> <p> <b>Linear</b>: For this type, AppConfig processes the deployment by dividing the total number of targets by the value specified for <code>Step percentage</code>. For example, a linear deployment that uses a <code>Step percentage</code> of 10 deploys the configuration to 10 percent of the hosts. After those deployments are complete, the system deploys the configuration to the next 10 percent. This continues until 100% of the targets have successfully received the configuration.</p> <p> <b>Exponential</b>: For this type, AppConfig processes the deployment exponentially using the following formula: <code>G*(2^N)</code>. In this formula, <code>G</code> is the growth factor specified by the user and <code>N</code> is the number of steps until the configuration is deployed to all targets. For example, if you specify a growth factor of 2, then the system rolls out the configuration as follows:</p> <p> <code>2*(2^0)</code> </p> <p> <code>2*(2^1)</code> </p> <p> <code>2*(2^2)</code> </p> <p>Expressed numerically, the deployment rolls out as follows: 2% of the targets, 4% of the targets, 8% of the targets, and continues until the configuration has been deployed to all targets.</p>\"\
        },\
        \"ReplicateTo\":{\
          \"shape\":\"ReplicateTo\",\
          \"documentation\":\"<p>Save the deployment strategy to a Systems Manager (SSM) document.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Metadata to assign to the deployment strategy. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define.</p>\"\
        }\
      }\
    },\
    \"CreateEnvironmentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ApplicationId\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The application ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>A name for the environment.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the environment.</p>\"\
        },\
        \"Monitors\":{\
          \"shape\":\"MonitorList\",\
          \"documentation\":\"<p>Amazon CloudWatch alarms to monitor during the deployment process.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Metadata to assign to the environment. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define.</p>\"\
        }\
      }\
    },\
    \"DeleteApplicationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ApplicationId\"],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the application to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        }\
      }\
    },\
    \"DeleteConfigurationProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ApplicationId\",\
        \"ConfigurationProfileId\"\
      ],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The application ID that includes the configuration profile you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        },\
        \"ConfigurationProfileId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the configuration profile you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ConfigurationProfileId\"\
        }\
      }\
    },\
    \"DeleteDeploymentStrategyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DeploymentStrategyId\"],\
      \"members\":{\
        \"DeploymentStrategyId\":{\
          \"shape\":\"DeploymentStrategyId\",\
          \"documentation\":\"<p>The ID of the deployment strategy you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DeploymentStrategyId\"\
        }\
      }\
    },\
    \"DeleteEnvironmentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ApplicationId\",\
        \"EnvironmentId\"\
      ],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The application ID that includes the environment you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        },\
        \"EnvironmentId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the environment you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EnvironmentId\"\
        }\
      }\
    },\
    \"Deployment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the application that was deployed.</p>\"\
        },\
        \"EnvironmentId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the environment that was deployed.</p>\"\
        },\
        \"DeploymentStrategyId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the deployment strategy that was deployed.</p>\"\
        },\
        \"ConfigurationProfileId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the configuration profile that was deployed.</p>\"\
        },\
        \"DeploymentNumber\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The sequence number of the deployment.</p>\"\
        },\
        \"ConfigurationName\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the configuration.</p>\"\
        },\
        \"ConfigurationLocationUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>Information about the source location of the configuration.</p>\"\
        },\
        \"ConfigurationVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The configuration version that was deployed.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the deployment.</p>\"\
        },\
        \"DeploymentDurationInMinutes\":{\
          \"shape\":\"MinutesBetween0And24Hours\",\
          \"documentation\":\"<p>Total amount of time the deployment lasted.</p>\"\
        },\
        \"GrowthType\":{\
          \"shape\":\"GrowthType\",\
          \"documentation\":\"<p>The algorithm used to define how percentage grew over time.</p>\"\
        },\
        \"GrowthFactor\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of targets to receive a deployed configuration during each interval.</p>\"\
        },\
        \"FinalBakeTimeInMinutes\":{\
          \"shape\":\"MinutesBetween0And24Hours\",\
          \"documentation\":\"<p>The amount of time AppConfig monitored for alarms before considering the deployment to be complete and no longer eligible for automatic roll back.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"DeploymentState\",\
          \"documentation\":\"<p>The state of the deployment.</p>\"\
        },\
        \"EventLog\":{\
          \"shape\":\"DeploymentEvents\",\
          \"documentation\":\"<p>A list containing all events related to a deployment. The most recent events are displayed first.</p>\"\
        },\
        \"PercentageComplete\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of targets for which the deployment is available.</p>\"\
        },\
        \"StartedAt\":{\
          \"shape\":\"Iso8601DateTime\",\
          \"documentation\":\"<p>The time the deployment started.</p>\"\
        },\
        \"CompletedAt\":{\
          \"shape\":\"Iso8601DateTime\",\
          \"documentation\":\"<p>The time the deployment completed. </p>\"\
        }\
      }\
    },\
    \"DeploymentEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EventType\":{\
          \"shape\":\"DeploymentEventType\",\
          \"documentation\":\"<p>The type of deployment event. Deployment event types include the start, stop, or completion of a deployment; a percentage update; the start or stop of a bake period; the start or completion of a rollback.</p>\"\
        },\
        \"TriggeredBy\":{\
          \"shape\":\"TriggeredBy\",\
          \"documentation\":\"<p>The entity that triggered the deployment event. Events can be triggered by a user, AWS AppConfig, an Amazon CloudWatch alarm, or an internal error.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the deployment event. Descriptions include, but are not limited to, the user account or the CloudWatch alarm ARN that initiated a rollback, the percentage of hosts that received the deployment, or in the case of an internal error, a recommendation to attempt a new deployment.</p>\"\
        },\
        \"OccurredAt\":{\
          \"shape\":\"Iso8601DateTime\",\
          \"documentation\":\"<p>The date and time the event occurred.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that describes a deployment event.</p>\"\
    },\
    \"DeploymentEventType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PERCENTAGE_UPDATED\",\
        \"ROLLBACK_STARTED\",\
        \"ROLLBACK_COMPLETED\",\
        \"BAKE_TIME_STARTED\",\
        \"DEPLOYMENT_STARTED\",\
        \"DEPLOYMENT_COMPLETED\"\
      ]\
    },\
    \"DeploymentEvents\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DeploymentEvent\"}\
    },\
    \"DeploymentList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DeploymentSummary\"}\
    },\
    \"DeploymentState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"BAKING\",\
        \"VALIDATING\",\
        \"DEPLOYING\",\
        \"COMPLETE\",\
        \"ROLLING_BACK\",\
        \"ROLLED_BACK\"\
      ]\
    },\
    \"DeploymentStrategies\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Items\":{\
          \"shape\":\"DeploymentStrategyList\",\
          \"documentation\":\"<p>The elements from this collection.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. Use this token to get the next set of results.</p>\"\
        }\
      }\
    },\
    \"DeploymentStrategy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The deployment strategy ID.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the deployment strategy.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the deployment strategy.</p>\"\
        },\
        \"DeploymentDurationInMinutes\":{\
          \"shape\":\"MinutesBetween0And24Hours\",\
          \"documentation\":\"<p>Total amount of time the deployment lasted.</p>\"\
        },\
        \"GrowthType\":{\
          \"shape\":\"GrowthType\",\
          \"documentation\":\"<p>The algorithm used to define how percentage grew over time.</p>\"\
        },\
        \"GrowthFactor\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of targets that received a deployed configuration during each interval.</p>\"\
        },\
        \"FinalBakeTimeInMinutes\":{\
          \"shape\":\"MinutesBetween0And24Hours\",\
          \"documentation\":\"<p>The amount of time AppConfig monitored for alarms before considering the deployment to be complete and no longer eligible for automatic roll back.</p>\"\
        },\
        \"ReplicateTo\":{\
          \"shape\":\"ReplicateTo\",\
          \"documentation\":\"<p>Save the deployment strategy to a Systems Manager (SSM) document.</p>\"\
        }\
      }\
    },\
    \"DeploymentStrategyId\":{\
      \"type\":\"string\",\
      \"pattern\":\"([a-z0-9]{4,7}|arn:aws.*)\"\
    },\
    \"DeploymentStrategyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DeploymentStrategy\"}\
    },\
    \"DeploymentSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeploymentNumber\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The sequence number of the deployment.</p>\"\
        },\
        \"ConfigurationName\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the configuration.</p>\"\
        },\
        \"ConfigurationVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The version of the configuration.</p>\"\
        },\
        \"DeploymentDurationInMinutes\":{\
          \"shape\":\"MinutesBetween0And24Hours\",\
          \"documentation\":\"<p>Total amount of time the deployment lasted.</p>\"\
        },\
        \"GrowthType\":{\
          \"shape\":\"GrowthType\",\
          \"documentation\":\"<p>The algorithm used to define how percentage grows over time.</p>\"\
        },\
        \"GrowthFactor\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of targets to receive a deployed configuration during each interval.</p>\"\
        },\
        \"FinalBakeTimeInMinutes\":{\
          \"shape\":\"MinutesBetween0And24Hours\",\
          \"documentation\":\"<p>The amount of time AppConfig monitors for alarms before considering the deployment to be complete and no longer eligible for automatic roll back.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"DeploymentState\",\
          \"documentation\":\"<p>The state of the deployment.</p>\"\
        },\
        \"PercentageComplete\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of targets for which the deployment is available.</p>\"\
        },\
        \"StartedAt\":{\
          \"shape\":\"Iso8601DateTime\",\
          \"documentation\":\"<p>Time the deployment started.</p>\"\
        },\
        \"CompletedAt\":{\
          \"shape\":\"Iso8601DateTime\",\
          \"documentation\":\"<p>Time the deployment completed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the deployment.</p>\"\
    },\
    \"Deployments\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Items\":{\
          \"shape\":\"DeploymentList\",\
          \"documentation\":\"<p>The elements from this collection.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. Use this token to get the next set of results.</p>\"\
        }\
      }\
    },\
    \"Description\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0\
    },\
    \"Environment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The application ID.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The environment ID.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the environment.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the environment.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"EnvironmentState\",\
          \"documentation\":\"<p>The state of the environment. An environment can be in one of the following states: <code>READY_FOR_DEPLOYMENT</code>, <code>DEPLOYING</code>, <code>ROLLING_BACK</code>, or <code>ROLLED_BACK</code> </p>\"\
        },\
        \"Monitors\":{\
          \"shape\":\"MonitorList\",\
          \"documentation\":\"<p>Amazon CloudWatch alarms monitored during the deployment.</p>\"\
        }\
      }\
    },\
    \"EnvironmentList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Environment\"}\
    },\
    \"EnvironmentState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"READY_FOR_DEPLOYMENT\",\
        \"DEPLOYING\",\
        \"ROLLING_BACK\",\
        \"ROLLED_BACK\"\
      ]\
    },\
    \"Environments\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Items\":{\
          \"shape\":\"EnvironmentList\",\
          \"documentation\":\"<p>The elements from this collection.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. Use this token to get the next set of results.</p>\"\
        }\
      }\
    },\
    \"GetApplicationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ApplicationId\"],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the application you want to get.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        }\
      }\
    },\
    \"GetConfigurationProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ApplicationId\",\
        \"ConfigurationProfileId\"\
      ],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the application that includes the configuration profile you want to get.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        },\
        \"ConfigurationProfileId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the configuration profile you want to get.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ConfigurationProfileId\"\
        }\
      }\
    },\
    \"GetConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Application\",\
        \"Environment\",\
        \"Configuration\",\
        \"ClientId\"\
      ],\
      \"members\":{\
        \"Application\":{\
          \"shape\":\"StringWithLengthBetween1And64\",\
          \"documentation\":\"<p>The application to get. Specify either the application name or the application ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Application\"\
        },\
        \"Environment\":{\
          \"shape\":\"StringWithLengthBetween1And64\",\
          \"documentation\":\"<p>The environment to get. Specify either the environment name or the environment ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Environment\"\
        },\
        \"Configuration\":{\
          \"shape\":\"StringWithLengthBetween1And64\",\
          \"documentation\":\"<p>The configuration to get. Specify either the configuration name or the configuration ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Configuration\"\
        },\
        \"ClientId\":{\
          \"shape\":\"StringWithLengthBetween1And64\",\
          \"documentation\":\"<p>A unique ID to identify the client for the configuration. This ID enables AppConfig to deploy the configuration in intervals, as defined in the deployment strategy.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"client_id\"\
        },\
        \"ClientConfigurationVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The configuration version returned in the most recent <code>GetConfiguration</code> response.</p> <important> <p>AWS AppConfig uses the value of the <code>ClientConfigurationVersion</code> parameter to identify the configuration version on your clients. If you donât send <code>ClientConfigurationVersion</code> with each call to <code>GetConfiguration</code>, your clients receive the current configuration. You are charged each time your clients receive a configuration.</p> <p>To avoid excess charges, we recommend that you include the <code>ClientConfigurationVersion</code> value with every call to <code>GetConfiguration</code>. This value must be saved on your client. Subsequent calls to <code>GetConfiguration</code> must pass this value by using the <code>ClientConfigurationVersion</code> parameter. </p> </important> <p>For more information about working with configurations, see <a href=\\\"https://docs.aws.amazon.com/systems-manager/latest/userguide/appconfig-retrieving-the-configuration.html\\\">Retrieving the Configuration</a> in the <i>AWS AppConfig User Guide</i>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"client_configuration_version\"\
        }\
      }\
    },\
    \"GetDeploymentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ApplicationId\",\
        \"EnvironmentId\",\
        \"DeploymentNumber\"\
      ],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the application that includes the deployment you want to get. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        },\
        \"EnvironmentId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the environment that includes the deployment you want to get. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EnvironmentId\"\
        },\
        \"DeploymentNumber\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The sequence number of the deployment.</p>\",\
          \"box\":true,\
          \"location\":\"uri\",\
          \"locationName\":\"DeploymentNumber\"\
        }\
      }\
    },\
    \"GetDeploymentStrategyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DeploymentStrategyId\"],\
      \"members\":{\
        \"DeploymentStrategyId\":{\
          \"shape\":\"DeploymentStrategyId\",\
          \"documentation\":\"<p>The ID of the deployment strategy to get.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DeploymentStrategyId\"\
        }\
      }\
    },\
    \"GetEnvironmentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ApplicationId\",\
        \"EnvironmentId\"\
      ],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the application that includes the environment you want to get.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        },\
        \"EnvironmentId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the environment you wnat to get.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EnvironmentId\"\
        }\
      }\
    },\
    \"GrowthFactor\":{\
      \"type\":\"float\",\
      \"max\":100.0,\
      \"min\":1.0\
    },\
    \"GrowthType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"LINEAR\",\
        \"EXPONENTIAL\"\
      ]\
    },\
    \"Id\":{\
      \"type\":\"string\",\
      \"pattern\":\"[a-z0-9]{4,7}\"\
    },\
    \"Integer\":{\"type\":\"integer\"},\
    \"InternalServerException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>There was an internal failure in the AppConfig service.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"Iso8601DateTime\":{\
      \"type\":\"timestamp\",\
      \"timestampFormat\":\"iso8601\"\
    },\
    \"ListApplicationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max_results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token to start the list. Use this token to get the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next_token\"\
        }\
      }\
    },\
    \"ListConfigurationProfilesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ApplicationId\"],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The application ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max_results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token to start the list. Use this token to get the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next_token\"\
        }\
      }\
    },\
    \"ListDeploymentStrategiesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max_results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token to start the list. Use this token to get the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next_token\"\
        }\
      }\
    },\
    \"ListDeploymentsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ApplicationId\",\
        \"EnvironmentId\"\
      ],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The application ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        },\
        \"EnvironmentId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The environment ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EnvironmentId\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max_results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token to start the list. Use this token to get the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next_token\"\
        }\
      }\
    },\
    \"ListEnvironmentsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ApplicationId\"],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The application ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max_results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token to start the list. Use this token to get the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next_token\"\
        }\
      }\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The resource ARN.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ResourceArn\"\
        }\
      }\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"MinutesBetween0And24Hours\":{\
      \"type\":\"integer\",\
      \"max\":1440,\
      \"min\":0\
    },\
    \"Monitor\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AlarmArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>ARN of the Amazon CloudWatch alarm.</p>\"\
        },\
        \"AlarmRoleArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>ARN of an IAM role for AppConfig to monitor <code>AlarmArn</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Amazon CloudWatch alarms to monitor during the deployment process.</p>\"\
    },\
    \"MonitorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Monitor\"},\
      \"max\":5,\
      \"min\":0\
    },\
    \"Name\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"Percentage\":{\
      \"type\":\"float\",\
      \"max\":100.0,\
      \"min\":1.0\
    },\
    \"ReplicateTo\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NONE\",\
        \"SSM_DOCUMENT\"\
      ]\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"ResourceName\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The requested resource could not be found.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"ResourceTags\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Metadata to assign to AppConfig resources. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define.</p>\"\
        }\
      }\
    },\
    \"StartDeploymentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ApplicationId\",\
        \"EnvironmentId\",\
        \"DeploymentStrategyId\",\
        \"ConfigurationProfileId\",\
        \"ConfigurationVersion\"\
      ],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The application ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        },\
        \"EnvironmentId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The environment ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EnvironmentId\"\
        },\
        \"DeploymentStrategyId\":{\
          \"shape\":\"DeploymentStrategyId\",\
          \"documentation\":\"<p>The deployment strategy ID.</p>\"\
        },\
        \"ConfigurationProfileId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The configuration profile ID.</p>\"\
        },\
        \"ConfigurationVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The configuration version to deploy.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the deployment.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Metadata to assign to the deployment. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define.</p>\"\
        }\
      }\
    },\
    \"StopDeploymentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ApplicationId\",\
        \"EnvironmentId\",\
        \"DeploymentNumber\"\
      ],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The application ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        },\
        \"EnvironmentId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The environment ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EnvironmentId\"\
        },\
        \"DeploymentNumber\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The sequence number of the deployment.</p>\",\
          \"box\":true,\
          \"location\":\"uri\",\
          \"locationName\":\"DeploymentNumber\"\
        }\
      }\
    },\
    \"String\":{\"type\":\"string\"},\
    \"StringWithLengthBetween0And32768\":{\
      \"type\":\"string\",\
      \"max\":32768,\
      \"min\":0\
    },\
    \"StringWithLengthBetween1And64\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"max\":50,\
      \"min\":0\
    },\
    \"TagMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TagKey\"},\
      \"value\":{\"shape\":\"TagValue\"},\
      \"max\":50,\
      \"min\":0\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of the resource for which to retrieve tags.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ResourceArn\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The key-value string map. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up to 128 characters and must not start with <code>aws:</code>. The tag value can be up to 256 characters.</p>\"\
        }\
      }\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"TriggeredBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"USER\",\
        \"APPCONFIG\",\
        \"CLOUDWATCH_ALARM\",\
        \"INTERNAL_ERROR\"\
      ]\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of the resource for which to remove tags.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ResourceArn\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The tag keys to delete.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"tagKeys\"\
        }\
      }\
    },\
    \"UpdateApplicationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ApplicationId\"],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The application ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the application.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the application.</p>\"\
        }\
      }\
    },\
    \"UpdateConfigurationProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ApplicationId\",\
        \"ConfigurationProfileId\"\
      ],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The application ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        },\
        \"ConfigurationProfileId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the configuration profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ConfigurationProfileId\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the configuration profile.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the configuration profile.</p>\"\
        },\
        \"RetrievalRoleArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of an IAM role with permission to access the configuration at the specified LocationUri.</p>\"\
        },\
        \"Validators\":{\
          \"shape\":\"ValidatorList\",\
          \"documentation\":\"<p>A list of methods for validating the configuration.</p>\"\
        }\
      }\
    },\
    \"UpdateDeploymentStrategyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DeploymentStrategyId\"],\
      \"members\":{\
        \"DeploymentStrategyId\":{\
          \"shape\":\"DeploymentStrategyId\",\
          \"documentation\":\"<p>The deployment strategy ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DeploymentStrategyId\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the deployment strategy.</p>\"\
        },\
        \"DeploymentDurationInMinutes\":{\
          \"shape\":\"MinutesBetween0And24Hours\",\
          \"documentation\":\"<p>Total amount of time for a deployment to last.</p>\",\
          \"box\":true\
        },\
        \"FinalBakeTimeInMinutes\":{\
          \"shape\":\"MinutesBetween0And24Hours\",\
          \"documentation\":\"<p>The amount of time AppConfig monitors for alarms before considering the deployment to be complete and no longer eligible for automatic roll back.</p>\",\
          \"box\":true\
        },\
        \"GrowthFactor\":{\
          \"shape\":\"GrowthFactor\",\
          \"documentation\":\"<p>The percentage of targets to receive a deployed configuration during each interval.</p>\",\
          \"box\":true\
        },\
        \"GrowthType\":{\
          \"shape\":\"GrowthType\",\
          \"documentation\":\"<p>The algorithm used to define how percentage grows over time. AWS AppConfig supports the following growth types:</p> <p> <b>Linear</b>: For this type, AppConfig processes the deployment by increments of the growth factor evenly distributed over the deployment time. For example, a linear deployment that uses a growth factor of 20 initially makes the configuration available to 20 percent of the targets. After 1/5th of the deployment time has passed, the system updates the percentage to 40 percent. This continues until 100% of the targets are set to receive the deployed configuration.</p> <p> <b>Exponential</b>: For this type, AppConfig processes the deployment exponentially using the following formula: <code>G*(2^N)</code>. In this formula, <code>G</code> is the growth factor specified by the user and <code>N</code> is the number of steps until the configuration is deployed to all targets. For example, if you specify a growth factor of 2, then the system rolls out the configuration as follows:</p> <p> <code>2*(2^0)</code> </p> <p> <code>2*(2^1)</code> </p> <p> <code>2*(2^2)</code> </p> <p>Expressed numerically, the deployment rolls out as follows: 2% of the targets, 4% of the targets, 8% of the targets, and continues until the configuration has been deployed to all targets.</p>\"\
        }\
      }\
    },\
    \"UpdateEnvironmentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ApplicationId\",\
        \"EnvironmentId\"\
      ],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The application ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        },\
        \"EnvironmentId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The environment ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EnvironmentId\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the environment.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the environment.</p>\"\
        },\
        \"Monitors\":{\
          \"shape\":\"MonitorList\",\
          \"documentation\":\"<p>Amazon CloudWatch alarms to monitor during the deployment process.</p>\"\
        }\
      }\
    },\
    \"Uri\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"ValidateConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ApplicationId\",\
        \"ConfigurationProfileId\",\
        \"ConfigurationVersion\"\
      ],\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The application ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ApplicationId\"\
        },\
        \"ConfigurationProfileId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The configuration profile ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ConfigurationProfileId\"\
        },\
        \"ConfigurationVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The version of the configuration to validate.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"configuration_version\"\
        }\
      }\
    },\
    \"Validator\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Type\",\
        \"Content\"\
      ],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"ValidatorType\",\
          \"documentation\":\"<p>AppConfig supports validators of type <code>JSON_SCHEMA</code> and <code>LAMBDA</code> </p>\"\
        },\
        \"Content\":{\
          \"shape\":\"StringWithLengthBetween0And32768\",\
          \"documentation\":\"<p>Either the JSON Schema content or the Amazon Resource Name (ARN) of an AWS Lambda function.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A validator provides a syntactic or semantic check to ensure the configuration you want to deploy functions as intended. To validate your application configuration data, you provide a schema or a Lambda function that runs against the configuration. The configuration deployment or update can only proceed when the configuration data is valid.</p>\"\
    },\
    \"ValidatorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Validator\"},\
      \"max\":2,\
      \"min\":0\
    },\
    \"ValidatorType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"JSON_SCHEMA\",\
        \"LAMBDA\"\
      ]\
    },\
    \"ValidatorTypeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ValidatorType\"},\
      \"max\":2,\
      \"min\":0\
    },\
    \"Version\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    }\
  },\
  \"documentation\":\"<fullname>AWS AppConfig</fullname> <p>Use AWS AppConfig, a capability of AWS Systems Manager, to create, manage, and quickly deploy application configurations. AppConfig supports controlled deployments to applications of any size and includes built-in validation checks and monitoring. You can use AppConfig with applications hosted on Amazon EC2 instances, AWS Lambda, containers, mobile applications, or IoT devices.</p> <p>To prevent errors when deploying application configurations, especially for production systems where a simple typo could cause an unexpected outage, AppConfig includes validators. A validator provides a syntactic or semantic check to ensure that the configuration you want to deploy works as intended. To validate your application configuration data, you provide a schema or a Lambda function that runs against the configuration. The configuration deployment or update can only proceed when the configuration data is valid.</p> <p>During a configuration deployment, AppConfig monitors the application to ensure that the deployment is successful. If the system encounters an error, AppConfig rolls back the change to minimize impact for your application users. You can configure a deployment strategy for each application or environment that includes deployment criteria, including velocity, bake time, and alarms to monitor. Similar to error monitoring, if a deployment triggers an alarm, AppConfig automatically rolls back to the previous version. </p> <p>AppConfig supports multiple use cases. Here are some examples.</p> <ul> <li> <p> <b>Application tuning</b>: Use AppConfig to carefully introduce changes to your application that can only be tested with production traffic.</p> </li> <li> <p> <b>Feature toggle</b>: Use AppConfig to turn on new features that require a timely deployment, such as a product launch or announcement. </p> </li> <li> <p> <b>User membership</b>: Use AppConfig to allow premium subscribers to access paid content. </p> </li> <li> <p> <b>Operational issues</b>: Use AppConfig to reduce stress on your application when a dependency or other external factor impacts the system.</p> </li> </ul> <p>This reference is intended to be used with the <a href=\\\"http://docs.aws.amazon.com/systems-manager/latest/userguide/appconfig.html\\\">AWS AppConfig User Guide</a>.</p>\"\
}\
";
}

@end
