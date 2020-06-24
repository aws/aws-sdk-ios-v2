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

#import "AWSAmplifyResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSAmplifyResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSAmplifyResources

+ (instancetype)sharedInstance {
    static AWSAmplifyResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSAmplifyResources new];
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
    \"apiVersion\":\"2017-07-25\",\
    \"endpointPrefix\":\"amplify\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"rest-json\",\
    \"serviceAbbreviation\":\"Amplify\",\
    \"serviceFullName\":\"AWS Amplify\",\
    \"serviceId\":\"Amplify\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"amplify\",\
    \"uid\":\"amplify-2017-07-25\"\
  },\
  \"operations\":{\
    \"CreateApp\":{\
      \"name\":\"CreateApp\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/apps\"\
      },\
      \"input\":{\"shape\":\"CreateAppRequest\"},\
      \"output\":{\"shape\":\"CreateAppResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"DependentServiceFailureException\"}\
      ],\
      \"documentation\":\"<p> Creates a new Amplify app. </p>\"\
    },\
    \"CreateBackendEnvironment\":{\
      \"name\":\"CreateBackendEnvironment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/apps/{appId}/backendenvironments\"\
      },\
      \"input\":{\"shape\":\"CreateBackendEnvironmentRequest\"},\
      \"output\":{\"shape\":\"CreateBackendEnvironmentResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p> Creates a new backend environment for an Amplify app. </p>\"\
    },\
    \"CreateBranch\":{\
      \"name\":\"CreateBranch\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/apps/{appId}/branches\"\
      },\
      \"input\":{\"shape\":\"CreateBranchRequest\"},\
      \"output\":{\"shape\":\"CreateBranchResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"DependentServiceFailureException\"}\
      ],\
      \"documentation\":\"<p> Creates a new branch for an Amplify app. </p>\"\
    },\
    \"CreateDeployment\":{\
      \"name\":\"CreateDeployment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/apps/{appId}/branches/{branchName}/deployments\"\
      },\
      \"input\":{\"shape\":\"CreateDeploymentRequest\"},\
      \"output\":{\"shape\":\"CreateDeploymentResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p> Creates a deployment for a manually deployed Amplify app. Manually deployed apps are not connected to a repository. </p>\"\
    },\
    \"CreateDomainAssociation\":{\
      \"name\":\"CreateDomainAssociation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/apps/{appId}/domains\"\
      },\
      \"input\":{\"shape\":\"CreateDomainAssociationRequest\"},\
      \"output\":{\"shape\":\"CreateDomainAssociationResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"DependentServiceFailureException\"}\
      ],\
      \"documentation\":\"<p> Creates a new domain association for an Amplify app. This action associates a custom domain with the Amplify app </p>\"\
    },\
    \"CreateWebhook\":{\
      \"name\":\"CreateWebhook\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/apps/{appId}/webhooks\"\
      },\
      \"input\":{\"shape\":\"CreateWebhookRequest\"},\
      \"output\":{\"shape\":\"CreateWebhookResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"DependentServiceFailureException\"}\
      ],\
      \"documentation\":\"<p> Creates a new webhook on an Amplify app. </p>\"\
    },\
    \"DeleteApp\":{\
      \"name\":\"DeleteApp\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/apps/{appId}\"\
      },\
      \"input\":{\"shape\":\"DeleteAppRequest\"},\
      \"output\":{\"shape\":\"DeleteAppResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"DependentServiceFailureException\"}\
      ],\
      \"documentation\":\"<p> Deletes an existing Amplify app specified by an app ID. </p>\"\
    },\
    \"DeleteBackendEnvironment\":{\
      \"name\":\"DeleteBackendEnvironment\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/apps/{appId}/backendenvironments/{environmentName}\"\
      },\
      \"input\":{\"shape\":\"DeleteBackendEnvironmentRequest\"},\
      \"output\":{\"shape\":\"DeleteBackendEnvironmentResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"DependentServiceFailureException\"}\
      ],\
      \"documentation\":\"<p> Deletes a backend environment for an Amplify app. </p>\"\
    },\
    \"DeleteBranch\":{\
      \"name\":\"DeleteBranch\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/apps/{appId}/branches/{branchName}\"\
      },\
      \"input\":{\"shape\":\"DeleteBranchRequest\"},\
      \"output\":{\"shape\":\"DeleteBranchResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"DependentServiceFailureException\"}\
      ],\
      \"documentation\":\"<p> Deletes a branch for an Amplify app. </p>\"\
    },\
    \"DeleteDomainAssociation\":{\
      \"name\":\"DeleteDomainAssociation\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/apps/{appId}/domains/{domainName}\"\
      },\
      \"input\":{\"shape\":\"DeleteDomainAssociationRequest\"},\
      \"output\":{\"shape\":\"DeleteDomainAssociationResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"DependentServiceFailureException\"}\
      ],\
      \"documentation\":\"<p> Deletes a domain association for an Amplify app. </p>\"\
    },\
    \"DeleteJob\":{\
      \"name\":\"DeleteJob\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/apps/{appId}/branches/{branchName}/jobs/{jobId}\"\
      },\
      \"input\":{\"shape\":\"DeleteJobRequest\"},\
      \"output\":{\"shape\":\"DeleteJobResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p> Deletes a job for a branch of an Amplify app. </p>\"\
    },\
    \"DeleteWebhook\":{\
      \"name\":\"DeleteWebhook\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/webhooks/{webhookId}\"\
      },\
      \"input\":{\"shape\":\"DeleteWebhookRequest\"},\
      \"output\":{\"shape\":\"DeleteWebhookResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p> Deletes a webhook. </p>\"\
    },\
    \"GenerateAccessLogs\":{\
      \"name\":\"GenerateAccessLogs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/apps/{appId}/accesslogs\"\
      },\
      \"input\":{\"shape\":\"GenerateAccessLogsRequest\"},\
      \"output\":{\"shape\":\"GenerateAccessLogsResult\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Returns the website access logs for a specific time range using a presigned URL. </p>\"\
    },\
    \"GetApp\":{\
      \"name\":\"GetApp\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/apps/{appId}\"\
      },\
      \"input\":{\"shape\":\"GetAppRequest\"},\
      \"output\":{\"shape\":\"GetAppResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Returns an existing Amplify app by appID. </p>\"\
    },\
    \"GetArtifactUrl\":{\
      \"name\":\"GetArtifactUrl\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/artifacts/{artifactId}\"\
      },\
      \"input\":{\"shape\":\"GetArtifactUrlRequest\"},\
      \"output\":{\"shape\":\"GetArtifactUrlResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p> Returns the artifact info that corresponds to an artifact id. </p>\"\
    },\
    \"GetBackendEnvironment\":{\
      \"name\":\"GetBackendEnvironment\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/apps/{appId}/backendenvironments/{environmentName}\"\
      },\
      \"input\":{\"shape\":\"GetBackendEnvironmentRequest\"},\
      \"output\":{\"shape\":\"GetBackendEnvironmentResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Returns a backend environment for an Amplify app. </p>\"\
    },\
    \"GetBranch\":{\
      \"name\":\"GetBranch\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/apps/{appId}/branches/{branchName}\"\
      },\
      \"input\":{\"shape\":\"GetBranchRequest\"},\
      \"output\":{\"shape\":\"GetBranchResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Returns a branch for an Amplify app. </p>\"\
    },\
    \"GetDomainAssociation\":{\
      \"name\":\"GetDomainAssociation\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/apps/{appId}/domains/{domainName}\"\
      },\
      \"input\":{\"shape\":\"GetDomainAssociationRequest\"},\
      \"output\":{\"shape\":\"GetDomainAssociationResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Returns the domain information for an Amplify app. </p>\"\
    },\
    \"GetJob\":{\
      \"name\":\"GetJob\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/apps/{appId}/branches/{branchName}/jobs/{jobId}\"\
      },\
      \"input\":{\"shape\":\"GetJobRequest\"},\
      \"output\":{\"shape\":\"GetJobResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p> Returns a job for a branch of an Amplify app. </p>\"\
    },\
    \"GetWebhook\":{\
      \"name\":\"GetWebhook\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/webhooks/{webhookId}\"\
      },\
      \"input\":{\"shape\":\"GetWebhookRequest\"},\
      \"output\":{\"shape\":\"GetWebhookResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p> Returns the webhook information that corresponds to a specified webhook ID. </p>\"\
    },\
    \"ListApps\":{\
      \"name\":\"ListApps\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/apps\"\
      },\
      \"input\":{\"shape\":\"ListAppsRequest\"},\
      \"output\":{\"shape\":\"ListAppsResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Returns a list of the existing Amplify apps. </p>\"\
    },\
    \"ListArtifacts\":{\
      \"name\":\"ListArtifacts\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/apps/{appId}/branches/{branchName}/jobs/{jobId}/artifacts\"\
      },\
      \"input\":{\"shape\":\"ListArtifactsRequest\"},\
      \"output\":{\"shape\":\"ListArtifactsResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p> Returns a list of artifacts for a specified app, branch, and job. </p>\"\
    },\
    \"ListBackendEnvironments\":{\
      \"name\":\"ListBackendEnvironments\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/apps/{appId}/backendenvironments\"\
      },\
      \"input\":{\"shape\":\"ListBackendEnvironmentsRequest\"},\
      \"output\":{\"shape\":\"ListBackendEnvironmentsResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Lists the backend environments for an Amplify app. </p>\"\
    },\
    \"ListBranches\":{\
      \"name\":\"ListBranches\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/apps/{appId}/branches\"\
      },\
      \"input\":{\"shape\":\"ListBranchesRequest\"},\
      \"output\":{\"shape\":\"ListBranchesResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Lists the branches of an Amplify app. </p>\"\
    },\
    \"ListDomainAssociations\":{\
      \"name\":\"ListDomainAssociations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/apps/{appId}/domains\"\
      },\
      \"input\":{\"shape\":\"ListDomainAssociationsRequest\"},\
      \"output\":{\"shape\":\"ListDomainAssociationsResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Returns the domain associations for an Amplify app. </p>\"\
    },\
    \"ListJobs\":{\
      \"name\":\"ListJobs\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/apps/{appId}/branches/{branchName}/jobs\"\
      },\
      \"input\":{\"shape\":\"ListJobsRequest\"},\
      \"output\":{\"shape\":\"ListJobsResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p> Lists the jobs for a branch of an Amplify app. </p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/tags/{resourceArn}\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p> Returns a list of tags for a specified Amazon Resource Name (ARN). </p>\"\
    },\
    \"ListWebhooks\":{\
      \"name\":\"ListWebhooks\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/apps/{appId}/webhooks\"\
      },\
      \"input\":{\"shape\":\"ListWebhooksRequest\"},\
      \"output\":{\"shape\":\"ListWebhooksResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p> Returns a list of webhooks for an Amplify app. </p>\"\
    },\
    \"StartDeployment\":{\
      \"name\":\"StartDeployment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/apps/{appId}/branches/{branchName}/deployments/start\"\
      },\
      \"input\":{\"shape\":\"StartDeploymentRequest\"},\
      \"output\":{\"shape\":\"StartDeploymentResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p> Starts a deployment for a manually deployed app. Manually deployed apps are not connected to a repository. </p>\"\
    },\
    \"StartJob\":{\
      \"name\":\"StartJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/apps/{appId}/branches/{branchName}/jobs\"\
      },\
      \"input\":{\"shape\":\"StartJobRequest\"},\
      \"output\":{\"shape\":\"StartJobResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p> Starts a new job for a branch of an Amplify app. </p>\"\
    },\
    \"StopJob\":{\
      \"name\":\"StopJob\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/apps/{appId}/branches/{branchName}/jobs/{jobId}/stop\"\
      },\
      \"input\":{\"shape\":\"StopJobRequest\"},\
      \"output\":{\"shape\":\"StopJobResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p> Stops a job that is in progress for a branch of an Amplify app. </p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tags/{resourceArn}\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"output\":{\"shape\":\"TagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p> Tags the resource with a tag key and value. </p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/tags/{resourceArn}\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"output\":{\"shape\":\"UntagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p> Untags a resource with a specified Amazon Resource Name (ARN). </p>\"\
    },\
    \"UpdateApp\":{\
      \"name\":\"UpdateApp\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/apps/{appId}\"\
      },\
      \"input\":{\"shape\":\"UpdateAppRequest\"},\
      \"output\":{\"shape\":\"UpdateAppResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p> Updates an existing Amplify app. </p>\"\
    },\
    \"UpdateBranch\":{\
      \"name\":\"UpdateBranch\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/apps/{appId}/branches/{branchName}\"\
      },\
      \"input\":{\"shape\":\"UpdateBranchRequest\"},\
      \"output\":{\"shape\":\"UpdateBranchResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"DependentServiceFailureException\"}\
      ],\
      \"documentation\":\"<p> Updates a branch for an Amplify app. </p>\"\
    },\
    \"UpdateDomainAssociation\":{\
      \"name\":\"UpdateDomainAssociation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/apps/{appId}/domains/{domainName}\"\
      },\
      \"input\":{\"shape\":\"UpdateDomainAssociationRequest\"},\
      \"output\":{\"shape\":\"UpdateDomainAssociationResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"DependentServiceFailureException\"}\
      ],\
      \"documentation\":\"<p> Creates a new domain association for an Amplify app.</p>\"\
    },\
    \"UpdateWebhook\":{\
      \"name\":\"UpdateWebhook\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/webhooks/{webhookId}\"\
      },\
      \"input\":{\"shape\":\"UpdateWebhookRequest\"},\
      \"output\":{\"shape\":\"UpdateWebhookResult\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"DependentServiceFailureException\"}\
      ],\
      \"documentation\":\"<p> Updates a webhook. </p>\"\
    }\
  },\
  \"shapes\":{\
    \"AccessToken\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"sensitive\":true\
    },\
    \"ActiveJobId\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"App\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"appArn\",\
        \"name\",\
        \"description\",\
        \"repository\",\
        \"platform\",\
        \"createTime\",\
        \"updateTime\",\
        \"environmentVariables\",\
        \"defaultDomain\",\
        \"enableBranchAutoBuild\",\
        \"enableBasicAuth\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID of the Amplify app. </p>\"\
        },\
        \"appArn\":{\
          \"shape\":\"AppArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the Amplify app. </p>\"\
        },\
        \"name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p> The name for the Amplify app. </p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p> The tag for the Amplify app. </p>\"\
        },\
        \"description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p> The description for the Amplify app. </p>\"\
        },\
        \"repository\":{\
          \"shape\":\"Repository\",\
          \"documentation\":\"<p> The repository for the Amplify app. </p>\"\
        },\
        \"platform\":{\
          \"shape\":\"Platform\",\
          \"documentation\":\"<p> The platform for the Amplify app. </p>\"\
        },\
        \"createTime\":{\
          \"shape\":\"CreateTime\",\
          \"documentation\":\"<p> Creates a date and time for the Amplify app. </p>\"\
        },\
        \"updateTime\":{\
          \"shape\":\"UpdateTime\",\
          \"documentation\":\"<p> Updates the date and time for the Amplify app. </p>\"\
        },\
        \"iamServiceRoleArn\":{\
          \"shape\":\"ServiceRoleArn\",\
          \"documentation\":\"<p> The AWS Identity and Access Management (IAM) service role for the Amazon Resource Name (ARN) of the Amplify app. </p>\"\
        },\
        \"environmentVariables\":{\
          \"shape\":\"EnvironmentVariables\",\
          \"documentation\":\"<p> The environment variables for the Amplify app. </p>\"\
        },\
        \"defaultDomain\":{\
          \"shape\":\"DefaultDomain\",\
          \"documentation\":\"<p> The default domain for the Amplify app. </p>\"\
        },\
        \"enableBranchAutoBuild\":{\
          \"shape\":\"EnableBranchAutoBuild\",\
          \"documentation\":\"<p> Enables the auto-building of branches for the Amplify app. </p>\"\
        },\
        \"enableBranchAutoDeletion\":{\
          \"shape\":\"EnableBranchAutoDeletion\",\
          \"documentation\":\"<p> Automatically disconnects a branch in the Amplify Console when you delete a branch from your Git repository. </p>\"\
        },\
        \"enableBasicAuth\":{\
          \"shape\":\"EnableBasicAuth\",\
          \"documentation\":\"<p> Enables basic authorization for the Amplify app's branches. </p>\"\
        },\
        \"basicAuthCredentials\":{\
          \"shape\":\"BasicAuthCredentials\",\
          \"documentation\":\"<p> The basic authorization credentials for branches for the Amplify app. </p>\"\
        },\
        \"customRules\":{\
          \"shape\":\"CustomRules\",\
          \"documentation\":\"<p> Describes the custom redirect and rewrite rules for the Amplify app. </p>\"\
        },\
        \"productionBranch\":{\
          \"shape\":\"ProductionBranch\",\
          \"documentation\":\"<p> Describes the information about a production branch of the Amplify app. </p>\"\
        },\
        \"buildSpec\":{\
          \"shape\":\"BuildSpec\",\
          \"documentation\":\"<p> Describes the content of the build specification (build spec) for the Amplify app. </p>\"\
        },\
        \"enableAutoBranchCreation\":{\
          \"shape\":\"EnableAutoBranchCreation\",\
          \"documentation\":\"<p> Enables automated branch creation for the Amplify app. </p>\"\
        },\
        \"autoBranchCreationPatterns\":{\
          \"shape\":\"AutoBranchCreationPatterns\",\
          \"documentation\":\"<p> Describes the automated branch creation glob patterns for the Amplify app. </p>\"\
        },\
        \"autoBranchCreationConfig\":{\
          \"shape\":\"AutoBranchCreationConfig\",\
          \"documentation\":\"<p> Describes the automated branch creation configuration for the Amplify app. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Represents the different branches of a repository for building, deploying, and hosting an Amplify app. </p>\"\
    },\
    \"AppArn\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"AppId\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"Apps\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"App\"}\
    },\
    \"Artifact\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"artifactFileName\",\
        \"artifactId\"\
      ],\
      \"members\":{\
        \"artifactFileName\":{\
          \"shape\":\"ArtifactFileName\",\
          \"documentation\":\"<p> The file name for the artifact. </p>\"\
        },\
        \"artifactId\":{\
          \"shape\":\"ArtifactId\",\
          \"documentation\":\"<p> The unique ID for the artifact. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Describes an artifact. </p>\"\
    },\
    \"ArtifactFileName\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"ArtifactId\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"ArtifactUrl\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"Artifacts\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Artifact\"}\
    },\
    \"ArtifactsUrl\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"AssociatedResource\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"AssociatedResources\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AssociatedResource\"}\
    },\
    \"AutoBranchCreationConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"stage\":{\
          \"shape\":\"Stage\",\
          \"documentation\":\"<p> Describes the current stage for the autocreated branch. </p>\"\
        },\
        \"framework\":{\
          \"shape\":\"Framework\",\
          \"documentation\":\"<p> The framework for the autocreated branch. </p>\"\
        },\
        \"enableAutoBuild\":{\
          \"shape\":\"EnableAutoBuild\",\
          \"documentation\":\"<p> Enables auto building for the autocreated branch. </p>\"\
        },\
        \"environmentVariables\":{\
          \"shape\":\"EnvironmentVariables\",\
          \"documentation\":\"<p> The environment variables for the autocreated branch. </p>\"\
        },\
        \"basicAuthCredentials\":{\
          \"shape\":\"BasicAuthCredentials\",\
          \"documentation\":\"<p> The basic authorization credentials for the autocreated branch. </p>\"\
        },\
        \"enableBasicAuth\":{\
          \"shape\":\"EnableBasicAuth\",\
          \"documentation\":\"<p> Enables basic authorization for the autocreated branch. </p>\"\
        },\
        \"buildSpec\":{\
          \"shape\":\"BuildSpec\",\
          \"documentation\":\"<p> The build specification (build spec) for the autocreated branch. </p>\"\
        },\
        \"enablePullRequestPreview\":{\
          \"shape\":\"EnablePullRequestPreview\",\
          \"documentation\":\"<p> Enables pull request preview for the autocreated branch. </p>\"\
        },\
        \"pullRequestEnvironmentName\":{\
          \"shape\":\"PullRequestEnvironmentName\",\
          \"documentation\":\"<p> The Amplify environment name for the pull request. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Describes the automated branch creation configuration. </p>\"\
    },\
    \"AutoBranchCreationPattern\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"AutoBranchCreationPatterns\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AutoBranchCreationPattern\"}\
    },\
    \"AutoSubDomainCreationPattern\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"AutoSubDomainCreationPatterns\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AutoSubDomainCreationPattern\"}\
    },\
    \"AutoSubDomainIAMRole\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"pattern\":\"^$|^arn:aws:iam::\\\\d{12}:role.+\"\
    },\
    \"BackendEnvironment\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"backendEnvironmentArn\",\
        \"environmentName\",\
        \"createTime\",\
        \"updateTime\"\
      ],\
      \"members\":{\
        \"backendEnvironmentArn\":{\
          \"shape\":\"BackendEnvironmentArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) for a backend environment that is part of an Amplify app. </p>\"\
        },\
        \"environmentName\":{\
          \"shape\":\"EnvironmentName\",\
          \"documentation\":\"<p> The name for a backend environment that is part of an Amplify app. </p>\"\
        },\
        \"stackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p> The AWS CloudFormation stack name of a backend environment. </p>\"\
        },\
        \"deploymentArtifacts\":{\
          \"shape\":\"DeploymentArtifacts\",\
          \"documentation\":\"<p> The name of deployment artifacts. </p>\"\
        },\
        \"createTime\":{\
          \"shape\":\"CreateTime\",\
          \"documentation\":\"<p> The creation date and time for a backend environment that is part of an Amplify app. </p>\"\
        },\
        \"updateTime\":{\
          \"shape\":\"UpdateTime\",\
          \"documentation\":\"<p> The last updated date and time for a backend environment that is part of an Amplify app. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Describes the backend environment for an Amplify app. </p>\"\
    },\
    \"BackendEnvironmentArn\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"BackendEnvironments\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BackendEnvironment\"}\
    },\
    \"BadRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p> A request contains unexpected data. </p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"BasicAuthCredentials\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"sensitive\":true\
    },\
    \"Branch\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"branchArn\",\
        \"branchName\",\
        \"description\",\
        \"stage\",\
        \"displayName\",\
        \"enableNotification\",\
        \"createTime\",\
        \"updateTime\",\
        \"environmentVariables\",\
        \"enableAutoBuild\",\
        \"customDomains\",\
        \"framework\",\
        \"activeJobId\",\
        \"totalNumberOfJobs\",\
        \"enableBasicAuth\",\
        \"ttl\",\
        \"enablePullRequestPreview\"\
      ],\
      \"members\":{\
        \"branchArn\":{\
          \"shape\":\"BranchArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) for a branch that is part of an Amplify app. </p>\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The name for the branch that is part of an Amplify app. </p>\"\
        },\
        \"description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p> The description for the branch that is part of an Amplify app. </p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p> The tag for the branch of an Amplify app. </p>\"\
        },\
        \"stage\":{\
          \"shape\":\"Stage\",\
          \"documentation\":\"<p> The current stage for the branch that is part of an Amplify app. </p>\"\
        },\
        \"displayName\":{\
          \"shape\":\"DisplayName\",\
          \"documentation\":\"<p> The display name for the branch. This is used as the default domain prefix. </p>\"\
        },\
        \"enableNotification\":{\
          \"shape\":\"EnableNotification\",\
          \"documentation\":\"<p> Enables notifications for a branch that is part of an Amplify app. </p>\"\
        },\
        \"createTime\":{\
          \"shape\":\"CreateTime\",\
          \"documentation\":\"<p> The creation date and time for a branch that is part of an Amplify app. </p>\"\
        },\
        \"updateTime\":{\
          \"shape\":\"UpdateTime\",\
          \"documentation\":\"<p> The last updated date and time for a branch that is part of an Amplify app. </p>\"\
        },\
        \"environmentVariables\":{\
          \"shape\":\"EnvironmentVariables\",\
          \"documentation\":\"<p> The environment variables specific to a branch of an Amplify app. </p>\"\
        },\
        \"enableAutoBuild\":{\
          \"shape\":\"EnableAutoBuild\",\
          \"documentation\":\"<p> Enables auto-building on push for a branch of an Amplify app. </p>\"\
        },\
        \"customDomains\":{\
          \"shape\":\"CustomDomains\",\
          \"documentation\":\"<p> The custom domains for a branch of an Amplify app. </p>\"\
        },\
        \"framework\":{\
          \"shape\":\"Framework\",\
          \"documentation\":\"<p> The framework for a branch of an Amplify app. </p>\"\
        },\
        \"activeJobId\":{\
          \"shape\":\"ActiveJobId\",\
          \"documentation\":\"<p> The ID of the active job for a branch of an Amplify app. </p>\"\
        },\
        \"totalNumberOfJobs\":{\
          \"shape\":\"TotalNumberOfJobs\",\
          \"documentation\":\"<p> The total number of jobs that are part of an Amplify app. </p>\"\
        },\
        \"enableBasicAuth\":{\
          \"shape\":\"EnableBasicAuth\",\
          \"documentation\":\"<p> Enables basic authorization for a branch of an Amplify app. </p>\"\
        },\
        \"thumbnailUrl\":{\
          \"shape\":\"ThumbnailUrl\",\
          \"documentation\":\"<p> The thumbnail URL for the branch of an Amplify app. </p>\"\
        },\
        \"basicAuthCredentials\":{\
          \"shape\":\"BasicAuthCredentials\",\
          \"documentation\":\"<p> The basic authorization credentials for a branch of an Amplify app. </p>\"\
        },\
        \"buildSpec\":{\
          \"shape\":\"BuildSpec\",\
          \"documentation\":\"<p> The build specification (build spec) content for the branch of an Amplify app. </p>\"\
        },\
        \"ttl\":{\
          \"shape\":\"TTL\",\
          \"documentation\":\"<p> The content Time to Live (TTL) for the website in seconds. </p>\"\
        },\
        \"associatedResources\":{\
          \"shape\":\"AssociatedResources\",\
          \"documentation\":\"<p> A list of custom resources that are linked to this branch. </p>\"\
        },\
        \"enablePullRequestPreview\":{\
          \"shape\":\"EnablePullRequestPreview\",\
          \"documentation\":\"<p> Enables pull request preview for the branch. </p>\"\
        },\
        \"pullRequestEnvironmentName\":{\
          \"shape\":\"PullRequestEnvironmentName\",\
          \"documentation\":\"<p> The Amplify environment name for the pull request. </p>\"\
        },\
        \"destinationBranch\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The destination branch if the branch is a pull request branch. </p>\"\
        },\
        \"sourceBranch\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The source branch if the branch is a pull request branch. </p>\"\
        },\
        \"backendEnvironmentArn\":{\
          \"shape\":\"BackendEnvironmentArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) for a backend environment that is part of an Amplify app. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The branch for an Amplify app, which maps to a third-party repository branch. </p>\"\
    },\
    \"BranchArn\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"BranchName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"Branches\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Branch\"},\
      \"max\":255\
    },\
    \"BuildSpec\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p> The build specification (build spec) file for an Amplify app build. </p>\",\
      \"max\":25000,\
      \"min\":1\
    },\
    \"CertificateVerificationDNSRecord\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"Code\":{\"type\":\"string\"},\
    \"CommitId\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"CommitMessage\":{\
      \"type\":\"string\",\
      \"max\":10000\
    },\
    \"CommitTime\":{\"type\":\"timestamp\"},\
    \"Condition\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"Context\":{\"type\":\"string\"},\
    \"CreateAppRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"name\"],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p> The name for the Amplify app. </p>\"\
        },\
        \"description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p> The description for an Amplify app. </p>\"\
        },\
        \"repository\":{\
          \"shape\":\"Repository\",\
          \"documentation\":\"<p> The repository for an Amplify app. </p>\"\
        },\
        \"platform\":{\
          \"shape\":\"Platform\",\
          \"documentation\":\"<p> The platform or framework for an Amplify app. </p>\"\
        },\
        \"iamServiceRoleArn\":{\
          \"shape\":\"ServiceRoleArn\",\
          \"documentation\":\"<p> The AWS Identity and Access Management (IAM) service role for an Amplify app. </p>\"\
        },\
        \"oauthToken\":{\
          \"shape\":\"OauthToken\",\
          \"documentation\":\"<p> The OAuth token for a third-party source control system for an Amplify app. The OAuth token is used to create a webhook and a read-only deploy key. The OAuth token is not stored. </p>\"\
        },\
        \"accessToken\":{\
          \"shape\":\"AccessToken\",\
          \"documentation\":\"<p> The personal access token for a third-party source control system for an Amplify app. The personal access token is used to create a webhook and a read-only deploy key. The token is not stored. </p>\"\
        },\
        \"environmentVariables\":{\
          \"shape\":\"EnvironmentVariables\",\
          \"documentation\":\"<p> The environment variables map for an Amplify app. </p>\"\
        },\
        \"enableBranchAutoBuild\":{\
          \"shape\":\"EnableBranchAutoBuild\",\
          \"documentation\":\"<p> Enables the auto building of branches for an Amplify app. </p>\"\
        },\
        \"enableBranchAutoDeletion\":{\
          \"shape\":\"EnableBranchAutoDeletion\",\
          \"documentation\":\"<p> Automatically disconnects a branch in the Amplify Console when you delete a branch from your Git repository. </p>\"\
        },\
        \"enableBasicAuth\":{\
          \"shape\":\"EnableBasicAuth\",\
          \"documentation\":\"<p> Enables basic authorization for an Amplify app. This will apply to all branches that are part of this app. </p>\"\
        },\
        \"basicAuthCredentials\":{\
          \"shape\":\"BasicAuthCredentials\",\
          \"documentation\":\"<p> The credentials for basic authorization for an Amplify app. </p>\"\
        },\
        \"customRules\":{\
          \"shape\":\"CustomRules\",\
          \"documentation\":\"<p> The custom rewrite and redirect rules for an Amplify app. </p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p> The tag for an Amplify app. </p>\"\
        },\
        \"buildSpec\":{\
          \"shape\":\"BuildSpec\",\
          \"documentation\":\"<p> The build specification (build spec) for an Amplify app. </p>\"\
        },\
        \"enableAutoBranchCreation\":{\
          \"shape\":\"EnableAutoBranchCreation\",\
          \"documentation\":\"<p> Enables automated branch creation for the Amplify app. </p>\"\
        },\
        \"autoBranchCreationPatterns\":{\
          \"shape\":\"AutoBranchCreationPatterns\",\
          \"documentation\":\"<p> The automated branch creation glob patterns for the Amplify app. </p>\"\
        },\
        \"autoBranchCreationConfig\":{\
          \"shape\":\"AutoBranchCreationConfig\",\
          \"documentation\":\"<p> The automated branch creation configuration for the Amplify app. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The request structure used to create apps in Amplify. </p>\"\
    },\
    \"CreateAppResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"app\"],\
      \"members\":{\
        \"app\":{\"shape\":\"App\"}\
      }\
    },\
    \"CreateBackendEnvironmentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"environmentName\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"environmentName\":{\
          \"shape\":\"EnvironmentName\",\
          \"documentation\":\"<p> The name for the backend environment. </p>\"\
        },\
        \"stackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p> The AWS CloudFormation stack name of a backend environment. </p>\"\
        },\
        \"deploymentArtifacts\":{\
          \"shape\":\"DeploymentArtifacts\",\
          \"documentation\":\"<p> The name of deployment artifacts. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the backend environment create request. </p>\"\
    },\
    \"CreateBackendEnvironmentResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"backendEnvironment\"],\
      \"members\":{\
        \"backendEnvironment\":{\
          \"shape\":\"BackendEnvironment\",\
          \"documentation\":\"<p> Describes the backend environment for an Amplify app. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the create backend environment request. </p>\"\
    },\
    \"CreateBranchRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"branchName\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The name for the branch. </p>\"\
        },\
        \"description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p> The description for the branch. </p>\"\
        },\
        \"stage\":{\
          \"shape\":\"Stage\",\
          \"documentation\":\"<p> Describes the current stage for the branch. </p>\"\
        },\
        \"framework\":{\
          \"shape\":\"Framework\",\
          \"documentation\":\"<p> The framework for the branch. </p>\"\
        },\
        \"enableNotification\":{\
          \"shape\":\"EnableNotification\",\
          \"documentation\":\"<p> Enables notifications for the branch. </p>\"\
        },\
        \"enableAutoBuild\":{\
          \"shape\":\"EnableAutoBuild\",\
          \"documentation\":\"<p> Enables auto building for the branch. </p>\"\
        },\
        \"environmentVariables\":{\
          \"shape\":\"EnvironmentVariables\",\
          \"documentation\":\"<p> The environment variables for the branch. </p>\"\
        },\
        \"basicAuthCredentials\":{\
          \"shape\":\"BasicAuthCredentials\",\
          \"documentation\":\"<p> The basic authorization credentials for the branch. </p>\"\
        },\
        \"enableBasicAuth\":{\
          \"shape\":\"EnableBasicAuth\",\
          \"documentation\":\"<p> Enables basic authorization for the branch. </p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p> The tag for the branch. </p>\"\
        },\
        \"buildSpec\":{\
          \"shape\":\"BuildSpec\",\
          \"documentation\":\"<p> The build specification (build spec) for the branch. </p>\"\
        },\
        \"ttl\":{\
          \"shape\":\"TTL\",\
          \"documentation\":\"<p> The content Time To Live (TTL) for the website in seconds. </p>\"\
        },\
        \"displayName\":{\
          \"shape\":\"DisplayName\",\
          \"documentation\":\"<p> The display name for a branch. This is used as the default domain prefix. </p>\"\
        },\
        \"enablePullRequestPreview\":{\
          \"shape\":\"EnablePullRequestPreview\",\
          \"documentation\":\"<p> Enables pull request preview for this branch. </p>\"\
        },\
        \"pullRequestEnvironmentName\":{\
          \"shape\":\"PullRequestEnvironmentName\",\
          \"documentation\":\"<p> The Amplify environment name for the pull request. </p>\"\
        },\
        \"backendEnvironmentArn\":{\
          \"shape\":\"BackendEnvironmentArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) for a backend environment that is part of an Amplify app. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the create branch request. </p>\"\
    },\
    \"CreateBranchResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"branch\"],\
      \"members\":{\
        \"branch\":{\
          \"shape\":\"Branch\",\
          \"documentation\":\"<p> Describes the branch for an Amplify app, which maps to a third-party repository branch. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for create branch request. </p>\"\
    },\
    \"CreateDeploymentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"branchName\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The name for the branch, for the job. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"branchName\"\
        },\
        \"fileMap\":{\
          \"shape\":\"FileMap\",\
          \"documentation\":\"<p> An optional file map that contains the file name as the key and the file content md5 hash as the value. If this argument is provided, the service will generate a unique upload URL per file. Otherwise, the service will only generate a single upload URL for the zipped files. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the create a new deployment request. </p>\"\
    },\
    \"CreateDeploymentResult\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"fileUploadUrls\",\
        \"zipUploadUrl\"\
      ],\
      \"members\":{\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p> The job ID for this deployment. will supply to start deployment api. </p>\"\
        },\
        \"fileUploadUrls\":{\
          \"shape\":\"FileUploadUrls\",\
          \"documentation\":\"<p> When the <code>fileMap</code> argument is provided in the request, <code>fileUploadUrls</code> will contain a map of file names to upload URLs. </p>\"\
        },\
        \"zipUploadUrl\":{\
          \"shape\":\"UploadUrl\",\
          \"documentation\":\"<p> When the <code>fileMap</code> argument is not provided in the request, this <code>zipUploadUrl</code> is returned. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the create a new deployment request. </p>\"\
    },\
    \"CreateDomainAssociationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"domainName\",\
        \"subDomainSettings\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p> The domain name for the domain association. </p>\"\
        },\
        \"enableAutoSubDomain\":{\
          \"shape\":\"EnableAutoSubDomain\",\
          \"documentation\":\"<p> Enables the automated creation of subdomains for branches. </p>\"\
        },\
        \"subDomainSettings\":{\
          \"shape\":\"SubDomainSettings\",\
          \"documentation\":\"<p> The setting for the subdomain. </p>\"\
        },\
        \"autoSubDomainCreationPatterns\":{\
          \"shape\":\"AutoSubDomainCreationPatterns\",\
          \"documentation\":\"<p> Sets the branch patterns for automatic subdomain creation. </p>\"\
        },\
        \"autoSubDomainIAMRole\":{\
          \"shape\":\"AutoSubDomainIAMRole\",\
          \"documentation\":\"<p> The required AWS Identity and Access Management (IAM) service role for the Amazon Resource Name (ARN) for automatically creating subdomains. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the create domain association request. </p>\"\
    },\
    \"CreateDomainAssociationResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"domainAssociation\"],\
      \"members\":{\
        \"domainAssociation\":{\
          \"shape\":\"DomainAssociation\",\
          \"documentation\":\"<p> Describes the structure of a domain association, which associates a custom domain with an Amplify app. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the create domain association request. </p>\"\
    },\
    \"CreateTime\":{\"type\":\"timestamp\"},\
    \"CreateWebhookRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"branchName\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The name for a branch that is part of an Amplify app. </p>\"\
        },\
        \"description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p> The description for a webhook. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the create webhook request. </p>\"\
    },\
    \"CreateWebhookResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"webhook\"],\
      \"members\":{\
        \"webhook\":{\
          \"shape\":\"Webhook\",\
          \"documentation\":\"<p> Describes a webhook that connects repository events to an Amplify app. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the create webhook request. </p>\"\
    },\
    \"CustomDomain\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"CustomDomains\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CustomDomain\"},\
      \"max\":255\
    },\
    \"CustomRule\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"source\",\
        \"target\"\
      ],\
      \"members\":{\
        \"source\":{\
          \"shape\":\"Source\",\
          \"documentation\":\"<p> The source pattern for a URL rewrite or redirect rule. </p>\"\
        },\
        \"target\":{\
          \"shape\":\"Target\",\
          \"documentation\":\"<p> The target pattern for a URL rewrite or redirect rule. </p>\"\
        },\
        \"status\":{\
          \"shape\":\"Status\",\
          \"documentation\":\"<p> The status code for a URL rewrite or redirect rule. </p>\"\
        },\
        \"condition\":{\
          \"shape\":\"Condition\",\
          \"documentation\":\"<p> The condition for a URL rewrite or redirect rule, such as a country code. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Describes a custom rewrite or redirect rule. </p>\"\
    },\
    \"CustomRules\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CustomRule\"}\
    },\
    \"DNSRecord\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"DefaultDomain\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"DeleteAppRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"appId\"],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        }\
      },\
      \"documentation\":\"<p> Describes the request structure for the delete app request. </p>\"\
    },\
    \"DeleteAppResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"app\"],\
      \"members\":{\
        \"app\":{\"shape\":\"App\"}\
      },\
      \"documentation\":\"<p> The result structure for the delete app request. </p>\"\
    },\
    \"DeleteBackendEnvironmentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"environmentName\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID of an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"environmentName\":{\
          \"shape\":\"EnvironmentName\",\
          \"documentation\":\"<p> The name of a backend environment of an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"environmentName\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the delete backend environment request. </p>\"\
    },\
    \"DeleteBackendEnvironmentResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"backendEnvironment\"],\
      \"members\":{\
        \"backendEnvironment\":{\
          \"shape\":\"BackendEnvironment\",\
          \"documentation\":\"<p> Describes the backend environment for an Amplify app. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure of the delete backend environment result. </p>\"\
    },\
    \"DeleteBranchRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"branchName\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The name for the branch. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"branchName\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the delete branch request. </p>\"\
    },\
    \"DeleteBranchResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"branch\"],\
      \"members\":{\
        \"branch\":{\
          \"shape\":\"Branch\",\
          \"documentation\":\"<p> The branch for an Amplify app, which maps to a third-party repository branch. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the delete branch request. </p>\"\
    },\
    \"DeleteDomainAssociationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"domainName\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique id for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p> The name of the domain. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"domainName\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the delete domain association request. </p>\"\
    },\
    \"DeleteDomainAssociationResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"domainAssociation\"],\
      \"members\":{\
        \"domainAssociation\":{\"shape\":\"DomainAssociation\"}\
      }\
    },\
    \"DeleteJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"branchName\",\
        \"jobId\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The name for the branch, for the job. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"branchName\"\
        },\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p> The unique ID for the job. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobId\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the delete job request. </p>\"\
    },\
    \"DeleteJobResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"jobSummary\"],\
      \"members\":{\
        \"jobSummary\":{\"shape\":\"JobSummary\"}\
      },\
      \"documentation\":\"<p> The result structure for the delete job request. </p>\"\
    },\
    \"DeleteWebhookRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"webhookId\"],\
      \"members\":{\
        \"webhookId\":{\
          \"shape\":\"WebhookId\",\
          \"documentation\":\"<p> The unique ID for a webhook. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"webhookId\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the delete webhook request. </p>\"\
    },\
    \"DeleteWebhookResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"webhook\"],\
      \"members\":{\
        \"webhook\":{\
          \"shape\":\"Webhook\",\
          \"documentation\":\"<p> Describes a webhook that connects repository events to an Amplify app. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the delete webhook request. </p>\"\
    },\
    \"DependentServiceFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p> An operation failed because a dependent service threw an exception. </p>\",\
      \"error\":{\"httpStatusCode\":503},\
      \"exception\":true\
    },\
    \"DeploymentArtifacts\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"Description\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"DisplayName\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"DomainAssociation\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"domainAssociationArn\",\
        \"domainName\",\
        \"enableAutoSubDomain\",\
        \"domainStatus\",\
        \"statusReason\",\
        \"subDomains\"\
      ],\
      \"members\":{\
        \"domainAssociationArn\":{\
          \"shape\":\"DomainAssociationArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) for the domain association. </p>\"\
        },\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p> The name of the domain. </p>\"\
        },\
        \"enableAutoSubDomain\":{\
          \"shape\":\"EnableAutoSubDomain\",\
          \"documentation\":\"<p> Enables the automated creation of subdomains for branches. </p>\"\
        },\
        \"autoSubDomainCreationPatterns\":{\
          \"shape\":\"AutoSubDomainCreationPatterns\",\
          \"documentation\":\"<p> Sets branch patterns for automatic subdomain creation. </p>\"\
        },\
        \"autoSubDomainIAMRole\":{\
          \"shape\":\"AutoSubDomainIAMRole\",\
          \"documentation\":\"<p> The required AWS Identity and Access Management (IAM) service role for the Amazon Resource Name (ARN) for automatically creating subdomains. </p>\"\
        },\
        \"domainStatus\":{\
          \"shape\":\"DomainStatus\",\
          \"documentation\":\"<p> The current status of the domain association. </p>\"\
        },\
        \"statusReason\":{\
          \"shape\":\"StatusReason\",\
          \"documentation\":\"<p> The reason for the current status of the domain association. </p>\"\
        },\
        \"certificateVerificationDNSRecord\":{\
          \"shape\":\"CertificateVerificationDNSRecord\",\
          \"documentation\":\"<p> The DNS record for certificate verification. </p>\"\
        },\
        \"subDomains\":{\
          \"shape\":\"SubDomains\",\
          \"documentation\":\"<p> The subdomains for the domain association. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Describes a domain association that associates a custom domain with an Amplify app. </p>\"\
    },\
    \"DomainAssociationArn\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"DomainAssociations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DomainAssociation\"},\
      \"max\":255\
    },\
    \"DomainName\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"DomainPrefix\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"DomainStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING_VERIFICATION\",\
        \"IN_PROGRESS\",\
        \"AVAILABLE\",\
        \"PENDING_DEPLOYMENT\",\
        \"FAILED\",\
        \"CREATING\",\
        \"REQUESTING_CERTIFICATE\",\
        \"UPDATING\"\
      ]\
    },\
    \"EnableAutoBranchCreation\":{\"type\":\"boolean\"},\
    \"EnableAutoBuild\":{\"type\":\"boolean\"},\
    \"EnableAutoSubDomain\":{\"type\":\"boolean\"},\
    \"EnableBasicAuth\":{\"type\":\"boolean\"},\
    \"EnableBranchAutoBuild\":{\"type\":\"boolean\"},\
    \"EnableBranchAutoDeletion\":{\"type\":\"boolean\"},\
    \"EnableNotification\":{\"type\":\"boolean\"},\
    \"EnablePullRequestPreview\":{\"type\":\"boolean\"},\
    \"EndTime\":{\"type\":\"timestamp\"},\
    \"EnvKey\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"EnvValue\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"EnvironmentName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"EnvironmentVariables\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"EnvKey\"},\
      \"value\":{\"shape\":\"EnvValue\"}\
    },\
    \"ErrorMessage\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"FileMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"FileName\"},\
      \"value\":{\"shape\":\"MD5Hash\"}\
    },\
    \"FileName\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"FileUploadUrls\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"FileName\"},\
      \"value\":{\"shape\":\"UploadUrl\"}\
    },\
    \"Framework\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"GenerateAccessLogsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"domainName\",\
        \"appId\"\
      ],\
      \"members\":{\
        \"startTime\":{\
          \"shape\":\"StartTime\",\
          \"documentation\":\"<p> The time at which the logs should start. The time range specified is inclusive of the start time. </p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"EndTime\",\
          \"documentation\":\"<p> The time at which the logs should end. The time range specified is inclusive of the end time. </p>\"\
        },\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p> The name of the domain. </p>\"\
        },\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the generate access logs request. </p>\"\
    },\
    \"GenerateAccessLogsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logUrl\":{\
          \"shape\":\"LogUrl\",\
          \"documentation\":\"<p> The pre-signed URL for the requested access logs. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the generate access logs request. </p>\"\
    },\
    \"GetAppRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"appId\"],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the get app request. </p>\"\
    },\
    \"GetAppResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"app\"],\
      \"members\":{\
        \"app\":{\"shape\":\"App\"}\
      }\
    },\
    \"GetArtifactUrlRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"artifactId\"],\
      \"members\":{\
        \"artifactId\":{\
          \"shape\":\"ArtifactId\",\
          \"documentation\":\"<p> The unique ID for an artifact. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"artifactId\"\
        }\
      },\
      \"documentation\":\"<p> Returns the request structure for the get artifact request. </p>\"\
    },\
    \"GetArtifactUrlResult\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"artifactId\",\
        \"artifactUrl\"\
      ],\
      \"members\":{\
        \"artifactId\":{\
          \"shape\":\"ArtifactId\",\
          \"documentation\":\"<p> The unique ID for an artifact. </p>\"\
        },\
        \"artifactUrl\":{\
          \"shape\":\"ArtifactUrl\",\
          \"documentation\":\"<p> The presigned URL for the artifact. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Returns the result structure for the get artifact request. </p>\"\
    },\
    \"GetBackendEnvironmentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"environmentName\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique id for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"environmentName\":{\
          \"shape\":\"EnvironmentName\",\
          \"documentation\":\"<p> The name for the backend environment. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"environmentName\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the get backend environment request. </p>\"\
    },\
    \"GetBackendEnvironmentResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"backendEnvironment\"],\
      \"members\":{\
        \"backendEnvironment\":{\
          \"shape\":\"BackendEnvironment\",\
          \"documentation\":\"<p> Describes the backend environment for an Amplify app. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the get backend environment result. </p>\"\
    },\
    \"GetBranchRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"branchName\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The name for the branch. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"branchName\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the get branch request. </p>\"\
    },\
    \"GetBranchResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"branch\"],\
      \"members\":{\
        \"branch\":{\"shape\":\"Branch\"}\
      }\
    },\
    \"GetDomainAssociationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"domainName\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique id for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p> The name of the domain. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"domainName\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the get domain association request. </p>\"\
    },\
    \"GetDomainAssociationResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"domainAssociation\"],\
      \"members\":{\
        \"domainAssociation\":{\
          \"shape\":\"DomainAssociation\",\
          \"documentation\":\"<p> Describes the structure of a domain association, which associates a custom domain with an Amplify app. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the get domain association request. </p>\"\
    },\
    \"GetJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"branchName\",\
        \"jobId\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The branch name for the job. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"branchName\"\
        },\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p> The unique ID for the job. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobId\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the get job request. </p>\"\
    },\
    \"GetJobResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"job\"],\
      \"members\":{\
        \"job\":{\"shape\":\"Job\"}\
      }\
    },\
    \"GetWebhookRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"webhookId\"],\
      \"members\":{\
        \"webhookId\":{\
          \"shape\":\"WebhookId\",\
          \"documentation\":\"<p> The unique ID for a webhook. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"webhookId\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the get webhook request. </p>\"\
    },\
    \"GetWebhookResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"webhook\"],\
      \"members\":{\
        \"webhook\":{\
          \"shape\":\"Webhook\",\
          \"documentation\":\"<p> Describes the structure of a webhook. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the get webhook request. </p>\"\
    },\
    \"InternalFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p> The service failed to perform an operation due to an internal issue. </p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"Job\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"summary\",\
        \"steps\"\
      ],\
      \"members\":{\
        \"summary\":{\
          \"shape\":\"JobSummary\",\
          \"documentation\":\"<p> Describes the summary for an execution job for an Amplify app. </p>\"\
        },\
        \"steps\":{\
          \"shape\":\"Steps\",\
          \"documentation\":\"<p> The execution steps for an execution job, for an Amplify app. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Describes an execution job for an Amplify app. </p>\"\
    },\
    \"JobArn\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"JobId\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"JobReason\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"JobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"PROVISIONING\",\
        \"RUNNING\",\
        \"FAILED\",\
        \"SUCCEED\",\
        \"CANCELLING\",\
        \"CANCELLED\"\
      ]\
    },\
    \"JobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"JobSummary\"}\
    },\
    \"JobSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"jobArn\",\
        \"jobId\",\
        \"commitId\",\
        \"commitMessage\",\
        \"commitTime\",\
        \"startTime\",\
        \"status\",\
        \"jobType\"\
      ],\
      \"members\":{\
        \"jobArn\":{\
          \"shape\":\"JobArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) for the job. </p>\"\
        },\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p> The unique ID for the job. </p>\"\
        },\
        \"commitId\":{\
          \"shape\":\"CommitId\",\
          \"documentation\":\"<p> The commit ID from a third-party repository provider for the job. </p>\"\
        },\
        \"commitMessage\":{\
          \"shape\":\"CommitMessage\",\
          \"documentation\":\"<p> The commit message from a third-party repository provider for the job. </p>\"\
        },\
        \"commitTime\":{\
          \"shape\":\"CommitTime\",\
          \"documentation\":\"<p> The commit date and time for the job. </p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"StartTime\",\
          \"documentation\":\"<p> The start date and time for the job. </p>\"\
        },\
        \"status\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p> The current status for the job. </p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"EndTime\",\
          \"documentation\":\"<p> The end date and time for the job. </p>\"\
        },\
        \"jobType\":{\
          \"shape\":\"JobType\",\
          \"documentation\":\"<p> The type for the job. If the value is <code>RELEASE</code>, the job was manually released from its source by using the <code>StartJob</code> API. If the value is <code>RETRY</code>, the job was manually retried using the <code>StartJob</code> API. If the value is <code>WEB_HOOK</code>, the job was automatically triggered by webhooks. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Describes the summary for an execution job for an Amplify app. </p>\"\
    },\
    \"JobType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RELEASE\",\
        \"RETRY\",\
        \"MANUAL\",\
        \"WEB_HOOK\"\
      ],\
      \"max\":10\
    },\
    \"LastDeployTime\":{\"type\":\"timestamp\"},\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p> A resource could not be created because service quotas were exceeded. </p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"ListAppsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A pagination token. If non-null, the pagination token is returned in a result. Pass its value in another request to retrieve more entries. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p> The maximum number of records to list in a single response. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the list apps request. </p>\"\
    },\
    \"ListAppsResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"apps\"],\
      \"members\":{\
        \"apps\":{\
          \"shape\":\"Apps\",\
          \"documentation\":\"<p> A list of Amplify apps. </p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A pagination token. Set to null to start listing apps from start. If non-null, the pagination token is returned in a result. Pass its value in here to list more projects. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for an Amplify app list request. </p>\"\
    },\
    \"ListArtifactsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"branchName\",\
        \"jobId\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The name of a branch that is part of an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"branchName\"\
        },\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p> The unique ID for a job. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobId\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A pagination token. Set to null to start listing artifacts from start. If a non-null pagination token is returned in a result, pass its value in here to list more artifacts. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p> The maximum number of records to list in a single response. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      },\
      \"documentation\":\"<p> Describes the request structure for the list artifacts request. </p>\"\
    },\
    \"ListArtifactsResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"artifacts\"],\
      \"members\":{\
        \"artifacts\":{\
          \"shape\":\"Artifacts\",\
          \"documentation\":\"<p> A list of artifacts. </p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A pagination token. If a non-null pagination token is returned in a result, pass its value in another request to retrieve more entries. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the list artifacts request. </p>\"\
    },\
    \"ListBackendEnvironmentsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"appId\"],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"environmentName\":{\
          \"shape\":\"EnvironmentName\",\
          \"documentation\":\"<p> The name of the backend environment </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"environmentName\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A pagination token. Set to null to start listing backend environments from the start. If a non-null pagination token is returned in a result, pass its value in here to list more backend environments. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p> The maximum number of records to list in a single response. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the list backend environments request. </p>\"\
    },\
    \"ListBackendEnvironmentsResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"backendEnvironments\"],\
      \"members\":{\
        \"backendEnvironments\":{\
          \"shape\":\"BackendEnvironments\",\
          \"documentation\":\"<p> The list of backend environments for an Amplify app. </p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A pagination token. If a non-null pagination token is returned in a result, pass its value in another request to retrieve more entries. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the list backend environments result. </p>\"\
    },\
    \"ListBranchesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"appId\"],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A pagination token. Set to null to start listing branches from the start. If a non-null pagination token is returned in a result, pass its value in here to list more branches. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p> The maximum number of records to list in a single response. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the list branches request. </p>\"\
    },\
    \"ListBranchesResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"branches\"],\
      \"members\":{\
        \"branches\":{\
          \"shape\":\"Branches\",\
          \"documentation\":\"<p> A list of branches for an Amplify app. </p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A pagination token. If a non-null pagination token is returned in a result, pass its value in another request to retrieve more entries. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the list branches request. </p>\"\
    },\
    \"ListDomainAssociationsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"appId\"],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A pagination token. Set to null to start listing apps from the start. If non-null, a pagination token is returned in a result. Pass its value in here to list more projects. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p> The maximum number of records to list in a single response. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the list domain associations request. </p>\"\
    },\
    \"ListDomainAssociationsResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"domainAssociations\"],\
      \"members\":{\
        \"domainAssociations\":{\
          \"shape\":\"DomainAssociations\",\
          \"documentation\":\"<p> A list of domain associations. </p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A pagination token. If non-null, a pagination token is returned in a result. Pass its value in another request to retrieve more entries. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the list domain association request. </p>\"\
    },\
    \"ListJobsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"branchName\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The name for a branch. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"branchName\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A pagination token. Set to null to start listing steps from the start. If a non-null pagination token is returned in a result, pass its value in here to list more steps. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p> The maximum number of records to list in a single response. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the list jobs request. </p>\"\
    },\
    \"ListJobsResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"jobSummaries\"],\
      \"members\":{\
        \"jobSummaries\":{\
          \"shape\":\"JobSummaries\",\
          \"documentation\":\"<p> The result structure for the list job result request. </p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A pagination token. If non-null the pagination token is returned in a result. Pass its value in another request to retrieve more entries. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The maximum number of records to list in a single response. </p>\"\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceArn\"],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) to use to list tags. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        }\
      },\
      \"documentation\":\"<p> The request structure to use to list tags for a resource. </p>\"\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p> A list of tags for the specified The Amazon Resource Name (ARN). </p>\"\
        }\
      },\
      \"documentation\":\"<p> The response for the list tags for resource request. </p>\"\
    },\
    \"ListWebhooksRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"appId\"],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A pagination token. Set to null to start listing webhooks from the start. If non-null,the pagination token is returned in a result. Pass its value in here to list more webhooks. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p> The maximum number of records to list in a single response. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the list webhooks request. </p>\"\
    },\
    \"ListWebhooksResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"webhooks\"],\
      \"members\":{\
        \"webhooks\":{\
          \"shape\":\"Webhooks\",\
          \"documentation\":\"<p> A list of webhooks. </p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> A pagination token. If non-null, the pagination token is returned in a result. Pass its value in another request to retrieve more entries. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the list webhooks request. </p>\"\
    },\
    \"LogUrl\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"MD5Hash\":{\
      \"type\":\"string\",\
      \"max\":32\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"Name\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":2000\
    },\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p> An entity was not found during an operation. </p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"OauthToken\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"sensitive\":true\
    },\
    \"Platform\":{\
      \"type\":\"string\",\
      \"enum\":[\"WEB\"]\
    },\
    \"ProductionBranch\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"lastDeployTime\":{\
          \"shape\":\"LastDeployTime\",\
          \"documentation\":\"<p> The last deploy time of the production branch. </p>\"\
        },\
        \"status\":{\
          \"shape\":\"Status\",\
          \"documentation\":\"<p> The status of the production branch. </p>\"\
        },\
        \"thumbnailUrl\":{\
          \"shape\":\"ThumbnailUrl\",\
          \"documentation\":\"<p> The thumbnail URL for the production branch. </p>\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The branch name for the production branch. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Describes the information about a production branch for an Amplify app. </p>\"\
    },\
    \"PullRequestEnvironmentName\":{\
      \"type\":\"string\",\
      \"max\":20\
    },\
    \"Repository\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"ResourceArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"^arn:aws:amplify:.*\"\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"code\",\
        \"message\"\
      ],\
      \"members\":{\
        \"code\":{\"shape\":\"Code\"},\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p> An operation failed due to a non-existent resource. </p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"Screenshots\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ThumbnailName\"},\
      \"value\":{\"shape\":\"ThumbnailUrl\"}\
    },\
    \"ServiceRoleArn\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"Source\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"SourceUrl\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"StackName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"Stage\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PRODUCTION\",\
        \"BETA\",\
        \"DEVELOPMENT\",\
        \"EXPERIMENTAL\",\
        \"PULL_REQUEST\"\
      ]\
    },\
    \"StartDeploymentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"branchName\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The name for the branch, for the job. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"branchName\"\
        },\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p> The job ID for this deployment, generated by the create deployment request. </p>\"\
        },\
        \"sourceUrl\":{\
          \"shape\":\"SourceUrl\",\
          \"documentation\":\"<p> The source URL for this deployment, used when calling start deployment without create deployment. The source URL can be any HTTP GET URL that is publicly accessible and downloads a single .zip file. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the start a deployment request. </p>\"\
    },\
    \"StartDeploymentResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"jobSummary\"],\
      \"members\":{\
        \"jobSummary\":{\
          \"shape\":\"JobSummary\",\
          \"documentation\":\"<p> The summary for the job. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the start a deployment request. </p>\"\
    },\
    \"StartJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"branchName\",\
        \"jobType\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The branch name for the job. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"branchName\"\
        },\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p> The unique ID for an existing job. This is required if the value of <code>jobType</code> is <code>RETRY</code>. </p>\"\
        },\
        \"jobType\":{\
          \"shape\":\"JobType\",\
          \"documentation\":\"<p> Describes the type for the job. The job type <code>RELEASE</code> starts a new job with the latest change from the specified branch. This value is available only for apps that are connected to a repository. The job type <code>RETRY</code> retries an existing job. If the job type value is <code>RETRY</code>, the <code>jobId</code> is also required. </p>\"\
        },\
        \"jobReason\":{\
          \"shape\":\"JobReason\",\
          \"documentation\":\"<p> A descriptive reason for starting this job. </p>\"\
        },\
        \"commitId\":{\
          \"shape\":\"CommitId\",\
          \"documentation\":\"<p> The commit ID from a third-party repository provider for the job. </p>\"\
        },\
        \"commitMessage\":{\
          \"shape\":\"CommitMessage\",\
          \"documentation\":\"<p> The commit message from a third-party repository provider for the job. </p>\"\
        },\
        \"commitTime\":{\
          \"shape\":\"CommitTime\",\
          \"documentation\":\"<p> The commit date and time for the job. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the start job request. </p>\"\
    },\
    \"StartJobResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"jobSummary\"],\
      \"members\":{\
        \"jobSummary\":{\
          \"shape\":\"JobSummary\",\
          \"documentation\":\"<p> The summary for the job. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the run job request. </p>\"\
    },\
    \"StartTime\":{\"type\":\"timestamp\"},\
    \"Status\":{\
      \"type\":\"string\",\
      \"max\":7,\
      \"min\":3\
    },\
    \"StatusReason\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"Step\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"stepName\",\
        \"startTime\",\
        \"status\",\
        \"endTime\"\
      ],\
      \"members\":{\
        \"stepName\":{\
          \"shape\":\"StepName\",\
          \"documentation\":\"<p> The name of the execution step. </p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"StartTime\",\
          \"documentation\":\"<p> The start date and time of the execution step. </p>\"\
        },\
        \"status\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p> The status of the execution step. </p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"EndTime\",\
          \"documentation\":\"<p> The end date and time of the execution step. </p>\"\
        },\
        \"logUrl\":{\
          \"shape\":\"LogUrl\",\
          \"documentation\":\"<p> The URL to the logs for the execution step. </p>\"\
        },\
        \"artifactsUrl\":{\
          \"shape\":\"ArtifactsUrl\",\
          \"documentation\":\"<p> The URL to the artifact for the execution step. </p>\"\
        },\
        \"testArtifactsUrl\":{\
          \"shape\":\"TestArtifactsUrl\",\
          \"documentation\":\"<p> The URL to the test artifact for the execution step. </p>\"\
        },\
        \"testConfigUrl\":{\
          \"shape\":\"TestConfigUrl\",\
          \"documentation\":\"<p> The URL to the test configuration for the execution step. </p>\"\
        },\
        \"screenshots\":{\
          \"shape\":\"Screenshots\",\
          \"documentation\":\"<p> The list of screenshot URLs for the execution step, if relevant. </p>\"\
        },\
        \"statusReason\":{\
          \"shape\":\"StatusReason\",\
          \"documentation\":\"<p> The reason for the current step status. </p>\"\
        },\
        \"context\":{\
          \"shape\":\"Context\",\
          \"documentation\":\"<p> The context for the current step. Includes a build image if the step is build. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Describes an execution step, for an execution job, for an Amplify app. </p>\"\
    },\
    \"StepName\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"Steps\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Step\"}\
    },\
    \"StopJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"branchName\",\
        \"jobId\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The name for the branch, for the job. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"branchName\"\
        },\
        \"jobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p> The unique id for the job. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"jobId\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the stop job request. </p>\"\
    },\
    \"StopJobResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"jobSummary\"],\
      \"members\":{\
        \"jobSummary\":{\
          \"shape\":\"JobSummary\",\
          \"documentation\":\"<p> The summary for the job. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the stop job request. </p>\"\
    },\
    \"SubDomain\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"subDomainSetting\",\
        \"verified\",\
        \"dnsRecord\"\
      ],\
      \"members\":{\
        \"subDomainSetting\":{\
          \"shape\":\"SubDomainSetting\",\
          \"documentation\":\"<p> Describes the settings for the subdomain. </p>\"\
        },\
        \"verified\":{\
          \"shape\":\"Verified\",\
          \"documentation\":\"<p> The verified status of the subdomain </p>\"\
        },\
        \"dnsRecord\":{\
          \"shape\":\"DNSRecord\",\
          \"documentation\":\"<p> The DNS record for the subdomain. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The subdomain for the domain association. </p>\"\
    },\
    \"SubDomainSetting\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"prefix\",\
        \"branchName\"\
      ],\
      \"members\":{\
        \"prefix\":{\
          \"shape\":\"DomainPrefix\",\
          \"documentation\":\"<p> The prefix setting for the subdomain. </p>\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The branch name setting for the subdomain. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Describes the settings for the subdomain. </p>\"\
    },\
    \"SubDomainSettings\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubDomainSetting\"},\
      \"max\":255\
    },\
    \"SubDomains\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubDomain\"},\
      \"max\":255\
    },\
    \"TTL\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p> The content Time to Live (TTL) for the website in seconds. </p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^(?!aws:)[a-zA-Z+-=._:/]+$\"\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TagKey\"},\
      \"value\":{\"shape\":\"TagValue\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceArn\",\
        \"tags\"\
      ],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) to use to tag a resource. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p> The tags used to tag the resource. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The request structure to tag a resource with a tag key and value. </p>\"\
    },\
    \"TagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p> The response for the tag resource request. </p>\"\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"Target\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"TestArtifactsUrl\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"TestConfigUrl\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"ThumbnailName\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"ThumbnailUrl\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1\
    },\
    \"TotalNumberOfJobs\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"UnauthorizedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p> An operation failed due to a lack of access. </p>\",\
      \"error\":{\"httpStatusCode\":401},\
      \"exception\":true\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceArn\",\
        \"tagKeys\"\
      ],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) to use to untag a resource. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"tagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p> The tag keys to use to untag a resource. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"tagKeys\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the untag resource request. </p>\"\
    },\
    \"UntagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p> The response for the untag resource request. </p>\"\
    },\
    \"UpdateAppRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"appId\"],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p> The name for an Amplify app. </p>\"\
        },\
        \"description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p> The description for an Amplify app. </p>\"\
        },\
        \"platform\":{\
          \"shape\":\"Platform\",\
          \"documentation\":\"<p> The platform for an Amplify app. </p>\"\
        },\
        \"iamServiceRoleArn\":{\
          \"shape\":\"ServiceRoleArn\",\
          \"documentation\":\"<p> The AWS Identity and Access Management (IAM) service role for an Amplify app. </p>\"\
        },\
        \"environmentVariables\":{\
          \"shape\":\"EnvironmentVariables\",\
          \"documentation\":\"<p> The environment variables for an Amplify app. </p>\"\
        },\
        \"enableBranchAutoBuild\":{\
          \"shape\":\"EnableAutoBuild\",\
          \"documentation\":\"<p> Enables branch auto-building for an Amplify app. </p>\"\
        },\
        \"enableBranchAutoDeletion\":{\
          \"shape\":\"EnableBranchAutoDeletion\",\
          \"documentation\":\"<p> Automatically disconnects a branch in the Amplify Console when you delete a branch from your Git repository. </p>\"\
        },\
        \"enableBasicAuth\":{\
          \"shape\":\"EnableBasicAuth\",\
          \"documentation\":\"<p> Enables basic authorization for an Amplify app. </p>\"\
        },\
        \"basicAuthCredentials\":{\
          \"shape\":\"BasicAuthCredentials\",\
          \"documentation\":\"<p> The basic authorization credentials for an Amplify app. </p>\"\
        },\
        \"customRules\":{\
          \"shape\":\"CustomRules\",\
          \"documentation\":\"<p> The custom redirect and rewrite rules for an Amplify app. </p>\"\
        },\
        \"buildSpec\":{\
          \"shape\":\"BuildSpec\",\
          \"documentation\":\"<p> The build specification (build spec) for an Amplify app. </p>\"\
        },\
        \"enableAutoBranchCreation\":{\
          \"shape\":\"EnableAutoBranchCreation\",\
          \"documentation\":\"<p> Enables automated branch creation for the Amplify app. </p>\"\
        },\
        \"autoBranchCreationPatterns\":{\
          \"shape\":\"AutoBranchCreationPatterns\",\
          \"documentation\":\"<p> Describes the automated branch creation glob patterns for the Amplify app. </p>\"\
        },\
        \"autoBranchCreationConfig\":{\
          \"shape\":\"AutoBranchCreationConfig\",\
          \"documentation\":\"<p> The automated branch creation configuration for the Amplify app. </p>\"\
        },\
        \"repository\":{\
          \"shape\":\"Repository\",\
          \"documentation\":\"<p> The name of the repository for an Amplify app </p>\"\
        },\
        \"oauthToken\":{\
          \"shape\":\"OauthToken\",\
          \"documentation\":\"<p> The OAuth token for a third-party source control system for an Amplify app. The token is used to create a webhook and a read-only deploy key. The OAuth token is not stored. </p>\"\
        },\
        \"accessToken\":{\
          \"shape\":\"AccessToken\",\
          \"documentation\":\"<p> The personal access token for a third-party source control system for an Amplify app. The token is used to create webhook and a read-only deploy key. The token is not stored. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the update app request. </p>\"\
    },\
    \"UpdateAppResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"app\"],\
      \"members\":{\
        \"app\":{\
          \"shape\":\"App\",\
          \"documentation\":\"<p> Represents the updated Amplify app. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for an Amplify app update request. </p>\"\
    },\
    \"UpdateBranchRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"branchName\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The name for the branch. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"branchName\"\
        },\
        \"description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p> The description for the branch. </p>\"\
        },\
        \"framework\":{\
          \"shape\":\"Framework\",\
          \"documentation\":\"<p> The framework for the branch. </p>\"\
        },\
        \"stage\":{\
          \"shape\":\"Stage\",\
          \"documentation\":\"<p> Describes the current stage for the branch. </p>\"\
        },\
        \"enableNotification\":{\
          \"shape\":\"EnableNotification\",\
          \"documentation\":\"<p> Enables notifications for the branch. </p>\"\
        },\
        \"enableAutoBuild\":{\
          \"shape\":\"EnableAutoBuild\",\
          \"documentation\":\"<p> Enables auto building for the branch. </p>\"\
        },\
        \"environmentVariables\":{\
          \"shape\":\"EnvironmentVariables\",\
          \"documentation\":\"<p> The environment variables for the branch. </p>\"\
        },\
        \"basicAuthCredentials\":{\
          \"shape\":\"BasicAuthCredentials\",\
          \"documentation\":\"<p> The basic authorization credentials for the branch. </p>\"\
        },\
        \"enableBasicAuth\":{\
          \"shape\":\"EnableBasicAuth\",\
          \"documentation\":\"<p> Enables basic authorization for the branch. </p>\"\
        },\
        \"buildSpec\":{\
          \"shape\":\"BuildSpec\",\
          \"documentation\":\"<p> The build specification (build spec) for the branch. </p>\"\
        },\
        \"ttl\":{\
          \"shape\":\"TTL\",\
          \"documentation\":\"<p> The content Time to Live (TTL) for the website in seconds. </p>\"\
        },\
        \"displayName\":{\
          \"shape\":\"DisplayName\",\
          \"documentation\":\"<p> The display name for a branch. This is used as the default domain prefix. </p>\"\
        },\
        \"enablePullRequestPreview\":{\
          \"shape\":\"EnablePullRequestPreview\",\
          \"documentation\":\"<p> Enables pull request preview for this branch. </p>\"\
        },\
        \"pullRequestEnvironmentName\":{\
          \"shape\":\"PullRequestEnvironmentName\",\
          \"documentation\":\"<p> The Amplify environment name for the pull request. </p>\"\
        },\
        \"backendEnvironmentArn\":{\
          \"shape\":\"BackendEnvironmentArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) for a backend environment that is part of an Amplify app. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the update branch request. </p>\"\
    },\
    \"UpdateBranchResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"branch\"],\
      \"members\":{\
        \"branch\":{\
          \"shape\":\"Branch\",\
          \"documentation\":\"<p> The branch for an Amplify app, which maps to a third-party repository branch. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the update branch request. </p>\"\
    },\
    \"UpdateDomainAssociationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"appId\",\
        \"domainName\",\
        \"subDomainSettings\"\
      ],\
      \"members\":{\
        \"appId\":{\
          \"shape\":\"AppId\",\
          \"documentation\":\"<p> The unique ID for an Amplify app. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appId\"\
        },\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p> The name of the domain. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"domainName\"\
        },\
        \"enableAutoSubDomain\":{\
          \"shape\":\"EnableAutoSubDomain\",\
          \"documentation\":\"<p> Enables the automated creation of subdomains for branches. </p>\"\
        },\
        \"subDomainSettings\":{\
          \"shape\":\"SubDomainSettings\",\
          \"documentation\":\"<p> Describes the settings for the subdomain. </p>\"\
        },\
        \"autoSubDomainCreationPatterns\":{\
          \"shape\":\"AutoSubDomainCreationPatterns\",\
          \"documentation\":\"<p> Sets the branch patterns for automatic subdomain creation. </p>\"\
        },\
        \"autoSubDomainIAMRole\":{\
          \"shape\":\"AutoSubDomainIAMRole\",\
          \"documentation\":\"<p> The required AWS Identity and Access Management (IAM) service role for the Amazon Resource Name (ARN) for automatically creating subdomains. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the update domain association request. </p>\"\
    },\
    \"UpdateDomainAssociationResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"domainAssociation\"],\
      \"members\":{\
        \"domainAssociation\":{\
          \"shape\":\"DomainAssociation\",\
          \"documentation\":\"<p> Describes a domain association, which associates a custom domain with an Amplify app. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the update domain association request. </p>\"\
    },\
    \"UpdateTime\":{\"type\":\"timestamp\"},\
    \"UpdateWebhookRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"webhookId\"],\
      \"members\":{\
        \"webhookId\":{\
          \"shape\":\"WebhookId\",\
          \"documentation\":\"<p> The unique ID for a webhook. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"webhookId\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The name for a branch that is part of an Amplify app. </p>\"\
        },\
        \"description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p> The description for a webhook. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The request structure for the update webhook request. </p>\"\
    },\
    \"UpdateWebhookResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"webhook\"],\
      \"members\":{\
        \"webhook\":{\
          \"shape\":\"Webhook\",\
          \"documentation\":\"<p> Describes a webhook that connects repository events to an Amplify app. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The result structure for the update webhook request. </p>\"\
    },\
    \"UploadUrl\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"Verified\":{\"type\":\"boolean\"},\
    \"Webhook\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"webhookArn\",\
        \"webhookId\",\
        \"webhookUrl\",\
        \"branchName\",\
        \"description\",\
        \"createTime\",\
        \"updateTime\"\
      ],\
      \"members\":{\
        \"webhookArn\":{\
          \"shape\":\"WebhookArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) for the webhook. </p>\"\
        },\
        \"webhookId\":{\
          \"shape\":\"WebhookId\",\
          \"documentation\":\"<p> The ID of the webhook. </p>\"\
        },\
        \"webhookUrl\":{\
          \"shape\":\"WebhookUrl\",\
          \"documentation\":\"<p> The URL of the webhook. </p>\"\
        },\
        \"branchName\":{\
          \"shape\":\"BranchName\",\
          \"documentation\":\"<p> The name for a branch that is part of an Amplify app. </p>\"\
        },\
        \"description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p> The description for a webhook. </p>\"\
        },\
        \"createTime\":{\
          \"shape\":\"CreateTime\",\
          \"documentation\":\"<p> The create date and time for a webhook. </p>\"\
        },\
        \"updateTime\":{\
          \"shape\":\"UpdateTime\",\
          \"documentation\":\"<p> Updates the date and time for a webhook. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Describes a webhook that connects repository events to an Amplify app. </p>\"\
    },\
    \"WebhookArn\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"WebhookId\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"WebhookUrl\":{\
      \"type\":\"string\",\
      \"max\":1000\
    },\
    \"Webhooks\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Webhook\"}\
    }\
  },\
  \"documentation\":\"<p> Welcome to the AWS Amplify API documentation. This reference provides descriptions of the actions and data types for the Amplify API.</p> <p>Amplify enables developers to develop and deploy cloud-powered mobile and web apps. The Amplify Console provides a continuous delivery and hosting service for web applications. For more information, see the <a href=\\\"https://docs.aws.amazon.com/amplify/latest/userguide/welcome.html\\\">Amplify Console User Guide</a>. The Amplify Framework is a comprehensive set of SDKs, libraries, tools, and documentation for client app development. For more information, see the <a href=\\\"https://aws-amplify.github.io/docs/\\\">Amplify Framework.</a> </p>\"\
}\
";
}

@end
