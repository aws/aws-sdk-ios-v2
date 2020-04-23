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

#import "AWSramResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSramResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSramResources

+ (instancetype)sharedInstance {
    static AWSramResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSramResources new];
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
    \"apiVersion\":\"2018-01-04\",\
    \"endpointPrefix\":\"ram\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"rest-json\",\
    \"serviceAbbreviation\":\"RAM\",\
    \"serviceFullName\":\"AWS Resource Access Manager\",\
    \"serviceId\":\"RAM\",\
    \"signatureVersion\":\"v4\",\
    \"uid\":\"ram-2018-01-04\"\
  },\
  \"operations\":{\
    \"AcceptResourceShareInvitation\":{\
      \"name\":\"AcceptResourceShareInvitation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/acceptresourceshareinvitation\"\
      },\
      \"input\":{\"shape\":\"AcceptResourceShareInvitationRequest\"},\
      \"output\":{\"shape\":\"AcceptResourceShareInvitationResponse\"},\
      \"errors\":[\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"OperationNotPermittedException\"},\
        {\"shape\":\"ResourceShareInvitationArnNotFoundException\"},\
        {\"shape\":\"ResourceShareInvitationAlreadyAcceptedException\"},\
        {\"shape\":\"ResourceShareInvitationAlreadyRejectedException\"},\
        {\"shape\":\"ResourceShareInvitationExpiredException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InvalidClientTokenException\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"}\
      ],\
      \"documentation\":\"<p>Accepts an invitation to a resource share from another AWS account.</p>\"\
    },\
    \"AssociateResourceShare\":{\
      \"name\":\"AssociateResourceShare\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/associateresourceshare\"\
      },\
      \"input\":{\"shape\":\"AssociateResourceShareRequest\"},\
      \"output\":{\"shape\":\"AssociateResourceShareResponse\"},\
      \"errors\":[\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"UnknownResourceException\"},\
        {\"shape\":\"InvalidStateTransitionException\"},\
        {\"shape\":\"ResourceShareLimitExceededException\"},\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"InvalidStateTransitionException\"},\
        {\"shape\":\"InvalidClientTokenException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"OperationNotPermittedException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"UnknownResourceException\"}\
      ],\
      \"documentation\":\"<p>Associates the specified resource share with the specified principals and resources.</p>\"\
    },\
    \"AssociateResourceSharePermission\":{\
      \"name\":\"AssociateResourceSharePermission\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/associateresourcesharepermission\"\
      },\
      \"input\":{\"shape\":\"AssociateResourceSharePermissionRequest\"},\
      \"output\":{\"shape\":\"AssociateResourceSharePermissionResponse\"},\
      \"errors\":[\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"UnknownResourceException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidClientTokenException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"OperationNotPermittedException\"}\
      ],\
      \"documentation\":\"<p>Associates a permission with a resource share.</p>\"\
    },\
    \"CreateResourceShare\":{\
      \"name\":\"CreateResourceShare\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/createresourceshare\"\
      },\
      \"input\":{\"shape\":\"CreateResourceShareRequest\"},\
      \"output\":{\"shape\":\"CreateResourceShareResponse\"},\
      \"errors\":[\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"InvalidStateTransitionException\"},\
        {\"shape\":\"UnknownResourceException\"},\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"InvalidClientTokenException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"OperationNotPermittedException\"},\
        {\"shape\":\"ResourceShareLimitExceededException\"},\
        {\"shape\":\"TagPolicyViolationException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates a resource share.</p>\"\
    },\
    \"DeleteResourceShare\":{\
      \"name\":\"DeleteResourceShare\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/deleteresourceshare\"\
      },\
      \"input\":{\"shape\":\"DeleteResourceShareRequest\"},\
      \"output\":{\"shape\":\"DeleteResourceShareResponse\"},\
      \"errors\":[\
        {\"shape\":\"OperationNotPermittedException\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"InvalidStateTransitionException\"},\
        {\"shape\":\"UnknownResourceException\"},\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"InvalidClientTokenException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified resource share.</p>\"\
    },\
    \"DisassociateResourceShare\":{\
      \"name\":\"DisassociateResourceShare\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/disassociateresourceshare\"\
      },\
      \"input\":{\"shape\":\"DisassociateResourceShareRequest\"},\
      \"output\":{\"shape\":\"DisassociateResourceShareResponse\"},\
      \"errors\":[\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"ResourceShareLimitExceededException\"},\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"InvalidStateTransitionException\"},\
        {\"shape\":\"InvalidClientTokenException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"OperationNotPermittedException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"UnknownResourceException\"}\
      ],\
      \"documentation\":\"<p>Disassociates the specified principals or resources from the specified resource share.</p>\"\
    },\
    \"DisassociateResourceSharePermission\":{\
      \"name\":\"DisassociateResourceSharePermission\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/disassociateresourcesharepermission\"\
      },\
      \"input\":{\"shape\":\"DisassociateResourceSharePermissionRequest\"},\
      \"output\":{\"shape\":\"DisassociateResourceSharePermissionResponse\"},\
      \"errors\":[\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"UnknownResourceException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidClientTokenException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"OperationNotPermittedException\"}\
      ],\
      \"documentation\":\"<p>Disassociates an AWS RAM permission from a resource share.</p>\"\
    },\
    \"EnableSharingWithAwsOrganization\":{\
      \"name\":\"EnableSharingWithAwsOrganization\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/enablesharingwithawsorganization\"\
      },\
      \"input\":{\"shape\":\"EnableSharingWithAwsOrganizationRequest\"},\
      \"output\":{\"shape\":\"EnableSharingWithAwsOrganizationResponse\"},\
      \"errors\":[\
        {\"shape\":\"OperationNotPermittedException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Enables resource sharing within your AWS Organization.</p> <p>The caller must be the master account for the AWS Organization.</p>\"\
    },\
    \"GetPermission\":{\
      \"name\":\"GetPermission\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/getpermission\"\
      },\
      \"input\":{\"shape\":\"GetPermissionRequest\"},\
      \"output\":{\"shape\":\"GetPermissionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"UnknownResourceException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"OperationNotPermittedException\"}\
      ],\
      \"documentation\":\"<p>Gets the contents of an AWS RAM permission in JSON format.</p>\"\
    },\
    \"GetResourcePolicies\":{\
      \"name\":\"GetResourcePolicies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/getresourcepolicies\"\
      },\
      \"input\":{\"shape\":\"GetResourcePoliciesRequest\"},\
      \"output\":{\"shape\":\"GetResourcePoliciesResponse\"},\
      \"errors\":[\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceArnNotFoundException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Gets the policies for the specified resources that you own and have shared.</p>\"\
    },\
    \"GetResourceShareAssociations\":{\
      \"name\":\"GetResourceShareAssociations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/getresourceshareassociations\"\
      },\
      \"input\":{\"shape\":\"GetResourceShareAssociationsRequest\"},\
      \"output\":{\"shape\":\"GetResourceShareAssociationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"UnknownResourceException\"},\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"OperationNotPermittedException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Gets the resources or principals for the resource shares that you own.</p>\"\
    },\
    \"GetResourceShareInvitations\":{\
      \"name\":\"GetResourceShareInvitations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/getresourceshareinvitations\"\
      },\
      \"input\":{\"shape\":\"GetResourceShareInvitationsRequest\"},\
      \"output\":{\"shape\":\"GetResourceShareInvitationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceShareInvitationArnNotFoundException\"},\
        {\"shape\":\"InvalidMaxResultsException\"},\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"UnknownResourceException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Gets the invitations for resource sharing that you've received.</p>\"\
    },\
    \"GetResourceShares\":{\
      \"name\":\"GetResourceShares\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/getresourceshares\"\
      },\
      \"input\":{\"shape\":\"GetResourceSharesRequest\"},\
      \"output\":{\"shape\":\"GetResourceSharesResponse\"},\
      \"errors\":[\
        {\"shape\":\"UnknownResourceException\"},\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Gets the resource shares that you own or the resource shares that are shared with you.</p>\"\
    },\
    \"ListPendingInvitationResources\":{\
      \"name\":\"ListPendingInvitationResources\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/listpendinginvitationresources\"\
      },\
      \"input\":{\"shape\":\"ListPendingInvitationResourcesRequest\"},\
      \"output\":{\"shape\":\"ListPendingInvitationResourcesResponse\"},\
      \"errors\":[\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ResourceShareInvitationArnNotFoundException\"},\
        {\"shape\":\"MissingRequiredParameterException\"},\
        {\"shape\":\"ResourceShareInvitationAlreadyRejectedException\"},\
        {\"shape\":\"ResourceShareInvitationExpiredException\"}\
      ],\
      \"documentation\":\"<p>Lists the resources in a resource share that is shared with you but that the invitation is still pending for.</p>\"\
    },\
    \"ListPermissions\":{\
      \"name\":\"ListPermissions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/listpermissions\"\
      },\
      \"input\":{\"shape\":\"ListPermissionsRequest\"},\
      \"output\":{\"shape\":\"ListPermissionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"OperationNotPermittedException\"}\
      ],\
      \"documentation\":\"<p>Lists the AWS RAM permissions.</p>\"\
    },\
    \"ListPrincipals\":{\
      \"name\":\"ListPrincipals\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/listprincipals\"\
      },\
      \"input\":{\"shape\":\"ListPrincipalsRequest\"},\
      \"output\":{\"shape\":\"ListPrincipalsResponse\"},\
      \"errors\":[\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"UnknownResourceException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the principals that you have shared resources with or that have shared resources with you.</p>\"\
    },\
    \"ListResourceSharePermissions\":{\
      \"name\":\"ListResourceSharePermissions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/listresourcesharepermissions\"\
      },\
      \"input\":{\"shape\":\"ListResourceSharePermissionsRequest\"},\
      \"output\":{\"shape\":\"ListResourceSharePermissionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"UnknownResourceException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"OperationNotPermittedException\"}\
      ],\
      \"documentation\":\"<p>Lists the AWS RAM permissions that are associated with a resource share.</p>\"\
    },\
    \"ListResourceTypes\":{\
      \"name\":\"ListResourceTypes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/listresourcetypes\"\
      },\
      \"input\":{\"shape\":\"ListResourceTypesRequest\"},\
      \"output\":{\"shape\":\"ListResourceTypesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the shareable resource types supported by AWS RAM.</p>\"\
    },\
    \"ListResources\":{\
      \"name\":\"ListResources\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/listresources\"\
      },\
      \"input\":{\"shape\":\"ListResourcesRequest\"},\
      \"output\":{\"shape\":\"ListResourcesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidResourceTypeException\"},\
        {\"shape\":\"UnknownResourceException\"},\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the resources that you added to a resource shares or the resources that are shared with you.</p>\"\
    },\
    \"PromoteResourceShareCreatedFromPolicy\":{\
      \"name\":\"PromoteResourceShareCreatedFromPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/promoteresourcesharecreatedfrompolicy\"\
      },\
      \"input\":{\"shape\":\"PromoteResourceShareCreatedFromPolicyRequest\"},\
      \"output\":{\"shape\":\"PromoteResourceShareCreatedFromPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"OperationNotPermittedException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"MissingRequiredParameterException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"UnknownResourceException\"}\
      ],\
      \"documentation\":\"<p>Resource shares that were created by attaching a policy to a resource are visible only to the resource share owner, and the resource share cannot be modified in AWS RAM.</p> <p>Use this API action to promote the resource share. When you promote the resource share, it becomes:</p> <ul> <li> <p>Visible to all principals that it is shared with.</p> </li> <li> <p>Modifiable in AWS RAM.</p> </li> </ul>\"\
    },\
    \"RejectResourceShareInvitation\":{\
      \"name\":\"RejectResourceShareInvitation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/rejectresourceshareinvitation\"\
      },\
      \"input\":{\"shape\":\"RejectResourceShareInvitationRequest\"},\
      \"output\":{\"shape\":\"RejectResourceShareInvitationResponse\"},\
      \"errors\":[\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"OperationNotPermittedException\"},\
        {\"shape\":\"ResourceShareInvitationArnNotFoundException\"},\
        {\"shape\":\"ResourceShareInvitationAlreadyAcceptedException\"},\
        {\"shape\":\"ResourceShareInvitationAlreadyRejectedException\"},\
        {\"shape\":\"ResourceShareInvitationExpiredException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InvalidClientTokenException\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"}\
      ],\
      \"documentation\":\"<p>Rejects an invitation to a resource share from another AWS account.</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tagresource\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"output\":{\"shape\":\"TagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"TagLimitExceededException\"},\
        {\"shape\":\"ResourceArnNotFoundException\"},\
        {\"shape\":\"TagPolicyViolationException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Adds the specified tags to the specified resource share that you own.</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/untagresource\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"output\":{\"shape\":\"UntagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified tags from the specified resource share that you own.</p>\"\
    },\
    \"UpdateResourceShare\":{\
      \"name\":\"UpdateResourceShare\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/updateresourceshare\"\
      },\
      \"input\":{\"shape\":\"UpdateResourceShareRequest\"},\
      \"output\":{\"shape\":\"UpdateResourceShareResponse\"},\
      \"errors\":[\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"MissingRequiredParameterException\"},\
        {\"shape\":\"UnknownResourceException\"},\
        {\"shape\":\"MalformedArnException\"},\
        {\"shape\":\"InvalidClientTokenException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"OperationNotPermittedException\"},\
        {\"shape\":\"ServerInternalException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified resource share that you own.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AcceptResourceShareInvitationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceShareInvitationArn\"],\
      \"members\":{\
        \"resourceShareInvitationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the invitation.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\"\
        }\
      }\
    },\
    \"AcceptResourceShareInvitationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceShareInvitation\":{\
          \"shape\":\"ResourceShareInvitation\",\
          \"documentation\":\"<p>Information about the invitation.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\"\
        }\
      }\
    },\
    \"AssociateResourceSharePermissionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceShareArn\",\
        \"permissionArn\"\
      ],\
      \"members\":{\
        \"resourceShareArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource share.</p>\"\
        },\
        \"permissionArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN of the AWS RAM permission to associate with the resource share.</p>\"\
        },\
        \"replace\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the permission should replace the permissions that are currently associated with the resource share. Use <code>true</code> to replace the current permissions. Use <code>false</code> to add the permission to the current permission.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\"\
        }\
      }\
    },\
    \"AssociateResourceSharePermissionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"returnValue\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the request succeeded.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\"\
        }\
      }\
    },\
    \"AssociateResourceShareRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceShareArn\"],\
      \"members\":{\
        \"resourceShareArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource share.</p>\"\
        },\
        \"resourceArns\":{\
          \"shape\":\"ResourceArnList\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the resources.</p>\"\
        },\
        \"principals\":{\
          \"shape\":\"PrincipalArnOrIdList\",\
          \"documentation\":\"<p>The principals.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\"\
        }\
      }\
    },\
    \"AssociateResourceShareResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceShareAssociations\":{\
          \"shape\":\"ResourceShareAssociationList\",\
          \"documentation\":\"<p>Information about the associations.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\"\
        }\
      }\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"CreateResourceShareRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"name\"],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the resource share.</p>\"\
        },\
        \"resourceArns\":{\
          \"shape\":\"ResourceArnList\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the resources to associate with the resource share.</p>\"\
        },\
        \"principals\":{\
          \"shape\":\"PrincipalArnOrIdList\",\
          \"documentation\":\"<p>The principals to associate with the resource share. The possible values are IDs of AWS accounts, the ARN of an OU or organization from AWS Organizations.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>One or more tags.</p>\"\
        },\
        \"allowExternalPrincipals\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether principals outside your AWS organization can be associated with a resource share.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\"\
        },\
        \"permissionArns\":{\
          \"shape\":\"PermissionArnList\",\
          \"documentation\":\"<p>The ARNs of the permissions to associate with the resource share. If you do not specify an ARN for the permission, AWS RAM automatically attaches the default version of the permission for each resource type.</p>\"\
        }\
      }\
    },\
    \"CreateResourceShareResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceShare\":{\
          \"shape\":\"ResourceShare\",\
          \"documentation\":\"<p>Information about the resource share.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\"\
        }\
      }\
    },\
    \"DateTime\":{\"type\":\"timestamp\"},\
    \"DeleteResourceShareRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceShareArn\"],\
      \"members\":{\
        \"resourceShareArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource share.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceShareArn\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"clientToken\"\
        }\
      }\
    },\
    \"DeleteResourceShareResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"returnValue\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the request succeeded.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\"\
        }\
      }\
    },\
    \"DisassociateResourceSharePermissionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceShareArn\",\
        \"permissionArn\"\
      ],\
      \"members\":{\
        \"resourceShareArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource share.</p>\"\
        },\
        \"permissionArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN of the permission to disassociate from the resource share.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\"\
        }\
      }\
    },\
    \"DisassociateResourceSharePermissionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"returnValue\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the request succeeded.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\"\
        }\
      }\
    },\
    \"DisassociateResourceShareRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceShareArn\"],\
      \"members\":{\
        \"resourceShareArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource share.</p>\"\
        },\
        \"resourceArns\":{\
          \"shape\":\"ResourceArnList\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARNs) of the resources.</p>\"\
        },\
        \"principals\":{\
          \"shape\":\"PrincipalArnOrIdList\",\
          \"documentation\":\"<p>The principals.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\"\
        }\
      }\
    },\
    \"DisassociateResourceShareResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceShareAssociations\":{\
          \"shape\":\"ResourceShareAssociationList\",\
          \"documentation\":\"<p>Information about the associations.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\"\
        }\
      }\
    },\
    \"EnableSharingWithAwsOrganizationRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"EnableSharingWithAwsOrganizationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"returnValue\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the request succeeded.</p>\"\
        }\
      }\
    },\
    \"GetPermissionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"permissionArn\"],\
      \"members\":{\
        \"permissionArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN of the permission.</p>\"\
        },\
        \"permissionVersion\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The identifier for the version of the permission.</p>\"\
        }\
      }\
    },\
    \"GetPermissionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"permission\":{\
          \"shape\":\"ResourceSharePermissionDetail\",\
          \"documentation\":\"<p>Information about the permission.</p>\"\
        }\
      }\
    },\
    \"GetResourcePoliciesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceArns\"],\
      \"members\":{\
        \"resourceArns\":{\
          \"shape\":\"ResourceArnList\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the resources.</p>\"\
        },\
        \"principal\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The principal.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next page of results.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>\"\
        }\
      }\
    },\
    \"GetResourcePoliciesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policies\":{\
          \"shape\":\"PolicyList\",\
          \"documentation\":\"<p>A key policy document, in JSON format.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\"\
        }\
      }\
    },\
    \"GetResourceShareAssociationsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"associationType\"],\
      \"members\":{\
        \"associationType\":{\
          \"shape\":\"ResourceShareAssociationType\",\
          \"documentation\":\"<p>The association type. Specify <code>PRINCIPAL</code> to list the principals that are associated with the specified resource share. Specify <code>RESOURCE</code> to list the resources that are associated with the specified resource share.</p>\"\
        },\
        \"resourceShareArns\":{\
          \"shape\":\"ResourceShareArnList\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the resource shares.</p>\"\
        },\
        \"resourceArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource. You cannot specify this parameter if the association type is <code>PRINCIPAL</code>.</p>\"\
        },\
        \"principal\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The principal. You cannot specify this parameter if the association type is <code>RESOURCE</code>.</p>\"\
        },\
        \"associationStatus\":{\
          \"shape\":\"ResourceShareAssociationStatus\",\
          \"documentation\":\"<p>The association status.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next page of results.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>\"\
        }\
      }\
    },\
    \"GetResourceShareAssociationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceShareAssociations\":{\
          \"shape\":\"ResourceShareAssociationList\",\
          \"documentation\":\"<p>Information about the associations.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\"\
        }\
      }\
    },\
    \"GetResourceShareInvitationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceShareInvitationArns\":{\
          \"shape\":\"ResourceShareInvitationArnList\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the invitations.</p>\"\
        },\
        \"resourceShareArns\":{\
          \"shape\":\"ResourceShareArnList\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the resource shares.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next page of results.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>\"\
        }\
      }\
    },\
    \"GetResourceShareInvitationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceShareInvitations\":{\
          \"shape\":\"ResourceShareInvitationList\",\
          \"documentation\":\"<p>Information about the invitations.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\"\
        }\
      }\
    },\
    \"GetResourceSharesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceOwner\"],\
      \"members\":{\
        \"resourceShareArns\":{\
          \"shape\":\"ResourceShareArnList\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the resource shares.</p>\"\
        },\
        \"resourceShareStatus\":{\
          \"shape\":\"ResourceShareStatus\",\
          \"documentation\":\"<p>The status of the resource share.</p>\"\
        },\
        \"resourceOwner\":{\
          \"shape\":\"ResourceOwner\",\
          \"documentation\":\"<p>The type of owner.</p>\"\
        },\
        \"name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the resource share.</p>\"\
        },\
        \"tagFilters\":{\
          \"shape\":\"TagFilters\",\
          \"documentation\":\"<p>One or more tag filters.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next page of results.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>\"\
        }\
      }\
    },\
    \"GetResourceSharesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceShares\":{\
          \"shape\":\"ResourceShareList\",\
          \"documentation\":\"<p>Information about the resource shares.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\"\
        }\
      }\
    },\
    \"IdempotentParameterMismatchException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>A client token input parameter was reused with an operation, but at least one of the other input parameters is different from the previous call to the operation.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"Integer\":{\"type\":\"integer\"},\
    \"InvalidClientTokenException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>A client token is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidMaxResultsException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The specified value for MaxResults is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidNextTokenException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The specified value for NextToken is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidParameterException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>A parameter is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidResourceTypeException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The specified resource type is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidStateTransitionException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The requested state transition is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ListPendingInvitationResourcesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceShareInvitationArn\"],\
      \"members\":{\
        \"resourceShareInvitationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the invitation.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next page of results.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>\"\
        }\
      }\
    },\
    \"ListPendingInvitationResourcesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resources\":{\
          \"shape\":\"ResourceList\",\
          \"documentation\":\"<p>Information about the resources included the resource share.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\"\
        }\
      }\
    },\
    \"ListPermissionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the resource type for which to list permissions. For example, to list only permissions that apply to EC2 subnets, specify <code>ec2:Subnet</code>.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next page of results.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>\"\
        }\
      }\
    },\
    \"ListPermissionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"permissions\":{\
          \"shape\":\"ResourceSharePermissionList\",\
          \"documentation\":\"<p>Information about the permissions.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\"\
        }\
      }\
    },\
    \"ListPrincipalsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceOwner\"],\
      \"members\":{\
        \"resourceOwner\":{\
          \"shape\":\"ResourceOwner\",\
          \"documentation\":\"<p>The type of owner.</p>\"\
        },\
        \"resourceArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        },\
        \"principals\":{\
          \"shape\":\"PrincipalArnOrIdList\",\
          \"documentation\":\"<p>The principals.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The resource type.</p> <p>Valid values: <code>codebuild:Project</code> | <code>codebuild:ReportGroup</code> | <code>ec2:CapacityReservation</code> | <code>ec2:DedicatedHost</code> | <code>ec2:Subnet</code> | <code>ec2:TrafficMirrorTarget</code> | <code>ec2:TransitGateway</code> | <code>imagebuilder:Component</code> | <code>imagebuilder:Image</code> | <code>imagebuilder:ImageRecipe</code> | <code>license-manager:LicenseConfiguration</code> I <code>resource-groups:Group</code> | <code>rds:Cluster</code> | <code>route53resolver:ResolverRule</code> </p>\"\
        },\
        \"resourceShareArns\":{\
          \"shape\":\"ResourceShareArnList\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the resource shares.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next page of results.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>\"\
        }\
      }\
    },\
    \"ListPrincipalsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"principals\":{\
          \"shape\":\"PrincipalList\",\
          \"documentation\":\"<p>The principals.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\"\
        }\
      }\
    },\
    \"ListResourceSharePermissionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceShareArn\"],\
      \"members\":{\
        \"resourceShareArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource share.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next page of results.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>\"\
        }\
      }\
    },\
    \"ListResourceSharePermissionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"permissions\":{\
          \"shape\":\"ResourceSharePermissionList\",\
          \"documentation\":\"<p>The permissions associated with the resource share.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\"\
        }\
      }\
    },\
    \"ListResourceTypesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next page of results.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>\"\
        }\
      }\
    },\
    \"ListResourceTypesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceTypes\":{\
          \"shape\":\"ServiceNameAndResourceTypeList\",\
          \"documentation\":\"<p>The shareable resource types supported by AWS RAM.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\"\
        }\
      }\
    },\
    \"ListResourcesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceOwner\"],\
      \"members\":{\
        \"resourceOwner\":{\
          \"shape\":\"ResourceOwner\",\
          \"documentation\":\"<p>The type of owner.</p>\"\
        },\
        \"principal\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The principal.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The resource type.</p> <p>Valid values: <code>codebuild:Project</code> | <code>codebuild:ReportGroup</code> | <code>ec2:CapacityReservation</code> | <code>ec2:DedicatedHost</code> | <code>ec2:Subnet</code> | <code>ec2:TrafficMirrorTarget</code> | <code>ec2:TransitGateway</code> | <code>imagebuilder:Component</code> | <code>imagebuilder:Image</code> | <code>imagebuilder:ImageRecipe</code> | <code>license-manager:LicenseConfiguration</code> I <code>resource-groups:Group</code> | <code>rds:Cluster</code> | <code>route53resolver:ResolverRule</code> </p>\"\
        },\
        \"resourceArns\":{\
          \"shape\":\"ResourceArnList\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the resources.</p>\"\
        },\
        \"resourceShareArns\":{\
          \"shape\":\"ResourceShareArnList\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the resource shares.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next page of results.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>\"\
        }\
      }\
    },\
    \"ListResourcesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resources\":{\
          \"shape\":\"ResourceList\",\
          \"documentation\":\"<p>Information about the resources.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\"\
        }\
      }\
    },\
    \"MalformedArnException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The format of an Amazon Resource Name (ARN) is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":500,\
      \"min\":1\
    },\
    \"MissingRequiredParameterException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>A required input parameter is missing.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"OperationNotPermittedException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The requested operation is not permitted.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"PermissionArnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"Policy\":{\"type\":\"string\"},\
    \"PolicyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Policy\"}\
    },\
    \"Principal\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"id\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the principal.</p>\"\
        },\
        \"resourceShareArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource share.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time when the principal was associated with the resource share.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time when the association was last updated.</p>\"\
        },\
        \"external\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the principal belongs to the same AWS organization as the AWS account that owns the resource share.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a principal for use with AWS Resource Access Manager.</p>\"\
    },\
    \"PrincipalArnOrIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"PrincipalList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Principal\"}\
    },\
    \"PromoteResourceShareCreatedFromPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceShareArn\"],\
      \"members\":{\
        \"resourceShareArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN of the resource share to promote.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceShareArn\"\
        }\
      }\
    },\
    \"PromoteResourceShareCreatedFromPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"returnValue\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the request succeeded.</p>\"\
        }\
      }\
    },\
    \"RejectResourceShareInvitationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceShareInvitationArn\"],\
      \"members\":{\
        \"resourceShareInvitationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the invitation.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\"\
        }\
      }\
    },\
    \"RejectResourceShareInvitationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceShareInvitation\":{\
          \"shape\":\"ResourceShareInvitation\",\
          \"documentation\":\"<p>Information about the invitation.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\"\
        }\
      }\
    },\
    \"Resource\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"arn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\"\
        },\
        \"type\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The resource type.</p>\"\
        },\
        \"resourceShareArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource share.</p>\"\
        },\
        \"resourceGroupArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN of the resource group. This value is returned only if the resource is a resource group.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"ResourceStatus\",\
          \"documentation\":\"<p>The status of the resource.</p>\"\
        },\
        \"statusMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A message about the status of the resource.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time when the resource was associated with the resource share.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time when the association was last updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a resource associated with a resource share.</p>\"\
    },\
    \"ResourceArnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"ResourceArnNotFoundException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>An Amazon Resource Name (ARN) was not found.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ResourceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Resource\"}\
    },\
    \"ResourceOwner\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SELF\",\
        \"OTHER-ACCOUNTS\"\
      ]\
    },\
    \"ResourceShare\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceShareArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource share.</p>\"\
        },\
        \"name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the resource share.</p>\"\
        },\
        \"owningAccountId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AWS account that owns the resource share.</p>\"\
        },\
        \"allowExternalPrincipals\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether principals outside your AWS organization can be associated with a resource share.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"ResourceShareStatus\",\
          \"documentation\":\"<p>The status of the resource share.</p>\"\
        },\
        \"statusMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A message about the status of the resource share.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags for the resource share.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time when the resource share was created.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time when the resource share was last updated.</p>\"\
        },\
        \"featureSet\":{\
          \"shape\":\"ResourceShareFeatureSet\",\
          \"documentation\":\"<p>Indicates how the resource share was created. Possible values include:</p> <ul> <li> <p> <code>CREATED_FROM_POLICY</code> - Indicates that the resource share was created from an AWS Identity and Access Management (AWS IAM) policy attached to a resource. These resource shares are visible only to the AWS account that created it. They cannot be modified in AWS RAM.</p> </li> <li> <p> <code>PROMOTING_TO_STANDARD</code> - The resource share is in the process of being promoted. For more information, see <a>PromoteResourceShareCreatedFromPolicy</a>.</p> </li> <li> <p> <code>STANDARD</code> - Indicates that the resource share was created in AWS RAM using the console or APIs. These resource shares are visible to all principals. They can be modified in AWS RAM.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a resource share.</p>\"\
    },\
    \"ResourceShareArnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"ResourceShareAssociation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceShareArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource share.</p>\"\
        },\
        \"resourceShareName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the resource share.</p>\"\
        },\
        \"associatedEntity\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The associated entity. For resource associations, this is the ARN of the resource. For principal associations, this is the ID of an AWS account or the ARN of an OU or organization from AWS Organizations.</p>\"\
        },\
        \"associationType\":{\
          \"shape\":\"ResourceShareAssociationType\",\
          \"documentation\":\"<p>The association type.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"ResourceShareAssociationStatus\",\
          \"documentation\":\"<p>The status of the association.</p>\"\
        },\
        \"statusMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A message about the status of the association.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time when the association was created.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time when the association was last updated.</p>\"\
        },\
        \"external\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the principal belongs to the same AWS organization as the AWS account that owns the resource share.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an association with a resource share.</p>\"\
    },\
    \"ResourceShareAssociationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceShareAssociation\"}\
    },\
    \"ResourceShareAssociationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ASSOCIATING\",\
        \"ASSOCIATED\",\
        \"FAILED\",\
        \"DISASSOCIATING\",\
        \"DISASSOCIATED\"\
      ]\
    },\
    \"ResourceShareAssociationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PRINCIPAL\",\
        \"RESOURCE\"\
      ]\
    },\
    \"ResourceShareFeatureSet\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATED_FROM_POLICY\",\
        \"PROMOTING_TO_STANDARD\",\
        \"STANDARD\"\
      ]\
    },\
    \"ResourceShareInvitation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceShareInvitationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the invitation.</p>\"\
        },\
        \"resourceShareName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the resource share.</p>\"\
        },\
        \"resourceShareArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource share.</p>\"\
        },\
        \"senderAccountId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AWS account that sent the invitation.</p>\"\
        },\
        \"receiverAccountId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AWS account that received the invitation.</p>\"\
        },\
        \"invitationTimestamp\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time when the invitation was sent.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"ResourceShareInvitationStatus\",\
          \"documentation\":\"<p>The status of the invitation.</p>\"\
        },\
        \"resourceShareAssociations\":{\
          \"shape\":\"ResourceShareAssociationList\",\
          \"documentation\":\"<p>To view the resources associated with a pending resource share invitation, use <a href=\\\"https://docs.aws.amazon.com/ram/latest/APIReference/API_ListPendingInvitationResources.html\\\"> ListPendingInvitationResources</a>.</p>\",\
          \"deprecated\":true,\
          \"deprecatedMessage\":\"This member has been deprecated. Use ListPendingInvitationResources.\"\
        }\
      },\
      \"documentation\":\"<p>Describes an invitation to join a resource share.</p>\"\
    },\
    \"ResourceShareInvitationAlreadyAcceptedException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The invitation was already accepted.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ResourceShareInvitationAlreadyRejectedException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The invitation was already rejected.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ResourceShareInvitationArnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"ResourceShareInvitationArnNotFoundException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The Amazon Resource Name (ARN) for an invitation was not found.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ResourceShareInvitationExpiredException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The invitation is expired.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ResourceShareInvitationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceShareInvitation\"}\
    },\
    \"ResourceShareInvitationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"ACCEPTED\",\
        \"REJECTED\",\
        \"EXPIRED\"\
      ]\
    },\
    \"ResourceShareLimitExceededException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The requested resource share exceeds the limit for your account.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ResourceShareList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceShare\"}\
    },\
    \"ResourceSharePermissionDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"arn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN of the permission.</p>\"\
        },\
        \"version\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier for the version of the permission.</p>\"\
        },\
        \"defaultVersion\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>The identifier for the version of the permission that is set as the default version.</p>\"\
        },\
        \"name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the permission.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The resource type to which the permission applies.</p>\"\
        },\
        \"permission\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The permission's effect and actions in JSON format. The <code>effect</code> indicates whether the actions are allowed or denied. The <code>actions</code> list the API actions to which the principal is granted or denied access.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time when the permission was created.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time when the permission was last updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an AWS RAM permission.</p>\"\
    },\
    \"ResourceSharePermissionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceSharePermissionSummary\"}\
    },\
    \"ResourceSharePermissionSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"arn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN of the permission.</p>\"\
        },\
        \"version\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier for the version of the permission.</p>\"\
        },\
        \"defaultVersion\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>The identifier for the version of the permission that is set as the default version.</p>\"\
        },\
        \"name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the permission.</p>\"\
        },\
        \"resourceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The type of resource to which the permission applies.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The current status of the permission.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time when the permission was created.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time when the permission was last updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a permission that is associated with a resource share.</p>\"\
    },\
    \"ResourceShareStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"ACTIVE\",\
        \"FAILED\",\
        \"DELETING\",\
        \"DELETED\"\
      ]\
    },\
    \"ResourceStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AVAILABLE\",\
        \"ZONAL_RESOURCE_INACCESSIBLE\",\
        \"LIMIT_EXCEEDED\",\
        \"UNAVAILABLE\",\
        \"PENDING\"\
      ]\
    },\
    \"ServerInternalException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The service could not respond to the request due to an internal problem.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true\
    },\
    \"ServiceNameAndResourceType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The shareable resource types.</p>\"\
        },\
        \"serviceName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the AWS services to which the resources belong.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the shareable resource types and the AWS services to which they belong.</p>\"\
    },\
    \"ServiceNameAndResourceTypeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ServiceNameAndResourceType\"}\
    },\
    \"ServiceUnavailableException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The service is not available.</p>\",\
      \"error\":{\"httpStatusCode\":503},\
      \"exception\":true\
    },\
    \"String\":{\"type\":\"string\"},\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The key of the tag.</p>\"\
        },\
        \"value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The value of the tag.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a tag.</p>\"\
    },\
    \"TagFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tagKey\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The tag key.</p>\"\
        },\
        \"tagValues\":{\
          \"shape\":\"TagValueList\",\
          \"documentation\":\"<p>The tag values.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Used to filter information based on tags.</p>\"\
    },\
    \"TagFilters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagFilter\"}\
    },\
    \"TagKey\":{\"type\":\"string\"},\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"}\
    },\
    \"TagLimitExceededException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The requested tags exceed the limit for your account.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"}\
    },\
    \"TagPolicyViolationException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The specified tag is a reserved word and cannot be used.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceShareArn\",\
        \"tags\"\
      ],\
      \"members\":{\
        \"resourceShareArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource share.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>One or more tags.</p>\"\
        }\
      }\
    },\
    \"TagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"TagValue\":{\"type\":\"string\"},\
    \"TagValueList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagValue\"}\
    },\
    \"UnknownResourceException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>A specified resource was not found.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceShareArn\",\
        \"tagKeys\"\
      ],\
      \"members\":{\
        \"resourceShareArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource share.</p>\"\
        },\
        \"tagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The tag keys of the tags to remove.</p>\"\
        }\
      }\
    },\
    \"UntagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateResourceShareRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceShareArn\"],\
      \"members\":{\
        \"resourceShareArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource share.</p>\"\
        },\
        \"name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the resource share.</p>\"\
        },\
        \"allowExternalPrincipals\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether principals outside your AWS organization can be associated with a resource share.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\"\
        }\
      }\
    },\
    \"UpdateResourceShareResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourceShare\":{\
          \"shape\":\"ResourceShare\",\
          \"documentation\":\"<p>Information about the resource share.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\"\
        }\
      }\
    }\
  },\
  \"documentation\":\"<p>Use AWS Resource Access Manager to share AWS resources between AWS accounts. To share a resource, you create a resource share, associate the resource with the resource share, and specify the principals that can access the resources associated with the resource share. The following principals are supported: AWS accounts, organizational units (OU) from AWS Organizations, and organizations from AWS Organizations.</p> <p>For more information, see the <a href=\\\"https://docs.aws.amazon.com/ram/latest/userguide/\\\">AWS Resource Access Manager User Guide</a>.</p>\"\
}\
";
}

@end
