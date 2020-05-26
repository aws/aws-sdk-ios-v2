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

#import "AWSDlmResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSDlmResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSDlmResources

+ (instancetype)sharedInstance {
    static AWSDlmResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSDlmResources new];
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
    \"apiVersion\":\"2018-01-12\",\
    \"endpointPrefix\":\"dlm\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"rest-json\",\
    \"serviceAbbreviation\":\"Amazon DLM\",\
    \"serviceFullName\":\"Amazon Data Lifecycle Manager\",\
    \"serviceId\":\"DLM\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"dlm\",\
    \"uid\":\"dlm-2018-01-12\"\
  },\
  \"operations\":{\
    \"CreateLifecyclePolicy\":{\
      \"name\":\"CreateLifecyclePolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/policies\"\
      },\
      \"input\":{\"shape\":\"CreateLifecyclePolicyRequest\"},\
      \"output\":{\"shape\":\"CreateLifecyclePolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Creates a policy to manage the lifecycle of the specified AWS resources. You can create up to 100 lifecycle policies.</p>\"\
    },\
    \"DeleteLifecyclePolicy\":{\
      \"name\":\"DeleteLifecyclePolicy\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/policies/{policyId}/\"\
      },\
      \"input\":{\"shape\":\"DeleteLifecyclePolicyRequest\"},\
      \"output\":{\"shape\":\"DeleteLifecyclePolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified lifecycle policy and halts the automated operations that the policy specified.</p>\"\
    },\
    \"GetLifecyclePolicies\":{\
      \"name\":\"GetLifecyclePolicies\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/policies\"\
      },\
      \"input\":{\"shape\":\"GetLifecyclePoliciesRequest\"},\
      \"output\":{\"shape\":\"GetLifecyclePoliciesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Gets summary information about all or the specified data lifecycle policies.</p> <p>To get complete information about a policy, use <a>GetLifecyclePolicy</a>.</p>\"\
    },\
    \"GetLifecyclePolicy\":{\
      \"name\":\"GetLifecyclePolicy\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/policies/{policyId}/\"\
      },\
      \"input\":{\"shape\":\"GetLifecyclePolicyRequest\"},\
      \"output\":{\"shape\":\"GetLifecyclePolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Gets detailed information about the specified lifecycle policy.</p>\"\
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
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Lists the tags for the specified resource.</p>\"\
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
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Adds the specified tags to the specified resource.</p>\"\
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
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified tags from the specified resource.</p>\"\
    },\
    \"UpdateLifecyclePolicy\":{\
      \"name\":\"UpdateLifecyclePolicy\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/policies/{policyId}\"\
      },\
      \"input\":{\"shape\":\"UpdateLifecyclePolicyRequest\"},\
      \"output\":{\"shape\":\"UpdateLifecyclePolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified lifecycle policy.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AvailabilityZone\":{\
      \"type\":\"string\",\
      \"max\":16,\
      \"min\":0,\
      \"pattern\":\"([a-z]+-){2,3}\\\\d[a-z]\"\
    },\
    \"AvailabilityZoneList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AvailabilityZone\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"CmkArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":0,\
      \"pattern\":\"arn:aws(-[a-z]{1,3}){0,2}:kms:([a-z]+-){2,3}\\\\d:\\\\d+:key/.*\"\
    },\
    \"CopyTags\":{\"type\":\"boolean\"},\
    \"CopyTagsNullable\":{\"type\":\"boolean\"},\
    \"Count\":{\
      \"type\":\"integer\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"CreateLifecyclePolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ExecutionRoleArn\",\
        \"Description\",\
        \"State\",\
        \"PolicyDetails\"\
      ],\
      \"members\":{\
        \"ExecutionRoleArn\":{\
          \"shape\":\"ExecutionRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role used to run the operations specified by the lifecycle policy.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"PolicyDescription\",\
          \"documentation\":\"<p>A description of the lifecycle policy. The characters ^[0-9A-Za-z _-]+$ are supported.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"SettablePolicyStateValues\",\
          \"documentation\":\"<p>The desired activation state of the lifecycle policy after creation.</p>\"\
        },\
        \"PolicyDetails\":{\
          \"shape\":\"PolicyDetails\",\
          \"documentation\":\"<p>The configuration details of the lifecycle policy.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags to apply to the lifecycle policy during creation.</p>\"\
        }\
      }\
    },\
    \"CreateLifecyclePolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyId\":{\
          \"shape\":\"PolicyId\",\
          \"documentation\":\"<p>The identifier of the lifecycle policy.</p>\"\
        }\
      }\
    },\
    \"CreateRule\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Interval\":{\
          \"shape\":\"Interval\",\
          \"documentation\":\"<p>The interval between snapshots. The supported values are 1, 2, 3, 4, 6, 8, 12, and 24.</p>\"\
        },\
        \"IntervalUnit\":{\
          \"shape\":\"IntervalUnitValues\",\
          \"documentation\":\"<p>The interval unit.</p>\"\
        },\
        \"Times\":{\
          \"shape\":\"TimesList\",\
          \"documentation\":\"<p>The time, in UTC, to start the operation. The supported format is hh:mm.</p> <p>The operation occurs within a one-hour window following the specified time. If you do not specify a time, Amazon DLM selects a time within the next 24 hours.</p>\"\
        },\
        \"CronExpression\":{\
          \"shape\":\"CronExpression\",\
          \"documentation\":\"<p>The schedule, as a Cron expression. The schedule interval must be between 1 hour and 1 year. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions\\\">Cron expressions</a> in the <i>Amazon CloudWatch User Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies when to create snapshots of EBS volumes.</p> <p>You must specify either a Cron expression or an interval, interval unit, and start time. You cannot specify both.</p>\"\
    },\
    \"CronExpression\":{\
      \"type\":\"string\",\
      \"max\":106,\
      \"min\":17,\
      \"pattern\":\"cron\\\\([^\\\\n]{11,100}\\\\)\"\
    },\
    \"CrossRegionCopyRetainRule\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Interval\":{\
          \"shape\":\"Interval\",\
          \"documentation\":\"<p>The amount of time to retain each snapshot. The maximum is 100 years. This is equivalent to 1200 months, 5200 weeks, or 36500 days.</p>\"\
        },\
        \"IntervalUnit\":{\
          \"shape\":\"RetentionIntervalUnitValues\",\
          \"documentation\":\"<p>The unit of time for time-based retention.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the retention rule for cross-Region snapshot copies.</p>\"\
    },\
    \"CrossRegionCopyRule\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TargetRegion\",\
        \"Encrypted\"\
      ],\
      \"members\":{\
        \"TargetRegion\":{\
          \"shape\":\"TargetRegion\",\
          \"documentation\":\"<p>The target Region.</p>\"\
        },\
        \"Encrypted\":{\
          \"shape\":\"Encrypted\",\
          \"documentation\":\"<p>To encrypt a copy of an unencrypted snapshot if encryption by default is not enabled, enable encryption using this parameter. Copies of encrypted snapshots are encrypted, even if this parameter is false or if encryption by default is not enabled.</p>\"\
        },\
        \"CmkArn\":{\
          \"shape\":\"CmkArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS KMS customer master key (CMK) to use for EBS encryption. If this parameter is not specified, your AWS managed CMK for EBS is used.</p>\"\
        },\
        \"CopyTags\":{\
          \"shape\":\"CopyTagsNullable\",\
          \"documentation\":\"<p>Copy all user-defined tags from the source snapshot to the copied snapshot.</p>\"\
        },\
        \"RetainRule\":{\
          \"shape\":\"CrossRegionCopyRetainRule\",\
          \"documentation\":\"<p>The retention rule.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies a rule for cross-Region snapshot copies.</p>\"\
    },\
    \"CrossRegionCopyRules\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CrossRegionCopyRule\"},\
      \"max\":3,\
      \"min\":0\
    },\
    \"DeleteLifecyclePolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PolicyId\"],\
      \"members\":{\
        \"PolicyId\":{\
          \"shape\":\"PolicyId\",\
          \"documentation\":\"<p>The identifier of the lifecycle policy.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyId\"\
        }\
      }\
    },\
    \"DeleteLifecyclePolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"Encrypted\":{\"type\":\"boolean\"},\
    \"ErrorCode\":{\"type\":\"string\"},\
    \"ErrorMessage\":{\"type\":\"string\"},\
    \"ExcludeBootVolume\":{\"type\":\"boolean\"},\
    \"ExecutionRoleArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":0,\
      \"pattern\":\"arn:aws(-[a-z]{1,3}){0,2}:iam::\\\\d+:role/.*\"\
    },\
    \"FastRestoreRule\":{\
      \"type\":\"structure\",\
      \"required\":[\"AvailabilityZones\"],\
      \"members\":{\
        \"Count\":{\
          \"shape\":\"Count\",\
          \"documentation\":\"<p>The number of snapshots to be enabled with fast snapshot restore.</p>\"\
        },\
        \"Interval\":{\
          \"shape\":\"Interval\",\
          \"documentation\":\"<p>The amount of time to enable fast snapshot restore. The maximum is 100 years. This is equivalent to 1200 months, 5200 weeks, or 36500 days.</p>\"\
        },\
        \"IntervalUnit\":{\
          \"shape\":\"RetentionIntervalUnitValues\",\
          \"documentation\":\"<p>The unit of time for enabling fast snapshot restore.</p>\"\
        },\
        \"AvailabilityZones\":{\
          \"shape\":\"AvailabilityZoneList\",\
          \"documentation\":\"<p>The Availability Zones in which to enable fast snapshot restore.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies a rule for enabling fast snapshot restore. You can enable fast snapshot restore based on either a count or a time interval.</p>\"\
    },\
    \"GetLifecyclePoliciesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyIds\":{\
          \"shape\":\"PolicyIdList\",\
          \"documentation\":\"<p>The identifiers of the data lifecycle policies.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"policyIds\"\
        },\
        \"State\":{\
          \"shape\":\"GettablePolicyStateValues\",\
          \"documentation\":\"<p>The activation state.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"state\"\
        },\
        \"ResourceTypes\":{\
          \"shape\":\"ResourceTypeValuesList\",\
          \"documentation\":\"<p>The resource type.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceTypes\"\
        },\
        \"TargetTags\":{\
          \"shape\":\"TargetTagsFilterList\",\
          \"documentation\":\"<p>The target tag for a policy.</p> <p>Tags are strings in the format <code>key=value</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"targetTags\"\
        },\
        \"TagsToAdd\":{\
          \"shape\":\"TagsToAddFilterList\",\
          \"documentation\":\"<p>The tags to add to objects created by the policy.</p> <p>Tags are strings in the format <code>key=value</code>.</p> <p>These user-defined tags are added in addition to the AWS-added lifecycle tags.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"tagsToAdd\"\
        }\
      }\
    },\
    \"GetLifecyclePoliciesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Policies\":{\
          \"shape\":\"LifecyclePolicySummaryList\",\
          \"documentation\":\"<p>Summary information about the lifecycle policies.</p>\"\
        }\
      }\
    },\
    \"GetLifecyclePolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PolicyId\"],\
      \"members\":{\
        \"PolicyId\":{\
          \"shape\":\"PolicyId\",\
          \"documentation\":\"<p>The identifier of the lifecycle policy.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyId\"\
        }\
      }\
    },\
    \"GetLifecyclePolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Policy\":{\
          \"shape\":\"LifecyclePolicy\",\
          \"documentation\":\"<p>Detailed information about the lifecycle policy.</p>\"\
        }\
      }\
    },\
    \"GettablePolicyStateValues\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENABLED\",\
        \"DISABLED\",\
        \"ERROR\"\
      ]\
    },\
    \"InternalServerException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"},\
        \"Code\":{\"shape\":\"ErrorCode\"}\
      },\
      \"documentation\":\"<p>The service failed in an unexpected way.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true\
    },\
    \"Interval\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"IntervalUnitValues\":{\
      \"type\":\"string\",\
      \"enum\":[\"HOURS\"]\
    },\
    \"InvalidRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"},\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"RequiredParameters\":{\
          \"shape\":\"ParameterList\",\
          \"documentation\":\"<p>The request omitted one or more required parameters.</p>\"\
        },\
        \"MutuallyExclusiveParameters\":{\
          \"shape\":\"ParameterList\",\
          \"documentation\":\"<p>The request included parameters that cannot be provided together.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Bad request. The request is missing required parameters or has invalid parameters.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"LifecyclePolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyId\":{\
          \"shape\":\"PolicyId\",\
          \"documentation\":\"<p>The identifier of the lifecycle policy.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"PolicyDescription\",\
          \"documentation\":\"<p>The description of the lifecycle policy.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"GettablePolicyStateValues\",\
          \"documentation\":\"<p>The activation state of the lifecycle policy.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>The description of the status.</p>\"\
        },\
        \"ExecutionRoleArn\":{\
          \"shape\":\"ExecutionRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role used to run the operations specified by the lifecycle policy.</p>\"\
        },\
        \"DateCreated\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The local date and time when the lifecycle policy was created.</p>\"\
        },\
        \"DateModified\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The local date and time when the lifecycle policy was last modified.</p>\"\
        },\
        \"PolicyDetails\":{\
          \"shape\":\"PolicyDetails\",\
          \"documentation\":\"<p>The configuration of the lifecycle policy</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags.</p>\"\
        },\
        \"PolicyArn\":{\
          \"shape\":\"PolicyArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Detailed information about a lifecycle policy.</p>\"\
    },\
    \"LifecyclePolicySummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyId\":{\
          \"shape\":\"PolicyId\",\
          \"documentation\":\"<p>The identifier of the lifecycle policy.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"PolicyDescription\",\
          \"documentation\":\"<p>The description of the lifecycle policy.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"GettablePolicyStateValues\",\
          \"documentation\":\"<p>The activation state of the lifecycle policy.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary information about a lifecycle policy.</p>\"\
    },\
    \"LifecyclePolicySummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LifecyclePolicySummary\"}\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"},\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"ResourceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Value is the type of resource for which a limit was exceeded.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request failed because a limit was exceeded.</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"PolicyArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Information about the tags.</p>\"\
        }\
      }\
    },\
    \"Parameter\":{\"type\":\"string\"},\
    \"ParameterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Parameter\"}\
    },\
    \"Parameters\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ExcludeBootVolume\":{\
          \"shape\":\"ExcludeBootVolume\",\
          \"documentation\":\"<p>[EBS Snapshot Management â Instance policies only] Indicates whether to exclude the root volume from snapshots created using <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateSnapshots.html\\\">CreateSnapshots</a>. The default is false.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies optional parameters to add to a policy. The set of valid parameters depends on the combination of policy type and resource type.</p>\"\
    },\
    \"PolicyArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":0,\
      \"pattern\":\"^arn:aws(-[a-z]{1,3}){0,2}:dlm:[A-Za-z0-9_/.-]{0,63}:\\\\d+:policy/[0-9A-Za-z_-]{1,128}$\"\
    },\
    \"PolicyDescription\":{\
      \"type\":\"string\",\
      \"max\":500,\
      \"min\":0,\
      \"pattern\":\"[0-9A-Za-z _-]+\"\
    },\
    \"PolicyDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyType\":{\
          \"shape\":\"PolicyTypeValues\",\
          \"documentation\":\"<p>The valid target resource types and actions a policy can manage. The default is EBS_SNAPSHOT_MANAGEMENT.</p>\"\
        },\
        \"ResourceTypes\":{\
          \"shape\":\"ResourceTypeValuesList\",\
          \"documentation\":\"<p>The resource type. Use VOLUME to create snapshots of individual volumes or use INSTANCE to create multi-volume snapshots from the volumes for an instance.</p>\"\
        },\
        \"TargetTags\":{\
          \"shape\":\"TargetTagList\",\
          \"documentation\":\"<p>The single tag that identifies targeted resources for this policy.</p>\"\
        },\
        \"Schedules\":{\
          \"shape\":\"ScheduleList\",\
          \"documentation\":\"<p>The schedule of policy-defined actions.</p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"Parameters\",\
          \"documentation\":\"<p>A set of optional parameters for the policy. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the configuration of a lifecycle policy.</p>\"\
    },\
    \"PolicyId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":0,\
      \"pattern\":\"policy-[A-Za-z0-9]+\"\
    },\
    \"PolicyIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicyId\"}\
    },\
    \"PolicyTypeValues\":{\
      \"type\":\"string\",\
      \"enum\":[\"EBS_SNAPSHOT_MANAGEMENT\"]\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"},\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"ResourceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Value is the type of resource that was not found.</p>\"\
        },\
        \"ResourceIds\":{\
          \"shape\":\"PolicyIdList\",\
          \"documentation\":\"<p>Value is a list of resource IDs that were not found.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A requested resource was not found.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"ResourceTypeValues\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"VOLUME\",\
        \"INSTANCE\"\
      ]\
    },\
    \"ResourceTypeValuesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceTypeValues\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"RetainRule\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Count\":{\
          \"shape\":\"Count\",\
          \"documentation\":\"<p>The number of snapshots to retain for each volume, up to a maximum of 1000.</p>\"\
        },\
        \"Interval\":{\
          \"shape\":\"Interval\",\
          \"documentation\":\"<p>The amount of time to retain each snapshot. The maximum is 100 years. This is equivalent to 1200 months, 5200 weeks, or 36500 days.</p>\"\
        },\
        \"IntervalUnit\":{\
          \"shape\":\"RetentionIntervalUnitValues\",\
          \"documentation\":\"<p>The unit of time for time-based retention.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the retention rule for a lifecycle policy. You can retain snapshots based on either a count or a time interval.</p>\"\
    },\
    \"RetentionIntervalUnitValues\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DAYS\",\
        \"WEEKS\",\
        \"MONTHS\",\
        \"YEARS\"\
      ]\
    },\
    \"Schedule\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ScheduleName\",\
          \"documentation\":\"<p>The name of the schedule.</p>\"\
        },\
        \"CopyTags\":{\
          \"shape\":\"CopyTags\",\
          \"documentation\":\"<p>Copy all user-defined tags on a source volume to snapshots of the volume created by this policy.</p>\"\
        },\
        \"TagsToAdd\":{\
          \"shape\":\"TagsToAddList\",\
          \"documentation\":\"<p>The tags to apply to policy-created resources. These user-defined tags are in addition to the AWS-added lifecycle tags.</p>\"\
        },\
        \"VariableTags\":{\
          \"shape\":\"VariableTagsList\",\
          \"documentation\":\"<p>A collection of key/value pairs with values determined dynamically when the policy is executed. Keys may be any valid Amazon EC2 tag key. Values must be in one of the two following formats: <code>$(instance-id)</code> or <code>$(timestamp)</code>. Variable tags are only valid for EBS Snapshot Management â Instance policies.</p>\"\
        },\
        \"CreateRule\":{\
          \"shape\":\"CreateRule\",\
          \"documentation\":\"<p>The creation rule.</p>\"\
        },\
        \"RetainRule\":{\
          \"shape\":\"RetainRule\",\
          \"documentation\":\"<p>The retention rule.</p>\"\
        },\
        \"FastRestoreRule\":{\
          \"shape\":\"FastRestoreRule\",\
          \"documentation\":\"<p>The rule for enabling fast snapshot restore.</p>\"\
        },\
        \"CrossRegionCopyRules\":{\
          \"shape\":\"CrossRegionCopyRules\",\
          \"documentation\":\"<p>The rule for cross-Region snapshot copies.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies a backup schedule.</p>\"\
    },\
    \"ScheduleList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Schedule\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"ScheduleName\":{\
      \"type\":\"string\",\
      \"max\":500,\
      \"min\":0,\
      \"pattern\":\"[\\\\p{all}]*\"\
    },\
    \"SettablePolicyStateValues\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENABLED\",\
        \"DISABLED\"\
      ]\
    },\
    \"StatusMessage\":{\
      \"type\":\"string\",\
      \"max\":500,\
      \"min\":0,\
      \"pattern\":\"[\\\\p{all}]*\"\
    },\
    \"String\":{\
      \"type\":\"string\",\
      \"max\":500,\
      \"min\":0,\
      \"pattern\":\"[\\\\p{all}]*\"\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Key\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The tag key.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The tag value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies a tag for a resource.</p>\"\
    },\
    \"TagFilter\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"[\\\\p{all}]*\"\
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
      \"max\":200,\
      \"min\":1\
    },\
    \"TagMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TagKey\"},\
      \"value\":{\"shape\":\"TagValue\"},\
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
          \"shape\":\"PolicyArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>One or more tags.</p>\"\
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
      \"pattern\":\"[\\\\p{all}]*\"\
    },\
    \"TagsToAddFilterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagFilter\"},\
      \"max\":50,\
      \"min\":0\
    },\
    \"TagsToAddList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"max\":45,\
      \"min\":0\
    },\
    \"TargetRegion\":{\
      \"type\":\"string\",\
      \"max\":16,\
      \"min\":0,\
      \"pattern\":\"([a-z]+-){2,3}\\\\d\"\
    },\
    \"TargetTagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TargetTagsFilterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagFilter\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"Time\":{\
      \"type\":\"string\",\
      \"max\":5,\
      \"min\":5,\
      \"pattern\":\"^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$\"\
    },\
    \"TimesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Time\"},\
      \"max\":1\
    },\
    \"Timestamp\":{\
      \"type\":\"timestamp\",\
      \"timestampFormat\":\"iso8601\"\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"PolicyArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The tag keys.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"tagKeys\"\
        }\
      }\
    },\
    \"UntagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateLifecyclePolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PolicyId\"],\
      \"members\":{\
        \"PolicyId\":{\
          \"shape\":\"PolicyId\",\
          \"documentation\":\"<p>The identifier of the lifecycle policy.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyId\"\
        },\
        \"ExecutionRoleArn\":{\
          \"shape\":\"ExecutionRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role used to run the operations specified by the lifecycle policy.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"SettablePolicyStateValues\",\
          \"documentation\":\"<p>The desired activation state of the lifecycle policy after creation.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"PolicyDescription\",\
          \"documentation\":\"<p>A description of the lifecycle policy.</p>\"\
        },\
        \"PolicyDetails\":{\
          \"shape\":\"PolicyDetails\",\
          \"documentation\":\"<p>The configuration of the lifecycle policy. You cannot update the policy type or the resource type.</p>\"\
        }\
      }\
    },\
    \"UpdateLifecyclePolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"VariableTagsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"max\":45,\
      \"min\":0\
    }\
  },\
  \"documentation\":\"<fullname>Amazon Data Lifecycle Manager</fullname> <p>With Amazon Data Lifecycle Manager, you can manage the lifecycle of your AWS resources. You create lifecycle policies, which are used to automate operations on the specified resources.</p> <p>Amazon DLM supports Amazon EBS volumes and snapshots. For information about using Amazon DLM with Amazon EBS, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-lifecycle.html\\\">Automating the Amazon EBS Snapshot Lifecycle</a> in the <i>Amazon EC2 User Guide</i>.</p>\"\
}\
";
}

@end
