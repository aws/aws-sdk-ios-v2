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

#import "AWSCloudformationResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSCloudformationResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSCloudformationResources

+ (instancetype)sharedInstance {
    static AWSCloudformationResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSCloudformationResources new];
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
    \"apiVersion\":\"2010-05-15\",\
    \"endpointPrefix\":\"cloudformation\",\
    \"protocol\":\"query\",\
    \"serviceFullName\":\"AWS CloudFormation\",\
    \"serviceId\":\"CloudFormation\",\
    \"signatureVersion\":\"v4\",\
    \"uid\":\"cloudformation-2010-05-15\",\
    \"xmlNamespace\":\"http://cloudformation.amazonaws.com/doc/2010-05-15/\"\
  },\
  \"operations\":{\
    \"CancelUpdateStack\":{\
      \"name\":\"CancelUpdateStack\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelUpdateStackInput\"},\
      \"errors\":[\
        {\"shape\":\"TokenAlreadyExistsException\"}\
      ],\
      \"documentation\":\"<p>Cancels an update on the specified stack. If the call completes successfully, the stack rolls back the update and reverts to the previous stack configuration.</p> <note> <p>You can cancel only stacks that are in the UPDATE_IN_PROGRESS state.</p> </note>\"\
    },\
    \"ContinueUpdateRollback\":{\
      \"name\":\"ContinueUpdateRollback\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ContinueUpdateRollbackInput\"},\
      \"output\":{\
        \"shape\":\"ContinueUpdateRollbackOutput\",\
        \"resultWrapper\":\"ContinueUpdateRollbackResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TokenAlreadyExistsException\"}\
      ],\
      \"documentation\":\"<p>For a specified stack that is in the <code>UPDATE_ROLLBACK_FAILED</code> state, continues rolling it back to the <code>UPDATE_ROLLBACK_COMPLETE</code> state. Depending on the cause of the failure, you can manually <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html#troubleshooting-errors-update-rollback-failed\\\"> fix the error</a> and continue the rollback. By continuing the rollback, you can return your stack to a working state (the <code>UPDATE_ROLLBACK_COMPLETE</code> state), and then try to update the stack again.</p> <p>A stack goes into the <code>UPDATE_ROLLBACK_FAILED</code> state when AWS CloudFormation cannot roll back all changes after a failed stack update. For example, you might have a stack that is rolling back to an old database instance that was deleted outside of AWS CloudFormation. Because AWS CloudFormation doesn't know the database was deleted, it assumes that the database instance still exists and attempts to roll back to it, causing the update rollback to fail.</p>\"\
    },\
    \"CreateChangeSet\":{\
      \"name\":\"CreateChangeSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateChangeSetInput\"},\
      \"output\":{\
        \"shape\":\"CreateChangeSetOutput\",\
        \"resultWrapper\":\"CreateChangeSetResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AlreadyExistsException\"},\
        {\"shape\":\"InsufficientCapabilitiesException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a list of changes that will be applied to a stack so that you can review the changes before executing them. You can create a change set for a stack that doesn't exist or an existing stack. If you create a change set for a stack that doesn't exist, the change set shows all of the resources that AWS CloudFormation will create. If you create a change set for an existing stack, AWS CloudFormation compares the stack's information with the information that you submit in the change set and lists the differences. Use change sets to understand which resources AWS CloudFormation will create or change, and how it will change resources in an existing stack, before you create or update a stack.</p> <p>To create a change set for a stack that doesn't exist, for the <code>ChangeSetType</code> parameter, specify <code>CREATE</code>. To create a change set for an existing stack, specify <code>UPDATE</code> for the <code>ChangeSetType</code> parameter. To create a change set for an import operation, specify <code>IMPORT</code> for the <code>ChangeSetType</code> parameter. After the <code>CreateChangeSet</code> call successfully completes, AWS CloudFormation starts creating the change set. To check the status of the change set or to review it, use the <a>DescribeChangeSet</a> action.</p> <p>When you are satisfied with the changes the change set will make, execute the change set by using the <a>ExecuteChangeSet</a> action. AWS CloudFormation doesn't make changes until you execute the change set.</p>\"\
    },\
    \"CreateStack\":{\
      \"name\":\"CreateStack\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateStackInput\"},\
      \"output\":{\
        \"shape\":\"CreateStackOutput\",\
        \"resultWrapper\":\"CreateStackResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"AlreadyExistsException\"},\
        {\"shape\":\"TokenAlreadyExistsException\"},\
        {\"shape\":\"InsufficientCapabilitiesException\"}\
      ],\
      \"documentation\":\"<p>Creates a stack as specified in the template. After the call completes successfully, the stack creation starts. You can check the status of the stack via the <a>DescribeStacks</a> API.</p>\"\
    },\
    \"CreateStackInstances\":{\
      \"name\":\"CreateStackInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateStackInstancesInput\"},\
      \"output\":{\
        \"shape\":\"CreateStackInstancesOutput\",\
        \"resultWrapper\":\"CreateStackInstancesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"StackSetNotFoundException\"},\
        {\"shape\":\"OperationInProgressException\"},\
        {\"shape\":\"OperationIdAlreadyExistsException\"},\
        {\"shape\":\"StaleRequestException\"},\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates stack instances for the specified accounts, within the specified Regions. A stack instance refers to a stack in a specific account and Region. You must specify at least one value for either <code>Accounts</code> or <code>DeploymentTargets</code>, and you must specify at least one value for <code>Regions</code>.</p>\"\
    },\
    \"CreateStackSet\":{\
      \"name\":\"CreateStackSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateStackSetInput\"},\
      \"output\":{\
        \"shape\":\"CreateStackSetOutput\",\
        \"resultWrapper\":\"CreateStackSetResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"NameAlreadyExistsException\"},\
        {\"shape\":\"CreatedButModifiedException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a stack set.</p>\"\
    },\
    \"DeleteChangeSet\":{\
      \"name\":\"DeleteChangeSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteChangeSetInput\"},\
      \"output\":{\
        \"shape\":\"DeleteChangeSetOutput\",\
        \"resultWrapper\":\"DeleteChangeSetResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidChangeSetStatusException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified change set. Deleting change sets ensures that no one executes the wrong change set.</p> <p>If the call successfully completes, AWS CloudFormation successfully deleted the change set.</p>\"\
    },\
    \"DeleteStack\":{\
      \"name\":\"DeleteStack\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteStackInput\"},\
      \"errors\":[\
        {\"shape\":\"TokenAlreadyExistsException\"}\
      ],\
      \"documentation\":\"<p>Deletes a specified stack. Once the call completes successfully, stack deletion starts. Deleted stacks do not show up in the <a>DescribeStacks</a> API if the deletion has been completed successfully.</p>\"\
    },\
    \"DeleteStackInstances\":{\
      \"name\":\"DeleteStackInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteStackInstancesInput\"},\
      \"output\":{\
        \"shape\":\"DeleteStackInstancesOutput\",\
        \"resultWrapper\":\"DeleteStackInstancesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"StackSetNotFoundException\"},\
        {\"shape\":\"OperationInProgressException\"},\
        {\"shape\":\"OperationIdAlreadyExistsException\"},\
        {\"shape\":\"StaleRequestException\"},\
        {\"shape\":\"InvalidOperationException\"}\
      ],\
      \"documentation\":\"<p>Deletes stack instances for the specified accounts, in the specified Regions. </p>\"\
    },\
    \"DeleteStackSet\":{\
      \"name\":\"DeleteStackSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteStackSetInput\"},\
      \"output\":{\
        \"shape\":\"DeleteStackSetOutput\",\
        \"resultWrapper\":\"DeleteStackSetResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"StackSetNotEmptyException\"},\
        {\"shape\":\"OperationInProgressException\"}\
      ],\
      \"documentation\":\"<p>Deletes a stack set. Before you can delete a stack set, all of its member stack instances must be deleted. For more information about how to do this, see <a>DeleteStackInstances</a>. </p>\"\
    },\
    \"DeregisterType\":{\
      \"name\":\"DeregisterType\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeregisterTypeInput\"},\
      \"output\":{\
        \"shape\":\"DeregisterTypeOutput\",\
        \"resultWrapper\":\"DeregisterTypeResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CFNRegistryException\"},\
        {\"shape\":\"TypeNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Removes a type or type version from active use in the CloudFormation registry. If a type or type version is deregistered, it cannot be used in CloudFormation operations.</p> <p>To deregister a type, you must individually deregister all registered versions of that type. If a type has only a single registered version, deregistering that version results in the type itself being deregistered. </p> <p>You cannot deregister the default version of a type, unless it is the only registered version of that type, in which case the type itself is deregistered as well. </p>\",\
      \"idempotent\":true\
    },\
    \"DescribeAccountLimits\":{\
      \"name\":\"DescribeAccountLimits\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeAccountLimitsInput\"},\
      \"output\":{\
        \"shape\":\"DescribeAccountLimitsOutput\",\
        \"resultWrapper\":\"DescribeAccountLimitsResult\"\
      },\
      \"documentation\":\"<p>Retrieves your account's AWS CloudFormation limits, such as the maximum number of stacks that you can create in your account. For more information about account limits, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html\\\">AWS CloudFormation Limits</a> in the <i>AWS CloudFormation User Guide</i>.</p>\"\
    },\
    \"DescribeChangeSet\":{\
      \"name\":\"DescribeChangeSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeChangeSetInput\"},\
      \"output\":{\
        \"shape\":\"DescribeChangeSetOutput\",\
        \"resultWrapper\":\"DescribeChangeSetResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ChangeSetNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns the inputs for the change set and a list of changes that AWS CloudFormation will make if you execute the change set. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-changesets.html\\\">Updating Stacks Using Change Sets</a> in the AWS CloudFormation User Guide.</p>\"\
    },\
    \"DescribeStackDriftDetectionStatus\":{\
      \"name\":\"DescribeStackDriftDetectionStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeStackDriftDetectionStatusInput\"},\
      \"output\":{\
        \"shape\":\"DescribeStackDriftDetectionStatusOutput\",\
        \"resultWrapper\":\"DescribeStackDriftDetectionStatusResult\"\
      },\
      \"documentation\":\"<p>Returns information about a stack drift detection operation. A stack drift detection operation detects whether a stack's actual configuration differs, or has <i>drifted</i>, from it's expected configuration, as defined in the stack template and any values specified as template parameters. A stack is considered to have drifted if one or more of its resources have drifted. For more information on stack and resource drift, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html\\\">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p> <p>Use <a>DetectStackDrift</a> to initiate a stack drift detection operation. <code>DetectStackDrift</code> returns a <code>StackDriftDetectionId</code> you can use to monitor the progress of the operation using <code>DescribeStackDriftDetectionStatus</code>. Once the drift detection operation has completed, use <a>DescribeStackResourceDrifts</a> to return drift information about the stack and its resources.</p>\"\
    },\
    \"DescribeStackEvents\":{\
      \"name\":\"DescribeStackEvents\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeStackEventsInput\"},\
      \"output\":{\
        \"shape\":\"DescribeStackEventsOutput\",\
        \"resultWrapper\":\"DescribeStackEventsResult\"\
      },\
      \"documentation\":\"<p>Returns all stack related events for a specified stack in reverse chronological order. For more information about a stack's event history, go to <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/concept-stack.html\\\">Stacks</a> in the AWS CloudFormation User Guide.</p> <note> <p>You can list events for stacks that have failed to create or have been deleted by specifying the unique stack identifier (stack ID).</p> </note>\"\
    },\
    \"DescribeStackInstance\":{\
      \"name\":\"DescribeStackInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeStackInstanceInput\"},\
      \"output\":{\
        \"shape\":\"DescribeStackInstanceOutput\",\
        \"resultWrapper\":\"DescribeStackInstanceResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"StackSetNotFoundException\"},\
        {\"shape\":\"StackInstanceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns the stack instance that's associated with the specified stack set, AWS account, and Region.</p> <p>For a list of stack instances that are associated with a specific stack set, use <a>ListStackInstances</a>.</p>\"\
    },\
    \"DescribeStackResource\":{\
      \"name\":\"DescribeStackResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeStackResourceInput\"},\
      \"output\":{\
        \"shape\":\"DescribeStackResourceOutput\",\
        \"resultWrapper\":\"DescribeStackResourceResult\"\
      },\
      \"documentation\":\"<p>Returns a description of the specified resource in the specified stack.</p> <p>For deleted stacks, DescribeStackResource returns resource information for up to 90 days after the stack has been deleted.</p>\"\
    },\
    \"DescribeStackResourceDrifts\":{\
      \"name\":\"DescribeStackResourceDrifts\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeStackResourceDriftsInput\"},\
      \"output\":{\
        \"shape\":\"DescribeStackResourceDriftsOutput\",\
        \"resultWrapper\":\"DescribeStackResourceDriftsResult\"\
      },\
      \"documentation\":\"<p>Returns drift information for the resources that have been checked for drift in the specified stack. This includes actual and expected configuration values for resources where AWS CloudFormation detects configuration drift.</p> <p>For a given stack, there will be one <code>StackResourceDrift</code> for each stack resource that has been checked for drift. Resources that have not yet been checked for drift are not included. Resources that do not currently support drift detection are not checked, and so not included. For a list of resources that support drift detection, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html\\\">Resources that Support Drift Detection</a>.</p> <p>Use <a>DetectStackResourceDrift</a> to detect drift on individual resources, or <a>DetectStackDrift</a> to detect drift on all supported resources for a given stack.</p>\"\
    },\
    \"DescribeStackResources\":{\
      \"name\":\"DescribeStackResources\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeStackResourcesInput\"},\
      \"output\":{\
        \"shape\":\"DescribeStackResourcesOutput\",\
        \"resultWrapper\":\"DescribeStackResourcesResult\"\
      },\
      \"documentation\":\"<p>Returns AWS resource descriptions for running and deleted stacks. If <code>StackName</code> is specified, all the associated resources that are part of the stack are returned. If <code>PhysicalResourceId</code> is specified, the associated resources of the stack that the resource belongs to are returned.</p> <note> <p>Only the first 100 resources will be returned. If your stack has more resources than this, you should use <code>ListStackResources</code> instead.</p> </note> <p>For deleted stacks, <code>DescribeStackResources</code> returns resource information for up to 90 days after the stack has been deleted.</p> <p>You must specify either <code>StackName</code> or <code>PhysicalResourceId</code>, but not both. In addition, you can specify <code>LogicalResourceId</code> to filter the returned result. For more information about resources, the <code>LogicalResourceId</code> and <code>PhysicalResourceId</code>, go to the <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/\\\">AWS CloudFormation User Guide</a>.</p> <note> <p>A <code>ValidationError</code> is returned if you specify both <code>StackName</code> and <code>PhysicalResourceId</code> in the same request.</p> </note>\"\
    },\
    \"DescribeStackSet\":{\
      \"name\":\"DescribeStackSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeStackSetInput\"},\
      \"output\":{\
        \"shape\":\"DescribeStackSetOutput\",\
        \"resultWrapper\":\"DescribeStackSetResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"StackSetNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns the description of the specified stack set. </p>\"\
    },\
    \"DescribeStackSetOperation\":{\
      \"name\":\"DescribeStackSetOperation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeStackSetOperationInput\"},\
      \"output\":{\
        \"shape\":\"DescribeStackSetOperationOutput\",\
        \"resultWrapper\":\"DescribeStackSetOperationResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"StackSetNotFoundException\"},\
        {\"shape\":\"OperationNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns the description of the specified stack set operation. </p>\"\
    },\
    \"DescribeStacks\":{\
      \"name\":\"DescribeStacks\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeStacksInput\"},\
      \"output\":{\
        \"shape\":\"DescribeStacksOutput\",\
        \"resultWrapper\":\"DescribeStacksResult\"\
      },\
      \"documentation\":\"<p>Returns the description for the specified stack; if no stack name was specified, then it returns the description for all the stacks created.</p> <note> <p>If the stack does not exist, an <code>AmazonCloudFormationException</code> is returned.</p> </note>\"\
    },\
    \"DescribeType\":{\
      \"name\":\"DescribeType\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTypeInput\"},\
      \"output\":{\
        \"shape\":\"DescribeTypeOutput\",\
        \"resultWrapper\":\"DescribeTypeResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CFNRegistryException\"},\
        {\"shape\":\"TypeNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns detailed information about a type that has been registered.</p> <p>If you specify a <code>VersionId</code>, <code>DescribeType</code> returns information about that specific type version. Otherwise, it returns information about the default type version.</p>\",\
      \"idempotent\":true\
    },\
    \"DescribeTypeRegistration\":{\
      \"name\":\"DescribeTypeRegistration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTypeRegistrationInput\"},\
      \"output\":{\
        \"shape\":\"DescribeTypeRegistrationOutput\",\
        \"resultWrapper\":\"DescribeTypeRegistrationResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CFNRegistryException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a type's registration, including its current status and type and version identifiers.</p> <p>When you initiate a registration request using <code> <a>RegisterType</a> </code>, you can then use <code> <a>DescribeTypeRegistration</a> </code> to monitor the progress of that registration request.</p> <p>Once the registration request has completed, use <code> <a>DescribeType</a> </code> to return detailed informaiton about a type.</p>\",\
      \"idempotent\":true\
    },\
    \"DetectStackDrift\":{\
      \"name\":\"DetectStackDrift\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectStackDriftInput\"},\
      \"output\":{\
        \"shape\":\"DetectStackDriftOutput\",\
        \"resultWrapper\":\"DetectStackDriftResult\"\
      },\
      \"documentation\":\"<p>Detects whether a stack's actual configuration differs, or has <i>drifted</i>, from it's expected configuration, as defined in the stack template and any values specified as template parameters. For each resource in the stack that supports drift detection, AWS CloudFormation compares the actual configuration of the resource with its expected template configuration. Only resource properties explicitly defined in the stack template are checked for drift. A stack is considered to have drifted if one or more of its resources differ from their expected template configurations. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html\\\">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p> <p>Use <code>DetectStackDrift</code> to detect drift on all supported resources for a given stack, or <a>DetectStackResourceDrift</a> to detect drift on individual resources.</p> <p>For a list of stack resources that currently support drift detection, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html\\\">Resources that Support Drift Detection</a>.</p> <p> <code>DetectStackDrift</code> can take up to several minutes, depending on the number of resources contained within the stack. Use <a>DescribeStackDriftDetectionStatus</a> to monitor the progress of a detect stack drift operation. Once the drift detection operation has completed, use <a>DescribeStackResourceDrifts</a> to return drift information about the stack and its resources.</p> <p>When detecting drift on a stack, AWS CloudFormation does not detect drift on any nested stacks belonging to that stack. Perform <code>DetectStackDrift</code> directly on the nested stack itself.</p>\"\
    },\
    \"DetectStackResourceDrift\":{\
      \"name\":\"DetectStackResourceDrift\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectStackResourceDriftInput\"},\
      \"output\":{\
        \"shape\":\"DetectStackResourceDriftOutput\",\
        \"resultWrapper\":\"DetectStackResourceDriftResult\"\
      },\
      \"documentation\":\"<p>Returns information about whether a resource's actual configuration differs, or has <i>drifted</i>, from it's expected configuration, as defined in the stack template and any values specified as template parameters. This information includes actual and expected property values for resources in which AWS CloudFormation detects drift. Only resource properties explicitly defined in the stack template are checked for drift. For more information about stack and resource drift, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html\\\">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p> <p>Use <code>DetectStackResourceDrift</code> to detect drift on individual resources, or <a>DetectStackDrift</a> to detect drift on all resources in a given stack that support drift detection.</p> <p>Resources that do not currently support drift detection cannot be checked. For a list of resources that support drift detection, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html\\\">Resources that Support Drift Detection</a>.</p>\"\
    },\
    \"DetectStackSetDrift\":{\
      \"name\":\"DetectStackSetDrift\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectStackSetDriftInput\"},\
      \"output\":{\
        \"shape\":\"DetectStackSetDriftOutput\",\
        \"resultWrapper\":\"DetectStackSetDriftResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"OperationInProgressException\"},\
        {\"shape\":\"StackSetNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Detect drift on a stack set. When CloudFormation performs drift detection on a stack set, it performs drift detection on the stack associated with each stack instance in the stack set. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html\\\">How CloudFormation Performs Drift Detection on a Stack Set</a>.</p> <p> <code>DetectStackSetDrift</code> returns the <code>OperationId</code> of the stack set drift detection operation. Use this operation id with <code> <a>DescribeStackSetOperation</a> </code> to monitor the progress of the drift detection operation. The drift detection operation may take some time, depending on the number of stack instances included in the stack set, as well as the number of resources included in each stack.</p> <p>Once the operation has completed, use the following actions to return drift information:</p> <ul> <li> <p>Use <code> <a>DescribeStackSet</a> </code> to return detailed informaiton about the stack set, including detailed information about the last <i>completed</i> drift operation performed on the stack set. (Information about drift operations that are in progress is not included.)</p> </li> <li> <p>Use <code> <a>ListStackInstances</a> </code> to return a list of stack instances belonging to the stack set, including the drift status and last drift time checked of each instance.</p> </li> <li> <p>Use <code> <a>DescribeStackInstance</a> </code> to return detailed information about a specific stack instance, including its drift status and last drift time checked.</p> </li> </ul> <p>For more information on performing a drift detection operation on a stack set, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html\\\">Detecting Unmanaged Changes in Stack Sets</a>. </p> <p>You can only run a single drift detection operation on a given stack set at one time. </p> <p>To stop a drift detection stack set operation, use <code> <a>StopStackSetOperation</a> </code>.</p>\"\
    },\
    \"EstimateTemplateCost\":{\
      \"name\":\"EstimateTemplateCost\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"EstimateTemplateCostInput\"},\
      \"output\":{\
        \"shape\":\"EstimateTemplateCostOutput\",\
        \"resultWrapper\":\"EstimateTemplateCostResult\"\
      },\
      \"documentation\":\"<p>Returns the estimated monthly cost of a template. The return value is an AWS Simple Monthly Calculator URL with a query string that describes the resources required to run the template.</p>\"\
    },\
    \"ExecuteChangeSet\":{\
      \"name\":\"ExecuteChangeSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ExecuteChangeSetInput\"},\
      \"output\":{\
        \"shape\":\"ExecuteChangeSetOutput\",\
        \"resultWrapper\":\"ExecuteChangeSetResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidChangeSetStatusException\"},\
        {\"shape\":\"ChangeSetNotFoundException\"},\
        {\"shape\":\"InsufficientCapabilitiesException\"},\
        {\"shape\":\"TokenAlreadyExistsException\"}\
      ],\
      \"documentation\":\"<p>Updates a stack using the input information that was provided when the specified change set was created. After the call successfully completes, AWS CloudFormation starts updating the stack. Use the <a>DescribeStacks</a> action to view the status of the update.</p> <p>When you execute a change set, AWS CloudFormation deletes all other change sets associated with the stack because they aren't valid for the updated stack.</p> <p>If a stack policy is associated with the stack, AWS CloudFormation enforces the policy during the update. You can't specify a temporary stack policy that overrides the current policy.</p>\"\
    },\
    \"GetStackPolicy\":{\
      \"name\":\"GetStackPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetStackPolicyInput\"},\
      \"output\":{\
        \"shape\":\"GetStackPolicyOutput\",\
        \"resultWrapper\":\"GetStackPolicyResult\"\
      },\
      \"documentation\":\"<p>Returns the stack policy for a specified stack. If a stack doesn't have a policy, a null value is returned.</p>\"\
    },\
    \"GetTemplate\":{\
      \"name\":\"GetTemplate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetTemplateInput\"},\
      \"output\":{\
        \"shape\":\"GetTemplateOutput\",\
        \"resultWrapper\":\"GetTemplateResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ChangeSetNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns the template body for a specified stack. You can get the template for running or deleted stacks.</p> <p>For deleted stacks, GetTemplate returns the template for up to 90 days after the stack has been deleted.</p> <note> <p> If the template does not exist, a <code>ValidationError</code> is returned. </p> </note>\"\
    },\
    \"GetTemplateSummary\":{\
      \"name\":\"GetTemplateSummary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetTemplateSummaryInput\"},\
      \"output\":{\
        \"shape\":\"GetTemplateSummaryOutput\",\
        \"resultWrapper\":\"GetTemplateSummaryResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"StackSetNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a new or existing template. The <code>GetTemplateSummary</code> action is useful for viewing parameter information, such as default parameter values and parameter types, before you create or update a stack or stack set.</p> <p>You can use the <code>GetTemplateSummary</code> action when you submit a template, or you can get template information for a stack set, or a running or deleted stack.</p> <p>For deleted stacks, <code>GetTemplateSummary</code> returns the template information for up to 90 days after the stack has been deleted. If the template does not exist, a <code>ValidationError</code> is returned.</p>\"\
    },\
    \"ListChangeSets\":{\
      \"name\":\"ListChangeSets\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListChangeSetsInput\"},\
      \"output\":{\
        \"shape\":\"ListChangeSetsOutput\",\
        \"resultWrapper\":\"ListChangeSetsResult\"\
      },\
      \"documentation\":\"<p>Returns the ID and status of each active change set for a stack. For example, AWS CloudFormation lists change sets that are in the <code>CREATE_IN_PROGRESS</code> or <code>CREATE_PENDING</code> state.</p>\"\
    },\
    \"ListExports\":{\
      \"name\":\"ListExports\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListExportsInput\"},\
      \"output\":{\
        \"shape\":\"ListExportsOutput\",\
        \"resultWrapper\":\"ListExportsResult\"\
      },\
      \"documentation\":\"<p>Lists all exported output values in the account and Region in which you call this action. Use this action to see the exported output values that you can import into other stacks. To import values, use the <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html\\\"> <code>Fn::ImportValue</code> </a> function. </p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-exports.html\\\"> AWS CloudFormation Export Stack Output Values</a>.</p>\"\
    },\
    \"ListImports\":{\
      \"name\":\"ListImports\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListImportsInput\"},\
      \"output\":{\
        \"shape\":\"ListImportsOutput\",\
        \"resultWrapper\":\"ListImportsResult\"\
      },\
      \"documentation\":\"<p>Lists all stacks that are importing an exported output value. To modify or remove an exported output value, first use this action to see which stacks are using it. To see the exported output values in your account, see <a>ListExports</a>. </p> <p>For more information about importing an exported output value, see the <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html\\\"> <code>Fn::ImportValue</code> </a> function. </p>\"\
    },\
    \"ListStackInstances\":{\
      \"name\":\"ListStackInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListStackInstancesInput\"},\
      \"output\":{\
        \"shape\":\"ListStackInstancesOutput\",\
        \"resultWrapper\":\"ListStackInstancesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"StackSetNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns summary information about stack instances that are associated with the specified stack set. You can filter for stack instances that are associated with a specific AWS account name or Region, or that have a specific status.</p>\"\
    },\
    \"ListStackResources\":{\
      \"name\":\"ListStackResources\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListStackResourcesInput\"},\
      \"output\":{\
        \"shape\":\"ListStackResourcesOutput\",\
        \"resultWrapper\":\"ListStackResourcesResult\"\
      },\
      \"documentation\":\"<p>Returns descriptions of all resources of the specified stack.</p> <p>For deleted stacks, ListStackResources returns resource information for up to 90 days after the stack has been deleted.</p>\"\
    },\
    \"ListStackSetOperationResults\":{\
      \"name\":\"ListStackSetOperationResults\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListStackSetOperationResultsInput\"},\
      \"output\":{\
        \"shape\":\"ListStackSetOperationResultsOutput\",\
        \"resultWrapper\":\"ListStackSetOperationResultsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"StackSetNotFoundException\"},\
        {\"shape\":\"OperationNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns summary information about the results of a stack set operation. </p>\"\
    },\
    \"ListStackSetOperations\":{\
      \"name\":\"ListStackSetOperations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListStackSetOperationsInput\"},\
      \"output\":{\
        \"shape\":\"ListStackSetOperationsOutput\",\
        \"resultWrapper\":\"ListStackSetOperationsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"StackSetNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns summary information about operations performed on a stack set. </p>\"\
    },\
    \"ListStackSets\":{\
      \"name\":\"ListStackSets\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListStackSetsInput\"},\
      \"output\":{\
        \"shape\":\"ListStackSetsOutput\",\
        \"resultWrapper\":\"ListStackSetsResult\"\
      },\
      \"documentation\":\"<p>Returns summary information about stack sets that are associated with the user.</p>\"\
    },\
    \"ListStacks\":{\
      \"name\":\"ListStacks\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListStacksInput\"},\
      \"output\":{\
        \"shape\":\"ListStacksOutput\",\
        \"resultWrapper\":\"ListStacksResult\"\
      },\
      \"documentation\":\"<p>Returns the summary information for stacks whose status matches the specified StackStatusFilter. Summary information for stacks that have been deleted is kept for 90 days after the stack is deleted. If no StackStatusFilter is specified, summary information for all stacks is returned (including existing stacks and stacks that have been deleted).</p>\"\
    },\
    \"ListTypeRegistrations\":{\
      \"name\":\"ListTypeRegistrations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTypeRegistrationsInput\"},\
      \"output\":{\
        \"shape\":\"ListTypeRegistrationsOutput\",\
        \"resultWrapper\":\"ListTypeRegistrationsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CFNRegistryException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of registration tokens for the specified type(s).</p>\",\
      \"idempotent\":true\
    },\
    \"ListTypeVersions\":{\
      \"name\":\"ListTypeVersions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTypeVersionsInput\"},\
      \"output\":{\
        \"shape\":\"ListTypeVersionsOutput\",\
        \"resultWrapper\":\"ListTypeVersionsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CFNRegistryException\"}\
      ],\
      \"documentation\":\"<p>Returns summary information about the versions of a type.</p>\",\
      \"idempotent\":true\
    },\
    \"ListTypes\":{\
      \"name\":\"ListTypes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTypesInput\"},\
      \"output\":{\
        \"shape\":\"ListTypesOutput\",\
        \"resultWrapper\":\"ListTypesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CFNRegistryException\"}\
      ],\
      \"documentation\":\"<p>Returns summary information about types that have been registered with CloudFormation.</p>\",\
      \"idempotent\":true\
    },\
    \"RecordHandlerProgress\":{\
      \"name\":\"RecordHandlerProgress\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RecordHandlerProgressInput\"},\
      \"output\":{\
        \"shape\":\"RecordHandlerProgressOutput\",\
        \"resultWrapper\":\"RecordHandlerProgressResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidStateTransitionException\"},\
        {\"shape\":\"OperationStatusCheckFailedException\"}\
      ],\
      \"documentation\":\"<p>Reports progress of a resource handler to CloudFormation.</p> <p>Reserved for use by the <a href=\\\"https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html\\\">CloudFormation CLI</a>. Do not use this API in your code.</p>\",\
      \"idempotent\":true\
    },\
    \"RegisterType\":{\
      \"name\":\"RegisterType\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RegisterTypeInput\"},\
      \"output\":{\
        \"shape\":\"RegisterTypeOutput\",\
        \"resultWrapper\":\"RegisterTypeResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CFNRegistryException\"}\
      ],\
      \"documentation\":\"<p>Registers a type with the CloudFormation service. Registering a type makes it available for use in CloudFormation templates in your AWS account, and includes:</p> <ul> <li> <p>Validating the resource schema</p> </li> <li> <p>Determining which handlers have been specified for the resource</p> </li> <li> <p>Making the resource type available for use in your account</p> </li> </ul> <p>For more information on how to develop types and ready them for registeration, see <a href=\\\"https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-types.html\\\">Creating Resource Providers</a> in the <i>CloudFormation CLI User Guide</i>.</p> <p>You can have a maximum of 50 resource type versions registered at a time. This maximum is per account and per region. Use <a href=\\\"AWSCloudFormation/latest/APIReference/API_DeregisterType.html\\\">DeregisterType</a> to deregister specific resource type versions if necessary.</p> <p>Once you have initiated a registration request using <code> <a>RegisterType</a> </code>, you can use <code> <a>DescribeTypeRegistration</a> </code> to monitor the progress of the registration request.</p>\",\
      \"idempotent\":true\
    },\
    \"SetStackPolicy\":{\
      \"name\":\"SetStackPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetStackPolicyInput\"},\
      \"documentation\":\"<p>Sets a stack policy for a specified stack.</p>\"\
    },\
    \"SetTypeDefaultVersion\":{\
      \"name\":\"SetTypeDefaultVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetTypeDefaultVersionInput\"},\
      \"output\":{\
        \"shape\":\"SetTypeDefaultVersionOutput\",\
        \"resultWrapper\":\"SetTypeDefaultVersionResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CFNRegistryException\"},\
        {\"shape\":\"TypeNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Specify the default version of a type. The default version of a type will be used in CloudFormation operations.</p>\",\
      \"idempotent\":true\
    },\
    \"SignalResource\":{\
      \"name\":\"SignalResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SignalResourceInput\"},\
      \"documentation\":\"<p>Sends a signal to the specified resource with a success or failure status. You can use the SignalResource API in conjunction with a creation policy or update policy. AWS CloudFormation doesn't proceed with a stack creation or update until resources receive the required number of signals or the timeout period is exceeded. The SignalResource API is useful in cases where you want to send signals from anywhere other than an Amazon EC2 instance.</p>\"\
    },\
    \"StopStackSetOperation\":{\
      \"name\":\"StopStackSetOperation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopStackSetOperationInput\"},\
      \"output\":{\
        \"shape\":\"StopStackSetOperationOutput\",\
        \"resultWrapper\":\"StopStackSetOperationResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"StackSetNotFoundException\"},\
        {\"shape\":\"OperationNotFoundException\"},\
        {\"shape\":\"InvalidOperationException\"}\
      ],\
      \"documentation\":\"<p>Stops an in-progress operation on a stack set and its associated stack instances. </p>\"\
    },\
    \"UpdateStack\":{\
      \"name\":\"UpdateStack\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateStackInput\"},\
      \"output\":{\
        \"shape\":\"UpdateStackOutput\",\
        \"resultWrapper\":\"UpdateStackResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InsufficientCapabilitiesException\"},\
        {\"shape\":\"TokenAlreadyExistsException\"}\
      ],\
      \"documentation\":\"<p>Updates a stack as specified in the template. After the call completes successfully, the stack update starts. You can check the status of the stack via the <a>DescribeStacks</a> action.</p> <p>To get a copy of the template for an existing stack, you can use the <a>GetTemplate</a> action.</p> <p>For more information about creating an update template, updating a stack, and monitoring the progress of the update, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks.html\\\">Updating a Stack</a>.</p>\"\
    },\
    \"UpdateStackInstances\":{\
      \"name\":\"UpdateStackInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateStackInstancesInput\"},\
      \"output\":{\
        \"shape\":\"UpdateStackInstancesOutput\",\
        \"resultWrapper\":\"UpdateStackInstancesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"StackSetNotFoundException\"},\
        {\"shape\":\"StackInstanceNotFoundException\"},\
        {\"shape\":\"OperationInProgressException\"},\
        {\"shape\":\"OperationIdAlreadyExistsException\"},\
        {\"shape\":\"StaleRequestException\"},\
        {\"shape\":\"InvalidOperationException\"}\
      ],\
      \"documentation\":\"<p>Updates the parameter values for stack instances for the specified accounts, within the specified Regions. A stack instance refers to a stack in a specific account and Region. </p> <p>You can only update stack instances in Regions and accounts where they already exist; to create additional stack instances, use <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateStackInstances.html\\\">CreateStackInstances</a>. </p> <p>During stack set updates, any parameters overridden for a stack instance are not updated, but retain their overridden value.</p> <p>You can only update the parameter <i>values</i> that are specified in the stack set; to add or delete a parameter itself, use <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html\\\">UpdateStackSet</a> to update the stack set template. If you add a parameter to a template, before you can override the parameter value specified in the stack set you must first use <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html\\\">UpdateStackSet</a> to update all stack instances with the updated template and parameter value specified in the stack set. Once a stack instance has been updated with the new parameter, you can then override the parameter value using <code>UpdateStackInstances</code>.</p>\"\
    },\
    \"UpdateStackSet\":{\
      \"name\":\"UpdateStackSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateStackSetInput\"},\
      \"output\":{\
        \"shape\":\"UpdateStackSetOutput\",\
        \"resultWrapper\":\"UpdateStackSetResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"StackSetNotFoundException\"},\
        {\"shape\":\"OperationInProgressException\"},\
        {\"shape\":\"OperationIdAlreadyExistsException\"},\
        {\"shape\":\"StaleRequestException\"},\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"StackInstanceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Updates the stack set, and associated stack instances in the specified accounts and Regions.</p> <p>Even if the stack set operation created by updating the stack set fails (completely or partially, below or above a specified failure tolerance), the stack set is updated with your changes. Subsequent <a>CreateStackInstances</a> calls on the specified stack set use the updated stack set.</p>\"\
    },\
    \"UpdateTerminationProtection\":{\
      \"name\":\"UpdateTerminationProtection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateTerminationProtectionInput\"},\
      \"output\":{\
        \"shape\":\"UpdateTerminationProtectionOutput\",\
        \"resultWrapper\":\"UpdateTerminationProtectionResult\"\
      },\
      \"documentation\":\"<p>Updates termination protection for the specified stack. If a user attempts to delete a stack with termination protection enabled, the operation fails and the stack remains unchanged. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html\\\">Protecting a Stack From Being Deleted</a> in the <i>AWS CloudFormation User Guide</i>.</p> <p> For <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html\\\">nested stacks</a>, termination protection is set on the root stack and cannot be changed directly on the nested stack.</p>\"\
    },\
    \"ValidateTemplate\":{\
      \"name\":\"ValidateTemplate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ValidateTemplateInput\"},\
      \"output\":{\
        \"shape\":\"ValidateTemplateOutput\",\
        \"resultWrapper\":\"ValidateTemplateResult\"\
      },\
      \"documentation\":\"<p>Validates a specified template. AWS CloudFormation first checks if the template is valid JSON. If it isn't, AWS CloudFormation checks if the template is valid YAML. If both these checks fail, AWS CloudFormation returns a template validation error.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"Account\":{\
      \"type\":\"string\",\
      \"pattern\":\"^[0-9]{12}$\"\
    },\
    \"AccountGateResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"AccountGateStatus\",\
          \"documentation\":\"<p>The status of the account gate function.</p> <ul> <li> <p> <code>SUCCEEDED</code>: The account gate function has determined that the account and Region passes any requirements for a stack set operation to occur. AWS CloudFormation proceeds with the stack operation in that account and Region. </p> </li> <li> <p> <code>FAILED</code>: The account gate function has determined that the account and Region does not meet the requirements for a stack set operation to occur. AWS CloudFormation cancels the stack set operation in that account and Region, and sets the stack set operation result status for that account and Region to <code>FAILED</code>. </p> </li> <li> <p> <code>SKIPPED</code>: AWS CloudFormation has skipped calling the account gate function for this account and Region, for one of the following reasons:</p> <ul> <li> <p>An account gate function has not been specified for the account and Region. AWS CloudFormation proceeds with the stack set operation in this account and Region.</p> </li> <li> <p>The <code>AWSCloudFormationStackSetExecutionRole</code> of the stack set adminstration account lacks permissions to invoke the function. AWS CloudFormation proceeds with the stack set operation in this account and Region.</p> </li> <li> <p>Either no action is necessary, or no action is possible, on the stack. AWS CloudFormation skips the stack set operation in this account and Region.</p> </li> </ul> </li> </ul>\"\
        },\
        \"StatusReason\":{\
          \"shape\":\"AccountGateStatusReason\",\
          \"documentation\":\"<p>The reason for the account gate status assigned to this account and Region for the stack set operation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Structure that contains the results of the account gate function which AWS CloudFormation invokes, if present, before proceeding with a stack set operation in an account and Region.</p> <p>For each account and Region, AWS CloudFormation lets you specify a Lamdba function that encapsulates any requirements that must be met before CloudFormation can proceed with a stack set operation in that account and Region. CloudFormation invokes the function each time a stack set operation is requested for that account and Region; if the function returns <code>FAILED</code>, CloudFormation cancels the operation in that account and Region, and sets the stack set operation result status for that account and Region to <code>FAILED</code>. </p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-account-gating.html\\\">Configuring a target account gate</a>.</p>\"\
    },\
    \"AccountGateStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SUCCEEDED\",\
        \"FAILED\",\
        \"SKIPPED\"\
      ]\
    },\
    \"AccountGateStatusReason\":{\"type\":\"string\"},\
    \"AccountLimit\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"LimitName\",\
          \"documentation\":\"<p>The name of the account limit.</p> <p>Values: <code>ConcurrentResourcesLimit</code> | <code>StackLimit</code> | <code>StackOutputsLimit</code> </p>\"\
        },\
        \"Value\":{\
          \"shape\":\"LimitValue\",\
          \"documentation\":\"<p>The value that is associated with the account limit name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The AccountLimit data type. </p> <p>CloudFormation has the following limits per account:</p> <ul> <li> <p>Number of concurrent resources</p> </li> <li> <p>Number of stacks</p> </li> <li> <p>Number of stack outputs</p> </li> </ul> <p>For more information about these account limits, and other CloudFormation limits, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html\\\">AWS CloudFormation Limits</a> in the <i>AWS CloudFormation User Guide</i>.</p>\"\
    },\
    \"AccountLimitList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AccountLimit\"}\
    },\
    \"AccountList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Account\"}\
    },\
    \"AllowedValue\":{\"type\":\"string\"},\
    \"AllowedValues\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AllowedValue\"}\
    },\
    \"AlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The resource with the name requested already exists.</p>\",\
      \"error\":{\
        \"code\":\"AlreadyExistsException\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Arn\":{\"type\":\"string\"},\
    \"AutoDeployment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"AutoDeploymentNullable\",\
          \"documentation\":\"<p>If set to <code>true</code>, StackSets automatically deploys additional stack instances to AWS Organizations accounts that are added to a target organization or organizational unit (OU) in the specified Regions. If an account is removed from a target organization or OU, StackSets deletes stack instances from the account in the specified Regions.</p>\"\
        },\
        \"RetainStacksOnAccountRemoval\":{\
          \"shape\":\"RetainStacksOnAccountRemovalNullable\",\
          \"documentation\":\"<p>If set to <code>true</code>, stack resources are retained when an account is removed from a target organization or OU. If set to <code>false</code>, stack resources are deleted. Specify only if <code>Enabled</code> is set to <code>True</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>[<code>Service-managed</code> permissions] Describes whether StackSets automatically deploys to AWS Organizations accounts that are added to a target organization or organizational unit (OU).</p>\"\
    },\
    \"AutoDeploymentNullable\":{\"type\":\"boolean\"},\
    \"BoxedInteger\":{\
      \"type\":\"integer\",\
      \"box\":true\
    },\
    \"BoxedMaxResults\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":100,\
      \"min\":1\
    },\
    \"CFNRegistryException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>An error occurred during a CloudFormation registry operation.</p>\",\
      \"error\":{\
        \"code\":\"CFNRegistryException\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CancelUpdateStackInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackName\"],\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name or the unique stack ID that is associated with the stack.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>A unique identifier for this <code>CancelUpdateStack</code> request. Specify this token if you plan to retry requests so that AWS CloudFormation knows that you're not attempting to cancel an update on a stack with the same name. You might retry <code>CancelUpdateStack</code> requests to ensure that AWS CloudFormation successfully received them.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <a>CancelUpdateStack</a> action.</p>\"\
    },\
    \"Capabilities\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Capability\"}\
    },\
    \"CapabilitiesReason\":{\"type\":\"string\"},\
    \"Capability\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CAPABILITY_IAM\",\
        \"CAPABILITY_NAMED_IAM\",\
        \"CAPABILITY_AUTO_EXPAND\"\
      ]\
    },\
    \"CausingEntity\":{\"type\":\"string\"},\
    \"Change\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"ChangeType\",\
          \"documentation\":\"<p>The type of entity that AWS CloudFormation changes. Currently, the only entity type is <code>Resource</code>.</p>\"\
        },\
        \"ResourceChange\":{\
          \"shape\":\"ResourceChange\",\
          \"documentation\":\"<p>A <code>ResourceChange</code> structure that describes the resource and action that AWS CloudFormation will perform.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The <code>Change</code> structure describes the changes AWS CloudFormation will perform if you execute the change set.</p>\"\
    },\
    \"ChangeAction\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Add\",\
        \"Modify\",\
        \"Remove\",\
        \"Import\"\
      ]\
    },\
    \"ChangeSetId\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"arn:[-a-zA-Z0-9:/]*\"\
    },\
    \"ChangeSetName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z][-a-zA-Z0-9]*\"\
    },\
    \"ChangeSetNameOrId\":{\
      \"type\":\"string\",\
      \"max\":1600,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z][-a-zA-Z0-9]*|arn:[-a-zA-Z0-9:/]*\"\
    },\
    \"ChangeSetNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified change set name or ID doesn't exit. To view valid change sets for a stack, use the <code>ListChangeSets</code> action.</p>\",\
      \"error\":{\
        \"code\":\"ChangeSetNotFound\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ChangeSetStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATE_PENDING\",\
        \"CREATE_IN_PROGRESS\",\
        \"CREATE_COMPLETE\",\
        \"DELETE_COMPLETE\",\
        \"FAILED\"\
      ]\
    },\
    \"ChangeSetStatusReason\":{\"type\":\"string\"},\
    \"ChangeSetSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChangeSetSummary\"}\
    },\
    \"ChangeSetSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>The ID of the stack with which the change set is associated.</p>\"\
        },\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name of the stack with which the change set is associated.</p>\"\
        },\
        \"ChangeSetId\":{\
          \"shape\":\"ChangeSetId\",\
          \"documentation\":\"<p>The ID of the change set.</p>\"\
        },\
        \"ChangeSetName\":{\
          \"shape\":\"ChangeSetName\",\
          \"documentation\":\"<p>The name of the change set.</p>\"\
        },\
        \"ExecutionStatus\":{\
          \"shape\":\"ExecutionStatus\",\
          \"documentation\":\"<p>If the change set execution status is <code>AVAILABLE</code>, you can execute the change set. If you canât execute the change set, the status indicates why. For example, a change set might be in an <code>UNAVAILABLE</code> state because AWS CloudFormation is still creating it or in an <code>OBSOLETE</code> state because the stack was already updated.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ChangeSetStatus\",\
          \"documentation\":\"<p>The state of the change set, such as <code>CREATE_IN_PROGRESS</code>, <code>CREATE_COMPLETE</code>, or <code>FAILED</code>.</p>\"\
        },\
        \"StatusReason\":{\
          \"shape\":\"ChangeSetStatusReason\",\
          \"documentation\":\"<p>A description of the change set's status. For example, if your change set is in the <code>FAILED</code> state, AWS CloudFormation shows the error message.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>The start time when the change set was created, in UTC.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>Descriptive information about the change set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The <code>ChangeSetSummary</code> structure describes a change set, its status, and the stack with which it's associated.</p>\"\
    },\
    \"ChangeSetType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATE\",\
        \"UPDATE\",\
        \"IMPORT\"\
      ]\
    },\
    \"ChangeSource\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ResourceReference\",\
        \"ParameterReference\",\
        \"ResourceAttribute\",\
        \"DirectModification\",\
        \"Automatic\"\
      ]\
    },\
    \"ChangeType\":{\
      \"type\":\"string\",\
      \"enum\":[\"Resource\"]\
    },\
    \"Changes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Change\"}\
    },\
    \"ClientRequestToken\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9][-a-zA-Z0-9]*\"\
    },\
    \"ClientToken\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"ContinueUpdateRollbackInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackName\"],\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackNameOrId\",\
          \"documentation\":\"<p>The name or the unique ID of the stack that you want to continue rolling back.</p> <note> <p>Don't specify the name of a nested stack (a stack that was created by using the <code>AWS::CloudFormation::Stack</code> resource). Instead, use this operation on the parent stack (the stack that contains the <code>AWS::CloudFormation::Stack</code> resource).</p> </note>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an AWS Identity and Access Management (IAM) role that AWS CloudFormation assumes to roll back the stack. AWS CloudFormation uses the role's credentials to make calls on your behalf. AWS CloudFormation always uses this role for all future operations on the stack. As long as users have permission to operate on the stack, AWS CloudFormation uses this role even if the users don't have permission to pass it. Ensure that the role grants least privilege.</p> <p>If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials.</p>\"\
        },\
        \"ResourcesToSkip\":{\
          \"shape\":\"ResourcesToSkip\",\
          \"documentation\":\"<p>A list of the logical IDs of the resources that AWS CloudFormation skips during the continue update rollback operation. You can specify only resources that are in the <code>UPDATE_FAILED</code> state because a rollback failed. You can't specify resources that are in the <code>UPDATE_FAILED</code> state for other reasons, for example, because an update was cancelled. To check why a resource update failed, use the <a>DescribeStackResources</a> action, and view the resource status reason. </p> <important> <p>Specify this property to skip rolling back resources that AWS CloudFormation can't successfully roll back. We recommend that you <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html#troubleshooting-errors-update-rollback-failed\\\"> troubleshoot</a> resources before skipping them. AWS CloudFormation sets the status of the specified resources to <code>UPDATE_COMPLETE</code> and continues to roll back the stack. After the rollback is complete, the state of the skipped resources will be inconsistent with the state of the resources in the stack template. Before performing another stack update, you must update the stack or resources to be consistent with each other. If you don't, subsequent stack updates might fail, and the stack will become unrecoverable. </p> </important> <p>Specify the minimum number of resources required to successfully roll back your stack. For example, a failed resource update might cause dependent resources to fail. In this case, it might not be necessary to skip the dependent resources. </p> <p>To skip resources that are part of nested stacks, use the following format: <code>NestedStackName.ResourceLogicalID</code>. If you want to specify the logical ID of a stack resource (<code>Type: AWS::CloudFormation::Stack</code>) in the <code>ResourcesToSkip</code> list, then its corresponding embedded stack must be in one of the following states: <code>DELETE_IN_PROGRESS</code>, <code>DELETE_COMPLETE</code>, or <code>DELETE_FAILED</code>. </p> <note> <p>Don't confuse a child stack's name with its corresponding logical ID defined in the parent stack. For an example of a continue update rollback operation with nested stacks, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-continueupdaterollback.html#nested-stacks\\\">Using ResourcesToSkip to recover a nested stacks hierarchy</a>. </p> </note>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>A unique identifier for this <code>ContinueUpdateRollback</code> request. Specify this token if you plan to retry requests so that AWS CloudFormation knows that you're not attempting to continue the rollback to a stack with the same name. You might retry <code>ContinueUpdateRollback</code> requests to ensure that AWS CloudFormation successfully received them.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <a>ContinueUpdateRollback</a> action.</p>\"\
    },\
    \"ContinueUpdateRollbackOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output for a <a>ContinueUpdateRollback</a> action.</p>\"\
    },\
    \"CreateChangeSetInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StackName\",\
        \"ChangeSetName\"\
      ],\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackNameOrId\",\
          \"documentation\":\"<p>The name or the unique ID of the stack for which you are creating a change set. AWS CloudFormation generates the change set by comparing this stack's information with the information that you submit, such as a modified template or different parameter input values.</p>\"\
        },\
        \"TemplateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>A structure that contains the body of the revised template, with a minimum length of 1 byte and a maximum length of 51,200 bytes. AWS CloudFormation generates the change set by comparing this template with the template of the stack that you specified.</p> <p>Conditional: You must specify only <code>TemplateBody</code> or <code>TemplateURL</code>.</p>\"\
        },\
        \"TemplateURL\":{\
          \"shape\":\"TemplateURL\",\
          \"documentation\":\"<p>The location of the file that contains the revised template. The URL must point to a template (max size: 460,800 bytes) that is located in an S3 bucket. AWS CloudFormation generates the change set by comparing this template with the stack that you specified.</p> <p>Conditional: You must specify only <code>TemplateBody</code> or <code>TemplateURL</code>.</p>\"\
        },\
        \"UsePreviousTemplate\":{\
          \"shape\":\"UsePreviousTemplate\",\
          \"documentation\":\"<p>Whether to reuse the template that is associated with the stack to create the change set.</p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"Parameters\",\
          \"documentation\":\"<p>A list of <code>Parameter</code> structures that specify input parameters for the change set. For more information, see the <a>Parameter</a> data type.</p>\"\
        },\
        \"Capabilities\":{\
          \"shape\":\"Capabilities\",\
          \"documentation\":\"<p>In some cases, you must explicitly acknowledge that your stack template contains certain capabilities in order for AWS CloudFormation to create the stack.</p> <ul> <li> <p> <code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code> </p> <p>Some stack templates might include resources that can affect permissions in your AWS account; for example, by creating new AWS Identity and Access Management (IAM) users. For those stacks, you must explicitly acknowledge this by specifying one of these capabilities.</p> <p>The following IAM resources require you to specify either the <code>CAPABILITY_IAM</code> or <code>CAPABILITY_NAMED_IAM</code> capability.</p> <ul> <li> <p>If you have IAM resources, you can specify either capability. </p> </li> <li> <p>If you have IAM resources with custom names, you <i>must</i> specify <code>CAPABILITY_NAMED_IAM</code>. </p> </li> <li> <p>If you don't specify either of these capabilities, AWS CloudFormation returns an <code>InsufficientCapabilities</code> error.</p> </li> </ul> <p>If your stack template contains these resources, we recommend that you review all permissions associated with them and edit their permissions if necessary.</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html\\\"> AWS::IAM::AccessKey</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html\\\"> AWS::IAM::Group</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html\\\"> AWS::IAM::InstanceProfile</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html\\\"> AWS::IAM::Policy</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html\\\"> AWS::IAM::Role</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html\\\"> AWS::IAM::User</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html\\\"> AWS::IAM::UserToGroupAddition</a> </p> </li> </ul> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities\\\">Acknowledging IAM Resources in AWS CloudFormation Templates</a>.</p> </li> <li> <p> <code>CAPABILITY_AUTO_EXPAND</code> </p> <p>Some template contain macros. Macros perform custom processing on templates; this can include simple actions like find-and-replace operations, all the way to extensive transformations of entire templates. Because of this, users typically create a change set from the processed template, so that they can review the changes resulting from the macros before actually creating the stack. If your stack template contains one or more macros, and you choose to create a stack directly from the processed template, without first reviewing the resulting changes in a change set, you must acknowledge this capability. This includes the <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html\\\">AWS::Include</a> and <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html\\\">AWS::Serverless</a> transforms, which are macros hosted by AWS CloudFormation.</p> <note> <p>This capacity does not apply to creating change sets, and specifying it when creating change sets has no effect.</p> <p>Also, change sets do not currently support nested stacks. If you want to create a stack from a stack template that contains macros <i>and</i> nested stacks, you must create or update the stack directly from the template using the <a>CreateStack</a> or <a>UpdateStack</a> action, and specifying this capability.</p> </note> <p>For more information on macros, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html\\\">Using AWS CloudFormation Macros to Perform Custom Processing on Templates</a>.</p> </li> </ul>\"\
        },\
        \"ResourceTypes\":{\
          \"shape\":\"ResourceTypes\",\
          \"documentation\":\"<p>The template resource types that you have permissions to work with if you execute this change set, such as <code>AWS::EC2::Instance</code>, <code>AWS::EC2::*</code>, or <code>Custom::MyCustomInstance</code>.</p> <p>If the list of resource types doesn't include a resource type that you're updating, the stack update fails. By default, AWS CloudFormation grants permissions to all resource types. AWS Identity and Access Management (IAM) uses this parameter for condition keys in IAM policies for AWS CloudFormation. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html\\\">Controlling Access with AWS Identity and Access Management</a> in the AWS CloudFormation User Guide.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an AWS Identity and Access Management (IAM) role that AWS CloudFormation assumes when executing the change set. AWS CloudFormation uses the role's credentials to make calls on your behalf. AWS CloudFormation uses this role for all future operations on the stack. As long as users have permission to operate on the stack, AWS CloudFormation uses this role even if the users don't have permission to pass it. Ensure that the role grants least privilege.</p> <p>If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials.</p>\"\
        },\
        \"RollbackConfiguration\":{\
          \"shape\":\"RollbackConfiguration\",\
          \"documentation\":\"<p>The rollback triggers for AWS CloudFormation to monitor during stack creation and updating operations, and for the specified monitoring period afterwards.</p>\"\
        },\
        \"NotificationARNs\":{\
          \"shape\":\"NotificationARNs\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARNs) of Amazon Simple Notification Service (Amazon SNS) topics that AWS CloudFormation associates with the stack. To remove all associated notification topics, specify an empty list.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>Key-value pairs to associate with this stack. AWS CloudFormation also propagates these tags to resources in the stack. You can specify a maximum of 50 tags.</p>\"\
        },\
        \"ChangeSetName\":{\
          \"shape\":\"ChangeSetName\",\
          \"documentation\":\"<p>The name of the change set. The name must be unique among all change sets that are associated with the specified stack.</p> <p>A change set name can contain only alphanumeric, case sensitive characters and hyphens. It must start with an alphabetic character and cannot exceed 128 characters.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique identifier for this <code>CreateChangeSet</code> request. Specify this token if you plan to retry requests so that AWS CloudFormation knows that you're not attempting to create another change set with the same name. You might retry <code>CreateChangeSet</code> requests to ensure that AWS CloudFormation successfully received them.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description to help you identify this change set.</p>\"\
        },\
        \"ChangeSetType\":{\
          \"shape\":\"ChangeSetType\",\
          \"documentation\":\"<p>The type of change set operation. To create a change set for a new stack, specify <code>CREATE</code>. To create a change set for an existing stack, specify <code>UPDATE</code>. To create a change set for an import operation, specify <code>IMPORT</code>.</p> <p>If you create a change set for a new stack, AWS Cloudformation creates a stack with a unique stack ID, but no template or resources. The stack will be in the <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-describing-stacks.html#d0e11995\\\"> <code>REVIEW_IN_PROGRESS</code> </a> state until you execute the change set.</p> <p>By default, AWS CloudFormation specifies <code>UPDATE</code>. You can't use the <code>UPDATE</code> type to create a change set for a new stack or the <code>CREATE</code> type to create a change set for an existing stack.</p>\"\
        },\
        \"ResourcesToImport\":{\
          \"shape\":\"ResourcesToImport\",\
          \"documentation\":\"<p>The resources to import into your stack.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <a>CreateChangeSet</a> action.</p>\"\
    },\
    \"CreateChangeSetOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ChangeSetId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the change set.</p>\"\
        },\
        \"StackId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>The unique ID of the stack.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for the <a>CreateChangeSet</a> action.</p>\"\
    },\
    \"CreateStackInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackName\"],\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name that is associated with the stack. The name must be unique in the Region in which you are creating the stack.</p> <note> <p>A stack name can contain only alphanumeric characters (case sensitive) and hyphens. It must start with an alphabetic character and cannot be longer than 128 characters.</p> </note>\"\
        },\
        \"TemplateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>Structure containing the template body with a minimum length of 1 byte and a maximum length of 51,200 bytes. For more information, go to <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html\\\">Template Anatomy</a> in the AWS CloudFormation User Guide.</p> <p>Conditional: You must specify either the <code>TemplateBody</code> or the <code>TemplateURL</code> parameter, but not both.</p>\"\
        },\
        \"TemplateURL\":{\
          \"shape\":\"TemplateURL\",\
          \"documentation\":\"<p>Location of file containing the template body. The URL must point to a template (max size: 460,800 bytes) that is located in an Amazon S3 bucket. For more information, go to the <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html\\\">Template Anatomy</a> in the AWS CloudFormation User Guide.</p> <p>Conditional: You must specify either the <code>TemplateBody</code> or the <code>TemplateURL</code> parameter, but not both.</p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"Parameters\",\
          \"documentation\":\"<p>A list of <code>Parameter</code> structures that specify input parameters for the stack. For more information, see the <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html\\\">Parameter</a> data type.</p>\"\
        },\
        \"DisableRollback\":{\
          \"shape\":\"DisableRollback\",\
          \"documentation\":\"<p>Set to <code>true</code> to disable rollback of the stack if stack creation failed. You can specify either <code>DisableRollback</code> or <code>OnFailure</code>, but not both.</p> <p>Default: <code>false</code> </p>\"\
        },\
        \"RollbackConfiguration\":{\
          \"shape\":\"RollbackConfiguration\",\
          \"documentation\":\"<p>The rollback triggers for AWS CloudFormation to monitor during stack creation and updating operations, and for the specified monitoring period afterwards.</p>\"\
        },\
        \"TimeoutInMinutes\":{\
          \"shape\":\"TimeoutMinutes\",\
          \"documentation\":\"<p>The amount of time that can pass before the stack status becomes CREATE_FAILED; if <code>DisableRollback</code> is not set or is set to <code>false</code>, the stack will be rolled back.</p>\"\
        },\
        \"NotificationARNs\":{\
          \"shape\":\"NotificationARNs\",\
          \"documentation\":\"<p>The Simple Notification Service (SNS) topic ARNs to publish stack related events. You can find your SNS topic ARNs using the SNS console or your Command Line Interface (CLI).</p>\"\
        },\
        \"Capabilities\":{\
          \"shape\":\"Capabilities\",\
          \"documentation\":\"<p>In some cases, you must explicitly acknowledge that your stack template contains certain capabilities in order for AWS CloudFormation to create the stack.</p> <ul> <li> <p> <code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code> </p> <p>Some stack templates might include resources that can affect permissions in your AWS account; for example, by creating new AWS Identity and Access Management (IAM) users. For those stacks, you must explicitly acknowledge this by specifying one of these capabilities.</p> <p>The following IAM resources require you to specify either the <code>CAPABILITY_IAM</code> or <code>CAPABILITY_NAMED_IAM</code> capability.</p> <ul> <li> <p>If you have IAM resources, you can specify either capability. </p> </li> <li> <p>If you have IAM resources with custom names, you <i>must</i> specify <code>CAPABILITY_NAMED_IAM</code>. </p> </li> <li> <p>If you don't specify either of these capabilities, AWS CloudFormation returns an <code>InsufficientCapabilities</code> error.</p> </li> </ul> <p>If your stack template contains these resources, we recommend that you review all permissions associated with them and edit their permissions if necessary.</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html\\\"> AWS::IAM::AccessKey</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html\\\"> AWS::IAM::Group</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html\\\"> AWS::IAM::InstanceProfile</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html\\\"> AWS::IAM::Policy</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html\\\"> AWS::IAM::Role</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html\\\"> AWS::IAM::User</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html\\\"> AWS::IAM::UserToGroupAddition</a> </p> </li> </ul> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities\\\">Acknowledging IAM Resources in AWS CloudFormation Templates</a>.</p> </li> <li> <p> <code>CAPABILITY_AUTO_EXPAND</code> </p> <p>Some template contain macros. Macros perform custom processing on templates; this can include simple actions like find-and-replace operations, all the way to extensive transformations of entire templates. Because of this, users typically create a change set from the processed template, so that they can review the changes resulting from the macros before actually creating the stack. If your stack template contains one or more macros, and you choose to create a stack directly from the processed template, without first reviewing the resulting changes in a change set, you must acknowledge this capability. This includes the <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html\\\">AWS::Include</a> and <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html\\\">AWS::Serverless</a> transforms, which are macros hosted by AWS CloudFormation.</p> <p>Change sets do not currently support nested stacks. If you want to create a stack from a stack template that contains macros <i>and</i> nested stacks, you must create the stack directly from the template using this capability.</p> <important> <p>You should only create stacks directly from a stack template that contains macros if you know what processing the macro performs.</p> <p>Each macro relies on an underlying Lambda service function for processing stack templates. Be aware that the Lambda function owner can update the function operation without AWS CloudFormation being notified.</p> </important> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html\\\">Using AWS CloudFormation Macros to Perform Custom Processing on Templates</a>.</p> </li> </ul>\"\
        },\
        \"ResourceTypes\":{\
          \"shape\":\"ResourceTypes\",\
          \"documentation\":\"<p>The template resource types that you have permissions to work with for this create stack action, such as <code>AWS::EC2::Instance</code>, <code>AWS::EC2::*</code>, or <code>Custom::MyCustomInstance</code>. Use the following syntax to describe template resource types: <code>AWS::*</code> (for all AWS resource), <code>Custom::*</code> (for all custom resources), <code>Custom::<i>logical_ID</i> </code> (for a specific custom resource), <code>AWS::<i>service_name</i>::*</code> (for all resources of a particular AWS service), and <code>AWS::<i>service_name</i>::<i>resource_logical_ID</i> </code> (for a specific AWS resource).</p> <p>If the list of resource types doesn't include a resource that you're creating, the stack creation fails. By default, AWS CloudFormation grants permissions to all resource types. AWS Identity and Access Management (IAM) uses this parameter for AWS CloudFormation-specific condition keys in IAM policies. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html\\\">Controlling Access with AWS Identity and Access Management</a>.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an AWS Identity and Access Management (IAM) role that AWS CloudFormation assumes to create the stack. AWS CloudFormation uses the role's credentials to make calls on your behalf. AWS CloudFormation always uses this role for all future operations on the stack. As long as users have permission to operate on the stack, AWS CloudFormation uses this role even if the users don't have permission to pass it. Ensure that the role grants least privilege.</p> <p>If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials.</p>\"\
        },\
        \"OnFailure\":{\
          \"shape\":\"OnFailure\",\
          \"documentation\":\"<p>Determines what action will be taken if stack creation fails. This must be one of: DO_NOTHING, ROLLBACK, or DELETE. You can specify either <code>OnFailure</code> or <code>DisableRollback</code>, but not both.</p> <p>Default: <code>ROLLBACK</code> </p>\"\
        },\
        \"StackPolicyBody\":{\
          \"shape\":\"StackPolicyBody\",\
          \"documentation\":\"<p>Structure containing the stack policy body. For more information, go to <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html\\\"> Prevent Updates to Stack Resources</a> in the <i>AWS CloudFormation User Guide</i>. You can specify either the <code>StackPolicyBody</code> or the <code>StackPolicyURL</code> parameter, but not both.</p>\"\
        },\
        \"StackPolicyURL\":{\
          \"shape\":\"StackPolicyURL\",\
          \"documentation\":\"<p>Location of a file containing the stack policy. The URL must point to a policy (maximum size: 16 KB) located in an S3 bucket in the same Region as the stack. You can specify either the <code>StackPolicyBody</code> or the <code>StackPolicyURL</code> parameter, but not both.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>Key-value pairs to associate with this stack. AWS CloudFormation also propagates these tags to the resources created in the stack. A maximum number of 50 tags can be specified.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>A unique identifier for this <code>CreateStack</code> request. Specify this token if you plan to retry requests so that AWS CloudFormation knows that you're not attempting to create a stack with the same name. You might retry <code>CreateStack</code> requests to ensure that AWS CloudFormation successfully received them.</p> <p>All events triggered by a given stack operation are assigned the same client request token, which you can use to track operations. For example, if you execute a <code>CreateStack</code> operation with the token <code>token1</code>, then all the <code>StackEvents</code> generated by that operation will have <code>ClientRequestToken</code> set as <code>token1</code>.</p> <p>In the console, stack operations display the client request token on the Events tab. Stack operations that are initiated from the console use the token format <i>Console-StackOperation-ID</i>, which helps you easily identify the stack operation . For example, if you create a stack using the console, each stack event would be assigned the same token in the following format: <code>Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002</code>. </p>\"\
        },\
        \"EnableTerminationProtection\":{\
          \"shape\":\"EnableTerminationProtection\",\
          \"documentation\":\"<p>Whether to enable termination protection on the specified stack. If a user attempts to delete a stack with termination protection enabled, the operation fails and the stack remains unchanged. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html\\\">Protecting a Stack From Being Deleted</a> in the <i>AWS CloudFormation User Guide</i>. Termination protection is disabled on stacks by default. </p> <p> For <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html\\\">nested stacks</a>, termination protection is set on the root stack and cannot be changed directly on the nested stack.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for <a>CreateStack</a> action.</p>\"\
    },\
    \"CreateStackInstancesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StackSetName\",\
        \"Regions\"\
      ],\
      \"members\":{\
        \"StackSetName\":{\
          \"shape\":\"StackSetName\",\
          \"documentation\":\"<p>The name or unique ID of the stack set that you want to create stack instances from.</p>\"\
        },\
        \"Accounts\":{\
          \"shape\":\"AccountList\",\
          \"documentation\":\"<p>[<code>Self-managed</code> permissions] The names of one or more AWS accounts that you want to create stack instances in the specified Region(s) for.</p> <p>You can specify <code>Accounts</code> or <code>DeploymentTargets</code>, but not both.</p>\"\
        },\
        \"DeploymentTargets\":{\
          \"shape\":\"DeploymentTargets\",\
          \"documentation\":\"<p>[<code>Service-managed</code> permissions] The AWS Organizations accounts for which to create stack instances in the specified Regions.</p> <p>You can specify <code>Accounts</code> or <code>DeploymentTargets</code>, but not both.</p>\"\
        },\
        \"Regions\":{\
          \"shape\":\"RegionList\",\
          \"documentation\":\"<p>The names of one or more Regions where you want to create stack instances using the specified AWS account(s). </p>\"\
        },\
        \"ParameterOverrides\":{\
          \"shape\":\"Parameters\",\
          \"documentation\":\"<p>A list of stack set parameters whose values you want to override in the selected stack instances.</p> <p>Any overridden parameter values will be applied to all stack instances in the specified accounts and Regions. When specifying parameters and their values, be aware of how AWS CloudFormation sets parameter values during stack instance operations:</p> <ul> <li> <p>To override the current value for a parameter, include the parameter and specify its value.</p> </li> <li> <p>To leave a parameter set to its present value, you can do one of the following:</p> <ul> <li> <p>Do not include the parameter in the list.</p> </li> <li> <p>Include the parameter and specify <code>UsePreviousValue</code> as <code>true</code>. (You cannot specify both a value and set <code>UsePreviousValue</code> to <code>true</code>.)</p> </li> </ul> </li> <li> <p>To set all overridden parameter back to the values specified in the stack set, specify a parameter list but do not include any parameters.</p> </li> <li> <p>To leave all parameters set to their present values, do not specify this property at all.</p> </li> </ul> <p>During stack set updates, any parameter values overridden for a stack instance are not updated, but retain their overridden value.</p> <p>You can only override the parameter <i>values</i> that are specified in the stack set; to add or delete a parameter itself, use <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html\\\">UpdateStackSet</a> to update the stack set template.</p>\"\
        },\
        \"OperationPreferences\":{\
          \"shape\":\"StackSetOperationPreferences\",\
          \"documentation\":\"<p>Preferences for how AWS CloudFormation performs this stack set operation.</p>\"\
        },\
        \"OperationId\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The unique identifier for this stack set operation. </p> <p>The operation ID also functions as an idempotency token, to ensure that AWS CloudFormation performs the stack set operation only once, even if you retry the request multiple times. You might retry stack set operation requests to ensure that AWS CloudFormation successfully received them.</p> <p>If you don't specify an operation ID, the SDK generates one automatically. </p> <p>Repeating this stack set operation with a new operation ID retries all stack instances whose status is <code>OUTDATED</code>. </p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"CreateStackInstancesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The unique identifier for this stack set operation.</p>\"\
        }\
      }\
    },\
    \"CreateStackOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>Unique identifier of the stack.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for a <a>CreateStack</a> action.</p>\"\
    },\
    \"CreateStackSetInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackSetName\"],\
      \"members\":{\
        \"StackSetName\":{\
          \"shape\":\"StackSetName\",\
          \"documentation\":\"<p>The name to associate with the stack set. The name must be unique in the Region where you create your stack set.</p> <note> <p>A stack name can contain only alphanumeric characters (case-sensitive) and hyphens. It must start with an alphabetic character and can't be longer than 128 characters.</p> </note>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the stack set. You can use the description to identify the stack set's purpose or other important information.</p>\"\
        },\
        \"TemplateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>The structure that contains the template body, with a minimum length of 1 byte and a maximum length of 51,200 bytes. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html\\\">Template Anatomy</a> in the AWS CloudFormation User Guide.</p> <p>Conditional: You must specify either the TemplateBody or the TemplateURL parameter, but not both.</p>\"\
        },\
        \"TemplateURL\":{\
          \"shape\":\"TemplateURL\",\
          \"documentation\":\"<p>The location of the file that contains the template body. The URL must point to a template (maximum size: 460,800 bytes) that's located in an Amazon S3 bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html\\\">Template Anatomy</a> in the AWS CloudFormation User Guide.</p> <p>Conditional: You must specify either the TemplateBody or the TemplateURL parameter, but not both.</p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"Parameters\",\
          \"documentation\":\"<p>The input parameters for the stack set template. </p>\"\
        },\
        \"Capabilities\":{\
          \"shape\":\"Capabilities\",\
          \"documentation\":\"<p>In some cases, you must explicitly acknowledge that your stack set template contains certain capabilities in order for AWS CloudFormation to create the stack set and related stack instances.</p> <ul> <li> <p> <code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code> </p> <p>Some stack templates might include resources that can affect permissions in your AWS account; for example, by creating new AWS Identity and Access Management (IAM) users. For those stack sets, you must explicitly acknowledge this by specifying one of these capabilities.</p> <p>The following IAM resources require you to specify either the <code>CAPABILITY_IAM</code> or <code>CAPABILITY_NAMED_IAM</code> capability.</p> <ul> <li> <p>If you have IAM resources, you can specify either capability. </p> </li> <li> <p>If you have IAM resources with custom names, you <i>must</i> specify <code>CAPABILITY_NAMED_IAM</code>. </p> </li> <li> <p>If you don't specify either of these capabilities, AWS CloudFormation returns an <code>InsufficientCapabilities</code> error.</p> </li> </ul> <p>If your stack template contains these resources, we recommend that you review all permissions associated with them and edit their permissions if necessary.</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html\\\"> AWS::IAM::AccessKey</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html\\\"> AWS::IAM::Group</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html\\\"> AWS::IAM::InstanceProfile</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html\\\"> AWS::IAM::Policy</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html\\\"> AWS::IAM::Role</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html\\\"> AWS::IAM::User</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html\\\"> AWS::IAM::UserToGroupAddition</a> </p> </li> </ul> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities\\\">Acknowledging IAM Resources in AWS CloudFormation Templates</a>.</p> </li> <li> <p> <code>CAPABILITY_AUTO_EXPAND</code> </p> <p>Some templates contain macros. If your stack template contains one or more macros, and you choose to create a stack directly from the processed template, without first reviewing the resulting changes in a change set, you must acknowledge this capability. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html\\\">Using AWS CloudFormation Macros to Perform Custom Processing on Templates</a>.</p> <note> <p>Stack sets do not currently support macros in stack templates. (This includes the <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html\\\">AWS::Include</a> and <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html\\\">AWS::Serverless</a> transforms, which are macros hosted by AWS CloudFormation.) Even if you specify this capability, if you include a macro in your template the stack set operation will fail.</p> </note> </li> </ul>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The key-value pairs to associate with this stack set and the stacks created from it. AWS CloudFormation also propagates these tags to supported resources that are created in the stacks. A maximum number of 50 tags can be specified.</p> <p>If you specify tags as part of a <code>CreateStackSet</code> action, AWS CloudFormation checks to see if you have the required IAM permission to tag resources. If you don't, the entire <code>CreateStackSet</code> action fails with an <code>access denied</code> error, and the stack set is not created.</p>\"\
        },\
        \"AdministrationRoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the IAM role to use to create this stack set. </p> <p>Specify an IAM role only if you are using customized administrator roles to control which users or groups can manage specific stack sets within the same administrator account. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html\\\">Prerequisites: Granting Permissions for Stack Set Operations</a> in the <i>AWS CloudFormation User Guide</i>.</p>\"\
        },\
        \"ExecutionRoleName\":{\
          \"shape\":\"ExecutionRoleName\",\
          \"documentation\":\"<p>The name of the IAM execution role to use to create the stack set. If you do not specify an execution role, AWS CloudFormation uses the <code>AWSCloudFormationStackSetExecutionRole</code> role for the stack set operation.</p> <p>Specify an IAM role only if you are using customized execution roles to control which stack resources users and groups can include in their stack sets. </p>\"\
        },\
        \"PermissionModel\":{\
          \"shape\":\"PermissionModels\",\
          \"documentation\":\"<p>Describes how the IAM roles required for stack set operations are created. By default, <code>SELF-MANAGED</code> is specified.</p> <ul> <li> <p>With <code>self-managed</code> permissions, you must create the administrator and execution roles required to deploy to target accounts. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html\\\">Grant Self-Managed Stack Set Permissions</a>.</p> </li> <li> <p>With <code>service-managed</code> permissions, StackSets automatically creates the IAM roles required to deploy to accounts managed by AWS Organizations. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-service-managed.html\\\">Grant Service-Managed Stack Set Permissions</a>.</p> </li> </ul>\"\
        },\
        \"AutoDeployment\":{\
          \"shape\":\"AutoDeployment\",\
          \"documentation\":\"<p>Describes whether StackSets automatically deploys to AWS Organizations accounts that are added to the target organization or organizational unit (OU). Specify only if <code>PermissionModel</code> is <code>SERVICE_MANAGED</code>.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>A unique identifier for this <code>CreateStackSet</code> request. Specify this token if you plan to retry requests so that AWS CloudFormation knows that you're not attempting to create another stack set with the same name. You might retry <code>CreateStackSet</code> requests to ensure that AWS CloudFormation successfully received them.</p> <p>If you don't specify an operation ID, the SDK generates one automatically. </p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"CreateStackSetOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackSetId\":{\
          \"shape\":\"StackSetId\",\
          \"documentation\":\"<p>The ID of the stack set that you're creating.</p>\"\
        }\
      }\
    },\
    \"CreatedButModifiedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified resource exists, but has been changed.</p>\",\
      \"error\":{\
        \"code\":\"CreatedButModifiedException\",\
        \"httpStatusCode\":409,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CreationTime\":{\"type\":\"timestamp\"},\
    \"DeleteChangeSetInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ChangeSetName\"],\
      \"members\":{\
        \"ChangeSetName\":{\
          \"shape\":\"ChangeSetNameOrId\",\
          \"documentation\":\"<p>The name or Amazon Resource Name (ARN) of the change set that you want to delete.</p>\"\
        },\
        \"StackName\":{\
          \"shape\":\"StackNameOrId\",\
          \"documentation\":\"<p>If you specified the name of a change set to delete, specify the stack name or ID (ARN) that is associated with it.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <a>DeleteChangeSet</a> action.</p>\"\
    },\
    \"DeleteChangeSetOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output for the <a>DeleteChangeSet</a> action.</p>\"\
    },\
    \"DeleteStackInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackName\"],\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name or the unique stack ID that is associated with the stack.</p>\"\
        },\
        \"RetainResources\":{\
          \"shape\":\"RetainResources\",\
          \"documentation\":\"<p>For stacks in the <code>DELETE_FAILED</code> state, a list of resource logical IDs that are associated with the resources you want to retain. During deletion, AWS CloudFormation deletes the stack but does not delete the retained resources.</p> <p>Retaining resources is useful when you cannot delete a resource, such as a non-empty S3 bucket, but you want to delete the stack.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an AWS Identity and Access Management (IAM) role that AWS CloudFormation assumes to delete the stack. AWS CloudFormation uses the role's credentials to make calls on your behalf.</p> <p>If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>A unique identifier for this <code>DeleteStack</code> request. Specify this token if you plan to retry requests so that AWS CloudFormation knows that you're not attempting to delete a stack with the same name. You might retry <code>DeleteStack</code> requests to ensure that AWS CloudFormation successfully received them.</p> <p>All events triggered by a given stack operation are assigned the same client request token, which you can use to track operations. For example, if you execute a <code>CreateStack</code> operation with the token <code>token1</code>, then all the <code>StackEvents</code> generated by that operation will have <code>ClientRequestToken</code> set as <code>token1</code>.</p> <p>In the console, stack operations display the client request token on the Events tab. Stack operations that are initiated from the console use the token format <i>Console-StackOperation-ID</i>, which helps you easily identify the stack operation . For example, if you create a stack using the console, each stack event would be assigned the same token in the following format: <code>Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for <a>DeleteStack</a> action.</p>\"\
    },\
    \"DeleteStackInstancesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StackSetName\",\
        \"Regions\",\
        \"RetainStacks\"\
      ],\
      \"members\":{\
        \"StackSetName\":{\
          \"shape\":\"StackSetName\",\
          \"documentation\":\"<p>The name or unique ID of the stack set that you want to delete stack instances for.</p>\"\
        },\
        \"Accounts\":{\
          \"shape\":\"AccountList\",\
          \"documentation\":\"<p>[<code>Self-managed</code> permissions] The names of the AWS accounts that you want to delete stack instances for.</p> <p>You can specify <code>Accounts</code> or <code>DeploymentTargets</code>, but not both.</p>\"\
        },\
        \"DeploymentTargets\":{\
          \"shape\":\"DeploymentTargets\",\
          \"documentation\":\"<p>[<code>Service-managed</code> permissions] The AWS Organizations accounts from which to delete stack instances.</p> <p>You can specify <code>Accounts</code> or <code>DeploymentTargets</code>, but not both.</p>\"\
        },\
        \"Regions\":{\
          \"shape\":\"RegionList\",\
          \"documentation\":\"<p>The Regions where you want to delete stack set instances. </p>\"\
        },\
        \"OperationPreferences\":{\
          \"shape\":\"StackSetOperationPreferences\",\
          \"documentation\":\"<p>Preferences for how AWS CloudFormation performs this stack set operation.</p>\"\
        },\
        \"RetainStacks\":{\
          \"shape\":\"RetainStacks\",\
          \"documentation\":\"<p>Removes the stack instances from the specified stack set, but doesn't delete the stacks. You can't reassociate a retained stack or add an existing, saved stack to a new stack set.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options\\\">Stack set operation options</a>.</p>\"\
        },\
        \"OperationId\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The unique identifier for this stack set operation. </p> <p>If you don't specify an operation ID, the SDK generates one automatically. </p> <p>The operation ID also functions as an idempotency token, to ensure that AWS CloudFormation performs the stack set operation only once, even if you retry the request multiple times. You can retry stack set operation requests to ensure that AWS CloudFormation successfully received them.</p> <p>Repeating this stack set operation with a new operation ID retries all stack instances whose status is <code>OUTDATED</code>. </p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"DeleteStackInstancesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The unique identifier for this stack set operation.</p>\"\
        }\
      }\
    },\
    \"DeleteStackSetInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackSetName\"],\
      \"members\":{\
        \"StackSetName\":{\
          \"shape\":\"StackSetName\",\
          \"documentation\":\"<p>The name or unique ID of the stack set that you're deleting. You can obtain this value by running <a>ListStackSets</a>.</p>\"\
        }\
      }\
    },\
    \"DeleteStackSetOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeletionTime\":{\"type\":\"timestamp\"},\
    \"DeploymentTargets\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Accounts\":{\
          \"shape\":\"AccountList\",\
          \"documentation\":\"<p>The names of one or more AWS accounts for which you want to deploy stack set updates.</p>\"\
        },\
        \"OrganizationalUnitIds\":{\
          \"shape\":\"OrganizationalUnitIdList\",\
          \"documentation\":\"<p>The organization root ID or organizational unit (OU) IDs to which StackSets deploys.</p>\"\
        }\
      },\
      \"documentation\":\"<p>[<code>Service-managed</code> permissions] The AWS Organizations accounts to which StackSets deploys. StackSets does not deploy stack instances to the organization master account, even if the master account is in your organization or in an OU in your organization.</p> <p>For update operations, you can specify either <code>Accounts</code> or <code>OrganizationalUnitIds</code>. For create and delete operations, specify <code>OrganizationalUnitIds</code>.</p>\"\
    },\
    \"DeprecatedStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"LIVE\",\
        \"DEPRECATED\"\
      ]\
    },\
    \"DeregisterTypeInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"PrivateTypeArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the type.</p> <p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"RegistryType\",\
          \"documentation\":\"<p>The kind of type.</p> <p>Currently the only valid value is <code>RESOURCE</code>.</p> <p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>\"\
        },\
        \"TypeName\":{\
          \"shape\":\"TypeName\",\
          \"documentation\":\"<p>The name of the type.</p> <p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"TypeVersionId\",\
          \"documentation\":\"<p>The ID of a specific version of the type. The version ID is the value at the end of the Amazon Resource Name (ARN) assigned to the type version when it is registered.</p>\"\
        }\
      }\
    },\
    \"DeregisterTypeOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeAccountLimitsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A string that identifies the next page of limits that you want to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <a>DescribeAccountLimits</a> action.</p>\"\
    },\
    \"DescribeAccountLimitsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccountLimits\":{\
          \"shape\":\"AccountLimitList\",\
          \"documentation\":\"<p>An account limit structure that contain a list of AWS CloudFormation account limits and their values.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the output exceeds 1 MB in size, a string that identifies the next page of limits. If no additional page exists, this value is null.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for the <a>DescribeAccountLimits</a> action.</p>\"\
    },\
    \"DescribeChangeSetInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ChangeSetName\"],\
      \"members\":{\
        \"ChangeSetName\":{\
          \"shape\":\"ChangeSetNameOrId\",\
          \"documentation\":\"<p>The name or Amazon Resource Name (ARN) of the change set that you want to describe.</p>\"\
        },\
        \"StackName\":{\
          \"shape\":\"StackNameOrId\",\
          \"documentation\":\"<p>If you specified the name of a change set, specify the stack name or ID (ARN) of the change set you want to describe.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A string (provided by the <a>DescribeChangeSet</a> response output) that identifies the next page of information that you want to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <a>DescribeChangeSet</a> action.</p>\"\
    },\
    \"DescribeChangeSetOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChangeSetName\":{\
          \"shape\":\"ChangeSetName\",\
          \"documentation\":\"<p>The name of the change set.</p>\"\
        },\
        \"ChangeSetId\":{\
          \"shape\":\"ChangeSetId\",\
          \"documentation\":\"<p>The ARN of the change set.</p>\"\
        },\
        \"StackId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>The ARN of the stack that is associated with the change set.</p>\"\
        },\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name of the stack that is associated with the change set.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>Information about the change set.</p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"Parameters\",\
          \"documentation\":\"<p>A list of <code>Parameter</code> structures that describes the input parameters and their values used to create the change set. For more information, see the <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html\\\">Parameter</a> data type.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>The start time when the change set was created, in UTC.</p>\"\
        },\
        \"ExecutionStatus\":{\
          \"shape\":\"ExecutionStatus\",\
          \"documentation\":\"<p>If the change set execution status is <code>AVAILABLE</code>, you can execute the change set. If you canât execute the change set, the status indicates why. For example, a change set might be in an <code>UNAVAILABLE</code> state because AWS CloudFormation is still creating it or in an <code>OBSOLETE</code> state because the stack was already updated.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ChangeSetStatus\",\
          \"documentation\":\"<p>The current status of the change set, such as <code>CREATE_IN_PROGRESS</code>, <code>CREATE_COMPLETE</code>, or <code>FAILED</code>.</p>\"\
        },\
        \"StatusReason\":{\
          \"shape\":\"ChangeSetStatusReason\",\
          \"documentation\":\"<p>A description of the change set's status. For example, if your attempt to create a change set failed, AWS CloudFormation shows the error message.</p>\"\
        },\
        \"NotificationARNs\":{\
          \"shape\":\"NotificationARNs\",\
          \"documentation\":\"<p>The ARNs of the Amazon Simple Notification Service (Amazon SNS) topics that will be associated with the stack if you execute the change set.</p>\"\
        },\
        \"RollbackConfiguration\":{\
          \"shape\":\"RollbackConfiguration\",\
          \"documentation\":\"<p>The rollback triggers for AWS CloudFormation to monitor during stack creation and updating operations, and for the specified monitoring period afterwards.</p>\"\
        },\
        \"Capabilities\":{\
          \"shape\":\"Capabilities\",\
          \"documentation\":\"<p>If you execute the change set, the list of capabilities that were explicitly acknowledged when the change set was created.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>If you execute the change set, the tags that will be associated with the stack.</p>\"\
        },\
        \"Changes\":{\
          \"shape\":\"Changes\",\
          \"documentation\":\"<p>A list of <code>Change</code> structures that describes the resources AWS CloudFormation changes if you execute the change set.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the output exceeds 1 MB, a string that identifies the next page of changes. If there is no additional page, this value is null.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for the <a>DescribeChangeSet</a> action.</p>\"\
    },\
    \"DescribeStackDriftDetectionStatusInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackDriftDetectionId\"],\
      \"members\":{\
        \"StackDriftDetectionId\":{\
          \"shape\":\"StackDriftDetectionId\",\
          \"documentation\":\"<p>The ID of the drift detection results of this operation. </p> <p>AWS CloudFormation generates new results, with a new drift detection ID, each time this operation is run. However, the number of drift results AWS CloudFormation retains for any given stack, and for how long, may vary. </p>\"\
        }\
      }\
    },\
    \"DescribeStackDriftDetectionStatusOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StackId\",\
        \"StackDriftDetectionId\",\
        \"DetectionStatus\",\
        \"Timestamp\"\
      ],\
      \"members\":{\
        \"StackId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>The ID of the stack.</p>\"\
        },\
        \"StackDriftDetectionId\":{\
          \"shape\":\"StackDriftDetectionId\",\
          \"documentation\":\"<p>The ID of the drift detection results of this operation. </p> <p>AWS CloudFormation generates new results, with a new drift detection ID, each time this operation is run. However, the number of reports AWS CloudFormation retains for any given stack, and for how long, may vary.</p>\"\
        },\
        \"StackDriftStatus\":{\
          \"shape\":\"StackDriftStatus\",\
          \"documentation\":\"<p>Status of the stack's actual configuration compared to its expected configuration. </p> <ul> <li> <p> <code>DRIFTED</code>: The stack differs from its expected template configuration. A stack is considered to have drifted if one or more of its resources have drifted.</p> </li> <li> <p> <code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the stack differs from its expected template configuration.</p> </li> <li> <p> <code>IN_SYNC</code>: The stack's actual configuration matches its expected template configuration.</p> </li> <li> <p> <code>UNKNOWN</code>: This value is reserved for future use.</p> </li> </ul>\"\
        },\
        \"DetectionStatus\":{\
          \"shape\":\"StackDriftDetectionStatus\",\
          \"documentation\":\"<p>The status of the stack drift detection operation.</p> <ul> <li> <p> <code>DETECTION_COMPLETE</code>: The stack drift detection operation has successfully completed for all resources in the stack that support drift detection. (Resources that do not currently support stack detection remain unchecked.)</p> <p>If you specified logical resource IDs for AWS CloudFormation to use as a filter for the stack drift detection operation, only the resources with those logical IDs are checked for drift.</p> </li> <li> <p> <code>DETECTION_FAILED</code>: The stack drift detection operation has failed for at least one resource in the stack. Results will be available for resources on which AWS CloudFormation successfully completed drift detection.</p> </li> <li> <p> <code>DETECTION_IN_PROGRESS</code>: The stack drift detection operation is currently in progress.</p> </li> </ul>\"\
        },\
        \"DetectionStatusReason\":{\
          \"shape\":\"StackDriftDetectionStatusReason\",\
          \"documentation\":\"<p>The reason the stack drift detection operation has its current status.</p>\"\
        },\
        \"DriftedStackResourceCount\":{\
          \"shape\":\"BoxedInteger\",\
          \"documentation\":\"<p>Total number of stack resources that have drifted. This is NULL until the drift detection operation reaches a status of <code>DETECTION_COMPLETE</code>. This value will be 0 for stacks whose drift status is <code>IN_SYNC</code>.</p>\"\
        },\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Time at which the stack drift detection operation was initiated.</p>\"\
        }\
      }\
    },\
    \"DescribeStackEventsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name or the unique stack ID that is associated with the stack, which are not always interchangeable:</p> <ul> <li> <p>Running stacks: You can specify either the stack's name or its unique stack ID.</p> </li> <li> <p>Deleted stacks: You must specify the unique stack ID.</p> </li> </ul> <p>Default: There is no default value.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A string that identifies the next page of events that you want to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for <a>DescribeStackEvents</a> action.</p>\"\
    },\
    \"DescribeStackEventsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackEvents\":{\
          \"shape\":\"StackEvents\",\
          \"documentation\":\"<p>A list of <code>StackEvents</code> structures.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the output exceeds 1 MB in size, a string that identifies the next page of events. If no additional page exists, this value is null.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for a <a>DescribeStackEvents</a> action.</p>\"\
    },\
    \"DescribeStackInstanceInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StackSetName\",\
        \"StackInstanceAccount\",\
        \"StackInstanceRegion\"\
      ],\
      \"members\":{\
        \"StackSetName\":{\
          \"shape\":\"StackSetName\",\
          \"documentation\":\"<p>The name or the unique stack ID of the stack set that you want to get stack instance information for.</p>\"\
        },\
        \"StackInstanceAccount\":{\
          \"shape\":\"Account\",\
          \"documentation\":\"<p>The ID of an AWS account that's associated with this stack instance.</p>\"\
        },\
        \"StackInstanceRegion\":{\
          \"shape\":\"Region\",\
          \"documentation\":\"<p>The name of a Region that's associated with this stack instance.</p>\"\
        }\
      }\
    },\
    \"DescribeStackInstanceOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackInstance\":{\
          \"shape\":\"StackInstance\",\
          \"documentation\":\"<p>The stack instance that matches the specified request parameters.</p>\"\
        }\
      }\
    },\
    \"DescribeStackResourceDriftsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackName\"],\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackNameOrId\",\
          \"documentation\":\"<p>The name of the stack for which you want drift information.</p>\"\
        },\
        \"StackResourceDriftStatusFilters\":{\
          \"shape\":\"StackResourceDriftStatusFilters\",\
          \"documentation\":\"<p>The resource drift status values to use as filters for the resource drift results returned.</p> <ul> <li> <p> <code>DELETED</code>: The resource differs from its expected template configuration in that the resource has been deleted.</p> </li> <li> <p> <code>MODIFIED</code>: One or more resource properties differ from their expected template values.</p> </li> <li> <p> <code>IN_SYNC</code>: The resources's actual configuration matches its expected template configuration.</p> </li> <li> <p> <code>NOT_CHECKED</code>: AWS CloudFormation does not currently return this value.</p> </li> </ul>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A string that identifies the next page of stack resource drift results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"BoxedMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results.</p>\"\
        }\
      }\
    },\
    \"DescribeStackResourceDriftsOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackResourceDrifts\"],\
      \"members\":{\
        \"StackResourceDrifts\":{\
          \"shape\":\"StackResourceDrifts\",\
          \"documentation\":\"<p>Drift information for the resources that have been checked for drift in the specified stack. This includes actual and expected configuration values for resources where AWS CloudFormation detects drift.</p> <p>For a given stack, there will be one <code>StackResourceDrift</code> for each stack resource that has been checked for drift. Resources that have not yet been checked for drift are not included. Resources that do not currently support drift detection are not checked, and so not included. For a list of resources that support drift detection, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html\\\">Resources that Support Drift Detection</a>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the request doesn't return all of the remaining results, <code>NextToken</code> is set to a token. To retrieve the next set of results, call <code>DescribeStackResourceDrifts</code> again and assign that token to the request object's <code>NextToken</code> parameter. If the request returns all results, <code>NextToken</code> is set to <code>null</code>.</p>\"\
        }\
      }\
    },\
    \"DescribeStackResourceInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StackName\",\
        \"LogicalResourceId\"\
      ],\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name or the unique stack ID that is associated with the stack, which are not always interchangeable:</p> <ul> <li> <p>Running stacks: You can specify either the stack's name or its unique stack ID.</p> </li> <li> <p>Deleted stacks: You must specify the unique stack ID.</p> </li> </ul> <p>Default: There is no default value.</p>\"\
        },\
        \"LogicalResourceId\":{\
          \"shape\":\"LogicalResourceId\",\
          \"documentation\":\"<p>The logical name of the resource as specified in the template.</p> <p>Default: There is no default value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for <a>DescribeStackResource</a> action.</p>\"\
    },\
    \"DescribeStackResourceOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackResourceDetail\":{\
          \"shape\":\"StackResourceDetail\",\
          \"documentation\":\"<p>A <code>StackResourceDetail</code> structure containing the description of the specified resource in the specified stack.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for a <a>DescribeStackResource</a> action.</p>\"\
    },\
    \"DescribeStackResourcesInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name or the unique stack ID that is associated with the stack, which are not always interchangeable:</p> <ul> <li> <p>Running stacks: You can specify either the stack's name or its unique stack ID.</p> </li> <li> <p>Deleted stacks: You must specify the unique stack ID.</p> </li> </ul> <p>Default: There is no default value.</p> <p>Required: Conditional. If you do not specify <code>StackName</code>, you must specify <code>PhysicalResourceId</code>.</p>\"\
        },\
        \"LogicalResourceId\":{\
          \"shape\":\"LogicalResourceId\",\
          \"documentation\":\"<p>The logical name of the resource as specified in the template.</p> <p>Default: There is no default value.</p>\"\
        },\
        \"PhysicalResourceId\":{\
          \"shape\":\"PhysicalResourceId\",\
          \"documentation\":\"<p>The name or unique identifier that corresponds to a physical instance ID of a resource supported by AWS CloudFormation.</p> <p>For example, for an Amazon Elastic Compute Cloud (EC2) instance, <code>PhysicalResourceId</code> corresponds to the <code>InstanceId</code>. You can pass the EC2 <code>InstanceId</code> to <code>DescribeStackResources</code> to find which stack the instance belongs to and what other resources are part of the stack.</p> <p>Required: Conditional. If you do not specify <code>PhysicalResourceId</code>, you must specify <code>StackName</code>.</p> <p>Default: There is no default value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for <a>DescribeStackResources</a> action.</p>\"\
    },\
    \"DescribeStackResourcesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackResources\":{\
          \"shape\":\"StackResources\",\
          \"documentation\":\"<p>A list of <code>StackResource</code> structures.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for a <a>DescribeStackResources</a> action.</p>\"\
    },\
    \"DescribeStackSetInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackSetName\"],\
      \"members\":{\
        \"StackSetName\":{\
          \"shape\":\"StackSetName\",\
          \"documentation\":\"<p>The name or unique ID of the stack set whose description you want.</p>\"\
        }\
      }\
    },\
    \"DescribeStackSetOperationInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StackSetName\",\
        \"OperationId\"\
      ],\
      \"members\":{\
        \"StackSetName\":{\
          \"shape\":\"StackSetName\",\
          \"documentation\":\"<p>The name or the unique stack ID of the stack set for the stack operation.</p>\"\
        },\
        \"OperationId\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The unique ID of the stack set operation. </p>\"\
        }\
      }\
    },\
    \"DescribeStackSetOperationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackSetOperation\":{\
          \"shape\":\"StackSetOperation\",\
          \"documentation\":\"<p>The specified stack set operation.</p>\"\
        }\
      }\
    },\
    \"DescribeStackSetOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackSet\":{\
          \"shape\":\"StackSet\",\
          \"documentation\":\"<p>The specified stack set.</p>\"\
        }\
      }\
    },\
    \"DescribeStacksInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name or the unique stack ID that is associated with the stack, which are not always interchangeable:</p> <ul> <li> <p>Running stacks: You can specify either the stack's name or its unique stack ID.</p> </li> <li> <p>Deleted stacks: You must specify the unique stack ID.</p> </li> </ul> <p>Default: There is no default value.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A string that identifies the next page of stacks that you want to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for <a>DescribeStacks</a> action.</p>\"\
    },\
    \"DescribeStacksOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Stacks\":{\
          \"shape\":\"Stacks\",\
          \"documentation\":\"<p>A list of stack structures.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the output exceeds 1 MB in size, a string that identifies the next page of stacks. If no additional page exists, this value is null.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for a <a>DescribeStacks</a> action.</p>\"\
    },\
    \"DescribeTypeInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"RegistryType\",\
          \"documentation\":\"<p>The kind of type. </p> <p>Currently the only valid value is <code>RESOURCE</code>.</p> <p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>\"\
        },\
        \"TypeName\":{\
          \"shape\":\"TypeName\",\
          \"documentation\":\"<p>The name of the type.</p> <p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"TypeArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the type.</p> <p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"TypeVersionId\",\
          \"documentation\":\"<p>The ID of a specific version of the type. The version ID is the value at the end of the Amazon Resource Name (ARN) assigned to the type version when it is registered.</p> <p>If you specify a <code>VersionId</code>, <code>DescribeType</code> returns information about that specific type version. Otherwise, it returns information about the default type version.</p>\"\
        }\
      }\
    },\
    \"DescribeTypeOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"TypeArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the type.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"RegistryType\",\
          \"documentation\":\"<p>The kind of type. </p> <p>Currently the only valid value is <code>RESOURCE</code>.</p>\"\
        },\
        \"TypeName\":{\
          \"shape\":\"TypeName\",\
          \"documentation\":\"<p>The name of the registered type.</p>\"\
        },\
        \"DefaultVersionId\":{\
          \"shape\":\"TypeVersionId\",\
          \"documentation\":\"<p>The ID of the default version of the type. The default version is used when the type version is not specified.</p> <p>To set the default version of a type, use <code> <a>SetTypeDefaultVersion</a> </code>. </p>\"\
        },\
        \"IsDefaultVersion\":{\
          \"shape\":\"IsDefaultVersion\",\
          \"documentation\":\"<p>Whether the specified type version is set as the default version.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the registered type.</p>\"\
        },\
        \"Schema\":{\
          \"shape\":\"TypeSchema\",\
          \"documentation\":\"<p>The schema that defines the type.</p> <p>For more information on type schemas, see <a href=\\\"https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html\\\">Resource Provider Schema</a> in the <i>CloudFormation CLI User Guide</i>.</p>\"\
        },\
        \"ProvisioningType\":{\
          \"shape\":\"ProvisioningType\",\
          \"documentation\":\"<p>The provisioning behavior of the type. AWS CloudFormation determines the provisioning type during registration, based on the types of handlers in the schema handler package submitted.</p> <p>Valid values include:</p> <ul> <li> <p> <code>FULLY_MUTABLE</code>: The type includes an update handler to process updates to the type during stack update operations.</p> </li> <li> <p> <code>IMMUTABLE</code>: The type does not include an update handler, so the type cannot be updated and must instead be replaced during stack update operations.</p> </li> <li> <p> <code>NON_PROVISIONABLE</code>: The type does not include all of the following handlers, and therefore cannot actually be provisioned.</p> <ul> <li> <p>create</p> </li> <li> <p>read</p> </li> <li> <p>delete</p> </li> </ul> </li> </ul>\"\
        },\
        \"DeprecatedStatus\":{\
          \"shape\":\"DeprecatedStatus\",\
          \"documentation\":\"<p>The deprecation status of the type.</p> <p>Valid values include:</p> <ul> <li> <p> <code>LIVE</code>: The type is registered and can be used in CloudFormation operations, dependent on its provisioning behavior and visibility scope.</p> </li> <li> <p> <code>DEPRECATED</code>: The type has been deregistered and can no longer be used in CloudFormation operations. </p> </li> </ul>\"\
        },\
        \"LoggingConfig\":{\
          \"shape\":\"LoggingConfig\",\
          \"documentation\":\"<p>Contains logging configuration information for a type.</p>\"\
        },\
        \"ExecutionRoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM execution role used to register the type. If your resource type calls AWS APIs in any of its handlers, you must create an <i> <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html\\\">IAM execution role</a> </i> that includes the necessary permissions to call those AWS APIs, and provision that execution role in your account. CloudFormation then assumes that execution role to provide your resource type with the appropriate credentials.</p>\"\
        },\
        \"Visibility\":{\
          \"shape\":\"Visibility\",\
          \"documentation\":\"<p>The scope at which the type is visible and usable in CloudFormation operations.</p> <p>Valid values include:</p> <ul> <li> <p> <code>PRIVATE</code>: The type is only visible and usable within the account in which it is registered. Currently, AWS CloudFormation marks any types you register as <code>PRIVATE</code>.</p> </li> <li> <p> <code>PUBLIC</code>: The type is publically visible and usable within any Amazon account.</p> </li> </ul>\"\
        },\
        \"SourceUrl\":{\
          \"shape\":\"OptionalSecureUrl\",\
          \"documentation\":\"<p>The URL of the source code for the type.</p>\"\
        },\
        \"DocumentationUrl\":{\
          \"shape\":\"OptionalSecureUrl\",\
          \"documentation\":\"<p>The URL of a page providing detailed documentation for this type.</p>\"\
        },\
        \"LastUpdated\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the specified type version was registered.</p>\"\
        },\
        \"TimeCreated\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the specified type version was registered.</p>\"\
        }\
      }\
    },\
    \"DescribeTypeRegistrationInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"RegistrationToken\"],\
      \"members\":{\
        \"RegistrationToken\":{\
          \"shape\":\"RegistrationToken\",\
          \"documentation\":\"<p>The identifier for this registration request.</p> <p>This registration token is generated by CloudFormation when you initiate a registration request using <code> <a>RegisterType</a> </code>.</p>\"\
        }\
      }\
    },\
    \"DescribeTypeRegistrationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProgressStatus\":{\
          \"shape\":\"RegistrationStatus\",\
          \"documentation\":\"<p>The current status of the type registration request.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the type registration request.</p>\"\
        },\
        \"TypeArn\":{\
          \"shape\":\"TypeArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the type being registered.</p> <p>For registration requests with a <code>ProgressStatus</code> of other than <code>COMPLETE</code>, this will be <code>null</code>.</p>\"\
        },\
        \"TypeVersionArn\":{\
          \"shape\":\"TypeArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of this specific version of the type being registered.</p> <p>For registration requests with a <code>ProgressStatus</code> of other than <code>COMPLETE</code>, this will be <code>null</code>.</p>\"\
        }\
      }\
    },\
    \"Description\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"DetectStackDriftInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackName\"],\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackNameOrId\",\
          \"documentation\":\"<p>The name of the stack for which you want to detect drift. </p>\"\
        },\
        \"LogicalResourceIds\":{\
          \"shape\":\"LogicalResourceIds\",\
          \"documentation\":\"<p>The logical names of any resources you want to use as filters.</p>\"\
        }\
      }\
    },\
    \"DetectStackDriftOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackDriftDetectionId\"],\
      \"members\":{\
        \"StackDriftDetectionId\":{\
          \"shape\":\"StackDriftDetectionId\",\
          \"documentation\":\"<p>The ID of the drift detection results of this operation. </p> <p>AWS CloudFormation generates new results, with a new drift detection ID, each time this operation is run. However, the number of drift results AWS CloudFormation retains for any given stack, and for how long, may vary. </p>\"\
        }\
      }\
    },\
    \"DetectStackResourceDriftInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StackName\",\
        \"LogicalResourceId\"\
      ],\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackNameOrId\",\
          \"documentation\":\"<p>The name of the stack to which the resource belongs.</p>\"\
        },\
        \"LogicalResourceId\":{\
          \"shape\":\"LogicalResourceId\",\
          \"documentation\":\"<p>The logical name of the resource for which to return drift information.</p>\"\
        }\
      }\
    },\
    \"DetectStackResourceDriftOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackResourceDrift\"],\
      \"members\":{\
        \"StackResourceDrift\":{\
          \"shape\":\"StackResourceDrift\",\
          \"documentation\":\"<p>Information about whether the resource's actual configuration has drifted from its expected template configuration, including actual and expected property values and any differences detected.</p>\"\
        }\
      }\
    },\
    \"DetectStackSetDriftInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackSetName\"],\
      \"members\":{\
        \"StackSetName\":{\
          \"shape\":\"StackSetNameOrId\",\
          \"documentation\":\"<p>The name of the stack set on which to perform the drift detection operation.</p>\"\
        },\
        \"OperationPreferences\":{\"shape\":\"StackSetOperationPreferences\"},\
        \"OperationId\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p> <i>The ID of the stack set operation.</i> </p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"DetectStackSetDriftOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The ID of the drift detection stack set operation. </p> <p>you can use this operation id with <code> <a>DescribeStackSetOperation</a> </code> to monitor the progress of the drift detection operation. </p>\"\
        }\
      }\
    },\
    \"DifferenceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ADD\",\
        \"REMOVE\",\
        \"NOT_EQUAL\"\
      ]\
    },\
    \"DisableRollback\":{\"type\":\"boolean\"},\
    \"DriftedStackInstancesCount\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"EnableTerminationProtection\":{\"type\":\"boolean\"},\
    \"ErrorMessage\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"EstimateTemplateCostInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>Structure containing the template body with a minimum length of 1 byte and a maximum length of 51,200 bytes. (For more information, go to <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html\\\">Template Anatomy</a> in the AWS CloudFormation User Guide.)</p> <p>Conditional: You must pass <code>TemplateBody</code> or <code>TemplateURL</code>. If both are passed, only <code>TemplateBody</code> is used.</p>\"\
        },\
        \"TemplateURL\":{\
          \"shape\":\"TemplateURL\",\
          \"documentation\":\"<p>Location of file containing the template body. The URL must point to a template that is located in an Amazon S3 bucket. For more information, go to <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html\\\">Template Anatomy</a> in the AWS CloudFormation User Guide.</p> <p>Conditional: You must pass <code>TemplateURL</code> or <code>TemplateBody</code>. If both are passed, only <code>TemplateBody</code> is used.</p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"Parameters\",\
          \"documentation\":\"<p>A list of <code>Parameter</code> structures that specify input parameters.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for an <a>EstimateTemplateCost</a> action.</p>\"\
    },\
    \"EstimateTemplateCostOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Url\":{\
          \"shape\":\"Url\",\
          \"documentation\":\"<p>An AWS Simple Monthly Calculator URL with a query string that describes the resources required to run the template.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for a <a>EstimateTemplateCost</a> action.</p>\"\
    },\
    \"EvaluationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Static\",\
        \"Dynamic\"\
      ]\
    },\
    \"EventId\":{\"type\":\"string\"},\
    \"ExecuteChangeSetInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ChangeSetName\"],\
      \"members\":{\
        \"ChangeSetName\":{\
          \"shape\":\"ChangeSetNameOrId\",\
          \"documentation\":\"<p>The name or ARN of the change set that you want use to update the specified stack.</p>\"\
        },\
        \"StackName\":{\
          \"shape\":\"StackNameOrId\",\
          \"documentation\":\"<p>If you specified the name of a change set, specify the stack name or ID (ARN) that is associated with the change set you want to execute.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>A unique identifier for this <code>ExecuteChangeSet</code> request. Specify this token if you plan to retry requests so that AWS CloudFormation knows that you're not attempting to execute a change set to update a stack with the same name. You might retry <code>ExecuteChangeSet</code> requests to ensure that AWS CloudFormation successfully received them.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <a>ExecuteChangeSet</a> action.</p>\"\
    },\
    \"ExecuteChangeSetOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output for the <a>ExecuteChangeSet</a> action.</p>\"\
    },\
    \"ExecutionRoleName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z_0-9+=,.@-]+\"\
    },\
    \"ExecutionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"UNAVAILABLE\",\
        \"AVAILABLE\",\
        \"EXECUTE_IN_PROGRESS\",\
        \"EXECUTE_COMPLETE\",\
        \"EXECUTE_FAILED\",\
        \"OBSOLETE\"\
      ]\
    },\
    \"Export\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ExportingStackId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>The stack that contains the exported output name and value.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ExportName\",\
          \"documentation\":\"<p>The name of exported output value. Use this name and the <code>Fn::ImportValue</code> function to import the associated value into other stacks. The name is defined in the <code>Export</code> field in the associated stack's <code>Outputs</code> section.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"ExportValue\",\
          \"documentation\":\"<p>The value of the exported output, such as a resource physical ID. This value is defined in the <code>Export</code> field in the associated stack's <code>Outputs</code> section.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The <code>Export</code> structure describes the exported output values for a stack.</p>\"\
    },\
    \"ExportName\":{\"type\":\"string\"},\
    \"ExportValue\":{\"type\":\"string\"},\
    \"Exports\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Export\"}\
    },\
    \"FailedStackInstancesCount\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"FailureToleranceCount\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"FailureTolerancePercentage\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"GetStackPolicyInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackName\"],\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name or unique stack ID that is associated with the stack whose policy you want to get.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <a>GetStackPolicy</a> action.</p>\"\
    },\
    \"GetStackPolicyOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackPolicyBody\":{\
          \"shape\":\"StackPolicyBody\",\
          \"documentation\":\"<p>Structure containing the stack policy body. (For more information, go to <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html\\\"> Prevent Updates to Stack Resources</a> in the AWS CloudFormation User Guide.)</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for the <a>GetStackPolicy</a> action.</p>\"\
    },\
    \"GetTemplateInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name or the unique stack ID that is associated with the stack, which are not always interchangeable:</p> <ul> <li> <p>Running stacks: You can specify either the stack's name or its unique stack ID.</p> </li> <li> <p>Deleted stacks: You must specify the unique stack ID.</p> </li> </ul> <p>Default: There is no default value.</p>\"\
        },\
        \"ChangeSetName\":{\
          \"shape\":\"ChangeSetNameOrId\",\
          \"documentation\":\"<p>The name or Amazon Resource Name (ARN) of a change set for which AWS CloudFormation returns the associated template. If you specify a name, you must also specify the <code>StackName</code>.</p>\"\
        },\
        \"TemplateStage\":{\
          \"shape\":\"TemplateStage\",\
          \"documentation\":\"<p>For templates that include transforms, the stage of the template that AWS CloudFormation returns. To get the user-submitted template, specify <code>Original</code>. To get the template after AWS CloudFormation has processed all transforms, specify <code>Processed</code>. </p> <p>If the template doesn't include transforms, <code>Original</code> and <code>Processed</code> return the same template. By default, AWS CloudFormation specifies <code>Original</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for a <a>GetTemplate</a> action.</p>\"\
    },\
    \"GetTemplateOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>Structure containing the template body. (For more information, go to <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html\\\">Template Anatomy</a> in the AWS CloudFormation User Guide.)</p> <p>AWS CloudFormation returns the same template that was used when the stack was created.</p>\"\
        },\
        \"StagesAvailable\":{\
          \"shape\":\"StageList\",\
          \"documentation\":\"<p>The stage of the template that you can retrieve. For stacks, the <code>Original</code> and <code>Processed</code> templates are always available. For change sets, the <code>Original</code> template is always available. After AWS CloudFormation finishes creating the change set, the <code>Processed</code> template becomes available.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for <a>GetTemplate</a> action.</p>\"\
    },\
    \"GetTemplateSummaryInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>Structure containing the template body with a minimum length of 1 byte and a maximum length of 51,200 bytes. For more information about templates, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html\\\">Template Anatomy</a> in the AWS CloudFormation User Guide.</p> <p>Conditional: You must specify only one of the following parameters: <code>StackName</code>, <code>StackSetName</code>, <code>TemplateBody</code>, or <code>TemplateURL</code>.</p>\"\
        },\
        \"TemplateURL\":{\
          \"shape\":\"TemplateURL\",\
          \"documentation\":\"<p>Location of file containing the template body. The URL must point to a template (max size: 460,800 bytes) that is located in an Amazon S3 bucket. For more information about templates, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html\\\">Template Anatomy</a> in the AWS CloudFormation User Guide.</p> <p>Conditional: You must specify only one of the following parameters: <code>StackName</code>, <code>StackSetName</code>, <code>TemplateBody</code>, or <code>TemplateURL</code>.</p>\"\
        },\
        \"StackName\":{\
          \"shape\":\"StackNameOrId\",\
          \"documentation\":\"<p>The name or the stack ID that is associated with the stack, which are not always interchangeable. For running stacks, you can specify either the stack's name or its unique stack ID. For deleted stack, you must specify the unique stack ID.</p> <p>Conditional: You must specify only one of the following parameters: <code>StackName</code>, <code>StackSetName</code>, <code>TemplateBody</code>, or <code>TemplateURL</code>.</p>\"\
        },\
        \"StackSetName\":{\
          \"shape\":\"StackSetNameOrId\",\
          \"documentation\":\"<p>The name or unique ID of the stack set from which the stack was created.</p> <p>Conditional: You must specify only one of the following parameters: <code>StackName</code>, <code>StackSetName</code>, <code>TemplateBody</code>, or <code>TemplateURL</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <a>GetTemplateSummary</a> action.</p>\"\
    },\
    \"GetTemplateSummaryOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Parameters\":{\
          \"shape\":\"ParameterDeclarations\",\
          \"documentation\":\"<p>A list of parameter declarations that describe various properties for each parameter.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The value that is defined in the <code>Description</code> property of the template.</p>\"\
        },\
        \"Capabilities\":{\
          \"shape\":\"Capabilities\",\
          \"documentation\":\"<p>The capabilities found within the template. If your template contains IAM resources, you must specify the CAPABILITY_IAM or CAPABILITY_NAMED_IAM value for this parameter when you use the <a>CreateStack</a> or <a>UpdateStack</a> actions with your template; otherwise, those actions return an InsufficientCapabilities error.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities\\\">Acknowledging IAM Resources in AWS CloudFormation Templates</a>.</p>\"\
        },\
        \"CapabilitiesReason\":{\
          \"shape\":\"CapabilitiesReason\",\
          \"documentation\":\"<p>The list of resources that generated the values in the <code>Capabilities</code> response element.</p>\"\
        },\
        \"ResourceTypes\":{\
          \"shape\":\"ResourceTypes\",\
          \"documentation\":\"<p>A list of all the template resource types that are defined in the template, such as <code>AWS::EC2::Instance</code>, <code>AWS::Dynamo::Table</code>, and <code>Custom::MyCustomInstance</code>.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The AWS template format version, which identifies the capabilities of the template.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The value that is defined for the <code>Metadata</code> property of the template.</p>\"\
        },\
        \"DeclaredTransforms\":{\
          \"shape\":\"TransformsList\",\
          \"documentation\":\"<p>A list of the transforms that are declared in the template.</p>\"\
        },\
        \"ResourceIdentifierSummaries\":{\
          \"shape\":\"ResourceIdentifierSummaries\",\
          \"documentation\":\"<p>A list of resource identifier summaries that describe the target resources of an import operation and the properties you can provide during the import to identify the target resources. For example, <code>BucketName</code> is a possible identifier property for an <code>AWS::S3::Bucket</code> resource. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for the <a>GetTemplateSummary</a> action.</p>\"\
    },\
    \"HandlerErrorCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NotUpdatable\",\
        \"InvalidRequest\",\
        \"AccessDenied\",\
        \"InvalidCredentials\",\
        \"AlreadyExists\",\
        \"NotFound\",\
        \"ResourceConflict\",\
        \"Throttling\",\
        \"ServiceLimitExceeded\",\
        \"NotStabilized\",\
        \"GeneralServiceException\",\
        \"ServiceInternalError\",\
        \"NetworkFailure\",\
        \"InternalFailure\"\
      ]\
    },\
    \"Imports\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StackName\"}\
    },\
    \"InProgressStackInstancesCount\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"InSyncStackInstancesCount\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"InsufficientCapabilitiesException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The template contains resources with capabilities that weren't specified in the Capabilities parameter.</p>\",\
      \"error\":{\
        \"code\":\"InsufficientCapabilitiesException\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidChangeSetStatusException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified change set can't be used to update the stack. For example, the change set status might be <code>CREATE_IN_PROGRESS</code>, or the stack status might be <code>UPDATE_IN_PROGRESS</code>.</p>\",\
      \"error\":{\
        \"code\":\"InvalidChangeSetStatus\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidOperationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified operation isn't valid.</p>\",\
      \"error\":{\
        \"code\":\"InvalidOperationException\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidStateTransitionException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Error reserved for use by the <a href=\\\"https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html\\\">CloudFormation CLI</a>. CloudFormation does not return this error to users.</p>\",\
      \"error\":{\
        \"code\":\"InvalidStateTransition\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"IsDefaultVersion\":{\"type\":\"boolean\"},\
    \"Key\":{\"type\":\"string\"},\
    \"LastUpdatedTime\":{\"type\":\"timestamp\"},\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The quota for the resource has already been reached.</p> <p>For information on resource and stack limitations, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html\\\">Limits</a> in the <i>AWS CloudFormation User Guide</i>.</p>\",\
      \"error\":{\
        \"code\":\"LimitExceededException\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"LimitName\":{\"type\":\"string\"},\
    \"LimitValue\":{\"type\":\"integer\"},\
    \"ListChangeSetsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackName\"],\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackNameOrId\",\
          \"documentation\":\"<p>The name or the Amazon Resource Name (ARN) of the stack for which you want to list change sets.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A string (provided by the <a>ListChangeSets</a> response output) that identifies the next page of change sets that you want to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <a>ListChangeSets</a> action.</p>\"\
    },\
    \"ListChangeSetsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Summaries\":{\
          \"shape\":\"ChangeSetSummaries\",\
          \"documentation\":\"<p>A list of <code>ChangeSetSummary</code> structures that provides the ID and status of each change set for the specified stack.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the output exceeds 1 MB, a string that identifies the next page of change sets. If there is no additional page, this value is null.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for the <a>ListChangeSets</a> action.</p>\"\
    },\
    \"ListExportsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A string (provided by the <a>ListExports</a> response output) that identifies the next page of exported output values that you asked to retrieve.</p>\"\
        }\
      }\
    },\
    \"ListExportsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Exports\":{\
          \"shape\":\"Exports\",\
          \"documentation\":\"<p>The output for the <a>ListExports</a> action.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the output exceeds 100 exported output values, a string that identifies the next page of exports. If there is no additional page, this value is null.</p>\"\
        }\
      }\
    },\
    \"ListImportsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ExportName\"],\
      \"members\":{\
        \"ExportName\":{\
          \"shape\":\"ExportName\",\
          \"documentation\":\"<p>The name of the exported output value. AWS CloudFormation returns the stack names that are importing this value. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A string (provided by the <a>ListImports</a> response output) that identifies the next page of stacks that are importing the specified exported output value. </p>\"\
        }\
      }\
    },\
    \"ListImportsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Imports\":{\
          \"shape\":\"Imports\",\
          \"documentation\":\"<p>A list of stack names that are importing the specified exported output value. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A string that identifies the next page of exports. If there is no additional page, this value is null.</p>\"\
        }\
      }\
    },\
    \"ListStackInstancesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackSetName\"],\
      \"members\":{\
        \"StackSetName\":{\
          \"shape\":\"StackSetName\",\
          \"documentation\":\"<p>The name or unique ID of the stack set that you want to list stack instances for.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous request didn't return all of the remaining results, the response's <code>NextToken</code> parameter value is set to a token. To retrieve the next set of results, call <code>ListStackInstances</code> again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, the previous response object's <code>NextToken</code> parameter is set to <code>null</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"StackInstanceFilters\",\
          \"documentation\":\"<p>The status that stack instances are filtered by.</p>\"\
        },\
        \"StackInstanceAccount\":{\
          \"shape\":\"Account\",\
          \"documentation\":\"<p>The name of the AWS account that you want to list stack instances for.</p>\"\
        },\
        \"StackInstanceRegion\":{\
          \"shape\":\"Region\",\
          \"documentation\":\"<p>The name of the Region where you want to list stack instances. </p>\"\
        }\
      }\
    },\
    \"ListStackInstancesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Summaries\":{\
          \"shape\":\"StackInstanceSummaries\",\
          \"documentation\":\"<p>A list of <code>StackInstanceSummary</code> structures that contain information about the specified stack instances.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the request doesn't return all of the remaining results, <code>NextToken</code> is set to a token. To retrieve the next set of results, call <code>ListStackInstances</code> again and assign that token to the request object's <code>NextToken</code> parameter. If the request returns all results, <code>NextToken</code> is set to <code>null</code>.</p>\"\
        }\
      }\
    },\
    \"ListStackResourcesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackName\"],\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name or the unique stack ID that is associated with the stack, which are not always interchangeable:</p> <ul> <li> <p>Running stacks: You can specify either the stack's name or its unique stack ID.</p> </li> <li> <p>Deleted stacks: You must specify the unique stack ID.</p> </li> </ul> <p>Default: There is no default value.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A string that identifies the next page of stack resources that you want to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <a>ListStackResource</a> action.</p>\"\
    },\
    \"ListStackResourcesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackResourceSummaries\":{\
          \"shape\":\"StackResourceSummaries\",\
          \"documentation\":\"<p>A list of <code>StackResourceSummary</code> structures.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the output exceeds 1 MB, a string that identifies the next page of stack resources. If no additional page exists, this value is null.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for a <a>ListStackResources</a> action.</p>\"\
    },\
    \"ListStackSetOperationResultsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StackSetName\",\
        \"OperationId\"\
      ],\
      \"members\":{\
        \"StackSetName\":{\
          \"shape\":\"StackSetName\",\
          \"documentation\":\"<p>The name or unique ID of the stack set that you want to get operation results for.</p>\"\
        },\
        \"OperationId\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The ID of the stack set operation.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous request didn't return all of the remaining results, the response object's <code>NextToken</code> parameter value is set to a token. To retrieve the next set of results, call <code>ListStackSetOperationResults</code> again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, the previous response object's <code>NextToken</code> parameter is set to <code>null</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListStackSetOperationResultsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Summaries\":{\
          \"shape\":\"StackSetOperationResultSummaries\",\
          \"documentation\":\"<p>A list of <code>StackSetOperationResultSummary</code> structures that contain information about the specified operation results, for accounts and Regions that are included in the operation.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the request doesn't return all results, <code>NextToken</code> is set to a token. To retrieve the next set of results, call <code>ListOperationResults</code> again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, <code>NextToken</code> is set to <code>null</code>.</p>\"\
        }\
      }\
    },\
    \"ListStackSetOperationsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackSetName\"],\
      \"members\":{\
        \"StackSetName\":{\
          \"shape\":\"StackSetName\",\
          \"documentation\":\"<p>The name or unique ID of the stack set that you want to get operation summaries for.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous paginated request didn't return all of the remaining results, the response object's <code>NextToken</code> parameter value is set to a token. To retrieve the next set of results, call <code>ListStackSetOperations</code> again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, the previous response object's <code>NextToken</code> parameter is set to <code>null</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListStackSetOperationsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Summaries\":{\
          \"shape\":\"StackSetOperationSummaries\",\
          \"documentation\":\"<p>A list of <code>StackSetOperationSummary</code> structures that contain summary information about operations for the specified stack set.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the request doesn't return all results, <code>NextToken</code> is set to a token. To retrieve the next set of results, call <code>ListOperationResults</code> again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, <code>NextToken</code> is set to <code>null</code>.</p>\"\
        }\
      }\
    },\
    \"ListStackSetsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous paginated request didn't return all of the remaining results, the response object's <code>NextToken</code> parameter value is set to a token. To retrieve the next set of results, call <code>ListStackSets</code> again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, the previous response object's <code>NextToken</code> parameter is set to <code>null</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StackSetStatus\",\
          \"documentation\":\"<p>The status of the stack sets that you want to get summary information about.</p>\"\
        }\
      }\
    },\
    \"ListStackSetsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Summaries\":{\
          \"shape\":\"StackSetSummaries\",\
          \"documentation\":\"<p>A list of <code>StackSetSummary</code> structures that contain information about the user's stack sets.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the request doesn't return all of the remaining results, <code>NextToken</code> is set to a token. To retrieve the next set of results, call <code>ListStackInstances</code> again and assign that token to the request object's <code>NextToken</code> parameter. If the request returns all results, <code>NextToken</code> is set to <code>null</code>.</p>\"\
        }\
      }\
    },\
    \"ListStacksInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A string that identifies the next page of stacks that you want to retrieve.</p>\"\
        },\
        \"StackStatusFilter\":{\
          \"shape\":\"StackStatusFilter\",\
          \"documentation\":\"<p>Stack status to use as a filter. Specify one or more stack status codes to list only stacks with the specified status codes. For a complete list of stack status codes, see the <code>StackStatus</code> parameter of the <a>Stack</a> data type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for <a>ListStacks</a> action.</p>\"\
    },\
    \"ListStacksOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackSummaries\":{\
          \"shape\":\"StackSummaries\",\
          \"documentation\":\"<p>A list of <code>StackSummary</code> structures containing information about the specified stacks.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the output exceeds 1 MB in size, a string that identifies the next page of stacks. If no additional page exists, this value is null.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for <a>ListStacks</a> action.</p>\"\
    },\
    \"ListTypeRegistrationsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"RegistryType\",\
          \"documentation\":\"<p>The kind of type.</p> <p>Currently the only valid value is <code>RESOURCE</code>.</p> <p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>\"\
        },\
        \"TypeName\":{\
          \"shape\":\"TypeName\",\
          \"documentation\":\"<p>The name of the type.</p> <p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>\"\
        },\
        \"TypeArn\":{\
          \"shape\":\"TypeArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the type.</p> <p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>\"\
        },\
        \"RegistrationStatusFilter\":{\
          \"shape\":\"RegistrationStatus\",\
          \"documentation\":\"<p>The current status of the type registration request.</p> <p>The default is <code>IN_PROGRESS</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous paginated request didn't return all of the remaining results, the response object's <code>NextToken</code> parameter value is set to a token. To retrieve the next set of results, call this action again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, the previous response object's <code>NextToken</code> parameter is set to <code>null</code>.</p>\"\
        }\
      }\
    },\
    \"ListTypeRegistrationsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RegistrationTokenList\":{\
          \"shape\":\"RegistrationTokenList\",\
          \"documentation\":\"<p> A list of type registration tokens.</p> <p>Use <code> <a>DescribeTypeRegistration</a> </code> to return detailed information about a type registration request.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the request doesn't return all of the remaining results, <code>NextToken</code> is set to a token. To retrieve the next set of results, call this action again and assign that token to the request object's <code>NextToken</code> parameter. If the request returns all results, <code>NextToken</code> is set to <code>null</code>.</p>\"\
        }\
      }\
    },\
    \"ListTypeVersionsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"RegistryType\",\
          \"documentation\":\"<p>The kind of the type.</p> <p>Currently the only valid value is <code>RESOURCE</code>.</p> <p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>\"\
        },\
        \"TypeName\":{\
          \"shape\":\"TypeName\",\
          \"documentation\":\"<p>The name of the type for which you want version summary information.</p> <p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"PrivateTypeArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the type for which you want version summary information.</p> <p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous paginated request didn't return all of the remaining results, the response object's <code>NextToken</code> parameter value is set to a token. To retrieve the next set of results, call this action again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, the previous response object's <code>NextToken</code> parameter is set to <code>null</code>.</p>\"\
        },\
        \"DeprecatedStatus\":{\
          \"shape\":\"DeprecatedStatus\",\
          \"documentation\":\"<p>The deprecation status of the type versions that you want to get summary information about.</p> <p>Valid values include:</p> <ul> <li> <p> <code>LIVE</code>: The type version is registered and can be used in CloudFormation operations, dependent on its provisioning behavior and visibility scope.</p> </li> <li> <p> <code>DEPRECATED</code>: The type version has been deregistered and can no longer be used in CloudFormation operations. </p> </li> </ul> <p>The default is <code>LIVE</code>.</p>\"\
        }\
      }\
    },\
    \"ListTypeVersionsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TypeVersionSummaries\":{\
          \"shape\":\"TypeVersionSummaries\",\
          \"documentation\":\"<p>A list of <code>TypeVersionSummary</code> structures that contain information about the specified type's versions.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the request doesn't return all of the remaining results, <code>NextToken</code> is set to a token. To retrieve the next set of results, call this action again and assign that token to the request object's <code>NextToken</code> parameter. If the request returns all results, <code>NextToken</code> is set to <code>null</code>.</p>\"\
        }\
      }\
    },\
    \"ListTypesInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Visibility\":{\
          \"shape\":\"Visibility\",\
          \"documentation\":\"<p>The scope at which the type is visible and usable in CloudFormation operations.</p> <p>Valid values include:</p> <ul> <li> <p> <code>PRIVATE</code>: The type is only visible and usable within the account in which it is registered. Currently, AWS CloudFormation marks any types you create as <code>PRIVATE</code>.</p> </li> <li> <p> <code>PUBLIC</code>: The type is publically visible and usable within any Amazon account.</p> </li> </ul> <p>The default is <code>PRIVATE</code>.</p>\"\
        },\
        \"ProvisioningType\":{\
          \"shape\":\"ProvisioningType\",\
          \"documentation\":\"<p>The provisioning behavior of the type. AWS CloudFormation determines the provisioning type during registration, based on the types of handlers in the schema handler package submitted.</p> <p>Valid values include:</p> <ul> <li> <p> <code>FULLY_MUTABLE</code>: The type includes an update handler to process updates to the type during stack update operations.</p> </li> <li> <p> <code>IMMUTABLE</code>: The type does not include an update handler, so the type cannot be updated and must instead be replaced during stack update operations.</p> </li> <li> <p> <code>NON_PROVISIONABLE</code>: The type does not include create, read, and delete handlers, and therefore cannot actually be provisioned.</p> </li> </ul>\"\
        },\
        \"DeprecatedStatus\":{\
          \"shape\":\"DeprecatedStatus\",\
          \"documentation\":\"<p>The deprecation status of the types that you want to get summary information about.</p> <p>Valid values include:</p> <ul> <li> <p> <code>LIVE</code>: The type is registered for use in CloudFormation operations.</p> </li> <li> <p> <code>DEPRECATED</code>: The type has been deregistered and can no longer be used in CloudFormation operations. </p> </li> </ul>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous paginated request didn't return all of the remaining results, the response object's <code>NextToken</code> parameter value is set to a token. To retrieve the next set of results, call this action again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, the previous response object's <code>NextToken</code> parameter is set to <code>null</code>.</p>\"\
        }\
      }\
    },\
    \"ListTypesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TypeSummaries\":{\
          \"shape\":\"TypeSummaries\",\
          \"documentation\":\"<p>A list of <code>TypeSummary</code> structures that contain information about the specified types.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the request doesn't return all of the remaining results, <code>NextToken</code> is set to a token. To retrieve the next set of results, call this action again and assign that token to the request object's <code>NextToken</code> parameter. If the request returns all results, <code>NextToken</code> is set to <code>null</code>.</p>\"\
        }\
      }\
    },\
    \"LogGroupName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"[\\\\.\\\\-_/#A-Za-z0-9]+\"\
    },\
    \"LoggingConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LogRoleArn\",\
        \"LogGroupName\"\
      ],\
      \"members\":{\
        \"LogRoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of the role that CloudFormation should assume when sending log entries to CloudWatch logs.</p>\"\
        },\
        \"LogGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The Amazon CloudWatch log group to which CloudFormation sends error logging information when invoking the type's handlers.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains logging configuration information for a type.</p>\"\
    },\
    \"LogicalResourceId\":{\"type\":\"string\"},\
    \"LogicalResourceIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogicalResourceId\"},\
      \"max\":200,\
      \"min\":1\
    },\
    \"MaxConcurrentCount\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"MaxConcurrentPercentage\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"Metadata\":{\"type\":\"string\"},\
    \"MonitoringTimeInMinutes\":{\
      \"type\":\"integer\",\
      \"max\":180,\
      \"min\":0\
    },\
    \"NameAlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified name is already in use.</p>\",\
      \"error\":{\
        \"code\":\"NameAlreadyExistsException\",\
        \"httpStatusCode\":409,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"NoEcho\":{\"type\":\"boolean\"},\
    \"NotificationARN\":{\"type\":\"string\"},\
    \"NotificationARNs\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NotificationARN\"},\
      \"max\":5\
    },\
    \"OnFailure\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DO_NOTHING\",\
        \"ROLLBACK\",\
        \"DELETE\"\
      ]\
    },\
    \"OperationIdAlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified operation ID already exists.</p>\",\
      \"error\":{\
        \"code\":\"OperationIdAlreadyExistsException\",\
        \"httpStatusCode\":409,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"OperationInProgressException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Another operation is currently in progress for this stack set. Only one operation can be performed for a stack set at a given time.</p>\",\
      \"error\":{\
        \"code\":\"OperationInProgressException\",\
        \"httpStatusCode\":409,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"OperationNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified ID refers to an operation that doesn't exist.</p>\",\
      \"error\":{\
        \"code\":\"OperationNotFoundException\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"OperationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"IN_PROGRESS\",\
        \"SUCCESS\",\
        \"FAILED\"\
      ]\
    },\
    \"OperationStatusCheckFailedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Error reserved for use by the <a href=\\\"https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html\\\">CloudFormation CLI</a>. CloudFormation does not return this error to users.</p>\",\
      \"error\":{\
        \"code\":\"ConditionalCheckFailed\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"OptionalSecureUrl\":{\
      \"type\":\"string\",\
      \"max\":4096\
    },\
    \"OrganizationalUnitId\":{\
      \"type\":\"string\",\
      \"pattern\":\"^(ou-[a-z0-9]{4,32}-[a-z0-9]{8,32}|r-[a-z0-9]{4,32})$\"\
    },\
    \"OrganizationalUnitIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"OrganizationalUnitId\"}\
    },\
    \"Output\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OutputKey\":{\
          \"shape\":\"OutputKey\",\
          \"documentation\":\"<p>The key associated with the output.</p>\"\
        },\
        \"OutputValue\":{\
          \"shape\":\"OutputValue\",\
          \"documentation\":\"<p>The value associated with the output.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>User defined description associated with the output.</p>\"\
        },\
        \"ExportName\":{\
          \"shape\":\"ExportName\",\
          \"documentation\":\"<p>The name of the export associated with the output.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Output data type.</p>\"\
    },\
    \"OutputKey\":{\"type\":\"string\"},\
    \"OutputValue\":{\"type\":\"string\"},\
    \"Outputs\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Output\"}\
    },\
    \"Parameter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ParameterKey\":{\
          \"shape\":\"ParameterKey\",\
          \"documentation\":\"<p>The key associated with the parameter. If you don't specify a key and value for a particular parameter, AWS CloudFormation uses the default value that is specified in your template.</p>\"\
        },\
        \"ParameterValue\":{\
          \"shape\":\"ParameterValue\",\
          \"documentation\":\"<p>The input value associated with the parameter.</p>\"\
        },\
        \"UsePreviousValue\":{\
          \"shape\":\"UsePreviousValue\",\
          \"documentation\":\"<p>During a stack update, use the existing parameter value that the stack is using for a given parameter key. If you specify <code>true</code>, do not specify a parameter value.</p>\"\
        },\
        \"ResolvedValue\":{\
          \"shape\":\"ParameterValue\",\
          \"documentation\":\"<p>Read-only. The value that corresponds to a Systems Manager parameter key. This field is returned only for <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/parameters-section-structure.html#aws-ssm-parameter-types\\\"> <code>SSM</code> parameter types</a> in the template.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Parameter data type.</p>\"\
    },\
    \"ParameterConstraints\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AllowedValues\":{\
          \"shape\":\"AllowedValues\",\
          \"documentation\":\"<p>A list of values that are permitted for a parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A set of criteria that AWS CloudFormation uses to validate parameter values. Although other constraints might be defined in the stack template, AWS CloudFormation returns only the <code>AllowedValues</code> property.</p>\"\
    },\
    \"ParameterDeclaration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ParameterKey\":{\
          \"shape\":\"ParameterKey\",\
          \"documentation\":\"<p>The name that is associated with the parameter.</p>\"\
        },\
        \"DefaultValue\":{\
          \"shape\":\"ParameterValue\",\
          \"documentation\":\"<p>The default value of the parameter.</p>\"\
        },\
        \"ParameterType\":{\
          \"shape\":\"ParameterType\",\
          \"documentation\":\"<p>The type of parameter.</p>\"\
        },\
        \"NoEcho\":{\
          \"shape\":\"NoEcho\",\
          \"documentation\":\"<p>Flag that indicates whether the parameter value is shown as plain text in logs and in the AWS Management Console.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description that is associate with the parameter.</p>\"\
        },\
        \"ParameterConstraints\":{\
          \"shape\":\"ParameterConstraints\",\
          \"documentation\":\"<p>The criteria that AWS CloudFormation uses to validate parameter values.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The ParameterDeclaration data type.</p>\"\
    },\
    \"ParameterDeclarations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ParameterDeclaration\"}\
    },\
    \"ParameterKey\":{\"type\":\"string\"},\
    \"ParameterType\":{\"type\":\"string\"},\
    \"ParameterValue\":{\"type\":\"string\"},\
    \"Parameters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Parameter\"}\
    },\
    \"PermissionModels\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SERVICE_MANAGED\",\
        \"SELF_MANAGED\"\
      ]\
    },\
    \"PhysicalResourceId\":{\"type\":\"string\"},\
    \"PhysicalResourceIdContext\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PhysicalResourceIdContextKeyValuePair\"},\
      \"max\":5\
    },\
    \"PhysicalResourceIdContextKeyValuePair\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Key\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"Key\",\
          \"documentation\":\"<p>The resource context key.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"Value\",\
          \"documentation\":\"<p>The resource context value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Context information that enables AWS CloudFormation to uniquely identify a resource. AWS CloudFormation uses context key-value pairs in cases where a resource's logical and physical IDs are not enough to uniquely identify that resource. Each context key-value pair specifies a resource that contains the targeted resource.</p>\"\
    },\
    \"PrivateTypeArn\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:[0-9]{12}:type/.+\"\
    },\
    \"Properties\":{\"type\":\"string\"},\
    \"PropertyDifference\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PropertyPath\",\
        \"ExpectedValue\",\
        \"ActualValue\",\
        \"DifferenceType\"\
      ],\
      \"members\":{\
        \"PropertyPath\":{\
          \"shape\":\"PropertyPath\",\
          \"documentation\":\"<p>The fully-qualified path to the resource property.</p>\"\
        },\
        \"ExpectedValue\":{\
          \"shape\":\"PropertyValue\",\
          \"documentation\":\"<p>The expected property value of the resource property, as defined in the stack template and any values specified as template parameters.</p>\"\
        },\
        \"ActualValue\":{\
          \"shape\":\"PropertyValue\",\
          \"documentation\":\"<p>The actual property value of the resource property.</p>\"\
        },\
        \"DifferenceType\":{\
          \"shape\":\"DifferenceType\",\
          \"documentation\":\"<p>The type of property difference.</p> <ul> <li> <p> <code>ADD</code>: A value has been added to a resource property that is an array or list data type.</p> </li> <li> <p> <code>REMOVE</code>: The property has been removed from the current resource configuration.</p> </li> <li> <p> <code>NOT_EQUAL</code>: The current property value differs from its expected value (as defined in the stack template and any values specified as template parameters).</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a resource property whose actual value differs from its expected value, as defined in the stack template and any values specified as template parameters. These will be present only for resources whose <code>StackResourceDriftStatus</code> is <code>MODIFIED</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html\\\">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p>\"\
    },\
    \"PropertyDifferences\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PropertyDifference\"}\
    },\
    \"PropertyName\":{\"type\":\"string\"},\
    \"PropertyPath\":{\"type\":\"string\"},\
    \"PropertyValue\":{\"type\":\"string\"},\
    \"ProvisioningType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NON_PROVISIONABLE\",\
        \"IMMUTABLE\",\
        \"FULLY_MUTABLE\"\
      ]\
    },\
    \"Reason\":{\"type\":\"string\"},\
    \"RecordHandlerProgressInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BearerToken\",\
        \"OperationStatus\"\
      ],\
      \"members\":{\
        \"BearerToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>Reserved for use by the <a href=\\\"https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html\\\">CloudFormation CLI</a>.</p>\"\
        },\
        \"OperationStatus\":{\
          \"shape\":\"OperationStatus\",\
          \"documentation\":\"<p>Reserved for use by the <a href=\\\"https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html\\\">CloudFormation CLI</a>.</p>\"\
        },\
        \"CurrentOperationStatus\":{\
          \"shape\":\"OperationStatus\",\
          \"documentation\":\"<p>Reserved for use by the <a href=\\\"https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html\\\">CloudFormation CLI</a>.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>Reserved for use by the <a href=\\\"https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html\\\">CloudFormation CLI</a>.</p>\"\
        },\
        \"ErrorCode\":{\
          \"shape\":\"HandlerErrorCode\",\
          \"documentation\":\"<p>Reserved for use by the <a href=\\\"https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html\\\">CloudFormation CLI</a>.</p>\"\
        },\
        \"ResourceModel\":{\
          \"shape\":\"ResourceModel\",\
          \"documentation\":\"<p>Reserved for use by the <a href=\\\"https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html\\\">CloudFormation CLI</a>.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Reserved for use by the <a href=\\\"https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html\\\">CloudFormation CLI</a>.</p>\"\
        }\
      }\
    },\
    \"RecordHandlerProgressOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"Region\":{\
      \"type\":\"string\",\
      \"pattern\":\"^[a-zA-Z0-9-]{1,128}$\"\
    },\
    \"RegionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Region\"}\
    },\
    \"RegisterTypeInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TypeName\",\
        \"SchemaHandlerPackage\"\
      ],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"RegistryType\",\
          \"documentation\":\"<p>The kind of type.</p> <p>Currently, the only valid value is <code>RESOURCE</code>.</p>\"\
        },\
        \"TypeName\":{\
          \"shape\":\"TypeName\",\
          \"documentation\":\"<p>The name of the type being registered.</p> <p>We recommend that type names adhere to the following pattern: <i>company_or_organization</i>::<i>service</i>::<i>type</i>.</p> <note> <p>The following organization namespaces are reserved and cannot be used in your resource type names:</p> <ul> <li> <p> <code>Alexa</code> </p> </li> <li> <p> <code>AMZN</code> </p> </li> <li> <p> <code>Amazon</code> </p> </li> <li> <p> <code>AWS</code> </p> </li> <li> <p> <code>Custom</code> </p> </li> <li> <p> <code>Dev</code> </p> </li> </ul> </note>\"\
        },\
        \"SchemaHandlerPackage\":{\
          \"shape\":\"S3Url\",\
          \"documentation\":\"<p>A url to the S3 bucket containing the schema handler package that contains the schema, event handlers, and associated files for the type you want to register.</p> <p>For information on generating a schema handler package for the type you want to register, see <a href=\\\"https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-cli-submit.html\\\">submit</a> in the <i>CloudFormation CLI User Guide</i>.</p> <note> <p>As part of registering a resource provider type, CloudFormation must be able to access the S3 bucket which contains the schema handler package for that resource provider. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry.html#registry-register-permissions\\\">IAM Permissions for Registering a Resource Provider</a> in the <i>AWS CloudFormation User Guide</i>.</p> </note>\"\
        },\
        \"LoggingConfig\":{\
          \"shape\":\"LoggingConfig\",\
          \"documentation\":\"<p>Specifies logging configuration information for a type.</p>\"\
        },\
        \"ExecutionRoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role for CloudFormation to assume when invoking the resource provider. If your resource type calls AWS APIs in any of its handlers, you must create an <i> <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html\\\">IAM execution role</a> </i> that includes the necessary permissions to call those AWS APIs, and provision that execution role in your account. When CloudFormation needs to invoke the resource provider handler, CloudFormation assumes this execution role to create a temporary session token, which it then passes to the resource provider handler, thereby supplying your resource provider with the appropriate credentials.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"RequestToken\",\
          \"documentation\":\"<p>A unique identifier that acts as an idempotency key for this registration request. Specifying a client request token prevents CloudFormation from generating more than one version of a type from the same registeration request, even if the request is submitted multiple times. </p>\"\
        }\
      }\
    },\
    \"RegisterTypeOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RegistrationToken\":{\
          \"shape\":\"RegistrationToken\",\
          \"documentation\":\"<p>The identifier for this registration request.</p> <p>Use this registration token when calling <code> <a>DescribeTypeRegistration</a> </code>, which returns information about the status and IDs of the type registration. </p>\"\
        }\
      }\
    },\
    \"RegistrationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"COMPLETE\",\
        \"IN_PROGRESS\",\
        \"FAILED\"\
      ]\
    },\
    \"RegistrationToken\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9][-a-zA-Z0-9]*\"\
    },\
    \"RegistrationTokenList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RegistrationToken\"}\
    },\
    \"RegistryType\":{\
      \"type\":\"string\",\
      \"enum\":[\"RESOURCE\"]\
    },\
    \"Replacement\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"True\",\
        \"False\",\
        \"Conditional\"\
      ]\
    },\
    \"RequestToken\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9][-a-zA-Z0-9]*\"\
    },\
    \"RequiresRecreation\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Never\",\
        \"Conditionally\",\
        \"Always\"\
      ]\
    },\
    \"ResourceAttribute\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Properties\",\
        \"Metadata\",\
        \"CreationPolicy\",\
        \"UpdatePolicy\",\
        \"DeletionPolicy\",\
        \"Tags\"\
      ]\
    },\
    \"ResourceChange\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Action\":{\
          \"shape\":\"ChangeAction\",\
          \"documentation\":\"<p>The action that AWS CloudFormation takes on the resource, such as <code>Add</code> (adds a new resource), <code>Modify</code> (changes a resource), or <code>Remove</code> (deletes a resource).</p>\"\
        },\
        \"LogicalResourceId\":{\
          \"shape\":\"LogicalResourceId\",\
          \"documentation\":\"<p>The resource's logical ID, which is defined in the stack's template.</p>\"\
        },\
        \"PhysicalResourceId\":{\
          \"shape\":\"PhysicalResourceId\",\
          \"documentation\":\"<p>The resource's physical ID (resource name). Resources that you are adding don't have physical IDs because they haven't been created.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of AWS CloudFormation resource, such as <code>AWS::S3::Bucket</code>.</p>\"\
        },\
        \"Replacement\":{\
          \"shape\":\"Replacement\",\
          \"documentation\":\"<p>For the <code>Modify</code> action, indicates whether AWS CloudFormation will replace the resource by creating a new one and deleting the old one. This value depends on the value of the <code>RequiresRecreation</code> property in the <code>ResourceTargetDefinition</code> structure. For example, if the <code>RequiresRecreation</code> field is <code>Always</code> and the <code>Evaluation</code> field is <code>Static</code>, <code>Replacement</code> is <code>True</code>. If the <code>RequiresRecreation</code> field is <code>Always</code> and the <code>Evaluation</code> field is <code>Dynamic</code>, <code>Replacement</code> is <code>Conditionally</code>.</p> <p>If you have multiple changes with different <code>RequiresRecreation</code> values, the <code>Replacement</code> value depends on the change with the most impact. A <code>RequiresRecreation</code> value of <code>Always</code> has the most impact, followed by <code>Conditionally</code>, and then <code>Never</code>.</p>\"\
        },\
        \"Scope\":{\
          \"shape\":\"Scope\",\
          \"documentation\":\"<p>For the <code>Modify</code> action, indicates which resource attribute is triggering this update, such as a change in the resource attribute's <code>Metadata</code>, <code>Properties</code>, or <code>Tags</code>.</p>\"\
        },\
        \"Details\":{\
          \"shape\":\"ResourceChangeDetails\",\
          \"documentation\":\"<p>For the <code>Modify</code> action, a list of <code>ResourceChangeDetail</code> structures that describes the changes that AWS CloudFormation will make to the resource. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The <code>ResourceChange</code> structure describes the resource and the action that AWS CloudFormation will perform on it if you execute this change set.</p>\"\
    },\
    \"ResourceChangeDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Target\":{\
          \"shape\":\"ResourceTargetDefinition\",\
          \"documentation\":\"<p>A <code>ResourceTargetDefinition</code> structure that describes the field that AWS CloudFormation will change and whether the resource will be recreated.</p>\"\
        },\
        \"Evaluation\":{\
          \"shape\":\"EvaluationType\",\
          \"documentation\":\"<p>Indicates whether AWS CloudFormation can determine the target value, and whether the target value will change before you execute a change set.</p> <p>For <code>Static</code> evaluations, AWS CloudFormation can determine that the target value will change, and its value. For example, if you directly modify the <code>InstanceType</code> property of an EC2 instance, AWS CloudFormation knows that this property value will change, and its value, so this is a <code>Static</code> evaluation.</p> <p>For <code>Dynamic</code> evaluations, cannot determine the target value because it depends on the result of an intrinsic function, such as a <code>Ref</code> or <code>Fn::GetAtt</code> intrinsic function, when the stack is updated. For example, if your template includes a reference to a resource that is conditionally recreated, the value of the reference (the physical ID of the resource) might change, depending on if the resource is recreated. If the resource is recreated, it will have a new physical ID, so all references to that resource will also be updated.</p>\"\
        },\
        \"ChangeSource\":{\
          \"shape\":\"ChangeSource\",\
          \"documentation\":\"<p>The group to which the <code>CausingEntity</code> value belongs. There are five entity groups:</p> <ul> <li> <p> <code>ResourceReference</code> entities are <code>Ref</code> intrinsic functions that refer to resources in the template, such as <code>{ \\\"Ref\\\" : \\\"MyEC2InstanceResource\\\" }</code>.</p> </li> <li> <p> <code>ParameterReference</code> entities are <code>Ref</code> intrinsic functions that get template parameter values, such as <code>{ \\\"Ref\\\" : \\\"MyPasswordParameter\\\" }</code>.</p> </li> <li> <p> <code>ResourceAttribute</code> entities are <code>Fn::GetAtt</code> intrinsic functions that get resource attribute values, such as <code>{ \\\"Fn::GetAtt\\\" : [ \\\"MyEC2InstanceResource\\\", \\\"PublicDnsName\\\" ] }</code>.</p> </li> <li> <p> <code>DirectModification</code> entities are changes that are made directly to the template.</p> </li> <li> <p> <code>Automatic</code> entities are <code>AWS::CloudFormation::Stack</code> resource types, which are also known as nested stacks. If you made no changes to the <code>AWS::CloudFormation::Stack</code> resource, AWS CloudFormation sets the <code>ChangeSource</code> to <code>Automatic</code> because the nested stack's template might have changed. Changes to a nested stack's template aren't visible to AWS CloudFormation until you run an update on the parent stack.</p> </li> </ul>\"\
        },\
        \"CausingEntity\":{\
          \"shape\":\"CausingEntity\",\
          \"documentation\":\"<p>The identity of the entity that triggered this change. This entity is a member of the group that is specified by the <code>ChangeSource</code> field. For example, if you modified the value of the <code>KeyPairName</code> parameter, the <code>CausingEntity</code> is the name of the parameter (<code>KeyPairName</code>).</p> <p>If the <code>ChangeSource</code> value is <code>DirectModification</code>, no value is given for <code>CausingEntity</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>For a resource with <code>Modify</code> as the action, the <code>ResourceChange</code> structure describes the changes AWS CloudFormation will make to that resource.</p>\"\
    },\
    \"ResourceChangeDetails\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceChangeDetail\"}\
    },\
    \"ResourceIdentifierProperties\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ResourceIdentifierPropertyKey\"},\
      \"value\":{\"shape\":\"ResourceIdentifierPropertyValue\"},\
      \"max\":256,\
      \"min\":1\
    },\
    \"ResourceIdentifierPropertyKey\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"ResourceIdentifierPropertyValue\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"ResourceIdentifierSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceIdentifierSummary\"}\
    },\
    \"ResourceIdentifierSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The template resource type of the target resources, such as <code>AWS::S3::Bucket</code>.</p>\"\
        },\
        \"LogicalResourceIds\":{\
          \"shape\":\"LogicalResourceIds\",\
          \"documentation\":\"<p>The logical IDs of the target resources of the specified <code>ResourceType</code>, as defined in the import template.</p>\"\
        },\
        \"ResourceIdentifiers\":{\
          \"shape\":\"ResourceIdentifiers\",\
          \"documentation\":\"<p>The resource properties you can provide during the import to identify your target resources. For example, <code>BucketName</code> is a possible identifier property for <code>AWS::S3::Bucket</code> resources.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the target resources of a specific type in your import template (for example, all <code>AWS::S3::Bucket</code> resources) and the properties you can provide during the import to identify resources of that type.</p>\"\
    },\
    \"ResourceIdentifiers\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceIdentifierPropertyKey\"}\
    },\
    \"ResourceModel\":{\
      \"type\":\"string\",\
      \"max\":16384,\
      \"min\":1\
    },\
    \"ResourceProperties\":{\"type\":\"string\"},\
    \"ResourceSignalStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SUCCESS\",\
        \"FAILURE\"\
      ]\
    },\
    \"ResourceSignalUniqueId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"ResourceStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATE_IN_PROGRESS\",\
        \"CREATE_FAILED\",\
        \"CREATE_COMPLETE\",\
        \"DELETE_IN_PROGRESS\",\
        \"DELETE_FAILED\",\
        \"DELETE_COMPLETE\",\
        \"DELETE_SKIPPED\",\
        \"UPDATE_IN_PROGRESS\",\
        \"UPDATE_FAILED\",\
        \"UPDATE_COMPLETE\",\
        \"IMPORT_FAILED\",\
        \"IMPORT_COMPLETE\",\
        \"IMPORT_IN_PROGRESS\",\
        \"IMPORT_ROLLBACK_IN_PROGRESS\",\
        \"IMPORT_ROLLBACK_FAILED\",\
        \"IMPORT_ROLLBACK_COMPLETE\"\
      ]\
    },\
    \"ResourceStatusReason\":{\"type\":\"string\"},\
    \"ResourceTargetDefinition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attribute\":{\
          \"shape\":\"ResourceAttribute\",\
          \"documentation\":\"<p>Indicates which resource attribute is triggering this update, such as a change in the resource attribute's <code>Metadata</code>, <code>Properties</code>, or <code>Tags</code>.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"PropertyName\",\
          \"documentation\":\"<p>If the <code>Attribute</code> value is <code>Properties</code>, the name of the property. For all other attributes, the value is null.</p>\"\
        },\
        \"RequiresRecreation\":{\
          \"shape\":\"RequiresRecreation\",\
          \"documentation\":\"<p>If the <code>Attribute</code> value is <code>Properties</code>, indicates whether a change to this property causes the resource to be recreated. The value can be <code>Never</code>, <code>Always</code>, or <code>Conditionally</code>. To determine the conditions for a <code>Conditionally</code> recreation, see the update behavior for that <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html\\\">property</a> in the AWS CloudFormation User Guide.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The field that AWS CloudFormation will change, such as the name of a resource's property, and whether the resource will be recreated.</p>\"\
    },\
    \"ResourceToImport\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceType\",\
        \"LogicalResourceId\",\
        \"ResourceIdentifier\"\
      ],\
      \"members\":{\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of resource to import into your stack, such as <code>AWS::S3::Bucket</code>. For a list of supported resource types, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html\\\">Resources that support import operations</a> in the AWS CloudFormation User Guide.</p>\"\
        },\
        \"LogicalResourceId\":{\
          \"shape\":\"LogicalResourceId\",\
          \"documentation\":\"<p>The logical ID of the target resource as specified in the template.</p>\"\
        },\
        \"ResourceIdentifier\":{\
          \"shape\":\"ResourceIdentifierProperties\",\
          \"documentation\":\"<p>A key-value pair that identifies the target resource. The key is an identifier property (for example, <code>BucketName</code> for <code>AWS::S3::Bucket</code> resources) and the value is the actual property value (for example, <code>MyS3Bucket</code>).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the target resource of an import operation.</p>\"\
    },\
    \"ResourceToSkip\":{\
      \"type\":\"string\",\
      \"pattern\":\"[a-zA-Z0-9]+|[a-zA-Z][-a-zA-Z0-9]*\\\\.[a-zA-Z0-9]+\"\
    },\
    \"ResourceType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"ResourceTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceType\"}\
    },\
    \"ResourcesToImport\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceToImport\"},\
      \"max\":200\
    },\
    \"ResourcesToSkip\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceToSkip\"}\
    },\
    \"RetainResources\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogicalResourceId\"}\
    },\
    \"RetainStacks\":{\"type\":\"boolean\"},\
    \"RetainStacksNullable\":{\"type\":\"boolean\"},\
    \"RetainStacksOnAccountRemovalNullable\":{\"type\":\"boolean\"},\
    \"RoleARN\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20\
    },\
    \"RoleArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"arn:.+:iam::[0-9]{12}:role/.+\"\
    },\
    \"RollbackConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RollbackTriggers\":{\
          \"shape\":\"RollbackTriggers\",\
          \"documentation\":\"<p>The triggers to monitor during stack creation or update actions. </p> <p>By default, AWS CloudFormation saves the rollback triggers specified for a stack and applies them to any subsequent update operations for the stack, unless you specify otherwise. If you do specify rollback triggers for this parameter, those triggers replace any list of triggers previously specified for the stack. This means:</p> <ul> <li> <p>To use the rollback triggers previously specified for this stack, if any, don't specify this parameter.</p> </li> <li> <p>To specify new or updated rollback triggers, you must specify <i>all</i> the triggers that you want used for this stack, even triggers you've specifed before (for example, when creating the stack or during a previous stack update). Any triggers that you don't include in the updated list of triggers are no longer applied to the stack.</p> </li> <li> <p>To remove all currently specified triggers, specify an empty list for this parameter.</p> </li> </ul> <p>If a specified trigger is missing, the entire stack operation fails and is rolled back. </p>\"\
        },\
        \"MonitoringTimeInMinutes\":{\
          \"shape\":\"MonitoringTimeInMinutes\",\
          \"documentation\":\"<p>The amount of time, in minutes, during which CloudFormation should monitor all the rollback triggers after the stack creation or update operation deploys all necessary resources.</p> <p>The default is 0 minutes.</p> <p>If you specify a monitoring period but do not specify any rollback triggers, CloudFormation still waits the specified period of time before cleaning up old resources after update operations. You can use this monitoring period to perform any manual stack validation desired, and manually cancel the stack creation or update (using <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CancelUpdateStack.html\\\">CancelUpdateStack</a>, for example) as necessary.</p> <p>If you specify 0 for this parameter, CloudFormation still monitors the specified rollback triggers during stack creation and update operations. Then, for update operations, it begins disposing of old resources immediately once the operation completes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Structure containing the rollback triggers for AWS CloudFormation to monitor during stack creation and updating operations, and for the specified monitoring period afterwards.</p> <p>Rollback triggers enable you to have AWS CloudFormation monitor the state of your application during stack creation and updating, and to roll back that operation if the application breaches the threshold of any of the alarms you've specified. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-rollback-triggers.html\\\">Monitor and Roll Back Stack Operations</a>.</p>\"\
    },\
    \"RollbackTrigger\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Arn\",\
        \"Type\"\
      ],\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the rollback trigger.</p> <p>If a specified trigger is missing, the entire stack operation fails and is rolled back. </p>\"\
        },\
        \"Type\":{\
          \"shape\":\"Type\",\
          \"documentation\":\"<p>The resource type of the rollback trigger. Currently, <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html\\\">AWS::CloudWatch::Alarm</a> is the only supported resource type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A rollback trigger AWS CloudFormation monitors during creation and updating of stacks. If any of the alarms you specify goes to ALARM state during the stack operation or within the specified monitoring period afterwards, CloudFormation rolls back the entire stack operation. </p>\"\
    },\
    \"RollbackTriggers\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RollbackTrigger\"},\
      \"max\":5\
    },\
    \"S3Url\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":1\
    },\
    \"Scope\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceAttribute\"}\
    },\
    \"SetStackPolicyInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackName\"],\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name or unique stack ID that you want to associate a policy with.</p>\"\
        },\
        \"StackPolicyBody\":{\
          \"shape\":\"StackPolicyBody\",\
          \"documentation\":\"<p>Structure containing the stack policy body. For more information, go to <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html\\\"> Prevent Updates to Stack Resources</a> in the AWS CloudFormation User Guide. You can specify either the <code>StackPolicyBody</code> or the <code>StackPolicyURL</code> parameter, but not both.</p>\"\
        },\
        \"StackPolicyURL\":{\
          \"shape\":\"StackPolicyURL\",\
          \"documentation\":\"<p>Location of a file containing the stack policy. The URL must point to a policy (maximum size: 16 KB) located in an S3 bucket in the same Region as the stack. You can specify either the <code>StackPolicyBody</code> or the <code>StackPolicyURL</code> parameter, but not both.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <a>SetStackPolicy</a> action.</p>\"\
    },\
    \"SetTypeDefaultVersionInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"PrivateTypeArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the type for which you want version summary information.</p> <p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"RegistryType\",\
          \"documentation\":\"<p>The kind of type.</p> <p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>\"\
        },\
        \"TypeName\":{\
          \"shape\":\"TypeName\",\
          \"documentation\":\"<p>The name of the type.</p> <p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"TypeVersionId\",\
          \"documentation\":\"<p>The ID of a specific version of the type. The version ID is the value at the end of the Amazon Resource Name (ARN) assigned to the type version when it is registered.</p>\"\
        }\
      }\
    },\
    \"SetTypeDefaultVersionOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"SignalResourceInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StackName\",\
        \"LogicalResourceId\",\
        \"UniqueId\",\
        \"Status\"\
      ],\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackNameOrId\",\
          \"documentation\":\"<p>The stack name or unique stack ID that includes the resource that you want to signal.</p>\"\
        },\
        \"LogicalResourceId\":{\
          \"shape\":\"LogicalResourceId\",\
          \"documentation\":\"<p>The logical ID of the resource that you want to signal. The logical ID is the name of the resource that given in the template.</p>\"\
        },\
        \"UniqueId\":{\
          \"shape\":\"ResourceSignalUniqueId\",\
          \"documentation\":\"<p>A unique ID of the signal. When you signal Amazon EC2 instances or Auto Scaling groups, specify the instance ID that you are signaling as the unique ID. If you send multiple signals to a single resource (such as signaling a wait condition), each signal requires a different unique ID.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ResourceSignalStatus\",\
          \"documentation\":\"<p>The status of the signal, which is either success or failure. A failure signal causes AWS CloudFormation to immediately fail the stack creation or update.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the <a>SignalResource</a> action.</p>\"\
    },\
    \"Stack\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StackName\",\
        \"CreationTime\",\
        \"StackStatus\"\
      ],\
      \"members\":{\
        \"StackId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>Unique identifier of the stack.</p>\"\
        },\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name associated with the stack.</p>\"\
        },\
        \"ChangeSetId\":{\
          \"shape\":\"ChangeSetId\",\
          \"documentation\":\"<p>The unique ID of the change set.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A user-defined description associated with the stack.</p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"Parameters\",\
          \"documentation\":\"<p>A list of <code>Parameter</code> structures.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>The time at which the stack was created.</p>\"\
        },\
        \"DeletionTime\":{\
          \"shape\":\"DeletionTime\",\
          \"documentation\":\"<p>The time the stack was deleted.</p>\"\
        },\
        \"LastUpdatedTime\":{\
          \"shape\":\"LastUpdatedTime\",\
          \"documentation\":\"<p>The time the stack was last updated. This field will only be returned if the stack has been updated at least once.</p>\"\
        },\
        \"RollbackConfiguration\":{\
          \"shape\":\"RollbackConfiguration\",\
          \"documentation\":\"<p>The rollback triggers for AWS CloudFormation to monitor during stack creation and updating operations, and for the specified monitoring period afterwards.</p>\"\
        },\
        \"StackStatus\":{\
          \"shape\":\"StackStatus\",\
          \"documentation\":\"<p>Current status of the stack.</p>\"\
        },\
        \"StackStatusReason\":{\
          \"shape\":\"StackStatusReason\",\
          \"documentation\":\"<p>Success/failure message associated with the stack status.</p>\"\
        },\
        \"DisableRollback\":{\
          \"shape\":\"DisableRollback\",\
          \"documentation\":\"<p>Boolean to enable or disable rollback on stack creation failures:</p> <ul> <li> <p> <code>true</code>: disable rollback</p> </li> <li> <p> <code>false</code>: enable rollback</p> </li> </ul>\"\
        },\
        \"NotificationARNs\":{\
          \"shape\":\"NotificationARNs\",\
          \"documentation\":\"<p>SNS topic ARNs to which stack related events are published.</p>\"\
        },\
        \"TimeoutInMinutes\":{\
          \"shape\":\"TimeoutMinutes\",\
          \"documentation\":\"<p>The amount of time within which stack creation should complete.</p>\"\
        },\
        \"Capabilities\":{\
          \"shape\":\"Capabilities\",\
          \"documentation\":\"<p>The capabilities allowed in the stack.</p>\"\
        },\
        \"Outputs\":{\
          \"shape\":\"Outputs\",\
          \"documentation\":\"<p>A list of output structures.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an AWS Identity and Access Management (IAM) role that is associated with the stack. During a stack operation, AWS CloudFormation uses this role's credentials to make calls on your behalf.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>A list of <code>Tag</code>s that specify information about the stack.</p>\"\
        },\
        \"EnableTerminationProtection\":{\
          \"shape\":\"EnableTerminationProtection\",\
          \"documentation\":\"<p>Whether termination protection is enabled for the stack.</p> <p> For <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html\\\">nested stacks</a>, termination protection is set on the root stack and cannot be changed directly on the nested stack. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html\\\">Protecting a Stack From Being Deleted</a> in the <i>AWS CloudFormation User Guide</i>.</p>\"\
        },\
        \"ParentId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>For nested stacks--stacks created as resources for another stack--the stack ID of the direct parent of this stack. For the first level of nested stacks, the root stack is also the parent stack.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html\\\">Working with Nested Stacks</a> in the <i>AWS CloudFormation User Guide</i>.</p>\"\
        },\
        \"RootId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>For nested stacks--stacks created as resources for another stack--the stack ID of the top-level stack to which the nested stack ultimately belongs.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html\\\">Working with Nested Stacks</a> in the <i>AWS CloudFormation User Guide</i>.</p>\"\
        },\
        \"DriftInformation\":{\
          \"shape\":\"StackDriftInformation\",\
          \"documentation\":\"<p>Information on whether a stack's actual configuration differs, or has <i>drifted</i>, from it's expected configuration, as defined in the stack template and any values specified as template parameters. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html\\\">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Stack data type.</p>\"\
    },\
    \"StackDriftDetectionId\":{\
      \"type\":\"string\",\
      \"max\":36,\
      \"min\":1\
    },\
    \"StackDriftDetectionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DETECTION_IN_PROGRESS\",\
        \"DETECTION_FAILED\",\
        \"DETECTION_COMPLETE\"\
      ]\
    },\
    \"StackDriftDetectionStatusReason\":{\"type\":\"string\"},\
    \"StackDriftInformation\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackDriftStatus\"],\
      \"members\":{\
        \"StackDriftStatus\":{\
          \"shape\":\"StackDriftStatus\",\
          \"documentation\":\"<p>Status of the stack's actual configuration compared to its expected template configuration. </p> <ul> <li> <p> <code>DRIFTED</code>: The stack differs from its expected template configuration. A stack is considered to have drifted if one or more of its resources have drifted.</p> </li> <li> <p> <code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the stack differs from its expected template configuration.</p> </li> <li> <p> <code>IN_SYNC</code>: The stack's actual configuration matches its expected template configuration.</p> </li> <li> <p> <code>UNKNOWN</code>: This value is reserved for future use.</p> </li> </ul>\"\
        },\
        \"LastCheckTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Most recent time when a drift detection operation was initiated on the stack, or any of its individual resources that support drift detection.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about whether the stack's actual configuration differs, or has <i>drifted</i>, from its expected configuration, as defined in the stack template and any values specified as template parameters. A stack is considered to have drifted if one or more of its resources have drifted.</p>\"\
    },\
    \"StackDriftInformationSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackDriftStatus\"],\
      \"members\":{\
        \"StackDriftStatus\":{\
          \"shape\":\"StackDriftStatus\",\
          \"documentation\":\"<p>Status of the stack's actual configuration compared to its expected template configuration. </p> <ul> <li> <p> <code>DRIFTED</code>: The stack differs from its expected template configuration. A stack is considered to have drifted if one or more of its resources have drifted.</p> </li> <li> <p> <code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the stack differs from its expected template configuration.</p> </li> <li> <p> <code>IN_SYNC</code>: The stack's actual configuration matches its expected template configuration.</p> </li> <li> <p> <code>UNKNOWN</code>: This value is reserved for future use.</p> </li> </ul>\"\
        },\
        \"LastCheckTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Most recent time when a drift detection operation was initiated on the stack, or any of its individual resources that support drift detection.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about whether the stack's actual configuration differs, or has <i>drifted</i>, from its expected configuration, as defined in the stack template and any values specified as template parameters. A stack is considered to have drifted if one or more of its resources have drifted.</p>\"\
    },\
    \"StackDriftStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DRIFTED\",\
        \"IN_SYNC\",\
        \"UNKNOWN\",\
        \"NOT_CHECKED\"\
      ]\
    },\
    \"StackEvent\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StackId\",\
        \"EventId\",\
        \"StackName\",\
        \"Timestamp\"\
      ],\
      \"members\":{\
        \"StackId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>The unique ID name of the instance of the stack.</p>\"\
        },\
        \"EventId\":{\
          \"shape\":\"EventId\",\
          \"documentation\":\"<p>The unique ID of this event.</p>\"\
        },\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name associated with a stack.</p>\"\
        },\
        \"LogicalResourceId\":{\
          \"shape\":\"LogicalResourceId\",\
          \"documentation\":\"<p>The logical name of the resource specified in the template.</p>\"\
        },\
        \"PhysicalResourceId\":{\
          \"shape\":\"PhysicalResourceId\",\
          \"documentation\":\"<p>The name or unique identifier associated with the physical instance of the resource.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>Type of resource. (For more information, go to <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html\\\"> AWS Resource Types Reference</a> in the AWS CloudFormation User Guide.)</p>\"\
        },\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Time the status was updated.</p>\"\
        },\
        \"ResourceStatus\":{\
          \"shape\":\"ResourceStatus\",\
          \"documentation\":\"<p>Current status of the resource.</p>\"\
        },\
        \"ResourceStatusReason\":{\
          \"shape\":\"ResourceStatusReason\",\
          \"documentation\":\"<p>Success/failure message associated with the resource.</p>\"\
        },\
        \"ResourceProperties\":{\
          \"shape\":\"ResourceProperties\",\
          \"documentation\":\"<p>BLOB of the properties used to create the resource.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The token passed to the operation that generated this event.</p> <p>All events triggered by a given stack operation are assigned the same client request token, which you can use to track operations. For example, if you execute a <code>CreateStack</code> operation with the token <code>token1</code>, then all the <code>StackEvents</code> generated by that operation will have <code>ClientRequestToken</code> set as <code>token1</code>.</p> <p>In the console, stack operations display the client request token on the Events tab. Stack operations that are initiated from the console use the token format <i>Console-StackOperation-ID</i>, which helps you easily identify the stack operation . For example, if you create a stack using the console, each stack event would be assigned the same token in the following format: <code>Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The StackEvent data type.</p>\"\
    },\
    \"StackEvents\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StackEvent\"}\
    },\
    \"StackId\":{\"type\":\"string\"},\
    \"StackInstance\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackSetId\":{\
          \"shape\":\"StackSetId\",\
          \"documentation\":\"<p>The name or unique ID of the stack set that the stack instance is associated with.</p>\"\
        },\
        \"Region\":{\
          \"shape\":\"Region\",\
          \"documentation\":\"<p>The name of the AWS Region that the stack instance is associated with.</p>\"\
        },\
        \"Account\":{\
          \"shape\":\"Account\",\
          \"documentation\":\"<p>[<code>Self-managed</code> permissions] The name of the AWS account that the stack instance is associated with.</p>\"\
        },\
        \"StackId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>The ID of the stack instance.</p>\"\
        },\
        \"ParameterOverrides\":{\
          \"shape\":\"Parameters\",\
          \"documentation\":\"<p>A list of parameters from the stack set template whose values have been overridden in this stack instance.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StackInstanceStatus\",\
          \"documentation\":\"<p>The status of the stack instance, in terms of its synchronization with its associated stack set.</p> <ul> <li> <p> <code>INOPERABLE</code>: A <code>DeleteStackInstances</code> operation has failed and left the stack in an unstable state. Stacks in this state are excluded from further <code>UpdateStackSet</code> operations. You might need to perform a <code>DeleteStackInstances</code> operation, with <code>RetainStacks</code> set to <code>true</code>, to delete the stack instance, and then delete the stack manually.</p> </li> <li> <p> <code>OUTDATED</code>: The stack isn't currently up to date with the stack set because:</p> <ul> <li> <p>The associated stack failed during a <code>CreateStackSet</code> or <code>UpdateStackSet</code> operation. </p> </li> <li> <p>The stack was part of a <code>CreateStackSet</code> or <code>UpdateStackSet</code> operation that failed or was stopped before the stack was created or updated. </p> </li> </ul> </li> <li> <p> <code>CURRENT</code>: The stack is currently up to date with the stack set.</p> </li> </ul>\"\
        },\
        \"StackInstanceStatus\":{\
          \"shape\":\"StackInstanceComprehensiveStatus\",\
          \"documentation\":\"<p>The detailed status of the stack instance.</p>\"\
        },\
        \"StatusReason\":{\
          \"shape\":\"Reason\",\
          \"documentation\":\"<p>The explanation for the specific status code that is assigned to this stack instance.</p>\"\
        },\
        \"OrganizationalUnitId\":{\
          \"shape\":\"OrganizationalUnitId\",\
          \"documentation\":\"<p>[<code>Service-managed</code> permissions] The organization root ID or organizational unit (OU) IDs that you specified for <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html\\\">DeploymentTargets</a>.</p>\"\
        },\
        \"DriftStatus\":{\
          \"shape\":\"StackDriftStatus\",\
          \"documentation\":\"<p>Status of the stack instance's actual configuration compared to the expected template and parameter configuration of the stack set to which it belongs. </p> <ul> <li> <p> <code>DRIFTED</code>: The stack differs from the expected template and parameter configuration of the stack set to which it belongs. A stack instance is considered to have drifted if one or more of the resources in the associated stack have drifted.</p> </li> <li> <p> <code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the stack instance differs from its expected stack set configuration.</p> </li> <li> <p> <code>IN_SYNC</code>: The stack instance's actual configuration matches its expected stack set configuration.</p> </li> <li> <p> <code>UNKNOWN</code>: This value is reserved for future use.</p> </li> </ul>\"\
        },\
        \"LastDriftCheckTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Most recent time when CloudFormation performed a drift detection operation on the stack instance. This value will be <code>NULL</code> for any stack instance on which drift detection has not yet been performed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An AWS CloudFormation stack, in a specific account and Region, that's part of a stack set operation. A stack instance is a reference to an attempted or actual stack in a given account within a given Region. A stack instance can exist without a stackâfor example, if the stack couldn't be created for some reason. A stack instance is associated with only one stack set. Each stack instance contains the ID of its associated stack set, as well as the ID of the actual stack and the stack status.</p>\"\
    },\
    \"StackInstanceComprehensiveStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DetailedStatus\":{\
          \"shape\":\"StackInstanceDetailedStatus\",\
          \"documentation\":\"<ul> <li> <p> <code>CANCELLED</code>: The operation in the specified account and Region has been cancelled. This is either because a user has stopped the stack set operation, or because the failure tolerance of the stack set operation has been exceeded.</p> </li> <li> <p> <code>FAILED</code>: The operation in the specified account and Region failed. If the stack set operation fails in enough accounts within a Region, the failure tolerance for the stack set operation as a whole might be exceeded.</p> </li> <li> <p> <code>INOPERABLE</code>: A <code>DeleteStackInstances</code> operation has failed and left the stack in an unstable state. Stacks in this state are excluded from further <code>UpdateStackSet</code> operations. You might need to perform a <code>DeleteStackInstances</code> operation, with <code>RetainStacks</code> set to <code>true</code>, to delete the stack instance, and then delete the stack manually.</p> </li> <li> <p> <code>PENDING</code>: The operation in the specified account and Region has yet to start.</p> </li> <li> <p> <code>RUNNING</code>: The operation in the specified account and Region is currently in progress.</p> </li> <li> <p> <code>SUCCEEDED</code>: The operation in the specified account and Region completed successfully.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>The detailed status of the stack instance.</p>\"\
    },\
    \"StackInstanceDetailedStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"RUNNING\",\
        \"SUCCEEDED\",\
        \"FAILED\",\
        \"CANCELLED\",\
        \"INOPERABLE\"\
      ]\
    },\
    \"StackInstanceFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"StackInstanceFilterName\",\
          \"documentation\":\"<p>The type of filter to apply.</p>\"\
        },\
        \"Values\":{\
          \"shape\":\"StackInstanceFilterValues\",\
          \"documentation\":\"<p>The status to filter by.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The status that stack instances are filtered by.</p>\"\
    },\
    \"StackInstanceFilterName\":{\
      \"type\":\"string\",\
      \"enum\":[\"DETAILED_STATUS\"]\
    },\
    \"StackInstanceFilterValues\":{\
      \"type\":\"string\",\
      \"max\":10,\
      \"min\":6\
    },\
    \"StackInstanceFilters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StackInstanceFilter\"},\
      \"max\":1\
    },\
    \"StackInstanceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified stack instance doesn't exist.</p>\",\
      \"error\":{\
        \"code\":\"StackInstanceNotFoundException\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"StackInstanceStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CURRENT\",\
        \"OUTDATED\",\
        \"INOPERABLE\"\
      ]\
    },\
    \"StackInstanceSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StackInstanceSummary\"}\
    },\
    \"StackInstanceSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackSetId\":{\
          \"shape\":\"StackSetId\",\
          \"documentation\":\"<p>The name or unique ID of the stack set that the stack instance is associated with.</p>\"\
        },\
        \"Region\":{\
          \"shape\":\"Region\",\
          \"documentation\":\"<p>The name of the AWS Region that the stack instance is associated with.</p>\"\
        },\
        \"Account\":{\
          \"shape\":\"Account\",\
          \"documentation\":\"<p>[<code>Self-managed</code> permissions] The name of the AWS account that the stack instance is associated with.</p>\"\
        },\
        \"StackId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>The ID of the stack instance.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StackInstanceStatus\",\
          \"documentation\":\"<p>The status of the stack instance, in terms of its synchronization with its associated stack set.</p> <ul> <li> <p> <code>INOPERABLE</code>: A <code>DeleteStackInstances</code> operation has failed and left the stack in an unstable state. Stacks in this state are excluded from further <code>UpdateStackSet</code> operations. You might need to perform a <code>DeleteStackInstances</code> operation, with <code>RetainStacks</code> set to <code>true</code>, to delete the stack instance, and then delete the stack manually.</p> </li> <li> <p> <code>OUTDATED</code>: The stack isn't currently up to date with the stack set because:</p> <ul> <li> <p>The associated stack failed during a <code>CreateStackSet</code> or <code>UpdateStackSet</code> operation. </p> </li> <li> <p>The stack was part of a <code>CreateStackSet</code> or <code>UpdateStackSet</code> operation that failed or was stopped before the stack was created or updated. </p> </li> </ul> </li> <li> <p> <code>CURRENT</code>: The stack is currently up to date with the stack set.</p> </li> </ul>\"\
        },\
        \"StatusReason\":{\
          \"shape\":\"Reason\",\
          \"documentation\":\"<p>The explanation for the specific status code assigned to this stack instance.</p>\"\
        },\
        \"StackInstanceStatus\":{\
          \"shape\":\"StackInstanceComprehensiveStatus\",\
          \"documentation\":\"<p>The detailed status of the stack instance.</p>\"\
        },\
        \"OrganizationalUnitId\":{\
          \"shape\":\"OrganizationalUnitId\",\
          \"documentation\":\"<p>[<code>Service-managed</code> permissions] The organization root ID or organizational unit (OU) IDs that you specified for <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html\\\">DeploymentTargets</a>.</p>\"\
        },\
        \"DriftStatus\":{\
          \"shape\":\"StackDriftStatus\",\
          \"documentation\":\"<p>Status of the stack instance's actual configuration compared to the expected template and parameter configuration of the stack set to which it belongs. </p> <ul> <li> <p> <code>DRIFTED</code>: The stack differs from the expected template and parameter configuration of the stack set to which it belongs. A stack instance is considered to have drifted if one or more of the resources in the associated stack have drifted.</p> </li> <li> <p> <code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the stack instance differs from its expected stack set configuration.</p> </li> <li> <p> <code>IN_SYNC</code>: The stack instance's actual configuration matches its expected stack set configuration.</p> </li> <li> <p> <code>UNKNOWN</code>: This value is reserved for future use.</p> </li> </ul>\"\
        },\
        \"LastDriftCheckTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Most recent time when CloudFormation performed a drift detection operation on the stack instance. This value will be <code>NULL</code> for any stack instance on which drift detection has not yet been performed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The structure that contains summary information about a stack instance.</p>\"\
    },\
    \"StackName\":{\"type\":\"string\"},\
    \"StackNameOrId\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"([a-zA-Z][-a-zA-Z0-9]*)|(arn:\\\\b(aws|aws-us-gov|aws-cn)\\\\b:[-a-zA-Z0-9:/._+]*)\"\
    },\
    \"StackPolicyBody\":{\
      \"type\":\"string\",\
      \"max\":16384,\
      \"min\":1\
    },\
    \"StackPolicyDuringUpdateBody\":{\
      \"type\":\"string\",\
      \"max\":16384,\
      \"min\":1\
    },\
    \"StackPolicyDuringUpdateURL\":{\
      \"type\":\"string\",\
      \"max\":1350,\
      \"min\":1\
    },\
    \"StackPolicyURL\":{\
      \"type\":\"string\",\
      \"max\":1350,\
      \"min\":1\
    },\
    \"StackResource\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LogicalResourceId\",\
        \"ResourceType\",\
        \"Timestamp\",\
        \"ResourceStatus\"\
      ],\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name associated with the stack.</p>\"\
        },\
        \"StackId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>Unique identifier of the stack.</p>\"\
        },\
        \"LogicalResourceId\":{\
          \"shape\":\"LogicalResourceId\",\
          \"documentation\":\"<p>The logical name of the resource specified in the template.</p>\"\
        },\
        \"PhysicalResourceId\":{\
          \"shape\":\"PhysicalResourceId\",\
          \"documentation\":\"<p>The name or unique identifier that corresponds to a physical instance ID of a resource supported by AWS CloudFormation.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>Type of resource. (For more information, go to <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html\\\"> AWS Resource Types Reference</a> in the AWS CloudFormation User Guide.)</p>\"\
        },\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Time the status was updated.</p>\"\
        },\
        \"ResourceStatus\":{\
          \"shape\":\"ResourceStatus\",\
          \"documentation\":\"<p>Current status of the resource.</p>\"\
        },\
        \"ResourceStatusReason\":{\
          \"shape\":\"ResourceStatusReason\",\
          \"documentation\":\"<p>Success/failure message associated with the resource.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>User defined description associated with the resource.</p>\"\
        },\
        \"DriftInformation\":{\
          \"shape\":\"StackResourceDriftInformation\",\
          \"documentation\":\"<p>Information about whether the resource's actual configuration differs, or has <i>drifted</i>, from its expected configuration, as defined in the stack template and any values specified as template parameters. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html\\\">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The StackResource data type.</p>\"\
    },\
    \"StackResourceDetail\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LogicalResourceId\",\
        \"ResourceType\",\
        \"LastUpdatedTimestamp\",\
        \"ResourceStatus\"\
      ],\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name associated with the stack.</p>\"\
        },\
        \"StackId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>Unique identifier of the stack.</p>\"\
        },\
        \"LogicalResourceId\":{\
          \"shape\":\"LogicalResourceId\",\
          \"documentation\":\"<p>The logical name of the resource specified in the template.</p>\"\
        },\
        \"PhysicalResourceId\":{\
          \"shape\":\"PhysicalResourceId\",\
          \"documentation\":\"<p>The name or unique identifier that corresponds to a physical instance ID of a resource supported by AWS CloudFormation.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>Type of resource. ((For more information, go to <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html\\\"> AWS Resource Types Reference</a> in the AWS CloudFormation User Guide.)</p>\"\
        },\
        \"LastUpdatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Time the status was updated.</p>\"\
        },\
        \"ResourceStatus\":{\
          \"shape\":\"ResourceStatus\",\
          \"documentation\":\"<p>Current status of the resource.</p>\"\
        },\
        \"ResourceStatusReason\":{\
          \"shape\":\"ResourceStatusReason\",\
          \"documentation\":\"<p>Success/failure message associated with the resource.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>User defined description associated with the resource.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The content of the <code>Metadata</code> attribute declared for the resource. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-metadata.html\\\">Metadata Attribute</a> in the AWS CloudFormation User Guide.</p>\"\
        },\
        \"DriftInformation\":{\
          \"shape\":\"StackResourceDriftInformation\",\
          \"documentation\":\"<p>Information about whether the resource's actual configuration differs, or has <i>drifted</i>, from its expected configuration, as defined in the stack template and any values specified as template parameters. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html\\\">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains detailed information about the specified stack resource.</p>\"\
    },\
    \"StackResourceDrift\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StackId\",\
        \"LogicalResourceId\",\
        \"ResourceType\",\
        \"StackResourceDriftStatus\",\
        \"Timestamp\"\
      ],\
      \"members\":{\
        \"StackId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>The ID of the stack.</p>\"\
        },\
        \"LogicalResourceId\":{\
          \"shape\":\"LogicalResourceId\",\
          \"documentation\":\"<p>The logical name of the resource specified in the template.</p>\"\
        },\
        \"PhysicalResourceId\":{\
          \"shape\":\"PhysicalResourceId\",\
          \"documentation\":\"<p>The name or unique identifier that corresponds to a physical instance ID of a resource supported by AWS CloudFormation. </p>\"\
        },\
        \"PhysicalResourceIdContext\":{\
          \"shape\":\"PhysicalResourceIdContext\",\
          \"documentation\":\"<p>Context information that enables AWS CloudFormation to uniquely identify a resource. AWS CloudFormation uses context key-value pairs in cases where a resource's logical and physical IDs are not enough to uniquely identify that resource. Each context key-value pair specifies a unique resource that contains the targeted resource.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of the resource.</p>\"\
        },\
        \"ExpectedProperties\":{\
          \"shape\":\"Properties\",\
          \"documentation\":\"<p>A JSON structure containing the expected property values of the stack resource, as defined in the stack template and any values specified as template parameters. </p> <p>For resources whose <code>StackResourceDriftStatus</code> is <code>DELETED</code>, this structure will not be present. </p>\"\
        },\
        \"ActualProperties\":{\
          \"shape\":\"Properties\",\
          \"documentation\":\"<p>A JSON structure containing the actual property values of the stack resource.</p> <p>For resources whose <code>StackResourceDriftStatus</code> is <code>DELETED</code>, this structure will not be present. </p>\"\
        },\
        \"PropertyDifferences\":{\
          \"shape\":\"PropertyDifferences\",\
          \"documentation\":\"<p>A collection of the resource properties whose actual values differ from their expected values. These will be present only for resources whose <code>StackResourceDriftStatus</code> is <code>MODIFIED</code>. </p>\"\
        },\
        \"StackResourceDriftStatus\":{\
          \"shape\":\"StackResourceDriftStatus\",\
          \"documentation\":\"<p>Status of the resource's actual configuration compared to its expected configuration</p> <ul> <li> <p> <code>DELETED</code>: The resource differs from its expected template configuration because the resource has been deleted.</p> </li> <li> <p> <code>MODIFIED</code>: One or more resource properties differ from their expected values (as defined in the stack template and any values specified as template parameters).</p> </li> <li> <p> <code>IN_SYNC</code>: The resources's actual configuration matches its expected template configuration.</p> </li> <li> <p> <code>NOT_CHECKED</code>: AWS CloudFormation does not currently return this value.</p> </li> </ul>\"\
        },\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Time at which AWS CloudFormation performed drift detection on the stack resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the drift information for a resource that has been checked for drift. This includes actual and expected property values for resources in which AWS CloudFormation has detected drift. Only resource properties explicitly defined in the stack template are checked for drift. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html\\\">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p> <p>Resources that do not currently support drift detection cannot be checked. For a list of resources that support drift detection, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html\\\">Resources that Support Drift Detection</a>.</p> <p>Use <a>DetectStackResourceDrift</a> to detect drift on individual resources, or <a>DetectStackDrift</a> to detect drift on all resources in a given stack that support drift detection.</p>\"\
    },\
    \"StackResourceDriftInformation\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackResourceDriftStatus\"],\
      \"members\":{\
        \"StackResourceDriftStatus\":{\
          \"shape\":\"StackResourceDriftStatus\",\
          \"documentation\":\"<p>Status of the resource's actual configuration compared to its expected configuration</p> <ul> <li> <p> <code>DELETED</code>: The resource differs from its expected configuration in that it has been deleted.</p> </li> <li> <p> <code>MODIFIED</code>: The resource differs from its expected configuration.</p> </li> <li> <p> <code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the resource differs from its expected configuration.</p> <p>Any resources that do not currently support drift detection have a status of <code>NOT_CHECKED</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html\\\">Resources that Support Drift Detection</a>. </p> </li> <li> <p> <code>IN_SYNC</code>: The resources's actual configuration matches its expected configuration.</p> </li> </ul>\"\
        },\
        \"LastCheckTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When AWS CloudFormation last checked if the resource had drifted from its expected configuration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about whether the resource's actual configuration differs, or has <i>drifted</i>, from its expected configuration.</p>\"\
    },\
    \"StackResourceDriftInformationSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackResourceDriftStatus\"],\
      \"members\":{\
        \"StackResourceDriftStatus\":{\
          \"shape\":\"StackResourceDriftStatus\",\
          \"documentation\":\"<p>Status of the resource's actual configuration compared to its expected configuration</p> <ul> <li> <p> <code>DELETED</code>: The resource differs from its expected configuration in that it has been deleted.</p> </li> <li> <p> <code>MODIFIED</code>: The resource differs from its expected configuration.</p> </li> <li> <p> <code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the resource differs from its expected configuration.</p> <p>Any resources that do not currently support drift detection have a status of <code>NOT_CHECKED</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html\\\">Resources that Support Drift Detection</a>. If you performed an <a>ContinueUpdateRollback</a> operation on a stack, any resources included in <code>ResourcesToSkip</code> will also have a status of <code>NOT_CHECKED</code>. For more information on skipping resources during rollback operations, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-continueupdaterollback.html\\\">Continue Rolling Back an Update</a> in the AWS CloudFormation User Guide.</p> </li> <li> <p> <code>IN_SYNC</code>: The resources's actual configuration matches its expected configuration.</p> </li> </ul>\"\
        },\
        \"LastCheckTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When AWS CloudFormation last checked if the resource had drifted from its expected configuration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summarizes information about whether the resource's actual configuration differs, or has <i>drifted</i>, from its expected configuration.</p>\"\
    },\
    \"StackResourceDriftStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN_SYNC\",\
        \"MODIFIED\",\
        \"DELETED\",\
        \"NOT_CHECKED\"\
      ]\
    },\
    \"StackResourceDriftStatusFilters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StackResourceDriftStatus\"},\
      \"max\":4,\
      \"min\":1\
    },\
    \"StackResourceDrifts\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StackResourceDrift\"}\
    },\
    \"StackResourceSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StackResourceSummary\"}\
    },\
    \"StackResourceSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LogicalResourceId\",\
        \"ResourceType\",\
        \"LastUpdatedTimestamp\",\
        \"ResourceStatus\"\
      ],\
      \"members\":{\
        \"LogicalResourceId\":{\
          \"shape\":\"LogicalResourceId\",\
          \"documentation\":\"<p>The logical name of the resource specified in the template.</p>\"\
        },\
        \"PhysicalResourceId\":{\
          \"shape\":\"PhysicalResourceId\",\
          \"documentation\":\"<p>The name or unique identifier that corresponds to a physical instance ID of the resource.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>Type of resource. (For more information, go to <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html\\\"> AWS Resource Types Reference</a> in the AWS CloudFormation User Guide.)</p>\"\
        },\
        \"LastUpdatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Time the status was updated.</p>\"\
        },\
        \"ResourceStatus\":{\
          \"shape\":\"ResourceStatus\",\
          \"documentation\":\"<p>Current status of the resource.</p>\"\
        },\
        \"ResourceStatusReason\":{\
          \"shape\":\"ResourceStatusReason\",\
          \"documentation\":\"<p>Success/failure message associated with the resource.</p>\"\
        },\
        \"DriftInformation\":{\
          \"shape\":\"StackResourceDriftInformationSummary\",\
          \"documentation\":\"<p>Information about whether the resource's actual configuration differs, or has <i>drifted</i>, from its expected configuration, as defined in the stack template and any values specified as template parameters. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html\\\">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains high-level information about the specified stack resource.</p>\"\
    },\
    \"StackResources\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StackResource\"}\
    },\
    \"StackSet\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackSetName\":{\
          \"shape\":\"StackSetName\",\
          \"documentation\":\"<p>The name that's associated with the stack set.</p>\"\
        },\
        \"StackSetId\":{\
          \"shape\":\"StackSetId\",\
          \"documentation\":\"<p>The ID of the stack set.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the stack set that you specify when the stack set is created or updated.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StackSetStatus\",\
          \"documentation\":\"<p>The status of the stack set.</p>\"\
        },\
        \"TemplateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>The structure that contains the body of the template that was used to create or update the stack set.</p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"Parameters\",\
          \"documentation\":\"<p>A list of input parameters for a stack set.</p>\"\
        },\
        \"Capabilities\":{\
          \"shape\":\"Capabilities\",\
          \"documentation\":\"<p>The capabilities that are allowed in the stack set. Some stack set templates might include resources that can affect permissions in your AWS accountâfor example, by creating new AWS Identity and Access Management (IAM) users. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities\\\">Acknowledging IAM Resources in AWS CloudFormation Templates.</a> </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>A list of tags that specify information about the stack set. A maximum number of 50 tags can be specified.</p>\"\
        },\
        \"StackSetARN\":{\
          \"shape\":\"StackSetARN\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the stack set.</p>\"\
        },\
        \"AdministrationRoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the IAM role used to create or update the stack set.</p> <p>Use customized administrator roles to control which users or groups can manage specific stack sets within the same administrator account. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html\\\">Prerequisites: Granting Permissions for Stack Set Operations</a> in the <i>AWS CloudFormation User Guide</i>.</p>\"\
        },\
        \"ExecutionRoleName\":{\
          \"shape\":\"ExecutionRoleName\",\
          \"documentation\":\"<p>The name of the IAM execution role used to create or update the stack set. </p> <p>Use customized execution roles to control which stack resources users and groups can include in their stack sets. </p>\"\
        },\
        \"StackSetDriftDetectionDetails\":{\
          \"shape\":\"StackSetDriftDetectionDetails\",\
          \"documentation\":\"<p>Detailed information about the drift status of the stack set.</p> <p>For stack sets, contains information about the last <i>completed</i> drift operation performed on the stack set. Information about drift operations currently in progress is not included.</p>\"\
        },\
        \"AutoDeployment\":{\
          \"shape\":\"AutoDeployment\",\
          \"documentation\":\"<p>[<code>Service-managed</code> permissions] Describes whether StackSets automatically deploys to AWS Organizations accounts that are added to a target organization or organizational unit (OU).</p>\"\
        },\
        \"PermissionModel\":{\
          \"shape\":\"PermissionModels\",\
          \"documentation\":\"<p>Describes how the IAM roles required for stack set operations are created.</p> <ul> <li> <p>With <code>self-managed</code> permissions, you must create the administrator and execution roles required to deploy to target accounts. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html\\\">Grant Self-Managed Stack Set Permissions</a>.</p> </li> <li> <p>With <code>service-managed</code> permissions, StackSets automatically creates the IAM roles required to deploy to accounts managed by AWS Organizations. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-service-managed.html\\\">Grant Service-Managed Stack Set Permissions</a>.</p> </li> </ul>\"\
        },\
        \"OrganizationalUnitIds\":{\
          \"shape\":\"OrganizationalUnitIdList\",\
          \"documentation\":\"<p>[<code>Service-managed</code> permissions] The organization root ID or organizational unit (OU) IDs that you specified for <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html\\\">DeploymentTargets</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure that contains information about a stack set. A stack set enables you to provision stacks into AWS accounts and across Regions by using a single CloudFormation template. In the stack set, you specify the template to use, as well as any parameters and capabilities that the template requires. </p>\"\
    },\
    \"StackSetARN\":{\"type\":\"string\"},\
    \"StackSetDriftDetectionDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DriftStatus\":{\
          \"shape\":\"StackSetDriftStatus\",\
          \"documentation\":\"<p>Status of the stack set's actual configuration compared to its expected template and parameter configuration. A stack set is considered to have drifted if one or more of its stack instances have drifted from their expected template and parameter configuration.</p> <ul> <li> <p> <code>DRIFTED</code>: One or more of the stack instances belonging to the stack set stack differs from the expected template and parameter configuration. A stack instance is considered to have drifted if one or more of the resources in the associated stack have drifted.</p> </li> <li> <p> <code>NOT_CHECKED</code>: AWS CloudFormation has not checked the stack set for drift.</p> </li> <li> <p> <code>IN_SYNC</code>: All of the stack instances belonging to the stack set stack match from the expected template and parameter configuration.</p> </li> </ul>\"\
        },\
        \"DriftDetectionStatus\":{\
          \"shape\":\"StackSetDriftDetectionStatus\",\
          \"documentation\":\"<p>The status of the stack set drift detection operation.</p> <ul> <li> <p> <code>COMPLETED</code>: The drift detection operation completed without failing on any stack instances.</p> </li> <li> <p> <code>FAILED</code>: The drift detection operation exceeded the specified failure tolerance. </p> </li> <li> <p> <code>PARTIAL_SUCCESS</code>: The drift detection operation completed without exceeding the failure tolerance for the operation.</p> </li> <li> <p> <code>IN_PROGRESS</code>: The drift detection operation is currently being performed.</p> </li> <li> <p> <code>STOPPED</code>: The user has cancelled the drift detection operation.</p> </li> </ul>\"\
        },\
        \"LastDriftCheckTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Most recent time when CloudFormation performed a drift detection operation on the stack set. This value will be <code>NULL</code> for any stack set on which drift detection has not yet been performed.</p>\"\
        },\
        \"TotalStackInstancesCount\":{\
          \"shape\":\"TotalStackInstancesCount\",\
          \"documentation\":\"<p>The total number of stack instances belonging to this stack set. </p> <p>The total number of stack instances is equal to the total of:</p> <ul> <li> <p>Stack instances that match the stack set configuration. </p> </li> <li> <p>Stack instances that have drifted from the stack set configuration. </p> </li> <li> <p>Stack instances where the drift detection operation has failed.</p> </li> <li> <p>Stack instances currently being checked for drift.</p> </li> </ul>\"\
        },\
        \"DriftedStackInstancesCount\":{\
          \"shape\":\"DriftedStackInstancesCount\",\
          \"documentation\":\"<p>The number of stack instances that have drifted from the expected template and parameter configuration of the stack set. A stack instance is considered to have drifted if one or more of the resources in the associated stack do not match their expected configuration.</p>\"\
        },\
        \"InSyncStackInstancesCount\":{\
          \"shape\":\"InSyncStackInstancesCount\",\
          \"documentation\":\"<p>The number of stack instances which match the expected template and parameter configuration of the stack set.</p>\"\
        },\
        \"InProgressStackInstancesCount\":{\
          \"shape\":\"InProgressStackInstancesCount\",\
          \"documentation\":\"<p>The number of stack instances that are currently being checked for drift.</p>\"\
        },\
        \"FailedStackInstancesCount\":{\
          \"shape\":\"FailedStackInstancesCount\",\
          \"documentation\":\"<p>The number of stack instances for which the drift detection operation failed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Detailed information about the drift status of the stack set.</p> <p>For stack sets, contains information about the last <i>completed</i> drift operation performed on the stack set. Information about drift operations in-progress is not included. </p> <p>For stack set operations, includes information about drift operations currently being performed on the stack set.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html\\\">Detecting Unmanaged Changes in Stack Sets</a> in the <i>AWS CloudFormation User Guide</i>.</p>\"\
    },\
    \"StackSetDriftDetectionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"COMPLETED\",\
        \"FAILED\",\
        \"PARTIAL_SUCCESS\",\
        \"IN_PROGRESS\",\
        \"STOPPED\"\
      ]\
    },\
    \"StackSetDriftStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DRIFTED\",\
        \"IN_SYNC\",\
        \"NOT_CHECKED\"\
      ]\
    },\
    \"StackSetId\":{\"type\":\"string\"},\
    \"StackSetName\":{\"type\":\"string\"},\
    \"StackSetNameOrId\":{\
      \"type\":\"string\",\
      \"pattern\":\"[a-zA-Z][-a-zA-Z0-9]*(?::[a-zA-Z0-9]{8}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{12})?\"\
    },\
    \"StackSetNotEmptyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You can't yet delete this stack set, because it still contains one or more stack instances. Delete all stack instances from the stack set before deleting the stack set.</p>\",\
      \"error\":{\
        \"code\":\"StackSetNotEmptyException\",\
        \"httpStatusCode\":409,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"StackSetNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified stack set doesn't exist.</p>\",\
      \"error\":{\
        \"code\":\"StackSetNotFoundException\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"StackSetOperation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The unique ID of a stack set operation.</p>\"\
        },\
        \"StackSetId\":{\
          \"shape\":\"StackSetId\",\
          \"documentation\":\"<p>The ID of the stack set.</p>\"\
        },\
        \"Action\":{\
          \"shape\":\"StackSetOperationAction\",\
          \"documentation\":\"<p>The type of stack set operation: <code>CREATE</code>, <code>UPDATE</code>, or <code>DELETE</code>. Create and delete operations affect only the specified stack set instances that are associated with the specified stack set. Update operations affect both the stack set itself, as well as <i>all</i> associated stack set instances.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StackSetOperationStatus\",\
          \"documentation\":\"<p>The status of the operation. </p> <ul> <li> <p> <code>FAILED</code>: The operation exceeded the specified failure tolerance. The failure tolerance value that you've set for an operation is applied for each Region during stack create and update operations. If the number of failed stacks within a Region exceeds the failure tolerance, the status of the operation in the Region is set to <code>FAILED</code>. This in turn sets the status of the operation as a whole to <code>FAILED</code>, and AWS CloudFormation cancels the operation in any remaining Regions.</p> </li> <li> <p> <code>QUEUED</code>: [<code>Service-managed</code> permissions] For automatic deployments that require a sequence of operations, the operation is queued to be performed. For more information, see the <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-status-codes\\\">stack set operation status codes</a> in the AWS CloudFormation User Guide.</p> </li> <li> <p> <code>RUNNING</code>: The operation is currently being performed.</p> </li> <li> <p> <code>STOPPED</code>: The user has cancelled the operation.</p> </li> <li> <p> <code>STOPPING</code>: The operation is in the process of stopping, at user request. </p> </li> <li> <p> <code>SUCCEEDED</code>: The operation completed creating or updating all the specified stacks without exceeding the failure tolerance for the operation.</p> </li> </ul>\"\
        },\
        \"OperationPreferences\":{\
          \"shape\":\"StackSetOperationPreferences\",\
          \"documentation\":\"<p>The preferences for how AWS CloudFormation performs this stack set operation.</p>\"\
        },\
        \"RetainStacks\":{\
          \"shape\":\"RetainStacksNullable\",\
          \"documentation\":\"<p>For stack set operations of action type <code>DELETE</code>, specifies whether to remove the stack instances from the specified stack set, but doesn't delete the stacks. You can't reassociate a retained stack, or add an existing, saved stack to a new stack set.</p>\"\
        },\
        \"AdministrationRoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the IAM role used to perform this stack set operation. </p> <p>Use customized administrator roles to control which users or groups can manage specific stack sets within the same administrator account. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html\\\">Define Permissions for Multiple Administrators</a> in the <i>AWS CloudFormation User Guide</i>.</p>\"\
        },\
        \"ExecutionRoleName\":{\
          \"shape\":\"ExecutionRoleName\",\
          \"documentation\":\"<p>The name of the IAM execution role used to create or update the stack set.</p> <p>Use customized execution roles to control which stack resources users and groups can include in their stack sets. </p>\"\
        },\
        \"CreationTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the operation was initiated. Note that the creation times for the stack set operation might differ from the creation time of the individual stacks themselves. This is because AWS CloudFormation needs to perform preparatory work for the operation, such as dispatching the work to the requested Regions, before actually creating the first stacks.</p>\"\
        },\
        \"EndTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the stack set operation ended, across all accounts and Regions specified. Note that this doesn't necessarily mean that the stack set operation was successful, or even attempted, in each account or Region.</p>\"\
        },\
        \"DeploymentTargets\":{\
          \"shape\":\"DeploymentTargets\",\
          \"documentation\":\"<p>[<code>Service-managed</code> permissions] The AWS Organizations accounts affected by the stack operation.</p>\"\
        },\
        \"StackSetDriftDetectionDetails\":{\
          \"shape\":\"StackSetDriftDetectionDetails\",\
          \"documentation\":\"<p>Detailed information about the drift status of the stack set. This includes information about drift operations currently being performed on the stack set.</p> <p>this information will only be present for stack set operations whose <code>Action</code> type is <code>DETECT_DRIFT</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html\\\">Detecting Unmanaged Changes in Stack Sets</a> in the AWS CloudFormation User Guide.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The structure that contains information about a stack set operation. </p>\"\
    },\
    \"StackSetOperationAction\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATE\",\
        \"UPDATE\",\
        \"DELETE\",\
        \"DETECT_DRIFT\"\
      ]\
    },\
    \"StackSetOperationPreferences\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RegionOrder\":{\
          \"shape\":\"RegionList\",\
          \"documentation\":\"<p>The order of the Regions in where you want to perform the stack operation.</p>\"\
        },\
        \"FailureToleranceCount\":{\
          \"shape\":\"FailureToleranceCount\",\
          \"documentation\":\"<p>The number of accounts, per Region, for which this operation can fail before AWS CloudFormation stops the operation in that Region. If the operation is stopped in a Region, AWS CloudFormation doesn't attempt the operation in any subsequent Regions.</p> <p>Conditional: You must specify either <code>FailureToleranceCount</code> or <code>FailureTolerancePercentage</code> (but not both).</p>\"\
        },\
        \"FailureTolerancePercentage\":{\
          \"shape\":\"FailureTolerancePercentage\",\
          \"documentation\":\"<p>The percentage of accounts, per Region, for which this stack operation can fail before AWS CloudFormation stops the operation in that Region. If the operation is stopped in a Region, AWS CloudFormation doesn't attempt the operation in any subsequent Regions.</p> <p>When calculating the number of accounts based on the specified percentage, AWS CloudFormation rounds <i>down</i> to the next whole number.</p> <p>Conditional: You must specify either <code>FailureToleranceCount</code> or <code>FailureTolerancePercentage</code>, but not both.</p>\"\
        },\
        \"MaxConcurrentCount\":{\
          \"shape\":\"MaxConcurrentCount\",\
          \"documentation\":\"<p>The maximum number of accounts in which to perform this operation at one time. This is dependent on the value of <code>FailureToleranceCount</code>. <code>MaxConcurrentCount</code> is at most one more than the <code>FailureToleranceCount</code>.</p> <p>Note that this setting lets you specify the <i>maximum</i> for operations. For large deployments, under certain circumstances the actual number of accounts acted upon concurrently may be lower due to service throttling.</p> <p>Conditional: You must specify either <code>MaxConcurrentCount</code> or <code>MaxConcurrentPercentage</code>, but not both.</p>\"\
        },\
        \"MaxConcurrentPercentage\":{\
          \"shape\":\"MaxConcurrentPercentage\",\
          \"documentation\":\"<p>The maximum percentage of accounts in which to perform this operation at one time.</p> <p>When calculating the number of accounts based on the specified percentage, AWS CloudFormation rounds down to the next whole number. This is true except in cases where rounding down would result is zero. In this case, CloudFormation sets the number as one instead.</p> <p>Note that this setting lets you specify the <i>maximum</i> for operations. For large deployments, under certain circumstances the actual number of accounts acted upon concurrently may be lower due to service throttling.</p> <p>Conditional: You must specify either <code>MaxConcurrentCount</code> or <code>MaxConcurrentPercentage</code>, but not both.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The user-specified preferences for how AWS CloudFormation performs a stack set operation. </p> <p>For more information on maximum concurrent accounts and failure tolerance, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options\\\">Stack set operation options</a>.</p>\"\
    },\
    \"StackSetOperationResultStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"RUNNING\",\
        \"SUCCEEDED\",\
        \"FAILED\",\
        \"CANCELLED\"\
      ]\
    },\
    \"StackSetOperationResultSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StackSetOperationResultSummary\"}\
    },\
    \"StackSetOperationResultSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Account\":{\
          \"shape\":\"Account\",\
          \"documentation\":\"<p>[<code>Self-managed</code> permissions] The name of the AWS account for this operation result.</p>\"\
        },\
        \"Region\":{\
          \"shape\":\"Region\",\
          \"documentation\":\"<p>The name of the AWS Region for this operation result.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StackSetOperationResultStatus\",\
          \"documentation\":\"<p>The result status of the stack set operation for the given account in the given Region.</p> <ul> <li> <p> <code>CANCELLED</code>: The operation in the specified account and Region has been cancelled. This is either because a user has stopped the stack set operation, or because the failure tolerance of the stack set operation has been exceeded.</p> </li> <li> <p> <code>FAILED</code>: The operation in the specified account and Region failed. </p> <p>If the stack set operation fails in enough accounts within a Region, the failure tolerance for the stack set operation as a whole might be exceeded. </p> </li> <li> <p> <code>RUNNING</code>: The operation in the specified account and Region is currently in progress.</p> </li> <li> <p> <code>PENDING</code>: The operation in the specified account and Region has yet to start. </p> </li> <li> <p> <code>SUCCEEDED</code>: The operation in the specified account and Region completed successfully.</p> </li> </ul>\"\
        },\
        \"StatusReason\":{\
          \"shape\":\"Reason\",\
          \"documentation\":\"<p>The reason for the assigned result status.</p>\"\
        },\
        \"AccountGateResult\":{\
          \"shape\":\"AccountGateResult\",\
          \"documentation\":\"<p>The results of the account gate function AWS CloudFormation invokes, if present, before proceeding with stack set operations in an account</p>\"\
        },\
        \"OrganizationalUnitId\":{\
          \"shape\":\"OrganizationalUnitId\",\
          \"documentation\":\"<p>[<code>Service-managed</code> permissions] The organization root ID or organizational unit (OU) IDs that you specified for <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html\\\">DeploymentTargets</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The structure that contains information about a specified operation's results for a given account in a given Region.</p>\"\
    },\
    \"StackSetOperationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RUNNING\",\
        \"SUCCEEDED\",\
        \"FAILED\",\
        \"STOPPING\",\
        \"STOPPED\",\
        \"QUEUED\"\
      ]\
    },\
    \"StackSetOperationSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StackSetOperationSummary\"}\
    },\
    \"StackSetOperationSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The unique ID of the stack set operation.</p>\"\
        },\
        \"Action\":{\
          \"shape\":\"StackSetOperationAction\",\
          \"documentation\":\"<p>The type of operation: <code>CREATE</code>, <code>UPDATE</code>, or <code>DELETE</code>. Create and delete operations affect only the specified stack instances that are associated with the specified stack set. Update operations affect both the stack set itself as well as <i>all</i> associated stack set instances.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StackSetOperationStatus\",\
          \"documentation\":\"<p>The overall status of the operation.</p> <ul> <li> <p> <code>FAILED</code>: The operation exceeded the specified failure tolerance. The failure tolerance value that you've set for an operation is applied for each Region during stack create and update operations. If the number of failed stacks within a Region exceeds the failure tolerance, the status of the operation in the Region is set to <code>FAILED</code>. This in turn sets the status of the operation as a whole to <code>FAILED</code>, and AWS CloudFormation cancels the operation in any remaining Regions.</p> </li> <li> <p> <code>QUEUED</code>: [<code>Service-managed</code> permissions] For automatic deployments that require a sequence of operations, the operation is queued to be performed. For more information, see the <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-status-codes\\\">stack set operation status codes</a> in the AWS CloudFormation User Guide.</p> </li> <li> <p> <code>RUNNING</code>: The operation is currently being performed.</p> </li> <li> <p> <code>STOPPED</code>: The user has cancelled the operation.</p> </li> <li> <p> <code>STOPPING</code>: The operation is in the process of stopping, at user request. </p> </li> <li> <p> <code>SUCCEEDED</code>: The operation completed creating or updating all the specified stacks without exceeding the failure tolerance for the operation.</p> </li> </ul>\"\
        },\
        \"CreationTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the operation was initiated. Note that the creation times for the stack set operation might differ from the creation time of the individual stacks themselves. This is because AWS CloudFormation needs to perform preparatory work for the operation, such as dispatching the work to the requested Regions, before actually creating the first stacks.</p>\"\
        },\
        \"EndTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the stack set operation ended, across all accounts and Regions specified. Note that this doesn't necessarily mean that the stack set operation was successful, or even attempted, in each account or Region.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The structures that contain summary information about the specified operation.</p>\"\
    },\
    \"StackSetStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVE\",\
        \"DELETED\"\
      ]\
    },\
    \"StackSetSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StackSetSummary\"}\
    },\
    \"StackSetSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackSetName\":{\
          \"shape\":\"StackSetName\",\
          \"documentation\":\"<p>The name of the stack set.</p>\"\
        },\
        \"StackSetId\":{\
          \"shape\":\"StackSetId\",\
          \"documentation\":\"<p>The ID of the stack set.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the stack set that you specify when the stack set is created or updated.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StackSetStatus\",\
          \"documentation\":\"<p>The status of the stack set.</p>\"\
        },\
        \"AutoDeployment\":{\
          \"shape\":\"AutoDeployment\",\
          \"documentation\":\"<p>[<code>Service-managed</code> permissions] Describes whether StackSets automatically deploys to AWS Organizations accounts that are added to a target organizational unit (OU).</p>\"\
        },\
        \"PermissionModel\":{\
          \"shape\":\"PermissionModels\",\
          \"documentation\":\"<p>Describes how the IAM roles required for stack set operations are created.</p> <ul> <li> <p>With <code>self-managed</code> permissions, you must create the administrator and execution roles required to deploy to target accounts. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html\\\">Grant Self-Managed Stack Set Permissions</a>.</p> </li> <li> <p>With <code>service-managed</code> permissions, StackSets automatically creates the IAM roles required to deploy to accounts managed by AWS Organizations. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-service-managed.html\\\">Grant Service-Managed Stack Set Permissions</a>.</p> </li> </ul>\"\
        },\
        \"DriftStatus\":{\
          \"shape\":\"StackDriftStatus\",\
          \"documentation\":\"<p>Status of the stack set's actual configuration compared to its expected template and parameter configuration. A stack set is considered to have drifted if one or more of its stack instances have drifted from their expected template and parameter configuration.</p> <ul> <li> <p> <code>DRIFTED</code>: One or more of the stack instances belonging to the stack set stack differs from the expected template and parameter configuration. A stack instance is considered to have drifted if one or more of the resources in the associated stack have drifted.</p> </li> <li> <p> <code>NOT_CHECKED</code>: AWS CloudFormation has not checked the stack set for drift.</p> </li> <li> <p> <code>IN_SYNC</code>: All of the stack instances belonging to the stack set stack match from the expected template and parameter configuration.</p> </li> <li> <p> <code>UNKNOWN</code>: This value is reserved for future use.</p> </li> </ul>\"\
        },\
        \"LastDriftCheckTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Most recent time when CloudFormation performed a drift detection operation on the stack set. This value will be <code>NULL</code> for any stack set on which drift detection has not yet been performed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The structures that contain summary information about the specified stack set.</p>\"\
    },\
    \"StackStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATE_IN_PROGRESS\",\
        \"CREATE_FAILED\",\
        \"CREATE_COMPLETE\",\
        \"ROLLBACK_IN_PROGRESS\",\
        \"ROLLBACK_FAILED\",\
        \"ROLLBACK_COMPLETE\",\
        \"DELETE_IN_PROGRESS\",\
        \"DELETE_FAILED\",\
        \"DELETE_COMPLETE\",\
        \"UPDATE_IN_PROGRESS\",\
        \"UPDATE_COMPLETE_CLEANUP_IN_PROGRESS\",\
        \"UPDATE_COMPLETE\",\
        \"UPDATE_ROLLBACK_IN_PROGRESS\",\
        \"UPDATE_ROLLBACK_FAILED\",\
        \"UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS\",\
        \"UPDATE_ROLLBACK_COMPLETE\",\
        \"REVIEW_IN_PROGRESS\",\
        \"IMPORT_IN_PROGRESS\",\
        \"IMPORT_COMPLETE\",\
        \"IMPORT_ROLLBACK_IN_PROGRESS\",\
        \"IMPORT_ROLLBACK_FAILED\",\
        \"IMPORT_ROLLBACK_COMPLETE\"\
      ]\
    },\
    \"StackStatusFilter\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StackStatus\"}\
    },\
    \"StackStatusReason\":{\"type\":\"string\"},\
    \"StackSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StackSummary\"}\
    },\
    \"StackSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StackName\",\
        \"CreationTime\",\
        \"StackStatus\"\
      ],\
      \"members\":{\
        \"StackId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>Unique stack identifier.</p>\"\
        },\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name associated with the stack.</p>\"\
        },\
        \"TemplateDescription\":{\
          \"shape\":\"TemplateDescription\",\
          \"documentation\":\"<p>The template description of the template used to create the stack.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>The time the stack was created.</p>\"\
        },\
        \"LastUpdatedTime\":{\
          \"shape\":\"LastUpdatedTime\",\
          \"documentation\":\"<p>The time the stack was last updated. This field will only be returned if the stack has been updated at least once.</p>\"\
        },\
        \"DeletionTime\":{\
          \"shape\":\"DeletionTime\",\
          \"documentation\":\"<p>The time the stack was deleted.</p>\"\
        },\
        \"StackStatus\":{\
          \"shape\":\"StackStatus\",\
          \"documentation\":\"<p>The current status of the stack.</p>\"\
        },\
        \"StackStatusReason\":{\
          \"shape\":\"StackStatusReason\",\
          \"documentation\":\"<p>Success/Failure message associated with the stack status.</p>\"\
        },\
        \"ParentId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>For nested stacks--stacks created as resources for another stack--the stack ID of the direct parent of this stack. For the first level of nested stacks, the root stack is also the parent stack.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html\\\">Working with Nested Stacks</a> in the <i>AWS CloudFormation User Guide</i>.</p>\"\
        },\
        \"RootId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>For nested stacks--stacks created as resources for another stack--the stack ID of the top-level stack to which the nested stack ultimately belongs.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html\\\">Working with Nested Stacks</a> in the <i>AWS CloudFormation User Guide</i>.</p>\"\
        },\
        \"DriftInformation\":{\
          \"shape\":\"StackDriftInformationSummary\",\
          \"documentation\":\"<p>Summarizes information on whether a stack's actual configuration differs, or has <i>drifted</i>, from it's expected configuration, as defined in the stack template and any values specified as template parameters. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html\\\">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The StackSummary Data Type</p>\"\
    },\
    \"Stacks\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Stack\"}\
    },\
    \"StageList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TemplateStage\"}\
    },\
    \"StaleRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Another operation has been performed on this stack set since the specified operation was performed. </p>\",\
      \"error\":{\
        \"code\":\"StaleRequestException\",\
        \"httpStatusCode\":409,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"StatusMessage\":{\
      \"type\":\"string\",\
      \"max\":1024\
    },\
    \"StopStackSetOperationInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StackSetName\",\
        \"OperationId\"\
      ],\
      \"members\":{\
        \"StackSetName\":{\
          \"shape\":\"StackSetName\",\
          \"documentation\":\"<p>The name or unique ID of the stack set that you want to stop the operation for.</p>\"\
        },\
        \"OperationId\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The ID of the stack operation. </p>\"\
        }\
      }\
    },\
    \"StopStackSetOperationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
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
          \"documentation\":\"<p> <i>Required</i>. A string used to identify this tag. You can specify a maximum of 128 characters for a tag key. Tags owned by Amazon Web Services (AWS) have the reserved prefix: <code>aws:</code>.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p> <i>Required</i>. A string containing the value for this tag. You can specify a maximum of 256 characters for a tag value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Tag type enables you to specify a key-value pair that can be used to store information about an AWS CloudFormation stack.</p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"Tags\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"max\":50\
    },\
    \"TemplateBody\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"TemplateDescription\":{\"type\":\"string\"},\
    \"TemplateParameter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ParameterKey\":{\
          \"shape\":\"ParameterKey\",\
          \"documentation\":\"<p>The name associated with the parameter.</p>\"\
        },\
        \"DefaultValue\":{\
          \"shape\":\"ParameterValue\",\
          \"documentation\":\"<p>The default value associated with the parameter.</p>\"\
        },\
        \"NoEcho\":{\
          \"shape\":\"NoEcho\",\
          \"documentation\":\"<p>Flag indicating whether the parameter should be displayed as plain text in logs and UIs.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>User defined description associated with the parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The TemplateParameter data type.</p>\"\
    },\
    \"TemplateParameters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TemplateParameter\"}\
    },\
    \"TemplateStage\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Original\",\
        \"Processed\"\
      ]\
    },\
    \"TemplateURL\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"TimeoutMinutes\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"TokenAlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A client request token already exists.</p>\",\
      \"error\":{\
        \"code\":\"TokenAlreadyExistsException\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TotalStackInstancesCount\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"TransformName\":{\"type\":\"string\"},\
    \"TransformsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TransformName\"}\
    },\
    \"Type\":{\"type\":\"string\"},\
    \"TypeArn\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type/.+\"\
    },\
    \"TypeName\":{\
      \"type\":\"string\",\
      \"max\":196,\
      \"min\":10,\
      \"pattern\":\"[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}\"\
    },\
    \"TypeNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified type does not exist in the CloudFormation registry.</p>\",\
      \"error\":{\
        \"code\":\"TypeNotFoundException\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TypeSchema\":{\
      \"type\":\"string\",\
      \"max\":16777216,\
      \"min\":1\
    },\
    \"TypeSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TypeSummary\"}\
    },\
    \"TypeSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"RegistryType\",\
          \"documentation\":\"<p>The kind of type.</p>\"\
        },\
        \"TypeName\":{\
          \"shape\":\"TypeName\",\
          \"documentation\":\"<p>The name of the type.</p>\"\
        },\
        \"DefaultVersionId\":{\
          \"shape\":\"TypeVersionId\",\
          \"documentation\":\"<p>The ID of the default version of the type. The default version is used when the type version is not specified.</p> <p>To set the default version of a type, use <code> <a>SetTypeDefaultVersion</a> </code>. </p>\"\
        },\
        \"TypeArn\":{\
          \"shape\":\"TypeArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the type.</p>\"\
        },\
        \"LastUpdated\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the current default version of the type was registered.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about the specified CloudFormation type.</p>\"\
    },\
    \"TypeVersionId\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[A-Za-z0-9-]+\"\
    },\
    \"TypeVersionSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TypeVersionSummary\"}\
    },\
    \"TypeVersionSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"RegistryType\",\
          \"documentation\":\"<p>The kind of type.</p>\"\
        },\
        \"TypeName\":{\
          \"shape\":\"TypeName\",\
          \"documentation\":\"<p>The name of the type.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"TypeVersionId\",\
          \"documentation\":\"<p>The ID of a specific version of the type. The version ID is the value at the end of the Amazon Resource Name (ARN) assigned to the type version when it is registered.</p>\"\
        },\
        \"IsDefaultVersion\":{\
          \"shape\":\"IsDefaultVersion\",\
          \"documentation\":\"<p>Whether the specified type version is set as the default version.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"TypeArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the type version.</p>\"\
        },\
        \"TimeCreated\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the version was registered.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the type version.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a specific version of a CloudFormation type.</p>\"\
    },\
    \"UpdateStackInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackName\"],\
      \"members\":{\
        \"StackName\":{\
          \"shape\":\"StackName\",\
          \"documentation\":\"<p>The name or unique stack ID of the stack to update.</p>\"\
        },\
        \"TemplateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>Structure containing the template body with a minimum length of 1 byte and a maximum length of 51,200 bytes. (For more information, go to <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html\\\">Template Anatomy</a> in the AWS CloudFormation User Guide.)</p> <p>Conditional: You must specify only one of the following parameters: <code>TemplateBody</code>, <code>TemplateURL</code>, or set the <code>UsePreviousTemplate</code> to <code>true</code>.</p>\"\
        },\
        \"TemplateURL\":{\
          \"shape\":\"TemplateURL\",\
          \"documentation\":\"<p>Location of file containing the template body. The URL must point to a template that is located in an Amazon S3 bucket. For more information, go to <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html\\\">Template Anatomy</a> in the AWS CloudFormation User Guide.</p> <p>Conditional: You must specify only one of the following parameters: <code>TemplateBody</code>, <code>TemplateURL</code>, or set the <code>UsePreviousTemplate</code> to <code>true</code>.</p>\"\
        },\
        \"UsePreviousTemplate\":{\
          \"shape\":\"UsePreviousTemplate\",\
          \"documentation\":\"<p>Reuse the existing template that is associated with the stack that you are updating.</p> <p>Conditional: You must specify only one of the following parameters: <code>TemplateBody</code>, <code>TemplateURL</code>, or set the <code>UsePreviousTemplate</code> to <code>true</code>.</p>\"\
        },\
        \"StackPolicyDuringUpdateBody\":{\
          \"shape\":\"StackPolicyDuringUpdateBody\",\
          \"documentation\":\"<p>Structure containing the temporary overriding stack policy body. You can specify either the <code>StackPolicyDuringUpdateBody</code> or the <code>StackPolicyDuringUpdateURL</code> parameter, but not both.</p> <p>If you want to update protected resources, specify a temporary overriding stack policy during this update. If you do not specify a stack policy, the current policy that is associated with the stack will be used.</p>\"\
        },\
        \"StackPolicyDuringUpdateURL\":{\
          \"shape\":\"StackPolicyDuringUpdateURL\",\
          \"documentation\":\"<p>Location of a file containing the temporary overriding stack policy. The URL must point to a policy (max size: 16KB) located in an S3 bucket in the same Region as the stack. You can specify either the <code>StackPolicyDuringUpdateBody</code> or the <code>StackPolicyDuringUpdateURL</code> parameter, but not both.</p> <p>If you want to update protected resources, specify a temporary overriding stack policy during this update. If you do not specify a stack policy, the current policy that is associated with the stack will be used.</p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"Parameters\",\
          \"documentation\":\"<p>A list of <code>Parameter</code> structures that specify input parameters for the stack. For more information, see the <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html\\\">Parameter</a> data type.</p>\"\
        },\
        \"Capabilities\":{\
          \"shape\":\"Capabilities\",\
          \"documentation\":\"<p>In some cases, you must explicitly acknowledge that your stack template contains certain capabilities in order for AWS CloudFormation to update the stack.</p> <ul> <li> <p> <code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code> </p> <p>Some stack templates might include resources that can affect permissions in your AWS account; for example, by creating new AWS Identity and Access Management (IAM) users. For those stacks, you must explicitly acknowledge this by specifying one of these capabilities.</p> <p>The following IAM resources require you to specify either the <code>CAPABILITY_IAM</code> or <code>CAPABILITY_NAMED_IAM</code> capability.</p> <ul> <li> <p>If you have IAM resources, you can specify either capability. </p> </li> <li> <p>If you have IAM resources with custom names, you <i>must</i> specify <code>CAPABILITY_NAMED_IAM</code>. </p> </li> <li> <p>If you don't specify either of these capabilities, AWS CloudFormation returns an <code>InsufficientCapabilities</code> error.</p> </li> </ul> <p>If your stack template contains these resources, we recommend that you review all permissions associated with them and edit their permissions if necessary.</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html\\\"> AWS::IAM::AccessKey</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html\\\"> AWS::IAM::Group</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html\\\"> AWS::IAM::InstanceProfile</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html\\\"> AWS::IAM::Policy</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html\\\"> AWS::IAM::Role</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html\\\"> AWS::IAM::User</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html\\\"> AWS::IAM::UserToGroupAddition</a> </p> </li> </ul> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities\\\">Acknowledging IAM Resources in AWS CloudFormation Templates</a>.</p> </li> <li> <p> <code>CAPABILITY_AUTO_EXPAND</code> </p> <p>Some template contain macros. Macros perform custom processing on templates; this can include simple actions like find-and-replace operations, all the way to extensive transformations of entire templates. Because of this, users typically create a change set from the processed template, so that they can review the changes resulting from the macros before actually updating the stack. If your stack template contains one or more macros, and you choose to update a stack directly from the processed template, without first reviewing the resulting changes in a change set, you must acknowledge this capability. This includes the <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html\\\">AWS::Include</a> and <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html\\\">AWS::Serverless</a> transforms, which are macros hosted by AWS CloudFormation.</p> <p>Change sets do not currently support nested stacks. If you want to update a stack from a stack template that contains macros <i>and</i> nested stacks, you must update the stack directly from the template using this capability.</p> <important> <p>You should only update stacks directly from a stack template that contains macros if you know what processing the macro performs.</p> <p>Each macro relies on an underlying Lambda service function for processing stack templates. Be aware that the Lambda function owner can update the function operation without AWS CloudFormation being notified.</p> </important> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html\\\">Using AWS CloudFormation Macros to Perform Custom Processing on Templates</a>.</p> </li> </ul>\"\
        },\
        \"ResourceTypes\":{\
          \"shape\":\"ResourceTypes\",\
          \"documentation\":\"<p>The template resource types that you have permissions to work with for this update stack action, such as <code>AWS::EC2::Instance</code>, <code>AWS::EC2::*</code>, or <code>Custom::MyCustomInstance</code>.</p> <p>If the list of resource types doesn't include a resource that you're updating, the stack update fails. By default, AWS CloudFormation grants permissions to all resource types. AWS Identity and Access Management (IAM) uses this parameter for AWS CloudFormation-specific condition keys in IAM policies. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html\\\">Controlling Access with AWS Identity and Access Management</a>.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an AWS Identity and Access Management (IAM) role that AWS CloudFormation assumes to update the stack. AWS CloudFormation uses the role's credentials to make calls on your behalf. AWS CloudFormation always uses this role for all future operations on the stack. As long as users have permission to operate on the stack, AWS CloudFormation uses this role even if the users don't have permission to pass it. Ensure that the role grants least privilege.</p> <p>If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials.</p>\"\
        },\
        \"RollbackConfiguration\":{\
          \"shape\":\"RollbackConfiguration\",\
          \"documentation\":\"<p>The rollback triggers for AWS CloudFormation to monitor during stack creation and updating operations, and for the specified monitoring period afterwards.</p>\"\
        },\
        \"StackPolicyBody\":{\
          \"shape\":\"StackPolicyBody\",\
          \"documentation\":\"<p>Structure containing a new stack policy body. You can specify either the <code>StackPolicyBody</code> or the <code>StackPolicyURL</code> parameter, but not both.</p> <p>You might update the stack policy, for example, in order to protect a new resource that you created during a stack update. If you do not specify a stack policy, the current policy that is associated with the stack is unchanged.</p>\"\
        },\
        \"StackPolicyURL\":{\
          \"shape\":\"StackPolicyURL\",\
          \"documentation\":\"<p>Location of a file containing the updated stack policy. The URL must point to a policy (max size: 16KB) located in an S3 bucket in the same Region as the stack. You can specify either the <code>StackPolicyBody</code> or the <code>StackPolicyURL</code> parameter, but not both.</p> <p>You might update the stack policy, for example, in order to protect a new resource that you created during a stack update. If you do not specify a stack policy, the current policy that is associated with the stack is unchanged.</p>\"\
        },\
        \"NotificationARNs\":{\
          \"shape\":\"NotificationARNs\",\
          \"documentation\":\"<p>Amazon Simple Notification Service topic Amazon Resource Names (ARNs) that AWS CloudFormation associates with the stack. Specify an empty list to remove all notification topics.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>Key-value pairs to associate with this stack. AWS CloudFormation also propagates these tags to supported resources in the stack. You can specify a maximum number of 50 tags.</p> <p>If you don't specify this parameter, AWS CloudFormation doesn't modify the stack's tags. If you specify an empty value, AWS CloudFormation removes all associated tags.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>A unique identifier for this <code>UpdateStack</code> request. Specify this token if you plan to retry requests so that AWS CloudFormation knows that you're not attempting to update a stack with the same name. You might retry <code>UpdateStack</code> requests to ensure that AWS CloudFormation successfully received them.</p> <p>All events triggered by a given stack operation are assigned the same client request token, which you can use to track operations. For example, if you execute a <code>CreateStack</code> operation with the token <code>token1</code>, then all the <code>StackEvents</code> generated by that operation will have <code>ClientRequestToken</code> set as <code>token1</code>.</p> <p>In the console, stack operations display the client request token on the Events tab. Stack operations that are initiated from the console use the token format <i>Console-StackOperation-ID</i>, which helps you easily identify the stack operation . For example, if you create a stack using the console, each stack event would be assigned the same token in the following format: <code>Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for an <a>UpdateStack</a> action.</p>\"\
    },\
    \"UpdateStackInstancesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StackSetName\",\
        \"Regions\"\
      ],\
      \"members\":{\
        \"StackSetName\":{\
          \"shape\":\"StackSetNameOrId\",\
          \"documentation\":\"<p>The name or unique ID of the stack set associated with the stack instances.</p>\"\
        },\
        \"Accounts\":{\
          \"shape\":\"AccountList\",\
          \"documentation\":\"<p>[<code>Self-managed</code> permissions] The names of one or more AWS accounts for which you want to update parameter values for stack instances. The overridden parameter values will be applied to all stack instances in the specified accounts and Regions.</p> <p>You can specify <code>Accounts</code> or <code>DeploymentTargets</code>, but not both.</p>\"\
        },\
        \"DeploymentTargets\":{\
          \"shape\":\"DeploymentTargets\",\
          \"documentation\":\"<p>[<code>Service-managed</code> permissions] The AWS Organizations accounts for which you want to update parameter values for stack instances. If your update targets OUs, the overridden parameter values only apply to the accounts that are currently in the target OUs and their child OUs. Accounts added to the target OUs and their child OUs in the future won't use the overridden values.</p> <p>You can specify <code>Accounts</code> or <code>DeploymentTargets</code>, but not both.</p>\"\
        },\
        \"Regions\":{\
          \"shape\":\"RegionList\",\
          \"documentation\":\"<p>The names of one or more Regions in which you want to update parameter values for stack instances. The overridden parameter values will be applied to all stack instances in the specified accounts and Regions.</p>\"\
        },\
        \"ParameterOverrides\":{\
          \"shape\":\"Parameters\",\
          \"documentation\":\"<p> A list of input parameters whose values you want to update for the specified stack instances. </p> <p>Any overridden parameter values will be applied to all stack instances in the specified accounts and Regions. When specifying parameters and their values, be aware of how AWS CloudFormation sets parameter values during stack instance update operations:</p> <ul> <li> <p>To override the current value for a parameter, include the parameter and specify its value.</p> </li> <li> <p>To leave a parameter set to its present value, you can do one of the following:</p> <ul> <li> <p>Do not include the parameter in the list.</p> </li> <li> <p>Include the parameter and specify <code>UsePreviousValue</code> as <code>true</code>. (You cannot specify both a value and set <code>UsePreviousValue</code> to <code>true</code>.)</p> </li> </ul> </li> <li> <p>To set all overridden parameter back to the values specified in the stack set, specify a parameter list but do not include any parameters.</p> </li> <li> <p>To leave all parameters set to their present values, do not specify this property at all.</p> </li> </ul> <p>During stack set updates, any parameter values overridden for a stack instance are not updated, but retain their overridden value.</p> <p>You can only override the parameter <i>values</i> that are specified in the stack set; to add or delete a parameter itself, use <code>UpdateStackSet</code> to update the stack set template. If you add a parameter to a template, before you can override the parameter value specified in the stack set you must first use <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html\\\">UpdateStackSet</a> to update all stack instances with the updated template and parameter value specified in the stack set. Once a stack instance has been updated with the new parameter, you can then override the parameter value using <code>UpdateStackInstances</code>.</p>\"\
        },\
        \"OperationPreferences\":{\
          \"shape\":\"StackSetOperationPreferences\",\
          \"documentation\":\"<p>Preferences for how AWS CloudFormation performs this stack set operation.</p>\"\
        },\
        \"OperationId\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The unique identifier for this stack set operation. </p> <p>The operation ID also functions as an idempotency token, to ensure that AWS CloudFormation performs the stack set operation only once, even if you retry the request multiple times. You might retry stack set operation requests to ensure that AWS CloudFormation successfully received them.</p> <p>If you don't specify an operation ID, the SDK generates one automatically. </p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"UpdateStackInstancesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The unique identifier for this stack set operation. </p>\"\
        }\
      }\
    },\
    \"UpdateStackOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>Unique identifier of the stack.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for an <a>UpdateStack</a> action.</p>\"\
    },\
    \"UpdateStackSetInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"StackSetName\"],\
      \"members\":{\
        \"StackSetName\":{\
          \"shape\":\"StackSetName\",\
          \"documentation\":\"<p>The name or unique ID of the stack set that you want to update.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A brief description of updates that you are making.</p>\"\
        },\
        \"TemplateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>The structure that contains the template body, with a minimum length of 1 byte and a maximum length of 51,200 bytes. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html\\\">Template Anatomy</a> in the AWS CloudFormation User Guide.</p> <p>Conditional: You must specify only one of the following parameters: <code>TemplateBody</code> or <code>TemplateURL</code>âor set <code>UsePreviousTemplate</code> to true.</p>\"\
        },\
        \"TemplateURL\":{\
          \"shape\":\"TemplateURL\",\
          \"documentation\":\"<p>The location of the file that contains the template body. The URL must point to a template (maximum size: 460,800 bytes) that is located in an Amazon S3 bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html\\\">Template Anatomy</a> in the AWS CloudFormation User Guide.</p> <p>Conditional: You must specify only one of the following parameters: <code>TemplateBody</code> or <code>TemplateURL</code>âor set <code>UsePreviousTemplate</code> to true. </p>\"\
        },\
        \"UsePreviousTemplate\":{\
          \"shape\":\"UsePreviousTemplate\",\
          \"documentation\":\"<p>Use the existing template that's associated with the stack set that you're updating.</p> <p>Conditional: You must specify only one of the following parameters: <code>TemplateBody</code> or <code>TemplateURL</code>âor set <code>UsePreviousTemplate</code> to true. </p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"Parameters\",\
          \"documentation\":\"<p>A list of input parameters for the stack set template. </p>\"\
        },\
        \"Capabilities\":{\
          \"shape\":\"Capabilities\",\
          \"documentation\":\"<p>In some cases, you must explicitly acknowledge that your stack template contains certain capabilities in order for AWS CloudFormation to update the stack set and its associated stack instances.</p> <ul> <li> <p> <code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code> </p> <p>Some stack templates might include resources that can affect permissions in your AWS account; for example, by creating new AWS Identity and Access Management (IAM) users. For those stacks sets, you must explicitly acknowledge this by specifying one of these capabilities.</p> <p>The following IAM resources require you to specify either the <code>CAPABILITY_IAM</code> or <code>CAPABILITY_NAMED_IAM</code> capability.</p> <ul> <li> <p>If you have IAM resources, you can specify either capability. </p> </li> <li> <p>If you have IAM resources with custom names, you <i>must</i> specify <code>CAPABILITY_NAMED_IAM</code>. </p> </li> <li> <p>If you don't specify either of these capabilities, AWS CloudFormation returns an <code>InsufficientCapabilities</code> error.</p> </li> </ul> <p>If your stack template contains these resources, we recommend that you review all permissions associated with them and edit their permissions if necessary.</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html\\\"> AWS::IAM::AccessKey</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html\\\"> AWS::IAM::Group</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html\\\"> AWS::IAM::InstanceProfile</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html\\\"> AWS::IAM::Policy</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html\\\"> AWS::IAM::Role</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html\\\"> AWS::IAM::User</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html\\\"> AWS::IAM::UserToGroupAddition</a> </p> </li> </ul> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities\\\">Acknowledging IAM Resources in AWS CloudFormation Templates</a>.</p> </li> <li> <p> <code>CAPABILITY_AUTO_EXPAND</code> </p> <p>Some templates contain macros. If your stack template contains one or more macros, and you choose to update a stack directly from the processed template, without first reviewing the resulting changes in a change set, you must acknowledge this capability. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html\\\">Using AWS CloudFormation Macros to Perform Custom Processing on Templates</a>.</p> <important> <p>Stack sets do not currently support macros in stack templates. (This includes the <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html\\\">AWS::Include</a> and <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html\\\">AWS::Serverless</a> transforms, which are macros hosted by AWS CloudFormation.) Even if you specify this capability, if you include a macro in your template the stack set operation will fail.</p> </important> </li> </ul>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The key-value pairs to associate with this stack set and the stacks created from it. AWS CloudFormation also propagates these tags to supported resources that are created in the stacks. You can specify a maximum number of 50 tags.</p> <p>If you specify tags for this parameter, those tags replace any list of tags that are currently associated with this stack set. This means:</p> <ul> <li> <p>If you don't specify this parameter, AWS CloudFormation doesn't modify the stack's tags. </p> </li> <li> <p>If you specify <i>any</i> tags using this parameter, you must specify <i>all</i> the tags that you want associated with this stack set, even tags you've specifed before (for example, when creating the stack set or during a previous update of the stack set.). Any tags that you don't include in the updated list of tags are removed from the stack set, and therefore from the stacks and resources as well. </p> </li> <li> <p>If you specify an empty value, AWS CloudFormation removes all currently associated tags.</p> </li> </ul> <p>If you specify new tags as part of an <code>UpdateStackSet</code> action, AWS CloudFormation checks to see if you have the required IAM permission to tag resources. If you omit tags that are currently associated with the stack set from the list of tags you specify, AWS CloudFormation assumes that you want to remove those tags from the stack set, and checks to see if you have permission to untag resources. If you don't have the necessary permission(s), the entire <code>UpdateStackSet</code> action fails with an <code>access denied</code> error, and the stack set is not updated.</p>\"\
        },\
        \"OperationPreferences\":{\
          \"shape\":\"StackSetOperationPreferences\",\
          \"documentation\":\"<p>Preferences for how AWS CloudFormation performs this stack set operation.</p>\"\
        },\
        \"AdministrationRoleARN\":{\
          \"shape\":\"RoleARN\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the IAM role to use to update this stack set.</p> <p>Specify an IAM role only if you are using customized administrator roles to control which users or groups can manage specific stack sets within the same administrator account. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html\\\">Granting Permissions for Stack Set Operations</a> in the <i>AWS CloudFormation User Guide</i>.</p> <p>If you specified a customized administrator role when you created the stack set, you must specify a customized administrator role, even if it is the same customized administrator role used with this stack set previously.</p>\"\
        },\
        \"ExecutionRoleName\":{\
          \"shape\":\"ExecutionRoleName\",\
          \"documentation\":\"<p>The name of the IAM execution role to use to update the stack set. If you do not specify an execution role, AWS CloudFormation uses the <code>AWSCloudFormationStackSetExecutionRole</code> role for the stack set operation.</p> <p>Specify an IAM role only if you are using customized execution roles to control which stack resources users and groups can include in their stack sets. </p> <p> If you specify a customized execution role, AWS CloudFormation uses that role to update the stack. If you do not specify a customized execution role, AWS CloudFormation performs the update using the role previously associated with the stack set, so long as you have permissions to perform operations on the stack set.</p>\"\
        },\
        \"DeploymentTargets\":{\
          \"shape\":\"DeploymentTargets\",\
          \"documentation\":\"<p>[<code>Service-managed</code> permissions] The AWS Organizations accounts in which to update associated stack instances.</p> <p>To update all the stack instances associated with this stack set, do not specify <code>DeploymentTargets</code> or <code>Regions</code>.</p> <p>If the stack set update includes changes to the template (that is, if <code>TemplateBody</code> or <code>TemplateURL</code> is specified), or the <code>Parameters</code>, AWS CloudFormation marks all stack instances with a status of <code>OUTDATED</code> prior to updating the stack instances in the specified accounts and Regions. If the stack set update does not include changes to the template or parameters, AWS CloudFormation updates the stack instances in the specified accounts and Regions, while leaving all other stack instances with their existing stack instance status.</p>\"\
        },\
        \"PermissionModel\":{\
          \"shape\":\"PermissionModels\",\
          \"documentation\":\"<p>Describes how the IAM roles required for stack set operations are created. You cannot modify <code>PermissionModel</code> if there are stack instances associated with your stack set.</p> <ul> <li> <p>With <code>self-managed</code> permissions, you must create the administrator and execution roles required to deploy to target accounts. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html\\\">Grant Self-Managed Stack Set Permissions</a>.</p> </li> <li> <p>With <code>service-managed</code> permissions, StackSets automatically creates the IAM roles required to deploy to accounts managed by AWS Organizations. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-service-managed.html\\\">Grant Service-Managed Stack Set Permissions</a>.</p> </li> </ul>\"\
        },\
        \"AutoDeployment\":{\
          \"shape\":\"AutoDeployment\",\
          \"documentation\":\"<p>[<code>Service-managed</code> permissions] Describes whether StackSets automatically deploys to AWS Organizations accounts that are added to a target organization or organizational unit (OU).</p> <p>If you specify <code>AutoDeployment</code>, do not specify <code>DeploymentTargets</code> or <code>Regions</code>.</p>\"\
        },\
        \"OperationId\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The unique ID for this stack set operation. </p> <p>The operation ID also functions as an idempotency token, to ensure that AWS CloudFormation performs the stack set operation only once, even if you retry the request multiple times. You might retry stack set operation requests to ensure that AWS CloudFormation successfully received them.</p> <p>If you don't specify an operation ID, AWS CloudFormation generates one automatically.</p> <p>Repeating this stack set operation with a new operation ID retries all stack instances whose status is <code>OUTDATED</code>. </p>\",\
          \"idempotencyToken\":true\
        },\
        \"Accounts\":{\
          \"shape\":\"AccountList\",\
          \"documentation\":\"<p>[<code>Self-managed</code> permissions] The accounts in which to update associated stack instances. If you specify accounts, you must also specify the Regions in which to update stack set instances.</p> <p>To update <i>all</i> the stack instances associated with this stack set, do not specify the <code>Accounts</code> or <code>Regions</code> properties.</p> <p>If the stack set update includes changes to the template (that is, if the <code>TemplateBody</code> or <code>TemplateURL</code> properties are specified), or the <code>Parameters</code> property, AWS CloudFormation marks all stack instances with a status of <code>OUTDATED</code> prior to updating the stack instances in the specified accounts and Regions. If the stack set update does not include changes to the template or parameters, AWS CloudFormation updates the stack instances in the specified accounts and Regions, while leaving all other stack instances with their existing stack instance status. </p>\"\
        },\
        \"Regions\":{\
          \"shape\":\"RegionList\",\
          \"documentation\":\"<p>The Regions in which to update associated stack instances. If you specify Regions, you must also specify accounts in which to update stack set instances.</p> <p>To update <i>all</i> the stack instances associated with this stack set, do not specify the <code>Accounts</code> or <code>Regions</code> properties.</p> <p>If the stack set update includes changes to the template (that is, if the <code>TemplateBody</code> or <code>TemplateURL</code> properties are specified), or the <code>Parameters</code> property, AWS CloudFormation marks all stack instances with a status of <code>OUTDATED</code> prior to updating the stack instances in the specified accounts and Regions. If the stack set update does not include changes to the template or parameters, AWS CloudFormation updates the stack instances in the specified accounts and Regions, while leaving all other stack instances with their existing stack instance status. </p>\"\
        }\
      }\
    },\
    \"UpdateStackSetOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The unique ID for this stack set operation.</p>\"\
        }\
      }\
    },\
    \"UpdateTerminationProtectionInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EnableTerminationProtection\",\
        \"StackName\"\
      ],\
      \"members\":{\
        \"EnableTerminationProtection\":{\
          \"shape\":\"EnableTerminationProtection\",\
          \"documentation\":\"<p>Whether to enable termination protection on the specified stack.</p>\"\
        },\
        \"StackName\":{\
          \"shape\":\"StackNameOrId\",\
          \"documentation\":\"<p>The name or unique ID of the stack for which you want to set termination protection.</p>\"\
        }\
      }\
    },\
    \"UpdateTerminationProtectionOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StackId\":{\
          \"shape\":\"StackId\",\
          \"documentation\":\"<p>The unique ID of the stack.</p>\"\
        }\
      }\
    },\
    \"Url\":{\"type\":\"string\"},\
    \"UsePreviousTemplate\":{\"type\":\"boolean\"},\
    \"UsePreviousValue\":{\"type\":\"boolean\"},\
    \"ValidateTemplateInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateBody\":{\
          \"shape\":\"TemplateBody\",\
          \"documentation\":\"<p>Structure containing the template body with a minimum length of 1 byte and a maximum length of 51,200 bytes. For more information, go to <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html\\\">Template Anatomy</a> in the AWS CloudFormation User Guide.</p> <p>Conditional: You must pass <code>TemplateURL</code> or <code>TemplateBody</code>. If both are passed, only <code>TemplateBody</code> is used.</p>\"\
        },\
        \"TemplateURL\":{\
          \"shape\":\"TemplateURL\",\
          \"documentation\":\"<p>Location of file containing the template body. The URL must point to a template (max size: 460,800 bytes) that is located in an Amazon S3 bucket. For more information, go to <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html\\\">Template Anatomy</a> in the AWS CloudFormation User Guide.</p> <p>Conditional: You must pass <code>TemplateURL</code> or <code>TemplateBody</code>. If both are passed, only <code>TemplateBody</code> is used.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for <a>ValidateTemplate</a> action.</p>\"\
    },\
    \"ValidateTemplateOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Parameters\":{\
          \"shape\":\"TemplateParameters\",\
          \"documentation\":\"<p>A list of <code>TemplateParameter</code> structures.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description found within the template.</p>\"\
        },\
        \"Capabilities\":{\
          \"shape\":\"Capabilities\",\
          \"documentation\":\"<p>The capabilities found within the template. If your template contains IAM resources, you must specify the CAPABILITY_IAM or CAPABILITY_NAMED_IAM value for this parameter when you use the <a>CreateStack</a> or <a>UpdateStack</a> actions with your template; otherwise, those actions return an InsufficientCapabilities error.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities\\\">Acknowledging IAM Resources in AWS CloudFormation Templates</a>.</p>\"\
        },\
        \"CapabilitiesReason\":{\
          \"shape\":\"CapabilitiesReason\",\
          \"documentation\":\"<p>The list of resources that generated the values in the <code>Capabilities</code> response element.</p>\"\
        },\
        \"DeclaredTransforms\":{\
          \"shape\":\"TransformsList\",\
          \"documentation\":\"<p>A list of the transforms that are declared in the template.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for <a>ValidateTemplate</a> action.</p>\"\
    },\
    \"Value\":{\"type\":\"string\"},\
    \"Version\":{\"type\":\"string\"},\
    \"Visibility\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PUBLIC\",\
        \"PRIVATE\"\
      ]\
    }\
  },\
  \"documentation\":\"<fullname>AWS CloudFormation</fullname> <p>AWS CloudFormation allows you to create and manage AWS infrastructure deployments predictably and repeatedly. You can use AWS CloudFormation to leverage AWS products, such as Amazon Elastic Compute Cloud, Amazon Elastic Block Store, Amazon Simple Notification Service, Elastic Load Balancing, and Auto Scaling to build highly-reliable, highly scalable, cost-effective applications without creating or configuring the underlying AWS infrastructure.</p> <p>With AWS CloudFormation, you declare all of your resources and dependencies in a template file. The template defines a collection of resources as a single unit called a stack. AWS CloudFormation creates and deletes all member resources of the stack together and manages all dependencies between the resources for you.</p> <p>For more information about AWS CloudFormation, see the <a href=\\\"http://aws.amazon.com/cloudformation/\\\">AWS CloudFormation Product Page</a>.</p> <p>Amazon CloudFormation makes use of other AWS products. If you need additional technical information about a specific AWS product, you can find the product's technical documentation at <a href=\\\"https://docs.aws.amazon.com/\\\">docs.aws.amazon.com</a>.</p>\"\
}\
";
}

@end
