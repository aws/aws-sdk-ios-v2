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

#import "AWSQuicksightResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSQuicksightResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSQuicksightResources

+ (instancetype)sharedInstance {
    static AWSQuicksightResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSQuicksightResources new];
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
    \"apiVersion\":\"2018-04-01\",\
    \"endpointPrefix\":\"quicksight\",\
    \"jsonVersion\":\"1.0\",\
    \"protocol\":\"rest-json\",\
    \"serviceFullName\":\"Amazon QuickSight\",\
    \"serviceId\":\"QuickSight\",\
    \"signatureVersion\":\"v4\",\
    \"uid\":\"quicksight-2018-04-01\"\
  },\
  \"operations\":{\
    \"CancelIngestion\":{\
      \"name\":\"CancelIngestion\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sets/{DataSetId}/ingestions/{IngestionId}\"\
      },\
      \"input\":{\"shape\":\"CancelIngestionRequest\"},\
      \"output\":{\"shape\":\"CancelIngestionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Cancels an ongoing ingestion of data into SPICE.</p>\"\
    },\
    \"CreateDashboard\":{\
      \"name\":\"CreateDashboard\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/dashboards/{DashboardId}\"\
      },\
      \"input\":{\"shape\":\"CreateDashboardRequest\"},\
      \"output\":{\"shape\":\"CreateDashboardResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a dashboard from a template. To first create a template, see the CreateTemplate API operation.</p> <p>A dashboard is an entity in QuickSight that identifies QuickSight reports, created from analyses. You can share QuickSight dashboards. With the right permissions, you can create scheduled email reports from them. The <code>CreateDashboard</code>, <code>DescribeDashboard</code>, and <code>ListDashboardsByUser</code> API operations act on the dashboard entity. If you have the correct permissions, you can create a dashboard from a template that exists in a different AWS account.</p>\"\
    },\
    \"CreateDataSet\":{\
      \"name\":\"CreateDataSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sets\"\
      },\
      \"input\":{\"shape\":\"CreateDataSetRequest\"},\
      \"output\":{\"shape\":\"CreateDataSetResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a dataset.</p>\"\
    },\
    \"CreateDataSource\":{\
      \"name\":\"CreateDataSource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sources\"\
      },\
      \"input\":{\"shape\":\"CreateDataSourceRequest\"},\
      \"output\":{\"shape\":\"CreateDataSourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a data source.</p>\"\
    },\
    \"CreateGroup\":{\
      \"name\":\"CreateGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/groups\"\
      },\
      \"input\":{\"shape\":\"CreateGroupRequest\"},\
      \"output\":{\"shape\":\"CreateGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"PreconditionNotMetException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates an Amazon QuickSight group.</p> <p>The permissions resource is <code>arn:aws:quicksight:us-east-1:<i>&lt;relevant-aws-account-id&gt;</i>:group/default/<i>&lt;group-name&gt;</i> </code>.</p> <p>The response is a group object.</p>\"\
    },\
    \"CreateGroupMembership\":{\
      \"name\":\"CreateGroupMembership\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}/members/{MemberName}\"\
      },\
      \"input\":{\"shape\":\"CreateGroupMembershipRequest\"},\
      \"output\":{\"shape\":\"CreateGroupMembershipResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"PreconditionNotMetException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Adds an Amazon QuickSight user to an Amazon QuickSight group. </p>\"\
    },\
    \"CreateIAMPolicyAssignment\":{\
      \"name\":\"CreateIAMPolicyAssignment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/iam-policy-assignments/\"\
      },\
      \"input\":{\"shape\":\"CreateIAMPolicyAssignmentRequest\"},\
      \"output\":{\"shape\":\"CreateIAMPolicyAssignmentResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ConcurrentUpdatingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates an assignment with one specified IAM policy, identified by its Amazon Resource Name (ARN). This policy will be assigned to specified groups or users of Amazon QuickSight. The users and groups need to be in the same namespace. </p>\"\
    },\
    \"CreateIngestion\":{\
      \"name\":\"CreateIngestion\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sets/{DataSetId}/ingestions/{IngestionId}\"\
      },\
      \"input\":{\"shape\":\"CreateIngestionRequest\"},\
      \"output\":{\"shape\":\"CreateIngestionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates and starts a new SPICE ingestion on a dataset</p> <p>Any ingestions operating on tagged datasets inherit the same tags automatically for use in access control. For an example, see <a href=\\\"https://aws.amazon.com/premiumsupport/knowledge-center/iam-ec2-resource-tags/\\\">How do I create an IAM policy to control access to Amazon EC2 resources using tags?</a> in the AWS Knowledge Center. Tags are visible on the tagged dataset, but not on the ingestion resource.</p>\"\
    },\
    \"CreateTemplate\":{\
      \"name\":\"CreateTemplate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/templates/{TemplateId}\"\
      },\
      \"input\":{\"shape\":\"CreateTemplateRequest\"},\
      \"output\":{\"shape\":\"CreateTemplateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a template from an existing QuickSight analysis or template. You can use the resulting template to create a dashboard.</p> <p>A <i>template</i> is an entity in QuickSight that encapsulates the metadata required to create an analysis and that you can use to create s dashboard. A template adds a layer of abstraction by using placeholders to replace the dataset associated with the analysis. You can use templates to create dashboards by replacing dataset placeholders with datasets that follow the same schema that was used to create the source analysis and template.</p>\"\
    },\
    \"CreateTemplateAlias\":{\
      \"name\":\"CreateTemplateAlias\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/templates/{TemplateId}/aliases/{AliasName}\"\
      },\
      \"input\":{\"shape\":\"CreateTemplateAliasRequest\"},\
      \"output\":{\"shape\":\"CreateTemplateAliasResponse\"},\
      \"errors\":[\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a template alias for a template.</p>\"\
    },\
    \"DeleteDashboard\":{\
      \"name\":\"DeleteDashboard\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/dashboards/{DashboardId}\"\
      },\
      \"input\":{\"shape\":\"DeleteDashboardRequest\"},\
      \"output\":{\"shape\":\"DeleteDashboardResponse\"},\
      \"errors\":[\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a dashboard.</p>\"\
    },\
    \"DeleteDataSet\":{\
      \"name\":\"DeleteDataSet\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sets/{DataSetId}\"\
      },\
      \"input\":{\"shape\":\"DeleteDataSetRequest\"},\
      \"output\":{\"shape\":\"DeleteDataSetResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a dataset.</p>\"\
    },\
    \"DeleteDataSource\":{\
      \"name\":\"DeleteDataSource\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sources/{DataSourceId}\"\
      },\
      \"input\":{\"shape\":\"DeleteDataSourceRequest\"},\
      \"output\":{\"shape\":\"DeleteDataSourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes the data source permanently. This action breaks all the datasets that reference the deleted data source.</p>\"\
    },\
    \"DeleteGroup\":{\
      \"name\":\"DeleteGroup\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}\"\
      },\
      \"input\":{\"shape\":\"DeleteGroupRequest\"},\
      \"output\":{\"shape\":\"DeleteGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"PreconditionNotMetException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Removes a user group from Amazon QuickSight. </p>\"\
    },\
    \"DeleteGroupMembership\":{\
      \"name\":\"DeleteGroupMembership\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}/members/{MemberName}\"\
      },\
      \"input\":{\"shape\":\"DeleteGroupMembershipRequest\"},\
      \"output\":{\"shape\":\"DeleteGroupMembershipResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"PreconditionNotMetException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Removes a user from a group so that the user is no longer a member of the group.</p>\"\
    },\
    \"DeleteIAMPolicyAssignment\":{\
      \"name\":\"DeleteIAMPolicyAssignment\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespace/{Namespace}/iam-policy-assignments/{AssignmentName}\"\
      },\
      \"input\":{\"shape\":\"DeleteIAMPolicyAssignmentRequest\"},\
      \"output\":{\"shape\":\"DeleteIAMPolicyAssignmentResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ConcurrentUpdatingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes an existing IAM policy assignment.</p>\"\
    },\
    \"DeleteTemplate\":{\
      \"name\":\"DeleteTemplate\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/templates/{TemplateId}\"\
      },\
      \"input\":{\"shape\":\"DeleteTemplateRequest\"},\
      \"output\":{\"shape\":\"DeleteTemplateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a template.</p>\"\
    },\
    \"DeleteTemplateAlias\":{\
      \"name\":\"DeleteTemplateAlias\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/templates/{TemplateId}/aliases/{AliasName}\"\
      },\
      \"input\":{\"shape\":\"DeleteTemplateAliasRequest\"},\
      \"output\":{\"shape\":\"DeleteTemplateAliasResponse\"},\
      \"errors\":[\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes the item that the specified template alias points to. If you provide a specific alias, you delete the version of the template that the alias points to.</p>\"\
    },\
    \"DeleteUser\":{\
      \"name\":\"DeleteUser\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}\"\
      },\
      \"input\":{\"shape\":\"DeleteUserRequest\"},\
      \"output\":{\"shape\":\"DeleteUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the Amazon QuickSight user that is associated with the identity of the AWS Identity and Access Management (IAM) user or role that's making the call. The IAM user isn't deleted as a result of this call. </p>\"\
    },\
    \"DeleteUserByPrincipalId\":{\
      \"name\":\"DeleteUserByPrincipalId\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/user-principals/{PrincipalId}\"\
      },\
      \"input\":{\"shape\":\"DeleteUserByPrincipalIdRequest\"},\
      \"output\":{\"shape\":\"DeleteUserByPrincipalIdResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes a user identified by its principal ID. </p>\"\
    },\
    \"DescribeDashboard\":{\
      \"name\":\"DescribeDashboard\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/dashboards/{DashboardId}\"\
      },\
      \"input\":{\"shape\":\"DescribeDashboardRequest\"},\
      \"output\":{\"shape\":\"DescribeDashboardResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Provides a summary for a dashboard.</p>\"\
    },\
    \"DescribeDashboardPermissions\":{\
      \"name\":\"DescribeDashboardPermissions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/dashboards/{DashboardId}/permissions\"\
      },\
      \"input\":{\"shape\":\"DescribeDashboardPermissionsRequest\"},\
      \"output\":{\"shape\":\"DescribeDashboardPermissionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Describes read and write permissions for a dashboard.</p>\"\
    },\
    \"DescribeDataSet\":{\
      \"name\":\"DescribeDataSet\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sets/{DataSetId}\"\
      },\
      \"input\":{\"shape\":\"DescribeDataSetRequest\"},\
      \"output\":{\"shape\":\"DescribeDataSetResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Describes a dataset. </p>\"\
    },\
    \"DescribeDataSetPermissions\":{\
      \"name\":\"DescribeDataSetPermissions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sets/{DataSetId}/permissions\"\
      },\
      \"input\":{\"shape\":\"DescribeDataSetPermissionsRequest\"},\
      \"output\":{\"shape\":\"DescribeDataSetPermissionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Describes the permissions on a dataset.</p> <p>The permissions resource is <code>arn:aws:quicksight:region:aws-account-id:dataset/data-set-id</code>.</p>\"\
    },\
    \"DescribeDataSource\":{\
      \"name\":\"DescribeDataSource\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sources/{DataSourceId}\"\
      },\
      \"input\":{\"shape\":\"DescribeDataSourceRequest\"},\
      \"output\":{\"shape\":\"DescribeDataSourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Describes a data source.</p>\"\
    },\
    \"DescribeDataSourcePermissions\":{\
      \"name\":\"DescribeDataSourcePermissions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sources/{DataSourceId}/permissions\"\
      },\
      \"input\":{\"shape\":\"DescribeDataSourcePermissionsRequest\"},\
      \"output\":{\"shape\":\"DescribeDataSourcePermissionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Describes the resource permissions for a data source.</p>\"\
    },\
    \"DescribeGroup\":{\
      \"name\":\"DescribeGroup\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}\"\
      },\
      \"input\":{\"shape\":\"DescribeGroupRequest\"},\
      \"output\":{\"shape\":\"DescribeGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"PreconditionNotMetException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns an Amazon QuickSight group's description and Amazon Resource Name (ARN). </p>\"\
    },\
    \"DescribeIAMPolicyAssignment\":{\
      \"name\":\"DescribeIAMPolicyAssignment\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/iam-policy-assignments/{AssignmentName}\"\
      },\
      \"input\":{\"shape\":\"DescribeIAMPolicyAssignmentRequest\"},\
      \"output\":{\"shape\":\"DescribeIAMPolicyAssignmentResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Describes an existing IAM policy assignment, as specified by the assignment name.</p>\"\
    },\
    \"DescribeIngestion\":{\
      \"name\":\"DescribeIngestion\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sets/{DataSetId}/ingestions/{IngestionId}\"\
      },\
      \"input\":{\"shape\":\"DescribeIngestionRequest\"},\
      \"output\":{\"shape\":\"DescribeIngestionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Describes a SPICE ingestion.</p>\"\
    },\
    \"DescribeTemplate\":{\
      \"name\":\"DescribeTemplate\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/templates/{TemplateId}\"\
      },\
      \"input\":{\"shape\":\"DescribeTemplateRequest\"},\
      \"output\":{\"shape\":\"DescribeTemplateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Describes a template's metadata.</p>\"\
    },\
    \"DescribeTemplateAlias\":{\
      \"name\":\"DescribeTemplateAlias\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/templates/{TemplateId}/aliases/{AliasName}\"\
      },\
      \"input\":{\"shape\":\"DescribeTemplateAliasRequest\"},\
      \"output\":{\"shape\":\"DescribeTemplateAliasResponse\"},\
      \"errors\":[\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Describes the template alias for a template.</p>\"\
    },\
    \"DescribeTemplatePermissions\":{\
      \"name\":\"DescribeTemplatePermissions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/templates/{TemplateId}/permissions\"\
      },\
      \"input\":{\"shape\":\"DescribeTemplatePermissionsRequest\"},\
      \"output\":{\"shape\":\"DescribeTemplatePermissionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Describes read and write permissions on a template.</p>\"\
    },\
    \"DescribeUser\":{\
      \"name\":\"DescribeUser\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}\"\
      },\
      \"input\":{\"shape\":\"DescribeUserRequest\"},\
      \"output\":{\"shape\":\"DescribeUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a user, given the user name. </p>\"\
    },\
    \"GetDashboardEmbedUrl\":{\
      \"name\":\"GetDashboardEmbedUrl\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/dashboards/{DashboardId}/embed-url\"\
      },\
      \"input\":{\"shape\":\"GetDashboardEmbedUrlRequest\"},\
      \"output\":{\"shape\":\"GetDashboardEmbedUrlResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"DomainNotWhitelistedException\"},\
        {\"shape\":\"QuickSightUserNotFoundException\"},\
        {\"shape\":\"IdentityTypeNotSupportedException\"},\
        {\"shape\":\"SessionLifetimeInMinutesInvalidException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Generates a server-side embeddable URL and authorization code. For this process to work properly, first configure the dashboards and user permissions. For more information, see <a href=\\\"https://docs.aws.amazon.com/quicksight/latest/user/embedding-dashboards.html\\\">Embedding Amazon QuickSight Dashboards</a> in the <i>Amazon QuickSight User Guide</i> or <a href=\\\"https://docs.aws.amazon.com/quicksight/latest/APIReference/qs-dev-embedded-dashboards.html\\\">Embedding Amazon QuickSight Dashboards</a> in the <i>Amazon QuickSight API Reference</i>.</p> <p>Currently, you can use <code>GetDashboardEmbedURL</code> only from the server, not from the userâs browser.</p>\"\
    },\
    \"ListDashboardVersions\":{\
      \"name\":\"ListDashboardVersions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/dashboards/{DashboardId}/versions\"\
      },\
      \"input\":{\"shape\":\"ListDashboardVersionsRequest\"},\
      \"output\":{\"shape\":\"ListDashboardVersionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all the versions of the dashboards in the QuickSight subscription.</p>\"\
    },\
    \"ListDashboards\":{\
      \"name\":\"ListDashboards\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/dashboards\"\
      },\
      \"input\":{\"shape\":\"ListDashboardsRequest\"},\
      \"output\":{\"shape\":\"ListDashboardsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists dashboards in an AWS account.</p>\"\
    },\
    \"ListDataSets\":{\
      \"name\":\"ListDataSets\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sets\"\
      },\
      \"input\":{\"shape\":\"ListDataSetsRequest\"},\
      \"output\":{\"shape\":\"ListDataSetsResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all of the datasets belonging to the current AWS account in an AWS Region.</p> <p>The permissions resource is <code>arn:aws:quicksight:region:aws-account-id:dataset/*</code>.</p>\"\
    },\
    \"ListDataSources\":{\
      \"name\":\"ListDataSources\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sources\"\
      },\
      \"input\":{\"shape\":\"ListDataSourcesRequest\"},\
      \"output\":{\"shape\":\"ListDataSourcesResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists data sources in current AWS Region that belong to this AWS account.</p>\"\
    },\
    \"ListGroupMemberships\":{\
      \"name\":\"ListGroupMemberships\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}/members\"\
      },\
      \"input\":{\"shape\":\"ListGroupMembershipsRequest\"},\
      \"output\":{\"shape\":\"ListGroupMembershipsResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"PreconditionNotMetException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists member users in a group.</p>\"\
    },\
    \"ListGroups\":{\
      \"name\":\"ListGroups\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/groups\"\
      },\
      \"input\":{\"shape\":\"ListGroupsRequest\"},\
      \"output\":{\"shape\":\"ListGroupsResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"PreconditionNotMetException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists all user groups in Amazon QuickSight. </p>\"\
    },\
    \"ListIAMPolicyAssignments\":{\
      \"name\":\"ListIAMPolicyAssignments\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/iam-policy-assignments\"\
      },\
      \"input\":{\"shape\":\"ListIAMPolicyAssignmentsRequest\"},\
      \"output\":{\"shape\":\"ListIAMPolicyAssignmentsResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists IAM policy assignments in the current Amazon QuickSight account.</p>\"\
    },\
    \"ListIAMPolicyAssignmentsForUser\":{\
      \"name\":\"ListIAMPolicyAssignmentsForUser\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}/iam-policy-assignments\"\
      },\
      \"input\":{\"shape\":\"ListIAMPolicyAssignmentsForUserRequest\"},\
      \"output\":{\"shape\":\"ListIAMPolicyAssignmentsForUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ConcurrentUpdatingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all the IAM policy assignments, including the Amazon Resource Names (ARNs) for the IAM policies assigned to the specified user and group or groups that the user belongs to.</p>\"\
    },\
    \"ListIngestions\":{\
      \"name\":\"ListIngestions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sets/{DataSetId}/ingestions\"\
      },\
      \"input\":{\"shape\":\"ListIngestionsRequest\"},\
      \"output\":{\"shape\":\"ListIngestionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the history of SPICE ingestions for a dataset.</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/resources/{ResourceArn}/tags\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the tags assigned to a resource.</p>\"\
    },\
    \"ListTemplateAliases\":{\
      \"name\":\"ListTemplateAliases\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/templates/{TemplateId}/aliases\"\
      },\
      \"input\":{\"shape\":\"ListTemplateAliasesRequest\"},\
      \"output\":{\"shape\":\"ListTemplateAliasesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all the aliases of a template.</p>\"\
    },\
    \"ListTemplateVersions\":{\
      \"name\":\"ListTemplateVersions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/templates/{TemplateId}/versions\"\
      },\
      \"input\":{\"shape\":\"ListTemplateVersionsRequest\"},\
      \"output\":{\"shape\":\"ListTemplateVersionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all the versions of the templates in the current Amazon QuickSight account.</p>\"\
    },\
    \"ListTemplates\":{\
      \"name\":\"ListTemplates\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/templates\"\
      },\
      \"input\":{\"shape\":\"ListTemplatesRequest\"},\
      \"output\":{\"shape\":\"ListTemplatesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all the templates in the current Amazon QuickSight account.</p>\"\
    },\
    \"ListUserGroups\":{\
      \"name\":\"ListUserGroups\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}/groups\"\
      },\
      \"input\":{\"shape\":\"ListUserGroupsRequest\"},\
      \"output\":{\"shape\":\"ListUserGroupsResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the Amazon QuickSight groups that an Amazon QuickSight user is a member of.</p>\"\
    },\
    \"ListUsers\":{\
      \"name\":\"ListUsers\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/users\"\
      },\
      \"input\":{\"shape\":\"ListUsersRequest\"},\
      \"output\":{\"shape\":\"ListUsersResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of all of the Amazon QuickSight users belonging to this account. </p>\"\
    },\
    \"RegisterUser\":{\
      \"name\":\"RegisterUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/users\"\
      },\
      \"input\":{\"shape\":\"RegisterUserRequest\"},\
      \"output\":{\"shape\":\"RegisterUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"PreconditionNotMetException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates an Amazon QuickSight user, whose identity is associated with the AWS Identity and Access Management (IAM) identity or role specified in the request. </p>\"\
    },\
    \"SearchDashboards\":{\
      \"name\":\"SearchDashboards\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/search/dashboards\"\
      },\
      \"input\":{\"shape\":\"SearchDashboardsRequest\"},\
      \"output\":{\"shape\":\"SearchDashboardsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Searchs for dashboards that belong to a user. </p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/resources/{ResourceArn}/tags\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"output\":{\"shape\":\"TagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Assigns one or more tags (key-value pairs) to the specified QuickSight resource. </p> <p>Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only resources with certain tag values. You can use the <code>TagResource</code> operation with a resource that already has tags. If you specify a new tag key for the resource, this tag is appended to the list of tags associated with the resource. If you specify a tag key that is already associated with the resource, the new tag value that you specify replaces the previous value for that tag.</p> <p>You can associate as many as 50 tags with a resource. QuickSight supports tagging on data set, data source, dashboard, and template. </p> <p>Tagging for QuickSight works in a similar way to tagging for other AWS services, except for the following:</p> <ul> <li> <p>You can't use tags to track AWS costs for QuickSight. This restriction is because QuickSight costs are based on users and SPICE capacity, which aren't taggable resources.</p> </li> <li> <p>QuickSight doesn't currently support the Tag Editor for AWS Resource Groups.</p> </li> </ul>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/resources/{ResourceArn}/tags\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"output\":{\"shape\":\"UntagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Removes a tag or tags from a resource.</p>\"\
    },\
    \"UpdateDashboard\":{\
      \"name\":\"UpdateDashboard\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/dashboards/{DashboardId}\"\
      },\
      \"input\":{\"shape\":\"UpdateDashboardRequest\"},\
      \"output\":{\"shape\":\"UpdateDashboardResponse\"},\
      \"errors\":[\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates a dashboard in an AWS account.</p>\"\
    },\
    \"UpdateDashboardPermissions\":{\
      \"name\":\"UpdateDashboardPermissions\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/dashboards/{DashboardId}/permissions\"\
      },\
      \"input\":{\"shape\":\"UpdateDashboardPermissionsRequest\"},\
      \"output\":{\"shape\":\"UpdateDashboardPermissionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates read and write permissions on a dashboard.</p>\"\
    },\
    \"UpdateDashboardPublishedVersion\":{\
      \"name\":\"UpdateDashboardPublishedVersion\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/dashboards/{DashboardId}/versions/{VersionNumber}\"\
      },\
      \"input\":{\"shape\":\"UpdateDashboardPublishedVersionRequest\"},\
      \"output\":{\"shape\":\"UpdateDashboardPublishedVersionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates the published version of a dashboard.</p>\"\
    },\
    \"UpdateDataSet\":{\
      \"name\":\"UpdateDataSet\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sets/{DataSetId}\"\
      },\
      \"input\":{\"shape\":\"UpdateDataSetRequest\"},\
      \"output\":{\"shape\":\"UpdateDataSetResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates a dataset.</p>\"\
    },\
    \"UpdateDataSetPermissions\":{\
      \"name\":\"UpdateDataSetPermissions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sets/{DataSetId}/permissions\"\
      },\
      \"input\":{\"shape\":\"UpdateDataSetPermissionsRequest\"},\
      \"output\":{\"shape\":\"UpdateDataSetPermissionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates the permissions on a dataset.</p> <p>The permissions resource is <code>arn:aws:quicksight:region:aws-account-id:dataset/data-set-id</code>.</p>\"\
    },\
    \"UpdateDataSource\":{\
      \"name\":\"UpdateDataSource\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sources/{DataSourceId}\"\
      },\
      \"input\":{\"shape\":\"UpdateDataSourceRequest\"},\
      \"output\":{\"shape\":\"UpdateDataSourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates a data source.</p>\"\
    },\
    \"UpdateDataSourcePermissions\":{\
      \"name\":\"UpdateDataSourcePermissions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/data-sources/{DataSourceId}/permissions\"\
      },\
      \"input\":{\"shape\":\"UpdateDataSourcePermissionsRequest\"},\
      \"output\":{\"shape\":\"UpdateDataSourcePermissionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates the permissions to a data source.</p>\"\
    },\
    \"UpdateGroup\":{\
      \"name\":\"UpdateGroup\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}\"\
      },\
      \"input\":{\"shape\":\"UpdateGroupRequest\"},\
      \"output\":{\"shape\":\"UpdateGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"PreconditionNotMetException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Changes a group description. </p>\"\
    },\
    \"UpdateIAMPolicyAssignment\":{\
      \"name\":\"UpdateIAMPolicyAssignment\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/iam-policy-assignments/{AssignmentName}\"\
      },\
      \"input\":{\"shape\":\"UpdateIAMPolicyAssignmentRequest\"},\
      \"output\":{\"shape\":\"UpdateIAMPolicyAssignmentResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ConcurrentUpdatingException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates an existing IAM policy assignment. This operation updates only the optional parameter or parameters that are specified in the request.</p>\"\
    },\
    \"UpdateTemplate\":{\
      \"name\":\"UpdateTemplate\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/templates/{TemplateId}\"\
      },\
      \"input\":{\"shape\":\"UpdateTemplateRequest\"},\
      \"output\":{\"shape\":\"UpdateTemplateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates a template from an existing Amazon QuickSight analysis or another template.</p>\"\
    },\
    \"UpdateTemplateAlias\":{\
      \"name\":\"UpdateTemplateAlias\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/templates/{TemplateId}/aliases/{AliasName}\"\
      },\
      \"input\":{\"shape\":\"UpdateTemplateAliasRequest\"},\
      \"output\":{\"shape\":\"UpdateTemplateAliasResponse\"},\
      \"errors\":[\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates the template alias of a template.</p>\"\
    },\
    \"UpdateTemplatePermissions\":{\
      \"name\":\"UpdateTemplatePermissions\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/templates/{TemplateId}/permissions\"\
      },\
      \"input\":{\"shape\":\"UpdateTemplatePermissionsRequest\"},\
      \"output\":{\"shape\":\"UpdateTemplatePermissionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UnsupportedUserEditionException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates the resource permissions for a template.</p>\"\
    },\
    \"UpdateUser\":{\
      \"name\":\"UpdateUser\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}\"\
      },\
      \"input\":{\"shape\":\"UpdateUserRequest\"},\
      \"output\":{\"shape\":\"UpdateUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ResourceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Updates an Amazon QuickSight user.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>You don't have access to this item. The provided credentials couldn't be validated. You might not be authorized to carry out the request. Make sure that your account is authorized to use the Amazon QuickSight service, that your policies have the correct permissions, and that you are using the correct access keys.</p>\",\
      \"error\":{\"httpStatusCode\":401},\
      \"exception\":true\
    },\
    \"ActionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"},\
      \"max\":16,\
      \"min\":1\
    },\
    \"ActiveIAMPolicyAssignment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AssignmentName\":{\
          \"shape\":\"IAMPolicyAssignmentName\",\
          \"documentation\":\"<p>A name for the IAM policy assignment.</p>\"\
        },\
        \"PolicyArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The active AWS Identity and Access Management (IAM) policy assignment.</p>\"\
    },\
    \"ActiveIAMPolicyAssignmentList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ActiveIAMPolicyAssignment\"}\
    },\
    \"AdHocFilteringOption\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AvailabilityStatus\":{\
          \"shape\":\"DashboardBehavior\",\
          \"documentation\":\"<p>Availability status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Ad hoc (one-time) filtering option.</p>\"\
    },\
    \"AliasName\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"[\\\\w\\\\-]+|(\\\\$LATEST)|(\\\\$PUBLISHED)\"\
    },\
    \"AmazonElasticsearchParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\"Domain\"],\
      \"members\":{\
        \"Domain\":{\
          \"shape\":\"Domain\",\
          \"documentation\":\"<p>The Amazon Elasticsearch Service domain.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Amazon Elasticsearch Service parameters.</p>\"\
    },\
    \"Arn\":{\"type\":\"string\"},\
    \"AssignmentStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENABLED\",\
        \"DRAFT\",\
        \"DISABLED\"\
      ]\
    },\
    \"AthenaParameters\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"WorkGroup\":{\
          \"shape\":\"WorkGroup\",\
          \"documentation\":\"<p>The workgroup that Amazon Athena uses.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Amazon Athena parameters.</p>\"\
    },\
    \"AuroraParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Host\",\
        \"Port\",\
        \"Database\"\
      ],\
      \"members\":{\
        \"Host\":{\
          \"shape\":\"Host\",\
          \"documentation\":\"<p>Host.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>Port.</p>\"\
        },\
        \"Database\":{\
          \"shape\":\"Database\",\
          \"documentation\":\"<p>Database.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Amazon Aurora parameters.</p>\"\
    },\
    \"AuroraPostgreSqlParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Host\",\
        \"Port\",\
        \"Database\"\
      ],\
      \"members\":{\
        \"Host\":{\
          \"shape\":\"Host\",\
          \"documentation\":\"<p>Host.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>Port.</p>\"\
        },\
        \"Database\":{\
          \"shape\":\"Database\",\
          \"documentation\":\"<p>Database.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Amazon Aurora with PostgreSQL compatibility parameters.</p>\"\
    },\
    \"AwsAccountId\":{\
      \"type\":\"string\",\
      \"max\":12,\
      \"min\":12,\
      \"pattern\":\"^[0-9]{12}$\"\
    },\
    \"AwsIotAnalyticsParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\"DataSetName\"],\
      \"members\":{\
        \"DataSetName\":{\
          \"shape\":\"DataSetName\",\
          \"documentation\":\"<p>Dataset name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>AWS IoT Analytics parameters.</p>\"\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"CalculatedColumn\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ColumnName\",\
        \"ColumnId\",\
        \"Expression\"\
      ],\
      \"members\":{\
        \"ColumnName\":{\
          \"shape\":\"ColumnName\",\
          \"documentation\":\"<p>Column name.</p>\"\
        },\
        \"ColumnId\":{\
          \"shape\":\"ColumnId\",\
          \"documentation\":\"<p>A unique ID to identify a calculated column. During a dataset update, if the column ID of a calculated column matches that of an existing calculated column, Amazon QuickSight preserves the existing calculated column.</p>\"\
        },\
        \"Expression\":{\
          \"shape\":\"Expression\",\
          \"documentation\":\"<p>An expression that defines the calculated column.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A calculated column for a dataset.</p>\"\
    },\
    \"CalculatedColumnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CalculatedColumn\"},\
      \"max\":128,\
      \"min\":1\
    },\
    \"CancelIngestionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DataSetId\",\
        \"IngestionId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DataSetId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The ID of the dataset used in the ingestion.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DataSetId\"\
        },\
        \"IngestionId\":{\
          \"shape\":\"IngestionId\",\
          \"documentation\":\"<p>An ID for the ingestion.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IngestionId\"\
        }\
      }\
    },\
    \"CancelIngestionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the data ingestion.</p>\"\
        },\
        \"IngestionId\":{\
          \"shape\":\"IngestionId\",\
          \"documentation\":\"<p>An ID for the ingestion.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"CastColumnTypeOperation\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ColumnName\",\
        \"NewColumnType\"\
      ],\
      \"members\":{\
        \"ColumnName\":{\
          \"shape\":\"ColumnName\",\
          \"documentation\":\"<p>Column name.</p>\"\
        },\
        \"NewColumnType\":{\
          \"shape\":\"ColumnDataType\",\
          \"documentation\":\"<p>New column data type.</p>\"\
        },\
        \"Format\":{\
          \"shape\":\"TypeCastFormat\",\
          \"documentation\":\"<p>When casting a column from string to datetime type, you can supply a string in a format supported by Amazon QuickSight to denote the source data format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A transform operation that casts a column to a different type.</p>\"\
    },\
    \"Catalog\":{\
      \"type\":\"string\",\
      \"max\":128\
    },\
    \"ClusterId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"ColumnDataType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STRING\",\
        \"INTEGER\",\
        \"DECIMAL\",\
        \"DATETIME\"\
      ]\
    },\
    \"ColumnGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GeoSpatialColumnGroup\":{\
          \"shape\":\"GeoSpatialColumnGroup\",\
          \"documentation\":\"<p>Geospatial column group that denotes a hierarchy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Groupings of columns that work together in certain Amazon QuickSight features. This is a variant type structure. For this structure to be valid, only one of the attributes can be non-null.</p>\"\
    },\
    \"ColumnGroupColumnSchema\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the column group's column schema.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure describing the name, data type, and geographic role of the columns.</p>\"\
    },\
    \"ColumnGroupColumnSchemaList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ColumnGroupColumnSchema\"},\
      \"max\":500\
    },\
    \"ColumnGroupList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ColumnGroup\"},\
      \"max\":8,\
      \"min\":1\
    },\
    \"ColumnGroupName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"ColumnGroupSchema\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the column group schema.</p>\"\
        },\
        \"ColumnGroupColumnSchemaList\":{\
          \"shape\":\"ColumnGroupColumnSchemaList\",\
          \"documentation\":\"<p>A structure containing the list of schemas for column group columns.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The column group schema.</p>\"\
    },\
    \"ColumnGroupSchemaList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ColumnGroupSchema\"},\
      \"max\":500\
    },\
    \"ColumnId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"ColumnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ColumnName\"},\
      \"max\":16,\
      \"min\":1\
    },\
    \"ColumnName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"ColumnSchema\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the column schema.</p>\"\
        },\
        \"DataType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The data type of the column schema.</p>\"\
        },\
        \"GeographicRole\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The geographic role of the column schema.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The column schema.</p>\"\
    },\
    \"ColumnSchemaList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ColumnSchema\"},\
      \"max\":500\
    },\
    \"ColumnTag\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ColumnGeographicRole\":{\
          \"shape\":\"GeoSpatialDataRole\",\
          \"documentation\":\"<p>A geospatial role for a column.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A tag for a column in a <code>TagColumnOperation</code> structure. This is a variant type structure. For this structure to be valid, only one of the attributes can be non-null.</p>\"\
    },\
    \"ColumnTagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ColumnTag\"},\
      \"max\":16,\
      \"min\":1\
    },\
    \"ConcurrentUpdatingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"RequestId\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>A resource is already in a state that indicates an action is happening that must complete before a new update can be applied.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true\
    },\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Updating or deleting a resource can cause an inconsistent state.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"CreateColumnsOperation\":{\
      \"type\":\"structure\",\
      \"required\":[\"Columns\"],\
      \"members\":{\
        \"Columns\":{\
          \"shape\":\"CalculatedColumnList\",\
          \"documentation\":\"<p>Calculated columns to create.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A transform operation that creates calculated columns. Columns created in one such operation form a lexical closure.</p>\"\
    },\
    \"CreateDashboardRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DashboardId\",\
        \"Name\",\
        \"SourceEntity\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account where you want to create the dashboard.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DashboardId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the dashboard, also added to the IAM policy.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DashboardId\"\
        },\
        \"Name\":{\
          \"shape\":\"DashboardName\",\
          \"documentation\":\"<p>The display name of the dashboard.</p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"Parameters\",\
          \"documentation\":\"<p>A structure that contains the parameters of the dashboard. These are parameter overrides for a dashboard. A dashboard can have any type of parameters, and some parameters might accept multiple values. You can use the dashboard permissions structure described following to override two string parameters that accept multiple values. </p>\"\
        },\
        \"Permissions\":{\
          \"shape\":\"ResourcePermissionList\",\
          \"documentation\":\"<p>A structure that contains the permissions of the dashboard. You can use this structure for granting permissions with principal and action information.</p>\"\
        },\
        \"SourceEntity\":{\
          \"shape\":\"DashboardSourceEntity\",\
          \"documentation\":\"<p>The source entity from which the dashboard is created. The source entity accepts the Amazon Resource Name (ARN) of the source template or analysis and also references the replacement datasets for the placeholders set when creating the template. The replacement datasets need to follow the same schema as the datasets for which placeholders were created when creating the template. </p> <p>If you are creating a dashboard from a source entity in a different AWS account, use the ARN of the source template.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Contains a map of the key-value pairs for the resource tag or tags assigned to the dashboard.</p>\"\
        },\
        \"VersionDescription\":{\
          \"shape\":\"VersionDescription\",\
          \"documentation\":\"<p>A description for the first version of the dashboard being created.</p>\"\
        },\
        \"DashboardPublishOptions\":{\
          \"shape\":\"DashboardPublishOptions\",\
          \"documentation\":\"<p>Options for publishing the dashboard when you create it:</p> <ul> <li> <p> <code>AvailabilityStatus</code> for <code>AdHocFilteringOption</code> - This status can be either <code>ENABLED</code> or <code>DISABLED</code>. When this is set to <code>DISABLED</code>, QuickSight disables the left filter pane on the published dashboard, which can be used for ad hoc (one-time) filtering. This option is <code>ENABLED</code> by default. </p> </li> <li> <p> <code>AvailabilityStatus</code> for <code>ExportToCSVOption</code> - This status can be either <code>ENABLED</code> or <code>DISABLED</code>. The visual option to export data to .csv format isn't enabled when this is set to <code>DISABLED</code>. This option is <code>ENABLED</code> by default. </p> </li> <li> <p> <code>VisibilityState</code> for <code>SheetControlsOption</code> - This visibility state can be either <code>COLLAPSED</code> or <code>EXPANDED</code>. The sheet controls pane is collapsed by default when set to true. This option is <code>COLLAPSED</code> by default. </p> </li> </ul>\"\
        }\
      }\
    },\
    \"CreateDashboardResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the dashboard.</p>\"\
        },\
        \"VersionArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of the dashboard, including the version number of the first version that is created.</p>\"\
        },\
        \"DashboardId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the dashboard.</p>\"\
        },\
        \"CreationStatus\":{\
          \"shape\":\"ResourceStatus\",\
          \"documentation\":\"<p>The status of the dashboard creation request.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"CreateDataSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DataSetId\",\
        \"Name\",\
        \"PhysicalTableMap\",\
        \"ImportMode\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DataSetId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>An ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The display name for the dataset.</p>\"\
        },\
        \"PhysicalTableMap\":{\
          \"shape\":\"PhysicalTableMap\",\
          \"documentation\":\"<p>Declares the physical tables that are available in the underlying data sources.</p>\"\
        },\
        \"LogicalTableMap\":{\
          \"shape\":\"LogicalTableMap\",\
          \"documentation\":\"<p>Configures the combination and transformation of the data from the physical tables.</p>\"\
        },\
        \"ImportMode\":{\
          \"shape\":\"DataSetImportMode\",\
          \"documentation\":\"<p>Indicates whether you want to import the data into SPICE.</p>\"\
        },\
        \"ColumnGroups\":{\
          \"shape\":\"ColumnGroupList\",\
          \"documentation\":\"<p>Groupings of columns that work together in certain QuickSight features. Currently, only geospatial hierarchy is supported.</p>\"\
        },\
        \"Permissions\":{\
          \"shape\":\"ResourcePermissionList\",\
          \"documentation\":\"<p>A list of resource permissions on the dataset.</p>\"\
        },\
        \"RowLevelPermissionDataSet\":{\
          \"shape\":\"RowLevelPermissionDataSet\",\
          \"documentation\":\"<p>The row-level security configuration for the data that you want to create.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Contains a map of the key-value pairs for the resource tag or tags assigned to the dataset.</p>\"\
        }\
      }\
    },\
    \"CreateDataSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the dataset.</p>\"\
        },\
        \"DataSetId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.</p>\"\
        },\
        \"IngestionArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN for the ingestion, which is triggered as a result of dataset creation if the import mode is SPICE.</p>\"\
        },\
        \"IngestionId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the ingestion, which is triggered as a result of dataset creation if the import mode is SPICE.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"CreateDataSourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DataSourceId\",\
        \"Name\",\
        \"Type\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DataSourceId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>An ID for the data source. This ID is unique per AWS Region for each AWS account. </p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>A display name for the data source.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"DataSourceType\",\
          \"documentation\":\"<p>The type of the data source. Currently, the supported types for this operation are: <code>ATHENA, AURORA, AURORA_POSTGRESQL, MARIADB, MYSQL, POSTGRESQL, PRESTO, REDSHIFT, S3, SNOWFLAKE, SPARK, SQLSERVER, TERADATA</code>. Use <code>ListDataSources</code> to return a list of all data sources.</p>\"\
        },\
        \"DataSourceParameters\":{\
          \"shape\":\"DataSourceParameters\",\
          \"documentation\":\"<p>The parameters that QuickSight uses to connect to your underlying source.</p>\"\
        },\
        \"Credentials\":{\
          \"shape\":\"DataSourceCredentials\",\
          \"documentation\":\"<p>The credentials QuickSight that uses to connect to your underlying source. Currently, only credentials based on user name and password are supported.</p>\"\
        },\
        \"Permissions\":{\
          \"shape\":\"ResourcePermissionList\",\
          \"documentation\":\"<p>A list of resource permissions on the data source.</p>\"\
        },\
        \"VpcConnectionProperties\":{\
          \"shape\":\"VpcConnectionProperties\",\
          \"documentation\":\"<p>Use this parameter only when you want QuickSight to use a VPC connection when connecting to your underlying source.</p>\"\
        },\
        \"SslProperties\":{\
          \"shape\":\"SslProperties\",\
          \"documentation\":\"<p>Secure Socket Layer (SSL) properties that apply when QuickSight connects to your underlying source.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Contains a map of the key-value pairs for the resource tag or tags assigned to the data source.</p>\"\
        }\
      }\
    },\
    \"CreateDataSourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the data source.</p>\"\
        },\
        \"DataSourceId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>\"\
        },\
        \"CreationStatus\":{\
          \"shape\":\"ResourceStatus\",\
          \"documentation\":\"<p>The status of creating the data source.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"CreateGroupMembershipRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MemberName\",\
        \"GroupName\",\
        \"AwsAccountId\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"MemberName\":{\
          \"shape\":\"GroupMemberName\",\
          \"documentation\":\"<p>The name of the user that you want to add to the group membership.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"MemberName\"\
        },\
        \"GroupName\":{\
          \"shape\":\"GroupName\",\
          \"documentation\":\"<p>The name of the group that you want to add the user to.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"GroupName\"\
        },\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace. Currently, you should set this to <code>default</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        }\
      }\
    },\
    \"CreateGroupMembershipResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GroupMember\":{\
          \"shape\":\"GroupMember\",\
          \"documentation\":\"<p>The group member.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"CreateGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GroupName\",\
        \"AwsAccountId\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"GroupName\":{\
          \"shape\":\"GroupName\",\
          \"documentation\":\"<p>A name for the group that you want to create.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"GroupDescription\",\
          \"documentation\":\"<p>A description for the group that you want to create.</p>\"\
        },\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace. Currently, you should set this to <code>default</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        }\
      },\
      \"documentation\":\"<p>The request object for this operation. </p>\"\
    },\
    \"CreateGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Group\":{\
          \"shape\":\"Group\",\
          \"documentation\":\"<p>The name of the group.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      },\
      \"documentation\":\"<p>The response object for this operation.</p>\"\
    },\
    \"CreateIAMPolicyAssignmentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"AssignmentName\",\
        \"AssignmentStatus\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account where you want to assign an IAM policy to QuickSight users or groups.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"AssignmentName\":{\
          \"shape\":\"IAMPolicyAssignmentName\",\
          \"documentation\":\"<p>The name of the assignment. It must be unique within an AWS account.</p>\"\
        },\
        \"AssignmentStatus\":{\
          \"shape\":\"AssignmentStatus\",\
          \"documentation\":\"<p>The status of the assignment. Possible values are as follows:</p> <ul> <li> <p> <code>ENABLED</code> - Anything specified in this assignment is used when creating the data source.</p> </li> <li> <p> <code>DISABLED</code> - This assignment isn't used when creating the data source.</p> </li> <li> <p> <code>DRAFT</code> - This assignment is an unfinished draft and isn't used when creating the data source.</p> </li> </ul>\"\
        },\
        \"PolicyArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN for the IAM policy to apply to the QuickSight users and groups specified in this assignment.</p>\"\
        },\
        \"Identities\":{\
          \"shape\":\"IdentityMap\",\
          \"documentation\":\"<p>The QuickSight users, groups, or both that you want to assign the policy to.</p>\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace that contains the assignment.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        }\
      }\
    },\
    \"CreateIAMPolicyAssignmentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AssignmentName\":{\
          \"shape\":\"IAMPolicyAssignmentName\",\
          \"documentation\":\"<p>The name of the assignment. This name must be unique within the AWS account.</p>\"\
        },\
        \"AssignmentId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID for the assignment.</p>\"\
        },\
        \"AssignmentStatus\":{\
          \"shape\":\"AssignmentStatus\",\
          \"documentation\":\"<p>The status of the assignment. Possible values are as follows:</p> <ul> <li> <p> <code>ENABLED</code> - Anything specified in this assignment is used when creating the data source.</p> </li> <li> <p> <code>DISABLED</code> - This assignment isn't used when creating the data source.</p> </li> <li> <p> <code>DRAFT</code> - This assignment is an unfinished draft and isn't used when creating the data source.</p> </li> </ul>\"\
        },\
        \"PolicyArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN for the IAM policy that is applied to the QuickSight users and groups specified in this assignment.</p>\"\
        },\
        \"Identities\":{\
          \"shape\":\"IdentityMap\",\
          \"documentation\":\"<p>The QuickSight users, groups, or both that the IAM policy is assigned to.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"CreateIngestionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DataSetId\",\
        \"IngestionId\",\
        \"AwsAccountId\"\
      ],\
      \"members\":{\
        \"DataSetId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The ID of the dataset used in the ingestion.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DataSetId\"\
        },\
        \"IngestionId\":{\
          \"shape\":\"IngestionId\",\
          \"documentation\":\"<p>An ID for the ingestion.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IngestionId\"\
        },\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        }\
      }\
    },\
    \"CreateIngestionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the data ingestion.</p>\"\
        },\
        \"IngestionId\":{\
          \"shape\":\"IngestionId\",\
          \"documentation\":\"<p>An ID for the ingestion.</p>\"\
        },\
        \"IngestionStatus\":{\
          \"shape\":\"IngestionStatus\",\
          \"documentation\":\"<p>The ingestion status.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"CreateTemplateAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"TemplateId\",\
        \"AliasName\",\
        \"TemplateVersionNumber\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the template that you creating an alias for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>An ID for the template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TemplateId\"\
        },\
        \"AliasName\":{\
          \"shape\":\"AliasName\",\
          \"documentation\":\"<p>The name that you want to give to the template alias that you're creating. Don't start the alias name with the <code>$</code> character. Alias names that start with <code>$</code> are reserved by QuickSight. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AliasName\"\
        },\
        \"TemplateVersionNumber\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>The version number of the template.</p>\"\
        }\
      }\
    },\
    \"CreateTemplateAliasResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateAlias\":{\
          \"shape\":\"TemplateAlias\",\
          \"documentation\":\"<p>Information about the template alias.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"CreateTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"TemplateId\",\
        \"SourceEntity\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>An ID for the template that you want to create. This template is unique per AWS Region in each AWS account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TemplateId\"\
        },\
        \"Name\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>A display name for the template.</p>\"\
        },\
        \"Permissions\":{\
          \"shape\":\"ResourcePermissionList\",\
          \"documentation\":\"<p>A list of resource permissions to be set on the template. </p>\"\
        },\
        \"SourceEntity\":{\
          \"shape\":\"TemplateSourceEntity\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the source entity from which this template is being created. Currently, you can create a template from an analysis or another template. If the ARN is for an analysis, include its dataset references. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Contains a map of the key-value pairs for the resource tag or tags assigned to the resource.</p>\"\
        },\
        \"VersionDescription\":{\
          \"shape\":\"VersionDescription\",\
          \"documentation\":\"<p>A description of the current template version being created. This API operation creates the first version of the template. Every time <code>UpdateTemplate</code> is called, a new version is created. Each version of the template maintains a description of the version in the <code>VersionDescription</code> field.</p>\"\
        }\
      }\
    },\
    \"CreateTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN for the template.</p>\"\
        },\
        \"VersionArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN for the template, including the version information of the first version.</p>\"\
        },\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID of the template.</p>\"\
        },\
        \"CreationStatus\":{\
          \"shape\":\"ResourceStatus\",\
          \"documentation\":\"<p>The template creation status.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"CredentialPair\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Username\",\
        \"Password\"\
      ],\
      \"members\":{\
        \"Username\":{\
          \"shape\":\"Username\",\
          \"documentation\":\"<p>User name.</p>\"\
        },\
        \"Password\":{\
          \"shape\":\"Password\",\
          \"documentation\":\"<p>Password.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The combination of user name and password that are used as credentials.</p>\"\
    },\
    \"CustomSql\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DataSourceArn\",\
        \"Name\",\
        \"SqlQuery\"\
      ],\
      \"members\":{\
        \"DataSourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the data source.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"CustomSqlName\",\
          \"documentation\":\"<p>A display name for the SQL query result.</p>\"\
        },\
        \"SqlQuery\":{\
          \"shape\":\"SqlQuery\",\
          \"documentation\":\"<p>The SQL query.</p>\"\
        },\
        \"Columns\":{\
          \"shape\":\"InputColumnList\",\
          \"documentation\":\"<p>The column schema from the SQL query result set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A physical table type built from the results of the custom SQL query.</p>\"\
    },\
    \"CustomSqlName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"Dashboard\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DashboardId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>Dashboard ID.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"DashboardName\",\
          \"documentation\":\"<p>A display name for the dashboard.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"DashboardVersion\",\
          \"documentation\":\"<p>Version.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that this dataset was created.</p>\"\
        },\
        \"LastPublishedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The last time that this dataset was published.</p>\"\
        },\
        \"LastUpdatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The last time that this dataset was updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Dashboard.</p>\"\
    },\
    \"DashboardBehavior\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENABLED\",\
        \"DISABLED\"\
      ]\
    },\
    \"DashboardError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"DashboardErrorType\",\
          \"documentation\":\"<p>Type.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Dashboard error.</p>\"\
    },\
    \"DashboardErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DashboardError\"},\
      \"min\":1\
    },\
    \"DashboardErrorType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACCESS_DENIED\",\
        \"SOURCE_NOT_FOUND\",\
        \"DATA_SET_NOT_FOUND\",\
        \"INTERNAL_FAILURE\",\
        \"PARAMETER_VALUE_INCOMPATIBLE\",\
        \"PARAMETER_TYPE_INVALID\",\
        \"PARAMETER_NOT_FOUND\",\
        \"COLUMN_TYPE_MISMATCH\",\
        \"COLUMN_GEOGRAPHIC_ROLE_MISMATCH\",\
        \"COLUMN_REPLACEMENT_MISSING\"\
      ]\
    },\
    \"DashboardFilterAttribute\":{\
      \"type\":\"string\",\
      \"enum\":[\"QUICKSIGHT_USER\"]\
    },\
    \"DashboardName\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\u00FF]+\"\
    },\
    \"DashboardPublishOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AdHocFilteringOption\":{\
          \"shape\":\"AdHocFilteringOption\",\
          \"documentation\":\"<p>Ad hoc (one-time) filtering option.</p>\"\
        },\
        \"ExportToCSVOption\":{\
          \"shape\":\"ExportToCSVOption\",\
          \"documentation\":\"<p>Export to .csv option.</p>\"\
        },\
        \"SheetControlsOption\":{\
          \"shape\":\"SheetControlsOption\",\
          \"documentation\":\"<p>Sheet controls option.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Dashboard publish options.</p>\"\
    },\
    \"DashboardSearchFilter\":{\
      \"type\":\"structure\",\
      \"required\":[\"Operator\"],\
      \"members\":{\
        \"Operator\":{\
          \"shape\":\"FilterOperator\",\
          \"documentation\":\"<p>The comparison operator that you want to use as a filter. For example, <code>\\\"Operator\\\": \\\"StringEquals\\\"</code>.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"DashboardFilterAttribute\",\
          \"documentation\":\"<p>The name of the value that you want to use as a filter. For example, <code>\\\"Name\\\": \\\"QUICKSIGHT_USER\\\"</code>. </p>\"\
        },\
        \"Value\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The value of the named item, in this case <code>QUICKSIGHT_USER</code>, that you want to use as a filter. For example, <code>\\\"Value\\\": \\\"arn:aws:quicksight:us-east-1:1:user/default/UserName1\\\"</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A filter that you apply when searching for dashboards. </p>\"\
    },\
    \"DashboardSearchFilterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DashboardSearchFilter\"},\
      \"max\":1\
    },\
    \"DashboardSourceEntity\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SourceTemplate\":{\
          \"shape\":\"DashboardSourceTemplate\",\
          \"documentation\":\"<p>Source template.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Dashboard source entity.</p>\"\
    },\
    \"DashboardSourceTemplate\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DataSetReferences\",\
        \"Arn\"\
      ],\
      \"members\":{\
        \"DataSetReferences\":{\
          \"shape\":\"DataSetReferenceList\",\
          \"documentation\":\"<p>Dataset references.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Dashboard source template.</p>\"\
    },\
    \"DashboardSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        },\
        \"DashboardId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>Dashboard ID.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"DashboardName\",\
          \"documentation\":\"<p>A display name for the dashboard.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that this dashboard was created.</p>\"\
        },\
        \"LastUpdatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The last time that this dashboard was updated.</p>\"\
        },\
        \"PublishedVersionNumber\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>Published version number.</p>\"\
        },\
        \"LastPublishedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The last time that this dashboard was published.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Dashboard summary.</p>\"\
    },\
    \"DashboardSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DashboardSummary\"},\
      \"max\":100\
    },\
    \"DashboardUIState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"EXPANDED\",\
        \"COLLAPSED\"\
      ]\
    },\
    \"DashboardVersion\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that this dashboard version was created.</p>\"\
        },\
        \"Errors\":{\
          \"shape\":\"DashboardErrorList\",\
          \"documentation\":\"<p>Errors.</p>\"\
        },\
        \"VersionNumber\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>Version number.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ResourceStatus\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        },\
        \"SourceEntityArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>Source entity ARN.</p>\"\
        },\
        \"DataSetArns\":{\
          \"shape\":\"DataSetArnsList\",\
          \"documentation\":\"<p>The Amazon Resource Numbers (ARNs) for the datasets that are associated with a version of the dashboard.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"VersionDescription\",\
          \"documentation\":\"<p>Description.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Dashboard version.</p>\"\
    },\
    \"DashboardVersionSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that this dashboard version was created.</p>\"\
        },\
        \"VersionNumber\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>Version number.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ResourceStatus\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\"\
        },\
        \"SourceEntityArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>Source entity ARN.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"VersionDescription\",\
          \"documentation\":\"<p>Description.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Dashboard version summary.</p>\"\
    },\
    \"DashboardVersionSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DashboardVersionSummary\"},\
      \"max\":100\
    },\
    \"DataSet\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        },\
        \"DataSetId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the dataset.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>A display name for the dataset.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that this dataset was created.</p>\"\
        },\
        \"LastUpdatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The last time that this dataset was updated.</p>\"\
        },\
        \"PhysicalTableMap\":{\
          \"shape\":\"PhysicalTableMap\",\
          \"documentation\":\"<p>Declares the physical tables that are available in the underlying data sources.</p>\"\
        },\
        \"LogicalTableMap\":{\
          \"shape\":\"LogicalTableMap\",\
          \"documentation\":\"<p>Configures the combination and transformation of the data from the physical tables.</p>\"\
        },\
        \"OutputColumns\":{\
          \"shape\":\"OutputColumnList\",\
          \"documentation\":\"<p>The list of columns after all transforms. These columns are available in templates, analyses, and dashboards.</p>\"\
        },\
        \"ImportMode\":{\
          \"shape\":\"DataSetImportMode\",\
          \"documentation\":\"<p>Indicates whether you want to import the data into SPICE.</p>\"\
        },\
        \"ConsumedSpiceCapacityInBytes\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The amount of SPICE capacity used by this dataset. This is 0 if the dataset isn't imported into SPICE.</p>\"\
        },\
        \"ColumnGroups\":{\
          \"shape\":\"ColumnGroupList\",\
          \"documentation\":\"<p>Groupings of columns that work together in certain Amazon QuickSight features. Currently, only geospatial hierarchy is supported.</p>\"\
        },\
        \"RowLevelPermissionDataSet\":{\
          \"shape\":\"RowLevelPermissionDataSet\",\
          \"documentation\":\"<p>The row-level security configuration for the dataset.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Dataset.</p>\"\
    },\
    \"DataSetArnsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Arn\"},\
      \"max\":100\
    },\
    \"DataSetConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Placeholder\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Placeholder.</p>\"\
        },\
        \"DataSetSchema\":{\
          \"shape\":\"DataSetSchema\",\
          \"documentation\":\"<p>Dataset schema.</p>\"\
        },\
        \"ColumnGroupSchemaList\":{\
          \"shape\":\"ColumnGroupSchemaList\",\
          \"documentation\":\"<p>A structure containing the list of column group schemas.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Dataset configuration.</p>\"\
    },\
    \"DataSetConfigurationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DataSetConfiguration\"},\
      \"max\":30\
    },\
    \"DataSetImportMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SPICE\",\
        \"DIRECT_QUERY\"\
      ]\
    },\
    \"DataSetName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"DataSetReference\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DataSetPlaceholder\",\
        \"DataSetArn\"\
      ],\
      \"members\":{\
        \"DataSetPlaceholder\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Dataset placeholder.</p>\"\
        },\
        \"DataSetArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>Dataset Amazon Resource Name (ARN).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Dataset reference.</p>\"\
    },\
    \"DataSetReferenceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DataSetReference\"},\
      \"min\":1\
    },\
    \"DataSetSchema\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ColumnSchemaList\":{\
          \"shape\":\"ColumnSchemaList\",\
          \"documentation\":\"<p>A structure containing the list of column schemas.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Dataset schema.</p>\"\
    },\
    \"DataSetSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the dataset.</p>\"\
        },\
        \"DataSetId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the dataset.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>A display name for the dataset.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that this dataset was created.</p>\"\
        },\
        \"LastUpdatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The last time that this dataset was updated.</p>\"\
        },\
        \"ImportMode\":{\
          \"shape\":\"DataSetImportMode\",\
          \"documentation\":\"<p>Indicates whether you want to import the data into SPICE.</p>\"\
        },\
        \"RowLevelPermissionDataSet\":{\
          \"shape\":\"RowLevelPermissionDataSet\",\
          \"documentation\":\"<p>The row-level security configuration for the dataset.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Dataset summary.</p>\"\
    },\
    \"DataSetSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DataSetSummary\"}\
    },\
    \"DataSource\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the data source.</p>\"\
        },\
        \"DataSourceId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>A display name for the data source.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"DataSourceType\",\
          \"documentation\":\"<p>The type of the data source. This type indicates which database engine the data source connects to.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ResourceStatus\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that this data source was created.</p>\"\
        },\
        \"LastUpdatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The last time that this data source was updated.</p>\"\
        },\
        \"DataSourceParameters\":{\
          \"shape\":\"DataSourceParameters\",\
          \"documentation\":\"<p>The parameters that Amazon QuickSight uses to connect to your underlying source. This is a variant type structure. For this structure to be valid, only one of the attributes can be non-null.</p>\"\
        },\
        \"VpcConnectionProperties\":{\
          \"shape\":\"VpcConnectionProperties\",\
          \"documentation\":\"<p>The VPC connection information. You need to use this parameter only when you want QuickSight to use a VPC connection when connecting to your underlying source.</p>\"\
        },\
        \"SslProperties\":{\
          \"shape\":\"SslProperties\",\
          \"documentation\":\"<p>Secure Socket Layer (SSL) properties that apply when QuickSight connects to your underlying source.</p>\"\
        },\
        \"ErrorInfo\":{\
          \"shape\":\"DataSourceErrorInfo\",\
          \"documentation\":\"<p>Error information from the last update or the creation of the data source.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The structure of a data source.</p>\"\
    },\
    \"DataSourceCredentials\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CredentialPair\":{\
          \"shape\":\"CredentialPair\",\
          \"documentation\":\"<p>Credential pair.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Data source credentials.</p>\",\
      \"sensitive\":true\
    },\
    \"DataSourceErrorInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"DataSourceErrorInfoType\",\
          \"documentation\":\"<p>Error type.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Error message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Error information for the data source creation or update.</p>\"\
    },\
    \"DataSourceErrorInfoType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TIMEOUT\",\
        \"ENGINE_VERSION_NOT_SUPPORTED\",\
        \"UNKNOWN_HOST\",\
        \"GENERIC_SQL_FAILURE\",\
        \"CONFLICT\",\
        \"UNKNOWN\"\
      ]\
    },\
    \"DataSourceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DataSource\"}\
    },\
    \"DataSourceParameters\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AmazonElasticsearchParameters\":{\
          \"shape\":\"AmazonElasticsearchParameters\",\
          \"documentation\":\"<p>Amazon Elasticsearch Service parameters.</p>\"\
        },\
        \"AthenaParameters\":{\
          \"shape\":\"AthenaParameters\",\
          \"documentation\":\"<p>Amazon Athena parameters.</p>\"\
        },\
        \"AuroraParameters\":{\
          \"shape\":\"AuroraParameters\",\
          \"documentation\":\"<p>Amazon Aurora MySQL parameters.</p>\"\
        },\
        \"AuroraPostgreSqlParameters\":{\
          \"shape\":\"AuroraPostgreSqlParameters\",\
          \"documentation\":\"<p>Aurora PostgreSQL parameters.</p>\"\
        },\
        \"AwsIotAnalyticsParameters\":{\
          \"shape\":\"AwsIotAnalyticsParameters\",\
          \"documentation\":\"<p>AWS IoT Analytics parameters.</p>\"\
        },\
        \"JiraParameters\":{\
          \"shape\":\"JiraParameters\",\
          \"documentation\":\"<p>Jira parameters.</p>\"\
        },\
        \"MariaDbParameters\":{\
          \"shape\":\"MariaDbParameters\",\
          \"documentation\":\"<p>MariaDB parameters.</p>\"\
        },\
        \"MySqlParameters\":{\
          \"shape\":\"MySqlParameters\",\
          \"documentation\":\"<p>MySQL parameters.</p>\"\
        },\
        \"PostgreSqlParameters\":{\
          \"shape\":\"PostgreSqlParameters\",\
          \"documentation\":\"<p>PostgreSQL parameters.</p>\"\
        },\
        \"PrestoParameters\":{\
          \"shape\":\"PrestoParameters\",\
          \"documentation\":\"<p>Presto parameters.</p>\"\
        },\
        \"RdsParameters\":{\
          \"shape\":\"RdsParameters\",\
          \"documentation\":\"<p>Amazon RDS parameters.</p>\"\
        },\
        \"RedshiftParameters\":{\
          \"shape\":\"RedshiftParameters\",\
          \"documentation\":\"<p>Amazon Redshift parameters.</p>\"\
        },\
        \"S3Parameters\":{\
          \"shape\":\"S3Parameters\",\
          \"documentation\":\"<p>S3 parameters.</p>\"\
        },\
        \"ServiceNowParameters\":{\
          \"shape\":\"ServiceNowParameters\",\
          \"documentation\":\"<p>ServiceNow parameters.</p>\"\
        },\
        \"SnowflakeParameters\":{\
          \"shape\":\"SnowflakeParameters\",\
          \"documentation\":\"<p>Snowflake parameters.</p>\"\
        },\
        \"SparkParameters\":{\
          \"shape\":\"SparkParameters\",\
          \"documentation\":\"<p>Spark parameters.</p>\"\
        },\
        \"SqlServerParameters\":{\
          \"shape\":\"SqlServerParameters\",\
          \"documentation\":\"<p>SQL Server parameters.</p>\"\
        },\
        \"TeradataParameters\":{\
          \"shape\":\"TeradataParameters\",\
          \"documentation\":\"<p>Teradata parameters.</p>\"\
        },\
        \"TwitterParameters\":{\
          \"shape\":\"TwitterParameters\",\
          \"documentation\":\"<p>Twitter parameters.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The parameters that Amazon QuickSight uses to connect to your underlying data source. This is a variant type structure. For this structure to be valid, only one of the attributes can be non-null.</p>\"\
    },\
    \"DataSourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ADOBE_ANALYTICS\",\
        \"AMAZON_ELASTICSEARCH\",\
        \"ATHENA\",\
        \"AURORA\",\
        \"AURORA_POSTGRESQL\",\
        \"AWS_IOT_ANALYTICS\",\
        \"GITHUB\",\
        \"JIRA\",\
        \"MARIADB\",\
        \"MYSQL\",\
        \"POSTGRESQL\",\
        \"PRESTO\",\
        \"REDSHIFT\",\
        \"S3\",\
        \"SALESFORCE\",\
        \"SERVICENOW\",\
        \"SNOWFLAKE\",\
        \"SPARK\",\
        \"SQLSERVER\",\
        \"TERADATA\",\
        \"TWITTER\"\
      ]\
    },\
    \"Database\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"DateTimeParameter\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Values\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A display name for the dataset.</p>\"\
        },\
        \"Values\":{\
          \"shape\":\"TimestampList\",\
          \"documentation\":\"<p>Values.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Date time parameter.</p>\"\
    },\
    \"DateTimeParameterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DateTimeParameter\"},\
      \"max\":100\
    },\
    \"DecimalParameter\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Values\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A display name for the dataset.</p>\"\
        },\
        \"Values\":{\
          \"shape\":\"DoubleList\",\
          \"documentation\":\"<p>Values.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Decimal parameter.</p>\"\
    },\
    \"DecimalParameterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DecimalParameter\"},\
      \"max\":100\
    },\
    \"DeleteDashboardRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DashboardId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the dashboard that you're deleting.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DashboardId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the dashboard.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DashboardId\"\
        },\
        \"VersionNumber\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>The version number of the dashboard. If the version number property is provided, only the specified version of the dashboard is deleted.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"version-number\"\
        }\
      }\
    },\
    \"DeleteDashboardResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Secure Socket Layer (SSL) properties that apply for the resource.</p>\"\
        },\
        \"DashboardId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID of the dashboard.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"DeleteDataSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DataSetId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DataSetId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DataSetId\"\
        }\
      }\
    },\
    \"DeleteDataSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the dataset.</p>\"\
        },\
        \"DataSetId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"DeleteDataSourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DataSourceId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DataSourceId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DataSourceId\"\
        }\
      }\
    },\
    \"DeleteDataSourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the data source that you deleted.</p>\"\
        },\
        \"DataSourceId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"DeleteGroupMembershipRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MemberName\",\
        \"GroupName\",\
        \"AwsAccountId\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"MemberName\":{\
          \"shape\":\"GroupMemberName\",\
          \"documentation\":\"<p>The name of the user that you want to delete from the group membership.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"MemberName\"\
        },\
        \"GroupName\":{\
          \"shape\":\"GroupName\",\
          \"documentation\":\"<p>The name of the group that you want to delete the user from.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"GroupName\"\
        },\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace. Currently, you should set this to <code>default</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        }\
      }\
    },\
    \"DeleteGroupMembershipResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"DeleteGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GroupName\",\
        \"AwsAccountId\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"GroupName\":{\
          \"shape\":\"GroupName\",\
          \"documentation\":\"<p>The name of the group that you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"GroupName\"\
        },\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace. Currently, you should set this to <code>default</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        }\
      }\
    },\
    \"DeleteGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"DeleteIAMPolicyAssignmentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"AssignmentName\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID where you want to delete the IAM policy assignment.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"AssignmentName\":{\
          \"shape\":\"IAMPolicyAssignmentName\",\
          \"documentation\":\"<p>The name of the assignment. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AssignmentName\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace that contains the assignment.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        }\
      }\
    },\
    \"DeleteIAMPolicyAssignmentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AssignmentName\":{\
          \"shape\":\"IAMPolicyAssignmentName\",\
          \"documentation\":\"<p>The name of the assignment. </p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"DeleteTemplateAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"TemplateId\",\
        \"AliasName\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the item to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the template that the specified alias is for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TemplateId\"\
        },\
        \"AliasName\":{\
          \"shape\":\"AliasName\",\
          \"documentation\":\"<p>The name for the template alias. If you name a specific alias, you delete the version that the alias points to. You can specify the latest version of the template by providing the keyword <code>$LATEST</code> in the <code>AliasName</code> parameter. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AliasName\"\
        }\
      }\
    },\
    \"DeleteTemplateAliasResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>An ID for the template associated with the deletion.</p>\"\
        },\
        \"AliasName\":{\
          \"shape\":\"AliasName\",\
          \"documentation\":\"<p>The name for the template alias.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"DeleteTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"TemplateId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the template that you're deleting.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>An ID for the template you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TemplateId\"\
        },\
        \"VersionNumber\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>Specifies the version of the template that you want to delete. If you don't provide a version number, <code>DeleteTemplate</code> deletes all versions of the template. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"version-number\"\
        }\
      }\
    },\
    \"DeleteTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        },\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>An ID for the template.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"DeleteUserByPrincipalIdRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PrincipalId\",\
        \"AwsAccountId\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"PrincipalId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The principal ID of the user.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"PrincipalId\"\
        },\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace. Currently, you should set this to <code>default</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        }\
      },\
      \"documentation\":\"<p/>\"\
    },\
    \"DeleteUserByPrincipalIdResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"DeleteUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserName\",\
        \"AwsAccountId\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"UserName\":{\
          \"shape\":\"UserName\",\
          \"documentation\":\"<p>The name of the user that you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserName\"\
        },\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace. Currently, you should set this to <code>default</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        }\
      }\
    },\
    \"DeleteUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"Delimiter\":{\
      \"type\":\"string\",\
      \"max\":1,\
      \"min\":1\
    },\
    \"DescribeDashboardPermissionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DashboardId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the dashboard that you're describing permissions for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DashboardId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the dashboard, also added to the IAM policy.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DashboardId\"\
        }\
      }\
    },\
    \"DescribeDashboardPermissionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DashboardId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the dashboard.</p>\"\
        },\
        \"DashboardArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the dashboard.</p>\"\
        },\
        \"Permissions\":{\
          \"shape\":\"ResourcePermissionList\",\
          \"documentation\":\"<p>A structure that contains the permissions for the dashboard.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"DescribeDashboardRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DashboardId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the dashboard that you're describing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DashboardId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the dashboard.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DashboardId\"\
        },\
        \"VersionNumber\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>The version number for the dashboard. If a version number isn't passed, the latest published dashboard version is described. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"version-number\"\
        },\
        \"AliasName\":{\
          \"shape\":\"AliasName\",\
          \"documentation\":\"<p>The alias name.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"alias-name\"\
        }\
      }\
    },\
    \"DescribeDashboardResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Dashboard\":{\
          \"shape\":\"Dashboard\",\
          \"documentation\":\"<p>Information about the dashboard.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of this request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"DescribeDataSetPermissionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DataSetId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DataSetId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DataSetId\"\
        }\
      }\
    },\
    \"DescribeDataSetPermissionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DataSetArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the dataset.</p>\"\
        },\
        \"DataSetId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.</p>\"\
        },\
        \"Permissions\":{\
          \"shape\":\"ResourcePermissionList\",\
          \"documentation\":\"<p>A list of resource permissions on the dataset.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"DescribeDataSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DataSetId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DataSetId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DataSetId\"\
        }\
      }\
    },\
    \"DescribeDataSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DataSet\":{\
          \"shape\":\"DataSet\",\
          \"documentation\":\"<p>Information on the dataset.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"DescribeDataSourcePermissionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DataSourceId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DataSourceId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DataSourceId\"\
        }\
      }\
    },\
    \"DescribeDataSourcePermissionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DataSourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the data source.</p>\"\
        },\
        \"DataSourceId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>\"\
        },\
        \"Permissions\":{\
          \"shape\":\"ResourcePermissionList\",\
          \"documentation\":\"<p>A list of resource permissions on the data source.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"DescribeDataSourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DataSourceId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DataSourceId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DataSourceId\"\
        }\
      }\
    },\
    \"DescribeDataSourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DataSource\":{\
          \"shape\":\"DataSource\",\
          \"documentation\":\"<p>The information on the data source.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"DescribeGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GroupName\",\
        \"AwsAccountId\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"GroupName\":{\
          \"shape\":\"GroupName\",\
          \"documentation\":\"<p>The name of the group that you want to describe.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"GroupName\"\
        },\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace. Currently, you should set this to <code>default</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        }\
      }\
    },\
    \"DescribeGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Group\":{\
          \"shape\":\"Group\",\
          \"documentation\":\"<p>The name of the group.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"DescribeIAMPolicyAssignmentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"AssignmentName\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the assignment that you want to describe.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"AssignmentName\":{\
          \"shape\":\"IAMPolicyAssignmentName\",\
          \"documentation\":\"<p>The name of the assignment. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AssignmentName\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace that contains the assignment.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        }\
      }\
    },\
    \"DescribeIAMPolicyAssignmentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IAMPolicyAssignment\":{\
          \"shape\":\"IAMPolicyAssignment\",\
          \"documentation\":\"<p>Information describing the IAM policy assignment.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"DescribeIngestionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DataSetId\",\
        \"IngestionId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DataSetId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The ID of the dataset used in the ingestion.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DataSetId\"\
        },\
        \"IngestionId\":{\
          \"shape\":\"IngestionId\",\
          \"documentation\":\"<p>An ID for the ingestion.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IngestionId\"\
        }\
      }\
    },\
    \"DescribeIngestionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Ingestion\":{\
          \"shape\":\"Ingestion\",\
          \"documentation\":\"<p>Information about the ingestion.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"DescribeTemplateAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"TemplateId\",\
        \"AliasName\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the template alias that you're describing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TemplateId\"\
        },\
        \"AliasName\":{\
          \"shape\":\"AliasName\",\
          \"documentation\":\"<p>The name of the template alias that you want to describe. If you name a specific alias, you describe the version that the alias points to. You can specify the latest version of the template by providing the keyword <code>$LATEST</code> in the <code>AliasName</code> parameter. The keyword <code>$PUBLISHED</code> doesn't apply to templates.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AliasName\"\
        }\
      }\
    },\
    \"DescribeTemplateAliasResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateAlias\":{\
          \"shape\":\"TemplateAlias\",\
          \"documentation\":\"<p>Information about the template alias.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"DescribeTemplatePermissionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"TemplateId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the template that you're describing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TemplateId\"\
        }\
      }\
    },\
    \"DescribeTemplatePermissionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the template.</p>\"\
        },\
        \"TemplateArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the template.</p>\"\
        },\
        \"Permissions\":{\
          \"shape\":\"ResourcePermissionList\",\
          \"documentation\":\"<p>A list of resource permissions to be set on the template. </p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"DescribeTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"TemplateId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the template that you're describing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TemplateId\"\
        },\
        \"VersionNumber\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>(Optional) The number for the version to describe. If a <code>VersionNumber</code> parameter value isn't provided, the latest version of the template is described.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"version-number\"\
        },\
        \"AliasName\":{\
          \"shape\":\"AliasName\",\
          \"documentation\":\"<p>The alias of the template that you want to describe. If you name a specific alias, you describe the version that the alias points to. You can specify the latest version of the template by providing the keyword <code>$LATEST</code> in the <code>AliasName</code> parameter. The keyword <code>$PUBLISHED</code> doesn't apply to templates.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"alias-name\"\
        }\
      }\
    },\
    \"DescribeTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Template\":{\
          \"shape\":\"Template\",\
          \"documentation\":\"<p>The template structure for the object you want to describe.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"DescribeUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserName\",\
        \"AwsAccountId\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"UserName\":{\
          \"shape\":\"UserName\",\
          \"documentation\":\"<p>The name of the user that you want to describe.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserName\"\
        },\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace. Currently, you should set this to <code>default</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        }\
      }\
    },\
    \"DescribeUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"User\":{\
          \"shape\":\"User\",\
          \"documentation\":\"<p>The user name.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"Domain\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"DomainNotWhitelistedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The domain specified isn't on the allow list. All domains for embedded dashboards must be added to the approved list by an Amazon QuickSight admin.</p>\",\
      \"error\":{\"httpStatusCode\":403},\
      \"exception\":true\
    },\
    \"Double\":{\"type\":\"double\"},\
    \"DoubleList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Double\"}\
    },\
    \"EmbeddingUrl\":{\
      \"type\":\"string\",\
      \"sensitive\":true\
    },\
    \"ErrorInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"IngestionErrorType\",\
          \"documentation\":\"<p>Error type.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Error message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Error information for the SPICE ingestion of a dataset.</p>\"\
    },\
    \"ExceptionResourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"USER\",\
        \"GROUP\",\
        \"NAMESPACE\",\
        \"ACCOUNT_SETTINGS\",\
        \"IAMPOLICY_ASSIGNMENT\",\
        \"DATA_SOURCE\",\
        \"DATA_SET\",\
        \"VPC_CONNECTION\",\
        \"INGESTION\"\
      ]\
    },\
    \"ExportToCSVOption\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AvailabilityStatus\":{\
          \"shape\":\"DashboardBehavior\",\
          \"documentation\":\"<p>Availability status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Export to .csv option.</p>\"\
    },\
    \"Expression\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":1\
    },\
    \"FileFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CSV\",\
        \"TSV\",\
        \"CLF\",\
        \"ELF\",\
        \"XLSX\",\
        \"JSON\"\
      ]\
    },\
    \"FilterOperation\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConditionExpression\"],\
      \"members\":{\
        \"ConditionExpression\":{\
          \"shape\":\"Expression\",\
          \"documentation\":\"<p>An expression that must evaluate to a Boolean value. Rows for which the expression evaluates to true are kept in the dataset.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A transform operation that filters rows based on a condition.</p>\"\
    },\
    \"FilterOperator\":{\
      \"type\":\"string\",\
      \"enum\":[\"StringEquals\"]\
    },\
    \"GeoSpatialColumnGroup\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"CountryCode\",\
        \"Columns\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ColumnGroupName\",\
          \"documentation\":\"<p>A display name for the hierarchy.</p>\"\
        },\
        \"CountryCode\":{\
          \"shape\":\"GeoSpatialCountryCode\",\
          \"documentation\":\"<p>Country code.</p>\"\
        },\
        \"Columns\":{\
          \"shape\":\"ColumnList\",\
          \"documentation\":\"<p>Columns in this hierarchy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Geospatial column group that denotes a hierarchy.</p>\"\
    },\
    \"GeoSpatialCountryCode\":{\
      \"type\":\"string\",\
      \"enum\":[\"US\"]\
    },\
    \"GeoSpatialDataRole\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"COUNTRY\",\
        \"STATE\",\
        \"COUNTY\",\
        \"CITY\",\
        \"POSTCODE\",\
        \"LONGITUDE\",\
        \"LATITUDE\"\
      ]\
    },\
    \"GetDashboardEmbedUrlRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DashboardId\",\
        \"IdentityType\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID for the AWS account that contains the dashboard that you're embedding.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DashboardId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the dashboard, also added to the IAM policy.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DashboardId\"\
        },\
        \"IdentityType\":{\
          \"shape\":\"IdentityType\",\
          \"documentation\":\"<p>The authentication method that the user uses to sign in.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"creds-type\"\
        },\
        \"SessionLifetimeInMinutes\":{\
          \"shape\":\"SessionLifetimeInMinutes\",\
          \"documentation\":\"<p>How many minutes the session is valid. The session lifetime must be 15-600 minutes.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"session-lifetime\"\
        },\
        \"UndoRedoDisabled\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>Remove the undo/redo button on the embedded dashboard. The default is FALSE, which enables the undo/redo button.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"undo-redo-disabled\"\
        },\
        \"ResetDisabled\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>Remove the reset button on the embedded dashboard. The default is FALSE, which enables the reset button.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"reset-disabled\"\
        },\
        \"UserArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon QuickSight user's Amazon Resource Name (ARN), for use with <code>QUICKSIGHT</code> identity type. You can use this for any Amazon QuickSight users in your account (readers, authors, or admins) authenticated as one of the following:</p> <ul> <li> <p>Active Directory (AD) users or group members</p> </li> <li> <p>Invited nonfederated users</p> </li> <li> <p>IAM users and IAM role-based sessions authenticated through Federated Single Sign-On using SAML, OpenID Connect, or IAM federation.</p> </li> </ul>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"user-arn\"\
        }\
      }\
    },\
    \"GetDashboardEmbedUrlResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EmbedUrl\":{\
          \"shape\":\"EmbeddingUrl\",\
          \"documentation\":\"<p>An URL that you can put into your server-side webpage to embed your dashboard. This URL is valid for 5 minutes, and the resulting session is valid for 10 hours. The API provides the URL with an <code>auth_code</code> value that enables a single sign-on session. </p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"Group\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the group.</p>\"\
        },\
        \"GroupName\":{\
          \"shape\":\"GroupName\",\
          \"documentation\":\"<p>The name of the group.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"GroupDescription\",\
          \"documentation\":\"<p>The group description.</p>\"\
        },\
        \"PrincipalId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The principal ID of the group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A <i>group</i> in Amazon QuickSight consists of a set of users. You can use groups to make it easier to manage access and security. Currently, an Amazon QuickSight subscription can't contain more than 500 Amazon QuickSight groups.</p>\"\
    },\
    \"GroupDescription\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1\
    },\
    \"GroupList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Group\"}\
    },\
    \"GroupMember\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the group member (user).</p>\"\
        },\
        \"MemberName\":{\
          \"shape\":\"GroupMemberName\",\
          \"documentation\":\"<p>The name of the group member (user).</p>\"\
        }\
      },\
      \"documentation\":\"<p>A member of an Amazon QuickSight group. Currently, group members must be users. Groups can't be members of another group. .</p>\"\
    },\
    \"GroupMemberList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"GroupMember\"}\
    },\
    \"GroupMemberName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\u00FF]+\"\
    },\
    \"GroupName\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\u00FF]+\"\
    },\
    \"Host\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"IAMPolicyAssignment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\"\
        },\
        \"AssignmentId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Assignment ID.</p>\"\
        },\
        \"AssignmentName\":{\
          \"shape\":\"IAMPolicyAssignmentName\",\
          \"documentation\":\"<p>Assignment name.</p>\"\
        },\
        \"PolicyArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the IAM policy.</p>\"\
        },\
        \"Identities\":{\
          \"shape\":\"IdentityMap\",\
          \"documentation\":\"<p>Identities.</p>\"\
        },\
        \"AssignmentStatus\":{\
          \"shape\":\"AssignmentStatus\",\
          \"documentation\":\"<p>Assignment status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An IAM policy assignment.</p>\"\
    },\
    \"IAMPolicyAssignmentName\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"(?=^.{2,256}$)(?!.*\\\\s)[0-9a-zA-Z-_.:=+@]*$\"\
    },\
    \"IAMPolicyAssignmentSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AssignmentName\":{\
          \"shape\":\"IAMPolicyAssignmentName\",\
          \"documentation\":\"<p>Assignment name.</p>\"\
        },\
        \"AssignmentStatus\":{\
          \"shape\":\"AssignmentStatus\",\
          \"documentation\":\"<p>Assignment status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>IAM policy assignment summary.</p>\"\
    },\
    \"IAMPolicyAssignmentSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IAMPolicyAssignmentSummary\"}\
    },\
    \"IdentityMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"String\"},\
      \"value\":{\"shape\":\"IdentityNameList\"}\
    },\
    \"IdentityName\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\u00FF]+\"\
    },\
    \"IdentityNameList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IdentityName\"}\
    },\
    \"IdentityType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IAM\",\
        \"QUICKSIGHT\"\
      ]\
    },\
    \"IdentityTypeNotSupportedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The identity type specified isn't supported. Supported identity types include <code>IAM</code> and <code>QUICKSIGHT</code>.</p>\",\
      \"error\":{\"httpStatusCode\":403},\
      \"exception\":true\
    },\
    \"Ingestion\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Arn\",\
        \"IngestionStatus\",\
        \"CreatedTime\"\
      ],\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        },\
        \"IngestionId\":{\
          \"shape\":\"IngestionId\",\
          \"documentation\":\"<p>Ingestion ID.</p>\"\
        },\
        \"IngestionStatus\":{\
          \"shape\":\"IngestionStatus\",\
          \"documentation\":\"<p>Ingestion status.</p>\"\
        },\
        \"ErrorInfo\":{\
          \"shape\":\"ErrorInfo\",\
          \"documentation\":\"<p>Error information for this ingestion.</p>\"\
        },\
        \"RowInfo\":{\"shape\":\"RowInfo\"},\
        \"QueueInfo\":{\"shape\":\"QueueInfo\"},\
        \"CreatedTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The time that this ingestion started.</p>\"\
        },\
        \"IngestionTimeInSeconds\":{\
          \"shape\":\"long\",\
          \"documentation\":\"<p>The time that this ingestion took, measured in seconds.</p>\",\
          \"box\":true\
        },\
        \"IngestionSizeInBytes\":{\
          \"shape\":\"long\",\
          \"documentation\":\"<p>The size of the data ingested, in bytes.</p>\",\
          \"box\":true\
        },\
        \"RequestSource\":{\
          \"shape\":\"IngestionRequestSource\",\
          \"documentation\":\"<p>Event source for this ingestion.</p>\"\
        },\
        \"RequestType\":{\
          \"shape\":\"IngestionRequestType\",\
          \"documentation\":\"<p>Type of this ingestion.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the SPICE ingestion for a dataset.</p>\"\
    },\
    \"IngestionErrorType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FAILURE_TO_ASSUME_ROLE\",\
        \"INGESTION_SUPERSEDED\",\
        \"INGESTION_CANCELED\",\
        \"DATA_SET_DELETED\",\
        \"DATA_SET_NOT_SPICE\",\
        \"S3_UPLOADED_FILE_DELETED\",\
        \"S3_MANIFEST_ERROR\",\
        \"DATA_TOLERANCE_EXCEPTION\",\
        \"SPICE_TABLE_NOT_FOUND\",\
        \"DATA_SET_SIZE_LIMIT_EXCEEDED\",\
        \"ROW_SIZE_LIMIT_EXCEEDED\",\
        \"ACCOUNT_CAPACITY_LIMIT_EXCEEDED\",\
        \"CUSTOMER_ERROR\",\
        \"DATA_SOURCE_NOT_FOUND\",\
        \"IAM_ROLE_NOT_AVAILABLE\",\
        \"CONNECTION_FAILURE\",\
        \"SQL_TABLE_NOT_FOUND\",\
        \"PERMISSION_DENIED\",\
        \"SSL_CERTIFICATE_VALIDATION_FAILURE\",\
        \"OAUTH_TOKEN_FAILURE\",\
        \"SOURCE_API_LIMIT_EXCEEDED_FAILURE\",\
        \"PASSWORD_AUTHENTICATION_FAILURE\",\
        \"SQL_SCHEMA_MISMATCH_ERROR\",\
        \"INVALID_DATE_FORMAT\",\
        \"INVALID_DATAPREP_SYNTAX\",\
        \"SOURCE_RESOURCE_LIMIT_EXCEEDED\",\
        \"SQL_INVALID_PARAMETER_VALUE\",\
        \"QUERY_TIMEOUT\",\
        \"SQL_NUMERIC_OVERFLOW\",\
        \"UNRESOLVABLE_HOST\",\
        \"UNROUTABLE_HOST\",\
        \"SQL_EXCEPTION\",\
        \"S3_FILE_INACCESSIBLE\",\
        \"IOT_FILE_NOT_FOUND\",\
        \"IOT_DATA_SET_FILE_EMPTY\",\
        \"INVALID_DATA_SOURCE_CONFIG\",\
        \"DATA_SOURCE_AUTH_FAILED\",\
        \"DATA_SOURCE_CONNECTION_FAILED\",\
        \"FAILURE_TO_PROCESS_JSON_FILE\",\
        \"INTERNAL_SERVICE_ERROR\"\
      ]\
    },\
    \"IngestionId\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9-_]+$\"\
    },\
    \"IngestionMaxResults\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"IngestionRequestSource\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"MANUAL\",\
        \"SCHEDULED\"\
      ]\
    },\
    \"IngestionRequestType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INITIAL_INGESTION\",\
        \"EDIT\",\
        \"INCREMENTAL_REFRESH\",\
        \"FULL_REFRESH\"\
      ]\
    },\
    \"IngestionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INITIALIZED\",\
        \"QUEUED\",\
        \"RUNNING\",\
        \"FAILED\",\
        \"COMPLETED\",\
        \"CANCELLED\"\
      ]\
    },\
    \"Ingestions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Ingestion\"}\
    },\
    \"InputColumn\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Type\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ColumnName\",\
          \"documentation\":\"<p>The name of this column in the underlying data source.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"InputColumnDataType\",\
          \"documentation\":\"<p>The data type of the column.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Metadata for a column that is used as the input of a transform operation.</p>\"\
    },\
    \"InputColumnDataType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STRING\",\
        \"INTEGER\",\
        \"DECIMAL\",\
        \"DATETIME\",\
        \"BIT\",\
        \"BOOLEAN\",\
        \"JSON\"\
      ]\
    },\
    \"InputColumnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InputColumn\"},\
      \"max\":2048,\
      \"min\":1\
    },\
    \"InstanceId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"IntegerParameter\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Values\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A display name for the dataset.</p>\"\
        },\
        \"Values\":{\
          \"shape\":\"LongList\",\
          \"documentation\":\"<p>Values.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Integer parameter.</p>\"\
    },\
    \"IntegerParameterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IntegerParameter\"},\
      \"max\":100\
    },\
    \"InternalFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An internal failure occurred.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidNextTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The <code>NextToken</code> value isn't valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidParameterValueException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>One or more parameters has a value that isn't valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"JiraParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\"SiteBaseUrl\"],\
      \"members\":{\
        \"SiteBaseUrl\":{\
          \"shape\":\"SiteBaseUrl\",\
          \"documentation\":\"<p>The base URL of the Jira site.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Jira parameters.</p>\"\
    },\
    \"JoinInstruction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LeftOperand\",\
        \"RightOperand\",\
        \"Type\",\
        \"OnClause\"\
      ],\
      \"members\":{\
        \"LeftOperand\":{\
          \"shape\":\"LogicalTableId\",\
          \"documentation\":\"<p>Left operand.</p>\"\
        },\
        \"RightOperand\":{\
          \"shape\":\"LogicalTableId\",\
          \"documentation\":\"<p>Right operand.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"JoinType\",\
          \"documentation\":\"<p>Type.</p>\"\
        },\
        \"OnClause\":{\
          \"shape\":\"OnClause\",\
          \"documentation\":\"<p>On Clause.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Join instruction.</p>\"\
    },\
    \"JoinType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INNER\",\
        \"OUTER\",\
        \"LEFT\",\
        \"RIGHT\"\
      ]\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"ResourceType\":{\
          \"shape\":\"ExceptionResourceType\",\
          \"documentation\":\"<p>Limit exceeded.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A limit is exceeded.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ListDashboardVersionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DashboardId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the dashboard that you're listing versions for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DashboardId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the dashboard.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DashboardId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned per request.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        }\
      }\
    },\
    \"ListDashboardVersionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DashboardVersionSummaryList\":{\
          \"shape\":\"DashboardVersionSummaryList\",\
          \"documentation\":\"<p>A structure that contains information about each version of the dashboard.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"ListDashboardsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AwsAccountId\"],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the dashboards that you're listing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned per request.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        }\
      }\
    },\
    \"ListDashboardsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DashboardSummaryList\":{\
          \"shape\":\"DashboardSummaryList\",\
          \"documentation\":\"<p>A structure that contains all of the dashboards in your AWS account. This structure provides basic information about the dashboards.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"ListDataSetsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AwsAccountId\"],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned per request.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        }\
      }\
    },\
    \"ListDataSetsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DataSetSummaries\":{\
          \"shape\":\"DataSetSummaryList\",\
          \"documentation\":\"<p>The list of dataset summaries.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"ListDataSourcesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AwsAccountId\"],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned per request.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        }\
      }\
    },\
    \"ListDataSourcesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DataSources\":{\
          \"shape\":\"DataSourceList\",\
          \"documentation\":\"<p>A list of data sources.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"ListGroupMembershipsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GroupName\",\
        \"AwsAccountId\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"GroupName\":{\
          \"shape\":\"GroupName\",\
          \"documentation\":\"<p>The name of the group that you want to see a membership list of.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"GroupName\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A pagination token that can be used in a subsequent request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return from this request.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace. Currently, you should set this to <code>default</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        }\
      }\
    },\
    \"ListGroupMembershipsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GroupMemberList\":{\
          \"shape\":\"GroupMemberList\",\
          \"documentation\":\"<p>The list of the members of the group.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A pagination token that can be used in a subsequent request.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"ListGroupsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A pagination token that can be used in a subsequent request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace. Currently, you should set this to <code>default</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        }\
      }\
    },\
    \"ListGroupsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GroupList\":{\
          \"shape\":\"GroupList\",\
          \"documentation\":\"<p>The list of the groups.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A pagination token that can be used in a subsequent request.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"ListIAMPolicyAssignmentsForUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"UserName\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the assignments.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"UserName\":{\
          \"shape\":\"UserName\",\
          \"documentation\":\"<p>The name of the user.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserName\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned per request.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace of the assignment.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        }\
      }\
    },\
    \"ListIAMPolicyAssignmentsForUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ActiveAssignments\":{\
          \"shape\":\"ActiveIAMPolicyAssignmentList\",\
          \"documentation\":\"<p>The active assignments for this user.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"ListIAMPolicyAssignmentsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains these IAM policy assignments.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"AssignmentStatus\":{\
          \"shape\":\"AssignmentStatus\",\
          \"documentation\":\"<p>The status of the assignments.</p>\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace for the assignments.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned per request.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        }\
      }\
    },\
    \"ListIAMPolicyAssignmentsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IAMPolicyAssignments\":{\
          \"shape\":\"IAMPolicyAssignmentSummaryList\",\
          \"documentation\":\"<p>Information describing the IAM policy assignments.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"ListIngestionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DataSetId\",\
        \"AwsAccountId\"\
      ],\
      \"members\":{\
        \"DataSetId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The ID of the dataset used in the ingestion.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DataSetId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"IngestionMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned per request.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        }\
      }\
    },\
    \"ListIngestionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Ingestions\":{\
          \"shape\":\"Ingestions\",\
          \"documentation\":\"<p>A list of the ingestions.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource that you want a list of tags for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ResourceArn\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Contains a map of the key-value pairs for the resource tag or tags assigned to the resource.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"ListTemplateAliasesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"TemplateId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the template aliases that you're listing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TemplateId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned per request.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max-result\"\
        }\
      }\
    },\
    \"ListTemplateAliasesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateAliasList\":{\
          \"shape\":\"TemplateAliasList\",\
          \"documentation\":\"<p>A structure containing the list of the template's aliases.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\"\
        }\
      }\
    },\
    \"ListTemplateVersionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"TemplateId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the templates that you're listing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TemplateId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned per request.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        }\
      }\
    },\
    \"ListTemplateVersionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateVersionSummaryList\":{\
          \"shape\":\"TemplateVersionSummaryList\",\
          \"documentation\":\"<p>A structure containing a list of all the versions of the specified template.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"ListTemplatesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AwsAccountId\"],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the templates that you're listing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned per request.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max-result\"\
        }\
      }\
    },\
    \"ListTemplatesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateSummaryList\":{\
          \"shape\":\"TemplateSummaryList\",\
          \"documentation\":\"<p>A structure containing information about the templates in the list.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"ListUserGroupsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserName\",\
        \"AwsAccountId\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"UserName\":{\
          \"shape\":\"UserName\",\
          \"documentation\":\"<p>The Amazon QuickSight user name that you want to list group memberships for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserName\"\
        },\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace. Currently, you should set this to <code>default</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A pagination token that can be used in a subsequent request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return from this request.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        }\
      }\
    },\
    \"ListUserGroupsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GroupList\":{\
          \"shape\":\"GroupList\",\
          \"documentation\":\"<p>The list of groups the user is a member of.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A pagination token that can be used in a subsequent request.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"ListUsersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A pagination token that can be used in a subsequent request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return from this request.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace. Currently, you should set this to <code>default</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        }\
      }\
    },\
    \"ListUsersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserList\":{\
          \"shape\":\"UserList\",\
          \"documentation\":\"<p>The list of users.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A pagination token that can be used in a subsequent request.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"LogicalTable\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Alias\",\
        \"Source\"\
      ],\
      \"members\":{\
        \"Alias\":{\
          \"shape\":\"LogicalTableAlias\",\
          \"documentation\":\"<p>A display name for the logical table.</p>\"\
        },\
        \"DataTransforms\":{\
          \"shape\":\"TransformOperationList\",\
          \"documentation\":\"<p>Transform operations that act on this logical table.</p>\"\
        },\
        \"Source\":{\
          \"shape\":\"LogicalTableSource\",\
          \"documentation\":\"<p>Source of this logical table.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A <i>logical table</i> is a unit that joins and that data transformations operate on. A logical table has a source, which can be either a physical table or result of a join. When a logical table points to a physical table, the logical table acts as a mutable copy of that physical table through transform operations.</p>\"\
    },\
    \"LogicalTableAlias\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"LogicalTableId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"[0-9a-zA-Z-]*\"\
    },\
    \"LogicalTableMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"LogicalTableId\"},\
      \"value\":{\"shape\":\"LogicalTable\"},\
      \"max\":32,\
      \"min\":1\
    },\
    \"LogicalTableSource\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JoinInstruction\":{\
          \"shape\":\"JoinInstruction\",\
          \"documentation\":\"<p>Specifies the result of a join of two logical tables.</p>\"\
        },\
        \"PhysicalTableId\":{\
          \"shape\":\"PhysicalTableId\",\
          \"documentation\":\"<p>Physical table ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the source of a logical table. This is a variant type structure. For this structure to be valid, only one of the attributes can be non-null.</p>\"\
    },\
    \"Long\":{\"type\":\"long\"},\
    \"LongList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Long\"}\
    },\
    \"ManifestFileLocation\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Bucket\",\
        \"Key\"\
      ],\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>Amazon S3 bucket.</p>\"\
        },\
        \"Key\":{\
          \"shape\":\"S3Key\",\
          \"documentation\":\"<p>Amazon S3 key that identifies an object.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Amazon S3 manifest file location.</p>\"\
    },\
    \"MariaDbParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Host\",\
        \"Port\",\
        \"Database\"\
      ],\
      \"members\":{\
        \"Host\":{\
          \"shape\":\"Host\",\
          \"documentation\":\"<p>Host.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>Port.</p>\"\
        },\
        \"Database\":{\
          \"shape\":\"Database\",\
          \"documentation\":\"<p>Database.</p>\"\
        }\
      },\
      \"documentation\":\"<p>MariaDB parameters.</p>\"\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"MySqlParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Host\",\
        \"Port\",\
        \"Database\"\
      ],\
      \"members\":{\
        \"Host\":{\
          \"shape\":\"Host\",\
          \"documentation\":\"<p>Host.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>Port.</p>\"\
        },\
        \"Database\":{\
          \"shape\":\"Database\",\
          \"documentation\":\"<p>Database.</p>\"\
        }\
      },\
      \"documentation\":\"<p>MySQL parameters.</p>\"\
    },\
    \"Namespace\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"pattern\":\"^[a-zA-Z0-9._-]*$\"\
    },\
    \"NonEmptyString\":{\
      \"type\":\"string\",\
      \"pattern\":\".*\\\\S.*\"\
    },\
    \"OnClause\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1\
    },\
    \"OptionalPort\":{\
      \"type\":\"integer\",\
      \"max\":65535,\
      \"min\":0\
    },\
    \"OutputColumn\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ColumnName\",\
          \"documentation\":\"<p>A display name for the dataset.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"ColumnDataType\",\
          \"documentation\":\"<p>Type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Output column.</p>\"\
    },\
    \"OutputColumnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"OutputColumn\"}\
    },\
    \"Parameters\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StringParameters\":{\
          \"shape\":\"StringParameterList\",\
          \"documentation\":\"<p>String parameters.</p>\"\
        },\
        \"IntegerParameters\":{\
          \"shape\":\"IntegerParameterList\",\
          \"documentation\":\"<p>Integer parameters.</p>\"\
        },\
        \"DecimalParameters\":{\
          \"shape\":\"DecimalParameterList\",\
          \"documentation\":\"<p>Decimal parameters.</p>\"\
        },\
        \"DateTimeParameters\":{\
          \"shape\":\"DateTimeParameterList\",\
          \"documentation\":\"<p>DateTime parameters.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Parameters.</p>\"\
    },\
    \"Password\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"PhysicalTable\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RelationalTable\":{\
          \"shape\":\"RelationalTable\",\
          \"documentation\":\"<p>A physical table type for relational data sources.</p>\"\
        },\
        \"CustomSql\":{\
          \"shape\":\"CustomSql\",\
          \"documentation\":\"<p>A physical table type built from the results of the custom SQL query.</p>\"\
        },\
        \"S3Source\":{\
          \"shape\":\"S3Source\",\
          \"documentation\":\"<p>A physical table type for as S3 data source.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A view of a data source that contains information about the shape of the data in the underlying source. This is a variant type structure. For this structure to be valid, only one of the attributes can be non-null.</p>\"\
    },\
    \"PhysicalTableId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"[0-9a-zA-Z-]*\"\
    },\
    \"PhysicalTableMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"PhysicalTableId\"},\
      \"value\":{\"shape\":\"PhysicalTable\"},\
      \"max\":16,\
      \"min\":1\
    },\
    \"Port\":{\
      \"type\":\"integer\",\
      \"max\":65535,\
      \"min\":1\
    },\
    \"PositiveInteger\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"PostgreSqlParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Host\",\
        \"Port\",\
        \"Database\"\
      ],\
      \"members\":{\
        \"Host\":{\
          \"shape\":\"Host\",\
          \"documentation\":\"<p>Host.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>Port.</p>\"\
        },\
        \"Database\":{\
          \"shape\":\"Database\",\
          \"documentation\":\"<p>Database.</p>\"\
        }\
      },\
      \"documentation\":\"<p>PostgreSQL parameters.</p>\"\
    },\
    \"PreconditionNotMetException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>One or more preconditions aren't met.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"PrestoParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Host\",\
        \"Port\",\
        \"Catalog\"\
      ],\
      \"members\":{\
        \"Host\":{\
          \"shape\":\"Host\",\
          \"documentation\":\"<p>Host.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>Port.</p>\"\
        },\
        \"Catalog\":{\
          \"shape\":\"Catalog\",\
          \"documentation\":\"<p>Catalog.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Presto parameters.</p>\"\
    },\
    \"Principal\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"ProjectOperation\":{\
      \"type\":\"structure\",\
      \"required\":[\"ProjectedColumns\"],\
      \"members\":{\
        \"ProjectedColumns\":{\
          \"shape\":\"ProjectedColumnList\",\
          \"documentation\":\"<p>Projected columns.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A transform operation that projects columns. Operations that come after a projection can only refer to projected columns.</p>\"\
    },\
    \"ProjectedColumnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"},\
      \"max\":2000,\
      \"min\":1\
    },\
    \"Query\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"QueueInfo\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"WaitingOnIngestion\",\
        \"QueuedIngestion\"\
      ],\
      \"members\":{\
        \"WaitingOnIngestion\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The ID of the queued ingestion.</p>\"\
        },\
        \"QueuedIngestion\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The ID of the ongoing ingestion. The queued ingestion is waiting for the ongoing ingestion to complete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a queued dataset SPICE ingestion.</p>\"\
    },\
    \"QuickSightUserNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The user with the provided name isn't found. This error can happen in any operation that requires finding a user based on a provided user name, such as <code>DeleteUser</code>, <code>DescribeUser</code>, and so on.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"RdsParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Database\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>Instance ID.</p>\"\
        },\
        \"Database\":{\
          \"shape\":\"Database\",\
          \"documentation\":\"<p>Database.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Amazon RDS parameters.</p>\"\
    },\
    \"RedshiftParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\"Database\"],\
      \"members\":{\
        \"Host\":{\
          \"shape\":\"Host\",\
          \"documentation\":\"<p>Host. This field can be blank if <code>ClusterId</code> is provided.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"OptionalPort\",\
          \"documentation\":\"<p>Port. This field can be blank if the <code>ClusterId</code> is provided.</p>\"\
        },\
        \"Database\":{\
          \"shape\":\"Database\",\
          \"documentation\":\"<p>Database.</p>\"\
        },\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>Cluster ID. This field can be blank if the <code>Host</code> and <code>Port</code> are provided.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Amazon Redshift parameters. The <code>ClusterId</code> field can be blank if <code>Host</code> and <code>Port</code> are both set. The <code>Host</code> and <code>Port</code> fields can be blank if the <code>ClusterId</code> field is set.</p>\"\
    },\
    \"RegisterUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityType\",\
        \"Email\",\
        \"UserRole\",\
        \"AwsAccountId\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"IdentityType\":{\
          \"shape\":\"IdentityType\",\
          \"documentation\":\"<p>Amazon QuickSight supports several ways of managing the identity of users. This parameter accepts two values:</p> <ul> <li> <p> <code>IAM</code>: A user whose identity maps to an existing IAM user or role. </p> </li> <li> <p> <code>QUICKSIGHT</code>: A user whose identity is owned and managed internally by Amazon QuickSight. </p> </li> </ul>\"\
        },\
        \"Email\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The email address of the user that you want to register.</p>\"\
        },\
        \"UserRole\":{\
          \"shape\":\"UserRole\",\
          \"documentation\":\"<p>The Amazon QuickSight role for the user. The user role can be one of the following:</p> <ul> <li> <p> <code>READER</code>: A user who has read-only access to dashboards.</p> </li> <li> <p> <code>AUTHOR</code>: A user who can create data sources, datasets, analyses, and dashboards.</p> </li> <li> <p> <code>ADMIN</code>: A user who is an author, who can also manage Amazon QuickSight settings.</p> </li> <li> <p> <code>RESTRICTED_READER</code>: This role isn't currently available for use.</p> </li> <li> <p> <code>RESTRICTED_AUTHOR</code>: This role isn't currently available for use.</p> </li> </ul>\"\
        },\
        \"IamArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN of the IAM user or role that you are registering with Amazon QuickSight. </p>\"\
        },\
        \"SessionName\":{\
          \"shape\":\"RoleSessionName\",\
          \"documentation\":\"<p>You need to use this parameter only when you register one or more users using an assumed IAM role. You don't need to provide the session name for other scenarios, for example when you are registering an IAM user or an Amazon QuickSight user. You can register multiple users using the same IAM role if each user has a different session name. For more information on assuming IAM roles, see <a href=\\\"https://awscli.amazonaws.com/v2/documentation/api/latest/reference/sts/assume-role.html\\\"> <code>assume-role</code> </a> in the <i>AWS CLI Reference.</i> </p>\"\
        },\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace. Currently, you should set this to <code>default</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        },\
        \"UserName\":{\
          \"shape\":\"UserName\",\
          \"documentation\":\"<p>The Amazon QuickSight user name that you want to create for the user you are registering.</p>\"\
        }\
      }\
    },\
    \"RegisterUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"User\":{\
          \"shape\":\"User\",\
          \"documentation\":\"<p>The user name.</p>\"\
        },\
        \"UserInvitationUrl\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The URL the user visits to complete registration and provide a password. This is returned only for users with an identity type of <code>QUICKSIGHT</code>.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"RelationalTable\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DataSourceArn\",\
        \"Name\",\
        \"InputColumns\"\
      ],\
      \"members\":{\
        \"DataSourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the data source.</p>\"\
        },\
        \"Schema\":{\
          \"shape\":\"RelationalTableSchema\",\
          \"documentation\":\"<p>The schema name. This name applies to certain relational database engines.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"RelationalTableName\",\
          \"documentation\":\"<p>The name of the relational table.</p>\"\
        },\
        \"InputColumns\":{\
          \"shape\":\"InputColumnList\",\
          \"documentation\":\"<p>The column schema of the table.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A physical table type for relational data sources.</p>\"\
    },\
    \"RelationalTableName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"RelationalTableSchema\":{\
      \"type\":\"string\",\
      \"max\":64\
    },\
    \"RenameColumnOperation\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ColumnName\",\
        \"NewColumnName\"\
      ],\
      \"members\":{\
        \"ColumnName\":{\
          \"shape\":\"ColumnName\",\
          \"documentation\":\"<p>The name of the column to be renamed.</p>\"\
        },\
        \"NewColumnName\":{\
          \"shape\":\"ColumnName\",\
          \"documentation\":\"<p>The new name for the column.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A transform operation that renames a column.</p>\"\
    },\
    \"ResourceExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"ResourceType\":{\
          \"shape\":\"ExceptionResourceType\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The resource specified already exists. </p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ResourceId\":{\"type\":\"string\"},\
    \"ResourceName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"ResourceType\":{\
          \"shape\":\"ExceptionResourceType\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>One or more resources can't be found.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"ResourcePermission\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Principal\",\
        \"Actions\"\
      ],\
      \"members\":{\
        \"Principal\":{\
          \"shape\":\"Principal\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an Amazon QuickSight user or group, or an IAM ARN. If you are using cross-account resource sharing, this is the IAM ARN of an account root. Otherwise, it is the ARN of a QuickSight user or group. .</p>\"\
        },\
        \"Actions\":{\
          \"shape\":\"ActionList\",\
          \"documentation\":\"<p>The action to grant or revoke permissions on, for example <code>\\\"quicksight:DescribeDashboard\\\"</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Permission for the resource.</p>\"\
    },\
    \"ResourcePermissionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourcePermission\"},\
      \"max\":64,\
      \"min\":1\
    },\
    \"ResourceStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATION_IN_PROGRESS\",\
        \"CREATION_SUCCESSFUL\",\
        \"CREATION_FAILED\",\
        \"UPDATE_IN_PROGRESS\",\
        \"UPDATE_SUCCESSFUL\",\
        \"UPDATE_FAILED\"\
      ]\
    },\
    \"ResourceUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"ResourceType\":{\
          \"shape\":\"ExceptionResourceType\",\
          \"documentation\":\"<p>The resource type for this request.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This resource is currently unavailable.</p>\",\
      \"error\":{\"httpStatusCode\":503},\
      \"exception\":true\
    },\
    \"RestrictiveResourceId\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"[\\\\w\\\\-]+\"\
    },\
    \"RoleSessionName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":2,\
      \"pattern\":\"[\\\\w+=.@-]*\"\
    },\
    \"RowInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RowsIngested\":{\
          \"shape\":\"long\",\
          \"documentation\":\"<p>The number of rows that were ingested.</p>\",\
          \"box\":true\
        },\
        \"RowsDropped\":{\
          \"shape\":\"long\",\
          \"documentation\":\"<p>The number of rows that were not ingested.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>Information about rows for a data set SPICE ingestion.</p>\"\
    },\
    \"RowLevelPermissionDataSet\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Arn\",\
        \"PermissionPolicy\"\
      ],\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the permission dataset.</p>\"\
        },\
        \"PermissionPolicy\":{\
          \"shape\":\"RowLevelPermissionPolicy\",\
          \"documentation\":\"<p>Permission policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The row-level security configuration for the dataset.</p>\"\
    },\
    \"RowLevelPermissionPolicy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"GRANT_ACCESS\",\
        \"DENY_ACCESS\"\
      ]\
    },\
    \"S3Bucket\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"S3Key\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"S3Parameters\":{\
      \"type\":\"structure\",\
      \"required\":[\"ManifestFileLocation\"],\
      \"members\":{\
        \"ManifestFileLocation\":{\
          \"shape\":\"ManifestFileLocation\",\
          \"documentation\":\"<p>Location of the Amazon S3 manifest file. This is NULL if the manifest file was uploaded in the console.</p>\"\
        }\
      },\
      \"documentation\":\"<p>S3 parameters.</p>\"\
    },\
    \"S3Source\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DataSourceArn\",\
        \"InputColumns\"\
      ],\
      \"members\":{\
        \"DataSourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The amazon Resource Name (ARN) for the data source.</p>\"\
        },\
        \"UploadSettings\":{\
          \"shape\":\"UploadSettings\",\
          \"documentation\":\"<p>Information about the format for the S3 source file or files.</p>\"\
        },\
        \"InputColumns\":{\
          \"shape\":\"InputColumnList\",\
          \"documentation\":\"<p>A physical table type for as S3 data source.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A physical table type for as S3 data source.</p>\"\
    },\
    \"SearchDashboardsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"Filters\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the user whose dashboards you're searching for. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"Filters\":{\
          \"shape\":\"DashboardSearchFilterList\",\
          \"documentation\":\"<p>The filters to apply to the search. Currently, you can search only by user name. For example, <code>\\\"Filters\\\": [ { \\\"Name\\\": \\\"QUICKSIGHT_USER\\\", \\\"Operator\\\": \\\"StringEquals\\\", \\\"Value\\\": \\\"arn:aws:quicksight:us-east-1:1:user/default/UserName1\\\" } ]</code> </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned per request.</p>\"\
        }\
      }\
    },\
    \"SearchDashboardsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DashboardSummaryList\":{\
          \"shape\":\"DashboardSummaryList\",\
          \"documentation\":\"<p>The list of dashboards owned by the user specified in <code>Filters</code> in your request.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no more results.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"ServiceNowParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\"SiteBaseUrl\"],\
      \"members\":{\
        \"SiteBaseUrl\":{\
          \"shape\":\"SiteBaseUrl\",\
          \"documentation\":\"<p>URL of the base site.</p>\"\
        }\
      },\
      \"documentation\":\"<p>ServiceNow parameters.</p>\"\
    },\
    \"SessionLifetimeInMinutes\":{\
      \"type\":\"long\",\
      \"max\":600,\
      \"min\":15\
    },\
    \"SessionLifetimeInMinutesInvalidException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The number of minutes specified for the lifetime of a session isn't valid. The session lifetime must be 15-600 minutes.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"SheetControlsOption\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VisibilityState\":{\
          \"shape\":\"DashboardUIState\",\
          \"documentation\":\"<p>Visibility state.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Sheet controls option.</p>\"\
    },\
    \"SiteBaseUrl\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"SnowflakeParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Host\",\
        \"Database\",\
        \"Warehouse\"\
      ],\
      \"members\":{\
        \"Host\":{\
          \"shape\":\"Host\",\
          \"documentation\":\"<p>Host.</p>\"\
        },\
        \"Database\":{\
          \"shape\":\"Database\",\
          \"documentation\":\"<p>Database.</p>\"\
        },\
        \"Warehouse\":{\
          \"shape\":\"Warehouse\",\
          \"documentation\":\"<p>Warehouse.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Snowflake parameters.</p>\"\
    },\
    \"SparkParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Host\",\
        \"Port\"\
      ],\
      \"members\":{\
        \"Host\":{\
          \"shape\":\"Host\",\
          \"documentation\":\"<p>Host.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>Port.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Spark parameters.</p>\"\
    },\
    \"SqlQuery\":{\
      \"type\":\"string\",\
      \"max\":65536,\
      \"min\":1\
    },\
    \"SqlServerParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Host\",\
        \"Port\",\
        \"Database\"\
      ],\
      \"members\":{\
        \"Host\":{\
          \"shape\":\"Host\",\
          \"documentation\":\"<p>Host.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>Port.</p>\"\
        },\
        \"Database\":{\
          \"shape\":\"Database\",\
          \"documentation\":\"<p>Database.</p>\"\
        }\
      },\
      \"documentation\":\"<p>SQL Server parameters.</p>\"\
    },\
    \"SslProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DisableSsl\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>A Boolean option to control whether SSL should be disabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Secure Socket Layer (SSL) properties that apply when QuickSight connects to your underlying data source.</p>\"\
    },\
    \"StatusCode\":{\"type\":\"integer\"},\
    \"String\":{\"type\":\"string\"},\
    \"StringList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"StringParameter\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Values\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A display name for the dataset.</p>\"\
        },\
        \"Values\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>Values.</p>\"\
        }\
      },\
      \"documentation\":\"<p>String parameter.</p>\"\
    },\
    \"StringParameterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StringParameter\"},\
      \"max\":100\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Key\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>Tag key.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>Tag value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The key or keys of the key-value pairs for the resource tag or tags assigned to the resource.</p>\"\
    },\
    \"TagColumnOperation\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ColumnName\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ColumnName\":{\
          \"shape\":\"ColumnName\",\
          \"documentation\":\"<p>The column that this operation acts on.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"ColumnTagList\",\
          \"documentation\":\"<p>The dataset column tag, currently only used for geospatial type tagging. .</p> <note> <p>This is not tags for the AWS tagging feature. .</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>A transform operation that tags a column with additional information.</p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"max\":200,\
      \"min\":1\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"max\":200,\
      \"min\":1\
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
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource that you want to tag.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ResourceArn\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Contains a map of the key-value pairs for the resource tag or tags assigned to the resource.</p>\"\
        }\
      }\
    },\
    \"TagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"Template\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the template.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The display name of the template.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"TemplateVersion\",\
          \"documentation\":\"<p>A structure describing the versions of the template.</p>\"\
        },\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the template. This is unique per AWS Region for each AWS account.</p>\"\
        },\
        \"LastUpdatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Time when this was last updated.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Time when this was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A template object. A <i>template</i> is an entity in QuickSight that encapsulates the metadata required to create an analysis and that you can use to create a dashboard. A template adds a layer of abstraction by using placeholders to replace the dataset associated with the analysis. You can use templates to create dashboards by replacing dataset placeholders with datasets that follow the same schema that was used to create the source analysis and template.</p> <p>You can share templates across AWS accounts by allowing users in other AWS accounts to create a template or a dashboard from an existing template.</p>\"\
    },\
    \"TemplateAlias\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AliasName\":{\
          \"shape\":\"AliasName\",\
          \"documentation\":\"<p>The display name of the template alias.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the template alias.</p>\"\
        },\
        \"TemplateVersionNumber\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>The version number of the template alias.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The template alias.</p>\"\
    },\
    \"TemplateAliasList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TemplateAlias\"},\
      \"max\":100\
    },\
    \"TemplateError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"TemplateErrorType\",\
          \"documentation\":\"<p>Type of error.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Description of the error type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>List of errors that occurred when the template version creation failed.</p>\"\
    },\
    \"TemplateErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TemplateError\"},\
      \"min\":1\
    },\
    \"TemplateErrorType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SOURCE_NOT_FOUND\",\
        \"DATA_SET_NOT_FOUND\",\
        \"INTERNAL_FAILURE\"\
      ]\
    },\
    \"TemplateName\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\u00FF]+\"\
    },\
    \"TemplateSourceAnalysis\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Arn\",\
        \"DataSetReferences\"\
      ],\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        },\
        \"DataSetReferences\":{\
          \"shape\":\"DataSetReferenceList\",\
          \"documentation\":\"<p>A structure containing information about the dataset references used as placeholders in the template.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The source analysis of the template.</p>\"\
    },\
    \"TemplateSourceEntity\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SourceAnalysis\":{\
          \"shape\":\"TemplateSourceAnalysis\",\
          \"documentation\":\"<p>The source analysis, if it is based on an analysis.</p>\"\
        },\
        \"SourceTemplate\":{\
          \"shape\":\"TemplateSourceTemplate\",\
          \"documentation\":\"<p>The source template, if it is based on an template.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The source entity of the template.</p>\"\
    },\
    \"TemplateSourceTemplate\":{\
      \"type\":\"structure\",\
      \"required\":[\"Arn\"],\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The source template of the template.</p>\"\
    },\
    \"TemplateSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>A summary of a template.</p>\"\
        },\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID of the template. This ID is unique per AWS Region for each AWS account.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>A display name for the template.</p>\"\
        },\
        \"LatestVersionNumber\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>A structure containing a list of version numbers for the template summary.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The last time that this template was created.</p>\"\
        },\
        \"LastUpdatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The last time that this template was updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The template summary.</p>\"\
    },\
    \"TemplateSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TemplateSummary\"},\
      \"max\":100\
    },\
    \"TemplateVersion\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that this template version was created.</p>\"\
        },\
        \"Errors\":{\
          \"shape\":\"TemplateErrorList\",\
          \"documentation\":\"<p>Errors associated with the template.</p>\"\
        },\
        \"VersionNumber\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>The version number of the template.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ResourceStatus\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\"\
        },\
        \"DataSetConfigurations\":{\
          \"shape\":\"DataSetConfigurationList\",\
          \"documentation\":\"<p>Schema of the dataset identified by the placeholder. The idea is that any dashboard created from the template should be bound to new datasets matching the same schema described through this API. .</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"VersionDescription\",\
          \"documentation\":\"<p>The description of the template.</p>\"\
        },\
        \"SourceEntityArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the analysis or template which was used to create this template.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A version of a template.</p>\"\
    },\
    \"TemplateVersionSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the template version.</p>\"\
        },\
        \"VersionNumber\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>The version number of the template version.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that this template version was created.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ResourceStatus\",\
          \"documentation\":\"<p>The status of the template version.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"VersionDescription\",\
          \"documentation\":\"<p>The description of the template version.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The template version.</p>\"\
    },\
    \"TemplateVersionSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TemplateVersionSummary\"},\
      \"max\":100\
    },\
    \"TeradataParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Host\",\
        \"Port\",\
        \"Database\"\
      ],\
      \"members\":{\
        \"Host\":{\
          \"shape\":\"Host\",\
          \"documentation\":\"<p>Host.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>Port.</p>\"\
        },\
        \"Database\":{\
          \"shape\":\"Database\",\
          \"documentation\":\"<p>Database.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Teradata parameters.</p>\"\
    },\
    \"TextQualifier\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DOUBLE_QUOTE\",\
        \"SINGLE_QUOTE\"\
      ]\
    },\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Access is throttled.</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"TimestampList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Timestamp\"}\
    },\
    \"TransformOperation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProjectOperation\":{\
          \"shape\":\"ProjectOperation\",\
          \"documentation\":\"<p>An operation that projects columns. Operations that come after a projection can only refer to projected columns.</p>\"\
        },\
        \"FilterOperation\":{\
          \"shape\":\"FilterOperation\",\
          \"documentation\":\"<p>An operation that filters rows based on some condition.</p>\"\
        },\
        \"CreateColumnsOperation\":{\
          \"shape\":\"CreateColumnsOperation\",\
          \"documentation\":\"<p>An operation that creates calculated columns. Columns created in one such operation form a lexical closure.</p>\"\
        },\
        \"RenameColumnOperation\":{\
          \"shape\":\"RenameColumnOperation\",\
          \"documentation\":\"<p>An operation that renames a column.</p>\"\
        },\
        \"CastColumnTypeOperation\":{\
          \"shape\":\"CastColumnTypeOperation\",\
          \"documentation\":\"<p>A transform operation that casts a column to a different type.</p>\"\
        },\
        \"TagColumnOperation\":{\
          \"shape\":\"TagColumnOperation\",\
          \"documentation\":\"<p>An operation that tags a column with additional information.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A data transformation on a logical table. This is a variant type structure. For this structure to be valid, only one of the attributes can be non-null.</p>\"\
    },\
    \"TransformOperationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TransformOperation\"},\
      \"max\":2048,\
      \"min\":1\
    },\
    \"TwitterParameters\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Query\",\
        \"MaxRows\"\
      ],\
      \"members\":{\
        \"Query\":{\
          \"shape\":\"Query\",\
          \"documentation\":\"<p>Twitter query string.</p>\"\
        },\
        \"MaxRows\":{\
          \"shape\":\"PositiveInteger\",\
          \"documentation\":\"<p>Maximum number of rows to query Twitter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Twitter parameters.</p>\"\
    },\
    \"TypeCastFormat\":{\
      \"type\":\"string\",\
      \"max\":32\
    },\
    \"UnsupportedUserEditionException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This error indicates that you are calling an operation on an Amazon QuickSight subscription where the edition doesn't include support for that operation. Amazon QuickSight currently has Standard Edition and Enterprise Edition. Not every operation and capability is available in every edition.</p>\",\
      \"error\":{\"httpStatusCode\":403},\
      \"exception\":true\
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
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource that you want to untag.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ResourceArn\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The keys of the key-value pairs for the resource tag or tags assigned to the resource.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"keys\"\
        }\
      }\
    },\
    \"UntagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"UpdateDashboardPermissionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DashboardId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the dashboard whose permissions you're updating.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DashboardId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the dashboard.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DashboardId\"\
        },\
        \"GrantPermissions\":{\
          \"shape\":\"UpdateResourcePermissionList\",\
          \"documentation\":\"<p>The permissions that you want to grant on this resource.</p>\"\
        },\
        \"RevokePermissions\":{\
          \"shape\":\"UpdateResourcePermissionList\",\
          \"documentation\":\"<p>The permissions that you want to revoke from this resource.</p>\"\
        }\
      }\
    },\
    \"UpdateDashboardPermissionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DashboardArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the dashboard.</p>\"\
        },\
        \"DashboardId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the dashboard.</p>\"\
        },\
        \"Permissions\":{\
          \"shape\":\"ResourcePermissionList\",\
          \"documentation\":\"<p>Information about the permissions on the dashboard.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"UpdateDashboardPublishedVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DashboardId\",\
        \"VersionNumber\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the dashboard that you're updating.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DashboardId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the dashboard.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DashboardId\"\
        },\
        \"VersionNumber\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>The version number of the dashboard.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"VersionNumber\"\
        }\
      }\
    },\
    \"UpdateDashboardPublishedVersionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DashboardId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the dashboard.</p>\"\
        },\
        \"DashboardArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the dashboard.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"UpdateDashboardRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DashboardId\",\
        \"Name\",\
        \"SourceEntity\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the dashboard that you're updating.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DashboardId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the dashboard.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DashboardId\"\
        },\
        \"Name\":{\
          \"shape\":\"DashboardName\",\
          \"documentation\":\"<p>The display name of the dashboard.</p>\"\
        },\
        \"SourceEntity\":{\
          \"shape\":\"DashboardSourceEntity\",\
          \"documentation\":\"<p>The template or analysis from which the dashboard is created. The <code>SouceTemplate</code> entity accepts the Amazon Resource Name (ARN) of the template and also references to replacement datasets for the placeholders set when creating the template. The replacement datasets need to follow the same schema as the datasets for which placeholders were created when creating the template.</p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"Parameters\",\
          \"documentation\":\"<p>A structure that contains the parameters of the dashboard.</p>\"\
        },\
        \"VersionDescription\":{\
          \"shape\":\"VersionDescription\",\
          \"documentation\":\"<p>A description for the first version of the dashboard being created.</p>\"\
        },\
        \"DashboardPublishOptions\":{\
          \"shape\":\"DashboardPublishOptions\",\
          \"documentation\":\"<p>Options for publishing the dashboard when you create it:</p> <ul> <li> <p> <code>AvailabilityStatus</code> for <code>AdHocFilteringOption</code> - This status can be either <code>ENABLED</code> or <code>DISABLED</code>. When this is set to <code>DISABLED</code>, QuickSight disables the left filter pane on the published dashboard, which can be used for ad hoc (one-time) filtering. This option is <code>ENABLED</code> by default. </p> </li> <li> <p> <code>AvailabilityStatus</code> for <code>ExportToCSVOption</code> - This status can be either <code>ENABLED</code> or <code>DISABLED</code>. The visual option to export data to .csv format isn't enabled when this is set to <code>DISABLED</code>. This option is <code>ENABLED</code> by default. </p> </li> <li> <p> <code>VisibilityState</code> for <code>SheetControlsOption</code> - This visibility state can be either <code>COLLAPSED</code> or <code>EXPANDED</code>. The sheet controls pane is collapsed by default when set to true. This option is <code>COLLAPSED</code> by default. </p> </li> </ul>\"\
        }\
      }\
    },\
    \"UpdateDashboardResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        },\
        \"VersionArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of the dashboard, including the version number.</p>\"\
        },\
        \"DashboardId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the dashboard.</p>\"\
        },\
        \"CreationStatus\":{\
          \"shape\":\"ResourceStatus\",\
          \"documentation\":\"<p>The creation status of the request.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"UpdateDataSetPermissionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DataSetId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DataSetId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID for the dataset whose permissions you want to update. This ID is unique per AWS Region for each AWS account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DataSetId\"\
        },\
        \"GrantPermissions\":{\
          \"shape\":\"ResourcePermissionList\",\
          \"documentation\":\"<p>The resource permissions that you want to grant to the dataset.</p>\"\
        },\
        \"RevokePermissions\":{\
          \"shape\":\"ResourcePermissionList\",\
          \"documentation\":\"<p>The resource permissions that you want to revoke from the dataset.</p>\"\
        }\
      }\
    },\
    \"UpdateDataSetPermissionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DataSetArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the dataset.</p>\"\
        },\
        \"DataSetId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID for the dataset whose permissions you want to update. This ID is unique per AWS Region for each AWS account.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"UpdateDataSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DataSetId\",\
        \"Name\",\
        \"PhysicalTableMap\",\
        \"ImportMode\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DataSetId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID for the dataset that you want to update. This ID is unique per AWS Region for each AWS account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DataSetId\"\
        },\
        \"Name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The display name for the dataset.</p>\"\
        },\
        \"PhysicalTableMap\":{\
          \"shape\":\"PhysicalTableMap\",\
          \"documentation\":\"<p>Declares the physical tables that are available in the underlying data sources.</p>\"\
        },\
        \"LogicalTableMap\":{\
          \"shape\":\"LogicalTableMap\",\
          \"documentation\":\"<p>Configures the combination and transformation of the data from the physical tables.</p>\"\
        },\
        \"ImportMode\":{\
          \"shape\":\"DataSetImportMode\",\
          \"documentation\":\"<p>Indicates whether you want to import the data into SPICE.</p>\"\
        },\
        \"ColumnGroups\":{\
          \"shape\":\"ColumnGroupList\",\
          \"documentation\":\"<p>Groupings of columns that work together in certain QuickSight features. Currently, only geospatial hierarchy is supported.</p>\"\
        },\
        \"RowLevelPermissionDataSet\":{\
          \"shape\":\"RowLevelPermissionDataSet\",\
          \"documentation\":\"<p>The row-level security configuration for the data you want to create.</p>\"\
        }\
      }\
    },\
    \"UpdateDataSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the dataset.</p>\"\
        },\
        \"DataSetId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID for the dataset that you want to create. This ID is unique per AWS Region for each AWS account.</p>\"\
        },\
        \"IngestionArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN for the ingestion, which is triggered as a result of dataset creation if the import mode is SPICE.</p>\"\
        },\
        \"IngestionId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the ingestion, which is triggered as a result of dataset creation if the import mode is SPICE.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"UpdateDataSourcePermissionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DataSourceId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DataSourceId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the data source. This ID is unique per AWS Region for each AWS account. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DataSourceId\"\
        },\
        \"GrantPermissions\":{\
          \"shape\":\"ResourcePermissionList\",\
          \"documentation\":\"<p>A list of resource permissions that you want to grant on the data source.</p>\"\
        },\
        \"RevokePermissions\":{\
          \"shape\":\"ResourcePermissionList\",\
          \"documentation\":\"<p>A list of resource permissions that you want to revoke on the data source.</p>\"\
        }\
      }\
    },\
    \"UpdateDataSourcePermissionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DataSourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the data source.</p>\"\
        },\
        \"DataSourceId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"UpdateDataSourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"DataSourceId\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"DataSourceId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the data source. This ID is unique per AWS Region for each AWS account. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DataSourceId\"\
        },\
        \"Name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>A display name for the data source.</p>\"\
        },\
        \"DataSourceParameters\":{\
          \"shape\":\"DataSourceParameters\",\
          \"documentation\":\"<p>The parameters that QuickSight uses to connect to your underlying source.</p>\"\
        },\
        \"Credentials\":{\
          \"shape\":\"DataSourceCredentials\",\
          \"documentation\":\"<p>The credentials that QuickSight that uses to connect to your underlying source. Currently, only credentials based on user name and password are supported.</p>\"\
        },\
        \"VpcConnectionProperties\":{\
          \"shape\":\"VpcConnectionProperties\",\
          \"documentation\":\"<p>Use this parameter only when you want QuickSight to use a VPC connection when connecting to your underlying source.</p>\"\
        },\
        \"SslProperties\":{\
          \"shape\":\"SslProperties\",\
          \"documentation\":\"<p>Secure Socket Layer (SSL) properties that apply when QuickSight connects to your underlying source.</p>\"\
        }\
      }\
    },\
    \"UpdateDataSourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the data source.</p>\"\
        },\
        \"DataSourceId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the data source. This ID is unique per AWS Region for each AWS account.</p>\"\
        },\
        \"UpdateStatus\":{\
          \"shape\":\"ResourceStatus\",\
          \"documentation\":\"<p>The update status of the data source's last update.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"UpdateGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GroupName\",\
        \"AwsAccountId\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"GroupName\":{\
          \"shape\":\"GroupName\",\
          \"documentation\":\"<p>The name of the group that you want to update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"GroupName\"\
        },\
        \"Description\":{\
          \"shape\":\"GroupDescription\",\
          \"documentation\":\"<p>The description for the group that you want to update.</p>\"\
        },\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID for the AWS account that the group is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace. Currently, you should set this to <code>default</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        }\
      }\
    },\
    \"UpdateGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Group\":{\
          \"shape\":\"Group\",\
          \"documentation\":\"<p>The name of the group.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"UpdateIAMPolicyAssignmentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"AssignmentName\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the IAM policy assignment.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"AssignmentName\":{\
          \"shape\":\"IAMPolicyAssignmentName\",\
          \"documentation\":\"<p>The name of the assignment. This name must be unique within an AWS account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AssignmentName\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace of the assignment.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        },\
        \"AssignmentStatus\":{\
          \"shape\":\"AssignmentStatus\",\
          \"documentation\":\"<p>The status of the assignment. Possible values are as follows:</p> <ul> <li> <p> <code>ENABLED</code> - Anything specified in this assignment is used when creating the data source.</p> </li> <li> <p> <code>DISABLED</code> - This assignment isn't used when creating the data source.</p> </li> <li> <p> <code>DRAFT</code> - This assignment is an unfinished draft and isn't used when creating the data source.</p> </li> </ul>\"\
        },\
        \"PolicyArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN for the IAM policy to apply to the QuickSight users and groups specified in this assignment.</p>\"\
        },\
        \"Identities\":{\
          \"shape\":\"IdentityMap\",\
          \"documentation\":\"<p>The QuickSight users, groups, or both that you want to assign the policy to.</p>\"\
        }\
      }\
    },\
    \"UpdateIAMPolicyAssignmentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AssignmentName\":{\
          \"shape\":\"IAMPolicyAssignmentName\",\
          \"documentation\":\"<p>The name of the assignment. </p>\"\
        },\
        \"AssignmentId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the assignment.</p>\"\
        },\
        \"PolicyArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN for the IAM policy applied to the QuickSight users and groups specified in this assignment.</p>\"\
        },\
        \"Identities\":{\
          \"shape\":\"IdentityMap\",\
          \"documentation\":\"<p>The QuickSight users, groups, or both that the IAM policy is assigned to.</p>\"\
        },\
        \"AssignmentStatus\":{\
          \"shape\":\"AssignmentStatus\",\
          \"documentation\":\"<p>The status of the assignment. Possible values are as follows:</p> <ul> <li> <p> <code>ENABLED</code> - Anything specified in this assignment is used when creating the data source.</p> </li> <li> <p> <code>DISABLED</code> - This assignment isn't used when creating the data source.</p> </li> <li> <p> <code>DRAFT</code> - This assignment is an unfinished draft and isn't used when creating the data source.</p> </li> </ul>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"UpdateResourcePermissionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourcePermission\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"UpdateTemplateAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"TemplateId\",\
        \"AliasName\",\
        \"TemplateVersionNumber\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the template alias that you're updating.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TemplateId\"\
        },\
        \"AliasName\":{\
          \"shape\":\"AliasName\",\
          \"documentation\":\"<p>The alias of the template that you want to update. If you name a specific alias, you update the version that the alias points to. You can specify the latest version of the template by providing the keyword <code>$LATEST</code> in the <code>AliasName</code> parameter. The keyword <code>$PUBLISHED</code> doesn't apply to templates.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AliasName\"\
        },\
        \"TemplateVersionNumber\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>The version number of the template.</p>\"\
        }\
      }\
    },\
    \"UpdateTemplateAliasResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateAlias\":{\
          \"shape\":\"TemplateAlias\",\
          \"documentation\":\"<p>The template alias.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"UpdateTemplatePermissionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"TemplateId\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TemplateId\"\
        },\
        \"GrantPermissions\":{\
          \"shape\":\"UpdateResourcePermissionList\",\
          \"documentation\":\"<p>A list of resource permissions to be granted on the template. </p>\"\
        },\
        \"RevokePermissions\":{\
          \"shape\":\"UpdateResourcePermissionList\",\
          \"documentation\":\"<p>A list of resource permissions to be revoked from the template. </p>\"\
        }\
      }\
    },\
    \"UpdateTemplatePermissionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the template.</p>\"\
        },\
        \"TemplateArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the template.</p>\"\
        },\
        \"Permissions\":{\
          \"shape\":\"ResourcePermissionList\",\
          \"documentation\":\"<p>A list of resource permissions to be set on the template.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"UpdateTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AwsAccountId\",\
        \"TemplateId\",\
        \"SourceEntity\"\
      ],\
      \"members\":{\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that contains the template that you're updating.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TemplateId\"\
        },\
        \"SourceEntity\":{\
          \"shape\":\"TemplateSourceEntity\",\
          \"documentation\":\"<p>The source QuickSight entity from which this template is being updated. You can currently update templates from an Analysis or another template.</p>\"\
        },\
        \"VersionDescription\":{\
          \"shape\":\"VersionDescription\",\
          \"documentation\":\"<p>A description of the current template version that is being updated. Every time you call <code>UpdateTemplate</code>, you create a new version of the template. Each version of the template maintains a description of the version in the <code>VersionDescription</code> field.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name for the template.</p>\"\
        }\
      }\
    },\
    \"UpdateTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateId\":{\
          \"shape\":\"RestrictiveResourceId\",\
          \"documentation\":\"<p>The ID for the template.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the template.</p>\"\
        },\
        \"VersionArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN for the template, including the version information of the first version.</p>\"\
        },\
        \"CreationStatus\":{\
          \"shape\":\"ResourceStatus\",\
          \"documentation\":\"<p>The creation status of the template.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        }\
      }\
    },\
    \"UpdateUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserName\",\
        \"AwsAccountId\",\
        \"Namespace\",\
        \"Email\",\
        \"Role\"\
      ],\
      \"members\":{\
        \"UserName\":{\
          \"shape\":\"UserName\",\
          \"documentation\":\"<p>The Amazon QuickSight user name that you want to update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserName\"\
        },\
        \"AwsAccountId\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID for the AWS account that the user is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AwsAccountId\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace. Currently, you should set this to <code>default</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Namespace\"\
        },\
        \"Email\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The email address of the user that you want to update.</p>\"\
        },\
        \"Role\":{\
          \"shape\":\"UserRole\",\
          \"documentation\":\"<p>The Amazon QuickSight role of the user. The user role can be one of the following:</p> <ul> <li> <p> <code>READER</code>: A user who has read-only access to dashboards.</p> </li> <li> <p> <code>AUTHOR</code>: A user who can create data sources, datasets, analyses, and dashboards.</p> </li> <li> <p> <code>ADMIN</code>: A user who is an author, who can also manage Amazon QuickSight settings.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"UpdateUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"User\":{\
          \"shape\":\"User\",\
          \"documentation\":\"<p>The Amazon QuickSight user.</p>\"\
        },\
        \"RequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS request ID for this operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The HTTP status of the request.</p>\",\
          \"location\":\"statusCode\"\
        }\
      }\
    },\
    \"UploadSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Format\":{\
          \"shape\":\"FileFormat\",\
          \"documentation\":\"<p>File format.</p>\"\
        },\
        \"StartFromRow\":{\
          \"shape\":\"PositiveInteger\",\
          \"documentation\":\"<p>A row number to start reading data from.</p>\",\
          \"box\":true\
        },\
        \"ContainsHeader\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether the file has a header row, or the files each have a header row.</p>\",\
          \"box\":true\
        },\
        \"TextQualifier\":{\
          \"shape\":\"TextQualifier\",\
          \"documentation\":\"<p>Text qualifier.</p>\"\
        },\
        \"Delimiter\":{\
          \"shape\":\"Delimiter\",\
          \"documentation\":\"<p>The delimiter between values in the file.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the format for a source file or files.</p>\"\
    },\
    \"User\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the user.</p>\"\
        },\
        \"UserName\":{\
          \"shape\":\"UserName\",\
          \"documentation\":\"<p>The user's user name.</p>\"\
        },\
        \"Email\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The user's email address.</p>\"\
        },\
        \"Role\":{\
          \"shape\":\"UserRole\",\
          \"documentation\":\"<p>The Amazon QuickSight role for the user. The user role can be one of the following:.</p> <ul> <li> <p> <code>READER</code>: A user who has read-only access to dashboards.</p> </li> <li> <p> <code>AUTHOR</code>: A user who can create data sources, datasets, analyses, and dashboards.</p> </li> <li> <p> <code>ADMIN</code>: A user who is an author, who can also manage Amazon QuickSight settings.</p> </li> <li> <p> <code>RESTRICTED_READER</code>: This role isn't currently available for use.</p> </li> <li> <p> <code>RESTRICTED_AUTHOR</code>: This role isn't currently available for use.</p> </li> </ul>\"\
        },\
        \"IdentityType\":{\
          \"shape\":\"IdentityType\",\
          \"documentation\":\"<p>The type of identity authentication used by the user.</p>\"\
        },\
        \"Active\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>The active status of user. When you create an Amazon QuickSight user thatâs not an IAM user or an Active Directory user, that user is inactive until they sign in and provide a password.</p>\"\
        },\
        \"PrincipalId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The principal ID of the user.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A registered user of Amazon QuickSight. Currently, an Amazon QuickSight subscription can't contain more than 20 million users.</p>\"\
    },\
    \"UserList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"User\"}\
    },\
    \"UserName\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\u00FF]+\"\
    },\
    \"UserRole\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ADMIN\",\
        \"AUTHOR\",\
        \"READER\",\
        \"RESTRICTED_AUTHOR\",\
        \"RESTRICTED_READER\"\
      ]\
    },\
    \"Username\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"VersionDescription\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1\
    },\
    \"VersionNumber\":{\
      \"type\":\"long\",\
      \"min\":1\
    },\
    \"VpcConnectionProperties\":{\
      \"type\":\"structure\",\
      \"required\":[\"VpcConnectionArn\"],\
      \"members\":{\
        \"VpcConnectionArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the VPC connection.</p>\"\
        }\
      },\
      \"documentation\":\"<p>VPC connection properties.</p>\"\
    },\
    \"Warehouse\":{\
      \"type\":\"string\",\
      \"max\":128\
    },\
    \"WorkGroup\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"boolean\":{\"type\":\"boolean\"},\
    \"long\":{\"type\":\"long\"},\
    \"string\":{\"type\":\"string\"},\
    \"timestamp\":{\"type\":\"timestamp\"}\
  },\
  \"documentation\":\"<fullname>Amazon QuickSight API Reference</fullname> <p>Amazon QuickSight is a fully managed, serverless business intelligence service for the AWS Cloud that makes it easy to extend data and insights to every user in your organization. This API reference contains documentation for a programming interface that you can use to manage Amazon QuickSight. </p>\"\
}\
";
}

@end
