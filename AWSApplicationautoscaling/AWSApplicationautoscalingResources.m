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

#import "AWSApplicationautoscalingResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSApplicationautoscalingResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSApplicationautoscalingResources

+ (instancetype)sharedInstance {
    static AWSApplicationautoscalingResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSApplicationautoscalingResources new];
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
    \"apiVersion\":\"2016-02-06\",\
    \"endpointPrefix\":\"application-autoscaling\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Application Auto Scaling\",\
    \"serviceId\":\"Application Auto Scaling\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"application-autoscaling\",\
    \"targetPrefix\":\"AnyScaleFrontendService\",\
    \"uid\":\"application-autoscaling-2016-02-06\"\
  },\
  \"operations\":{\
    \"DeleteScalingPolicy\":{\
      \"name\":\"DeleteScalingPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteScalingPolicyRequest\"},\
      \"output\":{\"shape\":\"DeleteScalingPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ObjectNotFoundException\"},\
        {\"shape\":\"ConcurrentUpdateException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified scaling policy for an Application Auto Scaling scalable target.</p> <p>Deleting a step scaling policy deletes the underlying alarm action, but does not delete the CloudWatch alarm associated with the scaling policy, even if it no longer has an associated action.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html#delete-step-scaling-policy\\\">Delete a Step Scaling Policy</a> and <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html#delete-target-tracking-policy\\\">Delete a Target Tracking Scaling Policy</a> in the <i>Application Auto Scaling User Guide</i>.</p>\"\
    },\
    \"DeleteScheduledAction\":{\
      \"name\":\"DeleteScheduledAction\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteScheduledActionRequest\"},\
      \"output\":{\"shape\":\"DeleteScheduledActionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ObjectNotFoundException\"},\
        {\"shape\":\"ConcurrentUpdateException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified scheduled action for an Application Auto Scaling scalable target.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html#delete-scheduled-action\\\">Delete a Scheduled Action</a> in the <i>Application Auto Scaling User Guide</i>.</p>\"\
    },\
    \"DeregisterScalableTarget\":{\
      \"name\":\"DeregisterScalableTarget\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeregisterScalableTargetRequest\"},\
      \"output\":{\"shape\":\"DeregisterScalableTargetResponse\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ObjectNotFoundException\"},\
        {\"shape\":\"ConcurrentUpdateException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Deregisters an Application Auto Scaling scalable target when you have finished using it. To see which resources have been registered, use <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html\\\">DescribeScalableTargets</a>. </p> <note> <p>Deregistering a scalable target deletes the scaling policies and the scheduled actions that are associated with it.</p> </note>\"\
    },\
    \"DescribeScalableTargets\":{\
      \"name\":\"DescribeScalableTargets\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeScalableTargetsRequest\"},\
      \"output\":{\"shape\":\"DescribeScalableTargetsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"ConcurrentUpdateException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Gets information about the scalable targets in the specified namespace.</p> <p>You can filter the results using <code>ResourceIds</code> and <code>ScalableDimension</code>.</p>\"\
    },\
    \"DescribeScalingActivities\":{\
      \"name\":\"DescribeScalingActivities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeScalingActivitiesRequest\"},\
      \"output\":{\"shape\":\"DescribeScalingActivitiesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"ConcurrentUpdateException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides descriptive information about the scaling activities in the specified namespace from the previous six weeks.</p> <p>You can filter the results using <code>ResourceId</code> and <code>ScalableDimension</code>.</p>\"\
    },\
    \"DescribeScalingPolicies\":{\
      \"name\":\"DescribeScalingPolicies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeScalingPoliciesRequest\"},\
      \"output\":{\"shape\":\"DescribeScalingPoliciesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"FailedResourceAccessException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"ConcurrentUpdateException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes the Application Auto Scaling scaling policies for the specified service namespace.</p> <p>You can filter the results using <code>ResourceId</code>, <code>ScalableDimension</code>, and <code>PolicyNames</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html\\\">Target Tracking Scaling Policies</a> and <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html\\\">Step Scaling Policies</a> in the <i>Application Auto Scaling User Guide</i>.</p>\"\
    },\
    \"DescribeScheduledActions\":{\
      \"name\":\"DescribeScheduledActions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeScheduledActionsRequest\"},\
      \"output\":{\"shape\":\"DescribeScheduledActionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"ConcurrentUpdateException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes the Application Auto Scaling scheduled actions for the specified service namespace.</p> <p>You can filter the results using the <code>ResourceId</code>, <code>ScalableDimension</code>, and <code>ScheduledActionNames</code> parameters.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html\\\">Scheduled Scaling</a> in the <i>Application Auto Scaling User Guide</i>.</p>\"\
    },\
    \"PutScalingPolicy\":{\
      \"name\":\"PutScalingPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutScalingPolicyRequest\"},\
      \"output\":{\"shape\":\"PutScalingPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ObjectNotFoundException\"},\
        {\"shape\":\"ConcurrentUpdateException\"},\
        {\"shape\":\"FailedResourceAccessException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a scaling policy for an Application Auto Scaling scalable target.</p> <p>Each scalable target is identified by a service namespace, resource ID, and scalable dimension. A scaling policy applies to the scalable target identified by those three attributes. You cannot create a scaling policy until you have registered the resource as a scalable target.</p> <p>Multiple scaling policies can be in force at the same time for the same scalable target. You can have one or more target tracking scaling policies, one or more step scaling policies, or both. However, there is a chance that multiple policies could conflict, instructing the scalable target to scale out or in at the same time. Application Auto Scaling gives precedence to the policy that provides the largest capacity for both scale out and scale in. For example, if one policy increases capacity by 3, another policy increases capacity by 200 percent, and the current capacity is 10, Application Auto Scaling uses the policy with the highest calculated capacity (200% of 10 = 20) and scales out to 30. </p> <p>We recommend caution, however, when using target tracking scaling policies with step scaling policies because conflicts between these policies can cause undesirable behavior. For example, if the step scaling policy initiates a scale-in activity before the target tracking policy is ready to scale in, the scale-in activity will not be blocked. After the scale-in activity completes, the target tracking policy could instruct the scalable target to scale out again. </p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html\\\">Target Tracking Scaling Policies</a> and <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html\\\">Step Scaling Policies</a> in the <i>Application Auto Scaling User Guide</i>.</p> <note> <p>If a scalable target is deregistered, the scalable target is no longer available to execute scaling policies. Any scaling policies that were specified for the scalable target are deleted.</p> </note>\"\
    },\
    \"PutScheduledAction\":{\
      \"name\":\"PutScheduledAction\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutScheduledActionRequest\"},\
      \"output\":{\"shape\":\"PutScheduledActionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ObjectNotFoundException\"},\
        {\"shape\":\"ConcurrentUpdateException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a scheduled action for an Application Auto Scaling scalable target.</p> <p>Each scalable target is identified by a service namespace, resource ID, and scalable dimension. A scheduled action applies to the scalable target identified by those three attributes. You cannot create a scheduled action until you have registered the resource as a scalable target.</p> <p>When start and end times are specified with a recurring schedule using a cron expression or rates, they form the boundaries of when the recurring action starts and stops.</p> <p>To update a scheduled action, specify the parameters that you want to change. If you don't specify start and end times, the old values are deleted.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html\\\">Scheduled Scaling</a> in the <i>Application Auto Scaling User Guide</i>.</p> <note> <p>If a scalable target is deregistered, the scalable target is no longer available to run scheduled actions. Any scheduled actions that were specified for the scalable target are deleted.</p> </note>\"\
    },\
    \"RegisterScalableTarget\":{\
      \"name\":\"RegisterScalableTarget\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RegisterScalableTargetRequest\"},\
      \"output\":{\"shape\":\"RegisterScalableTargetResponse\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ConcurrentUpdateException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Registers or updates a scalable target. </p> <p>A scalable target is a resource that Application Auto Scaling can scale out and scale in. Scalable targets are uniquely identified by the combination of resource ID, scalable dimension, and namespace. </p> <p>When you register a new scalable target, you must specify values for minimum and maximum capacity. Application Auto Scaling scaling policies will not scale capacity to values that are outside of this range.</p> <p>After you register a scalable target, you do not need to register it again to use other Application Auto Scaling operations. To see which resources have been registered, use <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html\\\">DescribeScalableTargets</a>. You can also view the scaling policies for a service namespace by using <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html\\\">DescribeScalableTargets</a>. If you no longer need a scalable target, you can deregister it by using <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DeregisterScalableTarget.html\\\">DeregisterScalableTarget</a>.</p> <p>To update a scalable target, specify the parameters that you want to change. Include the parameters that identify the scalable target: resource ID, scalable dimension, and namespace. Any parameters that you don't specify are not changed by this update request. </p>\"\
    }\
  },\
  \"shapes\":{\
    \"AdjustmentType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ChangeInCapacity\",\
        \"PercentChangeInCapacity\",\
        \"ExactCapacity\"\
      ]\
    },\
    \"Alarm\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AlarmName\",\
        \"AlarmARN\"\
      ],\
      \"members\":{\
        \"AlarmName\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The name of the alarm.</p>\"\
        },\
        \"AlarmARN\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the alarm.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a CloudWatch alarm associated with a scaling policy.</p>\"\
    },\
    \"Alarms\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Alarm\"}\
    },\
    \"ConcurrentUpdateException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Concurrent updates caused an exception, for example, if you request an update to an Application Auto Scaling resource that already has a pending update.</p>\",\
      \"exception\":true\
    },\
    \"Cooldown\":{\"type\":\"integer\"},\
    \"CustomizedMetricSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MetricName\",\
        \"Namespace\",\
        \"Statistic\"\
      ],\
      \"members\":{\
        \"MetricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the metric. </p>\"\
        },\
        \"Namespace\":{\
          \"shape\":\"MetricNamespace\",\
          \"documentation\":\"<p>The namespace of the metric.</p>\"\
        },\
        \"Dimensions\":{\
          \"shape\":\"MetricDimensions\",\
          \"documentation\":\"<p>The dimensions of the metric. </p> <p>Conditional: If you published your metric with dimensions, you must specify the same dimensions in your scaling policy.</p>\"\
        },\
        \"Statistic\":{\
          \"shape\":\"MetricStatistic\",\
          \"documentation\":\"<p>The statistic of the metric.</p>\"\
        },\
        \"Unit\":{\
          \"shape\":\"MetricUnit\",\
          \"documentation\":\"<p>The unit of the metric.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a CloudWatch metric of your choosing for a target tracking scaling policy to use with Application Auto Scaling.</p> <p>For information about the available metrics for a service, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html\\\">AWS Services That Publish CloudWatch Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.</p> <p>To create your customized metric specification:</p> <ul> <li> <p>Add values for each required parameter from CloudWatch. You can use an existing metric, or a new metric that you create. To use your own metric, you must first publish the metric to CloudWatch. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html\\\">Publish Custom Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.</p> </li> <li> <p>Choose a metric that changes proportionally with capacity. The value of the metric should increase or decrease in inverse proportion to the number of capacity units. That is, the value of the metric should decrease when capacity increases, and increase when capacity decreases. </p> </li> </ul> <p>For more information about CloudWatch, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html\\\">Amazon CloudWatch Concepts</a>. </p>\"\
    },\
    \"DeleteScalingPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PolicyName\",\
        \"ServiceNamespace\",\
        \"ResourceId\",\
        \"ScalableDimension\"\
      ],\
      \"members\":{\
        \"PolicyName\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The name of the scaling policy.</p>\"\
        },\
        \"ServiceNamespace\":{\
          \"shape\":\"ServiceNamespace\",\
          \"documentation\":\"<p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The identifier of the resource associated with the scalable target. This string consists of the resource type and unique identifier.</p> <ul> <li> <p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p> </li> <li> <p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p> </li> <li> <p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p> </li> <li> <p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p> </li> <li> <p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p> </li> <li> <p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p> </li> <li> <p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p> </li> <li> <p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p> </li> <li> <p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href=\\\"https://github.com/aws/aws-auto-scaling-custom-resource\\\">GitHub repository</a>.</p> </li> <li> <p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p> </li> <li> <p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p> </li> <li> <p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p> </li> </ul>\"\
        },\
        \"ScalableDimension\":{\
          \"shape\":\"ScalableDimension\",\
          \"documentation\":\"<p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property.</p> <ul> <li> <p> <code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p> </li> <li> <p> <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p> </li> <li> <p> <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p> </li> <li> <p> <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p> </li> <li> <p> <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p> </li> <li> <p> <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p> </li> <li> <p> <code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p> </li> <li> <p> <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p> </li> <li> <p> <code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p> </li> <li> <p> <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p> </li> <li> <p> <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"DeleteScalingPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteScheduledActionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ServiceNamespace\",\
        \"ScheduledActionName\",\
        \"ResourceId\",\
        \"ScalableDimension\"\
      ],\
      \"members\":{\
        \"ServiceNamespace\":{\
          \"shape\":\"ServiceNamespace\",\
          \"documentation\":\"<p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>\"\
        },\
        \"ScheduledActionName\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The name of the scheduled action.</p>\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The identifier of the resource associated with the scheduled action. This string consists of the resource type and unique identifier.</p> <ul> <li> <p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p> </li> <li> <p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p> </li> <li> <p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p> </li> <li> <p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p> </li> <li> <p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p> </li> <li> <p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p> </li> <li> <p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p> </li> <li> <p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p> </li> <li> <p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href=\\\"https://github.com/aws/aws-auto-scaling-custom-resource\\\">GitHub repository</a>.</p> </li> <li> <p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p> </li> <li> <p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p> </li> <li> <p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p> </li> </ul>\"\
        },\
        \"ScalableDimension\":{\
          \"shape\":\"ScalableDimension\",\
          \"documentation\":\"<p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property.</p> <ul> <li> <p> <code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p> </li> <li> <p> <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p> </li> <li> <p> <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p> </li> <li> <p> <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p> </li> <li> <p> <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p> </li> <li> <p> <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p> </li> <li> <p> <code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p> </li> <li> <p> <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p> </li> <li> <p> <code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p> </li> <li> <p> <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p> </li> <li> <p> <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"DeleteScheduledActionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeregisterScalableTargetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ServiceNamespace\",\
        \"ResourceId\",\
        \"ScalableDimension\"\
      ],\
      \"members\":{\
        \"ServiceNamespace\":{\
          \"shape\":\"ServiceNamespace\",\
          \"documentation\":\"<p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The identifier of the resource associated with the scalable target. This string consists of the resource type and unique identifier.</p> <ul> <li> <p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p> </li> <li> <p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p> </li> <li> <p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p> </li> <li> <p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p> </li> <li> <p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p> </li> <li> <p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p> </li> <li> <p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p> </li> <li> <p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p> </li> <li> <p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href=\\\"https://github.com/aws/aws-auto-scaling-custom-resource\\\">GitHub repository</a>.</p> </li> <li> <p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p> </li> <li> <p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p> </li> <li> <p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p> </li> </ul>\"\
        },\
        \"ScalableDimension\":{\
          \"shape\":\"ScalableDimension\",\
          \"documentation\":\"<p>The scalable dimension associated with the scalable target. This string consists of the service namespace, resource type, and scaling property.</p> <ul> <li> <p> <code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p> </li> <li> <p> <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p> </li> <li> <p> <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p> </li> <li> <p> <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p> </li> <li> <p> <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p> </li> <li> <p> <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p> </li> <li> <p> <code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p> </li> <li> <p> <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p> </li> <li> <p> <code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p> </li> <li> <p> <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p> </li> <li> <p> <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"DeregisterScalableTargetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeScalableTargetsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ServiceNamespace\"],\
      \"members\":{\
        \"ServiceNamespace\":{\
          \"shape\":\"ServiceNamespace\",\
          \"documentation\":\"<p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>\"\
        },\
        \"ResourceIds\":{\
          \"shape\":\"ResourceIdsMaxLen1600\",\
          \"documentation\":\"<p>The identifier of the resource associated with the scalable target. This string consists of the resource type and unique identifier. If you specify a scalable dimension, you must also specify a resource ID.</p> <ul> <li> <p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p> </li> <li> <p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p> </li> <li> <p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p> </li> <li> <p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p> </li> <li> <p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p> </li> <li> <p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p> </li> <li> <p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p> </li> <li> <p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p> </li> <li> <p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href=\\\"https://github.com/aws/aws-auto-scaling-custom-resource\\\">GitHub repository</a>.</p> </li> <li> <p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p> </li> <li> <p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p> </li> <li> <p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p> </li> </ul>\"\
        },\
        \"ScalableDimension\":{\
          \"shape\":\"ScalableDimension\",\
          \"documentation\":\"<p>The scalable dimension associated with the scalable target. This string consists of the service namespace, resource type, and scaling property. If you specify a scalable dimension, you must also specify a resource ID.</p> <ul> <li> <p> <code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p> </li> <li> <p> <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p> </li> <li> <p> <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p> </li> <li> <p> <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p> </li> <li> <p> <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p> </li> <li> <p> <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p> </li> <li> <p> <code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p> </li> <li> <p> <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p> </li> <li> <p> <code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p> </li> <li> <p> <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p> </li> <li> <p> <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p> </li> </ul>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of scalable targets. This value can be between 1 and 50. The default value is 50.</p> <p>If this parameter is used, the operation returns up to <code>MaxResults</code> results at a time, along with a <code>NextToken</code> value. To get the next set of results, include the <code>NextToken</code> value in a subsequent call. If this parameter is not used, the operation returns up to 50 results and a <code>NextToken</code> value, if applicable.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"DescribeScalableTargetsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ScalableTargets\":{\
          \"shape\":\"ScalableTargets\",\
          \"documentation\":\"<p>The scalable targets that match the request parameters.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token required to get the next set of results. This value is <code>null</code> if there are no more results to return.</p>\"\
        }\
      }\
    },\
    \"DescribeScalingActivitiesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ServiceNamespace\"],\
      \"members\":{\
        \"ServiceNamespace\":{\
          \"shape\":\"ServiceNamespace\",\
          \"documentation\":\"<p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The identifier of the resource associated with the scaling activity. This string consists of the resource type and unique identifier. If you specify a scalable dimension, you must also specify a resource ID.</p> <ul> <li> <p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p> </li> <li> <p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p> </li> <li> <p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p> </li> <li> <p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p> </li> <li> <p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p> </li> <li> <p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p> </li> <li> <p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p> </li> <li> <p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p> </li> <li> <p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href=\\\"https://github.com/aws/aws-auto-scaling-custom-resource\\\">GitHub repository</a>.</p> </li> <li> <p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p> </li> <li> <p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p> </li> <li> <p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p> </li> </ul>\"\
        },\
        \"ScalableDimension\":{\
          \"shape\":\"ScalableDimension\",\
          \"documentation\":\"<p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property. If you specify a scalable dimension, you must also specify a resource ID.</p> <ul> <li> <p> <code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p> </li> <li> <p> <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p> </li> <li> <p> <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p> </li> <li> <p> <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p> </li> <li> <p> <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p> </li> <li> <p> <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p> </li> <li> <p> <code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p> </li> <li> <p> <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p> </li> <li> <p> <code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p> </li> <li> <p> <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p> </li> <li> <p> <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p> </li> </ul>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of scalable targets. This value can be between 1 and 50. The default value is 50.</p> <p>If this parameter is used, the operation returns up to <code>MaxResults</code> results at a time, along with a <code>NextToken</code> value. To get the next set of results, include the <code>NextToken</code> value in a subsequent call. If this parameter is not used, the operation returns up to 50 results and a <code>NextToken</code> value, if applicable.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"DescribeScalingActivitiesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ScalingActivities\":{\
          \"shape\":\"ScalingActivities\",\
          \"documentation\":\"<p>A list of scaling activity objects.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token required to get the next set of results. This value is <code>null</code> if there are no more results to return.</p>\"\
        }\
      }\
    },\
    \"DescribeScalingPoliciesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ServiceNamespace\"],\
      \"members\":{\
        \"PolicyNames\":{\
          \"shape\":\"ResourceIdsMaxLen1600\",\
          \"documentation\":\"<p>The names of the scaling policies to describe.</p>\"\
        },\
        \"ServiceNamespace\":{\
          \"shape\":\"ServiceNamespace\",\
          \"documentation\":\"<p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The identifier of the resource associated with the scaling policy. This string consists of the resource type and unique identifier. If you specify a scalable dimension, you must also specify a resource ID.</p> <ul> <li> <p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p> </li> <li> <p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p> </li> <li> <p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p> </li> <li> <p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p> </li> <li> <p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p> </li> <li> <p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p> </li> <li> <p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p> </li> <li> <p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p> </li> <li> <p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href=\\\"https://github.com/aws/aws-auto-scaling-custom-resource\\\">GitHub repository</a>.</p> </li> <li> <p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p> </li> <li> <p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p> </li> <li> <p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p> </li> </ul>\"\
        },\
        \"ScalableDimension\":{\
          \"shape\":\"ScalableDimension\",\
          \"documentation\":\"<p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property. If you specify a scalable dimension, you must also specify a resource ID.</p> <ul> <li> <p> <code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p> </li> <li> <p> <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p> </li> <li> <p> <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p> </li> <li> <p> <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p> </li> <li> <p> <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p> </li> <li> <p> <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p> </li> <li> <p> <code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p> </li> <li> <p> <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p> </li> <li> <p> <code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p> </li> <li> <p> <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p> </li> <li> <p> <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p> </li> </ul>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of scalable targets. This value can be between 1 and 50. The default value is 50.</p> <p>If this parameter is used, the operation returns up to <code>MaxResults</code> results at a time, along with a <code>NextToken</code> value. To get the next set of results, include the <code>NextToken</code> value in a subsequent call. If this parameter is not used, the operation returns up to 50 results and a <code>NextToken</code> value, if applicable.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"DescribeScalingPoliciesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ScalingPolicies\":{\
          \"shape\":\"ScalingPolicies\",\
          \"documentation\":\"<p>Information about the scaling policies.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token required to get the next set of results. This value is <code>null</code> if there are no more results to return.</p>\"\
        }\
      }\
    },\
    \"DescribeScheduledActionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ServiceNamespace\"],\
      \"members\":{\
        \"ScheduledActionNames\":{\
          \"shape\":\"ResourceIdsMaxLen1600\",\
          \"documentation\":\"<p>The names of the scheduled actions to describe.</p>\"\
        },\
        \"ServiceNamespace\":{\
          \"shape\":\"ServiceNamespace\",\
          \"documentation\":\"<p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The identifier of the resource associated with the scheduled action. This string consists of the resource type and unique identifier. If you specify a scalable dimension, you must also specify a resource ID.</p> <ul> <li> <p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p> </li> <li> <p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p> </li> <li> <p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p> </li> <li> <p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p> </li> <li> <p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p> </li> <li> <p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p> </li> <li> <p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p> </li> <li> <p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p> </li> <li> <p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href=\\\"https://github.com/aws/aws-auto-scaling-custom-resource\\\">GitHub repository</a>.</p> </li> <li> <p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p> </li> <li> <p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p> </li> <li> <p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p> </li> </ul>\"\
        },\
        \"ScalableDimension\":{\
          \"shape\":\"ScalableDimension\",\
          \"documentation\":\"<p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property. If you specify a scalable dimension, you must also specify a resource ID.</p> <ul> <li> <p> <code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p> </li> <li> <p> <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p> </li> <li> <p> <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p> </li> <li> <p> <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p> </li> <li> <p> <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p> </li> <li> <p> <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p> </li> <li> <p> <code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p> </li> <li> <p> <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p> </li> <li> <p> <code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p> </li> <li> <p> <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p> </li> <li> <p> <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p> </li> </ul>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of scheduled action results. This value can be between 1 and 50. The default value is 50.</p> <p>If this parameter is used, the operation returns up to <code>MaxResults</code> results at a time, along with a <code>NextToken</code> value. To get the next set of results, include the <code>NextToken</code> value in a subsequent call. If this parameter is not used, the operation returns up to 50 results and a <code>NextToken</code> value, if applicable.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"DescribeScheduledActionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ScheduledActions\":{\
          \"shape\":\"ScheduledActions\",\
          \"documentation\":\"<p>Information about the scheduled actions.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token required to get the next set of results. This value is <code>null</code> if there are no more results to return.</p>\"\
        }\
      }\
    },\
    \"DisableScaleIn\":{\"type\":\"boolean\"},\
    \"ErrorMessage\":{\"type\":\"string\"},\
    \"FailedResourceAccessException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Failed access to resources caused an exception. This exception is thrown when Application Auto Scaling is unable to retrieve the alarms associated with a scaling policy due to a client error, for example, if the role ARN specified for a scalable target does not have permission to call the CloudWatch <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DescribeAlarms.html\\\">DescribeAlarms</a> on your behalf.</p>\",\
      \"exception\":true\
    },\
    \"InternalServiceException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The service encountered an internal error.</p>\",\
      \"exception\":true\
    },\
    \"InvalidNextTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The next token supplied was invalid.</p>\",\
      \"exception\":true\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>A per-account resource limit is exceeded. For more information, see <a href=\\\"https://docs.aws.amazon.com/ApplicationAutoScaling/latest/userguide/application-auto-scaling-limits.html\\\">Application Auto Scaling Limits</a>.</p>\",\
      \"exception\":true\
    },\
    \"MaxResults\":{\"type\":\"integer\"},\
    \"MetricAggregationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Average\",\
        \"Minimum\",\
        \"Maximum\"\
      ]\
    },\
    \"MetricDimension\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"MetricDimensionName\",\
          \"documentation\":\"<p>The name of the dimension.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"MetricDimensionValue\",\
          \"documentation\":\"<p>The value of the dimension.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the dimension names and values associated with a metric.</p>\"\
    },\
    \"MetricDimensionName\":{\"type\":\"string\"},\
    \"MetricDimensionValue\":{\"type\":\"string\"},\
    \"MetricDimensions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricDimension\"}\
    },\
    \"MetricName\":{\"type\":\"string\"},\
    \"MetricNamespace\":{\"type\":\"string\"},\
    \"MetricScale\":{\"type\":\"double\"},\
    \"MetricStatistic\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Average\",\
        \"Minimum\",\
        \"Maximum\",\
        \"SampleCount\",\
        \"Sum\"\
      ]\
    },\
    \"MetricType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DynamoDBReadCapacityUtilization\",\
        \"DynamoDBWriteCapacityUtilization\",\
        \"ALBRequestCountPerTarget\",\
        \"RDSReaderAverageCPUUtilization\",\
        \"RDSReaderAverageDatabaseConnections\",\
        \"EC2SpotFleetRequestAverageCPUUtilization\",\
        \"EC2SpotFleetRequestAverageNetworkIn\",\
        \"EC2SpotFleetRequestAverageNetworkOut\",\
        \"SageMakerVariantInvocationsPerInstance\",\
        \"ECSServiceAverageCPUUtilization\",\
        \"ECSServiceAverageMemoryUtilization\",\
        \"AppStreamAverageCapacityUtilization\",\
        \"ComprehendInferenceUtilization\",\
        \"LambdaProvisionedConcurrencyUtilization\",\
        \"CassandraReadCapacityUtilization\",\
        \"CassandraWriteCapacityUtilization\"\
      ]\
    },\
    \"MetricUnit\":{\"type\":\"string\"},\
    \"MinAdjustmentMagnitude\":{\"type\":\"integer\"},\
    \"ObjectNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The specified object could not be found. For any operation that depends on the existence of a scalable target, this exception is thrown if the scalable target with the specified service namespace, resource ID, and scalable dimension does not exist. For any operation that deletes or deregisters a resource, this exception is thrown if the resource cannot be found.</p>\",\
      \"exception\":true\
    },\
    \"PolicyName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"\\\\p{Print}+\"\
    },\
    \"PolicyType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"StepScaling\",\
        \"TargetTrackingScaling\"\
      ]\
    },\
    \"PredefinedMetricSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\"PredefinedMetricType\"],\
      \"members\":{\
        \"PredefinedMetricType\":{\
          \"shape\":\"MetricType\",\
          \"documentation\":\"<p>The metric type. The <code>ALBRequestCountPerTarget</code> metric type applies only to Spot Fleet requests and ECS services.</p>\"\
        },\
        \"ResourceLabel\":{\
          \"shape\":\"ResourceLabel\",\
          \"documentation\":\"<p>Identifies the resource associated with the metric type. You can't specify a resource label unless the metric type is <code>ALBRequestCountPerTarget</code> and there is a target group attached to the Spot Fleet request or ECS service.</p> <p>The format is app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt;/targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt;, where:</p> <ul> <li> <p>app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load balancer ARN</p> </li> <li> <p>targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of the target group ARN.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a predefined metric for a target tracking scaling policy to use with Application Auto Scaling.</p> <p>Only the AWS services that you're using send metrics to Amazon CloudWatch. To determine whether a desired metric already exists by looking up its namespace and dimension using the CloudWatch metrics dashboard in the console, follow the procedure in <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/userguide/monitoring-cloudwatch.html\\\">Building Dashboards with CloudWatch</a> in the <i>Application Auto Scaling User Guide</i>.</p>\"\
    },\
    \"PutScalingPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PolicyName\",\
        \"ServiceNamespace\",\
        \"ResourceId\",\
        \"ScalableDimension\"\
      ],\
      \"members\":{\
        \"PolicyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the scaling policy.</p>\"\
        },\
        \"ServiceNamespace\":{\
          \"shape\":\"ServiceNamespace\",\
          \"documentation\":\"<p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The identifier of the resource associated with the scaling policy. This string consists of the resource type and unique identifier.</p> <ul> <li> <p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p> </li> <li> <p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p> </li> <li> <p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p> </li> <li> <p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p> </li> <li> <p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p> </li> <li> <p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p> </li> <li> <p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p> </li> <li> <p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p> </li> <li> <p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href=\\\"https://github.com/aws/aws-auto-scaling-custom-resource\\\">GitHub repository</a>.</p> </li> <li> <p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p> </li> <li> <p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p> </li> <li> <p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p> </li> </ul>\"\
        },\
        \"ScalableDimension\":{\
          \"shape\":\"ScalableDimension\",\
          \"documentation\":\"<p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property.</p> <ul> <li> <p> <code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p> </li> <li> <p> <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p> </li> <li> <p> <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p> </li> <li> <p> <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p> </li> <li> <p> <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p> </li> <li> <p> <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p> </li> <li> <p> <code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p> </li> <li> <p> <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p> </li> <li> <p> <code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p> </li> <li> <p> <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p> </li> <li> <p> <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p> </li> </ul>\"\
        },\
        \"PolicyType\":{\
          \"shape\":\"PolicyType\",\
          \"documentation\":\"<p>The policy type. This parameter is required if you are creating a scaling policy.</p> <p>The following policy types are supported: </p> <p> <code>TargetTrackingScaling</code>âNot supported for Amazon EMR</p> <p> <code>StepScaling</code>âNot supported for DynamoDB, Amazon Comprehend, Lambda, or Amazon Keyspaces (for Apache Cassandra).</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html\\\">Target Tracking Scaling Policies</a> and <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html\\\">Step Scaling Policies</a> in the <i>Application Auto Scaling User Guide</i>.</p>\"\
        },\
        \"StepScalingPolicyConfiguration\":{\
          \"shape\":\"StepScalingPolicyConfiguration\",\
          \"documentation\":\"<p>A step scaling policy.</p> <p>This parameter is required if you are creating a policy and the policy type is <code>StepScaling</code>.</p>\"\
        },\
        \"TargetTrackingScalingPolicyConfiguration\":{\
          \"shape\":\"TargetTrackingScalingPolicyConfiguration\",\
          \"documentation\":\"<p>A target tracking scaling policy. Includes support for predefined or customized metrics.</p> <p>This parameter is required if you are creating a policy and the policy type is <code>TargetTrackingScaling</code>.</p>\"\
        }\
      }\
    },\
    \"PutScalingPolicyResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"PolicyARN\"],\
      \"members\":{\
        \"PolicyARN\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resulting scaling policy.</p>\"\
        },\
        \"Alarms\":{\
          \"shape\":\"Alarms\",\
          \"documentation\":\"<p>The CloudWatch alarms created for the target tracking scaling policy.</p>\"\
        }\
      }\
    },\
    \"PutScheduledActionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ServiceNamespace\",\
        \"ScheduledActionName\",\
        \"ResourceId\",\
        \"ScalableDimension\"\
      ],\
      \"members\":{\
        \"ServiceNamespace\":{\
          \"shape\":\"ServiceNamespace\",\
          \"documentation\":\"<p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>\"\
        },\
        \"Schedule\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The schedule for this action. The following formats are supported:</p> <ul> <li> <p>At expressions - \\\"<code>at(<i>yyyy</i>-<i>mm</i>-<i>dd</i>T<i>hh</i>:<i>mm</i>:<i>ss</i>)</code>\\\"</p> </li> <li> <p>Rate expressions - \\\"<code>rate(<i>value</i> <i>unit</i>)</code>\\\"</p> </li> <li> <p>Cron expressions - \\\"<code>cron(<i>fields</i>)</code>\\\"</p> </li> </ul> <p>At expressions are useful for one-time schedules. Specify the time in UTC.</p> <p>For rate expressions, <i>value</i> is a positive integer and <i>unit</i> is <code>minute</code> | <code>minutes</code> | <code>hour</code> | <code>hours</code> | <code>day</code> | <code>days</code>.</p> <p>For more information about cron expressions, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions\\\">Cron Expressions</a> in the <i>Amazon CloudWatch Events User Guide</i>.</p> <p>For examples of using these expressions, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html\\\">Scheduled Scaling</a> in the <i>Application Auto Scaling User Guide</i>.</p>\"\
        },\
        \"ScheduledActionName\":{\
          \"shape\":\"ScheduledActionName\",\
          \"documentation\":\"<p>The name of the scheduled action. This name must be unique among all other scheduled actions on the specified scalable target. </p>\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The identifier of the resource associated with the scheduled action. This string consists of the resource type and unique identifier.</p> <ul> <li> <p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p> </li> <li> <p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p> </li> <li> <p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p> </li> <li> <p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p> </li> <li> <p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p> </li> <li> <p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p> </li> <li> <p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p> </li> <li> <p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p> </li> <li> <p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href=\\\"https://github.com/aws/aws-auto-scaling-custom-resource\\\">GitHub repository</a>.</p> </li> <li> <p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p> </li> <li> <p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p> </li> <li> <p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p> </li> </ul>\"\
        },\
        \"ScalableDimension\":{\
          \"shape\":\"ScalableDimension\",\
          \"documentation\":\"<p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property.</p> <ul> <li> <p> <code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p> </li> <li> <p> <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p> </li> <li> <p> <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p> </li> <li> <p> <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p> </li> <li> <p> <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p> </li> <li> <p> <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p> </li> <li> <p> <code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p> </li> <li> <p> <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p> </li> <li> <p> <code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p> </li> <li> <p> <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p> </li> <li> <p> <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p> </li> </ul>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time for this scheduled action to start.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time for the recurring schedule to end.</p>\"\
        },\
        \"ScalableTargetAction\":{\
          \"shape\":\"ScalableTargetAction\",\
          \"documentation\":\"<p>The new minimum and maximum capacity. You can set both values or just one. At the scheduled time, if the current capacity is below the minimum capacity, Application Auto Scaling scales out to the minimum capacity. If the current capacity is above the maximum capacity, Application Auto Scaling scales in to the maximum capacity.</p>\"\
        }\
      }\
    },\
    \"PutScheduledActionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"RegisterScalableTargetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ServiceNamespace\",\
        \"ResourceId\",\
        \"ScalableDimension\"\
      ],\
      \"members\":{\
        \"ServiceNamespace\":{\
          \"shape\":\"ServiceNamespace\",\
          \"documentation\":\"<p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The identifier of the resource that is associated with the scalable target. This string consists of the resource type and unique identifier.</p> <ul> <li> <p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p> </li> <li> <p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p> </li> <li> <p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p> </li> <li> <p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p> </li> <li> <p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p> </li> <li> <p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p> </li> <li> <p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p> </li> <li> <p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p> </li> <li> <p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href=\\\"https://github.com/aws/aws-auto-scaling-custom-resource\\\">GitHub repository</a>.</p> </li> <li> <p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p> </li> <li> <p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p> </li> <li> <p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p> </li> </ul>\"\
        },\
        \"ScalableDimension\":{\
          \"shape\":\"ScalableDimension\",\
          \"documentation\":\"<p>The scalable dimension associated with the scalable target. This string consists of the service namespace, resource type, and scaling property.</p> <ul> <li> <p> <code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p> </li> <li> <p> <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p> </li> <li> <p> <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p> </li> <li> <p> <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p> </li> <li> <p> <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p> </li> <li> <p> <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p> </li> <li> <p> <code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p> </li> <li> <p> <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p> </li> <li> <p> <code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p> </li> <li> <p> <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p> </li> <li> <p> <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p> </li> </ul>\"\
        },\
        \"MinCapacity\":{\
          \"shape\":\"ResourceCapacity\",\
          \"documentation\":\"<p>The minimum value that you plan to scale in to. When a scaling policy is in effect, Application Auto Scaling can scale in (contract) as needed to the minimum capacity limit in response to changing demand. </p> <p>This parameter is required if you are registering a scalable target. For Lambda provisioned concurrency, the minimum value allowed is 0. For all other resources, the minimum value allowed is 1.</p>\"\
        },\
        \"MaxCapacity\":{\
          \"shape\":\"ResourceCapacity\",\
          \"documentation\":\"<p>The maximum value that you plan to scale out to. When a scaling policy is in effect, Application Auto Scaling can scale out (expand) as needed to the maximum capacity limit in response to changing demand. </p> <p>This parameter is required if you are registering a scalable target.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>This parameter is required for services that do not support service-linked roles (such as Amazon EMR), and it must specify the ARN of an IAM role that allows Application Auto Scaling to modify the scalable target on your behalf. </p> <p>If the service supports service-linked roles, Application Auto Scaling uses a service-linked role, which it creates if it does not yet exist. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/userguide/security_iam_service-with-iam.html#security_iam_service-with-iam-roles\\\">Application Auto Scaling IAM Roles</a>.</p>\"\
        },\
        \"SuspendedState\":{\
          \"shape\":\"SuspendedState\",\
          \"documentation\":\"<p>An embedded object that contains attributes and attribute values that are used to suspend and resume automatic scaling. Setting the value of an attribute to <code>true</code> suspends the specified scaling activities. Setting it to <code>false</code> (default) resumes the specified scaling activities. </p> <p> <b>Suspension Outcomes</b> </p> <ul> <li> <p>For <code>DynamicScalingInSuspended</code>, while a suspension is in effect, all scale-in activities that are triggered by a scaling policy are suspended.</p> </li> <li> <p>For <code>DynamicScalingOutSuspended</code>, while a suspension is in effect, all scale-out activities that are triggered by a scaling policy are suspended.</p> </li> <li> <p>For <code>ScheduledScalingSuspended</code>, while a suspension is in effect, all scaling activities that involve scheduled actions are suspended. </p> </li> </ul> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-suspend-resume-scaling.html\\\">Suspending and Resuming Scaling</a> in the <i>Application Auto Scaling User Guide</i>.</p>\"\
        }\
      }\
    },\
    \"RegisterScalableTargetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"ResourceCapacity\":{\"type\":\"integer\"},\
    \"ResourceId\":{\
      \"type\":\"string\",\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"ResourceIdMaxLen1600\":{\
      \"type\":\"string\",\
      \"max\":1600,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"ResourceIdsMaxLen1600\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceIdMaxLen1600\"}\
    },\
    \"ResourceLabel\":{\
      \"type\":\"string\",\
      \"max\":1023,\
      \"min\":1\
    },\
    \"ScalableDimension\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ecs:service:DesiredCount\",\
        \"ec2:spot-fleet-request:TargetCapacity\",\
        \"elasticmapreduce:instancegroup:InstanceCount\",\
        \"appstream:fleet:DesiredCapacity\",\
        \"dynamodb:table:ReadCapacityUnits\",\
        \"dynamodb:table:WriteCapacityUnits\",\
        \"dynamodb:index:ReadCapacityUnits\",\
        \"dynamodb:index:WriteCapacityUnits\",\
        \"rds:cluster:ReadReplicaCount\",\
        \"sagemaker:variant:DesiredInstanceCount\",\
        \"custom-resource:ResourceType:Property\",\
        \"comprehend:document-classifier-endpoint:DesiredInferenceUnits\",\
        \"lambda:function:ProvisionedConcurrency\",\
        \"cassandra:table:ReadCapacityUnits\",\
        \"cassandra:table:WriteCapacityUnits\"\
      ]\
    },\
    \"ScalableTarget\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ServiceNamespace\",\
        \"ResourceId\",\
        \"ScalableDimension\",\
        \"MinCapacity\",\
        \"MaxCapacity\",\
        \"RoleARN\",\
        \"CreationTime\"\
      ],\
      \"members\":{\
        \"ServiceNamespace\":{\
          \"shape\":\"ServiceNamespace\",\
          \"documentation\":\"<p>The namespace of the AWS service that provides the resource, or a <code>custom-resource</code>.</p>\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The identifier of the resource associated with the scalable target. This string consists of the resource type and unique identifier.</p> <ul> <li> <p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p> </li> <li> <p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p> </li> <li> <p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p> </li> <li> <p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p> </li> <li> <p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p> </li> <li> <p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p> </li> <li> <p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p> </li> <li> <p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p> </li> <li> <p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href=\\\"https://github.com/aws/aws-auto-scaling-custom-resource\\\">GitHub repository</a>.</p> </li> <li> <p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p> </li> <li> <p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p> </li> <li> <p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p> </li> </ul>\"\
        },\
        \"ScalableDimension\":{\
          \"shape\":\"ScalableDimension\",\
          \"documentation\":\"<p>The scalable dimension associated with the scalable target. This string consists of the service namespace, resource type, and scaling property.</p> <ul> <li> <p> <code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p> </li> <li> <p> <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p> </li> <li> <p> <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p> </li> <li> <p> <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p> </li> <li> <p> <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p> </li> <li> <p> <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p> </li> <li> <p> <code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p> </li> <li> <p> <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p> </li> <li> <p> <code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p> </li> <li> <p> <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p> </li> <li> <p> <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p> </li> </ul>\"\
        },\
        \"MinCapacity\":{\
          \"shape\":\"ResourceCapacity\",\
          \"documentation\":\"<p>The minimum value to scale to in response to a scale-in activity.</p>\"\
        },\
        \"MaxCapacity\":{\
          \"shape\":\"ResourceCapacity\",\
          \"documentation\":\"<p>The maximum value to scale to in response to a scale-out activity.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The ARN of an IAM role that allows Application Auto Scaling to modify the scalable target on your behalf.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The Unix timestamp for when the scalable target was created.</p>\"\
        },\
        \"SuspendedState\":{\"shape\":\"SuspendedState\"}\
      },\
      \"documentation\":\"<p>Represents a scalable target.</p>\"\
    },\
    \"ScalableTargetAction\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MinCapacity\":{\
          \"shape\":\"ResourceCapacity\",\
          \"documentation\":\"<p>The minimum capacity.</p> <p>For Lambda provisioned concurrency, the minimum value allowed is 0. For all other resources, the minimum value allowed is 1.</p>\"\
        },\
        \"MaxCapacity\":{\
          \"shape\":\"ResourceCapacity\",\
          \"documentation\":\"<p>The maximum capacity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the minimum and maximum capacity for a scheduled action.</p>\"\
    },\
    \"ScalableTargets\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ScalableTarget\"}\
    },\
    \"ScalingActivities\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ScalingActivity\"}\
    },\
    \"ScalingActivity\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ActivityId\",\
        \"ServiceNamespace\",\
        \"ResourceId\",\
        \"ScalableDimension\",\
        \"Description\",\
        \"Cause\",\
        \"StartTime\",\
        \"StatusCode\"\
      ],\
      \"members\":{\
        \"ActivityId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The unique identifier of the scaling activity.</p>\"\
        },\
        \"ServiceNamespace\":{\
          \"shape\":\"ServiceNamespace\",\
          \"documentation\":\"<p>The namespace of the AWS service that provides the resource, or a <code>custom-resource</code>.</p>\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The identifier of the resource associated with the scaling activity. This string consists of the resource type and unique identifier.</p> <ul> <li> <p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p> </li> <li> <p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p> </li> <li> <p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p> </li> <li> <p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p> </li> <li> <p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p> </li> <li> <p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p> </li> <li> <p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p> </li> <li> <p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p> </li> <li> <p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href=\\\"https://github.com/aws/aws-auto-scaling-custom-resource\\\">GitHub repository</a>.</p> </li> <li> <p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p> </li> <li> <p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p> </li> <li> <p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p> </li> </ul>\"\
        },\
        \"ScalableDimension\":{\
          \"shape\":\"ScalableDimension\",\
          \"documentation\":\"<p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property.</p> <ul> <li> <p> <code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p> </li> <li> <p> <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p> </li> <li> <p> <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p> </li> <li> <p> <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p> </li> <li> <p> <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p> </li> <li> <p> <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p> </li> <li> <p> <code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p> </li> <li> <p> <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p> </li> <li> <p> <code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p> </li> <li> <p> <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p> </li> <li> <p> <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p> </li> </ul>\"\
        },\
        \"Description\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A simple description of what action the scaling activity intends to accomplish.</p>\"\
        },\
        \"Cause\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A simple description of what caused the scaling activity to happen.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The Unix timestamp for when the scaling activity began.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The Unix timestamp for when the scaling activity ended.</p>\"\
        },\
        \"StatusCode\":{\
          \"shape\":\"ScalingActivityStatusCode\",\
          \"documentation\":\"<p>Indicates the status of the scaling activity.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A simple message about the current status of the scaling activity.</p>\"\
        },\
        \"Details\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The details about the scaling activity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a scaling activity.</p>\"\
    },\
    \"ScalingActivityStatusCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Pending\",\
        \"InProgress\",\
        \"Successful\",\
        \"Overridden\",\
        \"Unfulfilled\",\
        \"Failed\"\
      ]\
    },\
    \"ScalingAdjustment\":{\"type\":\"integer\"},\
    \"ScalingPolicies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ScalingPolicy\"}\
    },\
    \"ScalingPolicy\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PolicyARN\",\
        \"PolicyName\",\
        \"ServiceNamespace\",\
        \"ResourceId\",\
        \"ScalableDimension\",\
        \"PolicyType\",\
        \"CreationTime\"\
      ],\
      \"members\":{\
        \"PolicyARN\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the scaling policy.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the scaling policy.</p>\"\
        },\
        \"ServiceNamespace\":{\
          \"shape\":\"ServiceNamespace\",\
          \"documentation\":\"<p>The namespace of the AWS service that provides the resource, or a <code>custom-resource</code>.</p>\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The identifier of the resource associated with the scaling policy. This string consists of the resource type and unique identifier.</p> <ul> <li> <p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p> </li> <li> <p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p> </li> <li> <p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p> </li> <li> <p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p> </li> <li> <p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p> </li> <li> <p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p> </li> <li> <p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p> </li> <li> <p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p> </li> <li> <p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href=\\\"https://github.com/aws/aws-auto-scaling-custom-resource\\\">GitHub repository</a>.</p> </li> <li> <p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p> </li> <li> <p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p> </li> <li> <p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p> </li> </ul>\"\
        },\
        \"ScalableDimension\":{\
          \"shape\":\"ScalableDimension\",\
          \"documentation\":\"<p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property.</p> <ul> <li> <p> <code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p> </li> <li> <p> <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p> </li> <li> <p> <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p> </li> <li> <p> <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p> </li> <li> <p> <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p> </li> <li> <p> <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p> </li> <li> <p> <code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p> </li> <li> <p> <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p> </li> <li> <p> <code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p> </li> <li> <p> <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p> </li> <li> <p> <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p> </li> </ul>\"\
        },\
        \"PolicyType\":{\
          \"shape\":\"PolicyType\",\
          \"documentation\":\"<p>The scaling policy type.</p>\"\
        },\
        \"StepScalingPolicyConfiguration\":{\
          \"shape\":\"StepScalingPolicyConfiguration\",\
          \"documentation\":\"<p>A step scaling policy.</p>\"\
        },\
        \"TargetTrackingScalingPolicyConfiguration\":{\
          \"shape\":\"TargetTrackingScalingPolicyConfiguration\",\
          \"documentation\":\"<p>A target tracking scaling policy.</p>\"\
        },\
        \"Alarms\":{\
          \"shape\":\"Alarms\",\
          \"documentation\":\"<p>The CloudWatch alarms associated with the scaling policy.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The Unix timestamp for when the scaling policy was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a scaling policy to use with Application Auto Scaling.</p>\"\
    },\
    \"ScalingSuspended\":{\"type\":\"boolean\"},\
    \"ScheduledAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ScheduledActionName\",\
        \"ScheduledActionARN\",\
        \"ServiceNamespace\",\
        \"Schedule\",\
        \"ResourceId\",\
        \"CreationTime\"\
      ],\
      \"members\":{\
        \"ScheduledActionName\":{\
          \"shape\":\"ScheduledActionName\",\
          \"documentation\":\"<p>The name of the scheduled action.</p>\"\
        },\
        \"ScheduledActionARN\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the scheduled action.</p>\"\
        },\
        \"ServiceNamespace\":{\
          \"shape\":\"ServiceNamespace\",\
          \"documentation\":\"<p>The namespace of the AWS service that provides the resource, or a <code>custom-resource</code>.</p>\"\
        },\
        \"Schedule\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The schedule for this action. The following formats are supported:</p> <ul> <li> <p>At expressions - \\\"<code>at(<i>yyyy</i>-<i>mm</i>-<i>dd</i>T<i>hh</i>:<i>mm</i>:<i>ss</i>)</code>\\\"</p> </li> <li> <p>Rate expressions - \\\"<code>rate(<i>value</i> <i>unit</i>)</code>\\\"</p> </li> <li> <p>Cron expressions - \\\"<code>cron(<i>fields</i>)</code>\\\"</p> </li> </ul> <p>At expressions are useful for one-time schedules. Specify the time in UTC.</p> <p>For rate expressions, <i>value</i> is a positive integer and <i>unit</i> is <code>minute</code> | <code>minutes</code> | <code>hour</code> | <code>hours</code> | <code>day</code> | <code>days</code>.</p> <p>For more information about cron expressions, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions\\\">Cron Expressions</a> in the <i>Amazon CloudWatch Events User Guide</i>.</p> <p>For examples of using these expressions, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html\\\">Scheduled Scaling</a> in the <i>Application Auto Scaling User Guide</i>.</p>\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"ResourceIdMaxLen1600\",\
          \"documentation\":\"<p>The identifier of the resource associated with the scaling policy. This string consists of the resource type and unique identifier.</p> <ul> <li> <p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p> </li> <li> <p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p> </li> <li> <p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p> </li> <li> <p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p> </li> <li> <p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p> </li> <li> <p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p> </li> <li> <p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p> </li> <li> <p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p> </li> <li> <p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href=\\\"https://github.com/aws/aws-auto-scaling-custom-resource\\\">GitHub repository</a>.</p> </li> <li> <p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p> </li> <li> <p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p> </li> <li> <p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p> </li> </ul>\"\
        },\
        \"ScalableDimension\":{\
          \"shape\":\"ScalableDimension\",\
          \"documentation\":\"<p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property.</p> <ul> <li> <p> <code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p> </li> <li> <p> <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p> </li> <li> <p> <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p> </li> <li> <p> <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p> </li> <li> <p> <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p> </li> <li> <p> <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p> </li> <li> <p> <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p> </li> <li> <p> <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p> </li> <li> <p> <code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p> </li> <li> <p> <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p> </li> <li> <p> <code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p> </li> <li> <p> <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p> </li> <li> <p> <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p> </li> </ul>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time that the action is scheduled to begin.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time that the action is scheduled to end.</p>\"\
        },\
        \"ScalableTargetAction\":{\
          \"shape\":\"ScalableTargetAction\",\
          \"documentation\":\"<p>The new minimum and maximum capacity. You can set both values or just one. At the scheduled time, if the current capacity is below the minimum capacity, Application Auto Scaling scales out to the minimum capacity. If the current capacity is above the maximum capacity, Application Auto Scaling scales in to the maximum capacity.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time that the scheduled action was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a scheduled action.</p>\"\
    },\
    \"ScheduledActionName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"(?!((^[ ]+.*)|(.*([\\\\u0000-\\\\u001f]|[\\\\u007f-\\\\u009f]|[:/|])+.*)|(.*[ ]+$))).+\"\
    },\
    \"ScheduledActions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ScheduledAction\"}\
    },\
    \"ServiceNamespace\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ecs\",\
        \"elasticmapreduce\",\
        \"ec2\",\
        \"appstream\",\
        \"dynamodb\",\
        \"rds\",\
        \"sagemaker\",\
        \"custom-resource\",\
        \"comprehend\",\
        \"lambda\",\
        \"cassandra\"\
      ]\
    },\
    \"StepAdjustment\":{\
      \"type\":\"structure\",\
      \"required\":[\"ScalingAdjustment\"],\
      \"members\":{\
        \"MetricIntervalLowerBound\":{\
          \"shape\":\"MetricScale\",\
          \"documentation\":\"<p>The lower bound for the difference between the alarm threshold and the CloudWatch metric. If the metric value is above the breach threshold, the lower bound is inclusive (the metric must be greater than or equal to the threshold plus the lower bound). Otherwise, it is exclusive (the metric must be greater than the threshold plus the lower bound). A null value indicates negative infinity.</p>\"\
        },\
        \"MetricIntervalUpperBound\":{\
          \"shape\":\"MetricScale\",\
          \"documentation\":\"<p>The upper bound for the difference between the alarm threshold and the CloudWatch metric. If the metric value is above the breach threshold, the upper bound is exclusive (the metric must be less than the threshold plus the upper bound). Otherwise, it is inclusive (the metric must be less than or equal to the threshold plus the upper bound). A null value indicates positive infinity.</p> <p>The upper bound must be greater than the lower bound.</p>\"\
        },\
        \"ScalingAdjustment\":{\
          \"shape\":\"ScalingAdjustment\",\
          \"documentation\":\"<p>The amount by which to scale, based on the specified adjustment type. A positive value adds to the current capacity while a negative number removes from the current capacity. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a step adjustment for a <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/APIReference/API_StepScalingPolicyConfiguration.html\\\">StepScalingPolicyConfiguration</a>. Describes an adjustment based on the difference between the value of the aggregated CloudWatch metric and the breach threshold that you've defined for the alarm. </p> <p>For the following examples, suppose that you have an alarm with a breach threshold of 50:</p> <ul> <li> <p>To trigger the adjustment when the metric is greater than or equal to 50 and less than 60, specify a lower bound of 0 and an upper bound of 10.</p> </li> <li> <p>To trigger the adjustment when the metric is greater than 40 and less than or equal to 50, specify a lower bound of -10 and an upper bound of 0.</p> </li> </ul> <p>There are a few rules for the step adjustments for your step policy:</p> <ul> <li> <p>The ranges of your step adjustments can't overlap or have a gap.</p> </li> <li> <p>At most one step adjustment can have a null lower bound. If one step adjustment has a negative lower bound, then there must be a step adjustment with a null lower bound.</p> </li> <li> <p>At most one step adjustment can have a null upper bound. If one step adjustment has a positive upper bound, then there must be a step adjustment with a null upper bound.</p> </li> <li> <p>The upper and lower bound can't be null in the same step adjustment.</p> </li> </ul>\"\
    },\
    \"StepAdjustments\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StepAdjustment\"}\
    },\
    \"StepScalingPolicyConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AdjustmentType\":{\
          \"shape\":\"AdjustmentType\",\
          \"documentation\":\"<p>Specifies whether the <code>ScalingAdjustment</code> value in a <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/APIReference/API_StepAdjustment.html\\\">StepAdjustment</a> is an absolute number or a percentage of the current capacity. </p> <p> <code>AdjustmentType</code> is required if you are adding a new step scaling policy configuration.</p>\"\
        },\
        \"StepAdjustments\":{\
          \"shape\":\"StepAdjustments\",\
          \"documentation\":\"<p>A set of adjustments that enable you to scale based on the size of the alarm breach.</p> <p>At least one step adjustment is required if you are adding a new step scaling policy configuration.</p>\"\
        },\
        \"MinAdjustmentMagnitude\":{\
          \"shape\":\"MinAdjustmentMagnitude\",\
          \"documentation\":\"<p>The minimum value to scale by when scaling by percentages. For example, suppose that you create a step scaling policy to scale out an Amazon ECS service by 25 percent and you specify a <code>MinAdjustmentMagnitude</code> of 2. If the service has 4 tasks and the scaling policy is performed, 25 percent of 4 is 1. However, because you specified a <code>MinAdjustmentMagnitude</code> of 2, Application Auto Scaling scales out the service by 2 tasks.</p> <p>Valid only if the adjustment type is <code>PercentChangeInCapacity</code>. </p>\"\
        },\
        \"Cooldown\":{\
          \"shape\":\"Cooldown\",\
          \"documentation\":\"<p>The amount of time, in seconds, to wait for a previous scaling activity to take effect.</p> <p>With scale-out policies, the intention is to continuously (but not excessively) scale out. After Application Auto Scaling successfully scales out using a step scaling policy, it starts to calculate the cooldown time. While the cooldown period is in effect, capacity added by the initiating scale-out activity is calculated as part of the desired capacity for the next scale-out activity. For example, when an alarm triggers a step scaling policy to increase the capacity by 2, the scaling activity completes successfully, and a cooldown period starts. If the alarm triggers again during the cooldown period but at a more aggressive step adjustment of 3, the previous increase of 2 is considered part of the current capacity. Therefore, only 1 is added to the capacity.</p> <p>With scale-in policies, the intention is to scale in conservatively to protect your applicationâs availability, so scale-in activities are blocked until the cooldown period has expired. However, if another alarm triggers a scale-out activity during the cooldown period after a scale-in activity, Application Auto Scaling scales out the target immediately. In this case, the cooldown period for the scale-in activity stops and doesn't complete.</p> <p>Application Auto Scaling provides a default value of 300 for the following scalable targets:</p> <ul> <li> <p>ECS services</p> </li> <li> <p>Spot Fleet requests</p> </li> <li> <p>EMR clusters</p> </li> <li> <p>AppStream 2.0 fleets</p> </li> <li> <p>Aurora DB clusters</p> </li> <li> <p>Amazon SageMaker endpoint variants</p> </li> <li> <p>Custom resources</p> </li> </ul> <p>For all other scalable targets, the default value is 0:</p> <ul> <li> <p>DynamoDB tables</p> </li> <li> <p>DynamoDB global secondary indexes</p> </li> <li> <p>Amazon Comprehend document classification endpoints</p> </li> <li> <p>Lambda provisioned concurrency</p> </li> <li> <p>Amazon Keyspaces tables</p> </li> </ul>\"\
        },\
        \"MetricAggregationType\":{\
          \"shape\":\"MetricAggregationType\",\
          \"documentation\":\"<p>The aggregation type for the CloudWatch metrics. Valid values are <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code>. If the aggregation type is null, the value is treated as <code>Average</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a step scaling policy configuration to use with Application Auto Scaling.</p>\"\
    },\
    \"SuspendedState\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DynamicScalingInSuspended\":{\
          \"shape\":\"ScalingSuspended\",\
          \"documentation\":\"<p>Whether scale in by a target tracking scaling policy or a step scaling policy is suspended. Set the value to <code>true</code> if you don't want Application Auto Scaling to remove capacity when a scaling policy is triggered. The default is <code>false</code>. </p>\"\
        },\
        \"DynamicScalingOutSuspended\":{\
          \"shape\":\"ScalingSuspended\",\
          \"documentation\":\"<p>Whether scale out by a target tracking scaling policy or a step scaling policy is suspended. Set the value to <code>true</code> if you don't want Application Auto Scaling to add capacity when a scaling policy is triggered. The default is <code>false</code>. </p>\"\
        },\
        \"ScheduledScalingSuspended\":{\
          \"shape\":\"ScalingSuspended\",\
          \"documentation\":\"<p>Whether scheduled scaling is suspended. Set the value to <code>true</code> if you don't want Application Auto Scaling to add or remove capacity by initiating scheduled actions. The default is <code>false</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies whether the scaling activities for a scalable target are in a suspended state. </p>\"\
    },\
    \"TargetTrackingScalingPolicyConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"TargetValue\"],\
      \"members\":{\
        \"TargetValue\":{\
          \"shape\":\"MetricScale\",\
          \"documentation\":\"<p>The target value for the metric. The range is 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2).</p>\"\
        },\
        \"PredefinedMetricSpecification\":{\
          \"shape\":\"PredefinedMetricSpecification\",\
          \"documentation\":\"<p>A predefined metric. You can specify either a predefined metric or a customized metric.</p>\"\
        },\
        \"CustomizedMetricSpecification\":{\
          \"shape\":\"CustomizedMetricSpecification\",\
          \"documentation\":\"<p>A customized metric. You can specify either a predefined metric or a customized metric.</p>\"\
        },\
        \"ScaleOutCooldown\":{\
          \"shape\":\"Cooldown\",\
          \"documentation\":\"<p>The amount of time, in seconds, to wait for a previous scale-out activity to take effect.</p> <p>With the <i>scale-out cooldown period</i>, the intention is to continuously (but not excessively) scale out. After Application Auto Scaling successfully scales out using a target tracking scaling policy, it starts to calculate the cooldown time. While the scale-out cooldown period is in effect, the capacity added by the initiating scale-out activity is calculated as part of the desired capacity for the next scale-out activity.</p> <p>Application Auto Scaling provides a default value of 300 for the following scalable targets:</p> <ul> <li> <p>ECS services</p> </li> <li> <p>Spot Fleet requests</p> </li> <li> <p>EMR clusters</p> </li> <li> <p>AppStream 2.0 fleets</p> </li> <li> <p>Aurora DB clusters</p> </li> <li> <p>Amazon SageMaker endpoint variants</p> </li> <li> <p>Custom resources</p> </li> </ul> <p>For all other scalable targets, the default value is 0:</p> <ul> <li> <p>DynamoDB tables</p> </li> <li> <p>DynamoDB global secondary indexes</p> </li> <li> <p>Amazon Comprehend document classification endpoints</p> </li> <li> <p>Lambda provisioned concurrency</p> </li> <li> <p>Amazon Keyspaces tables</p> </li> </ul>\"\
        },\
        \"ScaleInCooldown\":{\
          \"shape\":\"Cooldown\",\
          \"documentation\":\"<p>The amount of time, in seconds, after a scale-in activity completes before another scale-in activity can start.</p> <p>With the <i>scale-in cooldown period</i>, the intention is to scale in conservatively to protect your applicationâs availability, so scale-in activities are blocked until the cooldown period has expired. However, if another alarm triggers a scale-out activity during the scale-in cooldown period, Application Auto Scaling scales out the target immediately. In this case, the scale-in cooldown period stops and doesn't complete.</p> <p>Application Auto Scaling provides a default value of 300 for the following scalable targets:</p> <ul> <li> <p>ECS services</p> </li> <li> <p>Spot Fleet requests</p> </li> <li> <p>EMR clusters</p> </li> <li> <p>AppStream 2.0 fleets</p> </li> <li> <p>Aurora DB clusters</p> </li> <li> <p>Amazon SageMaker endpoint variants</p> </li> <li> <p>Custom resources</p> </li> </ul> <p>For all other scalable targets, the default value is 0:</p> <ul> <li> <p>DynamoDB tables</p> </li> <li> <p>DynamoDB global secondary indexes</p> </li> <li> <p>Amazon Comprehend document classification endpoints</p> </li> <li> <p>Lambda provisioned concurrency</p> </li> <li> <p>Amazon Keyspaces tables</p> </li> </ul>\"\
        },\
        \"DisableScaleIn\":{\
          \"shape\":\"DisableScaleIn\",\
          \"documentation\":\"<p>Indicates whether scale in by the target tracking scaling policy is disabled. If the value is <code>true</code>, scale in is disabled and the target tracking scaling policy won't remove capacity from the scalable target. Otherwise, scale in is enabled and the target tracking scaling policy can remove capacity from the scalable target. The default value is <code>false</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a target tracking scaling policy configuration to use with Application Auto Scaling.</p>\"\
    },\
    \"TimestampType\":{\"type\":\"timestamp\"},\
    \"ValidationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>An exception was thrown for a validation issue. Review the available parameters for the API request.</p>\",\
      \"exception\":true\
    },\
    \"XmlString\":{\
      \"type\":\"string\",\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    }\
  },\
  \"documentation\":\"<p>With Application Auto Scaling, you can configure automatic scaling for the following resources:</p> <ul> <li> <p>Amazon ECS services</p> </li> <li> <p>Amazon EC2 Spot Fleet requests</p> </li> <li> <p>Amazon EMR clusters</p> </li> <li> <p>Amazon AppStream 2.0 fleets</p> </li> <li> <p>Amazon DynamoDB tables and global secondary indexes throughput capacity</p> </li> <li> <p>Amazon Aurora Replicas</p> </li> <li> <p>Amazon SageMaker endpoint variants</p> </li> <li> <p>Custom resources provided by your own applications or services</p> </li> <li> <p>Amazon Comprehend document classification endpoints</p> </li> <li> <p>AWS Lambda function provisioned concurrency</p> </li> <li> <p>Amazon Keyspaces (for Apache Cassandra) tables</p> </li> </ul> <p> <b>API Summary</b> </p> <p>The Application Auto Scaling service API includes three key sets of actions: </p> <ul> <li> <p>Register and manage scalable targets - Register AWS or custom resources as scalable targets (a resource that Application Auto Scaling can scale), set minimum and maximum capacity limits, and retrieve information on existing scalable targets.</p> </li> <li> <p>Configure and manage automatic scaling - Define scaling policies to dynamically scale your resources in response to CloudWatch alarms, schedule one-time or recurring scaling actions, and retrieve your recent scaling activity history.</p> </li> <li> <p>Suspend and resume scaling - Temporarily suspend and later resume automatic scaling by calling the <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/APIReference/API_RegisterScalableTarget.html\\\">RegisterScalableTarget</a> API action for any Application Auto Scaling scalable target. You can suspend and resume (individually or in combination) scale-out activities that are triggered by a scaling policy, scale-in activities that are triggered by a scaling policy, and scheduled scaling.</p> </li> </ul> <p>To learn more about Application Auto Scaling, including information about granting IAM users required permissions for Application Auto Scaling actions, see the <a href=\\\"https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html\\\">Application Auto Scaling User Guide</a>.</p>\"\
}\
";
}

@end
