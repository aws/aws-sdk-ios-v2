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

#import "AWSfmsResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSfmsResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSfmsResources

+ (instancetype)sharedInstance {
    static AWSfmsResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSfmsResources new];
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
    \"apiVersion\":\"2018-01-01\",\
    \"endpointPrefix\":\"fms\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceAbbreviation\":\"FMS\",\
    \"serviceFullName\":\"Firewall Management Service\",\
    \"serviceId\":\"FMS\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"AWSFMS_20180101\",\
    \"uid\":\"fms-2018-01-01\"\
  },\
  \"operations\":{\
    \"AssociateAdminAccount\":{\
      \"name\":\"AssociateAdminAccount\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AssociateAdminAccountRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Sets the AWS Firewall Manager administrator account. AWS Firewall Manager must be associated with the master account of your AWS organization or associated with a member account that has the appropriate permissions. If the account ID that you submit is not an AWS Organizations master account, AWS Firewall Manager will set the appropriate permissions for the given member account.</p> <p>The account that you associate with AWS Firewall Manager is called the AWS Firewall Manager administrator account. </p>\"\
    },\
    \"DeleteNotificationChannel\":{\
      \"name\":\"DeleteNotificationChannel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteNotificationChannelRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes an AWS Firewall Manager association with the IAM role and the Amazon Simple Notification Service (SNS) topic that is used to record AWS Firewall Manager SNS logs.</p>\"\
    },\
    \"DeletePolicy\":{\
      \"name\":\"DeletePolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeletePolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Permanently deletes an AWS Firewall Manager policy. </p>\"\
    },\
    \"DisassociateAdminAccount\":{\
      \"name\":\"DisassociateAdminAccount\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisassociateAdminAccountRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Disassociates the account that has been set as the AWS Firewall Manager administrator account. To set a different account as the administrator account, you must submit an <code>AssociateAdminAccount</code> request.</p>\"\
    },\
    \"GetAdminAccount\":{\
      \"name\":\"GetAdminAccount\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetAdminAccountRequest\"},\
      \"output\":{\"shape\":\"GetAdminAccountResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Returns the AWS Organizations master account that is associated with AWS Firewall Manager as the AWS Firewall Manager administrator.</p>\"\
    },\
    \"GetComplianceDetail\":{\
      \"name\":\"GetComplianceDetail\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetComplianceDetailRequest\"},\
      \"output\":{\"shape\":\"GetComplianceDetailResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Returns detailed compliance information about the specified member account. Details include resources that are in and out of compliance with the specified policy. Resources are considered noncompliant for AWS WAF and Shield Advanced policies if the specified policy has not been applied to them. Resources are considered noncompliant for security group policies if they are in scope of the policy, they violate one or more of the policy rules, and remediation is disabled or not possible. </p>\"\
    },\
    \"GetNotificationChannel\":{\
      \"name\":\"GetNotificationChannel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetNotificationChannelRequest\"},\
      \"output\":{\"shape\":\"GetNotificationChannelResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Information about the Amazon Simple Notification Service (SNS) topic that is used to record AWS Firewall Manager SNS logs.</p>\"\
    },\
    \"GetPolicy\":{\
      \"name\":\"GetPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetPolicyRequest\"},\
      \"output\":{\"shape\":\"GetPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"InvalidTypeException\"}\
      ],\
      \"documentation\":\"<p>Returns information about the specified AWS Firewall Manager policy.</p>\"\
    },\
    \"GetProtectionStatus\":{\
      \"name\":\"GetProtectionStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetProtectionStatusRequest\"},\
      \"output\":{\"shape\":\"GetProtectionStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>If you created a Shield Advanced policy, returns policy-level attack summary information in the event of a potential DDoS attack. Other policy types are currently unsupported.</p>\"\
    },\
    \"ListComplianceStatus\":{\
      \"name\":\"ListComplianceStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListComplianceStatusRequest\"},\
      \"output\":{\"shape\":\"ListComplianceStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Returns an array of <code>PolicyComplianceStatus</code> objects in the response. Use <code>PolicyComplianceStatus</code> to get a summary of which member accounts are protected by the specified policy. </p>\"\
    },\
    \"ListMemberAccounts\":{\
      \"name\":\"ListMemberAccounts\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListMemberAccountsRequest\"},\
      \"output\":{\"shape\":\"ListMemberAccountsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Returns a <code>MemberAccounts</code> object that lists the member accounts in the administrator's AWS organization.</p> <p>The <code>ListMemberAccounts</code> must be submitted by the account that is set as the AWS Firewall Manager administrator.</p>\"\
    },\
    \"ListPolicies\":{\
      \"name\":\"ListPolicies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListPoliciesRequest\"},\
      \"output\":{\"shape\":\"ListPoliciesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Returns an array of <code>PolicySummary</code> objects in the response.</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"InvalidInputException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the list of tags for the specified AWS resource. </p>\"\
    },\
    \"PutNotificationChannel\":{\
      \"name\":\"PutNotificationChannel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutNotificationChannelRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Designates the IAM role and Amazon Simple Notification Service (SNS) topic that AWS Firewall Manager uses to record SNS logs.</p>\"\
    },\
    \"PutPolicy\":{\
      \"name\":\"PutPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutPolicyRequest\"},\
      \"output\":{\"shape\":\"PutPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"InvalidTypeException\"}\
      ],\
      \"documentation\":\"<p>Creates an AWS Firewall Manager policy.</p> <p>Firewall Manager provides the following types of policies: </p> <ul> <li> <p>A Shield Advanced policy, which applies Shield Advanced protection to specified accounts and resources</p> </li> <li> <p>An AWS WAF policy (type WAFV2), which defines rule groups to run first in the corresponding AWS WAF web ACL and rule groups to run last in the web ACL.</p> </li> <li> <p>An AWS WAF Classic policy (type WAF), which defines a rule group. </p> </li> <li> <p>A security group policy, which manages VPC security groups across your AWS organization. </p> </li> </ul> <p>Each policy is specific to one of the types. If you want to enforce more than one policy type across accounts, create multiple policies. You can create multiple policies for each type.</p> <p>You must be subscribed to Shield Advanced to create a Shield Advanced policy. For more information about subscribing to Shield Advanced, see <a href=\\\"https://docs.aws.amazon.com/waf/latest/DDOSAPIReference/API_CreateSubscription.html\\\">CreateSubscription</a>.</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"output\":{\"shape\":\"TagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Adds one or more tags to an AWS resource.</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"output\":{\"shape\":\"UntagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"InvalidInputException\"}\
      ],\
      \"documentation\":\"<p>Removes one or more tags from an AWS resource.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AWSAccountId\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"^[0-9]+$\"\
    },\
    \"AccountRoleStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"READY\",\
        \"CREATING\",\
        \"PENDING_DELETION\",\
        \"DELETING\",\
        \"DELETED\"\
      ]\
    },\
    \"AssociateAdminAccountRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AdminAccount\"],\
      \"members\":{\
        \"AdminAccount\":{\
          \"shape\":\"AWSAccountId\",\
          \"documentation\":\"<p>The AWS account ID to associate with AWS Firewall Manager as the AWS Firewall Manager administrator account. This can be an AWS Organizations master account or a member account. For more information about AWS Organizations and master accounts, see <a href=\\\"https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts.html\\\">Managing the AWS Accounts in Your Organization</a>. </p>\"\
        }\
      }\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"ComplianceViolator\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The resource ID.</p>\"\
        },\
        \"ViolationReason\":{\
          \"shape\":\"ViolationReason\",\
          \"documentation\":\"<p>The reason that the resource is not protected by the policy.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The resource type. This is in the format shown in the <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html\\\">AWS Resource Types Reference</a>. For example: <code>AWS::ElasticLoadBalancingV2::LoadBalancer</code> or <code>AWS::CloudFront::Distribution</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details of the resource that is not protected by the policy.</p>\"\
    },\
    \"ComplianceViolators\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ComplianceViolator\"}\
    },\
    \"CustomerPolicyScopeId\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"CustomerPolicyScopeIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CustomerPolicyScopeId\"}\
    },\
    \"CustomerPolicyScopeIdType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACCOUNT\",\
        \"ORG_UNIT\"\
      ]\
    },\
    \"CustomerPolicyScopeMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"CustomerPolicyScopeIdType\"},\
      \"value\":{\"shape\":\"CustomerPolicyScopeIdList\"}\
    },\
    \"DeleteNotificationChannelRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeletePolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PolicyId\"],\
      \"members\":{\
        \"PolicyId\":{\
          \"shape\":\"PolicyId\",\
          \"documentation\":\"<p>The ID of the policy that you want to delete. <code>PolicyId</code> is returned by <code>PutPolicy</code> and by <code>ListPolicies</code>.</p>\"\
        },\
        \"DeleteAllPolicyResources\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If <code>True</code>, the request performs cleanup according to the policy type. </p> <p>For AWS WAF and Shield Advanced policies, the cleanup does the following:</p> <ul> <li> <p>Deletes rule groups created by AWS Firewall Manager</p> </li> <li> <p>Removes web ACLs from in-scope resources</p> </li> <li> <p>Deletes web ACLs that contain no rules or rule groups</p> </li> </ul> <p>For security group policies, the cleanup does the following for each security group in the policy:</p> <ul> <li> <p>Disassociates the security group from in-scope resources </p> </li> <li> <p>Deletes the security group if it was created through Firewall Manager and if it's no longer associated with any resources through another policy</p> </li> </ul> <p>After the cleanup, in-scope resources are no longer protected by web ACLs in this policy. Protection of out-of-scope resources remains unchanged. Scope is determined by tags that you create and accounts that you associate with the policy. When creating the policy, if you specify that only resources in specific accounts or with specific tags are in scope of the policy, those accounts and resources are handled by the policy. All others are out of scope. If you don't specify tags or accounts, all resources are in scope. </p>\"\
        }\
      }\
    },\
    \"DependentServiceName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AWSCONFIG\",\
        \"AWSWAF\",\
        \"AWSSHIELD_ADVANCED\",\
        \"AWSVPC\"\
      ]\
    },\
    \"DetailedInfo\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"DisassociateAdminAccountRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"ErrorMessage\":{\"type\":\"string\"},\
    \"EvaluationResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ComplianceStatus\":{\
          \"shape\":\"PolicyComplianceStatusType\",\
          \"documentation\":\"<p>Describes an AWS account's compliance with the AWS Firewall Manager policy.</p>\"\
        },\
        \"ViolatorCount\":{\
          \"shape\":\"ResourceCount\",\
          \"documentation\":\"<p>The number of resources that are noncompliant with the specified policy. For AWS WAF and Shield Advanced policies, a resource is considered noncompliant if it is not associated with the policy. For security group policies, a resource is considered noncompliant if it doesn't comply with the rules of the policy and remediation is disabled or not possible.</p>\"\
        },\
        \"EvaluationLimitExceeded\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates that over 100 resources are noncompliant with the AWS Firewall Manager policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the compliance status for the account. An account is considered noncompliant if it includes resources that are not protected by the specified policy or that don't comply with the policy.</p>\"\
    },\
    \"EvaluationResults\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EvaluationResult\"}\
    },\
    \"GetAdminAccountRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"GetAdminAccountResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AdminAccount\":{\
          \"shape\":\"AWSAccountId\",\
          \"documentation\":\"<p>The AWS account that is set as the AWS Firewall Manager administrator.</p>\"\
        },\
        \"RoleStatus\":{\
          \"shape\":\"AccountRoleStatus\",\
          \"documentation\":\"<p>The status of the AWS account that you set as the AWS Firewall Manager administrator.</p>\"\
        }\
      }\
    },\
    \"GetComplianceDetailRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PolicyId\",\
        \"MemberAccount\"\
      ],\
      \"members\":{\
        \"PolicyId\":{\
          \"shape\":\"PolicyId\",\
          \"documentation\":\"<p>The ID of the policy that you want to get the details for. <code>PolicyId</code> is returned by <code>PutPolicy</code> and by <code>ListPolicies</code>.</p>\"\
        },\
        \"MemberAccount\":{\
          \"shape\":\"AWSAccountId\",\
          \"documentation\":\"<p>The AWS account that owns the resources that you want to get the details for.</p>\"\
        }\
      }\
    },\
    \"GetComplianceDetailResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyComplianceDetail\":{\
          \"shape\":\"PolicyComplianceDetail\",\
          \"documentation\":\"<p>Information about the resources and the policy that you specified in the <code>GetComplianceDetail</code> request.</p>\"\
        }\
      }\
    },\
    \"GetNotificationChannelRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"GetNotificationChannelResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SnsTopicArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The SNS topic that records AWS Firewall Manager activity. </p>\"\
        },\
        \"SnsRoleName\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The IAM role that is used by AWS Firewall Manager to record activity to SNS.</p>\"\
        }\
      }\
    },\
    \"GetPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PolicyId\"],\
      \"members\":{\
        \"PolicyId\":{\
          \"shape\":\"PolicyId\",\
          \"documentation\":\"<p>The ID of the AWS Firewall Manager policy that you want the details for.</p>\"\
        }\
      }\
    },\
    \"GetPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Policy\":{\
          \"shape\":\"Policy\",\
          \"documentation\":\"<p>Information about the specified AWS Firewall Manager policy.</p>\"\
        },\
        \"PolicyArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the specified policy.</p>\"\
        }\
      }\
    },\
    \"GetProtectionStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PolicyId\"],\
      \"members\":{\
        \"PolicyId\":{\
          \"shape\":\"PolicyId\",\
          \"documentation\":\"<p>The ID of the policy for which you want to get the attack information.</p>\"\
        },\
        \"MemberAccountId\":{\
          \"shape\":\"AWSAccountId\",\
          \"documentation\":\"<p>The AWS account that is in scope of the policy that you want to get the details for.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"TimeStamp\",\
          \"documentation\":\"<p>The start of the time period to query for the attacks. This is a <code>timestamp</code> type. The request syntax listing indicates a <code>number</code> type because the default used by AWS Firewall Manager is Unix time in seconds. However, any valid <code>timestamp</code> format is allowed.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"TimeStamp\",\
          \"documentation\":\"<p>The end of the time period to query for the attacks. This is a <code>timestamp</code> type. The request syntax listing indicates a <code>number</code> type because the default used by AWS Firewall Manager is Unix time in seconds. However, any valid <code>timestamp</code> format is allowed.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If you specify a value for <code>MaxResults</code> and you have more objects than the number that you specify for <code>MaxResults</code>, AWS Firewall Manager returns a <code>NextToken</code> value in the response, which you can use to retrieve another group of objects. For the second and subsequent <code>GetProtectionStatus</code> requests, specify the value of <code>NextToken</code> from the previous response to get information about another batch of objects.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PaginationMaxResults\",\
          \"documentation\":\"<p>Specifies the number of objects that you want AWS Firewall Manager to return for this request. If you have more objects than the number that you specify for <code>MaxResults</code>, the response includes a <code>NextToken</code> value that you can use to get another batch of objects.</p>\"\
        }\
      }\
    },\
    \"GetProtectionStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AdminAccountId\":{\
          \"shape\":\"AWSAccountId\",\
          \"documentation\":\"<p>The ID of the AWS Firewall administrator account for this policy.</p>\"\
        },\
        \"ServiceType\":{\
          \"shape\":\"SecurityServiceType\",\
          \"documentation\":\"<p>The service type that is protected by the policy. Currently, this is always <code>SHIELD_ADVANCED</code>.</p>\"\
        },\
        \"Data\":{\
          \"shape\":\"ProtectionData\",\
          \"documentation\":\"<p>Details about the attack, including the following:</p> <ul> <li> <p>Attack type</p> </li> <li> <p>Account ID</p> </li> <li> <p>ARN of the resource attacked</p> </li> <li> <p>Start time of the attack</p> </li> <li> <p>End time of the attack (ongoing attacks will not have an end time)</p> </li> </ul> <p>The details are in JSON format. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If you have more objects than the number that you specified for <code>MaxResults</code> in the request, the response includes a <code>NextToken</code> value. To list more objects, submit another <code>GetProtectionStatus</code> request, and specify the <code>NextToken</code> value from the response in the <code>NextToken</code> value in the next request.</p> <p>AWS SDKs provide auto-pagination that identify <code>NextToken</code> in a response and make subsequent request calls automatically on your behalf. However, this feature is not supported by <code>GetProtectionStatus</code>. You must submit subsequent requests with <code>NextToken</code> using your own processes. </p>\"\
        }\
      }\
    },\
    \"InternalErrorException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The operation failed because of a system problem, even though the request was valid. Retry your request.</p>\",\
      \"exception\":true\
    },\
    \"InvalidInputException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The parameters of the request were invalid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidOperationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The operation failed because there was nothing to do. For example, you might have submitted an <code>AssociateAdminAccount</code> request, but the account ID that you submitted was already set as the AWS Firewall Manager administrator.</p>\",\
      \"exception\":true\
    },\
    \"InvalidTypeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The value of the <code>Type</code> parameter is invalid.</p>\",\
      \"exception\":true\
    },\
    \"IssueInfoMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"DependentServiceName\"},\
      \"value\":{\"shape\":\"DetailedInfo\"}\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The operation exceeds a resource limit, for example, the maximum number of <code>policy</code> objects that you can create for an AWS account. For more information, see <a href=\\\"https://docs.aws.amazon.com/waf/latest/developerguide/fms-limits.html\\\">Firewall Manager Limits</a> in the <i>AWS WAF Developer Guide</i>.</p>\",\
      \"exception\":true\
    },\
    \"ListComplianceStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PolicyId\"],\
      \"members\":{\
        \"PolicyId\":{\
          \"shape\":\"PolicyId\",\
          \"documentation\":\"<p>The ID of the AWS Firewall Manager policy that you want the details for.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If you specify a value for <code>MaxResults</code> and you have more <code>PolicyComplianceStatus</code> objects than the number that you specify for <code>MaxResults</code>, AWS Firewall Manager returns a <code>NextToken</code> value in the response that allows you to list another group of <code>PolicyComplianceStatus</code> objects. For the second and subsequent <code>ListComplianceStatus</code> requests, specify the value of <code>NextToken</code> from the previous response to get information about another batch of <code>PolicyComplianceStatus</code> objects.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PaginationMaxResults\",\
          \"documentation\":\"<p>Specifies the number of <code>PolicyComplianceStatus</code> objects that you want AWS Firewall Manager to return for this request. If you have more <code>PolicyComplianceStatus</code> objects than the number that you specify for <code>MaxResults</code>, the response includes a <code>NextToken</code> value that you can use to get another batch of <code>PolicyComplianceStatus</code> objects.</p>\"\
        }\
      }\
    },\
    \"ListComplianceStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyComplianceStatusList\":{\
          \"shape\":\"PolicyComplianceStatusList\",\
          \"documentation\":\"<p>An array of <code>PolicyComplianceStatus</code> objects.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If you have more <code>PolicyComplianceStatus</code> objects than the number that you specified for <code>MaxResults</code> in the request, the response includes a <code>NextToken</code> value. To list more <code>PolicyComplianceStatus</code> objects, submit another <code>ListComplianceStatus</code> request, and specify the <code>NextToken</code> value from the response in the <code>NextToken</code> value in the next request.</p>\"\
        }\
      }\
    },\
    \"ListMemberAccountsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If you specify a value for <code>MaxResults</code> and you have more account IDs than the number that you specify for <code>MaxResults</code>, AWS Firewall Manager returns a <code>NextToken</code> value in the response that allows you to list another group of IDs. For the second and subsequent <code>ListMemberAccountsRequest</code> requests, specify the value of <code>NextToken</code> from the previous response to get information about another batch of member account IDs.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PaginationMaxResults\",\
          \"documentation\":\"<p>Specifies the number of member account IDs that you want AWS Firewall Manager to return for this request. If you have more IDs than the number that you specify for <code>MaxResults</code>, the response includes a <code>NextToken</code> value that you can use to get another batch of member account IDs.</p>\"\
        }\
      }\
    },\
    \"ListMemberAccountsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MemberAccounts\":{\
          \"shape\":\"MemberAccounts\",\
          \"documentation\":\"<p>An array of account IDs.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If you have more member account IDs than the number that you specified for <code>MaxResults</code> in the request, the response includes a <code>NextToken</code> value. To list more IDs, submit another <code>ListMemberAccounts</code> request, and specify the <code>NextToken</code> value from the response in the <code>NextToken</code> value in the next request.</p>\"\
        }\
      }\
    },\
    \"ListPoliciesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If you specify a value for <code>MaxResults</code> and you have more <code>PolicySummary</code> objects than the number that you specify for <code>MaxResults</code>, AWS Firewall Manager returns a <code>NextToken</code> value in the response that allows you to list another group of <code>PolicySummary</code> objects. For the second and subsequent <code>ListPolicies</code> requests, specify the value of <code>NextToken</code> from the previous response to get information about another batch of <code>PolicySummary</code> objects.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PaginationMaxResults\",\
          \"documentation\":\"<p>Specifies the number of <code>PolicySummary</code> objects that you want AWS Firewall Manager to return for this request. If you have more <code>PolicySummary</code> objects than the number that you specify for <code>MaxResults</code>, the response includes a <code>NextToken</code> value that you can use to get another batch of <code>PolicySummary</code> objects.</p>\"\
        }\
      }\
    },\
    \"ListPoliciesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyList\":{\
          \"shape\":\"PolicySummaryList\",\
          \"documentation\":\"<p>An array of <code>PolicySummary</code> objects.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If you have more <code>PolicySummary</code> objects than the number that you specified for <code>MaxResults</code> in the request, the response includes a <code>NextToken</code> value. To list more <code>PolicySummary</code> objects, submit another <code>ListPolicies</code> request, and specify the <code>NextToken</code> value from the response in the <code>NextToken</code> value in the next request.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource to return tags for. The Firewall Manager policy is the only AWS resource that supports tagging, so this ARN is a policy ARN..</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TagList\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags associated with the resource.</p>\"\
        }\
      }\
    },\
    \"ManagedServiceData\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":1,\
      \"pattern\":\".*\"\
    },\
    \"MemberAccounts\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AWSAccountId\"}\
    },\
    \"PaginationMaxResults\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"PaginationToken\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"Policy\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PolicyName\",\
        \"SecurityServicePolicyData\",\
        \"ResourceType\",\
        \"ExcludeResourceTags\",\
        \"RemediationEnabled\"\
      ],\
      \"members\":{\
        \"PolicyId\":{\
          \"shape\":\"PolicyId\",\
          \"documentation\":\"<p>The ID of the AWS Firewall Manager policy.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The friendly name of the AWS Firewall Manager policy.</p>\"\
        },\
        \"PolicyUpdateToken\":{\
          \"shape\":\"PolicyUpdateToken\",\
          \"documentation\":\"<p>A unique identifier for each update to the policy. When issuing a <code>PutPolicy</code> request, the <code>PolicyUpdateToken</code> in the request must match the <code>PolicyUpdateToken</code> of the current policy version. To get the <code>PolicyUpdateToken</code> of the current policy version, use a <code>GetPolicy</code> request.</p>\"\
        },\
        \"SecurityServicePolicyData\":{\
          \"shape\":\"SecurityServicePolicyData\",\
          \"documentation\":\"<p>Details about the security service that is being used to protect the resources.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of resource protected by or in scope of the policy. This is in the format shown in the <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html\\\">AWS Resource Types Reference</a>. For AWS WAF and Shield Advanced, examples include <code>AWS::ElasticLoadBalancingV2::LoadBalancer</code> and <code>AWS::CloudFront::Distribution</code>. For a security group common policy, valid values are <code>AWS::EC2::NetworkInterface</code> and <code>AWS::EC2::Instance</code>. For a security group content audit policy, valid values are <code>AWS::EC2::SecurityGroup</code>, <code>AWS::EC2::NetworkInterface</code>, and <code>AWS::EC2::Instance</code>. For a security group usage audit policy, the value is <code>AWS::EC2::SecurityGroup</code>. </p>\"\
        },\
        \"ResourceTypeList\":{\
          \"shape\":\"ResourceTypeList\",\
          \"documentation\":\"<p>An array of <code>ResourceType</code>.</p>\"\
        },\
        \"ResourceTags\":{\
          \"shape\":\"ResourceTags\",\
          \"documentation\":\"<p>An array of <code>ResourceTag</code> objects.</p>\"\
        },\
        \"ExcludeResourceTags\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If set to <code>True</code>, resources with the tags that are specified in the <code>ResourceTag</code> array are not in scope of the policy. If set to <code>False</code>, and the <code>ResourceTag</code> array is not null, only resources with the specified tags are in scope of the policy.</p>\"\
        },\
        \"RemediationEnabled\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates if the policy should be automatically applied to new resources.</p>\"\
        },\
        \"IncludeMap\":{\
          \"shape\":\"CustomerPolicyScopeMap\",\
          \"documentation\":\"<p>Specifies the AWS account IDs and AWS Organizations organizational units (OUs) to include in the policy. Specifying an OU is the equivalent of specifying all accounts in the OU and in any of its child OUs, including any child OUs and accounts that are added at a later time.</p> <p>You can specify inclusions or exclusions, but not both. If you specify an <code>IncludeMap</code>, AWS Firewall Manager applies the policy to all accounts specified by the <code>IncludeMap</code>, and does not evaluate any <code>ExcludeMap</code> specifications. If you do not specify an <code>IncludeMap</code>, then Firewall Manager applies the policy to all accounts except for those specified by the <code>ExcludeMap</code>.</p> <p>You can specify account IDs, OUs, or a combination: </p> <ul> <li> <p>Specify account IDs by setting the key to <code>ACCOUNT</code>. For example, the following is a valid map: <code>{âACCOUNTâ : [âaccountID1â, âaccountID2â]}</code>.</p> </li> <li> <p>Specify OUs by setting the key to <code>ORG_UNIT</code>. For example, the following is a valid map: <code>{âORG_UNITâ : [âouid111â, âouid112â]}</code>.</p> </li> <li> <p>Specify accounts and OUs together in a single map, separated with a comma. For example, the following is a valid map: <code>{âACCOUNTâ : [âaccountID1â, âaccountID2â], âORG_UNITâ : [âouid111â, âouid112â]}</code>.</p> </li> </ul>\"\
        },\
        \"ExcludeMap\":{\
          \"shape\":\"CustomerPolicyScopeMap\",\
          \"documentation\":\"<p>Specifies the AWS account IDs and AWS Organizations organizational units (OUs) to exclude from the policy. Specifying an OU is the equivalent of specifying all accounts in the OU and in any of its child OUs, including any child OUs and accounts that are added at a later time.</p> <p>You can specify inclusions or exclusions, but not both. If you specify an <code>IncludeMap</code>, AWS Firewall Manager applies the policy to all accounts specified by the <code>IncludeMap</code>, and does not evaluate any <code>ExcludeMap</code> specifications. If you do not specify an <code>IncludeMap</code>, then Firewall Manager applies the policy to all accounts except for those specified by the <code>ExcludeMap</code>.</p> <p>You can specify account IDs, OUs, or a combination: </p> <ul> <li> <p>Specify account IDs by setting the key to <code>ACCOUNT</code>. For example, the following is a valid map: <code>{âACCOUNTâ : [âaccountID1â, âaccountID2â]}</code>.</p> </li> <li> <p>Specify OUs by setting the key to <code>ORG_UNIT</code>. For example, the following is a valid map: <code>{âORG_UNITâ : [âouid111â, âouid112â]}</code>.</p> </li> <li> <p>Specify accounts and OUs together in a single map, separated with a comma. For example, the following is a valid map: <code>{âACCOUNTâ : [âaccountID1â, âaccountID2â], âORG_UNITâ : [âouid111â, âouid112â]}</code>.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>An AWS Firewall Manager policy.</p>\"\
    },\
    \"PolicyComplianceDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyOwner\":{\
          \"shape\":\"AWSAccountId\",\
          \"documentation\":\"<p>The AWS account that created the AWS Firewall Manager policy.</p>\"\
        },\
        \"PolicyId\":{\
          \"shape\":\"PolicyId\",\
          \"documentation\":\"<p>The ID of the AWS Firewall Manager policy.</p>\"\
        },\
        \"MemberAccount\":{\
          \"shape\":\"AWSAccountId\",\
          \"documentation\":\"<p>The AWS account ID.</p>\"\
        },\
        \"Violators\":{\
          \"shape\":\"ComplianceViolators\",\
          \"documentation\":\"<p>An array of resources that aren't protected by the AWS WAF or Shield Advanced policy or that aren't in compliance with the security group policy.</p>\"\
        },\
        \"EvaluationLimitExceeded\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates if over 100 resources are noncompliant with the AWS Firewall Manager policy.</p>\"\
        },\
        \"ExpiredAt\":{\
          \"shape\":\"TimeStamp\",\
          \"documentation\":\"<p>A timestamp that indicates when the returned information should be considered out of date.</p>\"\
        },\
        \"IssueInfoMap\":{\
          \"shape\":\"IssueInfoMap\",\
          \"documentation\":\"<p>Details about problems with dependent services, such as AWS WAF or AWS Config, that are causing a resource to be noncompliant. The details include the name of the dependent service and the error message received that indicates the problem with the service.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the noncompliant resources in a member account for a specific AWS Firewall Manager policy. A maximum of 100 entries are displayed. If more than 100 resources are noncompliant, <code>EvaluationLimitExceeded</code> is set to <code>True</code>.</p>\"\
    },\
    \"PolicyComplianceStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyOwner\":{\
          \"shape\":\"AWSAccountId\",\
          \"documentation\":\"<p>The AWS account that created the AWS Firewall Manager policy.</p>\"\
        },\
        \"PolicyId\":{\
          \"shape\":\"PolicyId\",\
          \"documentation\":\"<p>The ID of the AWS Firewall Manager policy.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The friendly name of the AWS Firewall Manager policy.</p>\"\
        },\
        \"MemberAccount\":{\
          \"shape\":\"AWSAccountId\",\
          \"documentation\":\"<p>The member account ID.</p>\"\
        },\
        \"EvaluationResults\":{\
          \"shape\":\"EvaluationResults\",\
          \"documentation\":\"<p>An array of <code>EvaluationResult</code> objects.</p>\"\
        },\
        \"LastUpdated\":{\
          \"shape\":\"TimeStamp\",\
          \"documentation\":\"<p>Timestamp of the last update to the <code>EvaluationResult</code> objects.</p>\"\
        },\
        \"IssueInfoMap\":{\
          \"shape\":\"IssueInfoMap\",\
          \"documentation\":\"<p>Details about problems with dependent services, such as AWS WAF or AWS Config, that are causing a resource to be noncompliant. The details include the name of the dependent service and the error message received that indicates the problem with the service.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether the account is compliant with the specified policy. An account is considered noncompliant if it includes resources that are not protected by the policy, for AWS WAF and Shield Advanced policies, or that are noncompliant with the policy, for security group policies.</p>\"\
    },\
    \"PolicyComplianceStatusList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicyComplianceStatus\"}\
    },\
    \"PolicyComplianceStatusType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"COMPLIANT\",\
        \"NON_COMPLIANT\"\
      ]\
    },\
    \"PolicyId\":{\
      \"type\":\"string\",\
      \"max\":36,\
      \"min\":36,\
      \"pattern\":\"^[a-z0-9A-Z-]{36}$\"\
    },\
    \"PolicySummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the specified policy.</p>\"\
        },\
        \"PolicyId\":{\
          \"shape\":\"PolicyId\",\
          \"documentation\":\"<p>The ID of the specified policy.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The friendly name of the specified policy.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of resource protected by or in scope of the policy. This is in the format shown in the <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html\\\">AWS Resource Types Reference</a>. For AWS WAF and Shield Advanced, examples include <code>AWS::ElasticLoadBalancingV2::LoadBalancer</code> and <code>AWS::CloudFront::Distribution</code>. For a security group common policy, valid values are <code>AWS::EC2::NetworkInterface</code> and <code>AWS::EC2::Instance</code>. For a security group content audit policy, valid values are <code>AWS::EC2::SecurityGroup</code>, <code>AWS::EC2::NetworkInterface</code>, and <code>AWS::EC2::Instance</code>. For a security group usage audit policy, the value is <code>AWS::EC2::SecurityGroup</code>. </p>\"\
        },\
        \"SecurityServiceType\":{\
          \"shape\":\"SecurityServiceType\",\
          \"documentation\":\"<p>The service that the policy is using to protect the resources. This specifies the type of policy that is created, either an AWS WAF policy, a Shield Advanced policy, or a security group policy.</p>\"\
        },\
        \"RemediationEnabled\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates if the policy should be automatically applied to new resources.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details of the AWS Firewall Manager policy. </p>\"\
    },\
    \"PolicySummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicySummary\"}\
    },\
    \"PolicyUpdateToken\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"ProtectionData\":{\"type\":\"string\"},\
    \"PutNotificationChannelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SnsTopicArn\",\
        \"SnsRoleName\"\
      ],\
      \"members\":{\
        \"SnsTopicArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the SNS topic that collects notifications from AWS Firewall Manager.</p>\"\
        },\
        \"SnsRoleName\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role that allows Amazon SNS to record AWS Firewall Manager activity. </p>\"\
        }\
      }\
    },\
    \"PutPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Policy\"],\
      \"members\":{\
        \"Policy\":{\
          \"shape\":\"Policy\",\
          \"documentation\":\"<p>The details of the AWS Firewall Manager policy to be created.</p>\"\
        },\
        \"TagList\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags to add to the AWS resource.</p>\"\
        }\
      }\
    },\
    \"PutPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Policy\":{\
          \"shape\":\"Policy\",\
          \"documentation\":\"<p>The details of the AWS Firewall Manager policy that was created.</p>\"\
        },\
        \"PolicyArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the policy that was created.</p>\"\
        }\
      }\
    },\
    \"ResourceArn\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"ResourceCount\":{\
      \"type\":\"long\",\
      \"min\":0\
    },\
    \"ResourceId\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"ResourceName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The specified resource was not found.</p>\",\
      \"exception\":true\
    },\
    \"ResourceTag\":{\
      \"type\":\"structure\",\
      \"required\":[\"Key\"],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"ResourceTagKey\",\
          \"documentation\":\"<p>The resource tag key.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"ResourceTagValue\",\
          \"documentation\":\"<p>The resource tag value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The resource tags that AWS Firewall Manager uses to determine if a particular resource should be included or excluded from the AWS Firewall Manager policy. Tags enable you to categorize your AWS resources in different ways, for example, by purpose, owner, or environment. Each tag consists of a key and an optional value. Firewall Manager combines the tags with \\\"AND\\\" so that, if you add more than one tag to a policy scope, a resource must have all the specified tags to be included or excluded. For more information, see <a href=\\\"https://docs.aws.amazon.com/awsconsolehelpdocs/latest/gsg/tag-editor.html\\\">Working with Tag Editor</a>.</p>\"\
    },\
    \"ResourceTagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"ResourceTagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"ResourceTags\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceTag\"},\
      \"max\":8,\
      \"min\":0\
    },\
    \"ResourceType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"ResourceTypeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceType\"}\
    },\
    \"SecurityServicePolicyData\":{\
      \"type\":\"structure\",\
      \"required\":[\"Type\"],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"SecurityServiceType\",\
          \"documentation\":\"<p>The service that the policy is using to protect the resources. This specifies the type of policy that is created, either an AWS WAF policy, a Shield Advanced policy, or a security group policy. For security group policies, Firewall Manager supports one security group for each common policy and for each content audit policy. This is an adjustable limit that you can increase by contacting AWS Support.</p>\"\
        },\
        \"ManagedServiceData\":{\
          \"shape\":\"ManagedServiceData\",\
          \"documentation\":\"<p>Details about the service that are specific to the service type, in JSON format. For service type <code>SHIELD_ADVANCED</code>, this is an empty string.</p> <ul> <li> <p>Example: <code>WAFV2</code> </p> <p> <code>\\\"ManagedServiceData\\\": \\\"{\\\\\\\"type\\\\\\\":\\\\\\\"WAFV2\\\\\\\",\\\\\\\"defaultAction\\\\\\\":{\\\\\\\"type\\\\\\\":\\\\\\\"ALLOW\\\\\\\"},\\\\\\\"preProcessRuleGroups\\\\\\\":[{\\\\\\\"managedRuleGroupIdentifier\\\\\\\":null,\\\\\\\"ruleGroupArn\\\\\\\":\\\\\\\"rulegrouparn\\\\\\\",\\\\\\\"overrideAction\\\\\\\":{\\\\\\\"type\\\\\\\":\\\\\\\"COUNT\\\\\\\"},\\\\\\\"excludedRules\\\\\\\":[{\\\\\\\"name\\\\\\\":\\\\\\\"EntityName\\\\\\\"}],\\\\\\\"ruleGroupType\\\\\\\":\\\\\\\"RuleGroup\\\\\\\"}],\\\\\\\"postProcessRuleGroups\\\\\\\":[{\\\\\\\"managedRuleGroupIdentifier\\\\\\\":{\\\\\\\"managedRuleGroupName\\\\\\\":\\\\\\\"AWSManagedRulesAdminProtectionRuleSet\\\\\\\",\\\\\\\"vendor\\\\\\\":\\\\\\\"AWS\\\\\\\"},\\\\\\\"ruleGroupArn\\\\\\\":\\\\\\\"rulegrouparn\\\\\\\",\\\\\\\"overrideAction\\\\\\\":{\\\\\\\"type\\\\\\\":\\\\\\\"NONE\\\\\\\"},\\\\\\\"excludedRules\\\\\\\":[],\\\\\\\"ruleGroupType\\\\\\\":\\\\\\\"ManagedRuleGroup\\\\\\\"}],\\\\\\\"overrideCustomerWebACLAssociation\\\\\\\":false}\\\"</code> </p> </li> <li> <p>Example: <code>WAF Classic</code> </p> <p> <code>\\\"ManagedServiceData\\\": \\\"{\\\\\\\"type\\\\\\\": \\\\\\\"WAF\\\\\\\", \\\\\\\"ruleGroups\\\\\\\": [{\\\\\\\"id\\\\\\\": \\\\\\\"12345678-1bcd-9012-efga-0987654321ab\\\\\\\", \\\\\\\"overrideAction\\\\\\\" : {\\\\\\\"type\\\\\\\": \\\\\\\"COUNT\\\\\\\"}}], \\\\\\\"defaultAction\\\\\\\": {\\\\\\\"type\\\\\\\": \\\\\\\"BLOCK\\\\\\\"}}</code> </p> </li> <li> <p>Example: <code>SECURITY_GROUPS_COMMON</code> </p> <p> <code>\\\"SecurityServicePolicyData\\\":{\\\"Type\\\":\\\"SECURITY_GROUPS_COMMON\\\",\\\"ManagedServiceData\\\":\\\"{\\\\\\\"type\\\\\\\":\\\\\\\"SECURITY_GROUPS_COMMON\\\\\\\",\\\\\\\"revertManualSecurityGroupChanges\\\\\\\":false,\\\\\\\"exclusiveResourceSecurityGroupManagement\\\\\\\":false, \\\\\\\"applyToAllEC2InstanceENIs\\\\\\\":false,\\\\\\\"securityGroups\\\\\\\":[{\\\\\\\"id\\\\\\\":\\\\\\\" sg-000e55995d61a06bd\\\\\\\"}]}\\\"},\\\"RemediationEnabled\\\":false,\\\"ResourceType\\\":\\\"AWS::EC2::NetworkInterface\\\"}</code> </p> </li> <li> <p>Example: <code>SECURITY_GROUPS_CONTENT_AUDIT</code> </p> <p> <code>\\\"SecurityServicePolicyData\\\":{\\\"Type\\\":\\\"SECURITY_GROUPS_CONTENT_AUDIT\\\",\\\"ManagedServiceData\\\":\\\"{\\\\\\\"type\\\\\\\":\\\\\\\"SECURITY_GROUPS_CONTENT_AUDIT\\\\\\\",\\\\\\\"securityGroups\\\\\\\":[{\\\\\\\"id\\\\\\\":\\\\\\\" sg-000e55995d61a06bd \\\\\\\"}],\\\\\\\"securityGroupAction\\\\\\\":{\\\\\\\"type\\\\\\\":\\\\\\\"ALLOW\\\\\\\"}}\\\"},\\\"RemediationEnabled\\\":false,\\\"ResourceType\\\":\\\"AWS::EC2::NetworkInterface\\\"}</code> </p> <p>The security group action for content audit can be <code>ALLOW</code> or <code>DENY</code>. For <code>ALLOW</code>, all in-scope security group rules must be within the allowed range of the policy's security group rules. For <code>DENY</code>, all in-scope security group rules must not contain a value or a range that matches a rule value or range in the policy security group.</p> </li> <li> <p>Example: <code>SECURITY_GROUPS_USAGE_AUDIT</code> </p> <p> <code>\\\"SecurityServicePolicyData\\\":{\\\"Type\\\":\\\"SECURITY_GROUPS_USAGE_AUDIT\\\",\\\"ManagedServiceData\\\":\\\"{\\\\\\\"type\\\\\\\":\\\\\\\"SECURITY_GROUPS_USAGE_AUDIT\\\\\\\",\\\\\\\"deleteUnusedSecurityGroups\\\\\\\":true,\\\\\\\"coalesceRedundantSecurityGroups\\\\\\\":true}\\\"},\\\"RemediationEnabled\\\":false,\\\"Resou rceType\\\":\\\"AWS::EC2::SecurityGroup\\\"}</code> </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Details about the security service that is being used to protect the resources.</p>\"\
    },\
    \"SecurityServiceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"WAF\",\
        \"WAFV2\",\
        \"SHIELD_ADVANCED\",\
        \"SECURITY_GROUPS_COMMON\",\
        \"SECURITY_GROUPS_CONTENT_AUDIT\",\
        \"SECURITY_GROUPS_USAGE_AUDIT\"\
      ]\
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
          \"documentation\":\"<p>Part of the key:value pair that defines a tag. You can use a tag key to describe a category of information, such as \\\"customer.\\\" Tag keys are case-sensitive.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>Part of the key:value pair that defines a tag. You can use a tag value to describe a specific value within a category, such as \\\"companyA\\\" or \\\"companyB.\\\" Tag values are case-sensitive. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A collection of key:value pairs associated with an AWS resource. The key:value pair can be anything you define. Typically, the tag key represents a category (such as \\\"environment\\\") and the tag value represents a specific value within that category (such as \\\"test,\\\" \\\"development,\\\" or \\\"production\\\"). You can add up to 50 tags to each AWS resource. </p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"max\":200,\
      \"min\":0\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"max\":200,\
      \"min\":0\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"TagList\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource. The Firewall Manager policy is the only AWS resource that supports tagging, so this ARN is a policy ARN.</p>\"\
        },\
        \"TagList\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags to add to the resource.</p>\"\
        }\
      }\
    },\
    \"TagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"TimeStamp\":{\"type\":\"timestamp\"},\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource. The Firewall Manager policy is the only AWS resource that supports tagging, so this ARN is a policy ARN.</p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The keys of the tags to remove from the resource. </p>\"\
        }\
      }\
    },\
    \"UntagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"ViolationReason\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"WEB_ACL_MISSING_RULE_GROUP\",\
        \"RESOURCE_MISSING_WEB_ACL\",\
        \"RESOURCE_INCORRECT_WEB_ACL\",\
        \"RESOURCE_MISSING_SHIELD_PROTECTION\",\
        \"RESOURCE_MISSING_WEB_ACL_OR_SHIELD_PROTECTION\",\
        \"RESOURCE_MISSING_SECURITY_GROUP\",\
        \"RESOURCE_VIOLATES_AUDIT_SECURITY_GROUP\",\
        \"SECURITY_GROUP_UNUSED\",\
        \"SECURITY_GROUP_REDUNDANT\"\
      ]\
    }\
  },\
  \"documentation\":\"<fullname>AWS Firewall Manager</fullname> <p>This is the <i>AWS Firewall Manager API Reference</i>. This guide is for developers who need detailed information about the AWS Firewall Manager API actions, data types, and errors. For detailed information about AWS Firewall Manager features, see the <a href=\\\"https://docs.aws.amazon.com/waf/latest/developerguide/fms-chapter.html\\\">AWS Firewall Manager Developer Guide</a>.</p>\"\
}\
";
}

@end
