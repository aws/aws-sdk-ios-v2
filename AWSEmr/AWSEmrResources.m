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

#import "AWSEmrResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSEmrResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSEmrResources

+ (instancetype)sharedInstance {
    static AWSEmrResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSEmrResources new];
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
    \"apiVersion\":\"2009-03-31\",\
    \"endpointPrefix\":\"elasticmapreduce\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceAbbreviation\":\"Amazon EMR\",\
    \"serviceFullName\":\"Amazon Elastic MapReduce\",\
    \"serviceId\":\"EMR\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"ElasticMapReduce\",\
    \"uid\":\"elasticmapreduce-2009-03-31\"\
  },\
  \"operations\":{\
    \"AddInstanceFleet\":{\
      \"name\":\"AddInstanceFleet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AddInstanceFleetInput\"},\
      \"output\":{\"shape\":\"AddInstanceFleetOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Adds an instance fleet to a running cluster.</p> <note> <p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x.</p> </note>\"\
    },\
    \"AddInstanceGroups\":{\
      \"name\":\"AddInstanceGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AddInstanceGroupsInput\"},\
      \"output\":{\"shape\":\"AddInstanceGroupsOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerError\"}\
      ],\
      \"documentation\":\"<p>Adds one or more instance groups to a running cluster.</p>\"\
    },\
    \"AddJobFlowSteps\":{\
      \"name\":\"AddJobFlowSteps\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AddJobFlowStepsInput\"},\
      \"output\":{\"shape\":\"AddJobFlowStepsOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerError\"}\
      ],\
      \"documentation\":\"<p>AddJobFlowSteps adds new steps to a running cluster. A maximum of 256 steps are allowed in each job flow.</p> <p>If your cluster is long-running (such as a Hive data warehouse) or complex, you may require more than 256 steps to process your data. You can bypass the 256-step limitation in various ways, including using SSH to connect to the master node and submitting queries directly to the software running on the master node, such as Hive and Hadoop. For more information on how to do this, see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html\\\">Add More than 256 Steps to a Cluster</a> in the <i>Amazon EMR Management Guide</i>.</p> <p>A step specifies the location of a JAR file stored either on the master node of the cluster or in Amazon S3. Each step is performed by the main function of the main class of the JAR file. The main class can be specified either in the manifest of the JAR or by using the MainFunction parameter of the step.</p> <p>Amazon EMR executes each step in the order listed. For a step to be considered complete, the main function must exit with a zero exit code and all Hadoop jobs started while the step was running must have completed and run successfully.</p> <p>You can only add steps to a cluster that is in one of the following states: STARTING, BOOTSTRAPPING, RUNNING, or WAITING.</p>\"\
    },\
    \"AddTags\":{\
      \"name\":\"AddTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AddTagsInput\"},\
      \"output\":{\"shape\":\"AddTagsOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Adds tags to an Amazon EMR resource. Tags make it easier to associate clusters in various ways, such as grouping clusters to track your Amazon EMR resource allocation costs. For more information, see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html\\\">Tag Clusters</a>. </p>\"\
    },\
    \"CancelSteps\":{\
      \"name\":\"CancelSteps\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelStepsInput\"},\
      \"output\":{\"shape\":\"CancelStepsOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Cancels a pending step or steps in a running cluster. Available only in Amazon EMR versions 4.8.0 and later, excluding version 5.0.0. A maximum of 256 steps are allowed in each CancelSteps request. CancelSteps is idempotent but asynchronous; it does not guarantee a step will be canceled, even if the request is successfully submitted. You can only cancel steps that are in a <code>PENDING</code> state.</p>\"\
    },\
    \"CreateSecurityConfiguration\":{\
      \"name\":\"CreateSecurityConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateSecurityConfigurationInput\"},\
      \"output\":{\"shape\":\"CreateSecurityConfigurationOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Creates a security configuration, which is stored in the service and can be specified when a cluster is created.</p>\"\
    },\
    \"DeleteSecurityConfiguration\":{\
      \"name\":\"DeleteSecurityConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteSecurityConfigurationInput\"},\
      \"output\":{\"shape\":\"DeleteSecurityConfigurationOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Deletes a security configuration.</p>\"\
    },\
    \"DescribeCluster\":{\
      \"name\":\"DescribeCluster\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeClusterInput\"},\
      \"output\":{\"shape\":\"DescribeClusterOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Provides cluster-level details including status, hardware and software configuration, VPC settings, and so on. </p>\"\
    },\
    \"DescribeJobFlows\":{\
      \"name\":\"DescribeJobFlows\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeJobFlowsInput\"},\
      \"output\":{\"shape\":\"DescribeJobFlowsOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerError\"}\
      ],\
      \"documentation\":\"<p>This API is deprecated and will eventually be removed. We recommend you use <a>ListClusters</a>, <a>DescribeCluster</a>, <a>ListSteps</a>, <a>ListInstanceGroups</a> and <a>ListBootstrapActions</a> instead.</p> <p>DescribeJobFlows returns a list of job flows that match all of the supplied parameters. The parameters can include a list of job flow IDs, job flow states, and restrictions on job flow creation date and time.</p> <p>Regardless of supplied parameters, only job flows created within the last two months are returned.</p> <p>If no parameters are supplied, then job flows matching either of the following criteria are returned:</p> <ul> <li> <p>Job flows created and completed in the last two weeks</p> </li> <li> <p> Job flows created within the last two months that are in one of the following states: <code>RUNNING</code>, <code>WAITING</code>, <code>SHUTTING_DOWN</code>, <code>STARTING</code> </p> </li> </ul> <p>Amazon EMR can return a maximum of 512 job flow descriptions.</p>\",\
      \"deprecated\":true\
    },\
    \"DescribeSecurityConfiguration\":{\
      \"name\":\"DescribeSecurityConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSecurityConfigurationInput\"},\
      \"output\":{\"shape\":\"DescribeSecurityConfigurationOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Provides the details of a security configuration by returning the configuration JSON.</p>\"\
    },\
    \"DescribeStep\":{\
      \"name\":\"DescribeStep\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeStepInput\"},\
      \"output\":{\"shape\":\"DescribeStepOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Provides more detail about the cluster step.</p>\"\
    },\
    \"GetBlockPublicAccessConfiguration\":{\
      \"name\":\"GetBlockPublicAccessConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetBlockPublicAccessConfigurationInput\"},\
      \"output\":{\"shape\":\"GetBlockPublicAccessConfigurationOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Returns the Amazon EMR block public access configuration for your AWS account in the current Region. For more information see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html\\\">Configure Block Public Access for Amazon EMR</a> in the <i>Amazon EMR Management Guide</i>.</p>\"\
    },\
    \"GetManagedScalingPolicy\":{\
      \"name\":\"GetManagedScalingPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetManagedScalingPolicyInput\"},\
      \"output\":{\"shape\":\"GetManagedScalingPolicyOutput\"},\
      \"documentation\":\"<p> Fetches the attached managed scaling policy for an Amazon EMR cluster. </p>\"\
    },\
    \"ListBootstrapActions\":{\
      \"name\":\"ListBootstrapActions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListBootstrapActionsInput\"},\
      \"output\":{\"shape\":\"ListBootstrapActionsOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the bootstrap actions associated with a cluster.</p>\"\
    },\
    \"ListClusters\":{\
      \"name\":\"ListClusters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListClustersInput\"},\
      \"output\":{\"shape\":\"ListClustersOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Provides the status of all clusters visible to this AWS account. Allows you to filter the list of clusters based on certain criteria; for example, filtering by cluster creation date and time or by status. This call returns a maximum of 50 clusters per call, but returns a marker to track the paging of the cluster list across multiple ListClusters calls.</p>\"\
    },\
    \"ListInstanceFleets\":{\
      \"name\":\"ListInstanceFleets\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListInstanceFleetsInput\"},\
      \"output\":{\"shape\":\"ListInstanceFleetsOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Lists all available details about the instance fleets in a cluster.</p> <note> <p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p> </note>\"\
    },\
    \"ListInstanceGroups\":{\
      \"name\":\"ListInstanceGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListInstanceGroupsInput\"},\
      \"output\":{\"shape\":\"ListInstanceGroupsOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Provides all available details about the instance groups in a cluster.</p>\"\
    },\
    \"ListInstances\":{\
      \"name\":\"ListInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListInstancesInput\"},\
      \"output\":{\"shape\":\"ListInstancesOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Provides information for all active EC2 instances and EC2 instances terminated in the last 30 days, up to a maximum of 2,000. EC2 instances in any of the following states are considered active: AWAITING_FULFILLMENT, PROVISIONING, BOOTSTRAPPING, RUNNING.</p>\"\
    },\
    \"ListSecurityConfigurations\":{\
      \"name\":\"ListSecurityConfigurations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListSecurityConfigurationsInput\"},\
      \"output\":{\"shape\":\"ListSecurityConfigurationsOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Lists all the security configurations visible to this account, providing their creation dates and times, and their names. This call returns a maximum of 50 clusters per call, but returns a marker to track the paging of the cluster list across multiple ListSecurityConfigurations calls.</p>\"\
    },\
    \"ListSteps\":{\
      \"name\":\"ListSteps\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListStepsInput\"},\
      \"output\":{\"shape\":\"ListStepsOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Provides a list of steps for the cluster in reverse order unless you specify <code>stepIds</code> with the request of filter by <code>StepStates</code>. You can specify a maximum of ten <code>stepIDs</code>.</p>\"\
    },\
    \"ModifyCluster\":{\
      \"name\":\"ModifyCluster\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyClusterInput\"},\
      \"output\":{\"shape\":\"ModifyClusterOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Modifies the number of steps that can be executed concurrently for the cluster specified using ClusterID.</p>\"\
    },\
    \"ModifyInstanceFleet\":{\
      \"name\":\"ModifyInstanceFleet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyInstanceFleetInput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Modifies the target On-Demand and target Spot capacities for the instance fleet with the specified InstanceFleetID within the cluster specified using ClusterID. The call either succeeds or fails atomically.</p> <note> <p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p> </note>\"\
    },\
    \"ModifyInstanceGroups\":{\
      \"name\":\"ModifyInstanceGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyInstanceGroupsInput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerError\"}\
      ],\
      \"documentation\":\"<p>ModifyInstanceGroups modifies the number of nodes and configuration settings of an instance group. The input parameters include the new target instance count for the group and the instance group ID. The call will either succeed or fail atomically.</p>\"\
    },\
    \"PutAutoScalingPolicy\":{\
      \"name\":\"PutAutoScalingPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutAutoScalingPolicyInput\"},\
      \"output\":{\"shape\":\"PutAutoScalingPolicyOutput\"},\
      \"documentation\":\"<p>Creates or updates an automatic scaling policy for a core instance group or task instance group in an Amazon EMR cluster. The automatic scaling policy defines how an instance group dynamically adds and terminates EC2 instances in response to the value of a CloudWatch metric.</p>\"\
    },\
    \"PutBlockPublicAccessConfiguration\":{\
      \"name\":\"PutBlockPublicAccessConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutBlockPublicAccessConfigurationInput\"},\
      \"output\":{\"shape\":\"PutBlockPublicAccessConfigurationOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates an Amazon EMR block public access configuration for your AWS account in the current Region. For more information see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html\\\">Configure Block Public Access for Amazon EMR</a> in the <i>Amazon EMR Management Guide</i>.</p>\"\
    },\
    \"PutManagedScalingPolicy\":{\
      \"name\":\"PutManagedScalingPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutManagedScalingPolicyInput\"},\
      \"output\":{\"shape\":\"PutManagedScalingPolicyOutput\"},\
      \"documentation\":\"<p> Creates or updates a managed scaling policy for an Amazon EMR cluster. The managed scaling policy defines the limits for resources, such as EC2 instances that can be added or terminated from a cluster. The policy only applies to the core and task nodes. The master node cannot be scaled after initial configuration. </p>\"\
    },\
    \"RemoveAutoScalingPolicy\":{\
      \"name\":\"RemoveAutoScalingPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RemoveAutoScalingPolicyInput\"},\
      \"output\":{\"shape\":\"RemoveAutoScalingPolicyOutput\"},\
      \"documentation\":\"<p>Removes an automatic scaling policy from a specified instance group within an EMR cluster.</p>\"\
    },\
    \"RemoveManagedScalingPolicy\":{\
      \"name\":\"RemoveManagedScalingPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RemoveManagedScalingPolicyInput\"},\
      \"output\":{\"shape\":\"RemoveManagedScalingPolicyOutput\"},\
      \"documentation\":\"<p> Removes a managed scaling policy from a specified EMR cluster. </p>\"\
    },\
    \"RemoveTags\":{\
      \"name\":\"RemoveTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RemoveTagsInput\"},\
      \"output\":{\"shape\":\"RemoveTagsOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Removes tags from an Amazon EMR resource. Tags make it easier to associate clusters in various ways, such as grouping clusters to track your Amazon EMR resource allocation costs. For more information, see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html\\\">Tag Clusters</a>. </p> <p>The following example removes the stack tag with value Prod from a cluster:</p>\"\
    },\
    \"RunJobFlow\":{\
      \"name\":\"RunJobFlow\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RunJobFlowInput\"},\
      \"output\":{\"shape\":\"RunJobFlowOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerError\"}\
      ],\
      \"documentation\":\"<p>RunJobFlow creates and starts running a new cluster (job flow). The cluster runs the steps specified. After the steps complete, the cluster stops and the HDFS partition is lost. To prevent loss of data, configure the last step of the job flow to store results in Amazon S3. If the <a>JobFlowInstancesConfig</a> <code>KeepJobFlowAliveWhenNoSteps</code> parameter is set to <code>TRUE</code>, the cluster transitions to the WAITING state rather than shutting down after the steps have completed. </p> <p>For additional protection, you can set the <a>JobFlowInstancesConfig</a> <code>TerminationProtected</code> parameter to <code>TRUE</code> to lock the cluster and prevent it from being terminated by API call, user intervention, or in the event of a job flow error.</p> <p>A maximum of 256 steps are allowed in each job flow.</p> <p>If your cluster is long-running (such as a Hive data warehouse) or complex, you may require more than 256 steps to process your data. You can bypass the 256-step limitation in various ways, including using the SSH shell to connect to the master node and submitting queries directly to the software running on the master node, such as Hive and Hadoop. For more information on how to do this, see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html\\\">Add More than 256 Steps to a Cluster</a> in the <i>Amazon EMR Management Guide</i>.</p> <p>For long running clusters, we recommend that you periodically store your results.</p> <note> <p>The instance fleets configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions. The RunJobFlow request can contain InstanceFleets parameters or InstanceGroups parameters, but not both.</p> </note>\"\
    },\
    \"SetTerminationProtection\":{\
      \"name\":\"SetTerminationProtection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetTerminationProtectionInput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerError\"}\
      ],\
      \"documentation\":\"<p>SetTerminationProtection locks a cluster (job flow) so the EC2 instances in the cluster cannot be terminated by user intervention, an API call, or in the event of a job-flow error. The cluster still terminates upon successful completion of the job flow. Calling <code>SetTerminationProtection</code> on a cluster is similar to calling the Amazon EC2 <code>DisableAPITermination</code> API on all EC2 instances in a cluster.</p> <p> <code>SetTerminationProtection</code> is used to prevent accidental termination of a cluster and to ensure that in the event of an error, the instances persist so that you can recover any data stored in their ephemeral instance storage.</p> <p> To terminate a cluster that has been locked by setting <code>SetTerminationProtection</code> to <code>true</code>, you must first unlock the job flow by a subsequent call to <code>SetTerminationProtection</code> in which you set the value to <code>false</code>. </p> <p> For more information, see<a href=\\\"https://docs.aws.amazon.com/emr/latest/ManagementGuide/UsingEMR_TerminationProtection.html\\\">Managing Cluster Termination</a> in the <i>Amazon EMR Management Guide</i>. </p>\"\
    },\
    \"SetVisibleToAllUsers\":{\
      \"name\":\"SetVisibleToAllUsers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetVisibleToAllUsersInput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerError\"}\
      ],\
      \"documentation\":\"<p>Sets the <a>Cluster$VisibleToAllUsers</a> value, which determines whether the cluster is visible to all IAM users of the AWS account associated with the cluster. Only the IAM user who created the cluster or the AWS account root user can call this action. The default value, <code>true</code>, indicates that all IAM users in the AWS account can perform cluster actions if they have the proper IAM policy permissions. If set to <code>false</code>, only the IAM user that created the cluster can perform actions. This action works on running clusters. You can override the default <code>true</code> setting when you create a cluster by using the <code>VisibleToAllUsers</code> parameter with <code>RunJobFlow</code>.</p>\"\
    },\
    \"TerminateJobFlows\":{\
      \"name\":\"TerminateJobFlows\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TerminateJobFlowsInput\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerError\"}\
      ],\
      \"documentation\":\"<p>TerminateJobFlows shuts a list of clusters (job flows) down. When a job flow is shut down, any step not yet completed is canceled and the EC2 instances on which the cluster is running are stopped. Any log files not already saved are uploaded to Amazon S3 if a LogUri was specified when the cluster was created.</p> <p>The maximum number of clusters allowed is 10. The call to <code>TerminateJobFlows</code> is asynchronous. Depending on the configuration of the cluster, it may take up to 1-5 minutes for the cluster to completely terminate and release allocated resources, such as Amazon EC2 instances.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"ActionOnFailure\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TERMINATE_JOB_FLOW\",\
        \"TERMINATE_CLUSTER\",\
        \"CANCEL_AND_WAIT\",\
        \"CONTINUE\"\
      ]\
    },\
    \"AddInstanceFleetInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClusterId\",\
        \"InstanceFleet\"\
      ],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The unique identifier of the cluster.</p>\"\
        },\
        \"InstanceFleet\":{\
          \"shape\":\"InstanceFleetConfig\",\
          \"documentation\":\"<p>Specifies the configuration of the instance fleet.</p>\"\
        }\
      }\
    },\
    \"AddInstanceFleetOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The unique identifier of the cluster.</p>\"\
        },\
        \"InstanceFleetId\":{\
          \"shape\":\"InstanceFleetId\",\
          \"documentation\":\"<p>The unique identifier of the instance fleet.</p>\"\
        },\
        \"ClusterArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name of the cluster.</p>\"\
        }\
      }\
    },\
    \"AddInstanceGroupsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceGroups\",\
        \"JobFlowId\"\
      ],\
      \"members\":{\
        \"InstanceGroups\":{\
          \"shape\":\"InstanceGroupConfigList\",\
          \"documentation\":\"<p>Instance groups to add.</p>\"\
        },\
        \"JobFlowId\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>Job flow in which to add the instance groups.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input to an AddInstanceGroups call.</p>\"\
    },\
    \"AddInstanceGroupsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobFlowId\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The job flow ID in which the instance groups are added.</p>\"\
        },\
        \"InstanceGroupIds\":{\
          \"shape\":\"InstanceGroupIdsList\",\
          \"documentation\":\"<p>Instance group IDs of the newly created instance groups.</p>\"\
        },\
        \"ClusterArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name of the cluster.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Output from an AddInstanceGroups call.</p>\"\
    },\
    \"AddJobFlowStepsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"JobFlowId\",\
        \"Steps\"\
      ],\
      \"members\":{\
        \"JobFlowId\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>A string that uniquely identifies the job flow. This identifier is returned by <a>RunJobFlow</a> and can also be obtained from <a>ListClusters</a>. </p>\"\
        },\
        \"Steps\":{\
          \"shape\":\"StepConfigList\",\
          \"documentation\":\"<p> A list of <a>StepConfig</a> to be executed by the job flow. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The input argument to the <a>AddJobFlowSteps</a> operation. </p>\"\
    },\
    \"AddJobFlowStepsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StepIds\":{\
          \"shape\":\"StepIdsList\",\
          \"documentation\":\"<p>The identifiers of the list of steps added to the job flow.</p>\"\
        }\
      },\
      \"documentation\":\"<p> The output for the <a>AddJobFlowSteps</a> operation. </p>\"\
    },\
    \"AddTagsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceId\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The Amazon EMR resource identifier to which tags will be added. This value must be a cluster identifier.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of tags to associate with a cluster and propagate to EC2 instances. Tags are user-defined key/value pairs that consist of a required key string with a maximum of 128 characters, and an optional value string with a maximum of 256 characters.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This input identifies a cluster and a list of tags to attach.</p>\"\
    },\
    \"AddTagsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>This output indicates the result of adding tags to a resource.</p>\"\
    },\
    \"AdjustmentType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CHANGE_IN_CAPACITY\",\
        \"PERCENT_CHANGE_IN_CAPACITY\",\
        \"EXACT_CAPACITY\"\
      ]\
    },\
    \"Application\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the application.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The version of the application.</p>\"\
        },\
        \"Args\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>Arguments for Amazon EMR to pass to the application.</p>\"\
        },\
        \"AdditionalInfo\":{\
          \"shape\":\"StringMap\",\
          \"documentation\":\"<p>This option is for advanced users only. This is meta information about third-party applications that third-party vendors use for testing purposes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>With Amazon EMR release version 4.0 and later, the only accepted parameter is the application name. To pass arguments to applications, you use configuration classifications specified using configuration JSON objects. For more information, see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-configure-apps.html\\\">Configuring Applications</a>.</p> <p>With earlier Amazon EMR releases, the application is any Amazon or third-party software that you can add to the cluster. This structure contains a list of strings that indicates the software to use with the cluster and accepts a user argument list. Amazon EMR accepts and forwards the argument list to the corresponding installation script as bootstrap action argument.</p>\"\
    },\
    \"ApplicationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Application\"}\
    },\
    \"ArnType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20\
    },\
    \"AutoScalingPolicy\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Constraints\",\
        \"Rules\"\
      ],\
      \"members\":{\
        \"Constraints\":{\
          \"shape\":\"ScalingConstraints\",\
          \"documentation\":\"<p>The upper and lower EC2 instance limits for an automatic scaling policy. Automatic scaling activity will not cause an instance group to grow above or below these limits.</p>\"\
        },\
        \"Rules\":{\
          \"shape\":\"ScalingRuleList\",\
          \"documentation\":\"<p>The scale-in and scale-out rules that comprise the automatic scaling policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An automatic scaling policy for a core instance group or task instance group in an Amazon EMR cluster. An automatic scaling policy defines how an instance group dynamically adds and terminates EC2 instances in response to the value of a CloudWatch metric. See <a>PutAutoScalingPolicy</a>.</p>\"\
    },\
    \"AutoScalingPolicyDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"AutoScalingPolicyStatus\",\
          \"documentation\":\"<p>The status of an automatic scaling policy. </p>\"\
        },\
        \"Constraints\":{\
          \"shape\":\"ScalingConstraints\",\
          \"documentation\":\"<p>The upper and lower EC2 instance limits for an automatic scaling policy. Automatic scaling activity will not cause an instance group to grow above or below these limits.</p>\"\
        },\
        \"Rules\":{\
          \"shape\":\"ScalingRuleList\",\
          \"documentation\":\"<p>The scale-in and scale-out rules that comprise the automatic scaling policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An automatic scaling policy for a core instance group or task instance group in an Amazon EMR cluster. The automatic scaling policy defines how an instance group dynamically adds and terminates EC2 instances in response to the value of a CloudWatch metric. See <a>PutAutoScalingPolicy</a>.</p>\"\
    },\
    \"AutoScalingPolicyState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"ATTACHING\",\
        \"ATTACHED\",\
        \"DETACHING\",\
        \"DETACHED\",\
        \"FAILED\"\
      ]\
    },\
    \"AutoScalingPolicyStateChangeReason\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"AutoScalingPolicyStateChangeReasonCode\",\
          \"documentation\":\"<p>The code indicating the reason for the change in status.<code>USER_REQUEST</code> indicates that the scaling policy status was changed by a user. <code>PROVISION_FAILURE</code> indicates that the status change was because the policy failed to provision. <code>CLEANUP_FAILURE</code> indicates an error.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A friendly, more verbose message that accompanies an automatic scaling policy state change.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The reason for an <a>AutoScalingPolicyStatus</a> change.</p>\"\
    },\
    \"AutoScalingPolicyStateChangeReasonCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"USER_REQUEST\",\
        \"PROVISION_FAILURE\",\
        \"CLEANUP_FAILURE\"\
      ]\
    },\
    \"AutoScalingPolicyStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"State\":{\
          \"shape\":\"AutoScalingPolicyState\",\
          \"documentation\":\"<p>Indicates the status of the automatic scaling policy.</p>\"\
        },\
        \"StateChangeReason\":{\
          \"shape\":\"AutoScalingPolicyStateChangeReason\",\
          \"documentation\":\"<p>The reason for a change in status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The status of an automatic scaling policy. </p>\"\
    },\
    \"BlockPublicAccessConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"BlockPublicSecurityGroupRules\"],\
      \"members\":{\
        \"BlockPublicSecurityGroupRules\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether EMR block public access is enabled (<code>true</code>) or disabled (<code>false</code>). By default, the value is <code>false</code> for accounts that have created EMR clusters before July 2019. For accounts created after this, the default is <code>true</code>.</p>\"\
        },\
        \"PermittedPublicSecurityGroupRuleRanges\":{\
          \"shape\":\"PortRanges\",\
          \"documentation\":\"<p>Specifies ports and port ranges that are permitted to have security group rules that allow inbound traffic from all public sources. For example, if Port 23 (Telnet) is specified for <code>PermittedPublicSecurityGroupRuleRanges</code>, Amazon EMR allows cluster creation if a security group associated with the cluster has a rule that allows inbound traffic on Port 23 from IPv4 0.0.0.0/0 or IPv6 port ::/0 as the source.</p> <p>By default, Port 22, which is used for SSH access to the cluster EC2 instances, is in the list of <code>PermittedPublicSecurityGroupRuleRanges</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A configuration for Amazon EMR block public access. When <code>BlockPublicSecurityGroupRules</code> is set to <code>true</code>, Amazon EMR prevents cluster creation if one of the cluster's security groups has a rule that allows inbound traffic from 0.0.0.0/0 or ::/0 on a port, unless the port is specified as an exception using <code>PermittedPublicSecurityGroupRuleRanges</code>.</p>\"\
    },\
    \"BlockPublicAccessConfigurationMetadata\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreationDateTime\",\
        \"CreatedByArn\"\
      ],\
      \"members\":{\
        \"CreationDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date and time that the configuration was created.</p>\"\
        },\
        \"CreatedByArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name that created or last modified the configuration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Properties that describe the AWS principal that created the <code>BlockPublicAccessConfiguration</code> using the <code>PutBlockPublicAccessConfiguration</code> action as well as the date and time that the configuration was created. Each time a configuration for block public access is updated, Amazon EMR updates this metadata.</p>\"\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"BooleanObject\":{\"type\":\"boolean\"},\
    \"BootstrapActionConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"ScriptBootstrapAction\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The name of the bootstrap action.</p>\"\
        },\
        \"ScriptBootstrapAction\":{\
          \"shape\":\"ScriptBootstrapActionConfig\",\
          \"documentation\":\"<p>The script run by the bootstrap action.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration of a bootstrap action.</p>\"\
    },\
    \"BootstrapActionConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BootstrapActionConfig\"}\
    },\
    \"BootstrapActionDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BootstrapActionConfig\":{\
          \"shape\":\"BootstrapActionConfig\",\
          \"documentation\":\"<p>A description of the bootstrap action.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Reports the configuration of a bootstrap action in a cluster (job flow).</p>\"\
    },\
    \"BootstrapActionDetailList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BootstrapActionDetail\"}\
    },\
    \"CancelStepsInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StepId\":{\
          \"shape\":\"StepId\",\
          \"documentation\":\"<p>The encrypted StepId of a step.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"CancelStepsRequestStatus\",\
          \"documentation\":\"<p>The status of a CancelSteps Request. The value may be SUBMITTED or FAILED.</p>\"\
        },\
        \"Reason\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The reason for the failure if the CancelSteps request fails.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specification of the status of a CancelSteps request. Available only in Amazon EMR version 4.8.0 and later, excluding version 5.0.0.</p>\"\
    },\
    \"CancelStepsInfoList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CancelStepsInfo\"}\
    },\
    \"CancelStepsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClusterId\",\
        \"StepIds\"\
      ],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The <code>ClusterID</code> for which specified steps will be canceled. Use <a>RunJobFlow</a> and <a>ListClusters</a> to get ClusterIDs. </p>\"\
        },\
        \"StepIds\":{\
          \"shape\":\"StepIdsList\",\
          \"documentation\":\"<p>The list of <code>StepIDs</code> to cancel. Use <a>ListSteps</a> to get steps and their states for the specified cluster.</p>\"\
        },\
        \"StepCancellationOption\":{\
          \"shape\":\"StepCancellationOption\",\
          \"documentation\":\"<p>The option to choose for cancelling <code>RUNNING</code> steps. By default, the value is <code>SEND_INTERRUPT</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input argument to the <a>CancelSteps</a> operation.</p>\"\
    },\
    \"CancelStepsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CancelStepsInfoList\":{\
          \"shape\":\"CancelStepsInfoList\",\
          \"documentation\":\"<p>A list of <a>CancelStepsInfo</a>, which shows the status of specified cancel requests for each <code>StepID</code> specified.</p>\"\
        }\
      },\
      \"documentation\":\"<p> The output for the <a>CancelSteps</a> operation. </p>\"\
    },\
    \"CancelStepsRequestStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SUBMITTED\",\
        \"FAILED\"\
      ]\
    },\
    \"CloudWatchAlarmDefinition\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ComparisonOperator\",\
        \"MetricName\",\
        \"Period\",\
        \"Threshold\"\
      ],\
      \"members\":{\
        \"ComparisonOperator\":{\
          \"shape\":\"ComparisonOperator\",\
          \"documentation\":\"<p>Determines how the metric specified by <code>MetricName</code> is compared to the value specified by <code>Threshold</code>.</p>\"\
        },\
        \"EvaluationPeriods\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of periods, in five-minute increments, during which the alarm condition must exist before the alarm triggers automatic scaling activity. The default value is <code>1</code>.</p>\"\
        },\
        \"MetricName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the CloudWatch metric that is watched to determine an alarm condition.</p>\"\
        },\
        \"Namespace\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The namespace for the CloudWatch metric. The default is <code>AWS/ElasticMapReduce</code>.</p>\"\
        },\
        \"Period\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The period, in seconds, over which the statistic is applied. EMR CloudWatch metrics are emitted every five minutes (300 seconds), so if an EMR CloudWatch metric is specified, specify <code>300</code>.</p>\"\
        },\
        \"Statistic\":{\
          \"shape\":\"Statistic\",\
          \"documentation\":\"<p>The statistic to apply to the metric associated with the alarm. The default is <code>AVERAGE</code>.</p>\"\
        },\
        \"Threshold\":{\
          \"shape\":\"NonNegativeDouble\",\
          \"documentation\":\"<p>The value against which the specified statistic is compared.</p>\"\
        },\
        \"Unit\":{\
          \"shape\":\"Unit\",\
          \"documentation\":\"<p>The unit of measure associated with the CloudWatch metric being watched. The value specified for <code>Unit</code> must correspond to the units specified in the CloudWatch metric.</p>\"\
        },\
        \"Dimensions\":{\
          \"shape\":\"MetricDimensionList\",\
          \"documentation\":\"<p>A CloudWatch metric dimension.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The definition of a CloudWatch metric alarm, which determines when an automatic scaling activity is triggered. When the defined alarm conditions are satisfied, scaling activity begins.</p>\"\
    },\
    \"Cluster\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>The unique identifier for the cluster.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cluster.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ClusterStatus\",\
          \"documentation\":\"<p>The current status details about the cluster.</p>\"\
        },\
        \"Ec2InstanceAttributes\":{\
          \"shape\":\"Ec2InstanceAttributes\",\
          \"documentation\":\"<p>Provides information about the EC2 instances in a cluster grouped by category. For example, key name, subnet ID, IAM instance profile, and so on.</p>\"\
        },\
        \"InstanceCollectionType\":{\
          \"shape\":\"InstanceCollectionType\",\
          \"documentation\":\"<note> <p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p> </note> <p>The instance group configuration of the cluster. A value of <code>INSTANCE_GROUP</code> indicates a uniform instance group configuration. A value of <code>INSTANCE_FLEET</code> indicates an instance fleets configuration.</p>\"\
        },\
        \"LogUri\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The path to the Amazon S3 location where logs for this cluster are stored.</p>\"\
        },\
        \"LogEncryptionKmsKeyId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p> The AWS KMS customer master key (CMK) used for encrypting log files. This attribute is only available with EMR version 5.30.0 and later, excluding EMR 6.0.0. </p>\"\
        },\
        \"RequestedAmiVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AMI version requested for this cluster.</p>\"\
        },\
        \"RunningAmiVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AMI version running on this cluster.</p>\"\
        },\
        \"ReleaseLabel\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon EMR release label, which determines the version of open-source application packages installed on the cluster. Release labels are in the form <code>emr-x.x.x</code>, where x.x.x is an Amazon EMR release version such as <code>emr-5.14.0</code>. For more information about Amazon EMR release versions and included application versions and features, see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ReleaseGuide/\\\">https://docs.aws.amazon.com/emr/latest/ReleaseGuide/</a>. The release label applies only to Amazon EMR releases version 4.0 and later. Earlier versions use <code>AmiVersion</code>.</p>\"\
        },\
        \"AutoTerminate\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether the cluster should terminate after completing all steps.</p>\"\
        },\
        \"TerminationProtected\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether Amazon EMR will lock the cluster to prevent the EC2 instances from being terminated by an API call or user intervention, or in the event of a cluster error.</p>\"\
        },\
        \"VisibleToAllUsers\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the cluster is visible to all IAM users of the AWS account associated with the cluster. The default value, <code>true</code>, indicates that all IAM users in the AWS account can perform cluster actions if they have the proper IAM policy permissions. If this value is <code>false</code>, only the IAM user that created the cluster can perform actions. This value can be changed on a running cluster by using the <a>SetVisibleToAllUsers</a> action. You can override the default value of <code>true</code> when you create a cluster by using the <code>VisibleToAllUsers</code> parameter of the <code>RunJobFlow</code> action.</p>\"\
        },\
        \"Applications\":{\
          \"shape\":\"ApplicationList\",\
          \"documentation\":\"<p>The applications installed on this cluster.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of tags associated with a cluster.</p>\"\
        },\
        \"ServiceRole\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The IAM role that will be assumed by the Amazon EMR service to access AWS resources on your behalf.</p>\"\
        },\
        \"NormalizedInstanceHours\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>An approximation of the cost of the cluster, represented in m1.small/hours. This value is incremented one time for every hour an m1.small instance runs. Larger instances are weighted more, so an EC2 instance that is roughly four times more expensive would result in the normalized instance hours being incremented by four. This result is only an approximation and does not reflect the actual billing rate.</p>\"\
        },\
        \"MasterPublicDnsName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The DNS name of the master node. If the cluster is on a private subnet, this is the private DNS name. On a public subnet, this is the public DNS name.</p>\"\
        },\
        \"Configurations\":{\
          \"shape\":\"ConfigurationList\",\
          \"documentation\":\"<p>Applies only to Amazon EMR releases 4.x and later. The list of Configurations supplied to the EMR cluster.</p>\"\
        },\
        \"SecurityConfiguration\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The name of the security configuration applied to the cluster.</p>\"\
        },\
        \"AutoScalingRole\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>An IAM role for automatic scaling policies. The default role is <code>EMR_AutoScaling_DefaultRole</code>. The IAM role provides permissions that the automatic scaling feature requires to launch and terminate EC2 instances in an instance group.</p>\"\
        },\
        \"ScaleDownBehavior\":{\
          \"shape\":\"ScaleDownBehavior\",\
          \"documentation\":\"<p>The way that individual Amazon EC2 instances terminate when an automatic scale-in activity occurs or an instance group is resized. <code>TERMINATE_AT_INSTANCE_HOUR</code> indicates that Amazon EMR terminates nodes at the instance-hour boundary, regardless of when the request to terminate the instance was submitted. This option is only available with Amazon EMR 5.1.0 and later and is the default for clusters created using that version. <code>TERMINATE_AT_TASK_COMPLETION</code> indicates that Amazon EMR blacklists and drains tasks from nodes before terminating the Amazon EC2 instances, regardless of the instance-hour boundary. With either behavior, Amazon EMR removes the least active nodes first and blocks instance termination if it could lead to HDFS corruption. <code>TERMINATE_AT_TASK_COMPLETION</code> is available only in Amazon EMR version 4.1.0 and later, and is the default for versions of Amazon EMR earlier than 5.1.0.</p>\"\
        },\
        \"CustomAmiId\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>Available only in Amazon EMR version 5.7.0 and later. The ID of a custom Amazon EBS-backed Linux AMI if the cluster uses a custom AMI.</p>\"\
        },\
        \"EbsRootVolumeSize\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The size, in GiB, of the EBS root device volume of the Linux AMI that is used for each EC2 instance. Available in Amazon EMR version 4.x and later.</p>\"\
        },\
        \"RepoUpgradeOnBoot\":{\
          \"shape\":\"RepoUpgradeOnBoot\",\
          \"documentation\":\"<p>Applies only when <code>CustomAmiID</code> is used. Specifies the type of updates that are applied from the Amazon Linux AMI package repositories when an instance boots using the AMI.</p>\"\
        },\
        \"KerberosAttributes\":{\
          \"shape\":\"KerberosAttributes\",\
          \"documentation\":\"<p>Attributes for Kerberos configuration when Kerberos authentication is enabled using a security configuration. For more information see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html\\\">Use Kerberos Authentication</a> in the <i>EMR Management Guide</i>.</p>\"\
        },\
        \"ClusterArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name of the cluster.</p>\"\
        },\
        \"OutpostArn\":{\
          \"shape\":\"OptionalArnType\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the Outpost where the cluster is launched. </p>\"\
        },\
        \"StepConcurrencyLevel\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Specifies the number of steps that can be executed concurrently.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The detailed description of the cluster.</p>\"\
    },\
    \"ClusterId\":{\"type\":\"string\"},\
    \"ClusterState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STARTING\",\
        \"BOOTSTRAPPING\",\
        \"RUNNING\",\
        \"WAITING\",\
        \"TERMINATING\",\
        \"TERMINATED\",\
        \"TERMINATED_WITH_ERRORS\"\
      ]\
    },\
    \"ClusterStateChangeReason\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"ClusterStateChangeReasonCode\",\
          \"documentation\":\"<p>The programmatic code for the state change reason.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The descriptive message for the state change reason.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The reason that the cluster changed to its current state.</p>\"\
    },\
    \"ClusterStateChangeReasonCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INTERNAL_ERROR\",\
        \"VALIDATION_ERROR\",\
        \"INSTANCE_FAILURE\",\
        \"INSTANCE_FLEET_TIMEOUT\",\
        \"BOOTSTRAP_FAILURE\",\
        \"USER_REQUEST\",\
        \"STEP_FAILURE\",\
        \"ALL_STEPS_COMPLETED\"\
      ]\
    },\
    \"ClusterStateList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ClusterState\"}\
    },\
    \"ClusterStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"State\":{\
          \"shape\":\"ClusterState\",\
          \"documentation\":\"<p>The current state of the cluster.</p>\"\
        },\
        \"StateChangeReason\":{\
          \"shape\":\"ClusterStateChangeReason\",\
          \"documentation\":\"<p>The reason for the cluster status change.</p>\"\
        },\
        \"Timeline\":{\
          \"shape\":\"ClusterTimeline\",\
          \"documentation\":\"<p>A timeline that represents the status of a cluster over the lifetime of the cluster.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The detailed status of the cluster.</p>\"\
    },\
    \"ClusterSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>The unique identifier for the cluster.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cluster.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ClusterStatus\",\
          \"documentation\":\"<p>The details about the current status of the cluster.</p>\"\
        },\
        \"NormalizedInstanceHours\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>An approximation of the cost of the cluster, represented in m1.small/hours. This value is incremented one time for every hour an m1.small instance runs. Larger instances are weighted more, so an EC2 instance that is roughly four times more expensive would result in the normalized instance hours being incremented by four. This result is only an approximation and does not reflect the actual billing rate.</p>\"\
        },\
        \"ClusterArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name of the cluster.</p>\"\
        },\
        \"OutpostArn\":{\
          \"shape\":\"OptionalArnType\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the Outpost where the cluster is launched. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The summary description of the cluster.</p>\"\
    },\
    \"ClusterSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ClusterSummary\"}\
    },\
    \"ClusterTimeline\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreationDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The creation date and time of the cluster.</p>\"\
        },\
        \"ReadyDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date and time when the cluster was ready to execute steps.</p>\"\
        },\
        \"EndDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date and time when the cluster was terminated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the timeline of the cluster's lifecycle.</p>\"\
    },\
    \"Command\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the command.</p>\"\
        },\
        \"ScriptPath\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon S3 location of the command script.</p>\"\
        },\
        \"Args\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>Arguments for Amazon EMR to pass to the command for execution.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An entity describing an executable that runs on a cluster.</p>\"\
    },\
    \"CommandList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Command\"}\
    },\
    \"ComparisonOperator\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"GREATER_THAN_OR_EQUAL\",\
        \"GREATER_THAN\",\
        \"LESS_THAN\",\
        \"LESS_THAN_OR_EQUAL\"\
      ]\
    },\
    \"ComputeLimits\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UnitType\",\
        \"MinimumCapacityUnits\",\
        \"MaximumCapacityUnits\"\
      ],\
      \"members\":{\
        \"UnitType\":{\
          \"shape\":\"ComputeLimitsUnitType\",\
          \"documentation\":\"<p> The unit type used for specifying a managed scaling policy. </p>\"\
        },\
        \"MinimumCapacityUnits\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p> The lower boundary of EC2 units. It is measured through VCPU cores or instances for instance groups and measured through units for instance fleets. Managed scaling activities are not allowed beyond this boundary. The limit only applies to the core and task nodes. The master node cannot be scaled after initial configuration. </p>\"\
        },\
        \"MaximumCapacityUnits\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p> The upper boundary of EC2 units. It is measured through VCPU cores or instances for instance groups and measured through units for instance fleets. Managed scaling activities are not allowed beyond this boundary. The limit only applies to the core and task nodes. The master node cannot be scaled after initial configuration. </p>\"\
        },\
        \"MaximumOnDemandCapacityUnits\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p> The upper boundary of on-demand EC2 units. It is measured through VCPU cores or instances for instance groups and measured through units for instance fleets. The on-demand units are not allowed to scale beyond this boundary. The limit only applies to the core and task nodes. The master node cannot be scaled after initial configuration. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The EC2 unit limits for a managed scaling policy. The managed scaling activity of a cluster can not be above or below these limits. The limit only applies to the core and task nodes. The master node cannot be scaled after initial configuration. </p>\"\
    },\
    \"ComputeLimitsUnitType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"InstanceFleetUnits\",\
        \"Instances\",\
        \"VCPU\"\
      ]\
    },\
    \"Configuration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Classification\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The classification within a configuration.</p>\"\
        },\
        \"Configurations\":{\
          \"shape\":\"ConfigurationList\",\
          \"documentation\":\"<p>A list of additional configurations to apply within a configuration object.</p>\"\
        },\
        \"Properties\":{\
          \"shape\":\"StringMap\",\
          \"documentation\":\"<p>A set of properties specified within a configuration classification.</p>\"\
        }\
      },\
      \"documentation\":\"<note> <p>Amazon EMR releases 4.x or later.</p> </note> <p>An optional configuration specification to be used when provisioning cluster instances, which can include configurations for applications and software bundled with Amazon EMR. A configuration consists of a classification, properties, and optional nested configurations. A classification refers to an application-specific configuration file. Properties are the settings you want to change in that file. For more information, see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-configure-apps.html\\\">Configuring Applications</a>.</p>\"\
    },\
    \"ConfigurationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Configuration\"}\
    },\
    \"CreateSecurityConfigurationInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"SecurityConfiguration\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The name of the security configuration.</p>\"\
        },\
        \"SecurityConfiguration\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The security configuration details in JSON format. For JSON parameters and examples, see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-security-configurations.html\\\">Use Security Configurations to Set Up Cluster Security</a> in the <i>Amazon EMR Management Guide</i>.</p>\"\
        }\
      }\
    },\
    \"CreateSecurityConfigurationOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"CreationDateTime\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The name of the security configuration.</p>\"\
        },\
        \"CreationDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date and time the security configuration was created.</p>\"\
        }\
      }\
    },\
    \"Date\":{\"type\":\"timestamp\"},\
    \"DeleteSecurityConfigurationInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The name of the security configuration.</p>\"\
        }\
      }\
    },\
    \"DeleteSecurityConfigurationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeClusterInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ClusterId\"],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>The identifier of the cluster to describe.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This input determines which cluster to describe.</p>\"\
    },\
    \"DescribeClusterOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Cluster\":{\
          \"shape\":\"Cluster\",\
          \"documentation\":\"<p>This output contains the details for the requested cluster.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This output contains the description of the cluster.</p>\"\
    },\
    \"DescribeJobFlowsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreatedAfter\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>Return only job flows created after this date and time.</p>\"\
        },\
        \"CreatedBefore\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>Return only job flows created before this date and time.</p>\"\
        },\
        \"JobFlowIds\":{\
          \"shape\":\"XmlStringList\",\
          \"documentation\":\"<p>Return only job flows whose job flow ID is contained in this list.</p>\"\
        },\
        \"JobFlowStates\":{\
          \"shape\":\"JobFlowExecutionStateList\",\
          \"documentation\":\"<p>Return only job flows whose state is contained in this list.</p>\"\
        }\
      },\
      \"documentation\":\"<p> The input for the <a>DescribeJobFlows</a> operation. </p>\"\
    },\
    \"DescribeJobFlowsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobFlows\":{\
          \"shape\":\"JobFlowDetailList\",\
          \"documentation\":\"<p>A list of job flows matching the parameters supplied.</p>\"\
        }\
      },\
      \"documentation\":\"<p> The output for the <a>DescribeJobFlows</a> operation. </p>\"\
    },\
    \"DescribeSecurityConfigurationInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The name of the security configuration.</p>\"\
        }\
      }\
    },\
    \"DescribeSecurityConfigurationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The name of the security configuration.</p>\"\
        },\
        \"SecurityConfiguration\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The security configuration details in JSON format.</p>\"\
        },\
        \"CreationDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date and time the security configuration was created</p>\"\
        }\
      }\
    },\
    \"DescribeStepInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClusterId\",\
        \"StepId\"\
      ],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>The identifier of the cluster with steps to describe.</p>\"\
        },\
        \"StepId\":{\
          \"shape\":\"StepId\",\
          \"documentation\":\"<p>The identifier of the step to describe.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This input determines which step to describe.</p>\"\
    },\
    \"DescribeStepOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Step\":{\
          \"shape\":\"Step\",\
          \"documentation\":\"<p>The step details for the requested step identifier.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This output contains the description of the cluster step.</p>\"\
    },\
    \"EC2InstanceIdsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceId\"}\
    },\
    \"EC2InstanceIdsToTerminateList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceId\"}\
    },\
    \"EbsBlockDevice\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VolumeSpecification\":{\
          \"shape\":\"VolumeSpecification\",\
          \"documentation\":\"<p>EBS volume specifications such as volume type, IOPS, and size (GiB) that will be requested for the EBS volume attached to an EC2 instance in the cluster.</p>\"\
        },\
        \"Device\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The device name that is exposed to the instance, such as /dev/sdh.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration of requested EBS block device associated with the instance group.</p>\"\
    },\
    \"EbsBlockDeviceConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"VolumeSpecification\"],\
      \"members\":{\
        \"VolumeSpecification\":{\
          \"shape\":\"VolumeSpecification\",\
          \"documentation\":\"<p>EBS volume specifications such as volume type, IOPS, and size (GiB) that will be requested for the EBS volume attached to an EC2 instance in the cluster.</p>\"\
        },\
        \"VolumesPerInstance\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Number of EBS volumes with a specific volume configuration that will be associated with every instance in the instance group</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration of requested EBS block device associated with the instance group with count of volumes that will be associated to every instance.</p>\"\
    },\
    \"EbsBlockDeviceConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EbsBlockDeviceConfig\"}\
    },\
    \"EbsBlockDeviceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EbsBlockDevice\"}\
    },\
    \"EbsConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EbsBlockDeviceConfigs\":{\
          \"shape\":\"EbsBlockDeviceConfigList\",\
          \"documentation\":\"<p>An array of Amazon EBS volume specifications attached to a cluster instance.</p>\"\
        },\
        \"EbsOptimized\":{\
          \"shape\":\"BooleanObject\",\
          \"documentation\":\"<p>Indicates whether an Amazon EBS volume is EBS-optimized.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Amazon EBS configuration of a cluster instance.</p>\"\
    },\
    \"EbsVolume\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Device\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The device name that is exposed to the instance, such as /dev/sdh.</p>\"\
        },\
        \"VolumeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The volume identifier of the EBS volume.</p>\"\
        }\
      },\
      \"documentation\":\"<p>EBS block device that's attached to an EC2 instance.</p>\"\
    },\
    \"EbsVolumeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EbsVolume\"}\
    },\
    \"Ec2InstanceAttributes\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Ec2KeyName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Amazon EC2 key pair to use when connecting with SSH into the master node as a user named \\\"hadoop\\\".</p>\"\
        },\
        \"Ec2SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Set this parameter to the identifier of the Amazon VPC subnet where you want the cluster to launch. If you do not specify this value, and your account supports EC2-Classic, the cluster launches in EC2-Classic.</p>\"\
        },\
        \"RequestedEc2SubnetIds\":{\
          \"shape\":\"XmlStringMaxLen256List\",\
          \"documentation\":\"<p>Applies to clusters configured with the instance fleets option. Specifies the unique identifier of one or more Amazon EC2 subnets in which to launch EC2 cluster instances. Subnets must exist within the same VPC. Amazon EMR chooses the EC2 subnet with the best fit from among the list of <code>RequestedEc2SubnetIds</code>, and then launches all cluster instances within that Subnet. If this value is not specified, and the account and Region support EC2-Classic networks, the cluster launches instances in the EC2-Classic network and uses <code>RequestedEc2AvailabilityZones</code> instead of this setting. If EC2-Classic is not supported, and no Subnet is specified, Amazon EMR chooses the subnet for you. <code>RequestedEc2SubnetIDs</code> and <code>RequestedEc2AvailabilityZones</code> cannot be specified together.</p>\"\
        },\
        \"Ec2AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone in which the cluster will run. </p>\"\
        },\
        \"RequestedEc2AvailabilityZones\":{\
          \"shape\":\"XmlStringMaxLen256List\",\
          \"documentation\":\"<p>Applies to clusters configured with the instance fleets option. Specifies one or more Availability Zones in which to launch EC2 cluster instances when the EC2-Classic network configuration is supported. Amazon EMR chooses the Availability Zone with the best fit from among the list of <code>RequestedEc2AvailabilityZones</code>, and then launches all cluster instances within that Availability Zone. If you do not specify this value, Amazon EMR chooses the Availability Zone for you. <code>RequestedEc2SubnetIDs</code> and <code>RequestedEc2AvailabilityZones</code> cannot be specified together.</p>\"\
        },\
        \"IamInstanceProfile\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The IAM role that was specified when the cluster was launched. The EC2 instances of the cluster assume this role.</p>\"\
        },\
        \"EmrManagedMasterSecurityGroup\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier of the Amazon EC2 security group for the master node.</p>\"\
        },\
        \"EmrManagedSlaveSecurityGroup\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier of the Amazon EC2 security group for the core and task nodes.</p>\"\
        },\
        \"ServiceAccessSecurityGroup\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier of the Amazon EC2 security group for the Amazon EMR service to access clusters in VPC private subnets.</p>\"\
        },\
        \"AdditionalMasterSecurityGroups\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>A list of additional Amazon EC2 security group IDs for the master node.</p>\"\
        },\
        \"AdditionalSlaveSecurityGroups\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>A list of additional Amazon EC2 security group IDs for the core and task nodes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about the EC2 instances in a cluster grouped by category. For example, key name, subnet ID, IAM instance profile, and so on.</p>\"\
    },\
    \"ErrorCode\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"ErrorMessage\":{\"type\":\"string\"},\
    \"FailureDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Reason\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The reason for the step failure. In the case where the service cannot successfully determine the root cause of the failure, it returns \\\"Unknown Error\\\" as a reason.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The descriptive message including the error the EMR service has identified as the cause of step failure. This is text from an error log that describes the root cause of the failure.</p>\"\
        },\
        \"LogFile\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The path to the log file where the step failure root cause was originally recorded.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of the step failure. The service attempts to detect the root cause for many common failures.</p>\"\
    },\
    \"GetBlockPublicAccessConfigurationInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"GetBlockPublicAccessConfigurationOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BlockPublicAccessConfiguration\",\
        \"BlockPublicAccessConfigurationMetadata\"\
      ],\
      \"members\":{\
        \"BlockPublicAccessConfiguration\":{\
          \"shape\":\"BlockPublicAccessConfiguration\",\
          \"documentation\":\"<p>A configuration for Amazon EMR block public access. The configuration applies to all clusters created in your account for the current Region. The configuration specifies whether block public access is enabled. If block public access is enabled, security groups associated with the cluster cannot have rules that allow inbound traffic from 0.0.0.0/0 or ::/0 on a port, unless the port is specified as an exception using <code>PermittedPublicSecurityGroupRuleRanges</code> in the <code>BlockPublicAccessConfiguration</code>. By default, Port 22 (SSH) is an exception, and public access is allowed on this port. You can change this by updating the block public access configuration to remove the exception.</p> <note> <p>For accounts that created clusters in a Region before November 25, 2019, block public access is disabled by default in that Region. To use this feature, you must manually enable and configure it. For accounts that did not create an EMR cluster in a Region before this date, block public access is enabled by default in that Region.</p> </note>\"\
        },\
        \"BlockPublicAccessConfigurationMetadata\":{\
          \"shape\":\"BlockPublicAccessConfigurationMetadata\",\
          \"documentation\":\"<p>Properties that describe the AWS principal that created the <code>BlockPublicAccessConfiguration</code> using the <code>PutBlockPublicAccessConfiguration</code> action as well as the date and time that the configuration was created. Each time a configuration for block public access is updated, Amazon EMR updates this metadata.</p>\"\
        }\
      }\
    },\
    \"GetManagedScalingPolicyInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ClusterId\"],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p> Specifies the ID of the cluster for which the managed scaling policy will be fetched. </p>\"\
        }\
      }\
    },\
    \"GetManagedScalingPolicyOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ManagedScalingPolicy\":{\
          \"shape\":\"ManagedScalingPolicy\",\
          \"documentation\":\"<p> Specifies the managed scaling policy that is attached to an Amazon EMR cluster. </p>\"\
        }\
      }\
    },\
    \"HadoopJarStepConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"Jar\"],\
      \"members\":{\
        \"Properties\":{\
          \"shape\":\"KeyValueList\",\
          \"documentation\":\"<p>A list of Java properties that are set when the step runs. You can use these properties to pass key value pairs to your main function.</p>\"\
        },\
        \"Jar\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A path to a JAR file run during the step.</p>\"\
        },\
        \"MainClass\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The name of the main class in the specified Java file. If not specified, the JAR file should specify a Main-Class in its manifest file.</p>\"\
        },\
        \"Args\":{\
          \"shape\":\"XmlStringList\",\
          \"documentation\":\"<p>A list of command line arguments passed to the JAR file's main function when executed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A job flow step consisting of a JAR file whose main function will be executed. The main function submits a job for Hadoop to execute and waits for the job to finish or fail.</p>\"\
    },\
    \"HadoopStepConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Jar\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The path to the JAR file that runs during the step.</p>\"\
        },\
        \"Properties\":{\
          \"shape\":\"StringMap\",\
          \"documentation\":\"<p>The list of Java properties that are set when the step runs. You can use these properties to pass key value pairs to your main function.</p>\"\
        },\
        \"MainClass\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the main class in the specified Java file. If not specified, the JAR file should specify a main class in its manifest file.</p>\"\
        },\
        \"Args\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>The list of command line arguments to pass to the JAR file's main function for execution.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A cluster step consisting of a JAR file whose main function will be executed. The main function submits a job for Hadoop to execute and waits for the job to finish or fail.</p>\"\
    },\
    \"Instance\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The unique identifier for the instance in Amazon EMR.</p>\"\
        },\
        \"Ec2InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The unique identifier of the instance in Amazon EC2.</p>\"\
        },\
        \"PublicDnsName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The public DNS name of the instance.</p>\"\
        },\
        \"PublicIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The public IP address of the instance.</p>\"\
        },\
        \"PrivateDnsName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The private DNS name of the instance.</p>\"\
        },\
        \"PrivateIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The private IP address of the instance.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"InstanceStatus\",\
          \"documentation\":\"<p>The current status of the instance.</p>\"\
        },\
        \"InstanceGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier of the instance group to which this instance belongs.</p>\"\
        },\
        \"InstanceFleetId\":{\
          \"shape\":\"InstanceFleetId\",\
          \"documentation\":\"<p>The unique identifier of the instance fleet to which an EC2 instance belongs.</p>\"\
        },\
        \"Market\":{\
          \"shape\":\"MarketType\",\
          \"documentation\":\"<p>The instance purchasing option. Valid values are <code>ON_DEMAND</code> or <code>SPOT</code>. </p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The EC2 instance type, for example <code>m3.xlarge</code>.</p>\"\
        },\
        \"EbsVolumes\":{\
          \"shape\":\"EbsVolumeList\",\
          \"documentation\":\"<p>The list of EBS volumes that are attached to this instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents an EC2 instance provisioned as part of cluster.</p>\"\
    },\
    \"InstanceCollectionType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INSTANCE_FLEET\",\
        \"INSTANCE_GROUP\"\
      ]\
    },\
    \"InstanceFleet\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"InstanceFleetId\",\
          \"documentation\":\"<p>The unique identifier of the instance fleet.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>A friendly name for the instance fleet.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"InstanceFleetStatus\",\
          \"documentation\":\"<p>The current status of the instance fleet. </p>\"\
        },\
        \"InstanceFleetType\":{\
          \"shape\":\"InstanceFleetType\",\
          \"documentation\":\"<p>The node type that the instance fleet hosts. Valid values are MASTER, CORE, or TASK. </p>\"\
        },\
        \"TargetOnDemandCapacity\":{\
          \"shape\":\"WholeNumber\",\
          \"documentation\":\"<p>The target capacity of On-Demand units for the instance fleet, which determines how many On-Demand instances to provision. When the instance fleet launches, Amazon EMR tries to provision On-Demand instances as specified by <a>InstanceTypeConfig</a>. Each instance configuration has a specified <code>WeightedCapacity</code>. When an On-Demand instance is provisioned, the <code>WeightedCapacity</code> units count toward the target capacity. Amazon EMR provisions instances until the target capacity is totally fulfilled, even if this results in an overage. For example, if there are 2 units remaining to fulfill capacity, and Amazon EMR can only provision an instance with a <code>WeightedCapacity</code> of 5 units, the instance is provisioned, and the target capacity is exceeded by 3 units. You can use <a>InstanceFleet$ProvisionedOnDemandCapacity</a> to determine the Spot capacity units that have been provisioned for the instance fleet.</p> <note> <p>If not specified or set to 0, only Spot instances are provisioned for the instance fleet using <code>TargetSpotCapacity</code>. At least one of <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> should be greater than 0. For a master instance fleet, only one of <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> can be specified, and its value must be 1.</p> </note>\"\
        },\
        \"TargetSpotCapacity\":{\
          \"shape\":\"WholeNumber\",\
          \"documentation\":\"<p>The target capacity of Spot units for the instance fleet, which determines how many Spot instances to provision. When the instance fleet launches, Amazon EMR tries to provision Spot instances as specified by <a>InstanceTypeConfig</a>. Each instance configuration has a specified <code>WeightedCapacity</code>. When a Spot instance is provisioned, the <code>WeightedCapacity</code> units count toward the target capacity. Amazon EMR provisions instances until the target capacity is totally fulfilled, even if this results in an overage. For example, if there are 2 units remaining to fulfill capacity, and Amazon EMR can only provision an instance with a <code>WeightedCapacity</code> of 5 units, the instance is provisioned, and the target capacity is exceeded by 3 units. You can use <a>InstanceFleet$ProvisionedSpotCapacity</a> to determine the Spot capacity units that have been provisioned for the instance fleet.</p> <note> <p>If not specified or set to 0, only On-Demand instances are provisioned for the instance fleet. At least one of <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> should be greater than 0. For a master instance fleet, only one of <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> can be specified, and its value must be 1.</p> </note>\"\
        },\
        \"ProvisionedOnDemandCapacity\":{\
          \"shape\":\"WholeNumber\",\
          \"documentation\":\"<p>The number of On-Demand units that have been provisioned for the instance fleet to fulfill <code>TargetOnDemandCapacity</code>. This provisioned capacity might be less than or greater than <code>TargetOnDemandCapacity</code>.</p>\"\
        },\
        \"ProvisionedSpotCapacity\":{\
          \"shape\":\"WholeNumber\",\
          \"documentation\":\"<p>The number of Spot units that have been provisioned for this instance fleet to fulfill <code>TargetSpotCapacity</code>. This provisioned capacity might be less than or greater than <code>TargetSpotCapacity</code>.</p>\"\
        },\
        \"InstanceTypeSpecifications\":{\
          \"shape\":\"InstanceTypeSpecificationList\",\
          \"documentation\":\"<p>The specification for the instance types that comprise an instance fleet. Up to five unique instance specifications may be defined for each instance fleet. </p>\"\
        },\
        \"LaunchSpecifications\":{\
          \"shape\":\"InstanceFleetProvisioningSpecifications\",\
          \"documentation\":\"<p>Describes the launch specification for an instance fleet. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an instance fleet, which is a group of EC2 instances that host a particular node type (master, core, or task) in an Amazon EMR cluster. Instance fleets can consist of a mix of instance types and On-Demand and Spot instances, which are provisioned to meet a defined target capacity. </p> <note> <p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p> </note>\"\
    },\
    \"InstanceFleetConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceFleetType\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The friendly name of the instance fleet.</p>\"\
        },\
        \"InstanceFleetType\":{\
          \"shape\":\"InstanceFleetType\",\
          \"documentation\":\"<p>The node type that the instance fleet hosts. Valid values are MASTER,CORE,and TASK.</p>\"\
        },\
        \"TargetOnDemandCapacity\":{\
          \"shape\":\"WholeNumber\",\
          \"documentation\":\"<p>The target capacity of On-Demand units for the instance fleet, which determines how many On-Demand instances to provision. When the instance fleet launches, Amazon EMR tries to provision On-Demand instances as specified by <a>InstanceTypeConfig</a>. Each instance configuration has a specified <code>WeightedCapacity</code>. When an On-Demand instance is provisioned, the <code>WeightedCapacity</code> units count toward the target capacity. Amazon EMR provisions instances until the target capacity is totally fulfilled, even if this results in an overage. For example, if there are 2 units remaining to fulfill capacity, and Amazon EMR can only provision an instance with a <code>WeightedCapacity</code> of 5 units, the instance is provisioned, and the target capacity is exceeded by 3 units.</p> <note> <p>If not specified or set to 0, only Spot instances are provisioned for the instance fleet using <code>TargetSpotCapacity</code>. At least one of <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> should be greater than 0. For a master instance fleet, only one of <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> can be specified, and its value must be 1.</p> </note>\"\
        },\
        \"TargetSpotCapacity\":{\
          \"shape\":\"WholeNumber\",\
          \"documentation\":\"<p>The target capacity of Spot units for the instance fleet, which determines how many Spot instances to provision. When the instance fleet launches, Amazon EMR tries to provision Spot instances as specified by <a>InstanceTypeConfig</a>. Each instance configuration has a specified <code>WeightedCapacity</code>. When a Spot instance is provisioned, the <code>WeightedCapacity</code> units count toward the target capacity. Amazon EMR provisions instances until the target capacity is totally fulfilled, even if this results in an overage. For example, if there are 2 units remaining to fulfill capacity, and Amazon EMR can only provision an instance with a <code>WeightedCapacity</code> of 5 units, the instance is provisioned, and the target capacity is exceeded by 3 units.</p> <note> <p>If not specified or set to 0, only On-Demand instances are provisioned for the instance fleet. At least one of <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> should be greater than 0. For a master instance fleet, only one of <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> can be specified, and its value must be 1.</p> </note>\"\
        },\
        \"InstanceTypeConfigs\":{\
          \"shape\":\"InstanceTypeConfigList\",\
          \"documentation\":\"<p>The instance type configurations that define the EC2 instances in the instance fleet.</p>\"\
        },\
        \"LaunchSpecifications\":{\
          \"shape\":\"InstanceFleetProvisioningSpecifications\",\
          \"documentation\":\"<p>The launch specification for the instance fleet.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration that defines an instance fleet.</p> <note> <p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p> </note>\"\
    },\
    \"InstanceFleetConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceFleetConfig\"}\
    },\
    \"InstanceFleetId\":{\"type\":\"string\"},\
    \"InstanceFleetList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceFleet\"}\
    },\
    \"InstanceFleetModifyConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceFleetId\"],\
      \"members\":{\
        \"InstanceFleetId\":{\
          \"shape\":\"InstanceFleetId\",\
          \"documentation\":\"<p>A unique identifier for the instance fleet.</p>\"\
        },\
        \"TargetOnDemandCapacity\":{\
          \"shape\":\"WholeNumber\",\
          \"documentation\":\"<p>The target capacity of On-Demand units for the instance fleet. For more information see <a>InstanceFleetConfig$TargetOnDemandCapacity</a>.</p>\"\
        },\
        \"TargetSpotCapacity\":{\
          \"shape\":\"WholeNumber\",\
          \"documentation\":\"<p>The target capacity of Spot units for the instance fleet. For more information, see <a>InstanceFleetConfig$TargetSpotCapacity</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration parameters for an instance fleet modification request.</p> <note> <p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p> </note>\"\
    },\
    \"InstanceFleetProvisioningSpecifications\":{\
      \"type\":\"structure\",\
      \"required\":[\"SpotSpecification\"],\
      \"members\":{\
        \"SpotSpecification\":{\
          \"shape\":\"SpotProvisioningSpecification\",\
          \"documentation\":\"<p>The launch specification for Spot instances in the fleet, which determines the defined duration and provisioning timeout behavior.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The launch specification for Spot instances in the fleet, which determines the defined duration and provisioning timeout behavior.</p> <note> <p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p> </note>\"\
    },\
    \"InstanceFleetState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PROVISIONING\",\
        \"BOOTSTRAPPING\",\
        \"RUNNING\",\
        \"RESIZING\",\
        \"SUSPENDED\",\
        \"TERMINATING\",\
        \"TERMINATED\"\
      ]\
    },\
    \"InstanceFleetStateChangeReason\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"InstanceFleetStateChangeReasonCode\",\
          \"documentation\":\"<p>A code corresponding to the reason the state change occurred.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An explanatory message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides status change reason details for the instance fleet.</p> <note> <p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p> </note>\"\
    },\
    \"InstanceFleetStateChangeReasonCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INTERNAL_ERROR\",\
        \"VALIDATION_ERROR\",\
        \"INSTANCE_FAILURE\",\
        \"CLUSTER_TERMINATED\"\
      ]\
    },\
    \"InstanceFleetStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"State\":{\
          \"shape\":\"InstanceFleetState\",\
          \"documentation\":\"<p>A code representing the instance fleet status.</p> <ul> <li> <p> <code>PROVISIONING</code>âThe instance fleet is provisioning EC2 resources and is not yet ready to run jobs.</p> </li> <li> <p> <code>BOOTSTRAPPING</code>âEC2 instances and other resources have been provisioned and the bootstrap actions specified for the instances are underway.</p> </li> <li> <p> <code>RUNNING</code>âEC2 instances and other resources are running. They are either executing jobs or waiting to execute jobs.</p> </li> <li> <p> <code>RESIZING</code>âA resize operation is underway. EC2 instances are either being added or removed.</p> </li> <li> <p> <code>SUSPENDED</code>âA resize operation could not complete. Existing EC2 instances are running, but instances can't be added or removed.</p> </li> <li> <p> <code>TERMINATING</code>âThe instance fleet is terminating EC2 instances.</p> </li> <li> <p> <code>TERMINATED</code>âThe instance fleet is no longer active, and all EC2 instances have been terminated.</p> </li> </ul>\"\
        },\
        \"StateChangeReason\":{\
          \"shape\":\"InstanceFleetStateChangeReason\",\
          \"documentation\":\"<p>Provides status change reason details for the instance fleet.</p>\"\
        },\
        \"Timeline\":{\
          \"shape\":\"InstanceFleetTimeline\",\
          \"documentation\":\"<p>Provides historical timestamps for the instance fleet, including the time of creation, the time it became ready to run jobs, and the time of termination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The status of the instance fleet.</p> <note> <p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p> </note>\"\
    },\
    \"InstanceFleetTimeline\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreationDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The time and date the instance fleet was created.</p>\"\
        },\
        \"ReadyDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The time and date the instance fleet was ready to run jobs.</p>\"\
        },\
        \"EndDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The time and date the instance fleet terminated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides historical timestamps for the instance fleet, including the time of creation, the time it became ready to run jobs, and the time of termination.</p> <note> <p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p> </note>\"\
    },\
    \"InstanceFleetType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"MASTER\",\
        \"CORE\",\
        \"TASK\"\
      ]\
    },\
    \"InstanceGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"InstanceGroupId\",\
          \"documentation\":\"<p>The identifier of the instance group.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the instance group.</p>\"\
        },\
        \"Market\":{\
          \"shape\":\"MarketType\",\
          \"documentation\":\"<p>The marketplace to provision instances for this group. Valid values are ON_DEMAND or SPOT.</p>\"\
        },\
        \"InstanceGroupType\":{\
          \"shape\":\"InstanceGroupType\",\
          \"documentation\":\"<p>The type of the instance group. Valid values are MASTER, CORE or TASK.</p>\"\
        },\
        \"BidPrice\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The bid price for each EC2 Spot instance type as defined by <code>InstanceType</code>. Expressed in USD. If neither <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code> is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to 100%.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The EC2 instance type for all instances in the instance group.</p>\"\
        },\
        \"RequestedInstanceCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The target number of instances for the instance group.</p>\"\
        },\
        \"RunningInstanceCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of instances currently running in this instance group.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"InstanceGroupStatus\",\
          \"documentation\":\"<p>The current status of the instance group.</p>\"\
        },\
        \"Configurations\":{\
          \"shape\":\"ConfigurationList\",\
          \"documentation\":\"<note> <p>Amazon EMR releases 4.x or later.</p> </note> <p>The list of configurations supplied for an EMR cluster instance group. You can specify a separate configuration for each instance group (master, core, and task).</p>\"\
        },\
        \"ConfigurationsVersion\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The version number of the requested configuration specification for this instance group.</p>\"\
        },\
        \"LastSuccessfullyAppliedConfigurations\":{\
          \"shape\":\"ConfigurationList\",\
          \"documentation\":\"<p>A list of configurations that were successfully applied for an instance group last time.</p>\"\
        },\
        \"LastSuccessfullyAppliedConfigurationsVersion\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The version number of a configuration specification that was successfully applied for an instance group last time. </p>\"\
        },\
        \"EbsBlockDevices\":{\
          \"shape\":\"EbsBlockDeviceList\",\
          \"documentation\":\"<p>The EBS block devices that are mapped to this instance group.</p>\"\
        },\
        \"EbsOptimized\":{\
          \"shape\":\"BooleanObject\",\
          \"documentation\":\"<p>If the instance group is EBS-optimized. An Amazon EBS-optimized instance uses an optimized configuration stack and provides additional, dedicated capacity for Amazon EBS I/O.</p>\"\
        },\
        \"ShrinkPolicy\":{\
          \"shape\":\"ShrinkPolicy\",\
          \"documentation\":\"<p>Policy for customizing shrink operations.</p>\"\
        },\
        \"AutoScalingPolicy\":{\
          \"shape\":\"AutoScalingPolicyDescription\",\
          \"documentation\":\"<p>An automatic scaling policy for a core instance group or task instance group in an Amazon EMR cluster. The automatic scaling policy defines how an instance group dynamically adds and terminates EC2 instances in response to the value of a CloudWatch metric. See PutAutoScalingPolicy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This entity represents an instance group, which is a group of instances that have common purpose. For example, CORE instance group is used for HDFS.</p>\"\
    },\
    \"InstanceGroupConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceRole\",\
        \"InstanceType\",\
        \"InstanceCount\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>Friendly name given to the instance group.</p>\"\
        },\
        \"Market\":{\
          \"shape\":\"MarketType\",\
          \"documentation\":\"<p>Market type of the EC2 instances used to create a cluster node.</p>\"\
        },\
        \"InstanceRole\":{\
          \"shape\":\"InstanceRoleType\",\
          \"documentation\":\"<p>The role of the instance group in the cluster.</p>\"\
        },\
        \"BidPrice\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The bid price for each EC2 Spot instance type as defined by <code>InstanceType</code>. Expressed in USD. If neither <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code> is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to 100%.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The EC2 instance type for all instances in the instance group.</p>\"\
        },\
        \"InstanceCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Target number of instances for the instance group.</p>\"\
        },\
        \"Configurations\":{\
          \"shape\":\"ConfigurationList\",\
          \"documentation\":\"<note> <p>Amazon EMR releases 4.x or later.</p> </note> <p>The list of configurations supplied for an EMR cluster instance group. You can specify a separate configuration for each instance group (master, core, and task).</p>\"\
        },\
        \"EbsConfiguration\":{\
          \"shape\":\"EbsConfiguration\",\
          \"documentation\":\"<p>EBS configurations that will be attached to each EC2 instance in the instance group.</p>\"\
        },\
        \"AutoScalingPolicy\":{\
          \"shape\":\"AutoScalingPolicy\",\
          \"documentation\":\"<p>An automatic scaling policy for a core instance group or task instance group in an Amazon EMR cluster. The automatic scaling policy defines how an instance group dynamically adds and terminates EC2 instances in response to the value of a CloudWatch metric. See <a>PutAutoScalingPolicy</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration defining a new instance group.</p>\"\
    },\
    \"InstanceGroupConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceGroupConfig\"}\
    },\
    \"InstanceGroupDetail\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Market\",\
        \"InstanceRole\",\
        \"InstanceType\",\
        \"InstanceRequestCount\",\
        \"InstanceRunningCount\",\
        \"State\",\
        \"CreationDateTime\"\
      ],\
      \"members\":{\
        \"InstanceGroupId\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>Unique identifier for the instance group.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>Friendly name for the instance group.</p>\"\
        },\
        \"Market\":{\
          \"shape\":\"MarketType\",\
          \"documentation\":\"<p>Market type of the EC2 instances used to create a cluster node.</p>\"\
        },\
        \"InstanceRole\":{\
          \"shape\":\"InstanceRoleType\",\
          \"documentation\":\"<p>Instance group role in the cluster</p>\"\
        },\
        \"BidPrice\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The bid price for each EC2 Spot instance type as defined by <code>InstanceType</code>. Expressed in USD. If neither <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code> is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to 100%.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>EC2 instance type.</p>\"\
        },\
        \"InstanceRequestCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Target number of instances to run in the instance group.</p>\"\
        },\
        \"InstanceRunningCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Actual count of running instances.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"InstanceGroupState\",\
          \"documentation\":\"<p>State of instance group. The following values are deprecated: STARTING, TERMINATED, and FAILED.</p>\"\
        },\
        \"LastStateChangeReason\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>Details regarding the state of the instance group.</p>\"\
        },\
        \"CreationDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date/time the instance group was created.</p>\"\
        },\
        \"StartDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date/time the instance group was started.</p>\"\
        },\
        \"ReadyDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date/time the instance group was available to the cluster.</p>\"\
        },\
        \"EndDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date/time the instance group was terminated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Detailed information about an instance group.</p>\"\
    },\
    \"InstanceGroupDetailList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceGroupDetail\"}\
    },\
    \"InstanceGroupId\":{\"type\":\"string\"},\
    \"InstanceGroupIdsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen256\"}\
    },\
    \"InstanceGroupList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceGroup\"}\
    },\
    \"InstanceGroupModifyConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceGroupId\"],\
      \"members\":{\
        \"InstanceGroupId\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>Unique ID of the instance group to expand or shrink.</p>\"\
        },\
        \"InstanceCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Target size for the instance group.</p>\"\
        },\
        \"EC2InstanceIdsToTerminate\":{\
          \"shape\":\"EC2InstanceIdsToTerminateList\",\
          \"documentation\":\"<p>The EC2 InstanceIds to terminate. After you terminate the instances, the instance group will not return to its original requested size.</p>\"\
        },\
        \"ShrinkPolicy\":{\
          \"shape\":\"ShrinkPolicy\",\
          \"documentation\":\"<p>Policy for customizing shrink operations.</p>\"\
        },\
        \"Configurations\":{\
          \"shape\":\"ConfigurationList\",\
          \"documentation\":\"<p>A list of new or modified configurations to apply for an instance group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Modify the size or configurations of an instance group.</p>\"\
    },\
    \"InstanceGroupModifyConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceGroupModifyConfig\"}\
    },\
    \"InstanceGroupState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PROVISIONING\",\
        \"BOOTSTRAPPING\",\
        \"RUNNING\",\
        \"RECONFIGURING\",\
        \"RESIZING\",\
        \"SUSPENDED\",\
        \"TERMINATING\",\
        \"TERMINATED\",\
        \"ARRESTED\",\
        \"SHUTTING_DOWN\",\
        \"ENDED\"\
      ]\
    },\
    \"InstanceGroupStateChangeReason\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"InstanceGroupStateChangeReasonCode\",\
          \"documentation\":\"<p>The programmable code for the state change reason.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status change reason description.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The status change reason details for the instance group.</p>\"\
    },\
    \"InstanceGroupStateChangeReasonCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INTERNAL_ERROR\",\
        \"VALIDATION_ERROR\",\
        \"INSTANCE_FAILURE\",\
        \"CLUSTER_TERMINATED\"\
      ]\
    },\
    \"InstanceGroupStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"State\":{\
          \"shape\":\"InstanceGroupState\",\
          \"documentation\":\"<p>The current state of the instance group.</p>\"\
        },\
        \"StateChangeReason\":{\
          \"shape\":\"InstanceGroupStateChangeReason\",\
          \"documentation\":\"<p>The status change reason details for the instance group.</p>\"\
        },\
        \"Timeline\":{\
          \"shape\":\"InstanceGroupTimeline\",\
          \"documentation\":\"<p>The timeline of the instance group status over time.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of the instance group status.</p>\"\
    },\
    \"InstanceGroupTimeline\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreationDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The creation date and time of the instance group.</p>\"\
        },\
        \"ReadyDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date and time when the instance group became ready to perform tasks.</p>\"\
        },\
        \"EndDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date and time when the instance group terminated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The timeline of the instance group lifecycle.</p>\"\
    },\
    \"InstanceGroupType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"MASTER\",\
        \"CORE\",\
        \"TASK\"\
      ]\
    },\
    \"InstanceGroupTypeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceGroupType\"}\
    },\
    \"InstanceId\":{\"type\":\"string\"},\
    \"InstanceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Instance\"}\
    },\
    \"InstanceResizePolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstancesToTerminate\":{\
          \"shape\":\"EC2InstanceIdsList\",\
          \"documentation\":\"<p>Specific list of instances to be terminated when shrinking an instance group.</p>\"\
        },\
        \"InstancesToProtect\":{\
          \"shape\":\"EC2InstanceIdsList\",\
          \"documentation\":\"<p>Specific list of instances to be protected when shrinking an instance group.</p>\"\
        },\
        \"InstanceTerminationTimeout\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Decommissioning timeout override for the specific list of instances to be terminated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Custom policy for requesting termination protection or termination of specific instances when shrinking an instance group.</p>\"\
    },\
    \"InstanceRoleType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"MASTER\",\
        \"CORE\",\
        \"TASK\"\
      ]\
    },\
    \"InstanceState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AWAITING_FULFILLMENT\",\
        \"PROVISIONING\",\
        \"BOOTSTRAPPING\",\
        \"RUNNING\",\
        \"TERMINATED\"\
      ]\
    },\
    \"InstanceStateChangeReason\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"InstanceStateChangeReasonCode\",\
          \"documentation\":\"<p>The programmable code for the state change reason.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status change reason description.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of the status change reason for the instance.</p>\"\
    },\
    \"InstanceStateChangeReasonCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INTERNAL_ERROR\",\
        \"VALIDATION_ERROR\",\
        \"INSTANCE_FAILURE\",\
        \"BOOTSTRAP_FAILURE\",\
        \"CLUSTER_TERMINATED\"\
      ]\
    },\
    \"InstanceStateList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceState\"}\
    },\
    \"InstanceStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"State\":{\
          \"shape\":\"InstanceState\",\
          \"documentation\":\"<p>The current state of the instance.</p>\"\
        },\
        \"StateChangeReason\":{\
          \"shape\":\"InstanceStateChangeReason\",\
          \"documentation\":\"<p>The details of the status change reason for the instance.</p>\"\
        },\
        \"Timeline\":{\
          \"shape\":\"InstanceTimeline\",\
          \"documentation\":\"<p>The timeline of the instance status over time.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The instance status details.</p>\"\
    },\
    \"InstanceTimeline\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreationDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The creation date and time of the instance.</p>\"\
        },\
        \"ReadyDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date and time when the instance was ready to perform tasks.</p>\"\
        },\
        \"EndDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date and time when the instance was terminated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The timeline of the instance lifecycle.</p>\"\
    },\
    \"InstanceType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"InstanceTypeConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceType\"],\
      \"members\":{\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>An EC2 instance type, such as <code>m3.xlarge</code>. </p>\"\
        },\
        \"WeightedCapacity\":{\
          \"shape\":\"WholeNumber\",\
          \"documentation\":\"<p>The number of units that a provisioned instance of this type provides toward fulfilling the target capacities defined in <a>InstanceFleetConfig</a>. This value is 1 for a master instance fleet, and must be 1 or greater for core and task instance fleets. Defaults to 1 if not specified. </p>\"\
        },\
        \"BidPrice\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The bid price for each EC2 Spot instance type as defined by <code>InstanceType</code>. Expressed in USD. If neither <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code> is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to 100%. </p>\"\
        },\
        \"BidPriceAsPercentageOfOnDemandPrice\":{\
          \"shape\":\"NonNegativeDouble\",\
          \"documentation\":\"<p>The bid price, as a percentage of On-Demand price, for each EC2 Spot instance as defined by <code>InstanceType</code>. Expressed as a number (for example, 20 specifies 20%). If neither <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code> is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to 100%.</p>\"\
        },\
        \"EbsConfiguration\":{\
          \"shape\":\"EbsConfiguration\",\
          \"documentation\":\"<p>The configuration of Amazon Elastic Block Storage (EBS) attached to each instance as defined by <code>InstanceType</code>. </p>\"\
        },\
        \"Configurations\":{\
          \"shape\":\"ConfigurationList\",\
          \"documentation\":\"<p>A configuration classification that applies when provisioning cluster instances, which can include configurations for applications and software that run on the cluster.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An instance type configuration for each instance type in an instance fleet, which determines the EC2 instances Amazon EMR attempts to provision to fulfill On-Demand and Spot target capacities. There can be a maximum of 5 instance type configurations in a fleet.</p> <note> <p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p> </note>\"\
    },\
    \"InstanceTypeConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceTypeConfig\"}\
    },\
    \"InstanceTypeSpecification\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The EC2 instance type, for example <code>m3.xlarge</code>.</p>\"\
        },\
        \"WeightedCapacity\":{\
          \"shape\":\"WholeNumber\",\
          \"documentation\":\"<p>The number of units that a provisioned instance of this type provides toward fulfilling the target capacities defined in <a>InstanceFleetConfig</a>. Capacity values represent performance characteristics such as vCPUs, memory, or I/O. If not specified, the default value is 1.</p>\"\
        },\
        \"BidPrice\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The bid price for each EC2 Spot instance type as defined by <code>InstanceType</code>. Expressed in USD.</p>\"\
        },\
        \"BidPriceAsPercentageOfOnDemandPrice\":{\
          \"shape\":\"NonNegativeDouble\",\
          \"documentation\":\"<p>The bid price, as a percentage of On-Demand price, for each EC2 Spot instance as defined by <code>InstanceType</code>. Expressed as a number (for example, 20 specifies 20%).</p>\"\
        },\
        \"Configurations\":{\
          \"shape\":\"ConfigurationList\",\
          \"documentation\":\"<p>A configuration classification that applies when provisioning cluster instances, which can include configurations for applications and software bundled with Amazon EMR.</p>\"\
        },\
        \"EbsBlockDevices\":{\
          \"shape\":\"EbsBlockDeviceList\",\
          \"documentation\":\"<p>The configuration of Amazon Elastic Block Storage (EBS) attached to each instance as defined by <code>InstanceType</code>.</p>\"\
        },\
        \"EbsOptimized\":{\
          \"shape\":\"BooleanObject\",\
          \"documentation\":\"<p>Evaluates to <code>TRUE</code> when the specified <code>InstanceType</code> is EBS-optimized.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration specification for each instance type in an instance fleet.</p> <note> <p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p> </note>\"\
    },\
    \"InstanceTypeSpecificationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceTypeSpecification\"}\
    },\
    \"Integer\":{\"type\":\"integer\"},\
    \"InternalServerError\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Indicates that an error occurred while processing the request and that the request was not completed.</p>\",\
      \"exception\":true\
    },\
    \"InternalServerException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>The message associated with the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception occurs when there is an internal failure in the EMR service.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ErrorCode\":{\
          \"shape\":\"ErrorCode\",\
          \"documentation\":\"<p>The error code associated with the exception.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>The message associated with the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception occurs when there is something wrong with user input.</p>\",\
      \"exception\":true\
    },\
    \"JobFlowDetail\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"JobFlowId\",\
        \"Name\",\
        \"ExecutionStatusDetail\",\
        \"Instances\"\
      ],\
      \"members\":{\
        \"JobFlowId\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The job flow identifier.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The name of the job flow.</p>\"\
        },\
        \"LogUri\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The location in Amazon S3 where log files for the job are stored.</p>\"\
        },\
        \"LogEncryptionKmsKeyId\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The AWS KMS customer master key (CMK) used for encrypting log files. This attribute is only available with EMR version 5.30.0 and later, excluding EMR 6.0.0.</p>\"\
        },\
        \"AmiVersion\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>Applies only to Amazon EMR AMI versions 3.x and 2.x. For Amazon EMR releases 4.0 and later, <code>ReleaseLabel</code> is used. To specify a custom AMI, use <code>CustomAmiID</code>.</p>\"\
        },\
        \"ExecutionStatusDetail\":{\
          \"shape\":\"JobFlowExecutionStatusDetail\",\
          \"documentation\":\"<p>Describes the execution status of the job flow.</p>\"\
        },\
        \"Instances\":{\
          \"shape\":\"JobFlowInstancesDetail\",\
          \"documentation\":\"<p>Describes the Amazon EC2 instances of the job flow.</p>\"\
        },\
        \"Steps\":{\
          \"shape\":\"StepDetailList\",\
          \"documentation\":\"<p>A list of steps run by the job flow.</p>\"\
        },\
        \"BootstrapActions\":{\
          \"shape\":\"BootstrapActionDetailList\",\
          \"documentation\":\"<p>A list of the bootstrap actions run by the job flow.</p>\"\
        },\
        \"SupportedProducts\":{\
          \"shape\":\"SupportedProductsList\",\
          \"documentation\":\"<p>A list of strings set by third party software when the job flow is launched. If you are not using third party software to manage the job flow this value is empty.</p>\"\
        },\
        \"VisibleToAllUsers\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the cluster is visible to all IAM users of the AWS account associated with the cluster. The default value, <code>true</code>, indicates that all IAM users in the AWS account can perform cluster actions if they have the proper IAM policy permissions. If this value is <code>false</code>, only the IAM user that created the cluster can perform actions. This value can be changed on a running cluster by using the <a>SetVisibleToAllUsers</a> action. You can override the default value of <code>true</code> when you create a cluster by using the <code>VisibleToAllUsers</code> parameter of the <code>RunJobFlow</code> action.</p>\"\
        },\
        \"JobFlowRole\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The IAM role that was specified when the job flow was launched. The EC2 instances of the job flow assume this role.</p>\"\
        },\
        \"ServiceRole\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The IAM role that will be assumed by the Amazon EMR service to access AWS resources on your behalf.</p>\"\
        },\
        \"AutoScalingRole\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>An IAM role for automatic scaling policies. The default role is <code>EMR_AutoScaling_DefaultRole</code>. The IAM role provides a way for the automatic scaling feature to get the required permissions it needs to launch and terminate EC2 instances in an instance group.</p>\"\
        },\
        \"ScaleDownBehavior\":{\
          \"shape\":\"ScaleDownBehavior\",\
          \"documentation\":\"<p>The way that individual Amazon EC2 instances terminate when an automatic scale-in activity occurs or an instance group is resized. <code>TERMINATE_AT_INSTANCE_HOUR</code> indicates that Amazon EMR terminates nodes at the instance-hour boundary, regardless of when the request to terminate the instance was submitted. This option is only available with Amazon EMR 5.1.0 and later and is the default for clusters created using that version. <code>TERMINATE_AT_TASK_COMPLETION</code> indicates that Amazon EMR blacklists and drains tasks from nodes before terminating the Amazon EC2 instances, regardless of the instance-hour boundary. With either behavior, Amazon EMR removes the least active nodes first and blocks instance termination if it could lead to HDFS corruption. <code>TERMINATE_AT_TASK_COMPLETION</code> available only in Amazon EMR version 4.1.0 and later, and is the default for versions of Amazon EMR earlier than 5.1.0.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A description of a cluster (job flow).</p>\"\
    },\
    \"JobFlowDetailList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"JobFlowDetail\"}\
    },\
    \"JobFlowExecutionState\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The type of instance.</p>\",\
      \"enum\":[\
        \"STARTING\",\
        \"BOOTSTRAPPING\",\
        \"RUNNING\",\
        \"WAITING\",\
        \"SHUTTING_DOWN\",\
        \"TERMINATED\",\
        \"COMPLETED\",\
        \"FAILED\"\
      ]\
    },\
    \"JobFlowExecutionStateList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"JobFlowExecutionState\"}\
    },\
    \"JobFlowExecutionStatusDetail\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"State\",\
        \"CreationDateTime\"\
      ],\
      \"members\":{\
        \"State\":{\
          \"shape\":\"JobFlowExecutionState\",\
          \"documentation\":\"<p>The state of the job flow.</p>\"\
        },\
        \"CreationDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The creation date and time of the job flow.</p>\"\
        },\
        \"StartDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The start date and time of the job flow.</p>\"\
        },\
        \"ReadyDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date and time when the job flow was ready to start running bootstrap actions.</p>\"\
        },\
        \"EndDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The completion date and time of the job flow.</p>\"\
        },\
        \"LastStateChangeReason\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>Description of the job flow last changed state.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the status of the cluster (job flow).</p>\"\
    },\
    \"JobFlowInstancesConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MasterInstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The EC2 instance type of the master node.</p>\"\
        },\
        \"SlaveInstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The EC2 instance type of the core and task nodes.</p>\"\
        },\
        \"InstanceCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of EC2 instances in the cluster.</p>\"\
        },\
        \"InstanceGroups\":{\
          \"shape\":\"InstanceGroupConfigList\",\
          \"documentation\":\"<p>Configuration for the instance groups in a cluster.</p>\"\
        },\
        \"InstanceFleets\":{\
          \"shape\":\"InstanceFleetConfigList\",\
          \"documentation\":\"<note> <p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p> </note> <p>Describes the EC2 instances and instance configurations for clusters that use the instance fleet configuration.</p>\"\
        },\
        \"Ec2KeyName\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The name of the EC2 key pair that can be used to ssh to the master node as the user called \\\"hadoop.\\\"</p>\"\
        },\
        \"Placement\":{\
          \"shape\":\"PlacementType\",\
          \"documentation\":\"<p>The Availability Zone in which the cluster runs.</p>\"\
        },\
        \"KeepJobFlowAliveWhenNoSteps\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether the cluster should remain available after completing all steps.</p>\"\
        },\
        \"TerminationProtected\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether to lock the cluster to prevent the Amazon EC2 instances from being terminated by API call, user intervention, or in the event of a job-flow error.</p>\"\
        },\
        \"HadoopVersion\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>Applies only to Amazon EMR release versions earlier than 4.0. The Hadoop version for the cluster. Valid inputs are \\\"0.18\\\" (deprecated), \\\"0.20\\\" (deprecated), \\\"0.20.205\\\" (deprecated), \\\"1.0.3\\\", \\\"2.2.0\\\", or \\\"2.4.0\\\". If you do not set this value, the default of 0.18 is used, unless the <code>AmiVersion</code> parameter is set in the RunJobFlow call, in which case the default version of Hadoop for that AMI version is used.</p>\"\
        },\
        \"Ec2SubnetId\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>Applies to clusters that use the uniform instance group configuration. To launch the cluster in Amazon Virtual Private Cloud (Amazon VPC), set this parameter to the identifier of the Amazon VPC subnet where you want the cluster to launch. If you do not specify this value and your account supports EC2-Classic, the cluster launches in EC2-Classic.</p>\"\
        },\
        \"Ec2SubnetIds\":{\
          \"shape\":\"XmlStringMaxLen256List\",\
          \"documentation\":\"<p>Applies to clusters that use the instance fleet configuration. When multiple EC2 subnet IDs are specified, Amazon EMR evaluates them and launches instances in the optimal subnet.</p> <note> <p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p> </note>\"\
        },\
        \"EmrManagedMasterSecurityGroup\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The identifier of the Amazon EC2 security group for the master node.</p>\"\
        },\
        \"EmrManagedSlaveSecurityGroup\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The identifier of the Amazon EC2 security group for the core and task nodes.</p>\"\
        },\
        \"ServiceAccessSecurityGroup\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The identifier of the Amazon EC2 security group for the Amazon EMR service to access clusters in VPC private subnets.</p>\"\
        },\
        \"AdditionalMasterSecurityGroups\":{\
          \"shape\":\"SecurityGroupsList\",\
          \"documentation\":\"<p>A list of additional Amazon EC2 security group IDs for the master node.</p>\"\
        },\
        \"AdditionalSlaveSecurityGroups\":{\
          \"shape\":\"SecurityGroupsList\",\
          \"documentation\":\"<p>A list of additional Amazon EC2 security group IDs for the core and task nodes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A description of the Amazon EC2 instance on which the cluster (job flow) runs. A valid JobFlowInstancesConfig must contain either InstanceGroups or InstanceFleets, which is the recommended configuration. They cannot be used together. You may also have MasterInstanceType, SlaveInstanceType, and InstanceCount (all three must be present), but we don't recommend this configuration.</p>\"\
    },\
    \"JobFlowInstancesDetail\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MasterInstanceType\",\
        \"SlaveInstanceType\",\
        \"InstanceCount\"\
      ],\
      \"members\":{\
        \"MasterInstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The Amazon EC2 master node instance type.</p>\"\
        },\
        \"MasterPublicDnsName\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The DNS name of the master node. If the cluster is on a private subnet, this is the private DNS name. On a public subnet, this is the public DNS name.</p>\"\
        },\
        \"MasterInstanceId\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The Amazon EC2 instance identifier of the master node.</p>\"\
        },\
        \"SlaveInstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The Amazon EC2 core and task node instance type.</p>\"\
        },\
        \"InstanceCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of Amazon EC2 instances in the cluster. If the value is 1, the same instance serves as both the master and core and task node. If the value is greater than 1, one instance is the master node and all others are core and task nodes.</p>\"\
        },\
        \"InstanceGroups\":{\
          \"shape\":\"InstanceGroupDetailList\",\
          \"documentation\":\"<p>Details about the instance groups in a cluster.</p>\"\
        },\
        \"NormalizedInstanceHours\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>An approximation of the cost of the cluster, represented in m1.small/hours. This value is incremented one time for every hour that an m1.small runs. Larger instances are weighted more, so an Amazon EC2 instance that is roughly four times more expensive would result in the normalized instance hours being incremented by four. This result is only an approximation and does not reflect the actual billing rate.</p>\"\
        },\
        \"Ec2KeyName\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The name of an Amazon EC2 key pair that can be used to ssh to the master node.</p>\"\
        },\
        \"Ec2SubnetId\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>For clusters launched within Amazon Virtual Private Cloud, this is the identifier of the subnet where the cluster was launched.</p>\"\
        },\
        \"Placement\":{\
          \"shape\":\"PlacementType\",\
          \"documentation\":\"<p>The Amazon EC2 Availability Zone for the cluster.</p>\"\
        },\
        \"KeepJobFlowAliveWhenNoSteps\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether the cluster should remain available after completing all steps.</p>\"\
        },\
        \"TerminationProtected\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether the Amazon EC2 instances in the cluster are protected from termination by API calls, user intervention, or in the event of a job-flow error.</p>\"\
        },\
        \"HadoopVersion\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The Hadoop version for the cluster.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specify the type of Amazon EC2 instances that the cluster (job flow) runs on.</p>\"\
    },\
    \"KerberosAttributes\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Realm\",\
        \"KdcAdminPassword\"\
      ],\
      \"members\":{\
        \"Realm\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The name of the Kerberos realm to which all nodes in a cluster belong. For example, <code>EC2.INTERNAL</code>. </p>\"\
        },\
        \"KdcAdminPassword\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The password used within the cluster for the kadmin service on the cluster-dedicated KDC, which maintains Kerberos principals, password policies, and keytabs for the cluster.</p>\"\
        },\
        \"CrossRealmTrustPrincipalPassword\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>Required only when establishing a cross-realm trust with a KDC in a different realm. The cross-realm principal password, which must be identical across realms.</p>\"\
        },\
        \"ADDomainJoinUser\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>Required only when establishing a cross-realm trust with an Active Directory domain. A user with sufficient privileges to join resources to the domain.</p>\"\
        },\
        \"ADDomainJoinPassword\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The Active Directory password for <code>ADDomainJoinUser</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Attributes for Kerberos configuration when Kerberos authentication is enabled using a security configuration. For more information see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html\\\">Use Kerberos Authentication</a> in the <i>EMR Management Guide</i>.</p>\"\
    },\
    \"KeyValue\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The unique identifier of a key value pair.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The value part of the identified key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A key value pair.</p>\"\
    },\
    \"KeyValueList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"KeyValue\"}\
    },\
    \"ListBootstrapActionsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ClusterId\"],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>The cluster identifier for the bootstrap actions to list.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The pagination token that indicates the next set of results to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This input determines which bootstrap actions to retrieve.</p>\"\
    },\
    \"ListBootstrapActionsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BootstrapActions\":{\
          \"shape\":\"CommandList\",\
          \"documentation\":\"<p>The bootstrap actions associated with the cluster.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The pagination token that indicates the next set of results to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This output contains the bootstrap actions detail.</p>\"\
    },\
    \"ListClustersInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreatedAfter\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The creation date and time beginning value filter for listing clusters.</p>\"\
        },\
        \"CreatedBefore\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The creation date and time end value filter for listing clusters.</p>\"\
        },\
        \"ClusterStates\":{\
          \"shape\":\"ClusterStateList\",\
          \"documentation\":\"<p>The cluster state filters to apply when listing clusters.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The pagination token that indicates the next set of results to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This input determines how the ListClusters action filters the list of clusters that it returns.</p>\"\
    },\
    \"ListClustersOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Clusters\":{\
          \"shape\":\"ClusterSummaryList\",\
          \"documentation\":\"<p>The list of clusters for the account based on the given filters.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The pagination token that indicates the next set of results to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This contains a ClusterSummaryList with the cluster details; for example, the cluster IDs, names, and status.</p>\"\
    },\
    \"ListInstanceFleetsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ClusterId\"],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>The unique identifier of the cluster.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The pagination token that indicates the next set of results to retrieve.</p>\"\
        }\
      }\
    },\
    \"ListInstanceFleetsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceFleets\":{\
          \"shape\":\"InstanceFleetList\",\
          \"documentation\":\"<p>The list of instance fleets for the cluster and given filters.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The pagination token that indicates the next set of results to retrieve.</p>\"\
        }\
      }\
    },\
    \"ListInstanceGroupsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ClusterId\"],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>The identifier of the cluster for which to list the instance groups.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The pagination token that indicates the next set of results to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This input determines which instance groups to retrieve.</p>\"\
    },\
    \"ListInstanceGroupsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceGroups\":{\
          \"shape\":\"InstanceGroupList\",\
          \"documentation\":\"<p>The list of instance groups for the cluster and given filters.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The pagination token that indicates the next set of results to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This input determines which instance groups to retrieve.</p>\"\
    },\
    \"ListInstancesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ClusterId\"],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>The identifier of the cluster for which to list the instances.</p>\"\
        },\
        \"InstanceGroupId\":{\
          \"shape\":\"InstanceGroupId\",\
          \"documentation\":\"<p>The identifier of the instance group for which to list the instances.</p>\"\
        },\
        \"InstanceGroupTypes\":{\
          \"shape\":\"InstanceGroupTypeList\",\
          \"documentation\":\"<p>The type of instance group for which to list the instances.</p>\"\
        },\
        \"InstanceFleetId\":{\
          \"shape\":\"InstanceFleetId\",\
          \"documentation\":\"<p>The unique identifier of the instance fleet.</p>\"\
        },\
        \"InstanceFleetType\":{\
          \"shape\":\"InstanceFleetType\",\
          \"documentation\":\"<p>The node type of the instance fleet. For example MASTER, CORE, or TASK.</p>\"\
        },\
        \"InstanceStates\":{\
          \"shape\":\"InstanceStateList\",\
          \"documentation\":\"<p>A list of instance states that will filter the instances returned with this request.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The pagination token that indicates the next set of results to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This input determines which instances to list.</p>\"\
    },\
    \"ListInstancesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Instances\":{\
          \"shape\":\"InstanceList\",\
          \"documentation\":\"<p>The list of instances for the cluster and given filters.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The pagination token that indicates the next set of results to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This output contains the list of instances.</p>\"\
    },\
    \"ListSecurityConfigurationsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The pagination token that indicates the set of results to retrieve.</p>\"\
        }\
      }\
    },\
    \"ListSecurityConfigurationsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecurityConfigurations\":{\
          \"shape\":\"SecurityConfigurationList\",\
          \"documentation\":\"<p>The creation date and time, and name, of each security configuration.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>A pagination token that indicates the next set of results to retrieve. Include the marker in the next ListSecurityConfiguration call to retrieve the next page of results, if required.</p>\"\
        }\
      }\
    },\
    \"ListStepsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ClusterId\"],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>The identifier of the cluster for which to list the steps.</p>\"\
        },\
        \"StepStates\":{\
          \"shape\":\"StepStateList\",\
          \"documentation\":\"<p>The filter to limit the step list based on certain states.</p>\"\
        },\
        \"StepIds\":{\
          \"shape\":\"XmlStringList\",\
          \"documentation\":\"<p>The filter to limit the step list based on the identifier of the steps. You can specify a maximum of ten Step IDs. The character constraint applies to the overall length of the array.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The pagination token that indicates the next set of results to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This input determines which steps to list.</p>\"\
    },\
    \"ListStepsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Steps\":{\
          \"shape\":\"StepSummaryList\",\
          \"documentation\":\"<p>The filtered list of steps for the cluster.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The pagination token that indicates the next set of results to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This output contains the list of steps returned in reverse order. This means that the last step is the first element in the list.</p>\"\
    },\
    \"Long\":{\"type\":\"long\"},\
    \"ManagedScalingPolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ComputeLimits\":{\
          \"shape\":\"ComputeLimits\",\
          \"documentation\":\"<p> The EC2 unit limits for a managed scaling policy. The managed scaling activity of a cluster is not allowed to go above or below these limits. The limit only applies to the core and task nodes. The master node cannot be scaled after initial configuration. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Managed scaling policy for an Amazon EMR cluster. The policy specifies the limits for resources that can be added or terminated from a cluster. The policy only applies to the core and task nodes. The master node cannot be scaled after initial configuration. </p>\"\
    },\
    \"Marker\":{\"type\":\"string\"},\
    \"MarketType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ON_DEMAND\",\
        \"SPOT\"\
      ]\
    },\
    \"MetricDimension\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The dimension name.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The dimension value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A CloudWatch dimension, which is specified using a <code>Key</code> (known as a <code>Name</code> in CloudWatch), <code>Value</code> pair. By default, Amazon EMR uses one dimension whose <code>Key</code> is <code>JobFlowID</code> and <code>Value</code> is a variable representing the cluster ID, which is <code>${emr.clusterId}</code>. This enables the rule to bootstrap when the cluster ID becomes available.</p>\"\
    },\
    \"MetricDimensionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricDimension\"}\
    },\
    \"ModifyClusterInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ClusterId\"],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The unique identifier of the cluster.</p>\"\
        },\
        \"StepConcurrencyLevel\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of steps that can be executed concurrently. You can specify a maximum of 256 steps. </p>\"\
        }\
      }\
    },\
    \"ModifyClusterOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StepConcurrencyLevel\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of steps that can be executed concurrently.</p>\"\
        }\
      }\
    },\
    \"ModifyInstanceFleetInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClusterId\",\
        \"InstanceFleet\"\
      ],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>The unique identifier of the cluster.</p>\"\
        },\
        \"InstanceFleet\":{\
          \"shape\":\"InstanceFleetModifyConfig\",\
          \"documentation\":\"<p>The unique identifier of the instance fleet.</p>\"\
        }\
      }\
    },\
    \"ModifyInstanceGroupsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>The ID of the cluster to which the instance group belongs.</p>\"\
        },\
        \"InstanceGroups\":{\
          \"shape\":\"InstanceGroupModifyConfigList\",\
          \"documentation\":\"<p>Instance groups to change.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Change the size of some instance groups.</p>\"\
    },\
    \"NewSupportedProductsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SupportedProductConfig\"}\
    },\
    \"NonNegativeDouble\":{\
      \"type\":\"double\",\
      \"min\":0.0\
    },\
    \"OptionalArnType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":0\
    },\
    \"PlacementType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AvailabilityZone\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The Amazon EC2 Availability Zone for the cluster. <code>AvailabilityZone</code> is used for uniform instance groups, while <code>AvailabilityZones</code> (plural) is used for instance fleets.</p>\"\
        },\
        \"AvailabilityZones\":{\
          \"shape\":\"XmlStringMaxLen256List\",\
          \"documentation\":\"<p>When multiple Availability Zones are specified, Amazon EMR evaluates them and launches instances in the optimal Availability Zone. <code>AvailabilityZones</code> is used for instance fleets, while <code>AvailabilityZone</code> (singular) is used for uniform instance groups.</p> <note> <p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The Amazon EC2 Availability Zone configuration of the cluster (job flow).</p>\"\
    },\
    \"Port\":{\
      \"type\":\"integer\",\
      \"max\":65535,\
      \"min\":0\
    },\
    \"PortRange\":{\
      \"type\":\"structure\",\
      \"required\":[\"MinRange\"],\
      \"members\":{\
        \"MinRange\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>The smallest port number in a specified range of port numbers.</p>\"\
        },\
        \"MaxRange\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>The smallest port number in a specified range of port numbers.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of port ranges that are permitted to allow inbound traffic from all public IP addresses. To specify a single port, use the same value for <code>MinRange</code> and <code>MaxRange</code>.</p>\"\
    },\
    \"PortRanges\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PortRange\"}\
    },\
    \"PutAutoScalingPolicyInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClusterId\",\
        \"InstanceGroupId\",\
        \"AutoScalingPolicy\"\
      ],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>Specifies the ID of a cluster. The instance group to which the automatic scaling policy is applied is within this cluster.</p>\"\
        },\
        \"InstanceGroupId\":{\
          \"shape\":\"InstanceGroupId\",\
          \"documentation\":\"<p>Specifies the ID of the instance group to which the automatic scaling policy is applied.</p>\"\
        },\
        \"AutoScalingPolicy\":{\
          \"shape\":\"AutoScalingPolicy\",\
          \"documentation\":\"<p>Specifies the definition of the automatic scaling policy.</p>\"\
        }\
      }\
    },\
    \"PutAutoScalingPolicyOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>Specifies the ID of a cluster. The instance group to which the automatic scaling policy is applied is within this cluster.</p>\"\
        },\
        \"InstanceGroupId\":{\
          \"shape\":\"InstanceGroupId\",\
          \"documentation\":\"<p>Specifies the ID of the instance group to which the scaling policy is applied.</p>\"\
        },\
        \"AutoScalingPolicy\":{\
          \"shape\":\"AutoScalingPolicyDescription\",\
          \"documentation\":\"<p>The automatic scaling policy definition.</p>\"\
        },\
        \"ClusterArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name of the cluster.</p>\"\
        }\
      }\
    },\
    \"PutBlockPublicAccessConfigurationInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BlockPublicAccessConfiguration\"],\
      \"members\":{\
        \"BlockPublicAccessConfiguration\":{\
          \"shape\":\"BlockPublicAccessConfiguration\",\
          \"documentation\":\"<p>A configuration for Amazon EMR block public access. The configuration applies to all clusters created in your account for the current Region. The configuration specifies whether block public access is enabled. If block public access is enabled, security groups associated with the cluster cannot have rules that allow inbound traffic from 0.0.0.0/0 or ::/0 on a port, unless the port is specified as an exception using <code>PermittedPublicSecurityGroupRuleRanges</code> in the <code>BlockPublicAccessConfiguration</code>. By default, Port 22 (SSH) is an exception, and public access is allowed on this port. You can change this by updating <code>BlockPublicSecurityGroupRules</code> to remove the exception.</p> <note> <p>For accounts that created clusters in a Region before November 25, 2019, block public access is disabled by default in that Region. To use this feature, you must manually enable and configure it. For accounts that did not create an EMR cluster in a Region before this date, block public access is enabled by default in that Region.</p> </note>\"\
        }\
      }\
    },\
    \"PutBlockPublicAccessConfigurationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"PutManagedScalingPolicyInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClusterId\",\
        \"ManagedScalingPolicy\"\
      ],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p> Specifies the ID of an EMR cluster where the managed scaling policy is attached. </p>\"\
        },\
        \"ManagedScalingPolicy\":{\
          \"shape\":\"ManagedScalingPolicy\",\
          \"documentation\":\"<p> Specifies the constraints for the managed scaling policy. </p>\"\
        }\
      }\
    },\
    \"PutManagedScalingPolicyOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"RemoveAutoScalingPolicyInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClusterId\",\
        \"InstanceGroupId\"\
      ],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p>Specifies the ID of a cluster. The instance group to which the automatic scaling policy is applied is within this cluster.</p>\"\
        },\
        \"InstanceGroupId\":{\
          \"shape\":\"InstanceGroupId\",\
          \"documentation\":\"<p>Specifies the ID of the instance group to which the scaling policy is applied.</p>\"\
        }\
      }\
    },\
    \"RemoveAutoScalingPolicyOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"RemoveManagedScalingPolicyInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ClusterId\"],\
      \"members\":{\
        \"ClusterId\":{\
          \"shape\":\"ClusterId\",\
          \"documentation\":\"<p> Specifies the ID of the cluster from which the managed scaling policy will be removed. </p>\"\
        }\
      }\
    },\
    \"RemoveManagedScalingPolicyOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"RemoveTagsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceId\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The Amazon EMR resource identifier from which tags will be removed. This value must be a cluster identifier.</p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>A list of tag keys to remove from a resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This input identifies a cluster and a list of tags to remove.</p>\"\
    },\
    \"RemoveTagsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>This output indicates the result of removing tags from a resource.</p>\"\
    },\
    \"RepoUpgradeOnBoot\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SECURITY\",\
        \"NONE\"\
      ]\
    },\
    \"ResourceId\":{\"type\":\"string\"},\
    \"RunJobFlowInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Instances\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The name of the job flow.</p>\"\
        },\
        \"LogUri\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The location in Amazon S3 to write the log files of the job flow. If a value is not provided, logs are not created.</p>\"\
        },\
        \"LogEncryptionKmsKeyId\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The AWS KMS customer master key (CMK) used for encrypting log files. If a value is not provided, the logs will remain encrypted by AES-256. This attribute is only available with EMR version 5.30.0 and later, excluding EMR 6.0.0.</p>\"\
        },\
        \"AdditionalInfo\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A JSON string for selecting additional features.</p>\"\
        },\
        \"AmiVersion\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>Applies only to Amazon EMR AMI versions 3.x and 2.x. For Amazon EMR releases 4.0 and later, <code>ReleaseLabel</code> is used. To specify a custom AMI, use <code>CustomAmiID</code>.</p>\"\
        },\
        \"ReleaseLabel\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The Amazon EMR release label, which determines the version of open-source application packages installed on the cluster. Release labels are in the form <code>emr-x.x.x</code>, where x.x.x is an Amazon EMR release version such as <code>emr-5.14.0</code>. For more information about Amazon EMR release versions and included application versions and features, see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ReleaseGuide/\\\">https://docs.aws.amazon.com/emr/latest/ReleaseGuide/</a>. The release label applies only to Amazon EMR releases version 4.0 and later. Earlier versions use <code>AmiVersion</code>.</p>\"\
        },\
        \"Instances\":{\
          \"shape\":\"JobFlowInstancesConfig\",\
          \"documentation\":\"<p>A specification of the number and type of Amazon EC2 instances.</p>\"\
        },\
        \"Steps\":{\
          \"shape\":\"StepConfigList\",\
          \"documentation\":\"<p>A list of steps to run.</p>\"\
        },\
        \"BootstrapActions\":{\
          \"shape\":\"BootstrapActionConfigList\",\
          \"documentation\":\"<p>A list of bootstrap actions to run before Hadoop starts on the cluster nodes.</p>\"\
        },\
        \"SupportedProducts\":{\
          \"shape\":\"SupportedProductsList\",\
          \"documentation\":\"<note> <p>For Amazon EMR releases 3.x and 2.x. For Amazon EMR releases 4.x and later, use Applications.</p> </note> <p>A list of strings that indicates third-party software to use. For more information, see the <a href=\\\"https://docs.aws.amazon.com/emr/latest/DeveloperGuide/emr-dg.pdf\\\">Amazon EMR Developer Guide</a>. Currently supported values are:</p> <ul> <li> <p>\\\"mapr-m3\\\" - launch the job flow using MapR M3 Edition.</p> </li> <li> <p>\\\"mapr-m5\\\" - launch the job flow using MapR M5 Edition.</p> </li> </ul>\"\
        },\
        \"NewSupportedProducts\":{\
          \"shape\":\"NewSupportedProductsList\",\
          \"documentation\":\"<note> <p>For Amazon EMR releases 3.x and 2.x. For Amazon EMR releases 4.x and later, use Applications.</p> </note> <p>A list of strings that indicates third-party software to use with the job flow that accepts a user argument list. EMR accepts and forwards the argument list to the corresponding installation script as bootstrap action arguments. For more information, see \\\"Launch a Job Flow on the MapR Distribution for Hadoop\\\" in the <a href=\\\"https://docs.aws.amazon.com/emr/latest/DeveloperGuide/emr-dg.pdf\\\">Amazon EMR Developer Guide</a>. Supported values are:</p> <ul> <li> <p>\\\"mapr-m3\\\" - launch the cluster using MapR M3 Edition.</p> </li> <li> <p>\\\"mapr-m5\\\" - launch the cluster using MapR M5 Edition.</p> </li> <li> <p>\\\"mapr\\\" with the user arguments specifying \\\"--edition,m3\\\" or \\\"--edition,m5\\\" - launch the job flow using MapR M3 or M5 Edition respectively.</p> </li> <li> <p>\\\"mapr-m7\\\" - launch the cluster using MapR M7 Edition.</p> </li> <li> <p>\\\"hunk\\\" - launch the cluster with the Hunk Big Data Analtics Platform.</p> </li> <li> <p>\\\"hue\\\"- launch the cluster with Hue installed.</p> </li> <li> <p>\\\"spark\\\" - launch the cluster with Apache Spark installed.</p> </li> <li> <p>\\\"ganglia\\\" - launch the cluster with the Ganglia Monitoring System installed.</p> </li> </ul>\"\
        },\
        \"Applications\":{\
          \"shape\":\"ApplicationList\",\
          \"documentation\":\"<p>Applies to Amazon EMR releases 4.0 and later. A case-insensitive list of applications for Amazon EMR to install and configure when launching the cluster. For a list of applications available for each Amazon EMR release version, see the <a href=\\\"https://docs.aws.amazon.com/emr/latest/ReleaseGuide/\\\">Amazon EMR Release Guide</a>.</p>\"\
        },\
        \"Configurations\":{\
          \"shape\":\"ConfigurationList\",\
          \"documentation\":\"<p>For Amazon EMR releases 4.0 and later. The list of configurations supplied for the EMR cluster you are creating.</p>\"\
        },\
        \"VisibleToAllUsers\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>A value of <code>true</code> indicates that all IAM users in the AWS account can perform cluster actions if they have the proper IAM policy permissions. This is the default. A value of <code>false</code> indicates that only the IAM user who created the cluster can perform actions.</p>\"\
        },\
        \"JobFlowRole\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>Also called instance profile and EC2 role. An IAM role for an EMR cluster. The EC2 instances of the cluster assume this role. The default role is <code>EMR_EC2_DefaultRole</code>. In order to use the default role, you must have already created it using the CLI or console.</p>\"\
        },\
        \"ServiceRole\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The IAM role that will be assumed by the Amazon EMR service to access AWS resources on your behalf.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of tags to associate with a cluster and propagate to Amazon EC2 instances.</p>\"\
        },\
        \"SecurityConfiguration\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The name of a security configuration to apply to the cluster.</p>\"\
        },\
        \"AutoScalingRole\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>An IAM role for automatic scaling policies. The default role is <code>EMR_AutoScaling_DefaultRole</code>. The IAM role provides permissions that the automatic scaling feature requires to launch and terminate EC2 instances in an instance group.</p>\"\
        },\
        \"ScaleDownBehavior\":{\
          \"shape\":\"ScaleDownBehavior\",\
          \"documentation\":\"<p>Specifies the way that individual Amazon EC2 instances terminate when an automatic scale-in activity occurs or an instance group is resized. <code>TERMINATE_AT_INSTANCE_HOUR</code> indicates that Amazon EMR terminates nodes at the instance-hour boundary, regardless of when the request to terminate the instance was submitted. This option is only available with Amazon EMR 5.1.0 and later and is the default for clusters created using that version. <code>TERMINATE_AT_TASK_COMPLETION</code> indicates that Amazon EMR blacklists and drains tasks from nodes before terminating the Amazon EC2 instances, regardless of the instance-hour boundary. With either behavior, Amazon EMR removes the least active nodes first and blocks instance termination if it could lead to HDFS corruption. <code>TERMINATE_AT_TASK_COMPLETION</code> available only in Amazon EMR version 4.1.0 and later, and is the default for versions of Amazon EMR earlier than 5.1.0.</p>\"\
        },\
        \"CustomAmiId\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>Available only in Amazon EMR version 5.7.0 and later. The ID of a custom Amazon EBS-backed Linux AMI. If specified, Amazon EMR uses this AMI when it launches cluster EC2 instances. For more information about custom AMIs in Amazon EMR, see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-custom-ami.html\\\">Using a Custom AMI</a> in the <i>Amazon EMR Management Guide</i>. If omitted, the cluster uses the base Linux AMI for the <code>ReleaseLabel</code> specified. For Amazon EMR versions 2.x and 3.x, use <code>AmiVersion</code> instead.</p> <p>For information about creating a custom AMI, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami-ebs.html\\\">Creating an Amazon EBS-Backed Linux AMI</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux Instances</i>. For information about finding an AMI ID, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html\\\">Finding a Linux AMI</a>. </p>\"\
        },\
        \"EbsRootVolumeSize\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The size, in GiB, of the EBS root device volume of the Linux AMI that is used for each EC2 instance. Available in Amazon EMR version 4.x and later.</p>\"\
        },\
        \"RepoUpgradeOnBoot\":{\
          \"shape\":\"RepoUpgradeOnBoot\",\
          \"documentation\":\"<p>Applies only when <code>CustomAmiID</code> is used. Specifies which updates from the Amazon Linux AMI package repositories to apply automatically when the instance boots using the AMI. If omitted, the default is <code>SECURITY</code>, which indicates that only security updates are applied. If <code>NONE</code> is specified, no updates are applied, and all updates must be applied manually.</p>\"\
        },\
        \"KerberosAttributes\":{\
          \"shape\":\"KerberosAttributes\",\
          \"documentation\":\"<p>Attributes for Kerberos configuration when Kerberos authentication is enabled using a security configuration. For more information see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html\\\">Use Kerberos Authentication</a> in the <i>EMR Management Guide</i>.</p>\"\
        },\
        \"StepConcurrencyLevel\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Specifies the number of steps that can be executed concurrently. The default value is <code>1</code>. The maximum value is <code>256</code>.</p>\"\
        },\
        \"ManagedScalingPolicy\":{\
          \"shape\":\"ManagedScalingPolicy\",\
          \"documentation\":\"<p> The specified managed scaling policy for an Amazon EMR cluster. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Input to the <a>RunJobFlow</a> operation. </p>\"\
    },\
    \"RunJobFlowOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobFlowId\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>An unique identifier for the job flow.</p>\"\
        },\
        \"ClusterArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name of the cluster.</p>\"\
        }\
      },\
      \"documentation\":\"<p> The result of the <a>RunJobFlow</a> operation. </p>\"\
    },\
    \"ScaleDownBehavior\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TERMINATE_AT_INSTANCE_HOUR\",\
        \"TERMINATE_AT_TASK_COMPLETION\"\
      ]\
    },\
    \"ScalingAction\":{\
      \"type\":\"structure\",\
      \"required\":[\"SimpleScalingPolicyConfiguration\"],\
      \"members\":{\
        \"Market\":{\
          \"shape\":\"MarketType\",\
          \"documentation\":\"<p>Not available for instance groups. Instance groups use the market type specified for the group.</p>\"\
        },\
        \"SimpleScalingPolicyConfiguration\":{\
          \"shape\":\"SimpleScalingPolicyConfiguration\",\
          \"documentation\":\"<p>The type of adjustment the automatic scaling activity makes when triggered, and the periodicity of the adjustment.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The type of adjustment the automatic scaling activity makes when triggered, and the periodicity of the adjustment.</p>\"\
    },\
    \"ScalingConstraints\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MinCapacity\",\
        \"MaxCapacity\"\
      ],\
      \"members\":{\
        \"MinCapacity\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The lower boundary of EC2 instances in an instance group below which scaling activities are not allowed to shrink. Scale-in activities will not terminate instances below this boundary.</p>\"\
        },\
        \"MaxCapacity\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The upper boundary of EC2 instances in an instance group beyond which scaling activities are not allowed to grow. Scale-out activities will not add instances beyond this boundary.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The upper and lower EC2 instance limits for an automatic scaling policy. Automatic scaling activities triggered by automatic scaling rules will not cause an instance group to grow above or below these limits.</p>\"\
    },\
    \"ScalingRule\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Action\",\
        \"Trigger\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name used to identify an automatic scaling rule. Rule names must be unique within a scaling policy.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A friendly, more verbose description of the automatic scaling rule.</p>\"\
        },\
        \"Action\":{\
          \"shape\":\"ScalingAction\",\
          \"documentation\":\"<p>The conditions that trigger an automatic scaling activity.</p>\"\
        },\
        \"Trigger\":{\
          \"shape\":\"ScalingTrigger\",\
          \"documentation\":\"<p>The CloudWatch alarm definition that determines when automatic scaling activity is triggered.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A scale-in or scale-out rule that defines scaling activity, including the CloudWatch metric alarm that triggers activity, how EC2 instances are added or removed, and the periodicity of adjustments. The automatic scaling policy for an instance group can comprise one or more automatic scaling rules.</p>\"\
    },\
    \"ScalingRuleList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ScalingRule\"}\
    },\
    \"ScalingTrigger\":{\
      \"type\":\"structure\",\
      \"required\":[\"CloudWatchAlarmDefinition\"],\
      \"members\":{\
        \"CloudWatchAlarmDefinition\":{\
          \"shape\":\"CloudWatchAlarmDefinition\",\
          \"documentation\":\"<p>The definition of a CloudWatch metric alarm. When the defined alarm conditions are met along with other trigger parameters, scaling activity begins.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The conditions that trigger an automatic scaling activity.</p>\"\
    },\
    \"ScriptBootstrapActionConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"Path\"],\
      \"members\":{\
        \"Path\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>Location of the script to run during a bootstrap action. Can be either a location in Amazon S3 or on a local file system.</p>\"\
        },\
        \"Args\":{\
          \"shape\":\"XmlStringList\",\
          \"documentation\":\"<p>A list of command line arguments to pass to the bootstrap action script.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration of the script to run during a bootstrap action.</p>\"\
    },\
    \"SecurityConfigurationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityConfigurationSummary\"}\
    },\
    \"SecurityConfigurationSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The name of the security configuration.</p>\"\
        },\
        \"CreationDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date and time the security configuration was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The creation date and time, and name, of a security configuration.</p>\"\
    },\
    \"SecurityGroupsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen256\"}\
    },\
    \"SetTerminationProtectionInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"JobFlowIds\",\
        \"TerminationProtected\"\
      ],\
      \"members\":{\
        \"JobFlowIds\":{\
          \"shape\":\"XmlStringList\",\
          \"documentation\":\"<p> A list of strings that uniquely identify the clusters to protect. This identifier is returned by <a>RunJobFlow</a> and can also be obtained from <a>DescribeJobFlows</a> . </p>\"\
        },\
        \"TerminationProtected\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>A Boolean that indicates whether to protect the cluster and prevent the Amazon EC2 instances in the cluster from shutting down due to API calls, user intervention, or job-flow error.</p>\"\
        }\
      },\
      \"documentation\":\"<p> The input argument to the <a>TerminationProtection</a> operation. </p>\"\
    },\
    \"SetVisibleToAllUsersInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"JobFlowIds\",\
        \"VisibleToAllUsers\"\
      ],\
      \"members\":{\
        \"JobFlowIds\":{\
          \"shape\":\"XmlStringList\",\
          \"documentation\":\"<p>The unique identifier of the job flow (cluster).</p>\"\
        },\
        \"VisibleToAllUsers\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>A value of <code>true</code> indicates that all IAM users in the AWS account can perform cluster actions if they have the proper IAM policy permissions. This is the default. A value of <code>false</code> indicates that only the IAM user who created the cluster can perform actions.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input to the SetVisibleToAllUsers action.</p>\"\
    },\
    \"ShrinkPolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DecommissionTimeout\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The desired timeout for decommissioning an instance. Overrides the default YARN decommissioning timeout.</p>\"\
        },\
        \"InstanceResizePolicy\":{\
          \"shape\":\"InstanceResizePolicy\",\
          \"documentation\":\"<p>Custom policy for requesting termination protection or termination of specific instances when shrinking an instance group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Policy for customizing shrink operations. Allows configuration of decommissioning timeout and targeted instance shrinking.</p>\"\
    },\
    \"SimpleScalingPolicyConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"ScalingAdjustment\"],\
      \"members\":{\
        \"AdjustmentType\":{\
          \"shape\":\"AdjustmentType\",\
          \"documentation\":\"<p>The way in which EC2 instances are added (if <code>ScalingAdjustment</code> is a positive number) or terminated (if <code>ScalingAdjustment</code> is a negative number) each time the scaling activity is triggered. <code>CHANGE_IN_CAPACITY</code> is the default. <code>CHANGE_IN_CAPACITY</code> indicates that the EC2 instance count increments or decrements by <code>ScalingAdjustment</code>, which should be expressed as an integer. <code>PERCENT_CHANGE_IN_CAPACITY</code> indicates the instance count increments or decrements by the percentage specified by <code>ScalingAdjustment</code>, which should be expressed as an integer. For example, 20 indicates an increase in 20% increments of cluster capacity. <code>EXACT_CAPACITY</code> indicates the scaling activity results in an instance group with the number of EC2 instances specified by <code>ScalingAdjustment</code>, which should be expressed as a positive integer.</p>\"\
        },\
        \"ScalingAdjustment\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The amount by which to scale in or scale out, based on the specified <code>AdjustmentType</code>. A positive value adds to the instance group's EC2 instance count while a negative number removes instances. If <code>AdjustmentType</code> is set to <code>EXACT_CAPACITY</code>, the number should only be a positive integer. If <code>AdjustmentType</code> is set to <code>PERCENT_CHANGE_IN_CAPACITY</code>, the value should express the percentage as an integer. For example, -20 indicates a decrease in 20% increments of cluster capacity.</p>\"\
        },\
        \"CoolDown\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The amount of time, in seconds, after a scaling activity completes before any further trigger-related scaling activities can start. The default value is 0.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An automatic scaling configuration, which describes how the policy adds or removes instances, the cooldown period, and the number of EC2 instances that will be added each time the CloudWatch metric alarm condition is satisfied.</p>\"\
    },\
    \"SpotProvisioningSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TimeoutDurationMinutes\",\
        \"TimeoutAction\"\
      ],\
      \"members\":{\
        \"TimeoutDurationMinutes\":{\
          \"shape\":\"WholeNumber\",\
          \"documentation\":\"<p>The spot provisioning timeout period in minutes. If Spot instances are not provisioned within this time period, the <code>TimeOutAction</code> is taken. Minimum value is 5 and maximum value is 1440. The timeout applies only during initial provisioning, when the cluster is first created.</p>\"\
        },\
        \"TimeoutAction\":{\
          \"shape\":\"SpotProvisioningTimeoutAction\",\
          \"documentation\":\"<p>The action to take when <code>TargetSpotCapacity</code> has not been fulfilled when the <code>TimeoutDurationMinutes</code> has expired; that is, when all Spot instances could not be provisioned within the Spot provisioning timeout. Valid values are <code>TERMINATE_CLUSTER</code> and <code>SWITCH_TO_ON_DEMAND</code>. SWITCH_TO_ON_DEMAND specifies that if no Spot instances are available, On-Demand Instances should be provisioned to fulfill any remaining Spot capacity.</p>\"\
        },\
        \"BlockDurationMinutes\":{\
          \"shape\":\"WholeNumber\",\
          \"documentation\":\"<p>The defined duration for Spot instances (also known as Spot blocks) in minutes. When specified, the Spot instance does not terminate before the defined duration expires, and defined duration pricing for Spot instances applies. Valid values are 60, 120, 180, 240, 300, or 360. The duration period starts as soon as a Spot instance receives its instance ID. At the end of the duration, Amazon EC2 marks the Spot instance for termination and provides a Spot instance termination notice, which gives the instance a two-minute warning before it terminates. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The launch specification for Spot instances in the instance fleet, which determines the defined duration and provisioning timeout behavior.</p> <note> <p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p> </note>\"\
    },\
    \"SpotProvisioningTimeoutAction\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SWITCH_TO_ON_DEMAND\",\
        \"TERMINATE_CLUSTER\"\
      ]\
    },\
    \"Statistic\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SAMPLE_COUNT\",\
        \"AVERAGE\",\
        \"SUM\",\
        \"MINIMUM\",\
        \"MAXIMUM\"\
      ]\
    },\
    \"Step\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"StepId\",\
          \"documentation\":\"<p>The identifier of the cluster step.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cluster step.</p>\"\
        },\
        \"Config\":{\
          \"shape\":\"HadoopStepConfig\",\
          \"documentation\":\"<p>The Hadoop job configuration of the cluster step.</p>\"\
        },\
        \"ActionOnFailure\":{\
          \"shape\":\"ActionOnFailure\",\
          \"documentation\":\"<p>The action to take when the cluster step fails. Possible values are TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE. TERMINATE_JOB_FLOW is provided for backward compatibility. We recommend using TERMINATE_CLUSTER instead.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StepStatus\",\
          \"documentation\":\"<p>The current execution status details of the cluster step.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This represents a step in a cluster.</p>\"\
    },\
    \"StepCancellationOption\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SEND_INTERRUPT\",\
        \"TERMINATE_PROCESS\"\
      ]\
    },\
    \"StepConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"HadoopJarStep\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The name of the step.</p>\"\
        },\
        \"ActionOnFailure\":{\
          \"shape\":\"ActionOnFailure\",\
          \"documentation\":\"<p>The action to take when the cluster step fails. Possible values are TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE. TERMINATE_JOB_FLOW is provided for backward compatibility. We recommend using TERMINATE_CLUSTER instead.</p>\"\
        },\
        \"HadoopJarStep\":{\
          \"shape\":\"HadoopJarStepConfig\",\
          \"documentation\":\"<p>The JAR file used for the step.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specification of a cluster (job flow) step.</p>\"\
    },\
    \"StepConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StepConfig\"}\
    },\
    \"StepDetail\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StepConfig\",\
        \"ExecutionStatusDetail\"\
      ],\
      \"members\":{\
        \"StepConfig\":{\
          \"shape\":\"StepConfig\",\
          \"documentation\":\"<p>The step configuration.</p>\"\
        },\
        \"ExecutionStatusDetail\":{\
          \"shape\":\"StepExecutionStatusDetail\",\
          \"documentation\":\"<p>The description of the step status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Combines the execution state and configuration of a step.</p>\"\
    },\
    \"StepDetailList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StepDetail\"}\
    },\
    \"StepExecutionState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"RUNNING\",\
        \"CONTINUE\",\
        \"COMPLETED\",\
        \"CANCELLED\",\
        \"FAILED\",\
        \"INTERRUPTED\"\
      ]\
    },\
    \"StepExecutionStatusDetail\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"State\",\
        \"CreationDateTime\"\
      ],\
      \"members\":{\
        \"State\":{\
          \"shape\":\"StepExecutionState\",\
          \"documentation\":\"<p>The state of the step.</p>\"\
        },\
        \"CreationDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The creation date and time of the step.</p>\"\
        },\
        \"StartDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The start date and time of the step.</p>\"\
        },\
        \"EndDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The completion date and time of the step.</p>\"\
        },\
        \"LastStateChangeReason\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A description of the step's current state.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The execution state of a step.</p>\"\
    },\
    \"StepId\":{\"type\":\"string\"},\
    \"StepIdsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen256\"}\
    },\
    \"StepState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"CANCEL_PENDING\",\
        \"RUNNING\",\
        \"COMPLETED\",\
        \"CANCELLED\",\
        \"FAILED\",\
        \"INTERRUPTED\"\
      ]\
    },\
    \"StepStateChangeReason\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"StepStateChangeReasonCode\",\
          \"documentation\":\"<p>The programmable code for the state change reason. Note: Currently, the service provides no code for the state change.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The descriptive message for the state change reason.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of the step state change reason.</p>\"\
    },\
    \"StepStateChangeReasonCode\":{\
      \"type\":\"string\",\
      \"enum\":[\"NONE\"]\
    },\
    \"StepStateList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StepState\"}\
    },\
    \"StepStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"State\":{\
          \"shape\":\"StepState\",\
          \"documentation\":\"<p>The execution state of the cluster step.</p>\"\
        },\
        \"StateChangeReason\":{\
          \"shape\":\"StepStateChangeReason\",\
          \"documentation\":\"<p>The reason for the step execution status change.</p>\"\
        },\
        \"FailureDetails\":{\
          \"shape\":\"FailureDetails\",\
          \"documentation\":\"<p>The details for the step failure including reason, message, and log file path where the root cause was identified.</p>\"\
        },\
        \"Timeline\":{\
          \"shape\":\"StepTimeline\",\
          \"documentation\":\"<p>The timeline of the cluster step status over time.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The execution status details of the cluster step.</p>\"\
    },\
    \"StepSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"StepId\",\
          \"documentation\":\"<p>The identifier of the cluster step.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cluster step.</p>\"\
        },\
        \"Config\":{\
          \"shape\":\"HadoopStepConfig\",\
          \"documentation\":\"<p>The Hadoop job configuration of the cluster step.</p>\"\
        },\
        \"ActionOnFailure\":{\
          \"shape\":\"ActionOnFailure\",\
          \"documentation\":\"<p>The action to take when the cluster step fails. Possible values are TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE. TERMINATE_JOB_FLOW is available for backward compatibility. We recommend using TERMINATE_CLUSTER instead.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StepStatus\",\
          \"documentation\":\"<p>The current execution status details of the cluster step.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The summary of the cluster step.</p>\"\
    },\
    \"StepSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StepSummary\"}\
    },\
    \"StepTimeline\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreationDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date and time when the cluster step was created.</p>\"\
        },\
        \"StartDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date and time when the cluster step execution started.</p>\"\
        },\
        \"EndDateTime\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date and time when the cluster step execution completed or failed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The timeline of the cluster step lifecycle.</p>\"\
    },\
    \"String\":{\"type\":\"string\"},\
    \"StringList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"StringMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"String\"},\
      \"value\":{\"shape\":\"String\"}\
    },\
    \"SupportedProductConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"XmlStringMaxLen256\",\
          \"documentation\":\"<p>The name of the product configuration.</p>\"\
        },\
        \"Args\":{\
          \"shape\":\"XmlStringList\",\
          \"documentation\":\"<p>The list of user-supplied arguments.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The list of supported product configurations which allow user-supplied arguments. EMR accepts these arguments and forwards them to the corresponding installation script as bootstrap action arguments.</p>\"\
    },\
    \"SupportedProductsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen256\"}\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A user-defined key, which is the minimum required information for a valid tag. For more information, see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html\\\">Tag </a>. </p>\"\
        },\
        \"Value\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A user-defined value, which is optional in a tag. For more information, see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html\\\">Tag Clusters</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A key/value pair containing user-defined metadata that you can associate with an Amazon EMR resource. Tags make it easier to associate clusters in various ways, such as grouping clusters to track your Amazon EMR resource allocation costs. For more information, see <a href=\\\"https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html\\\">Tag Clusters</a>. </p>\"\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"}\
    },\
    \"TerminateJobFlowsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobFlowIds\"],\
      \"members\":{\
        \"JobFlowIds\":{\
          \"shape\":\"XmlStringList\",\
          \"documentation\":\"<p>A list of job flows to be shutdown.</p>\"\
        }\
      },\
      \"documentation\":\"<p> Input to the <a>TerminateJobFlows</a> operation. </p>\"\
    },\
    \"Unit\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NONE\",\
        \"SECONDS\",\
        \"MICRO_SECONDS\",\
        \"MILLI_SECONDS\",\
        \"BYTES\",\
        \"KILO_BYTES\",\
        \"MEGA_BYTES\",\
        \"GIGA_BYTES\",\
        \"TERA_BYTES\",\
        \"BITS\",\
        \"KILO_BITS\",\
        \"MEGA_BITS\",\
        \"GIGA_BITS\",\
        \"TERA_BITS\",\
        \"PERCENT\",\
        \"COUNT\",\
        \"BYTES_PER_SECOND\",\
        \"KILO_BYTES_PER_SECOND\",\
        \"MEGA_BYTES_PER_SECOND\",\
        \"GIGA_BYTES_PER_SECOND\",\
        \"TERA_BYTES_PER_SECOND\",\
        \"BITS_PER_SECOND\",\
        \"KILO_BITS_PER_SECOND\",\
        \"MEGA_BITS_PER_SECOND\",\
        \"GIGA_BITS_PER_SECOND\",\
        \"TERA_BITS_PER_SECOND\",\
        \"COUNT_PER_SECOND\"\
      ]\
    },\
    \"VolumeSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VolumeType\",\
        \"SizeInGB\"\
      ],\
      \"members\":{\
        \"VolumeType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The volume type. Volume types supported are gp2, io1, standard.</p>\"\
        },\
        \"Iops\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of I/O operations per second (IOPS) that the volume supports.</p>\"\
        },\
        \"SizeInGB\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The volume size, in gibibytes (GiB). This can be a number from 1 - 1024. If the volume type is EBS-optimized, the minimum value is 10.</p>\"\
        }\
      },\
      \"documentation\":\"<p>EBS volume specifications such as volume type, IOPS, and size (GiB) that will be requested for the EBS volume attached to an EC2 instance in the cluster.</p>\"\
    },\
    \"WholeNumber\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"XmlString\":{\
      \"type\":\"string\",\
      \"max\":10280,\
      \"min\":0,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"XmlStringList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlString\"}\
    },\
    \"XmlStringMaxLen256\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"XmlStringMaxLen256List\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen256\"}\
    }\
  },\
  \"documentation\":\"<p>Amazon EMR is a web service that makes it easy to process large amounts of data efficiently. Amazon EMR uses Hadoop processing combined with several AWS products to do tasks such as web indexing, data mining, log file analysis, machine learning, scientific simulation, and data warehousing.</p>\"\
}\
";
}

@end
