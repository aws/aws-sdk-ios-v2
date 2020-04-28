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

#import "AWSmedialiveResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSmedialiveResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSmedialiveResources

+ (instancetype)sharedInstance {
    static AWSmedialiveResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSmedialiveResources new];
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
    \"apiVersion\": \"2017-10-14\",\
    \"endpointPrefix\": \"medialive\",\
    \"signingName\": \"medialive\",\
    \"serviceFullName\": \"AWS Elemental MediaLive\",\
    \"serviceId\": \"MediaLive\",\
    \"protocol\": \"rest-json\",\
    \"uid\": \"medialive-2017-10-14\",\
    \"signatureVersion\": \"v4\",\
    \"serviceAbbreviation\": \"MediaLive\",\
    \"jsonVersion\": \"1.1\"\
  },\
  \"operations\": {\
    \"BatchUpdateSchedule\": {\
      \"name\": \"BatchUpdateSchedule\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/prod/channels/{channelId}/schedule\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"BatchUpdateScheduleRequest\"\
      },\
      \"output\": {\
        \"shape\": \"BatchUpdateScheduleResponse\",\
        \"documentation\": \"Successful update of the schedule.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid.\"\
        },\
        {\
          \"shape\": \"UnprocessableEntityException\",\
          \"documentation\": \"The update schedule request failed validation.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to update the channel schedule.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The specified channel id does not exist.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on update schedule calls.\"\
        }\
      ],\
      \"documentation\": \"Update a channel schedule\"\
    },\
    \"CreateChannel\": {\
      \"name\": \"CreateChannel\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/prod/channels\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreateChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateChannelResponse\",\
        \"documentation\": \"Creation of channel is started.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid.\"\
        },\
        {\
          \"shape\": \"UnprocessableEntityException\",\
          \"documentation\": \"The Channel failed validation and could not be created.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to create the channel.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on create channel calls to channel service.\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The channel is unable to create due to an issue with channel resources.\"\
        }\
      ],\
      \"documentation\": \"Creates a new channel\"\
    },\
    \"CreateInput\": {\
      \"name\": \"CreateInput\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/prod/inputs\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreateInputRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateInputResponse\",\
        \"documentation\": \"Successfully created the input.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal Service Error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"Access was denied\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Limit exceeded\"\
        }\
      ],\
      \"documentation\": \"Create an input\"\
    },\
    \"CreateInputSecurityGroup\": {\
      \"name\": \"CreateInputSecurityGroup\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/prod/inputSecurityGroups\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"CreateInputSecurityGroupRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateInputSecurityGroupResponse\",\
        \"documentation\": \"Successfully created the Input Security Group.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"The request to create an Input Security Group was Invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal Server Error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"The requester does not have permission to create an Input Security Group\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Limit Exceeded Error\"\
        }\
      ],\
      \"documentation\": \"Creates a Input Security Group\"\
    },\
    \"CreateMultiplex\": {\
      \"name\": \"CreateMultiplex\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/prod/multiplexes\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreateMultiplexRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateMultiplexResponse\",\
        \"documentation\": \"Creation of the multiplex is in progress.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"MediaLive can't process your request because of a problem in the request. Please check your request form and syntax.\"\
        },\
        {\
          \"shape\": \"UnprocessableEntityException\",\
          \"documentation\": \"The Multiplex failed validation and could not be created.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You don't have permission to create the multiplex.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error.\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on create multiplex calls to multiplex service.\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The multiplex is unable to create due to an issue with multiplex resources.\"\
        }\
      ],\
      \"documentation\": \"Create a new multiplex.\"\
    },\
    \"CreateMultiplexProgram\": {\
      \"name\": \"CreateMultiplexProgram\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/prod/multiplexes/{multiplexId}/programs\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"CreateMultiplexProgramRequest\"\
      },\
      \"output\": {\
        \"shape\": \"CreateMultiplexProgramResponse\",\
        \"documentation\": \"Creation of the program is in progress.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"MediaLive can't process your request because of a problem in the request. Please check your request form and syntax.\"\
        },\
        {\
          \"shape\": \"UnprocessableEntityException\",\
          \"documentation\": \"The Multiplex program failed validation and could not be created.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to create a program.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error.\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on create multiplex program calls to multiplex service.\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The multiplex program is unable to create due to an issue with multiplex resources.\"\
        }\
      ],\
      \"documentation\": \"Create a new program in the multiplex.\"\
    },\
    \"CreateTags\": {\
      \"name\": \"CreateTags\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/prod/tags/{resource-arn}\",\
        \"responseCode\": 204\
      },\
      \"input\": {\
        \"shape\": \"CreateTagsRequest\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The arn was not found.\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal Service Error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"Access was denied\"\
        }\
      ],\
      \"documentation\": \"Create tags for a resource\"\
    },\
    \"DeleteChannel\": {\
      \"name\": \"DeleteChannel\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/prod/channels/{channelId}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteChannelResponse\",\
        \"documentation\": \"Deletion was successfully initiated.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to delete the channel.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The channel you're requesting to delete does not exist.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on delete channel calls to channel service.\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The channel is unable to delete due to an issue with channel resources.\"\
        }\
      ],\
      \"documentation\": \"Starts deletion of channel. The associated outputs are also deleted.\"\
    },\
    \"DeleteInput\": {\
      \"name\": \"DeleteInput\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/prod/inputs/{inputId}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteInputRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteInputResponse\",\
        \"documentation\": \"Successful deletion\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal Service Error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"Access was denied\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"Input not found\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Limit exceeded\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"Resource conflict\"\
        }\
      ],\
      \"documentation\": \"Deletes the input end point\"\
    },\
    \"DeleteInputSecurityGroup\": {\
      \"name\": \"DeleteInputSecurityGroup\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/prod/inputSecurityGroups/{inputSecurityGroupId}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteInputSecurityGroupRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteInputSecurityGroupResponse\",\
        \"documentation\": \"An Input Security Group\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"The request to delete the Input Security Group was Invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal Server Error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"The requester does not have permission to delete this Input Security Group\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"Input Security Group not found\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Limit Exceeded Error\"\
        }\
      ],\
      \"documentation\": \"Deletes an Input Security Group\"\
    },\
    \"DeleteMultiplex\": {\
      \"name\": \"DeleteMultiplex\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/prod/multiplexes/{multiplexId}\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"DeleteMultiplexRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteMultiplexResponse\",\
        \"documentation\": \"Deletion of the multiplex is in progress.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You don't have permission to delete the multiplex.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error.\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The multiplex that you are trying to delete doesn\\u2019t exist. Check the ID and try again.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error.\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on delete multiplex calls to multiplex service.\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The multiplex is unable to delete due to an issue with multiplex resources.\"\
        }\
      ],\
      \"documentation\": \"Delete a multiplex. The multiplex must be idle.\"\
    },\
    \"DeleteMultiplexProgram\": {\
      \"name\": \"DeleteMultiplexProgram\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/prod/multiplexes/{multiplexId}/programs/{programName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteMultiplexProgramRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteMultiplexProgramResponse\",\
        \"documentation\": \"Deletion of the program is in progress.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You don't have permission to delete the multiplex program.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error.\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The program that you are trying to delete doesn\\u2019t exist. Check the ID and try again.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error.\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on delete multiplex program calls to multiplex service.\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The multiplex program is unable to delete due to an issue with multiplex resources.\"\
        }\
      ],\
      \"documentation\": \"Delete a program from a multiplex.\"\
    },\
    \"DeleteReservation\": {\
      \"name\": \"DeleteReservation\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/prod/reservations/{reservationId}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteReservationRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteReservationResponse\",\
        \"documentation\": \"Deleted reservation\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal service error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to delete reservation\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad gateway error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"Reservation you're attempting to delete does not exist\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway timeout error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on delete reservation request\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The reservation could not be deleted because it is currently active.\"\
        }\
      ],\
      \"documentation\": \"Delete an expired reservation.\"\
    },\
    \"DeleteSchedule\": {\
      \"name\": \"DeleteSchedule\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/prod/channels/{channelId}/schedule\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteScheduleRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteScheduleResponse\",\
        \"documentation\": \"Successful delete of the schedule.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request to delete the schedule on this channel was invalid.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to delete the channel schedule.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The specified channel does not exist to have its schedule deleted.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on delete schedule calls.\"\
        }\
      ],\
      \"documentation\": \"Delete all schedule actions on a channel.\"\
    },\
    \"DeleteTags\": {\
      \"name\": \"DeleteTags\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/prod/tags/{resource-arn}\",\
        \"responseCode\": 204\
      },\
      \"input\": {\
        \"shape\": \"DeleteTagsRequest\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The arn was not found.\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal Service Error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"Access was denied\"\
        }\
      ],\
      \"documentation\": \"Removes tags for a resource\"\
    },\
    \"DescribeChannel\": {\
      \"name\": \"DescribeChannel\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/prod/channels/{channelId}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeChannelResponse\",\
        \"documentation\": \"Channel details\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to describe the channel.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The channel you're requesting to describe does not exist.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on describe channel calls to channel service.\"\
        }\
      ],\
      \"documentation\": \"Gets details about a channel\"\
    },\
    \"DescribeInput\": {\
      \"name\": \"DescribeInput\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/prod/inputs/{inputId}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeInputRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeInputResponse\",\
        \"documentation\": \"Input details\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal Service Error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"Access was denied\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"Input not found\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Limit exceeded\"\
        }\
      ],\
      \"documentation\": \"Produces details about an input\"\
    },\
    \"DescribeInputSecurityGroup\": {\
      \"name\": \"DescribeInputSecurityGroup\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/prod/inputSecurityGroups/{inputSecurityGroupId}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeInputSecurityGroupRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeInputSecurityGroupResponse\",\
        \"documentation\": \"An Input Security Group\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"The request to describe an Input Security Group was Invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal Server Error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"The requester does not have permission to describe this Input Security Group\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"Input Security Group not found\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Limit Exceeded Error\"\
        }\
      ],\
      \"documentation\": \"Produces a summary of an Input Security Group\"\
    },\
    \"DescribeMultiplex\": {\
      \"name\": \"DescribeMultiplex\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/prod/multiplexes/{multiplexId}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeMultiplexRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeMultiplexResponse\",\
        \"documentation\": \"Details for one multiplex.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You don't have permission to describe the multiplex.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error.\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The multiplex that you are trying to describe doesn\\u2019t exist. Check the ID and try again.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error.\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on describe multiplex calls to multiplex service.\"\
        }\
      ],\
      \"documentation\": \"Gets details about a multiplex.\"\
    },\
    \"DescribeMultiplexProgram\": {\
      \"name\": \"DescribeMultiplexProgram\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/prod/multiplexes/{multiplexId}/programs/{programName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeMultiplexProgramRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeMultiplexProgramResponse\",\
        \"documentation\": \"The details of one program.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You don't have permission to describe the multiplex program.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error.\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"MediaLive can't describe the program. The multiplex or the program that you specified doesn\\u2019t exist. Check the IDs and try again.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error.\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on describe multiplex program calls to multiplex service.\"\
        }\
      ],\
      \"documentation\": \"Get the details for a program in a multiplex.\"\
    },\
    \"DescribeOffering\": {\
      \"name\": \"DescribeOffering\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/prod/offerings/{offeringId}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeOfferingRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeOfferingResponse\",\
        \"documentation\": \"Offering details\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal service error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to describe offering\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad gateway error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"Offering you're attempting to describe does not exist\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway timeout error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on describe offering request\"\
        }\
      ],\
      \"documentation\": \"Get details for an offering.\"\
    },\
    \"DescribeReservation\": {\
      \"name\": \"DescribeReservation\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/prod/reservations/{reservationId}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeReservationRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeReservationResponse\",\
        \"documentation\": \"Reservation details\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal service error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to describe reservation\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad gateway error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"Reservation you're attempting to describe does not exist\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway timeout error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on describe reservation request\"\
        }\
      ],\
      \"documentation\": \"Get details for a reservation.\"\
    },\
    \"DescribeSchedule\": {\
      \"name\": \"DescribeSchedule\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/prod/channels/{channelId}/schedule\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeScheduleRequest\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeScheduleResponse\",\
        \"documentation\": \"An array of channel schedule actions.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to describe the channel schedule.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The channel you're requesting a schedule describe for does not exist.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on describe schedule calls.\"\
        }\
      ],\
      \"documentation\": \"Get a channel schedule\"\
    },\
    \"ListChannels\": {\
      \"name\": \"ListChannels\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/prod/channels\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListChannelsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListChannelsResponse\",\
        \"documentation\": \"An array of channels\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to list channels.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on list channel calls to channel service.\"\
        }\
      ],\
      \"documentation\": \"Produces list of channels that have been created\"\
    },\
    \"ListInputSecurityGroups\": {\
      \"name\": \"ListInputSecurityGroups\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/prod/inputSecurityGroups\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListInputSecurityGroupsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListInputSecurityGroupsResponse\",\
        \"documentation\": \"An array of Input Security Groups\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"The request to list Input Security Groups was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal Server Error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"The requester does not have permission to call ListInputSecurityGroups\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Limit Exceeded Error\"\
        }\
      ],\
      \"documentation\": \"Produces a list of Input Security Groups for an account\"\
    },\
    \"ListInputs\": {\
      \"name\": \"ListInputs\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/prod/inputs\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListInputsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListInputsResponse\",\
        \"documentation\": \"An array of inputs\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal Service Error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"Access was denied\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Limit exceeded\"\
        }\
      ],\
      \"documentation\": \"Produces list of inputs that have been created\"\
    },\
    \"ListMultiplexPrograms\": {\
      \"name\": \"ListMultiplexPrograms\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/prod/multiplexes/{multiplexId}/programs\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListMultiplexProgramsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListMultiplexProgramsResponse\",\
        \"documentation\": \"An array of the programs for one multiplex.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"MediaLive can't process your request because of a problem in the request. Please check your request form and syntax.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to list multiplex programs.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error.\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"MediaLive can't provide the list of programs. The multiplex that you specified doesn\\u2019t exist. Check the ID and try again.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error.\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on list multiplex calls to multiplex service.\"\
        }\
      ],\
      \"documentation\": \"List the programs that currently exist for a specific multiplex.\"\
    },\
    \"ListMultiplexes\": {\
      \"name\": \"ListMultiplexes\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/prod/multiplexes\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListMultiplexesRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListMultiplexesResponse\",\
        \"documentation\": \"An array of multiplexes.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"MediaLive can't process your request because of a problem in the request. Please check your request form and syntax.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You don't have permission to list multiplexes.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error.\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on list multiplex calls to multiplex service.\"\
        }\
      ],\
      \"documentation\": \"Retrieve a list of the existing multiplexes.\"\
    },\
    \"ListOfferings\": {\
      \"name\": \"ListOfferings\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/prod/offerings\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListOfferingsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListOfferingsResponse\",\
        \"documentation\": \"List of offerings\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal service error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to list offerings\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad gateway error\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway timeout error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on list offerings request\"\
        }\
      ],\
      \"documentation\": \"List offerings available for purchase.\"\
    },\
    \"ListReservations\": {\
      \"name\": \"ListReservations\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/prod/reservations\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListReservationsRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListReservationsResponse\",\
        \"documentation\": \"List of reservations\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal service error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to list reservations\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad gateway error\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway timeout error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on list reservations request\"\
        }\
      ],\
      \"documentation\": \"List purchased reservations.\"\
    },\
    \"ListTagsForResource\": {\
      \"name\": \"ListTagsForResource\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/prod/tags/{resource-arn}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListTagsForResourceRequest\"\
      },\
      \"output\": {\
        \"shape\": \"ListTagsForResourceResponse\",\
        \"documentation\": \"An array of tags\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The arn was not found\"\
        },\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal Service Error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"Access was denied\"\
        }\
      ],\
      \"documentation\": \"Produces list of tags that have been created for a resource\"\
    },\
    \"PurchaseOffering\": {\
      \"name\": \"PurchaseOffering\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/prod/offerings/{offeringId}/purchase\",\
        \"responseCode\": 201\
      },\
      \"input\": {\
        \"shape\": \"PurchaseOfferingRequest\"\
      },\
      \"output\": {\
        \"shape\": \"PurchaseOfferingResponse\",\
        \"documentation\": \"Purchased reservation\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal service error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to purchase the offering\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad gateway error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"Offering you're attempting to purchase does not exist\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway timeout error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on purchase offering request\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"Offering purchase prevented by service resource issue\"\
        }\
      ],\
      \"documentation\": \"Purchase an offering and create a reservation.\"\
    },\
    \"StartChannel\": {\
      \"name\": \"StartChannel\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/prod/channels/{channelId}/start\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"StartChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"StartChannelResponse\",\
        \"documentation\": \"Successfully initiated start of the channel.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to start the channel.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The channel you're requesting to start does not exist.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on start channel calls to channel service.\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The channel is unable to start due to an issue with channel resources.\"\
        }\
      ],\
      \"documentation\": \"Starts an existing channel\"\
    },\
    \"StartMultiplex\": {\
      \"name\": \"StartMultiplex\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/prod/multiplexes/{multiplexId}/start\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"StartMultiplexRequest\"\
      },\
      \"output\": {\
        \"shape\": \"StartMultiplexResponse\",\
        \"documentation\": \"The action to start the multiplex is in progress.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"MediaLive can't process your request because of a problem in the request. Please check your request form and syntax.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You don't have permission to start the multiplex.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error.\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The multiplex that you are trying to start doesn\\u2019t exist. Check the ID and try again.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error.\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on start multiplex calls to multiplex service.\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The multiplex is unable to start due to an issue with multiplex resources.\"\
        }\
      ],\
      \"documentation\": \"Start (run) the multiplex. Starting the multiplex does not start the channels. You must explicitly start each channel.\"\
    },\
    \"StopChannel\": {\
      \"name\": \"StopChannel\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/prod/channels/{channelId}/stop\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"StopChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"StopChannelResponse\",\
        \"documentation\": \"Successfully initiated stop of the channel.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to stop the channel.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The channel you're requesting to stop does not exist.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on stop channel calls to channel service.\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The channel is unable to stop due to an issue with channel resources.\"\
        }\
      ],\
      \"documentation\": \"Stops a running channel\"\
    },\
    \"StopMultiplex\": {\
      \"name\": \"StopMultiplex\",\
      \"http\": {\
        \"method\": \"POST\",\
        \"requestUri\": \"/prod/multiplexes/{multiplexId}/stop\",\
        \"responseCode\": 202\
      },\
      \"input\": {\
        \"shape\": \"StopMultiplexRequest\"\
      },\
      \"output\": {\
        \"shape\": \"StopMultiplexResponse\",\
        \"documentation\": \"The action to stop the multiplex is in progress.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"MediaLive can't process your request because of a problem in the request. Please check your request form and syntax.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You don't have permission to stop the multiplex.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error.\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The multiplex that you are trying to stop doesn\\u2019t exist. Check the ID and try again.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error.\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on stop multiplex calls to multiplex service.\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The multiplex is unable to stop due to an issue with multiplex resources.\"\
        }\
      ],\
      \"documentation\": \"Stops a running multiplex. If the multiplex isn't running, this action has no effect.\"\
    },\
    \"UpdateChannel\": {\
      \"name\": \"UpdateChannel\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/prod/channels/{channelId}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateChannelRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateChannelResponse\",\
        \"documentation\": \"Channel is successfully updated.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid.\"\
        },\
        {\
          \"shape\": \"UnprocessableEntityException\",\
          \"documentation\": \"The channel configuration failed validation and could not be updated.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to update the channel.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The channel is unable to update due to an issue with channel resources.\"\
        }\
      ],\
      \"documentation\": \"Updates a channel.\"\
    },\
    \"UpdateChannelClass\": {\
      \"name\": \"UpdateChannelClass\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/prod/channels/{channelId}/channelClass\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateChannelClassRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateChannelClassResponse\",\
        \"documentation\": \"The class of the channel has been successfully updated.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request to update the channel class was invalid.\"\
        },\
        {\
          \"shape\": \"UnprocessableEntityException\",\
          \"documentation\": \"The channel configuration failed validation when attempting to update the channel class.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to update the class of this channel.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The channel you're trying to update the class on does not exist.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded on update channel class calls.\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The channel class cannot be updated due to an issue with channel resources.\"\
        }\
      ],\
      \"documentation\": \"Changes the class of the channel.\"\
    },\
    \"UpdateInput\": {\
      \"name\": \"UpdateInput\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/prod/inputs/{inputId}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateInputRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateInputResponse\",\
        \"documentation\": \"The input update is successfully initiated.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request to update the input was invalid.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal Service Error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"The requester does not have permission to update an input.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The input was not found.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The input was unable to be updated at this time due to an issue with input resources.\"\
        }\
      ],\
      \"documentation\": \"Updates an input.\"\
    },\
    \"UpdateInputSecurityGroup\": {\
      \"name\": \"UpdateInputSecurityGroup\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/prod/inputSecurityGroups/{inputSecurityGroupId}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateInputSecurityGroupRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateInputSecurityGroupResponse\",\
        \"documentation\": \"Successfully initiated the update of the Input Security Group.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"The request to update the Input Security Group was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal Server Error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"The requester does not have permission to update an Input Security Group\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The Input Security Group was not found.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The Input Security Group was unable to be updated due to an issue with input security group resources.\"\
        }\
      ],\
      \"documentation\": \"Update an Input Security Group's Whilelists.\"\
    },\
    \"UpdateMultiplex\": {\
      \"name\": \"UpdateMultiplex\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/prod/multiplexes/{multiplexId}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateMultiplexRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateMultiplexResponse\",\
        \"documentation\": \"The update to the multiplex has succeeded.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"MediaLive can't process your request because of a problem in the request. Please check your request form and syntax.\"\
        },\
        {\
          \"shape\": \"UnprocessableEntityException\",\
          \"documentation\": \"The multiplex configuration failed validation and could not be updated.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You don't have permission to update the multiplex.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error.\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"The multiplex that you are trying to update doesn\\u2019t exist. Check the ID and try again.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error.\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The multiplex is unable to update due to an issue with multiplex resources.\"\
        }\
      ],\
      \"documentation\": \"Updates a multiplex.\"\
    },\
    \"UpdateMultiplexProgram\": {\
      \"name\": \"UpdateMultiplexProgram\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/prod/multiplexes/{multiplexId}/programs/{programName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateMultiplexProgramRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateMultiplexProgramResponse\",\
        \"documentation\": \"The update to the program has succeeded.\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"MediaLive can't process your request because of a problem in the request. Please check your request form and syntax.\"\
        },\
        {\
          \"shape\": \"UnprocessableEntityException\",\
          \"documentation\": \"The multiplex program failed validation and could not be updated.\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Unexpected internal service error.\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You don't have permission to update the multiplex program.\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad Gateway Error.\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"MediaLive can't update the program. The multiplex or the program that you specified doesn\\u2019t exist. Check the IDs and try again.\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway Timeout Error.\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The multiplex program is unable to update due to an issue with multiplex resources.\"\
        }\
      ],\
      \"documentation\": \"Update a program in a multiplex.\"\
    },\
    \"UpdateReservation\": {\
      \"name\": \"UpdateReservation\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/prod/reservations/{reservationId}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateReservationRequest\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateReservationResponse\",\
        \"documentation\": \"Updated reservation\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\",\
          \"documentation\": \"This request was invalid\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\",\
          \"documentation\": \"Internal service error\"\
        },\
        {\
          \"shape\": \"ForbiddenException\",\
          \"documentation\": \"You do not have permission to update reservation\"\
        },\
        {\
          \"shape\": \"BadGatewayException\",\
          \"documentation\": \"Bad gateway error\"\
        },\
        {\
          \"shape\": \"NotFoundException\",\
          \"documentation\": \"Reservation not found\"\
        },\
        {\
          \"shape\": \"GatewayTimeoutException\",\
          \"documentation\": \"Gateway timeout error\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\",\
          \"documentation\": \"Request limit exceeded\"\
        },\
        {\
          \"shape\": \"ConflictException\",\
          \"documentation\": \"The reservation could not be updated\"\
        }\
      ],\
      \"documentation\": \"Update reservation.\"\
    }\
  },\
  \"shapes\": {\
    \"AacCodingMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Aac Coding Mode\",\
      \"enum\": [\
        \"AD_RECEIVER_MIX\",\
        \"CODING_MODE_1_0\",\
        \"CODING_MODE_1_1\",\
        \"CODING_MODE_2_0\",\
        \"CODING_MODE_5_1\"\
      ]\
    },\
    \"AacInputType\": {\
      \"type\": \"string\",\
      \"documentation\": \"Aac Input Type\",\
      \"enum\": [\
        \"BROADCASTER_MIXED_AD\",\
        \"NORMAL\"\
      ]\
    },\
    \"AacProfile\": {\
      \"type\": \"string\",\
      \"documentation\": \"Aac Profile\",\
      \"enum\": [\
        \"HEV1\",\
        \"HEV2\",\
        \"LC\"\
      ]\
    },\
    \"AacRateControlMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Aac Rate Control Mode\",\
      \"enum\": [\
        \"CBR\",\
        \"VBR\"\
      ]\
    },\
    \"AacRawFormat\": {\
      \"type\": \"string\",\
      \"documentation\": \"Aac Raw Format\",\
      \"enum\": [\
        \"LATM_LOAS\",\
        \"NONE\"\
      ]\
    },\
    \"AacSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Bitrate\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"bitrate\",\
          \"documentation\": \"Average bitrate in bits/second. Valid values depend on rate control mode and profile.\"\
        },\
        \"CodingMode\": {\
          \"shape\": \"AacCodingMode\",\
          \"locationName\": \"codingMode\",\
          \"documentation\": \"Mono, Stereo, or 5.1 channel layout. Valid values depend on rate control mode and profile. The adReceiverMix setting receives a stereo description plus control track and emits a mono AAC encode of the description track, with control data emitted in the PES header as per ETSI TS 101 154 Annex E.\"\
        },\
        \"InputType\": {\
          \"shape\": \"AacInputType\",\
          \"locationName\": \"inputType\",\
          \"documentation\": \"Set to \\\"broadcasterMixedAd\\\" when input contains pre-mixed main audio + AD (narration) as a stereo pair.  The Audio Type field (audioType) will be set to 3, which signals to downstream systems that this stream contains \\\"broadcaster mixed AD\\\". Note that the input received by the encoder must contain pre-mixed audio; the encoder does not perform the mixing. The values in audioTypeControl and audioType (in AudioDescription) are ignored when set to broadcasterMixedAd.\\n\\nLeave set to \\\"normal\\\" when input does not contain pre-mixed audio + AD.\"\
        },\
        \"Profile\": {\
          \"shape\": \"AacProfile\",\
          \"locationName\": \"profile\",\
          \"documentation\": \"AAC Profile.\"\
        },\
        \"RateControlMode\": {\
          \"shape\": \"AacRateControlMode\",\
          \"locationName\": \"rateControlMode\",\
          \"documentation\": \"Rate Control Mode.\"\
        },\
        \"RawFormat\": {\
          \"shape\": \"AacRawFormat\",\
          \"locationName\": \"rawFormat\",\
          \"documentation\": \"Sets LATM / LOAS AAC output for raw containers.\"\
        },\
        \"SampleRate\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"sampleRate\",\
          \"documentation\": \"Sample rate in Hz. Valid values depend on rate control mode and profile.\"\
        },\
        \"Spec\": {\
          \"shape\": \"AacSpec\",\
          \"locationName\": \"spec\",\
          \"documentation\": \"Use MPEG-2 AAC audio instead of MPEG-4 AAC audio for raw or MPEG-2 Transport Stream containers.\"\
        },\
        \"VbrQuality\": {\
          \"shape\": \"AacVbrQuality\",\
          \"locationName\": \"vbrQuality\",\
          \"documentation\": \"VBR Quality Level - Only used if rateControlMode is VBR.\"\
        }\
      },\
      \"documentation\": \"Aac Settings\"\
    },\
    \"AacSpec\": {\
      \"type\": \"string\",\
      \"documentation\": \"Aac Spec\",\
      \"enum\": [\
        \"MPEG2\",\
        \"MPEG4\"\
      ]\
    },\
    \"AacVbrQuality\": {\
      \"type\": \"string\",\
      \"documentation\": \"Aac Vbr Quality\",\
      \"enum\": [\
        \"HIGH\",\
        \"LOW\",\
        \"MEDIUM_HIGH\",\
        \"MEDIUM_LOW\"\
      ]\
    },\
    \"Ac3BitstreamMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Ac3 Bitstream Mode\",\
      \"enum\": [\
        \"COMMENTARY\",\
        \"COMPLETE_MAIN\",\
        \"DIALOGUE\",\
        \"EMERGENCY\",\
        \"HEARING_IMPAIRED\",\
        \"MUSIC_AND_EFFECTS\",\
        \"VISUALLY_IMPAIRED\",\
        \"VOICE_OVER\"\
      ]\
    },\
    \"Ac3CodingMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Ac3 Coding Mode\",\
      \"enum\": [\
        \"CODING_MODE_1_0\",\
        \"CODING_MODE_1_1\",\
        \"CODING_MODE_2_0\",\
        \"CODING_MODE_3_2_LFE\"\
      ]\
    },\
    \"Ac3DrcProfile\": {\
      \"type\": \"string\",\
      \"documentation\": \"Ac3 Drc Profile\",\
      \"enum\": [\
        \"FILM_STANDARD\",\
        \"NONE\"\
      ]\
    },\
    \"Ac3LfeFilter\": {\
      \"type\": \"string\",\
      \"documentation\": \"Ac3 Lfe Filter\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"Ac3MetadataControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"Ac3 Metadata Control\",\
      \"enum\": [\
        \"FOLLOW_INPUT\",\
        \"USE_CONFIGURED\"\
      ]\
    },\
    \"Ac3Settings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Bitrate\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"bitrate\",\
          \"documentation\": \"Average bitrate in bits/second. Valid bitrates depend on the coding mode.\"\
        },\
        \"BitstreamMode\": {\
          \"shape\": \"Ac3BitstreamMode\",\
          \"locationName\": \"bitstreamMode\",\
          \"documentation\": \"Specifies the bitstream mode (bsmod) for the emitted AC-3 stream. See ATSC A/52-2012 for background on these values.\"\
        },\
        \"CodingMode\": {\
          \"shape\": \"Ac3CodingMode\",\
          \"locationName\": \"codingMode\",\
          \"documentation\": \"Dolby Digital coding mode. Determines number of channels.\"\
        },\
        \"Dialnorm\": {\
          \"shape\": \"__integerMin1Max31\",\
          \"locationName\": \"dialnorm\",\
          \"documentation\": \"Sets the dialnorm for the output. If excluded and input audio is Dolby Digital, dialnorm will be passed through.\"\
        },\
        \"DrcProfile\": {\
          \"shape\": \"Ac3DrcProfile\",\
          \"locationName\": \"drcProfile\",\
          \"documentation\": \"If set to filmStandard, adds dynamic range compression signaling to the output bitstream as defined in the Dolby Digital specification.\"\
        },\
        \"LfeFilter\": {\
          \"shape\": \"Ac3LfeFilter\",\
          \"locationName\": \"lfeFilter\",\
          \"documentation\": \"When set to enabled, applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only valid in codingMode32Lfe mode.\"\
        },\
        \"MetadataControl\": {\
          \"shape\": \"Ac3MetadataControl\",\
          \"locationName\": \"metadataControl\",\
          \"documentation\": \"When set to \\\"followInput\\\", encoder metadata will be sourced from the DD, DD+, or DolbyE decoder that supplied this audio data. If audio was not supplied from one of these streams, then the static metadata settings will be used.\"\
        }\
      },\
      \"documentation\": \"Ac3 Settings\"\
    },\
    \"AccessDenied\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for AccessDenied\"\
    },\
    \"AfdSignaling\": {\
      \"type\": \"string\",\
      \"documentation\": \"Afd Signaling\",\
      \"enum\": [\
        \"AUTO\",\
        \"FIXED\",\
        \"NONE\"\
      ]\
    },\
    \"ArchiveContainerSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"M2tsSettings\": {\
          \"shape\": \"M2tsSettings\",\
          \"locationName\": \"m2tsSettings\"\
        }\
      },\
      \"documentation\": \"Archive Container Settings\"\
    },\
    \"ArchiveGroupSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Destination\": {\
          \"shape\": \"OutputLocationRef\",\
          \"locationName\": \"destination\",\
          \"documentation\": \"A directory and base filename where archive files should be written.\"\
        },\
        \"RolloverInterval\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"rolloverInterval\",\
          \"documentation\": \"Number of seconds to write to archive file before closing and starting a new one.\"\
        }\
      },\
      \"documentation\": \"Archive Group Settings\",\
      \"required\": [\
        \"Destination\"\
      ]\
    },\
    \"ArchiveOutputSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ContainerSettings\": {\
          \"shape\": \"ArchiveContainerSettings\",\
          \"locationName\": \"containerSettings\",\
          \"documentation\": \"Settings specific to the container type of the file.\"\
        },\
        \"Extension\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"extension\",\
          \"documentation\": \"Output file extension. If excluded, this will be auto-selected from the container type.\"\
        },\
        \"NameModifier\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nameModifier\",\
          \"documentation\": \"String concatenated to the end of the destination filename.  Required for multiple outputs of the same type.\"\
        }\
      },\
      \"documentation\": \"Archive Output Settings\",\
      \"required\": [\
        \"ContainerSettings\"\
      ]\
    },\
    \"AribDestinationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Arib Destination Settings\"\
    },\
    \"AribSourceSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Arib Source Settings\"\
    },\
    \"AudioChannelMapping\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InputChannelLevels\": {\
          \"shape\": \"__listOfInputChannelLevel\",\
          \"locationName\": \"inputChannelLevels\",\
          \"documentation\": \"Indices and gain values for each input channel that should be remixed into this output channel.\"\
        },\
        \"OutputChannel\": {\
          \"shape\": \"__integerMin0Max7\",\
          \"locationName\": \"outputChannel\",\
          \"documentation\": \"The index of the output channel being produced.\"\
        }\
      },\
      \"documentation\": \"Audio Channel Mapping\",\
      \"required\": [\
        \"OutputChannel\",\
        \"InputChannelLevels\"\
      ]\
    },\
    \"AudioCodecSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AacSettings\": {\
          \"shape\": \"AacSettings\",\
          \"locationName\": \"aacSettings\"\
        },\
        \"Ac3Settings\": {\
          \"shape\": \"Ac3Settings\",\
          \"locationName\": \"ac3Settings\"\
        },\
        \"Eac3Settings\": {\
          \"shape\": \"Eac3Settings\",\
          \"locationName\": \"eac3Settings\"\
        },\
        \"Mp2Settings\": {\
          \"shape\": \"Mp2Settings\",\
          \"locationName\": \"mp2Settings\"\
        },\
        \"PassThroughSettings\": {\
          \"shape\": \"PassThroughSettings\",\
          \"locationName\": \"passThroughSettings\"\
        }\
      },\
      \"documentation\": \"Audio Codec Settings\"\
    },\
    \"AudioDescription\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AudioNormalizationSettings\": {\
          \"shape\": \"AudioNormalizationSettings\",\
          \"locationName\": \"audioNormalizationSettings\",\
          \"documentation\": \"Advanced audio normalization settings.\"\
        },\
        \"AudioSelectorName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"audioSelectorName\",\
          \"documentation\": \"The name of the AudioSelector used as the source for this AudioDescription.\"\
        },\
        \"AudioType\": {\
          \"shape\": \"AudioType\",\
          \"locationName\": \"audioType\",\
          \"documentation\": \"Applies only if audioTypeControl is useConfigured. The values for audioType are defined in ISO-IEC 13818-1.\"\
        },\
        \"AudioTypeControl\": {\
          \"shape\": \"AudioDescriptionAudioTypeControl\",\
          \"locationName\": \"audioTypeControl\",\
          \"documentation\": \"Determines how audio type is determined.\\n  followInput: If the input contains an ISO 639 audioType, then that value is passed through to the output. If the input contains no ISO 639 audioType, the value in Audio Type is included in the output.\\n  useConfigured: The value in Audio Type is included in the output.\\nNote that this field and audioType are both ignored if inputType is broadcasterMixedAd.\"\
        },\
        \"CodecSettings\": {\
          \"shape\": \"AudioCodecSettings\",\
          \"locationName\": \"codecSettings\",\
          \"documentation\": \"Audio codec settings.\"\
        },\
        \"LanguageCode\": {\
          \"shape\": \"__stringMin3Max3\",\
          \"locationName\": \"languageCode\",\
          \"documentation\": \"Indicates the language of the audio output track. Only used if languageControlMode is useConfigured, or there is no ISO 639 language code specified in the input.\"\
        },\
        \"LanguageCodeControl\": {\
          \"shape\": \"AudioDescriptionLanguageCodeControl\",\
          \"locationName\": \"languageCodeControl\",\
          \"documentation\": \"Choosing followInput will cause the ISO 639 language code of the output to follow the ISO 639 language code of the input. The languageCode will be used when useConfigured is set, or when followInput is selected but there is no ISO 639 language code specified by the input.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The name of this AudioDescription. Outputs will use this name to uniquely identify this AudioDescription.  Description names should be unique within this Live Event.\"\
        },\
        \"RemixSettings\": {\
          \"shape\": \"RemixSettings\",\
          \"locationName\": \"remixSettings\",\
          \"documentation\": \"Settings that control how input audio channels are remixed into the output audio channels.\"\
        },\
        \"StreamName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"streamName\",\
          \"documentation\": \"Used for MS Smooth and Apple HLS outputs. Indicates the name displayed by the player (eg. English, or Director Commentary).\"\
        }\
      },\
      \"documentation\": \"Audio Description\",\
      \"required\": [\
        \"AudioSelectorName\",\
        \"Name\"\
      ]\
    },\
    \"AudioDescriptionAudioTypeControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"Audio Description Audio Type Control\",\
      \"enum\": [\
        \"FOLLOW_INPUT\",\
        \"USE_CONFIGURED\"\
      ]\
    },\
    \"AudioDescriptionLanguageCodeControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"Audio Description Language Code Control\",\
      \"enum\": [\
        \"FOLLOW_INPUT\",\
        \"USE_CONFIGURED\"\
      ]\
    },\
    \"AudioLanguageSelection\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"LanguageCode\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"languageCode\",\
          \"documentation\": \"Selects a specific three-letter language code from within an audio source.\"\
        },\
        \"LanguageSelectionPolicy\": {\
          \"shape\": \"AudioLanguageSelectionPolicy\",\
          \"locationName\": \"languageSelectionPolicy\",\
          \"documentation\": \"When set to \\\"strict\\\", the transport stream demux strictly identifies audio streams by their language descriptor. If a PMT update occurs such that an audio stream matching the initially selected language is no longer present then mute will be encoded until the language returns. If \\\"loose\\\", then on a PMT update the demux will choose another audio stream in the program with the same stream type if it can't find one with the same language.\"\
        }\
      },\
      \"documentation\": \"Audio Language Selection\",\
      \"required\": [\
        \"LanguageCode\"\
      ]\
    },\
    \"AudioLanguageSelectionPolicy\": {\
      \"type\": \"string\",\
      \"documentation\": \"Audio Language Selection Policy\",\
      \"enum\": [\
        \"LOOSE\",\
        \"STRICT\"\
      ]\
    },\
    \"AudioNormalizationAlgorithm\": {\
      \"type\": \"string\",\
      \"documentation\": \"Audio Normalization Algorithm\",\
      \"enum\": [\
        \"ITU_1770_1\",\
        \"ITU_1770_2\"\
      ]\
    },\
    \"AudioNormalizationAlgorithmControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"Audio Normalization Algorithm Control\",\
      \"enum\": [\
        \"CORRECT_AUDIO\"\
      ]\
    },\
    \"AudioNormalizationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Algorithm\": {\
          \"shape\": \"AudioNormalizationAlgorithm\",\
          \"locationName\": \"algorithm\",\
          \"documentation\": \"Audio normalization algorithm to use. itu17701 conforms to the CALM Act specification, itu17702 conforms to the EBU R-128 specification.\"\
        },\
        \"AlgorithmControl\": {\
          \"shape\": \"AudioNormalizationAlgorithmControl\",\
          \"locationName\": \"algorithmControl\",\
          \"documentation\": \"When set to correctAudio the output audio is corrected using the chosen algorithm. If set to measureOnly, the audio will be measured but not adjusted.\"\
        },\
        \"TargetLkfs\": {\
          \"shape\": \"__doubleMinNegative59Max0\",\
          \"locationName\": \"targetLkfs\",\
          \"documentation\": \"Target LKFS(loudness) to adjust volume to. If no value is entered, a default value will be used according to the chosen algorithm.  The CALM Act (1770-1) recommends a target of -24 LKFS. The EBU R-128 specification (1770-2) recommends a target of -23 LKFS.\"\
        }\
      },\
      \"documentation\": \"Audio Normalization Settings\"\
    },\
    \"AudioOnlyHlsSegmentType\": {\
      \"type\": \"string\",\
      \"documentation\": \"Audio Only Hls Segment Type\",\
      \"enum\": [\
        \"AAC\",\
        \"FMP4\"\
      ]\
    },\
    \"AudioOnlyHlsSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AudioGroupId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"audioGroupId\",\
          \"documentation\": \"Specifies the group to which the audio Rendition belongs.\"\
        },\
        \"AudioOnlyImage\": {\
          \"shape\": \"InputLocation\",\
          \"locationName\": \"audioOnlyImage\",\
          \"documentation\": \"Optional. Specifies the .jpg or .png image to use as the cover art for an audio-only output. We recommend a low bit-size file because the image increases the output audio bandwidth.\\n\\nThe image is attached to the audio as an ID3 tag, frame type APIC, picture type 0x10, as per the \\\"ID3 tag version 2.4.0 - Native Frames\\\" standard.\"\
        },\
        \"AudioTrackType\": {\
          \"shape\": \"AudioOnlyHlsTrackType\",\
          \"locationName\": \"audioTrackType\",\
          \"documentation\": \"Four types of audio-only tracks are supported:\\n\\nAudio-Only Variant Stream\\nThe client can play back this audio-only stream instead of video in low-bandwidth scenarios. Represented as an EXT-X-STREAM-INF in the HLS manifest.\\n\\nAlternate Audio, Auto Select, Default\\nAlternate rendition that the client should try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=YES, AUTOSELECT=YES\\n\\nAlternate Audio, Auto Select, Not Default\\nAlternate rendition that the client may try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=NO, AUTOSELECT=YES\\n\\nAlternate Audio, not Auto Select\\nAlternate rendition that the client will not try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=NO, AUTOSELECT=NO\"\
        },\
        \"SegmentType\": {\
          \"shape\": \"AudioOnlyHlsSegmentType\",\
          \"locationName\": \"segmentType\",\
          \"documentation\": \"Specifies the segment type.\"\
        }\
      },\
      \"documentation\": \"Audio Only Hls Settings\"\
    },\
    \"AudioOnlyHlsTrackType\": {\
      \"type\": \"string\",\
      \"documentation\": \"Audio Only Hls Track Type\",\
      \"enum\": [\
        \"ALTERNATE_AUDIO_AUTO_SELECT\",\
        \"ALTERNATE_AUDIO_AUTO_SELECT_DEFAULT\",\
        \"ALTERNATE_AUDIO_NOT_AUTO_SELECT\",\
        \"AUDIO_ONLY_VARIANT_STREAM\"\
      ]\
    },\
    \"AudioPidSelection\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Pid\": {\
          \"shape\": \"__integerMin0Max8191\",\
          \"locationName\": \"pid\",\
          \"documentation\": \"Selects a specific PID from within a source.\"\
        }\
      },\
      \"documentation\": \"Audio Pid Selection\",\
      \"required\": [\
        \"Pid\"\
      ]\
    },\
    \"AudioSelector\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Name\": {\
          \"shape\": \"__stringMin1\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The name of this AudioSelector. AudioDescriptions will use this name to uniquely identify this Selector.  Selector names should be unique per input.\"\
        },\
        \"SelectorSettings\": {\
          \"shape\": \"AudioSelectorSettings\",\
          \"locationName\": \"selectorSettings\",\
          \"documentation\": \"The audio selector settings.\"\
        }\
      },\
      \"documentation\": \"Audio Selector\",\
      \"required\": [\
        \"Name\"\
      ]\
    },\
    \"AudioSelectorSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AudioLanguageSelection\": {\
          \"shape\": \"AudioLanguageSelection\",\
          \"locationName\": \"audioLanguageSelection\"\
        },\
        \"AudioPidSelection\": {\
          \"shape\": \"AudioPidSelection\",\
          \"locationName\": \"audioPidSelection\"\
        },\
        \"AudioTrackSelection\": {\
          \"shape\": \"AudioTrackSelection\",\
          \"locationName\": \"audioTrackSelection\"\
        }\
      },\
      \"documentation\": \"Audio Selector Settings\"\
    },\
    \"AudioTrack\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Track\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"track\",\
          \"documentation\": \"1-based integer value that maps to a specific audio track\"\
        }\
      },\
      \"documentation\": \"Audio Track\",\
      \"required\": [\
        \"Track\"\
      ]\
    },\
    \"AudioTrackSelection\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Tracks\": {\
          \"shape\": \"__listOfAudioTrack\",\
          \"locationName\": \"tracks\",\
          \"documentation\": \"Selects one or more unique audio tracks from within an mp4 source.\"\
        }\
      },\
      \"documentation\": \"Audio Track Selection\",\
      \"required\": [\
        \"Tracks\"\
      ]\
    },\
    \"AudioType\": {\
      \"type\": \"string\",\
      \"documentation\": \"Audio Type\",\
      \"enum\": [\
        \"CLEAN_EFFECTS\",\
        \"HEARING_IMPAIRED\",\
        \"UNDEFINED\",\
        \"VISUAL_IMPAIRED_COMMENTARY\"\
      ]\
    },\
    \"AuthenticationScheme\": {\
      \"type\": \"string\",\
      \"documentation\": \"Authentication Scheme\",\
      \"enum\": [\
        \"AKAMAI\",\
        \"COMMON\"\
      ]\
    },\
    \"AutomaticInputFailoverSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InputPreference\": {\
          \"shape\": \"InputPreference\",\
          \"locationName\": \"inputPreference\",\
          \"documentation\": \"Input preference when deciding which input to make active when a previously failed input has recovered.\"\
        },\
        \"SecondaryInputId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"secondaryInputId\",\
          \"documentation\": \"The input ID of the secondary input in the automatic input failover pair.\"\
        }\
      },\
      \"documentation\": \"The settings for Automatic Input Failover.\",\
      \"required\": [\
        \"SecondaryInputId\"\
      ]\
    },\
    \"AvailBlanking\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AvailBlankingImage\": {\
          \"shape\": \"InputLocation\",\
          \"locationName\": \"availBlankingImage\",\
          \"documentation\": \"Blanking image to be used. Leave empty for solid black. Only bmp and png images are supported.\"\
        },\
        \"State\": {\
          \"shape\": \"AvailBlankingState\",\
          \"locationName\": \"state\",\
          \"documentation\": \"When set to enabled, causes video, audio and captions to be blanked when insertion metadata is added.\"\
        }\
      },\
      \"documentation\": \"Avail Blanking\"\
    },\
    \"AvailBlankingState\": {\
      \"type\": \"string\",\
      \"documentation\": \"Avail Blanking State\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"AvailConfiguration\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AvailSettings\": {\
          \"shape\": \"AvailSettings\",\
          \"locationName\": \"availSettings\",\
          \"documentation\": \"Ad avail settings.\"\
        }\
      },\
      \"documentation\": \"Avail Configuration\"\
    },\
    \"AvailSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Scte35SpliceInsert\": {\
          \"shape\": \"Scte35SpliceInsert\",\
          \"locationName\": \"scte35SpliceInsert\"\
        },\
        \"Scte35TimeSignalApos\": {\
          \"shape\": \"Scte35TimeSignalApos\",\
          \"locationName\": \"scte35TimeSignalApos\"\
        }\
      },\
      \"documentation\": \"Avail Settings\"\
    },\
    \"BadGatewayException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\"\
        }\
      },\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 502\
      },\
      \"documentation\": \"Placeholder documentation for BadGatewayException\"\
    },\
    \"BadRequestException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\"\
        }\
      },\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 400\
      },\
      \"documentation\": \"Placeholder documentation for BadRequestException\"\
    },\
    \"BatchScheduleActionCreateRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ScheduleActions\": {\
          \"shape\": \"__listOfScheduleAction\",\
          \"locationName\": \"scheduleActions\",\
          \"documentation\": \"A list of schedule actions to create.\"\
        }\
      },\
      \"documentation\": \"A list of schedule actions to create (in a request) or that have been created (in a response).\",\
      \"required\": [\
        \"ScheduleActions\"\
      ]\
    },\
    \"BatchScheduleActionCreateResult\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ScheduleActions\": {\
          \"shape\": \"__listOfScheduleAction\",\
          \"locationName\": \"scheduleActions\",\
          \"documentation\": \"List of actions that have been created in the schedule.\"\
        }\
      },\
      \"documentation\": \"List of actions that have been created in the schedule.\",\
      \"required\": [\
        \"ScheduleActions\"\
      ]\
    },\
    \"BatchScheduleActionDeleteRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ActionNames\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"actionNames\",\
          \"documentation\": \"A list of schedule actions to delete.\"\
        }\
      },\
      \"documentation\": \"A list of schedule actions to delete.\",\
      \"required\": [\
        \"ActionNames\"\
      ]\
    },\
    \"BatchScheduleActionDeleteResult\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ScheduleActions\": {\
          \"shape\": \"__listOfScheduleAction\",\
          \"locationName\": \"scheduleActions\",\
          \"documentation\": \"List of actions that have been deleted from the schedule.\"\
        }\
      },\
      \"documentation\": \"List of actions that have been deleted from the schedule.\",\
      \"required\": [\
        \"ScheduleActions\"\
      ]\
    },\
    \"BatchUpdateScheduleRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"channelId\",\
          \"documentation\": \"Id of the channel whose schedule is being updated.\"\
        },\
        \"Creates\": {\
          \"shape\": \"BatchScheduleActionCreateRequest\",\
          \"locationName\": \"creates\",\
          \"documentation\": \"Schedule actions to create in the schedule.\"\
        },\
        \"Deletes\": {\
          \"shape\": \"BatchScheduleActionDeleteRequest\",\
          \"locationName\": \"deletes\",\
          \"documentation\": \"Schedule actions to delete from the schedule.\"\
        }\
      },\
      \"documentation\": \"List of actions to create and list of actions to delete.\",\
      \"required\": [\
        \"ChannelId\"\
      ]\
    },\
    \"BatchUpdateScheduleResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Creates\": {\
          \"shape\": \"BatchScheduleActionCreateResult\",\
          \"locationName\": \"creates\",\
          \"documentation\": \"Schedule actions created in the schedule.\"\
        },\
        \"Deletes\": {\
          \"shape\": \"BatchScheduleActionDeleteResult\",\
          \"locationName\": \"deletes\",\
          \"documentation\": \"Schedule actions deleted from the schedule.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for BatchUpdateScheduleResponse\"\
    },\
    \"BatchUpdateScheduleResult\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Creates\": {\
          \"shape\": \"BatchScheduleActionCreateResult\",\
          \"locationName\": \"creates\",\
          \"documentation\": \"Schedule actions created in the schedule.\"\
        },\
        \"Deletes\": {\
          \"shape\": \"BatchScheduleActionDeleteResult\",\
          \"locationName\": \"deletes\",\
          \"documentation\": \"Schedule actions deleted from the schedule.\"\
        }\
      },\
      \"documentation\": \"Results of a batch schedule update.\"\
    },\
    \"BlackoutSlate\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BlackoutSlateImage\": {\
          \"shape\": \"InputLocation\",\
          \"locationName\": \"blackoutSlateImage\",\
          \"documentation\": \"Blackout slate image to be used. Leave empty for solid black. Only bmp and png images are supported.\"\
        },\
        \"NetworkEndBlackout\": {\
          \"shape\": \"BlackoutSlateNetworkEndBlackout\",\
          \"locationName\": \"networkEndBlackout\",\
          \"documentation\": \"Setting to enabled causes the encoder to blackout the video, audio, and captions, and raise the \\\"Network Blackout Image\\\" slate when an SCTE104/35 Network End Segmentation Descriptor is encountered. The blackout will be lifted when the Network Start Segmentation Descriptor is encountered. The Network End and Network Start descriptors must contain a network ID that matches the value entered in \\\"Network ID\\\".\"\
        },\
        \"NetworkEndBlackoutImage\": {\
          \"shape\": \"InputLocation\",\
          \"locationName\": \"networkEndBlackoutImage\",\
          \"documentation\": \"Path to local file to use as Network End Blackout image. Image will be scaled to fill the entire output raster.\"\
        },\
        \"NetworkId\": {\
          \"shape\": \"__stringMin34Max34\",\
          \"locationName\": \"networkId\",\
          \"documentation\": \"Provides Network ID that matches EIDR ID format (e.g., \\\"10.XXXX/XXXX-XXXX-XXXX-XXXX-XXXX-C\\\").\"\
        },\
        \"State\": {\
          \"shape\": \"BlackoutSlateState\",\
          \"locationName\": \"state\",\
          \"documentation\": \"When set to enabled, causes video, audio and captions to be blanked when indicated by program metadata.\"\
        }\
      },\
      \"documentation\": \"Blackout Slate\"\
    },\
    \"BlackoutSlateNetworkEndBlackout\": {\
      \"type\": \"string\",\
      \"documentation\": \"Blackout Slate Network End Blackout\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"BlackoutSlateState\": {\
      \"type\": \"string\",\
      \"documentation\": \"Blackout Slate State\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"BurnInAlignment\": {\
      \"type\": \"string\",\
      \"documentation\": \"Burn In Alignment\",\
      \"enum\": [\
        \"CENTERED\",\
        \"LEFT\",\
        \"SMART\"\
      ]\
    },\
    \"BurnInBackgroundColor\": {\
      \"type\": \"string\",\
      \"documentation\": \"Burn In Background Color\",\
      \"enum\": [\
        \"BLACK\",\
        \"NONE\",\
        \"WHITE\"\
      ]\
    },\
    \"BurnInDestinationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Alignment\": {\
          \"shape\": \"BurnInAlignment\",\
          \"locationName\": \"alignment\",\
          \"documentation\": \"If no explicit xPosition or yPosition is provided, setting alignment to centered will place the captions at the bottom center of the output. Similarly, setting a left alignment will align captions to the bottom left of the output. If x and y positions are given in conjunction with the alignment parameter, the font will be justified (either left or centered) relative to those coordinates. Selecting \\\"smart\\\" justification will left-justify live subtitles and center-justify pre-recorded subtitles.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"BackgroundColor\": {\
          \"shape\": \"BurnInBackgroundColor\",\
          \"locationName\": \"backgroundColor\",\
          \"documentation\": \"Specifies the color of the rectangle behind the captions.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"BackgroundOpacity\": {\
          \"shape\": \"__integerMin0Max255\",\
          \"locationName\": \"backgroundOpacity\",\
          \"documentation\": \"Specifies the opacity of the background rectangle. 255 is opaque; 0 is transparent. Leaving this parameter out is equivalent to setting it to 0 (transparent).  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"Font\": {\
          \"shape\": \"InputLocation\",\
          \"locationName\": \"font\",\
          \"documentation\": \"External font file used for caption burn-in. File extension must be 'ttf' or 'tte'.  Although the user can select output fonts for many different types of input captions,  embedded, STL and teletext sources use a strict grid system. Using external fonts with these caption sources could cause unexpected display of proportional fonts.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"FontColor\": {\
          \"shape\": \"BurnInFontColor\",\
          \"locationName\": \"fontColor\",\
          \"documentation\": \"Specifies the color of the burned-in captions.  This option is not valid for source captions that are STL, 608/embedded or teletext.  These source settings are already pre-defined by the caption stream.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"FontOpacity\": {\
          \"shape\": \"__integerMin0Max255\",\
          \"locationName\": \"fontOpacity\",\
          \"documentation\": \"Specifies the opacity of the burned-in captions. 255 is opaque; 0 is transparent.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"FontResolution\": {\
          \"shape\": \"__integerMin96Max600\",\
          \"locationName\": \"fontResolution\",\
          \"documentation\": \"Font resolution in DPI (dots per inch); default is 96 dpi.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"FontSize\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"fontSize\",\
          \"documentation\": \"When set to 'auto' fontSize will scale depending on the size of the output.  Giving a positive integer will specify the exact font size in points.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"OutlineColor\": {\
          \"shape\": \"BurnInOutlineColor\",\
          \"locationName\": \"outlineColor\",\
          \"documentation\": \"Specifies font outline color. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"OutlineSize\": {\
          \"shape\": \"__integerMin0Max10\",\
          \"locationName\": \"outlineSize\",\
          \"documentation\": \"Specifies font outline size in pixels. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"ShadowColor\": {\
          \"shape\": \"BurnInShadowColor\",\
          \"locationName\": \"shadowColor\",\
          \"documentation\": \"Specifies the color of the shadow cast by the captions.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"ShadowOpacity\": {\
          \"shape\": \"__integerMin0Max255\",\
          \"locationName\": \"shadowOpacity\",\
          \"documentation\": \"Specifies the opacity of the shadow. 255 is opaque; 0 is transparent. Leaving this parameter out is equivalent to setting it to 0 (transparent).  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"ShadowXOffset\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"shadowXOffset\",\
          \"documentation\": \"Specifies the horizontal offset of the shadow relative to the captions in pixels. A value of -2 would result in a shadow offset 2 pixels to the left.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"ShadowYOffset\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"shadowYOffset\",\
          \"documentation\": \"Specifies the vertical offset of the shadow relative to the captions in pixels. A value of -2 would result in a shadow offset 2 pixels above the text.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"TeletextGridControl\": {\
          \"shape\": \"BurnInTeletextGridControl\",\
          \"locationName\": \"teletextGridControl\",\
          \"documentation\": \"Controls whether a fixed grid size will be used to generate the output subtitles bitmap. Only applicable for Teletext inputs and DVB-Sub/Burn-in outputs.\"\
        },\
        \"XPosition\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"xPosition\",\
          \"documentation\": \"Specifies the horizontal position of the caption relative to the left side of the output in pixels. A value of 10 would result in the captions starting 10 pixels from the left of the output. If no explicit xPosition is provided, the horizontal caption position will be determined by the alignment parameter.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"YPosition\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"yPosition\",\
          \"documentation\": \"Specifies the vertical position of the caption relative to the top of the output in pixels. A value of 10 would result in the captions starting 10 pixels from the top of the output. If no explicit yPosition is provided, the caption will be positioned towards the bottom of the output.  All burn-in and DVB-Sub font settings must match.\"\
        }\
      },\
      \"documentation\": \"Burn In Destination Settings\"\
    },\
    \"BurnInFontColor\": {\
      \"type\": \"string\",\
      \"documentation\": \"Burn In Font Color\",\
      \"enum\": [\
        \"BLACK\",\
        \"BLUE\",\
        \"GREEN\",\
        \"RED\",\
        \"WHITE\",\
        \"YELLOW\"\
      ]\
    },\
    \"BurnInOutlineColor\": {\
      \"type\": \"string\",\
      \"documentation\": \"Burn In Outline Color\",\
      \"enum\": [\
        \"BLACK\",\
        \"BLUE\",\
        \"GREEN\",\
        \"RED\",\
        \"WHITE\",\
        \"YELLOW\"\
      ]\
    },\
    \"BurnInShadowColor\": {\
      \"type\": \"string\",\
      \"documentation\": \"Burn In Shadow Color\",\
      \"enum\": [\
        \"BLACK\",\
        \"NONE\",\
        \"WHITE\"\
      ]\
    },\
    \"BurnInTeletextGridControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"Burn In Teletext Grid Control\",\
      \"enum\": [\
        \"FIXED\",\
        \"SCALED\"\
      ]\
    },\
    \"CaptionDescription\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CaptionSelectorName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"captionSelectorName\",\
          \"documentation\": \"Specifies which input caption selector to use as a caption source when generating output captions. This field should match a captionSelector name.\"\
        },\
        \"DestinationSettings\": {\
          \"shape\": \"CaptionDestinationSettings\",\
          \"locationName\": \"destinationSettings\",\
          \"documentation\": \"Additional settings for captions destination that depend on the destination type.\"\
        },\
        \"LanguageCode\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"languageCode\",\
          \"documentation\": \"ISO 639-2 three-digit code: http://www.loc.gov/standards/iso639-2/\"\
        },\
        \"LanguageDescription\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"languageDescription\",\
          \"documentation\": \"Human readable information to indicate captions available for players (eg. English, or Spanish).\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"Name of the caption description.  Used to associate a caption description with an output.  Names must be unique within an event.\"\
        }\
      },\
      \"documentation\": \"Caption Description\",\
      \"required\": [\
        \"CaptionSelectorName\",\
        \"Name\"\
      ]\
    },\
    \"CaptionDestinationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AribDestinationSettings\": {\
          \"shape\": \"AribDestinationSettings\",\
          \"locationName\": \"aribDestinationSettings\"\
        },\
        \"BurnInDestinationSettings\": {\
          \"shape\": \"BurnInDestinationSettings\",\
          \"locationName\": \"burnInDestinationSettings\"\
        },\
        \"DvbSubDestinationSettings\": {\
          \"shape\": \"DvbSubDestinationSettings\",\
          \"locationName\": \"dvbSubDestinationSettings\"\
        },\
        \"EmbeddedDestinationSettings\": {\
          \"shape\": \"EmbeddedDestinationSettings\",\
          \"locationName\": \"embeddedDestinationSettings\"\
        },\
        \"EmbeddedPlusScte20DestinationSettings\": {\
          \"shape\": \"EmbeddedPlusScte20DestinationSettings\",\
          \"locationName\": \"embeddedPlusScte20DestinationSettings\"\
        },\
        \"RtmpCaptionInfoDestinationSettings\": {\
          \"shape\": \"RtmpCaptionInfoDestinationSettings\",\
          \"locationName\": \"rtmpCaptionInfoDestinationSettings\"\
        },\
        \"Scte20PlusEmbeddedDestinationSettings\": {\
          \"shape\": \"Scte20PlusEmbeddedDestinationSettings\",\
          \"locationName\": \"scte20PlusEmbeddedDestinationSettings\"\
        },\
        \"Scte27DestinationSettings\": {\
          \"shape\": \"Scte27DestinationSettings\",\
          \"locationName\": \"scte27DestinationSettings\"\
        },\
        \"SmpteTtDestinationSettings\": {\
          \"shape\": \"SmpteTtDestinationSettings\",\
          \"locationName\": \"smpteTtDestinationSettings\"\
        },\
        \"TeletextDestinationSettings\": {\
          \"shape\": \"TeletextDestinationSettings\",\
          \"locationName\": \"teletextDestinationSettings\"\
        },\
        \"TtmlDestinationSettings\": {\
          \"shape\": \"TtmlDestinationSettings\",\
          \"locationName\": \"ttmlDestinationSettings\"\
        },\
        \"WebvttDestinationSettings\": {\
          \"shape\": \"WebvttDestinationSettings\",\
          \"locationName\": \"webvttDestinationSettings\"\
        }\
      },\
      \"documentation\": \"Caption Destination Settings\"\
    },\
    \"CaptionLanguageMapping\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CaptionChannel\": {\
          \"shape\": \"__integerMin1Max4\",\
          \"locationName\": \"captionChannel\",\
          \"documentation\": \"The closed caption channel being described by this CaptionLanguageMapping.  Each channel mapping must have a unique channel number (maximum of 4)\"\
        },\
        \"LanguageCode\": {\
          \"shape\": \"__stringMin3Max3\",\
          \"locationName\": \"languageCode\",\
          \"documentation\": \"Three character ISO 639-2 language code (see http://www.loc.gov/standards/iso639-2)\"\
        },\
        \"LanguageDescription\": {\
          \"shape\": \"__stringMin1\",\
          \"locationName\": \"languageDescription\",\
          \"documentation\": \"Textual description of language\"\
        }\
      },\
      \"documentation\": \"Maps a caption channel to an ISO 693-2 language code (http://www.loc.gov/standards/iso639-2), with an optional description.\",\
      \"required\": [\
        \"LanguageCode\",\
        \"LanguageDescription\",\
        \"CaptionChannel\"\
      ]\
    },\
    \"CaptionSelector\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"LanguageCode\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"languageCode\",\
          \"documentation\": \"When specified this field indicates the three letter language code of the caption track to extract from the source.\"\
        },\
        \"Name\": {\
          \"shape\": \"__stringMin1\",\
          \"locationName\": \"name\",\
          \"documentation\": \"Name identifier for a caption selector.  This name is used to associate this caption selector with one or more caption descriptions.  Names must be unique within an event.\"\
        },\
        \"SelectorSettings\": {\
          \"shape\": \"CaptionSelectorSettings\",\
          \"locationName\": \"selectorSettings\",\
          \"documentation\": \"Caption selector settings.\"\
        }\
      },\
      \"documentation\": \"Output groups for this Live Event. Output groups contain information about where streams should be distributed.\",\
      \"required\": [\
        \"Name\"\
      ]\
    },\
    \"CaptionSelectorSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AribSourceSettings\": {\
          \"shape\": \"AribSourceSettings\",\
          \"locationName\": \"aribSourceSettings\"\
        },\
        \"DvbSubSourceSettings\": {\
          \"shape\": \"DvbSubSourceSettings\",\
          \"locationName\": \"dvbSubSourceSettings\"\
        },\
        \"EmbeddedSourceSettings\": {\
          \"shape\": \"EmbeddedSourceSettings\",\
          \"locationName\": \"embeddedSourceSettings\"\
        },\
        \"Scte20SourceSettings\": {\
          \"shape\": \"Scte20SourceSettings\",\
          \"locationName\": \"scte20SourceSettings\"\
        },\
        \"Scte27SourceSettings\": {\
          \"shape\": \"Scte27SourceSettings\",\
          \"locationName\": \"scte27SourceSettings\"\
        },\
        \"TeletextSourceSettings\": {\
          \"shape\": \"TeletextSourceSettings\",\
          \"locationName\": \"teletextSourceSettings\"\
        }\
      },\
      \"documentation\": \"Caption Selector Settings\"\
    },\
    \"Channel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"The unique arn of the channel.\"\
        },\
        \"ChannelClass\": {\
          \"shape\": \"ChannelClass\",\
          \"locationName\": \"channelClass\",\
          \"documentation\": \"The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfOutputDestination\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"A list of destinations of the channel. For UDP outputs, there is one\\ndestination per output. For other types (HLS, for example), there is\\none destination per packager.\\n\"\
        },\
        \"EgressEndpoints\": {\
          \"shape\": \"__listOfChannelEgressEndpoint\",\
          \"locationName\": \"egressEndpoints\",\
          \"documentation\": \"The endpoints where outgoing connections initiate from\"\
        },\
        \"EncoderSettings\": {\
          \"shape\": \"EncoderSettings\",\
          \"locationName\": \"encoderSettings\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id\",\
          \"documentation\": \"The unique id of the channel.\"\
        },\
        \"InputAttachments\": {\
          \"shape\": \"__listOfInputAttachment\",\
          \"locationName\": \"inputAttachments\",\
          \"documentation\": \"List of input attachments for channel.\"\
        },\
        \"InputSpecification\": {\
          \"shape\": \"InputSpecification\",\
          \"locationName\": \"inputSpecification\"\
        },\
        \"LogLevel\": {\
          \"shape\": \"LogLevel\",\
          \"locationName\": \"logLevel\",\
          \"documentation\": \"The log level being written to CloudWatch Logs.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The name of the channel. (user-mutable)\"\
        },\
        \"PipelineDetails\": {\
          \"shape\": \"__listOfPipelineDetail\",\
          \"locationName\": \"pipelineDetails\",\
          \"documentation\": \"Runtime details for the pipelines of a running channel.\"\
        },\
        \"PipelinesRunningCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"pipelinesRunningCount\",\
          \"documentation\": \"The number of currently healthy pipelines.\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"roleArn\",\
          \"documentation\": \"The Amazon Resource Name (ARN) of the role assumed when running the Channel.\"\
        },\
        \"State\": {\
          \"shape\": \"ChannelState\",\
          \"locationName\": \"state\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for Channel\"\
    },\
    \"ChannelClass\": {\
      \"type\": \"string\",\
      \"documentation\": \"A standard channel has two encoding pipelines and a single pipeline channel only has one.\",\
      \"enum\": [\
        \"STANDARD\",\
        \"SINGLE_PIPELINE\"\
      ]\
    },\
    \"ChannelConfigurationValidationError\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\"\
        },\
        \"ValidationErrors\": {\
          \"shape\": \"__listOfValidationError\",\
          \"locationName\": \"validationErrors\",\
          \"documentation\": \"A collection of validation error responses.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ChannelConfigurationValidationError\"\
    },\
    \"ChannelEgressEndpoint\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SourceIp\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"sourceIp\",\
          \"documentation\": \"Public IP of where a channel's output comes from\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ChannelEgressEndpoint\"\
    },\
    \"ChannelState\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"CREATING\",\
        \"CREATE_FAILED\",\
        \"IDLE\",\
        \"STARTING\",\
        \"RUNNING\",\
        \"RECOVERING\",\
        \"STOPPING\",\
        \"DELETING\",\
        \"DELETED\",\
        \"UPDATING\",\
        \"UPDATE_FAILED\"\
      ],\
      \"documentation\": \"Placeholder documentation for ChannelState\"\
    },\
    \"ChannelSummary\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"The unique arn of the channel.\"\
        },\
        \"ChannelClass\": {\
          \"shape\": \"ChannelClass\",\
          \"locationName\": \"channelClass\",\
          \"documentation\": \"The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfOutputDestination\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"A list of destinations of the channel. For UDP outputs, there is one\\ndestination per output. For other types (HLS, for example), there is\\none destination per packager.\\n\"\
        },\
        \"EgressEndpoints\": {\
          \"shape\": \"__listOfChannelEgressEndpoint\",\
          \"locationName\": \"egressEndpoints\",\
          \"documentation\": \"The endpoints where outgoing connections initiate from\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id\",\
          \"documentation\": \"The unique id of the channel.\"\
        },\
        \"InputAttachments\": {\
          \"shape\": \"__listOfInputAttachment\",\
          \"locationName\": \"inputAttachments\",\
          \"documentation\": \"List of input attachments for channel.\"\
        },\
        \"InputSpecification\": {\
          \"shape\": \"InputSpecification\",\
          \"locationName\": \"inputSpecification\"\
        },\
        \"LogLevel\": {\
          \"shape\": \"LogLevel\",\
          \"locationName\": \"logLevel\",\
          \"documentation\": \"The log level being written to CloudWatch Logs.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The name of the channel. (user-mutable)\"\
        },\
        \"PipelinesRunningCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"pipelinesRunningCount\",\
          \"documentation\": \"The number of currently healthy pipelines.\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"roleArn\",\
          \"documentation\": \"The Amazon Resource Name (ARN) of the role assumed when running the Channel.\"\
        },\
        \"State\": {\
          \"shape\": \"ChannelState\",\
          \"locationName\": \"state\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ChannelSummary\"\
    },\
    \"ColorSpacePassthroughSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Passthrough applies no color space conversion to the output\"\
    },\
    \"ConflictException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\"\
        }\
      },\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 409\
      },\
      \"documentation\": \"Placeholder documentation for ConflictException\"\
    },\
    \"CreateChannel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelClass\": {\
          \"shape\": \"ChannelClass\",\
          \"locationName\": \"channelClass\",\
          \"documentation\": \"The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfOutputDestination\",\
          \"locationName\": \"destinations\"\
        },\
        \"EncoderSettings\": {\
          \"shape\": \"EncoderSettings\",\
          \"locationName\": \"encoderSettings\"\
        },\
        \"InputAttachments\": {\
          \"shape\": \"__listOfInputAttachment\",\
          \"locationName\": \"inputAttachments\",\
          \"documentation\": \"List of input attachments for channel.\"\
        },\
        \"InputSpecification\": {\
          \"shape\": \"InputSpecification\",\
          \"locationName\": \"inputSpecification\",\
          \"documentation\": \"Specification of input for this channel (max. bitrate, resolution, codec, etc.)\"\
        },\
        \"LogLevel\": {\
          \"shape\": \"LogLevel\",\
          \"locationName\": \"logLevel\",\
          \"documentation\": \"The log level to write to CloudWatch Logs.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"Name of channel.\"\
        },\
        \"RequestId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"requestId\",\
          \"documentation\": \"Unique request ID to be specified. This is needed to prevent retries from\\ncreating multiple resources.\\n\",\
          \"idempotencyToken\": true\
        },\
        \"Reserved\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"reserved\",\
          \"documentation\": \"Deprecated field that's only usable by whitelisted customers.\",\
          \"deprecated\": true\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"roleArn\",\
          \"documentation\": \"An optional Amazon Resource Name (ARN) of the role to assume when running the Channel.\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for CreateChannel\"\
    },\
    \"CreateChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelClass\": {\
          \"shape\": \"ChannelClass\",\
          \"locationName\": \"channelClass\",\
          \"documentation\": \"The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfOutputDestination\",\
          \"locationName\": \"destinations\"\
        },\
        \"EncoderSettings\": {\
          \"shape\": \"EncoderSettings\",\
          \"locationName\": \"encoderSettings\"\
        },\
        \"InputAttachments\": {\
          \"shape\": \"__listOfInputAttachment\",\
          \"locationName\": \"inputAttachments\",\
          \"documentation\": \"List of input attachments for channel.\"\
        },\
        \"InputSpecification\": {\
          \"shape\": \"InputSpecification\",\
          \"locationName\": \"inputSpecification\",\
          \"documentation\": \"Specification of input for this channel (max. bitrate, resolution, codec, etc.)\"\
        },\
        \"LogLevel\": {\
          \"shape\": \"LogLevel\",\
          \"locationName\": \"logLevel\",\
          \"documentation\": \"The log level to write to CloudWatch Logs.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"Name of channel.\"\
        },\
        \"RequestId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"requestId\",\
          \"documentation\": \"Unique request ID to be specified. This is needed to prevent retries from\\ncreating multiple resources.\\n\",\
          \"idempotencyToken\": true\
        },\
        \"Reserved\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"reserved\",\
          \"documentation\": \"Deprecated field that's only usable by whitelisted customers.\",\
          \"deprecated\": true\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"roleArn\",\
          \"documentation\": \"An optional Amazon Resource Name (ARN) of the role to assume when running the Channel.\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        }\
      },\
      \"documentation\": \"A request to create a channel\"\
    },\
    \"CreateChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Channel\": {\
          \"shape\": \"Channel\",\
          \"locationName\": \"channel\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for CreateChannelResponse\"\
    },\
    \"CreateChannelResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Channel\": {\
          \"shape\": \"Channel\",\
          \"locationName\": \"channel\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for CreateChannelResultModel\"\
    },\
    \"CreateInput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Destinations\": {\
          \"shape\": \"__listOfInputDestinationRequest\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"Destination settings for PUSH type inputs.\"\
        },\
        \"InputSecurityGroups\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"inputSecurityGroups\",\
          \"documentation\": \"A list of security groups referenced by IDs to attach to the input.\"\
        },\
        \"MediaConnectFlows\": {\
          \"shape\": \"__listOfMediaConnectFlowRequest\",\
          \"locationName\": \"mediaConnectFlows\",\
          \"documentation\": \"A list of the MediaConnect Flows that you want to use in this input. You can specify as few as one\\nFlow and presently, as many as two. The only requirement is when you have more than one is that each Flow is in a\\nseparate Availability Zone as this ensures your EML input is redundant to AZ issues.\\n\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"Name of the input.\"\
        },\
        \"RequestId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"requestId\",\
          \"documentation\": \"Unique identifier of the request to ensure the request is handled\\nexactly once in case of retries.\\n\",\
          \"idempotencyToken\": true\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"roleArn\",\
          \"documentation\": \"The Amazon Resource Name (ARN) of the role this input assumes during and after creation.\"\
        },\
        \"Sources\": {\
          \"shape\": \"__listOfInputSourceRequest\",\
          \"locationName\": \"sources\",\
          \"documentation\": \"The source URLs for a PULL-type input. Every PULL type input needs\\nexactly two source URLs for redundancy.\\nOnly specify sources for PULL type Inputs. Leave Destinations empty.\\n\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        },\
        \"Type\": {\
          \"shape\": \"InputType\",\
          \"locationName\": \"type\"\
        },\
        \"Vpc\": {\
          \"shape\": \"InputVpcRequest\",\
          \"locationName\": \"vpc\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for CreateInput\"\
    },\
    \"CreateInputRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Destinations\": {\
          \"shape\": \"__listOfInputDestinationRequest\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"Destination settings for PUSH type inputs.\"\
        },\
        \"InputSecurityGroups\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"inputSecurityGroups\",\
          \"documentation\": \"A list of security groups referenced by IDs to attach to the input.\"\
        },\
        \"MediaConnectFlows\": {\
          \"shape\": \"__listOfMediaConnectFlowRequest\",\
          \"locationName\": \"mediaConnectFlows\",\
          \"documentation\": \"A list of the MediaConnect Flows that you want to use in this input. You can specify as few as one\\nFlow and presently, as many as two. The only requirement is when you have more than one is that each Flow is in a\\nseparate Availability Zone as this ensures your EML input is redundant to AZ issues.\\n\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"Name of the input.\"\
        },\
        \"RequestId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"requestId\",\
          \"documentation\": \"Unique identifier of the request to ensure the request is handled\\nexactly once in case of retries.\\n\",\
          \"idempotencyToken\": true\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"roleArn\",\
          \"documentation\": \"The Amazon Resource Name (ARN) of the role this input assumes during and after creation.\"\
        },\
        \"Sources\": {\
          \"shape\": \"__listOfInputSourceRequest\",\
          \"locationName\": \"sources\",\
          \"documentation\": \"The source URLs for a PULL-type input. Every PULL type input needs\\nexactly two source URLs for redundancy.\\nOnly specify sources for PULL type Inputs. Leave Destinations empty.\\n\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        },\
        \"Type\": {\
          \"shape\": \"InputType\",\
          \"locationName\": \"type\"\
        },\
        \"Vpc\": {\
          \"shape\": \"InputVpcRequest\",\
          \"locationName\": \"vpc\"\
        }\
      },\
      \"documentation\": \"The name of the input\"\
    },\
    \"CreateInputResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Input\": {\
          \"shape\": \"Input\",\
          \"locationName\": \"input\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for CreateInputResponse\"\
    },\
    \"CreateInputResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Input\": {\
          \"shape\": \"Input\",\
          \"locationName\": \"input\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for CreateInputResultModel\"\
    },\
    \"CreateInputSecurityGroupRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        },\
        \"WhitelistRules\": {\
          \"shape\": \"__listOfInputWhitelistRuleCidr\",\
          \"locationName\": \"whitelistRules\",\
          \"documentation\": \"List of IPv4 CIDR addresses to whitelist\"\
        }\
      },\
      \"documentation\": \"The IPv4 CIDRs to whitelist for this Input Security Group\"\
    },\
    \"CreateInputSecurityGroupResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SecurityGroup\": {\
          \"shape\": \"InputSecurityGroup\",\
          \"locationName\": \"securityGroup\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for CreateInputSecurityGroupResponse\"\
    },\
    \"CreateInputSecurityGroupResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SecurityGroup\": {\
          \"shape\": \"InputSecurityGroup\",\
          \"locationName\": \"securityGroup\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for CreateInputSecurityGroupResultModel\"\
    },\
    \"CreateMultiplex\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AvailabilityZones\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"availabilityZones\",\
          \"documentation\": \"A list of availability zones for the multiplex. You must specify exactly two.\"\
        },\
        \"MultiplexSettings\": {\
          \"shape\": \"MultiplexSettings\",\
          \"locationName\": \"multiplexSettings\",\
          \"documentation\": \"Configuration for a multiplex event.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"Name of multiplex.\"\
        },\
        \"RequestId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"requestId\",\
          \"documentation\": \"Unique request ID. This prevents retries from creating multiple\\nresources.\\n\",\
          \"idempotencyToken\": true\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        }\
      },\
      \"required\": [\
        \"RequestId\",\
        \"MultiplexSettings\",\
        \"AvailabilityZones\",\
        \"Name\"\
      ],\
      \"documentation\": \"Placeholder documentation for CreateMultiplex\"\
    },\
    \"CreateMultiplexProgram\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexProgramSettings\": {\
          \"shape\": \"MultiplexProgramSettings\",\
          \"locationName\": \"multiplexProgramSettings\",\
          \"documentation\": \"The settings for this multiplex program.\"\
        },\
        \"ProgramName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"programName\",\
          \"documentation\": \"Name of multiplex program.\"\
        },\
        \"RequestId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"requestId\",\
          \"documentation\": \"Unique request ID. This prevents retries from creating multiple\\nresources.\\n\",\
          \"idempotencyToken\": true\
        }\
      },\
      \"required\": [\
        \"RequestId\",\
        \"MultiplexProgramSettings\",\
        \"ProgramName\"\
      ],\
      \"documentation\": \"Placeholder documentation for CreateMultiplexProgram\"\
    },\
    \"CreateMultiplexProgramRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"multiplexId\",\
          \"documentation\": \"ID of the multiplex where the program is to be created.\"\
        },\
        \"MultiplexProgramSettings\": {\
          \"shape\": \"MultiplexProgramSettings\",\
          \"locationName\": \"multiplexProgramSettings\",\
          \"documentation\": \"The settings for this multiplex program.\"\
        },\
        \"ProgramName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"programName\",\
          \"documentation\": \"Name of multiplex program.\"\
        },\
        \"RequestId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"requestId\",\
          \"documentation\": \"Unique request ID. This prevents retries from creating multiple\\nresources.\\n\",\
          \"idempotencyToken\": true\
        }\
      },\
      \"documentation\": \"A request to create a program in a multiplex.\",\
      \"required\": [\
        \"MultiplexId\",\
        \"RequestId\",\
        \"MultiplexProgramSettings\",\
        \"ProgramName\"\
      ]\
    },\
    \"CreateMultiplexProgramResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexProgram\": {\
          \"shape\": \"MultiplexProgram\",\
          \"locationName\": \"multiplexProgram\",\
          \"documentation\": \"The newly created multiplex program.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for CreateMultiplexProgramResponse\"\
    },\
    \"CreateMultiplexProgramResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexProgram\": {\
          \"shape\": \"MultiplexProgram\",\
          \"locationName\": \"multiplexProgram\",\
          \"documentation\": \"The newly created multiplex program.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for CreateMultiplexProgramResultModel\"\
    },\
    \"CreateMultiplexRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AvailabilityZones\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"availabilityZones\",\
          \"documentation\": \"A list of availability zones for the multiplex. You must specify exactly two.\"\
        },\
        \"MultiplexSettings\": {\
          \"shape\": \"MultiplexSettings\",\
          \"locationName\": \"multiplexSettings\",\
          \"documentation\": \"Configuration for a multiplex event.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"Name of multiplex.\"\
        },\
        \"RequestId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"requestId\",\
          \"documentation\": \"Unique request ID. This prevents retries from creating multiple\\nresources.\\n\",\
          \"idempotencyToken\": true\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        }\
      },\
      \"documentation\": \"A request to create a multiplex.\",\
      \"required\": [\
        \"RequestId\",\
        \"MultiplexSettings\",\
        \"AvailabilityZones\",\
        \"Name\"\
      ]\
    },\
    \"CreateMultiplexResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Multiplex\": {\
          \"shape\": \"Multiplex\",\
          \"locationName\": \"multiplex\",\
          \"documentation\": \"The newly created multiplex.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for CreateMultiplexResponse\"\
    },\
    \"CreateMultiplexResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Multiplex\": {\
          \"shape\": \"Multiplex\",\
          \"locationName\": \"multiplex\",\
          \"documentation\": \"The newly created multiplex.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for CreateMultiplexResultModel\"\
    },\
    \"CreateTagsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ResourceArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"resource-arn\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\"\
        }\
      },\
      \"required\": [\
        \"ResourceArn\"\
      ],\
      \"documentation\": \"Placeholder documentation for CreateTagsRequest\"\
    },\
    \"DeleteChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"channelId\",\
          \"documentation\": \"Unique ID of the channel.\"\
        }\
      },\
      \"required\": [\
        \"ChannelId\"\
      ],\
      \"documentation\": \"Placeholder documentation for DeleteChannelRequest\"\
    },\
    \"DeleteChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"The unique arn of the channel.\"\
        },\
        \"ChannelClass\": {\
          \"shape\": \"ChannelClass\",\
          \"locationName\": \"channelClass\",\
          \"documentation\": \"The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfOutputDestination\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"A list of destinations of the channel. For UDP outputs, there is one\\ndestination per output. For other types (HLS, for example), there is\\none destination per packager.\\n\"\
        },\
        \"EgressEndpoints\": {\
          \"shape\": \"__listOfChannelEgressEndpoint\",\
          \"locationName\": \"egressEndpoints\",\
          \"documentation\": \"The endpoints where outgoing connections initiate from\"\
        },\
        \"EncoderSettings\": {\
          \"shape\": \"EncoderSettings\",\
          \"locationName\": \"encoderSettings\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id\",\
          \"documentation\": \"The unique id of the channel.\"\
        },\
        \"InputAttachments\": {\
          \"shape\": \"__listOfInputAttachment\",\
          \"locationName\": \"inputAttachments\",\
          \"documentation\": \"List of input attachments for channel.\"\
        },\
        \"InputSpecification\": {\
          \"shape\": \"InputSpecification\",\
          \"locationName\": \"inputSpecification\"\
        },\
        \"LogLevel\": {\
          \"shape\": \"LogLevel\",\
          \"locationName\": \"logLevel\",\
          \"documentation\": \"The log level being written to CloudWatch Logs.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The name of the channel. (user-mutable)\"\
        },\
        \"PipelineDetails\": {\
          \"shape\": \"__listOfPipelineDetail\",\
          \"locationName\": \"pipelineDetails\",\
          \"documentation\": \"Runtime details for the pipelines of a running channel.\"\
        },\
        \"PipelinesRunningCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"pipelinesRunningCount\",\
          \"documentation\": \"The number of currently healthy pipelines.\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"roleArn\",\
          \"documentation\": \"The Amazon Resource Name (ARN) of the role assumed when running the Channel.\"\
        },\
        \"State\": {\
          \"shape\": \"ChannelState\",\
          \"locationName\": \"state\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for DeleteChannelResponse\"\
    },\
    \"DeleteInputRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InputId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"inputId\",\
          \"documentation\": \"Unique ID of the input\"\
        }\
      },\
      \"required\": [\
        \"InputId\"\
      ],\
      \"documentation\": \"Placeholder documentation for DeleteInputRequest\"\
    },\
    \"DeleteInputResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Placeholder documentation for DeleteInputResponse\"\
    },\
    \"DeleteInputSecurityGroupRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InputSecurityGroupId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"inputSecurityGroupId\",\
          \"documentation\": \"The Input Security Group to delete\"\
        }\
      },\
      \"required\": [\
        \"InputSecurityGroupId\"\
      ],\
      \"documentation\": \"Placeholder documentation for DeleteInputSecurityGroupRequest\"\
    },\
    \"DeleteInputSecurityGroupResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Placeholder documentation for DeleteInputSecurityGroupResponse\"\
    },\
    \"DeleteMultiplexProgramRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"multiplexId\",\
          \"documentation\": \"The ID of the multiplex that the program belongs to.\"\
        },\
        \"ProgramName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"programName\",\
          \"documentation\": \"The multiplex program name.\"\
        }\
      },\
      \"required\": [\
        \"MultiplexId\",\
        \"ProgramName\"\
      ],\
      \"documentation\": \"Placeholder documentation for DeleteMultiplexProgramRequest\"\
    },\
    \"DeleteMultiplexProgramResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"channelId\",\
          \"documentation\": \"The MediaLive channel associated with the program.\"\
        },\
        \"MultiplexProgramSettings\": {\
          \"shape\": \"MultiplexProgramSettings\",\
          \"locationName\": \"multiplexProgramSettings\",\
          \"documentation\": \"The settings for this multiplex program.\"\
        },\
        \"PacketIdentifiersMap\": {\
          \"shape\": \"MultiplexProgramPacketIdentifiersMap\",\
          \"locationName\": \"packetIdentifiersMap\",\
          \"documentation\": \"The packet identifier map for this multiplex program.\"\
        },\
        \"ProgramName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"programName\",\
          \"documentation\": \"The name of the multiplex program.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for DeleteMultiplexProgramResponse\"\
    },\
    \"DeleteMultiplexRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"multiplexId\",\
          \"documentation\": \"The ID of the multiplex.\"\
        }\
      },\
      \"required\": [\
        \"MultiplexId\"\
      ],\
      \"documentation\": \"Placeholder documentation for DeleteMultiplexRequest\"\
    },\
    \"DeleteMultiplexResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"The unique arn of the multiplex.\"\
        },\
        \"AvailabilityZones\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"availabilityZones\",\
          \"documentation\": \"A list of availability zones for the multiplex.\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfMultiplexOutputDestination\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"A list of the multiplex output destinations.\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id\",\
          \"documentation\": \"The unique id of the multiplex.\"\
        },\
        \"MultiplexSettings\": {\
          \"shape\": \"MultiplexSettings\",\
          \"locationName\": \"multiplexSettings\",\
          \"documentation\": \"Configuration for a multiplex event.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The name of the multiplex.\"\
        },\
        \"PipelinesRunningCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"pipelinesRunningCount\",\
          \"documentation\": \"The number of currently healthy pipelines.\"\
        },\
        \"ProgramCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"programCount\",\
          \"documentation\": \"The number of programs in the multiplex.\"\
        },\
        \"State\": {\
          \"shape\": \"MultiplexState\",\
          \"locationName\": \"state\",\
          \"documentation\": \"The current state of the multiplex.\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for DeleteMultiplexResponse\"\
    },\
    \"DeleteReservationRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ReservationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"reservationId\",\
          \"documentation\": \"Unique reservation ID, e.g. '1234567'\"\
        }\
      },\
      \"required\": [\
        \"ReservationId\"\
      ],\
      \"documentation\": \"Placeholder documentation for DeleteReservationRequest\"\
    },\
    \"DeleteReservationResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"Unique reservation ARN, e.g. 'arn:aws:medialive:us-west-2:123456789012:reservation:1234567'\"\
        },\
        \"Count\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"count\",\
          \"documentation\": \"Number of reserved resources\"\
        },\
        \"CurrencyCode\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"currencyCode\",\
          \"documentation\": \"Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'\"\
        },\
        \"Duration\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"duration\",\
          \"documentation\": \"Lease duration, e.g. '12'\"\
        },\
        \"DurationUnits\": {\
          \"shape\": \"OfferingDurationUnits\",\
          \"locationName\": \"durationUnits\",\
          \"documentation\": \"Units for duration, e.g. 'MONTHS'\"\
        },\
        \"End\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"end\",\
          \"documentation\": \"Reservation UTC end date and time in ISO-8601 format, e.g. '2019-03-01T00:00:00'\"\
        },\
        \"FixedPrice\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"fixedPrice\",\
          \"documentation\": \"One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT offering\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"User specified reservation name\"\
        },\
        \"OfferingDescription\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"offeringDescription\",\
          \"documentation\": \"Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and standard VQ in US West (Oregon)'\"\
        },\
        \"OfferingId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"offeringId\",\
          \"documentation\": \"Unique offering ID, e.g. '87654321'\"\
        },\
        \"OfferingType\": {\
          \"shape\": \"OfferingType\",\
          \"locationName\": \"offeringType\",\
          \"documentation\": \"Offering type, e.g. 'NO_UPFRONT'\"\
        },\
        \"Region\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"region\",\
          \"documentation\": \"AWS region, e.g. 'us-west-2'\"\
        },\
        \"ReservationId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"reservationId\",\
          \"documentation\": \"Unique reservation ID, e.g. '1234567'\"\
        },\
        \"ResourceSpecification\": {\
          \"shape\": \"ReservationResourceSpecification\",\
          \"locationName\": \"resourceSpecification\",\
          \"documentation\": \"Resource configuration details\"\
        },\
        \"Start\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"start\",\
          \"documentation\": \"Reservation UTC start date and time in ISO-8601 format, e.g. '2018-03-01T00:00:00'\"\
        },\
        \"State\": {\
          \"shape\": \"ReservationState\",\
          \"locationName\": \"state\",\
          \"documentation\": \"Current state of reservation, e.g. 'ACTIVE'\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs\"\
        },\
        \"UsagePrice\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"usagePrice\",\
          \"documentation\": \"Recurring usage charge for each reserved resource, e.g. '157.0'\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for DeleteReservationResponse\"\
    },\
    \"DeleteScheduleRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"channelId\",\
          \"documentation\": \"Id of the channel whose schedule is being deleted.\"\
        }\
      },\
      \"required\": [\
        \"ChannelId\"\
      ],\
      \"documentation\": \"Placeholder documentation for DeleteScheduleRequest\"\
    },\
    \"DeleteScheduleResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Placeholder documentation for DeleteScheduleResponse\"\
    },\
    \"DeleteTagsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ResourceArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"resource-arn\"\
        },\
        \"TagKeys\": {\
          \"shape\": \"__listOf__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"tagKeys\",\
          \"documentation\": \"An array of tag keys to delete\"\
        }\
      },\
      \"required\": [\
        \"TagKeys\",\
        \"ResourceArn\"\
      ],\
      \"documentation\": \"Placeholder documentation for DeleteTagsRequest\"\
    },\
    \"DescribeChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"channelId\",\
          \"documentation\": \"channel ID\"\
        }\
      },\
      \"required\": [\
        \"ChannelId\"\
      ],\
      \"documentation\": \"Placeholder documentation for DescribeChannelRequest\"\
    },\
    \"DescribeChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"The unique arn of the channel.\"\
        },\
        \"ChannelClass\": {\
          \"shape\": \"ChannelClass\",\
          \"locationName\": \"channelClass\",\
          \"documentation\": \"The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfOutputDestination\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"A list of destinations of the channel. For UDP outputs, there is one\\ndestination per output. For other types (HLS, for example), there is\\none destination per packager.\\n\"\
        },\
        \"EgressEndpoints\": {\
          \"shape\": \"__listOfChannelEgressEndpoint\",\
          \"locationName\": \"egressEndpoints\",\
          \"documentation\": \"The endpoints where outgoing connections initiate from\"\
        },\
        \"EncoderSettings\": {\
          \"shape\": \"EncoderSettings\",\
          \"locationName\": \"encoderSettings\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id\",\
          \"documentation\": \"The unique id of the channel.\"\
        },\
        \"InputAttachments\": {\
          \"shape\": \"__listOfInputAttachment\",\
          \"locationName\": \"inputAttachments\",\
          \"documentation\": \"List of input attachments for channel.\"\
        },\
        \"InputSpecification\": {\
          \"shape\": \"InputSpecification\",\
          \"locationName\": \"inputSpecification\"\
        },\
        \"LogLevel\": {\
          \"shape\": \"LogLevel\",\
          \"locationName\": \"logLevel\",\
          \"documentation\": \"The log level being written to CloudWatch Logs.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The name of the channel. (user-mutable)\"\
        },\
        \"PipelineDetails\": {\
          \"shape\": \"__listOfPipelineDetail\",\
          \"locationName\": \"pipelineDetails\",\
          \"documentation\": \"Runtime details for the pipelines of a running channel.\"\
        },\
        \"PipelinesRunningCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"pipelinesRunningCount\",\
          \"documentation\": \"The number of currently healthy pipelines.\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"roleArn\",\
          \"documentation\": \"The Amazon Resource Name (ARN) of the role assumed when running the Channel.\"\
        },\
        \"State\": {\
          \"shape\": \"ChannelState\",\
          \"locationName\": \"state\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for DescribeChannelResponse\"\
    },\
    \"DescribeInputRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InputId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"inputId\",\
          \"documentation\": \"Unique ID of the input\"\
        }\
      },\
      \"required\": [\
        \"InputId\"\
      ],\
      \"documentation\": \"Placeholder documentation for DescribeInputRequest\"\
    },\
    \"DescribeInputResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"The Unique ARN of the input (generated, immutable).\"\
        },\
        \"AttachedChannels\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"attachedChannels\",\
          \"documentation\": \"A list of channel IDs that that input is attached to (currently an input can only be attached to one channel).\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfInputDestination\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"A list of the destinations of the input (PUSH-type).\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id\",\
          \"documentation\": \"The generated ID of the input (unique for user account, immutable).\"\
        },\
        \"InputClass\": {\
          \"shape\": \"InputClass\",\
          \"locationName\": \"inputClass\",\
          \"documentation\": \"STANDARD - MediaLive expects two sources to be connected to this input. If the channel is also STANDARD, both sources will be ingested. If the channel is SINGLE_PIPELINE, only the first source will be ingested; the second source will always be ignored, even if the first source fails.\\nSINGLE_PIPELINE - You can connect only one source to this input. If the ChannelClass is also  SINGLE_PIPELINE, this value is valid. If the ChannelClass is STANDARD, this value is not valid because the channel requires two sources in the input.\\n\"\
        },\
        \"InputSourceType\": {\
          \"shape\": \"InputSourceType\",\
          \"locationName\": \"inputSourceType\",\
          \"documentation\": \"Certain pull input sources can be dynamic, meaning that they can have their URL's dynamically changes\\nduring input switch actions. Presently, this functionality only works with MP4_FILE inputs.\\n\"\
        },\
        \"MediaConnectFlows\": {\
          \"shape\": \"__listOfMediaConnectFlow\",\
          \"locationName\": \"mediaConnectFlows\",\
          \"documentation\": \"A list of MediaConnect Flows for this input.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The user-assigned name (This is a mutable value).\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"roleArn\",\
          \"documentation\": \"The Amazon Resource Name (ARN) of the role this input assumes during and after creation.\"\
        },\
        \"SecurityGroups\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"securityGroups\",\
          \"documentation\": \"A list of IDs for all the Input Security Groups attached to the input.\"\
        },\
        \"Sources\": {\
          \"shape\": \"__listOfInputSource\",\
          \"locationName\": \"sources\",\
          \"documentation\": \"A list of the sources of the input (PULL-type).\"\
        },\
        \"State\": {\
          \"shape\": \"InputState\",\
          \"locationName\": \"state\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        },\
        \"Type\": {\
          \"shape\": \"InputType\",\
          \"locationName\": \"type\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for DescribeInputResponse\"\
    },\
    \"DescribeInputSecurityGroupRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InputSecurityGroupId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"inputSecurityGroupId\",\
          \"documentation\": \"The id of the Input Security Group to describe\"\
        }\
      },\
      \"required\": [\
        \"InputSecurityGroupId\"\
      ],\
      \"documentation\": \"Placeholder documentation for DescribeInputSecurityGroupRequest\"\
    },\
    \"DescribeInputSecurityGroupResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"Unique ARN of Input Security Group\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id\",\
          \"documentation\": \"The Id of the Input Security Group\"\
        },\
        \"Inputs\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"inputs\",\
          \"documentation\": \"The list of inputs currently using this Input Security Group.\"\
        },\
        \"State\": {\
          \"shape\": \"InputSecurityGroupState\",\
          \"locationName\": \"state\",\
          \"documentation\": \"The current state of the Input Security Group.\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        },\
        \"WhitelistRules\": {\
          \"shape\": \"__listOfInputWhitelistRule\",\
          \"locationName\": \"whitelistRules\",\
          \"documentation\": \"Whitelist rules and their sync status\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for DescribeInputSecurityGroupResponse\"\
    },\
    \"DescribeMultiplexProgramRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"multiplexId\",\
          \"documentation\": \"The ID of the multiplex that the program belongs to.\"\
        },\
        \"ProgramName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"programName\",\
          \"documentation\": \"The name of the program.\"\
        }\
      },\
      \"required\": [\
        \"MultiplexId\",\
        \"ProgramName\"\
      ],\
      \"documentation\": \"Placeholder documentation for DescribeMultiplexProgramRequest\"\
    },\
    \"DescribeMultiplexProgramResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"channelId\",\
          \"documentation\": \"The MediaLive channel associated with the program.\"\
        },\
        \"MultiplexProgramSettings\": {\
          \"shape\": \"MultiplexProgramSettings\",\
          \"locationName\": \"multiplexProgramSettings\",\
          \"documentation\": \"The settings for this multiplex program.\"\
        },\
        \"PacketIdentifiersMap\": {\
          \"shape\": \"MultiplexProgramPacketIdentifiersMap\",\
          \"locationName\": \"packetIdentifiersMap\",\
          \"documentation\": \"The packet identifier map for this multiplex program.\"\
        },\
        \"ProgramName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"programName\",\
          \"documentation\": \"The name of the multiplex program.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for DescribeMultiplexProgramResponse\"\
    },\
    \"DescribeMultiplexRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"multiplexId\",\
          \"documentation\": \"The ID of the multiplex.\"\
        }\
      },\
      \"required\": [\
        \"MultiplexId\"\
      ],\
      \"documentation\": \"Placeholder documentation for DescribeMultiplexRequest\"\
    },\
    \"DescribeMultiplexResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"The unique arn of the multiplex.\"\
        },\
        \"AvailabilityZones\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"availabilityZones\",\
          \"documentation\": \"A list of availability zones for the multiplex.\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfMultiplexOutputDestination\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"A list of the multiplex output destinations.\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id\",\
          \"documentation\": \"The unique id of the multiplex.\"\
        },\
        \"MultiplexSettings\": {\
          \"shape\": \"MultiplexSettings\",\
          \"locationName\": \"multiplexSettings\",\
          \"documentation\": \"Configuration for a multiplex event.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The name of the multiplex.\"\
        },\
        \"PipelinesRunningCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"pipelinesRunningCount\",\
          \"documentation\": \"The number of currently healthy pipelines.\"\
        },\
        \"ProgramCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"programCount\",\
          \"documentation\": \"The number of programs in the multiplex.\"\
        },\
        \"State\": {\
          \"shape\": \"MultiplexState\",\
          \"locationName\": \"state\",\
          \"documentation\": \"The current state of the multiplex.\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for DescribeMultiplexResponse\"\
    },\
    \"DescribeOfferingRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"OfferingId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"offeringId\",\
          \"documentation\": \"Unique offering ID, e.g. '87654321'\"\
        }\
      },\
      \"required\": [\
        \"OfferingId\"\
      ],\
      \"documentation\": \"Placeholder documentation for DescribeOfferingRequest\"\
    },\
    \"DescribeOfferingResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"Unique offering ARN, e.g. 'arn:aws:medialive:us-west-2:123456789012:offering:87654321'\"\
        },\
        \"CurrencyCode\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"currencyCode\",\
          \"documentation\": \"Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'\"\
        },\
        \"Duration\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"duration\",\
          \"documentation\": \"Lease duration, e.g. '12'\"\
        },\
        \"DurationUnits\": {\
          \"shape\": \"OfferingDurationUnits\",\
          \"locationName\": \"durationUnits\",\
          \"documentation\": \"Units for duration, e.g. 'MONTHS'\"\
        },\
        \"FixedPrice\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"fixedPrice\",\
          \"documentation\": \"One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT offering\"\
        },\
        \"OfferingDescription\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"offeringDescription\",\
          \"documentation\": \"Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and standard VQ in US West (Oregon)'\"\
        },\
        \"OfferingId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"offeringId\",\
          \"documentation\": \"Unique offering ID, e.g. '87654321'\"\
        },\
        \"OfferingType\": {\
          \"shape\": \"OfferingType\",\
          \"locationName\": \"offeringType\",\
          \"documentation\": \"Offering type, e.g. 'NO_UPFRONT'\"\
        },\
        \"Region\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"region\",\
          \"documentation\": \"AWS region, e.g. 'us-west-2'\"\
        },\
        \"ResourceSpecification\": {\
          \"shape\": \"ReservationResourceSpecification\",\
          \"locationName\": \"resourceSpecification\",\
          \"documentation\": \"Resource configuration details\"\
        },\
        \"UsagePrice\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"usagePrice\",\
          \"documentation\": \"Recurring usage charge for each reserved resource, e.g. '157.0'\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for DescribeOfferingResponse\"\
    },\
    \"DescribeReservationRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ReservationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"reservationId\",\
          \"documentation\": \"Unique reservation ID, e.g. '1234567'\"\
        }\
      },\
      \"required\": [\
        \"ReservationId\"\
      ],\
      \"documentation\": \"Placeholder documentation for DescribeReservationRequest\"\
    },\
    \"DescribeReservationResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"Unique reservation ARN, e.g. 'arn:aws:medialive:us-west-2:123456789012:reservation:1234567'\"\
        },\
        \"Count\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"count\",\
          \"documentation\": \"Number of reserved resources\"\
        },\
        \"CurrencyCode\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"currencyCode\",\
          \"documentation\": \"Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'\"\
        },\
        \"Duration\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"duration\",\
          \"documentation\": \"Lease duration, e.g. '12'\"\
        },\
        \"DurationUnits\": {\
          \"shape\": \"OfferingDurationUnits\",\
          \"locationName\": \"durationUnits\",\
          \"documentation\": \"Units for duration, e.g. 'MONTHS'\"\
        },\
        \"End\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"end\",\
          \"documentation\": \"Reservation UTC end date and time in ISO-8601 format, e.g. '2019-03-01T00:00:00'\"\
        },\
        \"FixedPrice\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"fixedPrice\",\
          \"documentation\": \"One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT offering\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"User specified reservation name\"\
        },\
        \"OfferingDescription\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"offeringDescription\",\
          \"documentation\": \"Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and standard VQ in US West (Oregon)'\"\
        },\
        \"OfferingId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"offeringId\",\
          \"documentation\": \"Unique offering ID, e.g. '87654321'\"\
        },\
        \"OfferingType\": {\
          \"shape\": \"OfferingType\",\
          \"locationName\": \"offeringType\",\
          \"documentation\": \"Offering type, e.g. 'NO_UPFRONT'\"\
        },\
        \"Region\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"region\",\
          \"documentation\": \"AWS region, e.g. 'us-west-2'\"\
        },\
        \"ReservationId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"reservationId\",\
          \"documentation\": \"Unique reservation ID, e.g. '1234567'\"\
        },\
        \"ResourceSpecification\": {\
          \"shape\": \"ReservationResourceSpecification\",\
          \"locationName\": \"resourceSpecification\",\
          \"documentation\": \"Resource configuration details\"\
        },\
        \"Start\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"start\",\
          \"documentation\": \"Reservation UTC start date and time in ISO-8601 format, e.g. '2018-03-01T00:00:00'\"\
        },\
        \"State\": {\
          \"shape\": \"ReservationState\",\
          \"locationName\": \"state\",\
          \"documentation\": \"Current state of reservation, e.g. 'ACTIVE'\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs\"\
        },\
        \"UsagePrice\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"usagePrice\",\
          \"documentation\": \"Recurring usage charge for each reserved resource, e.g. '157.0'\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for DescribeReservationResponse\"\
    },\
    \"DescribeScheduleRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"channelId\",\
          \"documentation\": \"Id of the channel whose schedule is being updated.\"\
        },\
        \"MaxResults\": {\
          \"shape\": \"MaxResults\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maxResults\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\"\
        }\
      },\
      \"required\": [\
        \"ChannelId\"\
      ],\
      \"documentation\": \"Placeholder documentation for DescribeScheduleRequest\"\
    },\
    \"DescribeScheduleResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"The next token; for use in pagination.\"\
        },\
        \"ScheduleActions\": {\
          \"shape\": \"__listOfScheduleAction\",\
          \"locationName\": \"scheduleActions\",\
          \"documentation\": \"The list of actions in the schedule.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for DescribeScheduleResponse\"\
    },\
    \"DvbNitSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NetworkId\": {\
          \"shape\": \"__integerMin0Max65536\",\
          \"locationName\": \"networkId\",\
          \"documentation\": \"The numeric value placed in the Network Information Table (NIT).\"\
        },\
        \"NetworkName\": {\
          \"shape\": \"__stringMin1Max256\",\
          \"locationName\": \"networkName\",\
          \"documentation\": \"The network name text placed in the networkNameDescriptor inside the Network Information Table. Maximum length is 256 characters.\"\
        },\
        \"RepInterval\": {\
          \"shape\": \"__integerMin25Max10000\",\
          \"locationName\": \"repInterval\",\
          \"documentation\": \"The number of milliseconds between instances of this table in the output transport stream.\"\
        }\
      },\
      \"documentation\": \"DVB Network Information Table (NIT)\",\
      \"required\": [\
        \"NetworkName\",\
        \"NetworkId\"\
      ]\
    },\
    \"DvbSdtOutputSdt\": {\
      \"type\": \"string\",\
      \"documentation\": \"Dvb Sdt Output Sdt\",\
      \"enum\": [\
        \"SDT_FOLLOW\",\
        \"SDT_FOLLOW_IF_PRESENT\",\
        \"SDT_MANUAL\",\
        \"SDT_NONE\"\
      ]\
    },\
    \"DvbSdtSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"OutputSdt\": {\
          \"shape\": \"DvbSdtOutputSdt\",\
          \"locationName\": \"outputSdt\",\
          \"documentation\": \"Selects method of inserting SDT information into output stream. The sdtFollow setting copies SDT information from input stream to output stream. The sdtFollowIfPresent setting copies SDT information from input stream to output stream if SDT information is present in the input, otherwise it will fall back on the user-defined values. The sdtManual setting means user will enter the SDT information. The sdtNone setting means output stream will not contain SDT information.\"\
        },\
        \"RepInterval\": {\
          \"shape\": \"__integerMin25Max2000\",\
          \"locationName\": \"repInterval\",\
          \"documentation\": \"The number of milliseconds between instances of this table in the output transport stream.\"\
        },\
        \"ServiceName\": {\
          \"shape\": \"__stringMin1Max256\",\
          \"locationName\": \"serviceName\",\
          \"documentation\": \"The service name placed in the serviceDescriptor in the Service Description Table. Maximum length is 256 characters.\"\
        },\
        \"ServiceProviderName\": {\
          \"shape\": \"__stringMin1Max256\",\
          \"locationName\": \"serviceProviderName\",\
          \"documentation\": \"The service provider name placed in the serviceDescriptor in the Service Description Table. Maximum length is 256 characters.\"\
        }\
      },\
      \"documentation\": \"DVB Service Description Table (SDT)\"\
    },\
    \"DvbSubDestinationAlignment\": {\
      \"type\": \"string\",\
      \"documentation\": \"Dvb Sub Destination Alignment\",\
      \"enum\": [\
        \"CENTERED\",\
        \"LEFT\",\
        \"SMART\"\
      ]\
    },\
    \"DvbSubDestinationBackgroundColor\": {\
      \"type\": \"string\",\
      \"documentation\": \"Dvb Sub Destination Background Color\",\
      \"enum\": [\
        \"BLACK\",\
        \"NONE\",\
        \"WHITE\"\
      ]\
    },\
    \"DvbSubDestinationFontColor\": {\
      \"type\": \"string\",\
      \"documentation\": \"Dvb Sub Destination Font Color\",\
      \"enum\": [\
        \"BLACK\",\
        \"BLUE\",\
        \"GREEN\",\
        \"RED\",\
        \"WHITE\",\
        \"YELLOW\"\
      ]\
    },\
    \"DvbSubDestinationOutlineColor\": {\
      \"type\": \"string\",\
      \"documentation\": \"Dvb Sub Destination Outline Color\",\
      \"enum\": [\
        \"BLACK\",\
        \"BLUE\",\
        \"GREEN\",\
        \"RED\",\
        \"WHITE\",\
        \"YELLOW\"\
      ]\
    },\
    \"DvbSubDestinationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Alignment\": {\
          \"shape\": \"DvbSubDestinationAlignment\",\
          \"locationName\": \"alignment\",\
          \"documentation\": \"If no explicit xPosition or yPosition is provided, setting alignment to centered will place the captions at the bottom center of the output. Similarly, setting a left alignment will align captions to the bottom left of the output. If x and y positions are given in conjunction with the alignment parameter, the font will be justified (either left or centered) relative to those coordinates. Selecting \\\"smart\\\" justification will left-justify live subtitles and center-justify pre-recorded subtitles.  This option is not valid for source captions that are STL or 608/embedded.  These source settings are already pre-defined by the caption stream.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"BackgroundColor\": {\
          \"shape\": \"DvbSubDestinationBackgroundColor\",\
          \"locationName\": \"backgroundColor\",\
          \"documentation\": \"Specifies the color of the rectangle behind the captions.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"BackgroundOpacity\": {\
          \"shape\": \"__integerMin0Max255\",\
          \"locationName\": \"backgroundOpacity\",\
          \"documentation\": \"Specifies the opacity of the background rectangle. 255 is opaque; 0 is transparent. Leaving this parameter blank is equivalent to setting it to 0 (transparent).  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"Font\": {\
          \"shape\": \"InputLocation\",\
          \"locationName\": \"font\",\
          \"documentation\": \"External font file used for caption burn-in. File extension must be 'ttf' or 'tte'.  Although the user can select output fonts for many different types of input captions, embedded, STL and teletext sources use a strict grid system. Using external fonts with these caption sources could cause unexpected display of proportional fonts.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"FontColor\": {\
          \"shape\": \"DvbSubDestinationFontColor\",\
          \"locationName\": \"fontColor\",\
          \"documentation\": \"Specifies the color of the burned-in captions.  This option is not valid for source captions that are STL, 608/embedded or teletext.  These source settings are already pre-defined by the caption stream.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"FontOpacity\": {\
          \"shape\": \"__integerMin0Max255\",\
          \"locationName\": \"fontOpacity\",\
          \"documentation\": \"Specifies the opacity of the burned-in captions. 255 is opaque; 0 is transparent.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"FontResolution\": {\
          \"shape\": \"__integerMin96Max600\",\
          \"locationName\": \"fontResolution\",\
          \"documentation\": \"Font resolution in DPI (dots per inch); default is 96 dpi.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"FontSize\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"fontSize\",\
          \"documentation\": \"When set to auto fontSize will scale depending on the size of the output.  Giving a positive integer will specify the exact font size in points.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"OutlineColor\": {\
          \"shape\": \"DvbSubDestinationOutlineColor\",\
          \"locationName\": \"outlineColor\",\
          \"documentation\": \"Specifies font outline color. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"OutlineSize\": {\
          \"shape\": \"__integerMin0Max10\",\
          \"locationName\": \"outlineSize\",\
          \"documentation\": \"Specifies font outline size in pixels. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"ShadowColor\": {\
          \"shape\": \"DvbSubDestinationShadowColor\",\
          \"locationName\": \"shadowColor\",\
          \"documentation\": \"Specifies the color of the shadow cast by the captions.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"ShadowOpacity\": {\
          \"shape\": \"__integerMin0Max255\",\
          \"locationName\": \"shadowOpacity\",\
          \"documentation\": \"Specifies the opacity of the shadow. 255 is opaque; 0 is transparent. Leaving this parameter blank is equivalent to setting it to 0 (transparent).  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"ShadowXOffset\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"shadowXOffset\",\
          \"documentation\": \"Specifies the horizontal offset of the shadow relative to the captions in pixels. A value of -2 would result in a shadow offset 2 pixels to the left.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"ShadowYOffset\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"shadowYOffset\",\
          \"documentation\": \"Specifies the vertical offset of the shadow relative to the captions in pixels. A value of -2 would result in a shadow offset 2 pixels above the text.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"TeletextGridControl\": {\
          \"shape\": \"DvbSubDestinationTeletextGridControl\",\
          \"locationName\": \"teletextGridControl\",\
          \"documentation\": \"Controls whether a fixed grid size will be used to generate the output subtitles bitmap. Only applicable for Teletext inputs and DVB-Sub/Burn-in outputs.\"\
        },\
        \"XPosition\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"xPosition\",\
          \"documentation\": \"Specifies the horizontal position of the caption relative to the left side of the output in pixels. A value of 10 would result in the captions starting 10 pixels from the left of the output. If no explicit xPosition is provided, the horizontal caption position will be determined by the alignment parameter.  This option is not valid for source captions that are STL, 608/embedded or teletext. These source settings are already pre-defined by the caption stream.  All burn-in and DVB-Sub font settings must match.\"\
        },\
        \"YPosition\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"yPosition\",\
          \"documentation\": \"Specifies the vertical position of the caption relative to the top of the output in pixels. A value of 10 would result in the captions starting 10 pixels from the top of the output. If no explicit yPosition is provided, the caption will be positioned towards the bottom of the output.  This option is not valid for source captions that are STL, 608/embedded or teletext.  These source settings are already pre-defined by the caption stream.  All burn-in and DVB-Sub font settings must match.\"\
        }\
      },\
      \"documentation\": \"Dvb Sub Destination Settings\"\
    },\
    \"DvbSubDestinationShadowColor\": {\
      \"type\": \"string\",\
      \"documentation\": \"Dvb Sub Destination Shadow Color\",\
      \"enum\": [\
        \"BLACK\",\
        \"NONE\",\
        \"WHITE\"\
      ]\
    },\
    \"DvbSubDestinationTeletextGridControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"Dvb Sub Destination Teletext Grid Control\",\
      \"enum\": [\
        \"FIXED\",\
        \"SCALED\"\
      ]\
    },\
    \"DvbSubSourceSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Pid\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"pid\",\
          \"documentation\": \"When using DVB-Sub with Burn-In or SMPTE-TT, use this PID for the source content. Unused for DVB-Sub passthrough. All DVB-Sub content is passed through, regardless of selectors.\"\
        }\
      },\
      \"documentation\": \"Dvb Sub Source Settings\"\
    },\
    \"DvbTdtSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"RepInterval\": {\
          \"shape\": \"__integerMin1000Max30000\",\
          \"locationName\": \"repInterval\",\
          \"documentation\": \"The number of milliseconds between instances of this table in the output transport stream.\"\
        }\
      },\
      \"documentation\": \"DVB Time and Date Table (SDT)\"\
    },\
    \"Eac3AttenuationControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"Eac3 Attenuation Control\",\
      \"enum\": [\
        \"ATTENUATE_3_DB\",\
        \"NONE\"\
      ]\
    },\
    \"Eac3BitstreamMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Eac3 Bitstream Mode\",\
      \"enum\": [\
        \"COMMENTARY\",\
        \"COMPLETE_MAIN\",\
        \"EMERGENCY\",\
        \"HEARING_IMPAIRED\",\
        \"VISUALLY_IMPAIRED\"\
      ]\
    },\
    \"Eac3CodingMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Eac3 Coding Mode\",\
      \"enum\": [\
        \"CODING_MODE_1_0\",\
        \"CODING_MODE_2_0\",\
        \"CODING_MODE_3_2\"\
      ]\
    },\
    \"Eac3DcFilter\": {\
      \"type\": \"string\",\
      \"documentation\": \"Eac3 Dc Filter\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"Eac3DrcLine\": {\
      \"type\": \"string\",\
      \"documentation\": \"Eac3 Drc Line\",\
      \"enum\": [\
        \"FILM_LIGHT\",\
        \"FILM_STANDARD\",\
        \"MUSIC_LIGHT\",\
        \"MUSIC_STANDARD\",\
        \"NONE\",\
        \"SPEECH\"\
      ]\
    },\
    \"Eac3DrcRf\": {\
      \"type\": \"string\",\
      \"documentation\": \"Eac3 Drc Rf\",\
      \"enum\": [\
        \"FILM_LIGHT\",\
        \"FILM_STANDARD\",\
        \"MUSIC_LIGHT\",\
        \"MUSIC_STANDARD\",\
        \"NONE\",\
        \"SPEECH\"\
      ]\
    },\
    \"Eac3LfeControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"Eac3 Lfe Control\",\
      \"enum\": [\
        \"LFE\",\
        \"NO_LFE\"\
      ]\
    },\
    \"Eac3LfeFilter\": {\
      \"type\": \"string\",\
      \"documentation\": \"Eac3 Lfe Filter\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"Eac3MetadataControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"Eac3 Metadata Control\",\
      \"enum\": [\
        \"FOLLOW_INPUT\",\
        \"USE_CONFIGURED\"\
      ]\
    },\
    \"Eac3PassthroughControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"Eac3 Passthrough Control\",\
      \"enum\": [\
        \"NO_PASSTHROUGH\",\
        \"WHEN_POSSIBLE\"\
      ]\
    },\
    \"Eac3PhaseControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"Eac3 Phase Control\",\
      \"enum\": [\
        \"NO_SHIFT\",\
        \"SHIFT_90_DEGREES\"\
      ]\
    },\
    \"Eac3Settings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AttenuationControl\": {\
          \"shape\": \"Eac3AttenuationControl\",\
          \"locationName\": \"attenuationControl\",\
          \"documentation\": \"When set to attenuate3Db, applies a 3 dB attenuation to the surround channels. Only used for 3/2 coding mode.\"\
        },\
        \"Bitrate\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"bitrate\",\
          \"documentation\": \"Average bitrate in bits/second. Valid bitrates depend on the coding mode.\"\
        },\
        \"BitstreamMode\": {\
          \"shape\": \"Eac3BitstreamMode\",\
          \"locationName\": \"bitstreamMode\",\
          \"documentation\": \"Specifies the bitstream mode (bsmod) for the emitted E-AC-3 stream. See ATSC A/52-2012 (Annex E) for background on these values.\"\
        },\
        \"CodingMode\": {\
          \"shape\": \"Eac3CodingMode\",\
          \"locationName\": \"codingMode\",\
          \"documentation\": \"Dolby Digital Plus coding mode. Determines number of channels.\"\
        },\
        \"DcFilter\": {\
          \"shape\": \"Eac3DcFilter\",\
          \"locationName\": \"dcFilter\",\
          \"documentation\": \"When set to enabled, activates a DC highpass filter for all input channels.\"\
        },\
        \"Dialnorm\": {\
          \"shape\": \"__integerMin1Max31\",\
          \"locationName\": \"dialnorm\",\
          \"documentation\": \"Sets the dialnorm for the output. If blank and input audio is Dolby Digital Plus, dialnorm will be passed through.\"\
        },\
        \"DrcLine\": {\
          \"shape\": \"Eac3DrcLine\",\
          \"locationName\": \"drcLine\",\
          \"documentation\": \"Sets the Dolby dynamic range compression profile.\"\
        },\
        \"DrcRf\": {\
          \"shape\": \"Eac3DrcRf\",\
          \"locationName\": \"drcRf\",\
          \"documentation\": \"Sets the profile for heavy Dolby dynamic range compression, ensures that the instantaneous signal peaks do not exceed specified levels.\"\
        },\
        \"LfeControl\": {\
          \"shape\": \"Eac3LfeControl\",\
          \"locationName\": \"lfeControl\",\
          \"documentation\": \"When encoding 3/2 audio, setting to lfe enables the LFE channel\"\
        },\
        \"LfeFilter\": {\
          \"shape\": \"Eac3LfeFilter\",\
          \"locationName\": \"lfeFilter\",\
          \"documentation\": \"When set to enabled, applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only valid with codingMode32 coding mode.\"\
        },\
        \"LoRoCenterMixLevel\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"loRoCenterMixLevel\",\
          \"documentation\": \"Left only/Right only center mix level. Only used for 3/2 coding mode.\"\
        },\
        \"LoRoSurroundMixLevel\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"loRoSurroundMixLevel\",\
          \"documentation\": \"Left only/Right only surround mix level. Only used for 3/2 coding mode.\"\
        },\
        \"LtRtCenterMixLevel\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"ltRtCenterMixLevel\",\
          \"documentation\": \"Left total/Right total center mix level. Only used for 3/2 coding mode.\"\
        },\
        \"LtRtSurroundMixLevel\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"ltRtSurroundMixLevel\",\
          \"documentation\": \"Left total/Right total surround mix level. Only used for 3/2 coding mode.\"\
        },\
        \"MetadataControl\": {\
          \"shape\": \"Eac3MetadataControl\",\
          \"locationName\": \"metadataControl\",\
          \"documentation\": \"When set to followInput, encoder metadata will be sourced from the DD, DD+, or DolbyE decoder that supplied this audio data. If audio was not supplied from one of these streams, then the static metadata settings will be used.\"\
        },\
        \"PassthroughControl\": {\
          \"shape\": \"Eac3PassthroughControl\",\
          \"locationName\": \"passthroughControl\",\
          \"documentation\": \"When set to whenPossible, input DD+ audio will be passed through if it is present on the input. This detection is dynamic over the life of the transcode. Inputs that alternate between DD+ and non-DD+ content will have a consistent DD+ output as the system alternates between passthrough and encoding.\"\
        },\
        \"PhaseControl\": {\
          \"shape\": \"Eac3PhaseControl\",\
          \"locationName\": \"phaseControl\",\
          \"documentation\": \"When set to shift90Degrees, applies a 90-degree phase shift to the surround channels. Only used for 3/2 coding mode.\"\
        },\
        \"StereoDownmix\": {\
          \"shape\": \"Eac3StereoDownmix\",\
          \"locationName\": \"stereoDownmix\",\
          \"documentation\": \"Stereo downmix preference. Only used for 3/2 coding mode.\"\
        },\
        \"SurroundExMode\": {\
          \"shape\": \"Eac3SurroundExMode\",\
          \"locationName\": \"surroundExMode\",\
          \"documentation\": \"When encoding 3/2 audio, sets whether an extra center back surround channel is matrix encoded into the left and right surround channels.\"\
        },\
        \"SurroundMode\": {\
          \"shape\": \"Eac3SurroundMode\",\
          \"locationName\": \"surroundMode\",\
          \"documentation\": \"When encoding 2/0 audio, sets whether Dolby Surround is matrix encoded into the two channels.\"\
        }\
      },\
      \"documentation\": \"Eac3 Settings\"\
    },\
    \"Eac3StereoDownmix\": {\
      \"type\": \"string\",\
      \"documentation\": \"Eac3 Stereo Downmix\",\
      \"enum\": [\
        \"DPL2\",\
        \"LO_RO\",\
        \"LT_RT\",\
        \"NOT_INDICATED\"\
      ]\
    },\
    \"Eac3SurroundExMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Eac3 Surround Ex Mode\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\",\
        \"NOT_INDICATED\"\
      ]\
    },\
    \"Eac3SurroundMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Eac3 Surround Mode\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\",\
        \"NOT_INDICATED\"\
      ]\
    },\
    \"EmbeddedConvert608To708\": {\
      \"type\": \"string\",\
      \"documentation\": \"Embedded Convert608 To708\",\
      \"enum\": [\
        \"DISABLED\",\
        \"UPCONVERT\"\
      ]\
    },\
    \"EmbeddedDestinationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Embedded Destination Settings\"\
    },\
    \"EmbeddedPlusScte20DestinationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Embedded Plus Scte20 Destination Settings\"\
    },\
    \"EmbeddedScte20Detection\": {\
      \"type\": \"string\",\
      \"documentation\": \"Embedded Scte20 Detection\",\
      \"enum\": [\
        \"AUTO\",\
        \"OFF\"\
      ]\
    },\
    \"EmbeddedSourceSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Convert608To708\": {\
          \"shape\": \"EmbeddedConvert608To708\",\
          \"locationName\": \"convert608To708\",\
          \"documentation\": \"If upconvert, 608 data is both passed through via the \\\"608 compatibility bytes\\\" fields of the 708 wrapper as well as translated into 708. 708 data present in the source content will be discarded.\"\
        },\
        \"Scte20Detection\": {\
          \"shape\": \"EmbeddedScte20Detection\",\
          \"locationName\": \"scte20Detection\",\
          \"documentation\": \"Set to \\\"auto\\\" to handle streams with intermittent and/or non-aligned SCTE-20 and Embedded captions.\"\
        },\
        \"Source608ChannelNumber\": {\
          \"shape\": \"__integerMin1Max4\",\
          \"locationName\": \"source608ChannelNumber\",\
          \"documentation\": \"Specifies the 608/708 channel number within the video track from which to extract captions. Unused for passthrough.\"\
        },\
        \"Source608TrackNumber\": {\
          \"shape\": \"__integerMin1Max5\",\
          \"locationName\": \"source608TrackNumber\",\
          \"documentation\": \"This field is unused and deprecated.\"\
        }\
      },\
      \"documentation\": \"Embedded Source Settings\"\
    },\
    \"Empty\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Placeholder documentation for Empty\"\
    },\
    \"EncoderSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AudioDescriptions\": {\
          \"shape\": \"__listOfAudioDescription\",\
          \"locationName\": \"audioDescriptions\"\
        },\
        \"AvailBlanking\": {\
          \"shape\": \"AvailBlanking\",\
          \"locationName\": \"availBlanking\",\
          \"documentation\": \"Settings for ad avail blanking.\"\
        },\
        \"AvailConfiguration\": {\
          \"shape\": \"AvailConfiguration\",\
          \"locationName\": \"availConfiguration\",\
          \"documentation\": \"Event-wide configuration settings for ad avail insertion.\"\
        },\
        \"BlackoutSlate\": {\
          \"shape\": \"BlackoutSlate\",\
          \"locationName\": \"blackoutSlate\",\
          \"documentation\": \"Settings for blackout slate.\"\
        },\
        \"CaptionDescriptions\": {\
          \"shape\": \"__listOfCaptionDescription\",\
          \"locationName\": \"captionDescriptions\",\
          \"documentation\": \"Settings for caption decriptions\"\
        },\
        \"GlobalConfiguration\": {\
          \"shape\": \"GlobalConfiguration\",\
          \"locationName\": \"globalConfiguration\",\
          \"documentation\": \"Configuration settings that apply to the event as a whole.\"\
        },\
        \"NielsenConfiguration\": {\
          \"shape\": \"NielsenConfiguration\",\
          \"locationName\": \"nielsenConfiguration\",\
          \"documentation\": \"Nielsen configuration settings.\"\
        },\
        \"OutputGroups\": {\
          \"shape\": \"__listOfOutputGroup\",\
          \"locationName\": \"outputGroups\"\
        },\
        \"TimecodeConfig\": {\
          \"shape\": \"TimecodeConfig\",\
          \"locationName\": \"timecodeConfig\",\
          \"documentation\": \"Contains settings used to acquire and adjust timecode information from inputs.\"\
        },\
        \"VideoDescriptions\": {\
          \"shape\": \"__listOfVideoDescription\",\
          \"locationName\": \"videoDescriptions\"\
        }\
      },\
      \"documentation\": \"Encoder Settings\",\
      \"required\": [\
        \"VideoDescriptions\",\
        \"AudioDescriptions\",\
        \"OutputGroups\",\
        \"TimecodeConfig\"\
      ]\
    },\
    \"FecOutputIncludeFec\": {\
      \"type\": \"string\",\
      \"documentation\": \"Fec Output Include Fec\",\
      \"enum\": [\
        \"COLUMN\",\
        \"COLUMN_AND_ROW\"\
      ]\
    },\
    \"FecOutputSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ColumnDepth\": {\
          \"shape\": \"__integerMin4Max20\",\
          \"locationName\": \"columnDepth\",\
          \"documentation\": \"Parameter D from SMPTE 2022-1. The height of the FEC protection matrix.  The number of transport stream packets per column error correction packet. Must be between 4 and 20, inclusive.\"\
        },\
        \"IncludeFec\": {\
          \"shape\": \"FecOutputIncludeFec\",\
          \"locationName\": \"includeFec\",\
          \"documentation\": \"Enables column only or column and row based FEC\"\
        },\
        \"RowLength\": {\
          \"shape\": \"__integerMin1Max20\",\
          \"locationName\": \"rowLength\",\
          \"documentation\": \"Parameter L from SMPTE 2022-1. The width of the FEC protection matrix.  Must be between 1 and 20, inclusive. If only Column FEC is used, then larger values increase robustness.  If Row FEC is used, then this is the number of transport stream packets per row error correction packet, and the value must be between 4 and 20, inclusive, if includeFec is columnAndRow. If includeFec is column, this value must be 1 to 20, inclusive.\"\
        }\
      },\
      \"documentation\": \"Fec Output Settings\"\
    },\
    \"FixedAfd\": {\
      \"type\": \"string\",\
      \"documentation\": \"Fixed Afd\",\
      \"enum\": [\
        \"AFD_0000\",\
        \"AFD_0010\",\
        \"AFD_0011\",\
        \"AFD_0100\",\
        \"AFD_1000\",\
        \"AFD_1001\",\
        \"AFD_1010\",\
        \"AFD_1011\",\
        \"AFD_1101\",\
        \"AFD_1110\",\
        \"AFD_1111\"\
      ]\
    },\
    \"FixedModeScheduleActionStartSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Time\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"time\",\
          \"documentation\": \"Start time for the action to start in the channel. (Not the time for the action to be added to the schedule: actions are always added to the schedule immediately.) UTC format: yyyy-mm-ddThh:mm:ss.nnnZ. All the letters are digits (for example, mm might be 01) except for the two constants \\\"T\\\" for time and \\\"Z\\\" for \\\"UTC format\\\".\"\
        }\
      },\
      \"documentation\": \"Start time for the action.\",\
      \"required\": [\
        \"Time\"\
      ]\
    },\
    \"Fmp4HlsSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AudioRenditionSets\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"audioRenditionSets\",\
          \"documentation\": \"List all the audio groups that are used with the video output stream. Input all the audio GROUP-IDs that are associated to the video, separate by ','.\"\
        },\
        \"NielsenId3Behavior\": {\
          \"shape\": \"Fmp4NielsenId3Behavior\",\
          \"locationName\": \"nielsenId3Behavior\",\
          \"documentation\": \"If set to passthrough, Nielsen inaudible tones for media tracking will be detected in the input audio and an equivalent ID3 tag will be inserted in the output.\"\
        },\
        \"TimedMetadataBehavior\": {\
          \"shape\": \"Fmp4TimedMetadataBehavior\",\
          \"locationName\": \"timedMetadataBehavior\",\
          \"documentation\": \"When set to passthrough, timed metadata is passed through from input to output.\"\
        }\
      },\
      \"documentation\": \"Fmp4 Hls Settings\"\
    },\
    \"Fmp4NielsenId3Behavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"Fmp4 Nielsen Id3 Behavior\",\
      \"enum\": [\
        \"NO_PASSTHROUGH\",\
        \"PASSTHROUGH\"\
      ]\
    },\
    \"Fmp4TimedMetadataBehavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"Fmp4 Timed Metadata Behavior\",\
      \"enum\": [\
        \"NO_PASSTHROUGH\",\
        \"PASSTHROUGH\"\
      ]\
    },\
    \"FollowModeScheduleActionStartSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"FollowPoint\": {\
          \"shape\": \"FollowPoint\",\
          \"locationName\": \"followPoint\",\
          \"documentation\": \"Identifies whether this action starts relative to the start or relative to the end of the reference action.\"\
        },\
        \"ReferenceActionName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"referenceActionName\",\
          \"documentation\": \"The action name of another action that this one refers to.\"\
        }\
      },\
      \"documentation\": \"Settings to specify if an action follows another.\",\
      \"required\": [\
        \"ReferenceActionName\",\
        \"FollowPoint\"\
      ]\
    },\
    \"FollowPoint\": {\
      \"type\": \"string\",\
      \"documentation\": \"Follow reference point.\",\
      \"enum\": [\
        \"END\",\
        \"START\"\
      ]\
    },\
    \"ForbiddenException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\"\
        }\
      },\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 403\
      },\
      \"documentation\": \"Placeholder documentation for ForbiddenException\"\
    },\
    \"FrameCaptureGroupSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Destination\": {\
          \"shape\": \"OutputLocationRef\",\
          \"locationName\": \"destination\",\
          \"documentation\": \"The destination for the frame capture files. Either the URI for an Amazon S3 bucket and object, plus a file name prefix (for example, s3ssl://sportsDelivery/highlights/20180820/curling_) or the URI for a MediaStore container, plus a file name prefix (for example, mediastoressl://sportsDelivery/20180820/curling_). The final file names consist of the prefix from the destination field (for example, \\\"curling_\\\") + name modifier + the counter (5 digits, starting from 00001) + extension (which is always .jpg).  For example, curlingLow.00001.jpg\"\
        }\
      },\
      \"documentation\": \"Frame Capture Group Settings\",\
      \"required\": [\
        \"Destination\"\
      ]\
    },\
    \"FrameCaptureIntervalUnit\": {\
      \"type\": \"string\",\
      \"documentation\": \"Frame Capture Interval Unit\",\
      \"enum\": [\
        \"MILLISECONDS\",\
        \"SECONDS\"\
      ]\
    },\
    \"FrameCaptureOutputSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NameModifier\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nameModifier\",\
          \"documentation\": \"Required if the output group contains more than one output. This modifier forms part of the output file name.\"\
        }\
      },\
      \"documentation\": \"Frame Capture Output Settings\"\
    },\
    \"FrameCaptureSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CaptureInterval\": {\
          \"shape\": \"__integerMin1Max3600000\",\
          \"locationName\": \"captureInterval\",\
          \"documentation\": \"The frequency at which to capture frames for inclusion in the output. May be specified in either seconds or milliseconds, as specified by captureIntervalUnits.\"\
        },\
        \"CaptureIntervalUnits\": {\
          \"shape\": \"FrameCaptureIntervalUnit\",\
          \"locationName\": \"captureIntervalUnits\",\
          \"documentation\": \"Unit for the frame capture interval.\"\
        }\
      },\
      \"documentation\": \"Frame Capture Settings\",\
      \"required\": [\
        \"CaptureInterval\"\
      ]\
    },\
    \"GatewayTimeoutException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\"\
        }\
      },\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 504\
      },\
      \"documentation\": \"Placeholder documentation for GatewayTimeoutException\"\
    },\
    \"GlobalConfiguration\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InitialAudioGain\": {\
          \"shape\": \"__integerMinNegative60Max60\",\
          \"locationName\": \"initialAudioGain\",\
          \"documentation\": \"Value to set the initial audio gain for the Live Event.\"\
        },\
        \"InputEndAction\": {\
          \"shape\": \"GlobalConfigurationInputEndAction\",\
          \"locationName\": \"inputEndAction\",\
          \"documentation\": \"Indicates the action to take when the current input completes (e.g. end-of-file). When switchAndLoopInputs is configured the encoder will restart at the beginning of the first input.  When \\\"none\\\" is configured the encoder will transcode either black, a solid color, or a user specified slate images per the \\\"Input Loss Behavior\\\" configuration until the next input switch occurs (which is controlled through the Channel Schedule API).\"\
        },\
        \"InputLossBehavior\": {\
          \"shape\": \"InputLossBehavior\",\
          \"locationName\": \"inputLossBehavior\",\
          \"documentation\": \"Settings for system actions when input is lost.\"\
        },\
        \"OutputLockingMode\": {\
          \"shape\": \"GlobalConfigurationOutputLockingMode\",\
          \"locationName\": \"outputLockingMode\",\
          \"documentation\": \"Indicates how MediaLive pipelines are synchronized.\\n\\nPIPELINELOCKING - MediaLive will attempt to synchronize the output of each pipeline to the other.\\nEPOCHLOCKING - MediaLive will attempt to synchronize the output of each pipeline to the Unix epoch.\"\
        },\
        \"OutputTimingSource\": {\
          \"shape\": \"GlobalConfigurationOutputTimingSource\",\
          \"locationName\": \"outputTimingSource\",\
          \"documentation\": \"Indicates whether the rate of frames emitted by the Live encoder should be paced by its system clock (which optionally may be locked to another source via NTP) or should be locked to the clock of the source that is providing the input stream.\"\
        },\
        \"SupportLowFramerateInputs\": {\
          \"shape\": \"GlobalConfigurationLowFramerateInputs\",\
          \"locationName\": \"supportLowFramerateInputs\",\
          \"documentation\": \"Adjusts video input buffer for streams with very low video framerates. This is commonly set to enabled for music channels with less than one video frame per second.\"\
        }\
      },\
      \"documentation\": \"Global Configuration\"\
    },\
    \"GlobalConfigurationInputEndAction\": {\
      \"type\": \"string\",\
      \"documentation\": \"Global Configuration Input End Action\",\
      \"enum\": [\
        \"NONE\",\
        \"SWITCH_AND_LOOP_INPUTS\"\
      ]\
    },\
    \"GlobalConfigurationLowFramerateInputs\": {\
      \"type\": \"string\",\
      \"documentation\": \"Global Configuration Low Framerate Inputs\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"GlobalConfigurationOutputLockingMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Global Configuration Output Locking Mode\",\
      \"enum\": [\
        \"EPOCH_LOCKING\",\
        \"PIPELINE_LOCKING\"\
      ]\
    },\
    \"GlobalConfigurationOutputTimingSource\": {\
      \"type\": \"string\",\
      \"documentation\": \"Global Configuration Output Timing Source\",\
      \"enum\": [\
        \"INPUT_CLOCK\",\
        \"SYSTEM_CLOCK\"\
      ]\
    },\
    \"H264AdaptiveQuantization\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Adaptive Quantization\",\
      \"enum\": [\
        \"HIGH\",\
        \"HIGHER\",\
        \"LOW\",\
        \"MAX\",\
        \"MEDIUM\",\
        \"OFF\"\
      ]\
    },\
    \"H264ColorMetadata\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Color Metadata\",\
      \"enum\": [\
        \"IGNORE\",\
        \"INSERT\"\
      ]\
    },\
    \"H264ColorSpaceSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ColorSpacePassthroughSettings\": {\
          \"shape\": \"ColorSpacePassthroughSettings\",\
          \"locationName\": \"colorSpacePassthroughSettings\"\
        },\
        \"Rec601Settings\": {\
          \"shape\": \"Rec601Settings\",\
          \"locationName\": \"rec601Settings\"\
        },\
        \"Rec709Settings\": {\
          \"shape\": \"Rec709Settings\",\
          \"locationName\": \"rec709Settings\"\
        }\
      },\
      \"documentation\": \"H264 Color Space Settings\"\
    },\
    \"H264EntropyEncoding\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Entropy Encoding\",\
      \"enum\": [\
        \"CABAC\",\
        \"CAVLC\"\
      ]\
    },\
    \"H264FilterSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TemporalFilterSettings\": {\
          \"shape\": \"TemporalFilterSettings\",\
          \"locationName\": \"temporalFilterSettings\"\
        }\
      },\
      \"documentation\": \"H264 Filter Settings\"\
    },\
    \"H264FlickerAq\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Flicker Aq\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"H264ForceFieldPictures\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Force Field Pictures\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"H264FramerateControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Framerate Control\",\
      \"enum\": [\
        \"INITIALIZE_FROM_SOURCE\",\
        \"SPECIFIED\"\
      ]\
    },\
    \"H264GopBReference\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Gop BReference\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"H264GopSizeUnits\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Gop Size Units\",\
      \"enum\": [\
        \"FRAMES\",\
        \"SECONDS\"\
      ]\
    },\
    \"H264Level\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Level\",\
      \"enum\": [\
        \"H264_LEVEL_1\",\
        \"H264_LEVEL_1_1\",\
        \"H264_LEVEL_1_2\",\
        \"H264_LEVEL_1_3\",\
        \"H264_LEVEL_2\",\
        \"H264_LEVEL_2_1\",\
        \"H264_LEVEL_2_2\",\
        \"H264_LEVEL_3\",\
        \"H264_LEVEL_3_1\",\
        \"H264_LEVEL_3_2\",\
        \"H264_LEVEL_4\",\
        \"H264_LEVEL_4_1\",\
        \"H264_LEVEL_4_2\",\
        \"H264_LEVEL_5\",\
        \"H264_LEVEL_5_1\",\
        \"H264_LEVEL_5_2\",\
        \"H264_LEVEL_AUTO\"\
      ]\
    },\
    \"H264LookAheadRateControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Look Ahead Rate Control\",\
      \"enum\": [\
        \"HIGH\",\
        \"LOW\",\
        \"MEDIUM\"\
      ]\
    },\
    \"H264ParControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Par Control\",\
      \"enum\": [\
        \"INITIALIZE_FROM_SOURCE\",\
        \"SPECIFIED\"\
      ]\
    },\
    \"H264Profile\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Profile\",\
      \"enum\": [\
        \"BASELINE\",\
        \"HIGH\",\
        \"HIGH_10BIT\",\
        \"HIGH_422\",\
        \"HIGH_422_10BIT\",\
        \"MAIN\"\
      ]\
    },\
    \"H264QualityLevel\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Quality Level\",\
      \"enum\": [\
        \"ENHANCED_QUALITY\",\
        \"STANDARD_QUALITY\"\
      ]\
    },\
    \"H264RateControlMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Rate Control Mode\",\
      \"enum\": [\
        \"CBR\",\
        \"MULTIPLEX\",\
        \"QVBR\",\
        \"VBR\"\
      ]\
    },\
    \"H264ScanType\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Scan Type\",\
      \"enum\": [\
        \"INTERLACED\",\
        \"PROGRESSIVE\"\
      ]\
    },\
    \"H264SceneChangeDetect\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Scene Change Detect\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"H264Settings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AdaptiveQuantization\": {\
          \"shape\": \"H264AdaptiveQuantization\",\
          \"locationName\": \"adaptiveQuantization\",\
          \"documentation\": \"Adaptive quantization. Allows intra-frame quantizers to vary to improve visual quality.\"\
        },\
        \"AfdSignaling\": {\
          \"shape\": \"AfdSignaling\",\
          \"locationName\": \"afdSignaling\",\
          \"documentation\": \"Indicates that AFD values will be written into the output stream.  If afdSignaling is \\\"auto\\\", the system will try to preserve the input AFD value (in cases where multiple AFD values are valid). If set to \\\"fixed\\\", the AFD value will be the value configured in the fixedAfd parameter.\"\
        },\
        \"Bitrate\": {\
          \"shape\": \"__integerMin1000\",\
          \"locationName\": \"bitrate\",\
          \"documentation\": \"Average bitrate in bits/second. Required when the rate control mode is VBR or CBR. Not used for QVBR. In an MS Smooth output group, each output must have a unique value when its bitrate is rounded down to the nearest multiple of 1000.\"\
        },\
        \"BufFillPct\": {\
          \"shape\": \"__integerMin0Max100\",\
          \"locationName\": \"bufFillPct\",\
          \"documentation\": \"Percentage of the buffer that should initially be filled (HRD buffer model).\"\
        },\
        \"BufSize\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"bufSize\",\
          \"documentation\": \"Size of buffer (HRD buffer model) in bits.\"\
        },\
        \"ColorMetadata\": {\
          \"shape\": \"H264ColorMetadata\",\
          \"locationName\": \"colorMetadata\",\
          \"documentation\": \"Includes colorspace metadata in the output.\"\
        },\
        \"ColorSpaceSettings\": {\
          \"shape\": \"H264ColorSpaceSettings\",\
          \"locationName\": \"colorSpaceSettings\",\
          \"documentation\": \"Color Space settings\"\
        },\
        \"EntropyEncoding\": {\
          \"shape\": \"H264EntropyEncoding\",\
          \"locationName\": \"entropyEncoding\",\
          \"documentation\": \"Entropy encoding mode.  Use cabac (must be in Main or High profile) or cavlc.\"\
        },\
        \"FilterSettings\": {\
          \"shape\": \"H264FilterSettings\",\
          \"locationName\": \"filterSettings\",\
          \"documentation\": \"Settings associated with the specified filter.\"\
        },\
        \"FixedAfd\": {\
          \"shape\": \"FixedAfd\",\
          \"locationName\": \"fixedAfd\",\
          \"documentation\": \"Four bit AFD value to write on all frames of video in the output stream. Only valid when afdSignaling is set to 'Fixed'.\"\
        },\
        \"FlickerAq\": {\
          \"shape\": \"H264FlickerAq\",\
          \"locationName\": \"flickerAq\",\
          \"documentation\": \"If set to enabled, adjust quantization within each frame to reduce flicker or 'pop' on I-frames.\"\
        },\
        \"ForceFieldPictures\": {\
          \"shape\": \"H264ForceFieldPictures\",\
          \"locationName\": \"forceFieldPictures\",\
          \"documentation\": \"This setting applies only when scan type is \\\"interlaced.\\\" It controls whether coding is performed on a field basis or on a frame basis. (When the video is progressive, the coding is always performed on a frame basis.)\\nenabled: Force MediaLive to code on a field basis, so that odd and even sets of fields are coded separately.\\ndisabled: Code the two sets of fields separately (on a field basis) or together (on a frame basis using PAFF), depending on what is most appropriate for the content.\"\
        },\
        \"FramerateControl\": {\
          \"shape\": \"H264FramerateControl\",\
          \"locationName\": \"framerateControl\",\
          \"documentation\": \"This field indicates how the output video frame rate is specified.  If \\\"specified\\\" is selected then the output video frame rate is determined by framerateNumerator and framerateDenominator, else if \\\"initializeFromSource\\\" is selected then the output video frame rate will be set equal to the input video frame rate of the first input.\"\
        },\
        \"FramerateDenominator\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"framerateDenominator\",\
          \"documentation\": \"Framerate denominator.\"\
        },\
        \"FramerateNumerator\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"framerateNumerator\",\
          \"documentation\": \"Framerate numerator - framerate is a fraction, e.g. 24000 / 1001 = 23.976 fps.\"\
        },\
        \"GopBReference\": {\
          \"shape\": \"H264GopBReference\",\
          \"locationName\": \"gopBReference\",\
          \"documentation\": \"Documentation update needed\"\
        },\
        \"GopClosedCadence\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"gopClosedCadence\",\
          \"documentation\": \"Frequency of closed GOPs. In streaming applications, it is recommended that this be set to 1 so a decoder joining mid-stream will receive an IDR frame as quickly as possible. Setting this value to 0 will break output segmenting.\"\
        },\
        \"GopNumBFrames\": {\
          \"shape\": \"__integerMin0Max7\",\
          \"locationName\": \"gopNumBFrames\",\
          \"documentation\": \"Number of B-frames between reference frames.\"\
        },\
        \"GopSize\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"gopSize\",\
          \"documentation\": \"GOP size (keyframe interval) in units of either frames or seconds per gopSizeUnits.\\nIf gopSizeUnits is frames, gopSize must be an integer and must be greater than or equal to 1.\\nIf gopSizeUnits is seconds, gopSize must be greater than 0, but need not be an integer.\"\
        },\
        \"GopSizeUnits\": {\
          \"shape\": \"H264GopSizeUnits\",\
          \"locationName\": \"gopSizeUnits\",\
          \"documentation\": \"Indicates if the gopSize is specified in frames or seconds. If seconds the system will convert the gopSize into a frame count at run time.\"\
        },\
        \"Level\": {\
          \"shape\": \"H264Level\",\
          \"locationName\": \"level\",\
          \"documentation\": \"H.264 Level.\"\
        },\
        \"LookAheadRateControl\": {\
          \"shape\": \"H264LookAheadRateControl\",\
          \"locationName\": \"lookAheadRateControl\",\
          \"documentation\": \"Amount of lookahead. A value of low can decrease latency and memory usage, while high can produce better quality for certain content.\"\
        },\
        \"MaxBitrate\": {\
          \"shape\": \"__integerMin1000\",\
          \"locationName\": \"maxBitrate\",\
          \"documentation\": \"For QVBR: See the tooltip for Quality level\\n\\nFor VBR: Set the maximum bitrate in order to accommodate expected spikes in the complexity of the video.\"\
        },\
        \"MinIInterval\": {\
          \"shape\": \"__integerMin0Max30\",\
          \"locationName\": \"minIInterval\",\
          \"documentation\": \"Only meaningful if sceneChangeDetect is set to enabled.  Defaults to 5 if multiplex rate control is used.  Enforces separation between repeated (cadence) I-frames and I-frames inserted by Scene Change Detection. If a scene change I-frame is within I-interval frames of a cadence I-frame, the GOP is shrunk and/or stretched to the scene change I-frame. GOP stretch requires enabling lookahead as well as setting I-interval. The normal cadence resumes for the next GOP. Note: Maximum GOP stretch = GOP size + Min-I-interval - 1\"\
        },\
        \"NumRefFrames\": {\
          \"shape\": \"__integerMin1Max6\",\
          \"locationName\": \"numRefFrames\",\
          \"documentation\": \"Number of reference frames to use. The encoder may use more than requested if using B-frames and/or interlaced encoding.\"\
        },\
        \"ParControl\": {\
          \"shape\": \"H264ParControl\",\
          \"locationName\": \"parControl\",\
          \"documentation\": \"This field indicates how the output pixel aspect ratio is specified.  If \\\"specified\\\" is selected then the output video pixel aspect ratio is determined by parNumerator and parDenominator, else if \\\"initializeFromSource\\\" is selected then the output pixsel aspect ratio will be set equal to the input video pixel aspect ratio of the first input.\"\
        },\
        \"ParDenominator\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"parDenominator\",\
          \"documentation\": \"Pixel Aspect Ratio denominator.\"\
        },\
        \"ParNumerator\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"parNumerator\",\
          \"documentation\": \"Pixel Aspect Ratio numerator.\"\
        },\
        \"Profile\": {\
          \"shape\": \"H264Profile\",\
          \"locationName\": \"profile\",\
          \"documentation\": \"H.264 Profile.\"\
        },\
        \"QualityLevel\": {\
          \"shape\": \"H264QualityLevel\",\
          \"locationName\": \"qualityLevel\",\
          \"documentation\": \"If set to \\\"ENHANCEDQUALITY,\\\" improves visual quality at an increased output cost. If this video is being delivered to a MediaLive Multiplex, \\\"ENHANCEDQUALITY\\\" is always used.\"\
        },\
        \"QvbrQualityLevel\": {\
          \"shape\": \"__integerMin1Max10\",\
          \"locationName\": \"qvbrQualityLevel\",\
          \"documentation\": \"Controls the target quality for the video encode. Applies only when the rate control mode is QVBR. Set values for the QVBR quality level field and Max bitrate field that suit your most important viewing devices. Recommended values are:\\n- Primary screen: Quality level: 8 to 10. Max bitrate: 4M\\n- PC or tablet: Quality level: 7. Max bitrate: 1.5M to 3M\\n- Smartphone: Quality level: 6. Max bitrate: 1M to 1.5M\"\
        },\
        \"RateControlMode\": {\
          \"shape\": \"H264RateControlMode\",\
          \"locationName\": \"rateControlMode\",\
          \"documentation\": \"Rate control mode.\\n\\nQVBR: Quality will match the specified quality level except when it is constrained by the\\nmaximum bitrate.  Recommended if you or your viewers pay for bandwidth.\\n\\nVBR: Quality and bitrate vary, depending on the video complexity. Recommended instead of QVBR\\nif you want to maintain a specific average bitrate over the duration of the channel.\\n\\nCBR: Quality varies, depending on the video complexity. Recommended only if you distribute\\nyour assets to devices that cannot handle variable bitrates.\\n\\nMultiplex: This rate control mode is only supported (and is required) when the video is being\\ndelivered to a MediaLive Multiplex in which case the rate control configuration is controlled\\nby the properties within the Multiplex Program.\"\
        },\
        \"ScanType\": {\
          \"shape\": \"H264ScanType\",\
          \"locationName\": \"scanType\",\
          \"documentation\": \"Sets the scan type of the output to progressive or top-field-first interlaced.\"\
        },\
        \"SceneChangeDetect\": {\
          \"shape\": \"H264SceneChangeDetect\",\
          \"locationName\": \"sceneChangeDetect\",\
          \"documentation\": \"Scene change detection.\\n\\n- On: inserts I-frames when scene change is detected.\\n- Off: does not force an I-frame when scene change is detected.\"\
        },\
        \"Slices\": {\
          \"shape\": \"__integerMin1Max32\",\
          \"locationName\": \"slices\",\
          \"documentation\": \"Number of slices per picture. Must be less than or equal to the number of macroblock rows for progressive pictures, and less than or equal to half the number of macroblock rows for interlaced pictures.\\nThis field is optional; when no value is specified the encoder will choose the number of slices based on encode resolution.\"\
        },\
        \"Softness\": {\
          \"shape\": \"__integerMin0Max128\",\
          \"locationName\": \"softness\",\
          \"documentation\": \"Softness. Selects quantizer matrix, larger values reduce high-frequency content in the encoded image.\"\
        },\
        \"SpatialAq\": {\
          \"shape\": \"H264SpatialAq\",\
          \"locationName\": \"spatialAq\",\
          \"documentation\": \"If set to enabled, adjust quantization within each frame based on spatial variation of content complexity.\"\
        },\
        \"SubgopLength\": {\
          \"shape\": \"H264SubGopLength\",\
          \"locationName\": \"subgopLength\",\
          \"documentation\": \"If set to fixed, use gopNumBFrames B-frames per sub-GOP. If set to dynamic, optimize the number of B-frames used for each sub-GOP to improve visual quality.\"\
        },\
        \"Syntax\": {\
          \"shape\": \"H264Syntax\",\
          \"locationName\": \"syntax\",\
          \"documentation\": \"Produces a bitstream compliant with SMPTE RP-2027.\"\
        },\
        \"TemporalAq\": {\
          \"shape\": \"H264TemporalAq\",\
          \"locationName\": \"temporalAq\",\
          \"documentation\": \"If set to enabled, adjust quantization within each frame based on temporal variation of content complexity.\"\
        },\
        \"TimecodeInsertion\": {\
          \"shape\": \"H264TimecodeInsertionBehavior\",\
          \"locationName\": \"timecodeInsertion\",\
          \"documentation\": \"Determines how timecodes should be inserted into the video elementary stream.\\n- 'disabled': Do not include timecodes\\n- 'picTimingSei': Pass through picture timing SEI messages from the source specified in Timecode Config\"\
        }\
      },\
      \"documentation\": \"H264 Settings\"\
    },\
    \"H264SpatialAq\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Spatial Aq\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"H264SubGopLength\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Sub Gop Length\",\
      \"enum\": [\
        \"DYNAMIC\",\
        \"FIXED\"\
      ]\
    },\
    \"H264Syntax\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Syntax\",\
      \"enum\": [\
        \"DEFAULT\",\
        \"RP2027\"\
      ]\
    },\
    \"H264TemporalAq\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Temporal Aq\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"H264TimecodeInsertionBehavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"H264 Timecode Insertion Behavior\",\
      \"enum\": [\
        \"DISABLED\",\
        \"PIC_TIMING_SEI\"\
      ]\
    },\
    \"H265AdaptiveQuantization\": {\
      \"type\": \"string\",\
      \"documentation\": \"H265 Adaptive Quantization\",\
      \"enum\": [\
        \"HIGH\",\
        \"HIGHER\",\
        \"LOW\",\
        \"MAX\",\
        \"MEDIUM\",\
        \"OFF\"\
      ]\
    },\
    \"H265AlternativeTransferFunction\": {\
      \"type\": \"string\",\
      \"documentation\": \"H265 Alternative Transfer Function\",\
      \"enum\": [\
        \"INSERT\",\
        \"OMIT\"\
      ]\
    },\
    \"H265ColorMetadata\": {\
      \"type\": \"string\",\
      \"documentation\": \"H265 Color Metadata\",\
      \"enum\": [\
        \"IGNORE\",\
        \"INSERT\"\
      ]\
    },\
    \"H265ColorSpaceSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ColorSpacePassthroughSettings\": {\
          \"shape\": \"ColorSpacePassthroughSettings\",\
          \"locationName\": \"colorSpacePassthroughSettings\"\
        },\
        \"Hdr10Settings\": {\
          \"shape\": \"Hdr10Settings\",\
          \"locationName\": \"hdr10Settings\"\
        },\
        \"Rec601Settings\": {\
          \"shape\": \"Rec601Settings\",\
          \"locationName\": \"rec601Settings\"\
        },\
        \"Rec709Settings\": {\
          \"shape\": \"Rec709Settings\",\
          \"locationName\": \"rec709Settings\"\
        }\
      },\
      \"documentation\": \"H265 Color Space Settings\"\
    },\
    \"H265FlickerAq\": {\
      \"type\": \"string\",\
      \"documentation\": \"H265 Flicker Aq\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"H265GopSizeUnits\": {\
      \"type\": \"string\",\
      \"documentation\": \"H265 Gop Size Units\",\
      \"enum\": [\
        \"FRAMES\",\
        \"SECONDS\"\
      ]\
    },\
    \"H265Level\": {\
      \"type\": \"string\",\
      \"documentation\": \"H265 Level\",\
      \"enum\": [\
        \"H265_LEVEL_1\",\
        \"H265_LEVEL_2\",\
        \"H265_LEVEL_2_1\",\
        \"H265_LEVEL_3\",\
        \"H265_LEVEL_3_1\",\
        \"H265_LEVEL_4\",\
        \"H265_LEVEL_4_1\",\
        \"H265_LEVEL_5\",\
        \"H265_LEVEL_5_1\",\
        \"H265_LEVEL_5_2\",\
        \"H265_LEVEL_6\",\
        \"H265_LEVEL_6_1\",\
        \"H265_LEVEL_6_2\",\
        \"H265_LEVEL_AUTO\"\
      ]\
    },\
    \"H265LookAheadRateControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"H265 Look Ahead Rate Control\",\
      \"enum\": [\
        \"HIGH\",\
        \"LOW\",\
        \"MEDIUM\"\
      ]\
    },\
    \"H265Profile\": {\
      \"type\": \"string\",\
      \"documentation\": \"H265 Profile\",\
      \"enum\": [\
        \"MAIN\",\
        \"MAIN_10BIT\"\
      ]\
    },\
    \"H265RateControlMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"H265 Rate Control Mode\",\
      \"enum\": [\
        \"CBR\",\
        \"MULTIPLEX\",\
        \"QVBR\"\
      ]\
    },\
    \"H265ScanType\": {\
      \"type\": \"string\",\
      \"documentation\": \"H265 Scan Type\",\
      \"enum\": [\
        \"PROGRESSIVE\"\
      ]\
    },\
    \"H265SceneChangeDetect\": {\
      \"type\": \"string\",\
      \"documentation\": \"H265 Scene Change Detect\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"H265Settings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AdaptiveQuantization\": {\
          \"shape\": \"H265AdaptiveQuantization\",\
          \"locationName\": \"adaptiveQuantization\",\
          \"documentation\": \"Adaptive quantization. Allows intra-frame quantizers to vary to improve visual quality.\"\
        },\
        \"AfdSignaling\": {\
          \"shape\": \"AfdSignaling\",\
          \"locationName\": \"afdSignaling\",\
          \"documentation\": \"Indicates that AFD values will be written into the output stream.  If afdSignaling is \\\"auto\\\", the system will try to preserve the input AFD value (in cases where multiple AFD values are valid). If set to \\\"fixed\\\", the AFD value will be the value configured in the fixedAfd parameter.\"\
        },\
        \"AlternativeTransferFunction\": {\
          \"shape\": \"H265AlternativeTransferFunction\",\
          \"locationName\": \"alternativeTransferFunction\",\
          \"documentation\": \"Whether or not EML should insert an Alternative Transfer Function SEI message to support backwards compatibility with non-HDR decoders and displays.\"\
        },\
        \"Bitrate\": {\
          \"shape\": \"__integerMin100000Max40000000\",\
          \"locationName\": \"bitrate\",\
          \"documentation\": \"Average bitrate in bits/second. Required when the rate control mode is VBR or CBR. Not used for QVBR. In an MS Smooth output group, each output must have a unique value when its bitrate is rounded down to the nearest multiple of 1000.\"\
        },\
        \"BufSize\": {\
          \"shape\": \"__integerMin100000Max80000000\",\
          \"locationName\": \"bufSize\",\
          \"documentation\": \"Size of buffer (HRD buffer model) in bits.\"\
        },\
        \"ColorMetadata\": {\
          \"shape\": \"H265ColorMetadata\",\
          \"locationName\": \"colorMetadata\",\
          \"documentation\": \"Includes colorspace metadata in the output.\"\
        },\
        \"ColorSpaceSettings\": {\
          \"shape\": \"H265ColorSpaceSettings\",\
          \"locationName\": \"colorSpaceSettings\",\
          \"documentation\": \"Color Space settings\"\
        },\
        \"FixedAfd\": {\
          \"shape\": \"FixedAfd\",\
          \"locationName\": \"fixedAfd\",\
          \"documentation\": \"Four bit AFD value to write on all frames of video in the output stream. Only valid when afdSignaling is set to 'Fixed'.\"\
        },\
        \"FlickerAq\": {\
          \"shape\": \"H265FlickerAq\",\
          \"locationName\": \"flickerAq\",\
          \"documentation\": \"If set to enabled, adjust quantization within each frame to reduce flicker or 'pop' on I-frames.\"\
        },\
        \"FramerateDenominator\": {\
          \"shape\": \"__integerMin1Max3003\",\
          \"locationName\": \"framerateDenominator\",\
          \"documentation\": \"Framerate denominator.\"\
        },\
        \"FramerateNumerator\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"framerateNumerator\",\
          \"documentation\": \"Framerate numerator - framerate is a fraction, e.g. 24000 / 1001 = 23.976 fps.\"\
        },\
        \"GopClosedCadence\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"gopClosedCadence\",\
          \"documentation\": \"Frequency of closed GOPs. In streaming applications, it is recommended that this be set to 1 so a decoder joining mid-stream will receive an IDR frame as quickly as possible. Setting this value to 0 will break output segmenting.\"\
        },\
        \"GopSize\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"gopSize\",\
          \"documentation\": \"GOP size (keyframe interval) in units of either frames or seconds per gopSizeUnits.\\nIf gopSizeUnits is frames, gopSize must be an integer and must be greater than or equal to 1.\\nIf gopSizeUnits is seconds, gopSize must be greater than 0, but need not be an integer.\"\
        },\
        \"GopSizeUnits\": {\
          \"shape\": \"H265GopSizeUnits\",\
          \"locationName\": \"gopSizeUnits\",\
          \"documentation\": \"Indicates if the gopSize is specified in frames or seconds. If seconds the system will convert the gopSize into a frame count at run time.\"\
        },\
        \"Level\": {\
          \"shape\": \"H265Level\",\
          \"locationName\": \"level\",\
          \"documentation\": \"H.265 Level.\"\
        },\
        \"LookAheadRateControl\": {\
          \"shape\": \"H265LookAheadRateControl\",\
          \"locationName\": \"lookAheadRateControl\",\
          \"documentation\": \"Amount of lookahead. A value of low can decrease latency and memory usage, while high can produce better quality for certain content.\"\
        },\
        \"MaxBitrate\": {\
          \"shape\": \"__integerMin100000Max40000000\",\
          \"locationName\": \"maxBitrate\",\
          \"documentation\": \"For QVBR: See the tooltip for Quality level\"\
        },\
        \"MinIInterval\": {\
          \"shape\": \"__integerMin0Max30\",\
          \"locationName\": \"minIInterval\",\
          \"documentation\": \"Only meaningful if sceneChangeDetect is set to enabled.  Defaults to 5 if multiplex rate control is used.  Enforces separation between repeated (cadence) I-frames and I-frames inserted by Scene Change Detection. If a scene change I-frame is within I-interval frames of a cadence I-frame, the GOP is shrunk and/or stretched to the scene change I-frame. GOP stretch requires enabling lookahead as well as setting I-interval. The normal cadence resumes for the next GOP. Note: Maximum GOP stretch = GOP size + Min-I-interval - 1\"\
        },\
        \"ParDenominator\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"parDenominator\",\
          \"documentation\": \"Pixel Aspect Ratio denominator.\"\
        },\
        \"ParNumerator\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"parNumerator\",\
          \"documentation\": \"Pixel Aspect Ratio numerator.\"\
        },\
        \"Profile\": {\
          \"shape\": \"H265Profile\",\
          \"locationName\": \"profile\",\
          \"documentation\": \"H.265 Profile.\"\
        },\
        \"QvbrQualityLevel\": {\
          \"shape\": \"__integerMin1Max10\",\
          \"locationName\": \"qvbrQualityLevel\",\
          \"documentation\": \"Controls the target quality for the video encode. Applies only when the rate control mode is QVBR. Set values for the QVBR quality level field and Max bitrate field that suit your most important viewing devices. Recommended values are:\\n- Primary screen: Quality level: 8 to 10. Max bitrate: 4M\\n- PC or tablet: Quality level: 7. Max bitrate: 1.5M to 3M\\n- Smartphone: Quality level: 6. Max bitrate: 1M to 1.5M\"\
        },\
        \"RateControlMode\": {\
          \"shape\": \"H265RateControlMode\",\
          \"locationName\": \"rateControlMode\",\
          \"documentation\": \"Rate control mode.\\n\\nQVBR: Quality will match the specified quality level except when it is constrained by the\\nmaximum bitrate.  Recommended if you or your viewers pay for bandwidth.\\n\\nCBR: Quality varies, depending on the video complexity. Recommended only if you distribute\\nyour assets to devices that cannot handle variable bitrates.\"\
        },\
        \"ScanType\": {\
          \"shape\": \"H265ScanType\",\
          \"locationName\": \"scanType\",\
          \"documentation\": \"Sets the scan type of the output to progressive or top-field-first interlaced.\"\
        },\
        \"SceneChangeDetect\": {\
          \"shape\": \"H265SceneChangeDetect\",\
          \"locationName\": \"sceneChangeDetect\",\
          \"documentation\": \"Scene change detection.\"\
        },\
        \"Slices\": {\
          \"shape\": \"__integerMin1Max16\",\
          \"locationName\": \"slices\",\
          \"documentation\": \"Number of slices per picture. Must be less than or equal to the number of macroblock rows for progressive pictures, and less than or equal to half the number of macroblock rows for interlaced pictures.\\nThis field is optional; when no value is specified the encoder will choose the number of slices based on encode resolution.\"\
        },\
        \"Tier\": {\
          \"shape\": \"H265Tier\",\
          \"locationName\": \"tier\",\
          \"documentation\": \"H.265 Tier.\"\
        },\
        \"TimecodeInsertion\": {\
          \"shape\": \"H265TimecodeInsertionBehavior\",\
          \"locationName\": \"timecodeInsertion\",\
          \"documentation\": \"Determines how timecodes should be inserted into the video elementary stream.\\n- 'disabled': Do not include timecodes\\n- 'picTimingSei': Pass through picture timing SEI messages from the source specified in Timecode Config\"\
        }\
      },\
      \"documentation\": \"H265 Settings\",\
      \"required\": [\
        \"FramerateNumerator\",\
        \"FramerateDenominator\"\
      ]\
    },\
    \"H265Tier\": {\
      \"type\": \"string\",\
      \"documentation\": \"H265 Tier\",\
      \"enum\": [\
        \"HIGH\",\
        \"MAIN\"\
      ]\
    },\
    \"H265TimecodeInsertionBehavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"H265 Timecode Insertion Behavior\",\
      \"enum\": [\
        \"DISABLED\",\
        \"PIC_TIMING_SEI\"\
      ]\
    },\
    \"Hdr10Settings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MaxCll\": {\
          \"shape\": \"__integerMin0Max32768\",\
          \"locationName\": \"maxCll\",\
          \"documentation\": \"Maximum Content Light Level\\nAn integer metadata value defining the maximum light level, in nits,\\nof any single pixel within an encoded HDR video stream or file.\"\
        },\
        \"MaxFall\": {\
          \"shape\": \"__integerMin0Max32768\",\
          \"locationName\": \"maxFall\",\
          \"documentation\": \"Maximum Frame Average Light Level\\nAn integer metadata value defining the maximum average light level, in nits,\\nfor any single frame within an encoded HDR video stream or file.\"\
        }\
      },\
      \"documentation\": \"Hdr10 Settings\"\
    },\
    \"HlsAdMarkers\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Ad Markers\",\
      \"enum\": [\
        \"ADOBE\",\
        \"ELEMENTAL\",\
        \"ELEMENTAL_SCTE35\"\
      ]\
    },\
    \"HlsAkamaiHttpTransferMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Akamai Http Transfer Mode\",\
      \"enum\": [\
        \"CHUNKED\",\
        \"NON_CHUNKED\"\
      ]\
    },\
    \"HlsAkamaiSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ConnectionRetryInterval\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"connectionRetryInterval\",\
          \"documentation\": \"Number of seconds to wait before retrying connection to the CDN if the connection is lost.\"\
        },\
        \"FilecacheDuration\": {\
          \"shape\": \"__integerMin0Max600\",\
          \"locationName\": \"filecacheDuration\",\
          \"documentation\": \"Size in seconds of file cache for streaming outputs.\"\
        },\
        \"HttpTransferMode\": {\
          \"shape\": \"HlsAkamaiHttpTransferMode\",\
          \"locationName\": \"httpTransferMode\",\
          \"documentation\": \"Specify whether or not to use chunked transfer encoding to Akamai. User should contact Akamai to enable this feature.\"\
        },\
        \"NumRetries\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"numRetries\",\
          \"documentation\": \"Number of retry attempts that will be made before the Live Event is put into an error state.\"\
        },\
        \"RestartDelay\": {\
          \"shape\": \"__integerMin0Max15\",\
          \"locationName\": \"restartDelay\",\
          \"documentation\": \"If a streaming output fails, number of seconds to wait until a restart is initiated. A value of 0 means never restart.\"\
        },\
        \"Salt\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"salt\",\
          \"documentation\": \"Salt for authenticated Akamai.\"\
        },\
        \"Token\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"token\",\
          \"documentation\": \"Token parameter for authenticated akamai. If not specified, _gda_ is used.\"\
        }\
      },\
      \"documentation\": \"Hls Akamai Settings\"\
    },\
    \"HlsBasicPutSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ConnectionRetryInterval\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"connectionRetryInterval\",\
          \"documentation\": \"Number of seconds to wait before retrying connection to the CDN if the connection is lost.\"\
        },\
        \"FilecacheDuration\": {\
          \"shape\": \"__integerMin0Max600\",\
          \"locationName\": \"filecacheDuration\",\
          \"documentation\": \"Size in seconds of file cache for streaming outputs.\"\
        },\
        \"NumRetries\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"numRetries\",\
          \"documentation\": \"Number of retry attempts that will be made before the Live Event is put into an error state.\"\
        },\
        \"RestartDelay\": {\
          \"shape\": \"__integerMin0Max15\",\
          \"locationName\": \"restartDelay\",\
          \"documentation\": \"If a streaming output fails, number of seconds to wait until a restart is initiated. A value of 0 means never restart.\"\
        }\
      },\
      \"documentation\": \"Hls Basic Put Settings\"\
    },\
    \"HlsCaptionLanguageSetting\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Caption Language Setting\",\
      \"enum\": [\
        \"INSERT\",\
        \"NONE\",\
        \"OMIT\"\
      ]\
    },\
    \"HlsCdnSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"HlsAkamaiSettings\": {\
          \"shape\": \"HlsAkamaiSettings\",\
          \"locationName\": \"hlsAkamaiSettings\"\
        },\
        \"HlsBasicPutSettings\": {\
          \"shape\": \"HlsBasicPutSettings\",\
          \"locationName\": \"hlsBasicPutSettings\"\
        },\
        \"HlsMediaStoreSettings\": {\
          \"shape\": \"HlsMediaStoreSettings\",\
          \"locationName\": \"hlsMediaStoreSettings\"\
        },\
        \"HlsWebdavSettings\": {\
          \"shape\": \"HlsWebdavSettings\",\
          \"locationName\": \"hlsWebdavSettings\"\
        }\
      },\
      \"documentation\": \"Hls Cdn Settings\"\
    },\
    \"HlsClientCache\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Client Cache\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"HlsCodecSpecification\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Codec Specification\",\
      \"enum\": [\
        \"RFC_4281\",\
        \"RFC_6381\"\
      ]\
    },\
    \"HlsDirectoryStructure\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Directory Structure\",\
      \"enum\": [\
        \"SINGLE_DIRECTORY\",\
        \"SUBDIRECTORY_PER_STREAM\"\
      ]\
    },\
    \"HlsEncryptionType\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Encryption Type\",\
      \"enum\": [\
        \"AES128\",\
        \"SAMPLE_AES\"\
      ]\
    },\
    \"HlsGroupSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AdMarkers\": {\
          \"shape\": \"__listOfHlsAdMarkers\",\
          \"locationName\": \"adMarkers\",\
          \"documentation\": \"Choose one or more ad marker types to pass SCTE35 signals through to this group of Apple HLS outputs.\"\
        },\
        \"BaseUrlContent\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"baseUrlContent\",\
          \"documentation\": \"A partial URI prefix that will be prepended to each output in the media .m3u8 file. Can be used if base manifest is delivered from a different URL than the main .m3u8 file.\"\
        },\
        \"BaseUrlContent1\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"baseUrlContent1\",\
          \"documentation\": \"Optional. One value per output group.\\n\\nThis field is required only if you are completing Base URL content A, and the downstream system has notified you that the media files for pipeline 1 of all outputs are in a location different from the media files for pipeline 0.\"\
        },\
        \"BaseUrlManifest\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"baseUrlManifest\",\
          \"documentation\": \"A partial URI prefix that will be prepended to each output in the media .m3u8 file. Can be used if base manifest is delivered from a different URL than the main .m3u8 file.\"\
        },\
        \"BaseUrlManifest1\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"baseUrlManifest1\",\
          \"documentation\": \"Optional. One value per output group.\\n\\nComplete this field only if you are completing Base URL manifest A, and the downstream system has notified you that the child manifest files for pipeline 1 of all outputs are in a location different from the child manifest files for pipeline 0.\"\
        },\
        \"CaptionLanguageMappings\": {\
          \"shape\": \"__listOfCaptionLanguageMapping\",\
          \"locationName\": \"captionLanguageMappings\",\
          \"documentation\": \"Mapping of up to 4 caption channels to caption languages.  Is only meaningful if captionLanguageSetting is set to \\\"insert\\\".\"\
        },\
        \"CaptionLanguageSetting\": {\
          \"shape\": \"HlsCaptionLanguageSetting\",\
          \"locationName\": \"captionLanguageSetting\",\
          \"documentation\": \"Applies only to 608 Embedded output captions.\\ninsert: Include CLOSED-CAPTIONS lines in the manifest. Specify at least one language in the CC1 Language Code field. One CLOSED-CAPTION line is added for each Language Code you specify. Make sure to specify the languages in the order in which they appear in the original source (if the source is embedded format) or the order of the caption selectors (if the source is other than embedded). Otherwise, languages in the manifest will not match up properly with the output captions.\\nnone: Include CLOSED-CAPTIONS=NONE line in the manifest.\\nomit: Omit any CLOSED-CAPTIONS line from the manifest.\"\
        },\
        \"ClientCache\": {\
          \"shape\": \"HlsClientCache\",\
          \"locationName\": \"clientCache\",\
          \"documentation\": \"When set to \\\"disabled\\\", sets the #EXT-X-ALLOW-CACHE:no tag in the manifest, which prevents clients from saving media segments for later replay.\"\
        },\
        \"CodecSpecification\": {\
          \"shape\": \"HlsCodecSpecification\",\
          \"locationName\": \"codecSpecification\",\
          \"documentation\": \"Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist generation.\"\
        },\
        \"ConstantIv\": {\
          \"shape\": \"__stringMin32Max32\",\
          \"locationName\": \"constantIv\",\
          \"documentation\": \"For use with encryptionType. This is a 128-bit, 16-byte hex value represented by a 32-character text string. If ivSource is set to \\\"explicit\\\" then this parameter is required and is used as the IV for encryption.\"\
        },\
        \"Destination\": {\
          \"shape\": \"OutputLocationRef\",\
          \"locationName\": \"destination\",\
          \"documentation\": \"A directory or HTTP destination for the HLS segments, manifest files, and encryption keys (if enabled).\"\
        },\
        \"DirectoryStructure\": {\
          \"shape\": \"HlsDirectoryStructure\",\
          \"locationName\": \"directoryStructure\",\
          \"documentation\": \"Place segments in subdirectories.\"\
        },\
        \"EncryptionType\": {\
          \"shape\": \"HlsEncryptionType\",\
          \"locationName\": \"encryptionType\",\
          \"documentation\": \"Encrypts the segments with the given encryption scheme.  Exclude this parameter if no encryption is desired.\"\
        },\
        \"HlsCdnSettings\": {\
          \"shape\": \"HlsCdnSettings\",\
          \"locationName\": \"hlsCdnSettings\",\
          \"documentation\": \"Parameters that control interactions with the CDN.\"\
        },\
        \"HlsId3SegmentTagging\": {\
          \"shape\": \"HlsId3SegmentTaggingState\",\
          \"locationName\": \"hlsId3SegmentTagging\",\
          \"documentation\": \"State of HLS ID3 Segment Tagging\"\
        },\
        \"IFrameOnlyPlaylists\": {\
          \"shape\": \"IFrameOnlyPlaylistType\",\
          \"locationName\": \"iFrameOnlyPlaylists\",\
          \"documentation\": \"DISABLED: Do not create an I-frame-only manifest, but do create the master and media manifests (according to the Output Selection field).\\n\\nSTANDARD: Create an I-frame-only manifest for each output that contains video, as well as the other manifests (according to the Output Selection field). The I-frame manifest contains a #EXT-X-I-FRAMES-ONLY tag to indicate it is I-frame only, and one or more #EXT-X-BYTERANGE entries identifying the I-frame position. For example, #EXT-X-BYTERANGE:160364@1461888\\\"\"\
        },\
        \"IndexNSegments\": {\
          \"shape\": \"__integerMin3\",\
          \"locationName\": \"indexNSegments\",\
          \"documentation\": \"Applies only if Mode field is LIVE. Specifies the maximum number of segments in the media manifest file. After this maximum, older segments are removed from the media manifest. This number must be less than or equal to the Keep Segments field.\"\
        },\
        \"InputLossAction\": {\
          \"shape\": \"InputLossActionForHlsOut\",\
          \"locationName\": \"inputLossAction\",\
          \"documentation\": \"Parameter that control output group behavior on input loss.\"\
        },\
        \"IvInManifest\": {\
          \"shape\": \"HlsIvInManifest\",\
          \"locationName\": \"ivInManifest\",\
          \"documentation\": \"For use with encryptionType. The IV (Initialization Vector) is a 128-bit number used in conjunction with the key for encrypting blocks. If set to \\\"include\\\", IV is listed in the manifest, otherwise the IV is not in the manifest.\"\
        },\
        \"IvSource\": {\
          \"shape\": \"HlsIvSource\",\
          \"locationName\": \"ivSource\",\
          \"documentation\": \"For use with encryptionType. The IV (Initialization Vector) is a 128-bit number used in conjunction with the key for encrypting blocks. If this setting is \\\"followsSegmentNumber\\\", it will cause the IV to change every segment (to match the segment number). If this is set to \\\"explicit\\\", you must enter a constantIv value.\"\
        },\
        \"KeepSegments\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"keepSegments\",\
          \"documentation\": \"Applies only if Mode field is LIVE. Specifies the number of media segments (.ts files) to retain in the destination directory.\"\
        },\
        \"KeyFormat\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"keyFormat\",\
          \"documentation\": \"The value specifies how the key is represented in the resource identified by the URI.  If parameter is absent, an implicit value of \\\"identity\\\" is used.  A reverse DNS string can also be given.\"\
        },\
        \"KeyFormatVersions\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"keyFormatVersions\",\
          \"documentation\": \"Either a single positive integer version value or a slash delimited list of version values (1/2/3).\"\
        },\
        \"KeyProviderSettings\": {\
          \"shape\": \"KeyProviderSettings\",\
          \"locationName\": \"keyProviderSettings\",\
          \"documentation\": \"The key provider settings.\"\
        },\
        \"ManifestCompression\": {\
          \"shape\": \"HlsManifestCompression\",\
          \"locationName\": \"manifestCompression\",\
          \"documentation\": \"When set to gzip, compresses HLS playlist.\"\
        },\
        \"ManifestDurationFormat\": {\
          \"shape\": \"HlsManifestDurationFormat\",\
          \"locationName\": \"manifestDurationFormat\",\
          \"documentation\": \"Indicates whether the output manifest should use floating point or integer values for segment duration.\"\
        },\
        \"MinSegmentLength\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"minSegmentLength\",\
          \"documentation\": \"When set, minimumSegmentLength is enforced by looking ahead and back within the specified range for a nearby avail and extending the segment size if needed.\"\
        },\
        \"Mode\": {\
          \"shape\": \"HlsMode\",\
          \"locationName\": \"mode\",\
          \"documentation\": \"If \\\"vod\\\", all segments are indexed and kept permanently in the destination and manifest. If \\\"live\\\", only the number segments specified in keepSegments and indexNSegments are kept; newer segments replace older segments, which may prevent players from rewinding all the way to the beginning of the event.\\n\\nVOD mode uses HLS EXT-X-PLAYLIST-TYPE of EVENT while the channel is running, converting it to a \\\"VOD\\\" type manifest on completion of the stream.\"\
        },\
        \"OutputSelection\": {\
          \"shape\": \"HlsOutputSelection\",\
          \"locationName\": \"outputSelection\",\
          \"documentation\": \"MANIFESTSANDSEGMENTS: Generates manifests (master manifest, if applicable, and media manifests) for this output group.\\n\\nVARIANTMANIFESTSANDSEGMENTS: Generates media manifests for this output group, but not a master manifest.\\n\\nSEGMENTSONLY: Does not generate any manifests for this output group.\"\
        },\
        \"ProgramDateTime\": {\
          \"shape\": \"HlsProgramDateTime\",\
          \"locationName\": \"programDateTime\",\
          \"documentation\": \"Includes or excludes EXT-X-PROGRAM-DATE-TIME tag in .m3u8 manifest files. The value is calculated as follows: either the program date and time are initialized using the input timecode source, or the time is initialized using the input timecode source and the date is initialized using the timestampOffset.\"\
        },\
        \"ProgramDateTimePeriod\": {\
          \"shape\": \"__integerMin0Max3600\",\
          \"locationName\": \"programDateTimePeriod\",\
          \"documentation\": \"Period of insertion of EXT-X-PROGRAM-DATE-TIME entry, in seconds.\"\
        },\
        \"RedundantManifest\": {\
          \"shape\": \"HlsRedundantManifest\",\
          \"locationName\": \"redundantManifest\",\
          \"documentation\": \"ENABLED: The master manifest (.m3u8 file) for each pipeline includes information about both pipelines: first its own media files, then the media files of the other pipeline. This feature allows playout device that support stale manifest detection to switch from one manifest to the other, when the current manifest seems to be stale. There are still two destinations and two master manifests, but both master manifests reference the media files from both pipelines.\\n\\nDISABLED: The master manifest (.m3u8 file) for each pipeline includes information about its own pipeline only.\\n\\nFor an HLS output group with MediaPackage as the destination, the DISABLED behavior is always followed. MediaPackage regenerates the manifests it serves to players so a redundant manifest from MediaLive is irrelevant.\"\
        },\
        \"SegmentLength\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"segmentLength\",\
          \"documentation\": \"Length of MPEG-2 Transport Stream segments to create (in seconds). Note that segments will end on the next keyframe after this number of seconds, so actual segment length may be longer.\"\
        },\
        \"SegmentationMode\": {\
          \"shape\": \"HlsSegmentationMode\",\
          \"locationName\": \"segmentationMode\",\
          \"documentation\": \"useInputSegmentation has been deprecated. The configured segment size is always used.\"\
        },\
        \"SegmentsPerSubdirectory\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"segmentsPerSubdirectory\",\
          \"documentation\": \"Number of segments to write to a subdirectory before starting a new one. directoryStructure must be subdirectoryPerStream for this setting to have an effect.\"\
        },\
        \"StreamInfResolution\": {\
          \"shape\": \"HlsStreamInfResolution\",\
          \"locationName\": \"streamInfResolution\",\
          \"documentation\": \"Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of variant manifest.\"\
        },\
        \"TimedMetadataId3Frame\": {\
          \"shape\": \"HlsTimedMetadataId3Frame\",\
          \"locationName\": \"timedMetadataId3Frame\",\
          \"documentation\": \"Indicates ID3 frame that has the timecode.\"\
        },\
        \"TimedMetadataId3Period\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"timedMetadataId3Period\",\
          \"documentation\": \"Timed Metadata interval in seconds.\"\
        },\
        \"TimestampDeltaMilliseconds\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"timestampDeltaMilliseconds\",\
          \"documentation\": \"Provides an extra millisecond delta offset to fine tune the timestamps.\"\
        },\
        \"TsFileMode\": {\
          \"shape\": \"HlsTsFileMode\",\
          \"locationName\": \"tsFileMode\",\
          \"documentation\": \"SEGMENTEDFILES: Emit the program as segments - multiple .ts media files.\\n\\nSINGLEFILE: Applies only if Mode field is VOD. Emit the program as a single .ts media file. The media manifest includes #EXT-X-BYTERANGE tags to index segments for playback. A typical use for this value is when sending the output to AWS Elemental MediaConvert, which can accept only a single media file. Playback while the channel is running is not guaranteed due to HTTP server caching.\"\
        }\
      },\
      \"documentation\": \"Hls Group Settings\",\
      \"required\": [\
        \"Destination\"\
      ]\
    },\
    \"HlsH265PackagingType\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls H265 Packaging Type\",\
      \"enum\": [\
        \"HEV1\",\
        \"HVC1\"\
      ]\
    },\
    \"HlsId3SegmentTaggingScheduleActionSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Tag\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"tag\",\
          \"documentation\": \"ID3 tag to insert into each segment. Supports special keyword identifiers to substitute in segment-related values.\\\\nSupported keyword identifiers: https://docs.aws.amazon.com/medialive/latest/ug/variable-data-identifiers.html\"\
        }\
      },\
      \"documentation\": \"Settings for the action to insert a user-defined ID3 tag in each HLS segment\",\
      \"required\": [\
        \"Tag\"\
      ]\
    },\
    \"HlsId3SegmentTaggingState\": {\
      \"type\": \"string\",\
      \"documentation\": \"State of HLS ID3 Segment Tagging\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"HlsInputSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Bandwidth\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"bandwidth\",\
          \"documentation\": \"When specified the HLS stream with the m3u8 BANDWIDTH that most closely matches this value will be chosen, otherwise the highest bandwidth stream in the m3u8 will be chosen.  The bitrate is specified in bits per second, as in an HLS manifest.\"\
        },\
        \"BufferSegments\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"bufferSegments\",\
          \"documentation\": \"When specified, reading of the HLS input will begin this many buffer segments from the end (most recently written segment).  When not specified, the HLS input will begin with the first segment specified in the m3u8.\"\
        },\
        \"Retries\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"retries\",\
          \"documentation\": \"The number of consecutive times that attempts to read a manifest or segment must fail before the input is considered unavailable.\"\
        },\
        \"RetryInterval\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"retryInterval\",\
          \"documentation\": \"The number of seconds between retries when an attempt to read a manifest or segment fails.\"\
        }\
      },\
      \"documentation\": \"Hls Input Settings\"\
    },\
    \"HlsIvInManifest\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Iv In Manifest\",\
      \"enum\": [\
        \"EXCLUDE\",\
        \"INCLUDE\"\
      ]\
    },\
    \"HlsIvSource\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Iv Source\",\
      \"enum\": [\
        \"EXPLICIT\",\
        \"FOLLOWS_SEGMENT_NUMBER\"\
      ]\
    },\
    \"HlsManifestCompression\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Manifest Compression\",\
      \"enum\": [\
        \"GZIP\",\
        \"NONE\"\
      ]\
    },\
    \"HlsManifestDurationFormat\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Manifest Duration Format\",\
      \"enum\": [\
        \"FLOATING_POINT\",\
        \"INTEGER\"\
      ]\
    },\
    \"HlsMediaStoreSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ConnectionRetryInterval\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"connectionRetryInterval\",\
          \"documentation\": \"Number of seconds to wait before retrying connection to the CDN if the connection is lost.\"\
        },\
        \"FilecacheDuration\": {\
          \"shape\": \"__integerMin0Max600\",\
          \"locationName\": \"filecacheDuration\",\
          \"documentation\": \"Size in seconds of file cache for streaming outputs.\"\
        },\
        \"MediaStoreStorageClass\": {\
          \"shape\": \"HlsMediaStoreStorageClass\",\
          \"locationName\": \"mediaStoreStorageClass\",\
          \"documentation\": \"When set to temporal, output files are stored in non-persistent memory for faster reading and writing.\"\
        },\
        \"NumRetries\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"numRetries\",\
          \"documentation\": \"Number of retry attempts that will be made before the Live Event is put into an error state.\"\
        },\
        \"RestartDelay\": {\
          \"shape\": \"__integerMin0Max15\",\
          \"locationName\": \"restartDelay\",\
          \"documentation\": \"If a streaming output fails, number of seconds to wait until a restart is initiated. A value of 0 means never restart.\"\
        }\
      },\
      \"documentation\": \"Hls Media Store Settings\"\
    },\
    \"HlsMediaStoreStorageClass\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Media Store Storage Class\",\
      \"enum\": [\
        \"TEMPORAL\"\
      ]\
    },\
    \"HlsMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Mode\",\
      \"enum\": [\
        \"LIVE\",\
        \"VOD\"\
      ]\
    },\
    \"HlsOutputSelection\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Output Selection\",\
      \"enum\": [\
        \"MANIFESTS_AND_SEGMENTS\",\
        \"SEGMENTS_ONLY\"\
      ]\
    },\
    \"HlsOutputSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"H265PackagingType\": {\
          \"shape\": \"HlsH265PackagingType\",\
          \"locationName\": \"h265PackagingType\",\
          \"documentation\": \"Only applicable when this output is referencing an H.265 video description.\\nSpecifies whether MP4 segments should be packaged as HEV1 or HVC1.\"\
        },\
        \"HlsSettings\": {\
          \"shape\": \"HlsSettings\",\
          \"locationName\": \"hlsSettings\",\
          \"documentation\": \"Settings regarding the underlying stream. These settings are different for audio-only outputs.\"\
        },\
        \"NameModifier\": {\
          \"shape\": \"__stringMin1\",\
          \"locationName\": \"nameModifier\",\
          \"documentation\": \"String concatenated to the end of the destination filename. Accepts \\\\\\\"Format Identifiers\\\\\\\":#formatIdentifierParameters.\"\
        },\
        \"SegmentModifier\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"segmentModifier\",\
          \"documentation\": \"String concatenated to end of segment filenames.\"\
        }\
      },\
      \"documentation\": \"Hls Output Settings\",\
      \"required\": [\
        \"HlsSettings\"\
      ]\
    },\
    \"HlsProgramDateTime\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Program Date Time\",\
      \"enum\": [\
        \"EXCLUDE\",\
        \"INCLUDE\"\
      ]\
    },\
    \"HlsRedundantManifest\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Redundant Manifest\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"HlsSegmentationMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Segmentation Mode\",\
      \"enum\": [\
        \"USE_INPUT_SEGMENTATION\",\
        \"USE_SEGMENT_DURATION\"\
      ]\
    },\
    \"HlsSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AudioOnlyHlsSettings\": {\
          \"shape\": \"AudioOnlyHlsSettings\",\
          \"locationName\": \"audioOnlyHlsSettings\"\
        },\
        \"Fmp4HlsSettings\": {\
          \"shape\": \"Fmp4HlsSettings\",\
          \"locationName\": \"fmp4HlsSettings\"\
        },\
        \"StandardHlsSettings\": {\
          \"shape\": \"StandardHlsSettings\",\
          \"locationName\": \"standardHlsSettings\"\
        }\
      },\
      \"documentation\": \"Hls Settings\"\
    },\
    \"HlsStreamInfResolution\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Stream Inf Resolution\",\
      \"enum\": [\
        \"EXCLUDE\",\
        \"INCLUDE\"\
      ]\
    },\
    \"HlsTimedMetadataId3Frame\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Timed Metadata Id3 Frame\",\
      \"enum\": [\
        \"NONE\",\
        \"PRIV\",\
        \"TDRL\"\
      ]\
    },\
    \"HlsTimedMetadataScheduleActionSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Id3\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id3\",\
          \"documentation\": \"Base64 string formatted according to the ID3 specification: http://id3.org/id3v2.4.0-structure\"\
        }\
      },\
      \"documentation\": \"Settings for the action to emit HLS metadata\",\
      \"required\": [\
        \"Id3\"\
      ]\
    },\
    \"HlsTsFileMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Ts File Mode\",\
      \"enum\": [\
        \"SEGMENTED_FILES\",\
        \"SINGLE_FILE\"\
      ]\
    },\
    \"HlsWebdavHttpTransferMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Hls Webdav Http Transfer Mode\",\
      \"enum\": [\
        \"CHUNKED\",\
        \"NON_CHUNKED\"\
      ]\
    },\
    \"HlsWebdavSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ConnectionRetryInterval\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"connectionRetryInterval\",\
          \"documentation\": \"Number of seconds to wait before retrying connection to the CDN if the connection is lost.\"\
        },\
        \"FilecacheDuration\": {\
          \"shape\": \"__integerMin0Max600\",\
          \"locationName\": \"filecacheDuration\",\
          \"documentation\": \"Size in seconds of file cache for streaming outputs.\"\
        },\
        \"HttpTransferMode\": {\
          \"shape\": \"HlsWebdavHttpTransferMode\",\
          \"locationName\": \"httpTransferMode\",\
          \"documentation\": \"Specify whether or not to use chunked transfer encoding to WebDAV.\"\
        },\
        \"NumRetries\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"numRetries\",\
          \"documentation\": \"Number of retry attempts that will be made before the Live Event is put into an error state.\"\
        },\
        \"RestartDelay\": {\
          \"shape\": \"__integerMin0Max15\",\
          \"locationName\": \"restartDelay\",\
          \"documentation\": \"If a streaming output fails, number of seconds to wait until a restart is initiated. A value of 0 means never restart.\"\
        }\
      },\
      \"documentation\": \"Hls Webdav Settings\"\
    },\
    \"IFrameOnlyPlaylistType\": {\
      \"type\": \"string\",\
      \"documentation\": \"When set to \\\"standard\\\", an I-Frame only playlist will be written out for each video output in the output group. This I-Frame only playlist will contain byte range offsets pointing to the I-frame(s) in each segment.\",\
      \"enum\": [\
        \"DISABLED\",\
        \"STANDARD\"\
      ]\
    },\
    \"ImmediateModeScheduleActionStartSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Settings to configure an action so that it occurs as soon as possible.\"\
    },\
    \"Input\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"The Unique ARN of the input (generated, immutable).\"\
        },\
        \"AttachedChannels\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"attachedChannels\",\
          \"documentation\": \"A list of channel IDs that that input is attached to (currently an input can only be attached to one channel).\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfInputDestination\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"A list of the destinations of the input (PUSH-type).\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id\",\
          \"documentation\": \"The generated ID of the input (unique for user account, immutable).\"\
        },\
        \"InputClass\": {\
          \"shape\": \"InputClass\",\
          \"locationName\": \"inputClass\",\
          \"documentation\": \"STANDARD - MediaLive expects two sources to be connected to this input. If the channel is also STANDARD, both sources will be ingested. If the channel is SINGLE_PIPELINE, only the first source will be ingested; the second source will always be ignored, even if the first source fails.\\nSINGLE_PIPELINE - You can connect only one source to this input. If the ChannelClass is also  SINGLE_PIPELINE, this value is valid. If the ChannelClass is STANDARD, this value is not valid because the channel requires two sources in the input.\\n\"\
        },\
        \"InputSourceType\": {\
          \"shape\": \"InputSourceType\",\
          \"locationName\": \"inputSourceType\",\
          \"documentation\": \"Certain pull input sources can be dynamic, meaning that they can have their URL's dynamically changes\\nduring input switch actions. Presently, this functionality only works with MP4_FILE inputs.\\n\"\
        },\
        \"MediaConnectFlows\": {\
          \"shape\": \"__listOfMediaConnectFlow\",\
          \"locationName\": \"mediaConnectFlows\",\
          \"documentation\": \"A list of MediaConnect Flows for this input.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The user-assigned name (This is a mutable value).\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"roleArn\",\
          \"documentation\": \"The Amazon Resource Name (ARN) of the role this input assumes during and after creation.\"\
        },\
        \"SecurityGroups\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"securityGroups\",\
          \"documentation\": \"A list of IDs for all the Input Security Groups attached to the input.\"\
        },\
        \"Sources\": {\
          \"shape\": \"__listOfInputSource\",\
          \"locationName\": \"sources\",\
          \"documentation\": \"A list of the sources of the input (PULL-type).\"\
        },\
        \"State\": {\
          \"shape\": \"InputState\",\
          \"locationName\": \"state\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        },\
        \"Type\": {\
          \"shape\": \"InputType\",\
          \"locationName\": \"type\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for Input\"\
    },\
    \"InputAttachment\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AutomaticInputFailoverSettings\": {\
          \"shape\": \"AutomaticInputFailoverSettings\",\
          \"locationName\": \"automaticInputFailoverSettings\",\
          \"documentation\": \"User-specified settings for defining what the conditions are for declaring the input unhealthy and failing over to a different input.\"\
        },\
        \"InputAttachmentName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"inputAttachmentName\",\
          \"documentation\": \"User-specified name for the attachment. This is required if the user wants to use this input in an input switch action.\"\
        },\
        \"InputId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"inputId\",\
          \"documentation\": \"The ID of the input\"\
        },\
        \"InputSettings\": {\
          \"shape\": \"InputSettings\",\
          \"locationName\": \"inputSettings\",\
          \"documentation\": \"Settings of an input (caption selector, etc.)\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for InputAttachment\"\
    },\
    \"InputChannelLevel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Gain\": {\
          \"shape\": \"__integerMinNegative60Max6\",\
          \"locationName\": \"gain\",\
          \"documentation\": \"Remixing value. Units are in dB and acceptable values are within the range from -60 (mute) and 6 dB.\"\
        },\
        \"InputChannel\": {\
          \"shape\": \"__integerMin0Max15\",\
          \"locationName\": \"inputChannel\",\
          \"documentation\": \"The index of the input channel used as a source.\"\
        }\
      },\
      \"documentation\": \"Input Channel Level\",\
      \"required\": [\
        \"InputChannel\",\
        \"Gain\"\
      ]\
    },\
    \"InputClass\": {\
      \"type\": \"string\",\
      \"documentation\": \"A standard input has two sources and a single pipeline input only has one.\",\
      \"enum\": [\
        \"STANDARD\",\
        \"SINGLE_PIPELINE\"\
      ]\
    },\
    \"InputClippingSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InputTimecodeSource\": {\
          \"shape\": \"InputTimecodeSource\",\
          \"locationName\": \"inputTimecodeSource\",\
          \"documentation\": \"The source of the timecodes in the source being clipped.\"\
        },\
        \"StartTimecode\": {\
          \"shape\": \"StartTimecode\",\
          \"locationName\": \"startTimecode\",\
          \"documentation\": \"Settings to identify the start of the clip.\"\
        },\
        \"StopTimecode\": {\
          \"shape\": \"StopTimecode\",\
          \"locationName\": \"stopTimecode\",\
          \"documentation\": \"Settings to identify the end of the clip.\"\
        }\
      },\
      \"documentation\": \"Settings to let you create a clip of the file input, in order to set up the input to ingest only a portion of the file.\",\
      \"required\": [\
        \"InputTimecodeSource\"\
      ]\
    },\
    \"InputCodec\": {\
      \"type\": \"string\",\
      \"documentation\": \"codec in increasing order of complexity\",\
      \"enum\": [\
        \"MPEG2\",\
        \"AVC\",\
        \"HEVC\"\
      ]\
    },\
    \"InputDeblockFilter\": {\
      \"type\": \"string\",\
      \"documentation\": \"Input Deblock Filter\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"InputDenoiseFilter\": {\
      \"type\": \"string\",\
      \"documentation\": \"Input Denoise Filter\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"InputDestination\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Ip\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"ip\",\
          \"documentation\": \"The system-generated static IP address of endpoint.\\nIt remains fixed for the lifetime of the input.\\n\"\
        },\
        \"Port\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"port\",\
          \"documentation\": \"The port number for the input.\"\
        },\
        \"Url\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"url\",\
          \"documentation\": \"This represents the endpoint that the customer stream will be\\npushed to.\\n\"\
        },\
        \"Vpc\": {\
          \"shape\": \"InputDestinationVpc\",\
          \"locationName\": \"vpc\"\
        }\
      },\
      \"documentation\": \"The settings for a PUSH type input.\"\
    },\
    \"InputDestinationRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"StreamName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"streamName\",\
          \"documentation\": \"A unique name for the location the RTMP stream is being pushed\\nto.\\n\"\
        }\
      },\
      \"documentation\": \"Endpoint settings for a PUSH type input.\"\
    },\
    \"InputDestinationVpc\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AvailabilityZone\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"availabilityZone\",\
          \"documentation\": \"The availability zone of the Input destination.\\n\"\
        },\
        \"NetworkInterfaceId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"networkInterfaceId\",\
          \"documentation\": \"The network interface ID of the Input destination in the VPC.\\n\"\
        }\
      },\
      \"documentation\": \"The properties for a VPC type input destination.\"\
    },\
    \"InputFilter\": {\
      \"type\": \"string\",\
      \"documentation\": \"Input Filter\",\
      \"enum\": [\
        \"AUTO\",\
        \"DISABLED\",\
        \"FORCED\"\
      ]\
    },\
    \"InputLocation\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"PasswordParam\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"passwordParam\",\
          \"documentation\": \"key used to extract the password from EC2 Parameter store\"\
        },\
        \"Uri\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"uri\",\
          \"documentation\": \"Uniform Resource Identifier - This should be a path to a file accessible to the Live system (eg. a http:// URI) depending on the output type. For example, a RTMP destination should have a uri simliar to: \\\"rtmp://fmsserver/live\\\".\"\
        },\
        \"Username\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"username\",\
          \"documentation\": \"Documentation update needed\"\
        }\
      },\
      \"documentation\": \"Input Location\",\
      \"required\": [\
        \"Uri\"\
      ]\
    },\
    \"InputLossActionForHlsOut\": {\
      \"type\": \"string\",\
      \"documentation\": \"Input Loss Action For Hls Out\",\
      \"enum\": [\
        \"EMIT_OUTPUT\",\
        \"PAUSE_OUTPUT\"\
      ]\
    },\
    \"InputLossActionForMsSmoothOut\": {\
      \"type\": \"string\",\
      \"documentation\": \"Input Loss Action For Ms Smooth Out\",\
      \"enum\": [\
        \"EMIT_OUTPUT\",\
        \"PAUSE_OUTPUT\"\
      ]\
    },\
    \"InputLossActionForRtmpOut\": {\
      \"type\": \"string\",\
      \"documentation\": \"Input Loss Action For Rtmp Out\",\
      \"enum\": [\
        \"EMIT_OUTPUT\",\
        \"PAUSE_OUTPUT\"\
      ]\
    },\
    \"InputLossActionForUdpOut\": {\
      \"type\": \"string\",\
      \"documentation\": \"Input Loss Action For Udp Out\",\
      \"enum\": [\
        \"DROP_PROGRAM\",\
        \"DROP_TS\",\
        \"EMIT_PROGRAM\"\
      ]\
    },\
    \"InputLossBehavior\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BlackFrameMsec\": {\
          \"shape\": \"__integerMin0Max1000000\",\
          \"locationName\": \"blackFrameMsec\",\
          \"documentation\": \"Documentation update needed\"\
        },\
        \"InputLossImageColor\": {\
          \"shape\": \"__stringMin6Max6\",\
          \"locationName\": \"inputLossImageColor\",\
          \"documentation\": \"When input loss image type is \\\"color\\\" this field specifies the color to use. Value: 6 hex characters representing the values of RGB.\"\
        },\
        \"InputLossImageSlate\": {\
          \"shape\": \"InputLocation\",\
          \"locationName\": \"inputLossImageSlate\",\
          \"documentation\": \"When input loss image type is \\\"slate\\\" these fields specify the parameters for accessing the slate.\"\
        },\
        \"InputLossImageType\": {\
          \"shape\": \"InputLossImageType\",\
          \"locationName\": \"inputLossImageType\",\
          \"documentation\": \"Indicates whether to substitute a solid color or a slate into the output after input loss exceeds blackFrameMsec.\"\
        },\
        \"RepeatFrameMsec\": {\
          \"shape\": \"__integerMin0Max1000000\",\
          \"locationName\": \"repeatFrameMsec\",\
          \"documentation\": \"Documentation update needed\"\
        }\
      },\
      \"documentation\": \"Input Loss Behavior\"\
    },\
    \"InputLossImageType\": {\
      \"type\": \"string\",\
      \"documentation\": \"Input Loss Image Type\",\
      \"enum\": [\
        \"COLOR\",\
        \"SLATE\"\
      ]\
    },\
    \"InputMaximumBitrate\": {\
      \"type\": \"string\",\
      \"documentation\": \"Maximum input bitrate in megabits per second. Bitrates up to 50 Mbps are supported currently.\",\
      \"enum\": [\
        \"MAX_10_MBPS\",\
        \"MAX_20_MBPS\",\
        \"MAX_50_MBPS\"\
      ]\
    },\
    \"InputPreference\": {\
      \"type\": \"string\",\
      \"documentation\": \"Input preference when deciding which input to make active when a previously failed input has recovered.\\nIf \\\\\\\"EQUAL_INPUT_PREFERENCE\\\\\\\", then the active input will stay active as long as it is healthy.\\nIf \\\\\\\"PRIMARY_INPUT_PREFERRED\\\\\\\", then always switch back to the primary input when it is healthy.\\n\",\
      \"enum\": [\
        \"EQUAL_INPUT_PREFERENCE\",\
        \"PRIMARY_INPUT_PREFERRED\"\
      ]\
    },\
    \"InputResolution\": {\
      \"type\": \"string\",\
      \"documentation\": \"Input resolution based on lines of vertical resolution in the input; SD is less than 720 lines, HD is 720 to 1080 lines, UHD is greater than 1080 lines\\n\",\
      \"enum\": [\
        \"SD\",\
        \"HD\",\
        \"UHD\"\
      ]\
    },\
    \"InputSecurityGroup\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"Unique ARN of Input Security Group\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id\",\
          \"documentation\": \"The Id of the Input Security Group\"\
        },\
        \"Inputs\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"inputs\",\
          \"documentation\": \"The list of inputs currently using this Input Security Group.\"\
        },\
        \"State\": {\
          \"shape\": \"InputSecurityGroupState\",\
          \"locationName\": \"state\",\
          \"documentation\": \"The current state of the Input Security Group.\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        },\
        \"WhitelistRules\": {\
          \"shape\": \"__listOfInputWhitelistRule\",\
          \"locationName\": \"whitelistRules\",\
          \"documentation\": \"Whitelist rules and their sync status\"\
        }\
      },\
      \"documentation\": \"An Input Security Group\"\
    },\
    \"InputSecurityGroupState\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"IDLE\",\
        \"IN_USE\",\
        \"UPDATING\",\
        \"DELETED\"\
      ],\
      \"documentation\": \"Placeholder documentation for InputSecurityGroupState\"\
    },\
    \"InputSecurityGroupWhitelistRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        },\
        \"WhitelistRules\": {\
          \"shape\": \"__listOfInputWhitelistRuleCidr\",\
          \"locationName\": \"whitelistRules\",\
          \"documentation\": \"List of IPv4 CIDR addresses to whitelist\"\
        }\
      },\
      \"documentation\": \"Request of IPv4 CIDR addresses to whitelist in a security group.\"\
    },\
    \"InputSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AudioSelectors\": {\
          \"shape\": \"__listOfAudioSelector\",\
          \"locationName\": \"audioSelectors\",\
          \"documentation\": \"Used to select the audio stream to decode for inputs that have multiple available.\"\
        },\
        \"CaptionSelectors\": {\
          \"shape\": \"__listOfCaptionSelector\",\
          \"locationName\": \"captionSelectors\",\
          \"documentation\": \"Used to select the caption input to use for inputs that have multiple available.\"\
        },\
        \"DeblockFilter\": {\
          \"shape\": \"InputDeblockFilter\",\
          \"locationName\": \"deblockFilter\",\
          \"documentation\": \"Enable or disable the deblock filter when filtering.\"\
        },\
        \"DenoiseFilter\": {\
          \"shape\": \"InputDenoiseFilter\",\
          \"locationName\": \"denoiseFilter\",\
          \"documentation\": \"Enable or disable the denoise filter when filtering.\"\
        },\
        \"FilterStrength\": {\
          \"shape\": \"__integerMin1Max5\",\
          \"locationName\": \"filterStrength\",\
          \"documentation\": \"Adjusts the magnitude of filtering from 1 (minimal) to 5 (strongest).\"\
        },\
        \"InputFilter\": {\
          \"shape\": \"InputFilter\",\
          \"locationName\": \"inputFilter\",\
          \"documentation\": \"Turns on the filter for this input. MPEG-2 inputs have the deblocking filter enabled by default.\\n1) auto - filtering will be applied depending on input type/quality\\n2) disabled - no filtering will be applied to the input\\n3) forced - filtering will be applied regardless of input type\"\
        },\
        \"NetworkInputSettings\": {\
          \"shape\": \"NetworkInputSettings\",\
          \"locationName\": \"networkInputSettings\",\
          \"documentation\": \"Input settings.\"\
        },\
        \"SourceEndBehavior\": {\
          \"shape\": \"InputSourceEndBehavior\",\
          \"locationName\": \"sourceEndBehavior\",\
          \"documentation\": \"Loop input if it is a file. This allows a file input to be streamed indefinitely.\"\
        },\
        \"VideoSelector\": {\
          \"shape\": \"VideoSelector\",\
          \"locationName\": \"videoSelector\",\
          \"documentation\": \"Informs which video elementary stream to decode for input types that have multiple available.\"\
        }\
      },\
      \"documentation\": \"Live Event input parameters. There can be multiple inputs in a single Live Event.\"\
    },\
    \"InputSource\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"PasswordParam\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"passwordParam\",\
          \"documentation\": \"The key used to extract the password from EC2 Parameter store.\"\
        },\
        \"Url\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"url\",\
          \"documentation\": \"This represents the customer's source URL where stream is\\npulled from.\\n\"\
        },\
        \"Username\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"username\",\
          \"documentation\": \"The username for the input source.\"\
        }\
      },\
      \"documentation\": \"The settings for a PULL type input.\"\
    },\
    \"InputSourceEndBehavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"Input Source End Behavior\",\
      \"enum\": [\
        \"CONTINUE\",\
        \"LOOP\"\
      ]\
    },\
    \"InputSourceRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"PasswordParam\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"passwordParam\",\
          \"documentation\": \"The key used to extract the password from EC2 Parameter store.\"\
        },\
        \"Url\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"url\",\
          \"documentation\": \"This represents the customer's source URL where stream is\\npulled from.\\n\"\
        },\
        \"Username\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"username\",\
          \"documentation\": \"The username for the input source.\"\
        }\
      },\
      \"documentation\": \"Settings for for a PULL type input.\"\
    },\
    \"InputSourceType\": {\
      \"type\": \"string\",\
      \"documentation\": \"There are two types of input sources, static and dynamic. If an input source is dynamic you can\\nchange the source url of the input dynamically using an input switch action. However, the only input type\\nto support a dynamic url at this time is MP4_FILE. By default all input sources are static.\\n\",\
      \"enum\": [\
        \"STATIC\",\
        \"DYNAMIC\"\
      ]\
    },\
    \"InputSpecification\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Codec\": {\
          \"shape\": \"InputCodec\",\
          \"locationName\": \"codec\",\
          \"documentation\": \"Input codec\"\
        },\
        \"MaximumBitrate\": {\
          \"shape\": \"InputMaximumBitrate\",\
          \"locationName\": \"maximumBitrate\",\
          \"documentation\": \"Maximum input bitrate, categorized coarsely\"\
        },\
        \"Resolution\": {\
          \"shape\": \"InputResolution\",\
          \"locationName\": \"resolution\",\
          \"documentation\": \"Input resolution, categorized coarsely\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for InputSpecification\"\
    },\
    \"InputState\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"CREATING\",\
        \"DETACHED\",\
        \"ATTACHED\",\
        \"DELETING\",\
        \"DELETED\"\
      ],\
      \"documentation\": \"Placeholder documentation for InputState\"\
    },\
    \"InputSwitchScheduleActionSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InputAttachmentNameReference\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"inputAttachmentNameReference\",\
          \"documentation\": \"The name of the input attachment (not the name of the input!) to switch to. The name is specified in the channel configuration.\"\
        },\
        \"InputClippingSettings\": {\
          \"shape\": \"InputClippingSettings\",\
          \"locationName\": \"inputClippingSettings\",\
          \"documentation\": \"Settings to let you create a clip of the file input, in order to set up the input to ingest only a portion of the file.\"\
        },\
        \"UrlPath\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"urlPath\",\
          \"documentation\": \"The value for the variable portion of the URL for the dynamic input, for this instance of the input. Each time you use the same dynamic input in an input switch action, you can provide a different value, in order to connect the input to a different content source.\"\
        }\
      },\
      \"documentation\": \"Settings for the \\\"switch input\\\" action: to switch from ingesting one input to ingesting another input.\",\
      \"required\": [\
        \"InputAttachmentNameReference\"\
      ]\
    },\
    \"InputTimecodeSource\": {\
      \"type\": \"string\",\
      \"documentation\": \"Documentation update needed\",\
      \"enum\": [\
        \"ZEROBASED\",\
        \"EMBEDDED\"\
      ]\
    },\
    \"InputType\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"UDP_PUSH\",\
        \"RTP_PUSH\",\
        \"RTMP_PUSH\",\
        \"RTMP_PULL\",\
        \"URL_PULL\",\
        \"MP4_FILE\",\
        \"MEDIACONNECT\"\
      ],\
      \"documentation\": \"Placeholder documentation for InputType\"\
    },\
    \"InputVpcRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SecurityGroupIds\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"securityGroupIds\",\
          \"documentation\": \"A list of up to 5 EC2 VPC security group IDs to attach to the Input VPC network interfaces.\\nRequires subnetIds. If none are specified then the VPC default security group will be used.\\n\"\
        },\
        \"SubnetIds\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"subnetIds\",\
          \"documentation\": \"A list of 2 VPC subnet IDs from the same VPC.\\nSubnet IDs must be mapped to two unique availability zones (AZ).\\n\"\
        }\
      },\
      \"documentation\": \"Settings for a private VPC Input.\\nWhen this property is specified, the input destination addresses will be created in a VPC rather than with public Internet addresses.\\nThis property requires setting the roleArn property on Input creation.\\nNot compatible with the inputSecurityGroups property.\\n\",\
      \"required\": [\
        \"SubnetIds\"\
      ]\
    },\
    \"InputWhitelistRule\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Cidr\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"cidr\",\
          \"documentation\": \"The IPv4 CIDR that's whitelisted.\"\
        }\
      },\
      \"documentation\": \"Whitelist rule\"\
    },\
    \"InputWhitelistRuleCidr\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Cidr\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"cidr\",\
          \"documentation\": \"The IPv4 CIDR to whitelist.\"\
        }\
      },\
      \"documentation\": \"An IPv4 CIDR to whitelist.\"\
    },\
    \"InternalServerErrorException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\"\
        }\
      },\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 500\
      },\
      \"documentation\": \"Placeholder documentation for InternalServerErrorException\"\
    },\
    \"InternalServiceError\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for InternalServiceError\"\
    },\
    \"InvalidRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for InvalidRequest\"\
    },\
    \"KeyProviderSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"StaticKeySettings\": {\
          \"shape\": \"StaticKeySettings\",\
          \"locationName\": \"staticKeySettings\"\
        }\
      },\
      \"documentation\": \"Key Provider Settings\"\
    },\
    \"LastFrameClippingBehavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"If you specify a StopTimecode in an input (in order to clip the file), you can specify if you want the clip to exclude (the default) or include the frame specified by the timecode.\",\
      \"enum\": [\
        \"EXCLUDE_LAST_FRAME\",\
        \"INCLUDE_LAST_FRAME\"\
      ]\
    },\
    \"LimitExceeded\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for LimitExceeded\"\
    },\
    \"ListChannelsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MaxResults\": {\
          \"shape\": \"MaxResults\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maxResults\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListChannelsRequest\"\
    },\
    \"ListChannelsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Channels\": {\
          \"shape\": \"__listOfChannelSummary\",\
          \"locationName\": \"channels\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListChannelsResponse\"\
    },\
    \"ListChannelsResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Channels\": {\
          \"shape\": \"__listOfChannelSummary\",\
          \"locationName\": \"channels\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListChannelsResultModel\"\
    },\
    \"ListInputSecurityGroupsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MaxResults\": {\
          \"shape\": \"MaxResults\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maxResults\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListInputSecurityGroupsRequest\"\
    },\
    \"ListInputSecurityGroupsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InputSecurityGroups\": {\
          \"shape\": \"__listOfInputSecurityGroup\",\
          \"locationName\": \"inputSecurityGroups\",\
          \"documentation\": \"List of input security groups\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListInputSecurityGroupsResponse\"\
    },\
    \"ListInputSecurityGroupsResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InputSecurityGroups\": {\
          \"shape\": \"__listOfInputSecurityGroup\",\
          \"locationName\": \"inputSecurityGroups\",\
          \"documentation\": \"List of input security groups\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\"\
        }\
      },\
      \"documentation\": \"Result of input security group list request\"\
    },\
    \"ListInputsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MaxResults\": {\
          \"shape\": \"MaxResults\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maxResults\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListInputsRequest\"\
    },\
    \"ListInputsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Inputs\": {\
          \"shape\": \"__listOfInput\",\
          \"locationName\": \"inputs\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListInputsResponse\"\
    },\
    \"ListInputsResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Inputs\": {\
          \"shape\": \"__listOfInput\",\
          \"locationName\": \"inputs\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListInputsResultModel\"\
    },\
    \"ListMultiplexProgramsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MaxResults\": {\
          \"shape\": \"MaxResults\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maxResults\",\
          \"documentation\": \"The maximum number of items to return.\"\
        },\
        \"MultiplexId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"multiplexId\",\
          \"documentation\": \"The ID of the multiplex that the programs belong to.\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"The token to retrieve the next page of results.\"\
        }\
      },\
      \"required\": [\
        \"MultiplexId\"\
      ],\
      \"documentation\": \"Placeholder documentation for ListMultiplexProgramsRequest\"\
    },\
    \"ListMultiplexProgramsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexPrograms\": {\
          \"shape\": \"__listOfMultiplexProgramSummary\",\
          \"locationName\": \"multiplexPrograms\",\
          \"documentation\": \"List of multiplex programs.\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"Token for the next ListMultiplexProgram request.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListMultiplexProgramsResponse\"\
    },\
    \"ListMultiplexProgramsResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexPrograms\": {\
          \"shape\": \"__listOfMultiplexProgramSummary\",\
          \"locationName\": \"multiplexPrograms\",\
          \"documentation\": \"List of multiplex programs.\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"Token for the next ListMultiplexProgram request.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListMultiplexProgramsResultModel\"\
    },\
    \"ListMultiplexesRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MaxResults\": {\
          \"shape\": \"MaxResults\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maxResults\",\
          \"documentation\": \"The maximum number of items to return.\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"The token to retrieve the next page of results.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListMultiplexesRequest\"\
    },\
    \"ListMultiplexesResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Multiplexes\": {\
          \"shape\": \"__listOfMultiplexSummary\",\
          \"locationName\": \"multiplexes\",\
          \"documentation\": \"List of multiplexes.\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"Token for the next ListMultiplexes request.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListMultiplexesResponse\"\
    },\
    \"ListMultiplexesResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Multiplexes\": {\
          \"shape\": \"__listOfMultiplexSummary\",\
          \"locationName\": \"multiplexes\",\
          \"documentation\": \"List of multiplexes.\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"Token for the next ListMultiplexes request.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListMultiplexesResultModel\"\
    },\
    \"ListOfferingsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelClass\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"channelClass\",\
          \"documentation\": \"Filter by channel class, 'STANDARD' or 'SINGLE_PIPELINE'\\n\"\
        },\
        \"ChannelConfiguration\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"channelConfiguration\",\
          \"documentation\": \"Filter to offerings that match the configuration of an existing channel, e.g. '2345678' (a channel ID)\\n\"\
        },\
        \"Codec\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"codec\",\
          \"documentation\": \"Filter by codec, 'AVC', 'HEVC', 'MPEG2', or 'AUDIO'\"\
        },\
        \"Duration\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"duration\",\
          \"documentation\": \"Filter by offering duration, e.g. '12'\"\
        },\
        \"MaxResults\": {\
          \"shape\": \"MaxResults\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maxResults\"\
        },\
        \"MaximumBitrate\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maximumBitrate\",\
          \"documentation\": \"Filter by bitrate, 'MAX_10_MBPS', 'MAX_20_MBPS', or 'MAX_50_MBPS'\\n\"\
        },\
        \"MaximumFramerate\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maximumFramerate\",\
          \"documentation\": \"Filter by framerate, 'MAX_30_FPS' or 'MAX_60_FPS'\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\"\
        },\
        \"Resolution\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"resolution\",\
          \"documentation\": \"Filter by resolution, 'SD', 'HD', 'FHD', or 'UHD'\"\
        },\
        \"ResourceType\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"resourceType\",\
          \"documentation\": \"Filter by resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'\"\
        },\
        \"SpecialFeature\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"specialFeature\",\
          \"documentation\": \"Filter by special feature, 'ADVANCED_AUDIO' or 'AUDIO_NORMALIZATION'\\n\"\
        },\
        \"VideoQuality\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"videoQuality\",\
          \"documentation\": \"Filter by video quality, 'STANDARD', 'ENHANCED', or 'PREMIUM'\\n\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListOfferingsRequest\"\
    },\
    \"ListOfferingsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"Token to retrieve the next page of results\"\
        },\
        \"Offerings\": {\
          \"shape\": \"__listOfOffering\",\
          \"locationName\": \"offerings\",\
          \"documentation\": \"List of offerings\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListOfferingsResponse\"\
    },\
    \"ListOfferingsResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"Token to retrieve the next page of results\"\
        },\
        \"Offerings\": {\
          \"shape\": \"__listOfOffering\",\
          \"locationName\": \"offerings\",\
          \"documentation\": \"List of offerings\"\
        }\
      },\
      \"documentation\": \"ListOfferings response\"\
    },\
    \"ListReservationsRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelClass\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"channelClass\",\
          \"documentation\": \"Filter by channel class, 'STANDARD' or 'SINGLE_PIPELINE'\\n\"\
        },\
        \"Codec\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"codec\",\
          \"documentation\": \"Filter by codec, 'AVC', 'HEVC', 'MPEG2', or 'AUDIO'\"\
        },\
        \"MaxResults\": {\
          \"shape\": \"MaxResults\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maxResults\"\
        },\
        \"MaximumBitrate\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maximumBitrate\",\
          \"documentation\": \"Filter by bitrate, 'MAX_10_MBPS', 'MAX_20_MBPS', or 'MAX_50_MBPS'\\n\"\
        },\
        \"MaximumFramerate\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"maximumFramerate\",\
          \"documentation\": \"Filter by framerate, 'MAX_30_FPS' or 'MAX_60_FPS'\"\
        },\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\"\
        },\
        \"Resolution\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"resolution\",\
          \"documentation\": \"Filter by resolution, 'SD', 'HD', 'FHD', or 'UHD'\"\
        },\
        \"ResourceType\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"resourceType\",\
          \"documentation\": \"Filter by resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'\"\
        },\
        \"SpecialFeature\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"specialFeature\",\
          \"documentation\": \"Filter by special feature, 'ADVANCED_AUDIO' or 'AUDIO_NORMALIZATION'\\n\"\
        },\
        \"VideoQuality\": {\
          \"shape\": \"__string\",\
          \"location\": \"querystring\",\
          \"locationName\": \"videoQuality\",\
          \"documentation\": \"Filter by video quality, 'STANDARD', 'ENHANCED', or 'PREMIUM'\\n\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListReservationsRequest\"\
    },\
    \"ListReservationsResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"Token to retrieve the next page of results\"\
        },\
        \"Reservations\": {\
          \"shape\": \"__listOfReservation\",\
          \"locationName\": \"reservations\",\
          \"documentation\": \"List of reservations\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListReservationsResponse\"\
    },\
    \"ListReservationsResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"Token to retrieve the next page of results\"\
        },\
        \"Reservations\": {\
          \"shape\": \"__listOfReservation\",\
          \"locationName\": \"reservations\",\
          \"documentation\": \"List of reservations\"\
        }\
      },\
      \"documentation\": \"ListReservations response\"\
    },\
    \"ListTagsForResourceRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ResourceArn\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"resource-arn\"\
        }\
      },\
      \"required\": [\
        \"ResourceArn\"\
      ],\
      \"documentation\": \"Placeholder documentation for ListTagsForResourceRequest\"\
    },\
    \"ListTagsForResourceResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ListTagsForResourceResponse\"\
    },\
    \"LogLevel\": {\
      \"type\": \"string\",\
      \"documentation\": \"The log level the user wants for their channel.\",\
      \"enum\": [\
        \"ERROR\",\
        \"WARNING\",\
        \"INFO\",\
        \"DEBUG\",\
        \"DISABLED\"\
      ]\
    },\
    \"M2tsAbsentInputAudioBehavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Absent Input Audio Behavior\",\
      \"enum\": [\
        \"DROP\",\
        \"ENCODE_SILENCE\"\
      ]\
    },\
    \"M2tsArib\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Arib\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"M2tsAribCaptionsPidControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Arib Captions Pid Control\",\
      \"enum\": [\
        \"AUTO\",\
        \"USE_CONFIGURED\"\
      ]\
    },\
    \"M2tsAudioBufferModel\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Audio Buffer Model\",\
      \"enum\": [\
        \"ATSC\",\
        \"DVB\"\
      ]\
    },\
    \"M2tsAudioInterval\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Audio Interval\",\
      \"enum\": [\
        \"VIDEO_AND_FIXED_INTERVALS\",\
        \"VIDEO_INTERVAL\"\
      ]\
    },\
    \"M2tsAudioStreamType\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Audio Stream Type\",\
      \"enum\": [\
        \"ATSC\",\
        \"DVB\"\
      ]\
    },\
    \"M2tsBufferModel\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Buffer Model\",\
      \"enum\": [\
        \"MULTIPLEX\",\
        \"NONE\"\
      ]\
    },\
    \"M2tsCcDescriptor\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Cc Descriptor\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"M2tsEbifControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Ebif Control\",\
      \"enum\": [\
        \"NONE\",\
        \"PASSTHROUGH\"\
      ]\
    },\
    \"M2tsEbpPlacement\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Ebp Placement\",\
      \"enum\": [\
        \"VIDEO_AND_AUDIO_PIDS\",\
        \"VIDEO_PID\"\
      ]\
    },\
    \"M2tsEsRateInPes\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Es Rate In Pes\",\
      \"enum\": [\
        \"EXCLUDE\",\
        \"INCLUDE\"\
      ]\
    },\
    \"M2tsKlv\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Klv\",\
      \"enum\": [\
        \"NONE\",\
        \"PASSTHROUGH\"\
      ]\
    },\
    \"M2tsNielsenId3Behavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Nielsen Id3 Behavior\",\
      \"enum\": [\
        \"NO_PASSTHROUGH\",\
        \"PASSTHROUGH\"\
      ]\
    },\
    \"M2tsPcrControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Pcr Control\",\
      \"enum\": [\
        \"CONFIGURED_PCR_PERIOD\",\
        \"PCR_EVERY_PES_PACKET\"\
      ]\
    },\
    \"M2tsRateMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Rate Mode\",\
      \"enum\": [\
        \"CBR\",\
        \"VBR\"\
      ]\
    },\
    \"M2tsScte35Control\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Scte35 Control\",\
      \"enum\": [\
        \"NONE\",\
        \"PASSTHROUGH\"\
      ]\
    },\
    \"M2tsSegmentationMarkers\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Segmentation Markers\",\
      \"enum\": [\
        \"EBP\",\
        \"EBP_LEGACY\",\
        \"NONE\",\
        \"PSI_SEGSTART\",\
        \"RAI_ADAPT\",\
        \"RAI_SEGSTART\"\
      ]\
    },\
    \"M2tsSegmentationStyle\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Segmentation Style\",\
      \"enum\": [\
        \"MAINTAIN_CADENCE\",\
        \"RESET_CADENCE\"\
      ]\
    },\
    \"M2tsSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AbsentInputAudioBehavior\": {\
          \"shape\": \"M2tsAbsentInputAudioBehavior\",\
          \"locationName\": \"absentInputAudioBehavior\",\
          \"documentation\": \"When set to drop, output audio streams will be removed from the program if the selected input audio stream is removed from the input. This allows the output audio configuration to dynamically change based on input configuration. If this is set to encodeSilence, all output audio streams will output encoded silence when not connected to an active input stream.\"\
        },\
        \"Arib\": {\
          \"shape\": \"M2tsArib\",\
          \"locationName\": \"arib\",\
          \"documentation\": \"When set to enabled, uses ARIB-compliant field muxing and removes video descriptor.\"\
        },\
        \"AribCaptionsPid\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"aribCaptionsPid\",\
          \"documentation\": \"Packet Identifier (PID) for ARIB Captions in the transport stream. Can be entered as a decimal or hexadecimal value.  Valid values are 32 (or 0x20)..8182 (or 0x1ff6).\"\
        },\
        \"AribCaptionsPidControl\": {\
          \"shape\": \"M2tsAribCaptionsPidControl\",\
          \"locationName\": \"aribCaptionsPidControl\",\
          \"documentation\": \"If set to auto, pid number used for ARIB Captions will be auto-selected from unused pids.  If set to useConfigured, ARIB Captions will be on the configured pid number.\"\
        },\
        \"AudioBufferModel\": {\
          \"shape\": \"M2tsAudioBufferModel\",\
          \"locationName\": \"audioBufferModel\",\
          \"documentation\": \"When set to dvb, uses DVB buffer model for Dolby Digital audio.  When set to atsc, the ATSC model is used.\"\
        },\
        \"AudioFramesPerPes\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"audioFramesPerPes\",\
          \"documentation\": \"The number of audio frames to insert for each PES packet.\"\
        },\
        \"AudioPids\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"audioPids\",\
          \"documentation\": \"Packet Identifier (PID) of the elementary audio stream(s) in the transport stream. Multiple values are accepted, and can be entered in ranges and/or by comma separation. Can be entered as decimal or hexadecimal values. Each PID specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).\"\
        },\
        \"AudioStreamType\": {\
          \"shape\": \"M2tsAudioStreamType\",\
          \"locationName\": \"audioStreamType\",\
          \"documentation\": \"When set to atsc, uses stream type = 0x81 for AC3 and stream type = 0x87 for EAC3. When set to dvb, uses stream type = 0x06.\"\
        },\
        \"Bitrate\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"bitrate\",\
          \"documentation\": \"The output bitrate of the transport stream in bits per second. Setting to 0 lets the muxer automatically determine the appropriate bitrate.\"\
        },\
        \"BufferModel\": {\
          \"shape\": \"M2tsBufferModel\",\
          \"locationName\": \"bufferModel\",\
          \"documentation\": \"If set to multiplex, use multiplex buffer model for accurate interleaving.  Setting to bufferModel to none can lead to lower latency, but low-memory devices may not be able to play back the stream without interruptions.\"\
        },\
        \"CcDescriptor\": {\
          \"shape\": \"M2tsCcDescriptor\",\
          \"locationName\": \"ccDescriptor\",\
          \"documentation\": \"When set to enabled, generates captionServiceDescriptor in PMT.\"\
        },\
        \"DvbNitSettings\": {\
          \"shape\": \"DvbNitSettings\",\
          \"locationName\": \"dvbNitSettings\",\
          \"documentation\": \"Inserts DVB Network Information Table (NIT) at the specified table repetition interval.\"\
        },\
        \"DvbSdtSettings\": {\
          \"shape\": \"DvbSdtSettings\",\
          \"locationName\": \"dvbSdtSettings\",\
          \"documentation\": \"Inserts DVB Service Description Table (SDT) at the specified table repetition interval.\"\
        },\
        \"DvbSubPids\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"dvbSubPids\",\
          \"documentation\": \"Packet Identifier (PID) for input source DVB Subtitle data to this output. Multiple values are accepted, and can be entered in ranges and/or by comma separation. Can be entered as decimal or hexadecimal values.  Each PID specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).\"\
        },\
        \"DvbTdtSettings\": {\
          \"shape\": \"DvbTdtSettings\",\
          \"locationName\": \"dvbTdtSettings\",\
          \"documentation\": \"Inserts DVB Time and Date Table (TDT) at the specified table repetition interval.\"\
        },\
        \"DvbTeletextPid\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"dvbTeletextPid\",\
          \"documentation\": \"Packet Identifier (PID) for input source DVB Teletext data to this output. Can be entered as a decimal or hexadecimal value.  Valid values are 32 (or 0x20)..8182 (or 0x1ff6).\"\
        },\
        \"Ebif\": {\
          \"shape\": \"M2tsEbifControl\",\
          \"locationName\": \"ebif\",\
          \"documentation\": \"If set to passthrough, passes any EBIF data from the input source to this output.\"\
        },\
        \"EbpAudioInterval\": {\
          \"shape\": \"M2tsAudioInterval\",\
          \"locationName\": \"ebpAudioInterval\",\
          \"documentation\": \"When videoAndFixedIntervals is selected, audio EBP markers will be added to partitions 3 and 4. The interval between these additional markers will be fixed, and will be slightly shorter than the video EBP marker interval. Only available when EBP Cablelabs segmentation markers are selected.  Partitions 1 and 2 will always follow the video interval.\"\
        },\
        \"EbpLookaheadMs\": {\
          \"shape\": \"__integerMin0Max10000\",\
          \"locationName\": \"ebpLookaheadMs\",\
          \"documentation\": \"When set, enforces that Encoder Boundary Points do not come within the specified time interval of each other by looking ahead at input video. If another EBP is going to come in within the specified time interval, the current EBP is not emitted, and the segment is \\\"stretched\\\" to the next marker.  The lookahead value does not add latency to the system. The Live Event must be configured elsewhere to create sufficient latency to make the lookahead accurate.\"\
        },\
        \"EbpPlacement\": {\
          \"shape\": \"M2tsEbpPlacement\",\
          \"locationName\": \"ebpPlacement\",\
          \"documentation\": \"Controls placement of EBP on Audio PIDs. If set to videoAndAudioPids, EBP markers will be placed on the video PID and all audio PIDs.  If set to videoPid, EBP markers will be placed on only the video PID.\"\
        },\
        \"EcmPid\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"ecmPid\",\
          \"documentation\": \"This field is unused and deprecated.\"\
        },\
        \"EsRateInPes\": {\
          \"shape\": \"M2tsEsRateInPes\",\
          \"locationName\": \"esRateInPes\",\
          \"documentation\": \"Include or exclude the ES Rate field in the PES header.\"\
        },\
        \"EtvPlatformPid\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"etvPlatformPid\",\
          \"documentation\": \"Packet Identifier (PID) for input source ETV Platform data to this output. Can be entered as a decimal or hexadecimal value.  Valid values are 32 (or 0x20)..8182 (or 0x1ff6).\"\
        },\
        \"EtvSignalPid\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"etvSignalPid\",\
          \"documentation\": \"Packet Identifier (PID) for input source ETV Signal data to this output. Can be entered as a decimal or hexadecimal value.  Valid values are 32 (or 0x20)..8182 (or 0x1ff6).\"\
        },\
        \"FragmentTime\": {\
          \"shape\": \"__doubleMin0\",\
          \"locationName\": \"fragmentTime\",\
          \"documentation\": \"The length in seconds of each fragment. Only used with EBP markers.\"\
        },\
        \"Klv\": {\
          \"shape\": \"M2tsKlv\",\
          \"locationName\": \"klv\",\
          \"documentation\": \"If set to passthrough, passes any KLV data from the input source to this output.\"\
        },\
        \"KlvDataPids\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"klvDataPids\",\
          \"documentation\": \"Packet Identifier (PID) for input source KLV data to this output. Multiple values are accepted, and can be entered in ranges and/or by comma separation. Can be entered as decimal or hexadecimal values.  Each PID specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).\"\
        },\
        \"NielsenId3Behavior\": {\
          \"shape\": \"M2tsNielsenId3Behavior\",\
          \"locationName\": \"nielsenId3Behavior\",\
          \"documentation\": \"If set to passthrough, Nielsen inaudible tones for media tracking will be detected in the input audio and an equivalent ID3 tag will be inserted in the output.\"\
        },\
        \"NullPacketBitrate\": {\
          \"shape\": \"__doubleMin0\",\
          \"locationName\": \"nullPacketBitrate\",\
          \"documentation\": \"Value in bits per second of extra null packets to insert into the transport stream. This can be used if a downstream encryption system requires periodic null packets.\"\
        },\
        \"PatInterval\": {\
          \"shape\": \"__integerMin0Max1000\",\
          \"locationName\": \"patInterval\",\
          \"documentation\": \"The number of milliseconds between instances of this table in the output transport stream.  Valid values are 0, 10..1000.\"\
        },\
        \"PcrControl\": {\
          \"shape\": \"M2tsPcrControl\",\
          \"locationName\": \"pcrControl\",\
          \"documentation\": \"When set to pcrEveryPesPacket, a Program Clock Reference value is inserted for every Packetized Elementary Stream (PES) header. This parameter is effective only when the PCR PID is the same as the video or audio elementary stream.\"\
        },\
        \"PcrPeriod\": {\
          \"shape\": \"__integerMin0Max500\",\
          \"locationName\": \"pcrPeriod\",\
          \"documentation\": \"Maximum time in milliseconds between Program Clock Reference (PCRs) inserted into the transport stream.\"\
        },\
        \"PcrPid\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"pcrPid\",\
          \"documentation\": \"Packet Identifier (PID) of the Program Clock Reference (PCR) in the transport stream. When no value is given, the encoder will assign the same value as the Video PID. Can be entered as a decimal or hexadecimal value.  Valid values are 32 (or 0x20)..8182 (or 0x1ff6).\"\
        },\
        \"PmtInterval\": {\
          \"shape\": \"__integerMin0Max1000\",\
          \"locationName\": \"pmtInterval\",\
          \"documentation\": \"The number of milliseconds between instances of this table in the output transport stream. Valid values are 0, 10..1000.\"\
        },\
        \"PmtPid\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"pmtPid\",\
          \"documentation\": \"Packet Identifier (PID) for the Program Map Table (PMT) in the transport stream. Can be entered as a decimal or hexadecimal value. Valid values are 32 (or 0x20)..8182 (or 0x1ff6).\"\
        },\
        \"ProgramNum\": {\
          \"shape\": \"__integerMin0Max65535\",\
          \"locationName\": \"programNum\",\
          \"documentation\": \"The value of the program number field in the Program Map Table.\"\
        },\
        \"RateMode\": {\
          \"shape\": \"M2tsRateMode\",\
          \"locationName\": \"rateMode\",\
          \"documentation\": \"When vbr, does not insert null packets into transport stream to fill specified bitrate. The bitrate setting acts as the maximum bitrate when vbr is set.\"\
        },\
        \"Scte27Pids\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"scte27Pids\",\
          \"documentation\": \"Packet Identifier (PID) for input source SCTE-27 data to this output. Multiple values are accepted, and can be entered in ranges and/or by comma separation. Can be entered as decimal or hexadecimal values.  Each PID specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).\"\
        },\
        \"Scte35Control\": {\
          \"shape\": \"M2tsScte35Control\",\
          \"locationName\": \"scte35Control\",\
          \"documentation\": \"Optionally pass SCTE-35 signals from the input source to this output.\"\
        },\
        \"Scte35Pid\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"scte35Pid\",\
          \"documentation\": \"Packet Identifier (PID) of the SCTE-35 stream in the transport stream. Can be entered as a decimal or hexadecimal value.  Valid values are 32 (or 0x20)..8182 (or 0x1ff6).\"\
        },\
        \"SegmentationMarkers\": {\
          \"shape\": \"M2tsSegmentationMarkers\",\
          \"locationName\": \"segmentationMarkers\",\
          \"documentation\": \"Inserts segmentation markers at each segmentationTime period. raiSegstart sets the Random Access Indicator bit in the adaptation field. raiAdapt sets the RAI bit and adds the current timecode in the private data bytes. psiSegstart inserts PAT and PMT tables at the start of segments. ebp adds Encoder Boundary Point information to the adaptation field as per OpenCable specification OC-SP-EBP-I01-130118. ebpLegacy adds Encoder Boundary Point information to the adaptation field using a legacy proprietary format.\"\
        },\
        \"SegmentationStyle\": {\
          \"shape\": \"M2tsSegmentationStyle\",\
          \"locationName\": \"segmentationStyle\",\
          \"documentation\": \"The segmentation style parameter controls how segmentation markers are inserted into the transport stream. With avails, it is possible that segments may be truncated, which can influence where future segmentation markers are inserted.\\n\\nWhen a segmentation style of \\\"resetCadence\\\" is selected and a segment is truncated due to an avail, we will reset the segmentation cadence. This means the subsequent segment will have a duration of $segmentationTime seconds.\\n\\nWhen a segmentation style of \\\"maintainCadence\\\" is selected and a segment is truncated due to an avail, we will not reset the segmentation cadence. This means the subsequent segment will likely be truncated as well. However, all segments after that will have a duration of $segmentationTime seconds. Note that EBP lookahead is a slight exception to this rule.\"\
        },\
        \"SegmentationTime\": {\
          \"shape\": \"__doubleMin1\",\
          \"locationName\": \"segmentationTime\",\
          \"documentation\": \"The length in seconds of each segment. Required unless markers is set to None_.\"\
        },\
        \"TimedMetadataBehavior\": {\
          \"shape\": \"M2tsTimedMetadataBehavior\",\
          \"locationName\": \"timedMetadataBehavior\",\
          \"documentation\": \"When set to passthrough, timed metadata will be passed through from input to output.\"\
        },\
        \"TimedMetadataPid\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"timedMetadataPid\",\
          \"documentation\": \"Packet Identifier (PID) of the timed metadata stream in the transport stream. Can be entered as a decimal or hexadecimal value.  Valid values are 32 (or 0x20)..8182 (or 0x1ff6).\"\
        },\
        \"TransportStreamId\": {\
          \"shape\": \"__integerMin0Max65535\",\
          \"locationName\": \"transportStreamId\",\
          \"documentation\": \"The value of the transport stream ID field in the Program Map Table.\"\
        },\
        \"VideoPid\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"videoPid\",\
          \"documentation\": \"Packet Identifier (PID) of the elementary video stream in the transport stream. Can be entered as a decimal or hexadecimal value.  Valid values are 32 (or 0x20)..8182 (or 0x1ff6).\"\
        }\
      },\
      \"documentation\": \"M2ts Settings\"\
    },\
    \"M2tsTimedMetadataBehavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"M2ts Timed Metadata Behavior\",\
      \"enum\": [\
        \"NO_PASSTHROUGH\",\
        \"PASSTHROUGH\"\
      ]\
    },\
    \"M3u8NielsenId3Behavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"M3u8 Nielsen Id3 Behavior\",\
      \"enum\": [\
        \"NO_PASSTHROUGH\",\
        \"PASSTHROUGH\"\
      ]\
    },\
    \"M3u8PcrControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"M3u8 Pcr Control\",\
      \"enum\": [\
        \"CONFIGURED_PCR_PERIOD\",\
        \"PCR_EVERY_PES_PACKET\"\
      ]\
    },\
    \"M3u8Scte35Behavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"M3u8 Scte35 Behavior\",\
      \"enum\": [\
        \"NO_PASSTHROUGH\",\
        \"PASSTHROUGH\"\
      ]\
    },\
    \"M3u8Settings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AudioFramesPerPes\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"audioFramesPerPes\",\
          \"documentation\": \"The number of audio frames to insert for each PES packet.\"\
        },\
        \"AudioPids\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"audioPids\",\
          \"documentation\": \"Packet Identifier (PID) of the elementary audio stream(s) in the transport stream. Multiple values are accepted, and can be entered in ranges and/or by comma separation. Can be entered as decimal or hexadecimal values.\"\
        },\
        \"EcmPid\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"ecmPid\",\
          \"documentation\": \"This parameter is unused and deprecated.\"\
        },\
        \"NielsenId3Behavior\": {\
          \"shape\": \"M3u8NielsenId3Behavior\",\
          \"locationName\": \"nielsenId3Behavior\",\
          \"documentation\": \"If set to passthrough, Nielsen inaudible tones for media tracking will be detected in the input audio and an equivalent ID3 tag will be inserted in the output.\"\
        },\
        \"PatInterval\": {\
          \"shape\": \"__integerMin0Max1000\",\
          \"locationName\": \"patInterval\",\
          \"documentation\": \"The number of milliseconds between instances of this table in the output transport stream. A value of \\\\\\\"0\\\\\\\" writes out the PMT once per segment file.\"\
        },\
        \"PcrControl\": {\
          \"shape\": \"M3u8PcrControl\",\
          \"locationName\": \"pcrControl\",\
          \"documentation\": \"When set to pcrEveryPesPacket, a Program Clock Reference value is inserted for every Packetized Elementary Stream (PES) header. This parameter is effective only when the PCR PID is the same as the video or audio elementary stream.\"\
        },\
        \"PcrPeriod\": {\
          \"shape\": \"__integerMin0Max500\",\
          \"locationName\": \"pcrPeriod\",\
          \"documentation\": \"Maximum time in milliseconds between Program Clock References (PCRs) inserted into the transport stream.\"\
        },\
        \"PcrPid\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"pcrPid\",\
          \"documentation\": \"Packet Identifier (PID) of the Program Clock Reference (PCR) in the transport stream. When no value is given, the encoder will assign the same value as the Video PID. Can be entered as a decimal or hexadecimal value.\"\
        },\
        \"PmtInterval\": {\
          \"shape\": \"__integerMin0Max1000\",\
          \"locationName\": \"pmtInterval\",\
          \"documentation\": \"The number of milliseconds between instances of this table in the output transport stream. A value of \\\\\\\"0\\\\\\\" writes out the PMT once per segment file.\"\
        },\
        \"PmtPid\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"pmtPid\",\
          \"documentation\": \"Packet Identifier (PID) for the Program Map Table (PMT) in the transport stream. Can be entered as a decimal or hexadecimal value.\"\
        },\
        \"ProgramNum\": {\
          \"shape\": \"__integerMin0Max65535\",\
          \"locationName\": \"programNum\",\
          \"documentation\": \"The value of the program number field in the Program Map Table.\"\
        },\
        \"Scte35Behavior\": {\
          \"shape\": \"M3u8Scte35Behavior\",\
          \"locationName\": \"scte35Behavior\",\
          \"documentation\": \"If set to passthrough, passes any SCTE-35 signals from the input source to this output.\"\
        },\
        \"Scte35Pid\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"scte35Pid\",\
          \"documentation\": \"Packet Identifier (PID) of the SCTE-35 stream in the transport stream. Can be entered as a decimal or hexadecimal value.\"\
        },\
        \"TimedMetadataBehavior\": {\
          \"shape\": \"M3u8TimedMetadataBehavior\",\
          \"locationName\": \"timedMetadataBehavior\",\
          \"documentation\": \"When set to passthrough, timed metadata is passed through from input to output.\"\
        },\
        \"TimedMetadataPid\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"timedMetadataPid\",\
          \"documentation\": \"Packet Identifier (PID) of the timed metadata stream in the transport stream. Can be entered as a decimal or hexadecimal value.  Valid values are 32 (or 0x20)..8182 (or 0x1ff6).\"\
        },\
        \"TransportStreamId\": {\
          \"shape\": \"__integerMin0Max65535\",\
          \"locationName\": \"transportStreamId\",\
          \"documentation\": \"The value of the transport stream ID field in the Program Map Table.\"\
        },\
        \"VideoPid\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"videoPid\",\
          \"documentation\": \"Packet Identifier (PID) of the elementary video stream in the transport stream. Can be entered as a decimal or hexadecimal value.\"\
        }\
      },\
      \"documentation\": \"Settings information for the .m3u8 container\"\
    },\
    \"M3u8TimedMetadataBehavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"M3u8 Timed Metadata Behavior\",\
      \"enum\": [\
        \"NO_PASSTHROUGH\",\
        \"PASSTHROUGH\"\
      ]\
    },\
    \"MaxResults\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 1000,\
      \"documentation\": \"Placeholder documentation for MaxResults\"\
    },\
    \"MediaConnectFlow\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"FlowArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"flowArn\",\
          \"documentation\": \"The unique ARN of the MediaConnect Flow being used as a source.\"\
        }\
      },\
      \"documentation\": \"The settings for a MediaConnect Flow.\"\
    },\
    \"MediaConnectFlowRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"FlowArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"flowArn\",\
          \"documentation\": \"The ARN of the MediaConnect Flow that you want to use as a source.\"\
        }\
      },\
      \"documentation\": \"The settings for a MediaConnect Flow.\"\
    },\
    \"MediaPackageGroupSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Destination\": {\
          \"shape\": \"OutputLocationRef\",\
          \"locationName\": \"destination\",\
          \"documentation\": \"MediaPackage channel destination.\"\
        }\
      },\
      \"documentation\": \"Media Package Group Settings\",\
      \"required\": [\
        \"Destination\"\
      ]\
    },\
    \"MediaPackageOutputDestinationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelId\": {\
          \"shape\": \"__stringMin1\",\
          \"locationName\": \"channelId\",\
          \"documentation\": \"ID of the channel in MediaPackage that is the destination for this output group. You do not need to specify the individual inputs in MediaPackage; MediaLive will handle the connection of the two MediaLive pipelines to the two MediaPackage inputs. The MediaPackage channel and MediaLive channel must be in the same region.\"\
        }\
      },\
      \"documentation\": \"MediaPackage Output Destination Settings\"\
    },\
    \"MediaPackageOutputSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Media Package Output Settings\"\
    },\
    \"Mp2CodingMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Mp2 Coding Mode\",\
      \"enum\": [\
        \"CODING_MODE_1_0\",\
        \"CODING_MODE_2_0\"\
      ]\
    },\
    \"Mp2Settings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Bitrate\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"bitrate\",\
          \"documentation\": \"Average bitrate in bits/second.\"\
        },\
        \"CodingMode\": {\
          \"shape\": \"Mp2CodingMode\",\
          \"locationName\": \"codingMode\",\
          \"documentation\": \"The MPEG2 Audio coding mode.  Valid values are codingMode10 (for mono) or codingMode20 (for stereo).\"\
        },\
        \"SampleRate\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"sampleRate\",\
          \"documentation\": \"Sample rate in Hz.\"\
        }\
      },\
      \"documentation\": \"Mp2 Settings\"\
    },\
    \"MsSmoothGroupSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AcquisitionPointId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"acquisitionPointId\",\
          \"documentation\": \"The value of the \\\"Acquisition Point Identity\\\" element used in each message placed in the sparse track.  Only enabled if sparseTrackType is not \\\"none\\\".\"\
        },\
        \"AudioOnlyTimecodeControl\": {\
          \"shape\": \"SmoothGroupAudioOnlyTimecodeControl\",\
          \"locationName\": \"audioOnlyTimecodeControl\",\
          \"documentation\": \"If set to passthrough for an audio-only MS Smooth output, the fragment absolute time will be set to the current timecode. This option does not write timecodes to the audio elementary stream.\"\
        },\
        \"CertificateMode\": {\
          \"shape\": \"SmoothGroupCertificateMode\",\
          \"locationName\": \"certificateMode\",\
          \"documentation\": \"If set to verifyAuthenticity, verify the https certificate chain to a trusted Certificate Authority (CA).  This will cause https outputs to self-signed certificates to fail.\"\
        },\
        \"ConnectionRetryInterval\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"connectionRetryInterval\",\
          \"documentation\": \"Number of seconds to wait before retrying connection to the IIS server if the connection is lost. Content will be cached during this time and the cache will be be delivered to the IIS server once the connection is re-established.\"\
        },\
        \"Destination\": {\
          \"shape\": \"OutputLocationRef\",\
          \"locationName\": \"destination\",\
          \"documentation\": \"Smooth Streaming publish point on an IIS server. Elemental Live acts as a \\\"Push\\\" encoder to IIS.\"\
        },\
        \"EventId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"eventId\",\
          \"documentation\": \"MS Smooth event ID to be sent to the IIS server.\\n\\nShould only be specified if eventIdMode is set to useConfigured.\"\
        },\
        \"EventIdMode\": {\
          \"shape\": \"SmoothGroupEventIdMode\",\
          \"locationName\": \"eventIdMode\",\
          \"documentation\": \"Specifies whether or not to send an event ID to the IIS server. If no event ID is sent and the same Live Event is used without changing the publishing point, clients might see cached video from the previous run.\\n\\nOptions:\\n- \\\"useConfigured\\\" - use the value provided in eventId\\n- \\\"useTimestamp\\\" - generate and send an event ID based on the current timestamp\\n- \\\"noEventId\\\" - do not send an event ID to the IIS server.\"\
        },\
        \"EventStopBehavior\": {\
          \"shape\": \"SmoothGroupEventStopBehavior\",\
          \"locationName\": \"eventStopBehavior\",\
          \"documentation\": \"When set to sendEos, send EOS signal to IIS server when stopping the event\"\
        },\
        \"FilecacheDuration\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"filecacheDuration\",\
          \"documentation\": \"Size in seconds of file cache for streaming outputs.\"\
        },\
        \"FragmentLength\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"fragmentLength\",\
          \"documentation\": \"Length of mp4 fragments to generate (in seconds). Fragment length must be compatible with GOP size and framerate.\"\
        },\
        \"InputLossAction\": {\
          \"shape\": \"InputLossActionForMsSmoothOut\",\
          \"locationName\": \"inputLossAction\",\
          \"documentation\": \"Parameter that control output group behavior on input loss.\"\
        },\
        \"NumRetries\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"numRetries\",\
          \"documentation\": \"Number of retry attempts.\"\
        },\
        \"RestartDelay\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"restartDelay\",\
          \"documentation\": \"Number of seconds before initiating a restart due to output failure, due to exhausting the numRetries on one segment, or exceeding filecacheDuration.\"\
        },\
        \"SegmentationMode\": {\
          \"shape\": \"SmoothGroupSegmentationMode\",\
          \"locationName\": \"segmentationMode\",\
          \"documentation\": \"useInputSegmentation has been deprecated. The configured segment size is always used.\"\
        },\
        \"SendDelayMs\": {\
          \"shape\": \"__integerMin0Max10000\",\
          \"locationName\": \"sendDelayMs\",\
          \"documentation\": \"Number of milliseconds to delay the output from the second pipeline.\"\
        },\
        \"SparseTrackType\": {\
          \"shape\": \"SmoothGroupSparseTrackType\",\
          \"locationName\": \"sparseTrackType\",\
          \"documentation\": \"If set to scte35, use incoming SCTE-35 messages to generate a sparse track in this group of MS-Smooth outputs. scte35WithoutSegmentation is the same as scte35, except EML will not start a new segment at a SCTE-35 marker. It will still encode an IDR frame at a SCTE-35 marker.\"\
        },\
        \"StreamManifestBehavior\": {\
          \"shape\": \"SmoothGroupStreamManifestBehavior\",\
          \"locationName\": \"streamManifestBehavior\",\
          \"documentation\": \"When set to send, send stream manifest so publishing point doesn't start until all streams start.\"\
        },\
        \"TimestampOffset\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"timestampOffset\",\
          \"documentation\": \"Timestamp offset for the event.  Only used if timestampOffsetMode is set to useConfiguredOffset.\"\
        },\
        \"TimestampOffsetMode\": {\
          \"shape\": \"SmoothGroupTimestampOffsetMode\",\
          \"locationName\": \"timestampOffsetMode\",\
          \"documentation\": \"Type of timestamp date offset to use.\\n- useEventStartDate: Use the date the event was started as the offset\\n- useConfiguredOffset: Use an explicitly configured date as the offset\"\
        }\
      },\
      \"documentation\": \"Ms Smooth Group Settings\",\
      \"required\": [\
        \"Destination\"\
      ]\
    },\
    \"MsSmoothH265PackagingType\": {\
      \"type\": \"string\",\
      \"documentation\": \"Ms Smooth H265 Packaging Type\",\
      \"enum\": [\
        \"HEV1\",\
        \"HVC1\"\
      ]\
    },\
    \"MsSmoothOutputSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"H265PackagingType\": {\
          \"shape\": \"MsSmoothH265PackagingType\",\
          \"locationName\": \"h265PackagingType\",\
          \"documentation\": \"Only applicable when this output is referencing an H.265 video description.\\nSpecifies whether MP4 segments should be packaged as HEV1 or HVC1.\"\
        },\
        \"NameModifier\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nameModifier\",\
          \"documentation\": \"String concatenated to the end of the destination filename.  Required for multiple outputs of the same type.\"\
        }\
      },\
      \"documentation\": \"Ms Smooth Output Settings\"\
    },\
    \"Multiplex\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"The unique arn of the multiplex.\"\
        },\
        \"AvailabilityZones\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"availabilityZones\",\
          \"documentation\": \"A list of availability zones for the multiplex.\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfMultiplexOutputDestination\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"A list of the multiplex output destinations.\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id\",\
          \"documentation\": \"The unique id of the multiplex.\"\
        },\
        \"MultiplexSettings\": {\
          \"shape\": \"MultiplexSettings\",\
          \"locationName\": \"multiplexSettings\",\
          \"documentation\": \"Configuration for a multiplex event.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The name of the multiplex.\"\
        },\
        \"PipelinesRunningCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"pipelinesRunningCount\",\
          \"documentation\": \"The number of currently healthy pipelines.\"\
        },\
        \"ProgramCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"programCount\",\
          \"documentation\": \"The number of programs in the multiplex.\"\
        },\
        \"State\": {\
          \"shape\": \"MultiplexState\",\
          \"locationName\": \"state\",\
          \"documentation\": \"The current state of the multiplex.\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        }\
      },\
      \"documentation\": \"The multiplex object.\"\
    },\
    \"MultiplexConfigurationValidationError\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\",\
          \"documentation\": \"The error message.\"\
        },\
        \"ValidationErrors\": {\
          \"shape\": \"__listOfMultiplexValidationError\",\
          \"locationName\": \"validationErrors\",\
          \"documentation\": \"A collection of validation error responses.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for MultiplexConfigurationValidationError\"\
    },\
    \"MultiplexGroupSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Multiplex Group Settings\"\
    },\
    \"MultiplexMediaConnectOutputDestinationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"EntitlementArn\": {\
          \"shape\": \"__stringMin1\",\
          \"locationName\": \"entitlementArn\",\
          \"documentation\": \"The MediaConnect entitlement ARN available as a Flow source.\"\
        }\
      },\
      \"documentation\": \"Multiplex MediaConnect output destination settings.\"\
    },\
    \"MultiplexOutputDestination\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MediaConnectSettings\": {\
          \"shape\": \"MultiplexMediaConnectOutputDestinationSettings\",\
          \"locationName\": \"mediaConnectSettings\",\
          \"documentation\": \"Multiplex MediaConnect output destination settings.\"\
        }\
      },\
      \"documentation\": \"Multiplex output destination settings\"\
    },\
    \"MultiplexOutputSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Destination\": {\
          \"shape\": \"OutputLocationRef\",\
          \"locationName\": \"destination\",\
          \"documentation\": \"Destination is a Multiplex.\"\
        }\
      },\
      \"documentation\": \"Multiplex Output Settings\",\
      \"required\": [\
        \"Destination\"\
      ]\
    },\
    \"MultiplexProgram\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"channelId\",\
          \"documentation\": \"The MediaLive channel associated with the program.\"\
        },\
        \"MultiplexProgramSettings\": {\
          \"shape\": \"MultiplexProgramSettings\",\
          \"locationName\": \"multiplexProgramSettings\",\
          \"documentation\": \"The settings for this multiplex program.\"\
        },\
        \"PacketIdentifiersMap\": {\
          \"shape\": \"MultiplexProgramPacketIdentifiersMap\",\
          \"locationName\": \"packetIdentifiersMap\",\
          \"documentation\": \"The packet identifier map for this multiplex program.\"\
        },\
        \"ProgramName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"programName\",\
          \"documentation\": \"The name of the multiplex program.\"\
        }\
      },\
      \"documentation\": \"The multiplex program object.\"\
    },\
    \"MultiplexProgramChannelDestinationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexId\": {\
          \"shape\": \"__stringMin1\",\
          \"locationName\": \"multiplexId\",\
          \"documentation\": \"The ID of the Multiplex that the encoder is providing output to. You do not need to specify the individual inputs to the Multiplex; MediaLive will handle the connection of the two MediaLive pipelines to the two Multiplex instances.\\nThe Multiplex must be in the same region as the Channel.\"\
        },\
        \"ProgramName\": {\
          \"shape\": \"__stringMin1\",\
          \"locationName\": \"programName\",\
          \"documentation\": \"The program name of the Multiplex program that the encoder is providing output to.\"\
        }\
      },\
      \"documentation\": \"Multiplex Program Input Destination Settings for outputting a Channel to a Multiplex\"\
    },\
    \"MultiplexProgramPacketIdentifiersMap\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AudioPids\": {\
          \"shape\": \"__listOf__integer\",\
          \"locationName\": \"audioPids\"\
        },\
        \"DvbSubPids\": {\
          \"shape\": \"__listOf__integer\",\
          \"locationName\": \"dvbSubPids\"\
        },\
        \"DvbTeletextPid\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"dvbTeletextPid\"\
        },\
        \"EtvPlatformPid\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"etvPlatformPid\"\
        },\
        \"EtvSignalPid\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"etvSignalPid\"\
        },\
        \"KlvDataPids\": {\
          \"shape\": \"__listOf__integer\",\
          \"locationName\": \"klvDataPids\"\
        },\
        \"PcrPid\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"pcrPid\"\
        },\
        \"PmtPid\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"pmtPid\"\
        },\
        \"PrivateMetadataPid\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"privateMetadataPid\"\
        },\
        \"Scte27Pids\": {\
          \"shape\": \"__listOf__integer\",\
          \"locationName\": \"scte27Pids\"\
        },\
        \"Scte35Pid\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"scte35Pid\"\
        },\
        \"TimedMetadataPid\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"timedMetadataPid\"\
        },\
        \"VideoPid\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"videoPid\"\
        }\
      },\
      \"documentation\": \"Packet identifiers map for a given Multiplex program.\"\
    },\
    \"MultiplexProgramServiceDescriptor\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ProviderName\": {\
          \"shape\": \"__stringMax256\",\
          \"locationName\": \"providerName\",\
          \"documentation\": \"Name of the provider.\"\
        },\
        \"ServiceName\": {\
          \"shape\": \"__stringMax256\",\
          \"locationName\": \"serviceName\",\
          \"documentation\": \"Name of the service.\"\
        }\
      },\
      \"documentation\": \"Transport stream service descriptor configuration for the Multiplex program.\",\
      \"required\": [\
        \"ProviderName\",\
        \"ServiceName\"\
      ]\
    },\
    \"MultiplexProgramSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"PreferredChannelPipeline\": {\
          \"shape\": \"PreferredChannelPipeline\",\
          \"locationName\": \"preferredChannelPipeline\",\
          \"documentation\": \"Indicates which pipeline is preferred by the multiplex for program ingest.\"\
        },\
        \"ProgramNumber\": {\
          \"shape\": \"__integerMin0Max65535\",\
          \"locationName\": \"programNumber\",\
          \"documentation\": \"Unique program number.\"\
        },\
        \"ServiceDescriptor\": {\
          \"shape\": \"MultiplexProgramServiceDescriptor\",\
          \"locationName\": \"serviceDescriptor\",\
          \"documentation\": \"Transport stream service descriptor configuration for the Multiplex program.\"\
        },\
        \"VideoSettings\": {\
          \"shape\": \"MultiplexVideoSettings\",\
          \"locationName\": \"videoSettings\",\
          \"documentation\": \"Program video settings configuration.\"\
        }\
      },\
      \"documentation\": \"Multiplex Program settings configuration.\",\
      \"required\": [\
        \"ProgramNumber\"\
      ]\
    },\
    \"MultiplexProgramSummary\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"channelId\",\
          \"documentation\": \"The MediaLive Channel associated with the program.\"\
        },\
        \"ProgramName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"programName\",\
          \"documentation\": \"The name of the multiplex program.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for MultiplexProgramSummary\"\
    },\
    \"MultiplexSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MaximumVideoBufferDelayMilliseconds\": {\
          \"shape\": \"__integerMin1000Max3000\",\
          \"locationName\": \"maximumVideoBufferDelayMilliseconds\",\
          \"documentation\": \"Maximum video buffer delay in milliseconds.\"\
        },\
        \"TransportStreamBitrate\": {\
          \"shape\": \"__integerMin1000000Max100000000\",\
          \"locationName\": \"transportStreamBitrate\",\
          \"documentation\": \"Transport stream bit rate.\"\
        },\
        \"TransportStreamId\": {\
          \"shape\": \"__integerMin0Max65535\",\
          \"locationName\": \"transportStreamId\",\
          \"documentation\": \"Transport stream ID.\"\
        },\
        \"TransportStreamReservedBitrate\": {\
          \"shape\": \"__integerMin0Max100000000\",\
          \"locationName\": \"transportStreamReservedBitrate\",\
          \"documentation\": \"Transport stream reserved bit rate.\"\
        }\
      },\
      \"documentation\": \"Contains configuration for a Multiplex event\",\
      \"required\": [\
        \"TransportStreamBitrate\",\
        \"TransportStreamId\"\
      ]\
    },\
    \"MultiplexSettingsSummary\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"TransportStreamBitrate\": {\
          \"shape\": \"__integerMin1000000Max100000000\",\
          \"locationName\": \"transportStreamBitrate\",\
          \"documentation\": \"Transport stream bit rate.\"\
        }\
      },\
      \"documentation\": \"Contains summary configuration for a Multiplex event.\"\
    },\
    \"MultiplexState\": {\
      \"type\": \"string\",\
      \"documentation\": \"The current state of the multiplex.\",\
      \"enum\": [\
        \"CREATING\",\
        \"CREATE_FAILED\",\
        \"IDLE\",\
        \"STARTING\",\
        \"RUNNING\",\
        \"RECOVERING\",\
        \"STOPPING\",\
        \"DELETING\",\
        \"DELETED\"\
      ]\
    },\
    \"MultiplexStatmuxVideoSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MaximumBitrate\": {\
          \"shape\": \"__integerMin100000Max100000000\",\
          \"locationName\": \"maximumBitrate\",\
          \"documentation\": \"Maximum statmux bitrate.\"\
        },\
        \"MinimumBitrate\": {\
          \"shape\": \"__integerMin100000Max100000000\",\
          \"locationName\": \"minimumBitrate\",\
          \"documentation\": \"Minimum statmux bitrate.\"\
        }\
      },\
      \"documentation\": \"Statmux rate control settings\"\
    },\
    \"MultiplexSummary\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"The unique arn of the multiplex.\"\
        },\
        \"AvailabilityZones\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"availabilityZones\",\
          \"documentation\": \"A list of availability zones for the multiplex.\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id\",\
          \"documentation\": \"The unique id of the multiplex.\"\
        },\
        \"MultiplexSettings\": {\
          \"shape\": \"MultiplexSettingsSummary\",\
          \"locationName\": \"multiplexSettings\",\
          \"documentation\": \"Configuration for a multiplex event.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The name of the multiplex.\"\
        },\
        \"PipelinesRunningCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"pipelinesRunningCount\",\
          \"documentation\": \"The number of currently healthy pipelines.\"\
        },\
        \"ProgramCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"programCount\",\
          \"documentation\": \"The number of programs in the multiplex.\"\
        },\
        \"State\": {\
          \"shape\": \"MultiplexState\",\
          \"locationName\": \"state\",\
          \"documentation\": \"The current state of the multiplex.\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for MultiplexSummary\"\
    },\
    \"MultiplexValidationError\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ElementPath\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"elementPath\",\
          \"documentation\": \"Path to the source of the error.\"\
        },\
        \"ErrorMessage\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"errorMessage\",\
          \"documentation\": \"The error message.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for MultiplexValidationError\"\
    },\
    \"MultiplexVideoSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ConstantBitrate\": {\
          \"shape\": \"__integerMin100000Max100000000\",\
          \"locationName\": \"constantBitrate\",\
          \"documentation\": \"The constant bitrate configuration for the video encode.\\nWhen this field is defined, StatmuxSettings must be undefined.\"\
        },\
        \"StatmuxSettings\": {\
          \"shape\": \"MultiplexStatmuxVideoSettings\",\
          \"locationName\": \"statmuxSettings\",\
          \"documentation\": \"Statmux rate control settings.\\nWhen this field is defined, ConstantBitrate must be undefined.\"\
        }\
      },\
      \"documentation\": \"The video configuration for each program in a multiplex.\"\
    },\
    \"NetworkInputServerValidation\": {\
      \"type\": \"string\",\
      \"documentation\": \"Network Input Server Validation\",\
      \"enum\": [\
        \"CHECK_CRYPTOGRAPHY_AND_VALIDATE_NAME\",\
        \"CHECK_CRYPTOGRAPHY_ONLY\"\
      ]\
    },\
    \"NetworkInputSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"HlsInputSettings\": {\
          \"shape\": \"HlsInputSettings\",\
          \"locationName\": \"hlsInputSettings\",\
          \"documentation\": \"Specifies HLS input settings when the uri is for a HLS manifest.\"\
        },\
        \"ServerValidation\": {\
          \"shape\": \"NetworkInputServerValidation\",\
          \"locationName\": \"serverValidation\",\
          \"documentation\": \"Check HTTPS server certificates. When set to checkCryptographyOnly, cryptography in the certificate will be checked, but not the server's name. Certain subdomains (notably S3 buckets that use dots in the bucket name) do not strictly match the corresponding certificate's wildcard pattern and would otherwise cause the event to error. This setting is ignored for protocols that do not use https.\"\
        }\
      },\
      \"documentation\": \"Network source to transcode. Must be accessible to the Elemental Live node that is running the live event through a network connection.\"\
    },\
    \"NielsenConfiguration\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DistributorId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"distributorId\",\
          \"documentation\": \"Enter the Distributor ID assigned to your organization by Nielsen.\"\
        },\
        \"NielsenPcmToId3Tagging\": {\
          \"shape\": \"NielsenPcmToId3TaggingState\",\
          \"locationName\": \"nielsenPcmToId3Tagging\",\
          \"documentation\": \"Enables Nielsen PCM to ID3 tagging\"\
        }\
      },\
      \"documentation\": \"Nielsen Configuration\"\
    },\
    \"NielsenPcmToId3TaggingState\": {\
      \"type\": \"string\",\
      \"documentation\": \"State of Nielsen PCM to ID3 tagging\",\
      \"enum\": [\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"NotFoundException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\"\
        }\
      },\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 404\
      },\
      \"documentation\": \"Placeholder documentation for NotFoundException\"\
    },\
    \"Offering\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"Unique offering ARN, e.g. 'arn:aws:medialive:us-west-2:123456789012:offering:87654321'\"\
        },\
        \"CurrencyCode\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"currencyCode\",\
          \"documentation\": \"Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'\"\
        },\
        \"Duration\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"duration\",\
          \"documentation\": \"Lease duration, e.g. '12'\"\
        },\
        \"DurationUnits\": {\
          \"shape\": \"OfferingDurationUnits\",\
          \"locationName\": \"durationUnits\",\
          \"documentation\": \"Units for duration, e.g. 'MONTHS'\"\
        },\
        \"FixedPrice\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"fixedPrice\",\
          \"documentation\": \"One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT offering\"\
        },\
        \"OfferingDescription\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"offeringDescription\",\
          \"documentation\": \"Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and standard VQ in US West (Oregon)'\"\
        },\
        \"OfferingId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"offeringId\",\
          \"documentation\": \"Unique offering ID, e.g. '87654321'\"\
        },\
        \"OfferingType\": {\
          \"shape\": \"OfferingType\",\
          \"locationName\": \"offeringType\",\
          \"documentation\": \"Offering type, e.g. 'NO_UPFRONT'\"\
        },\
        \"Region\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"region\",\
          \"documentation\": \"AWS region, e.g. 'us-west-2'\"\
        },\
        \"ResourceSpecification\": {\
          \"shape\": \"ReservationResourceSpecification\",\
          \"locationName\": \"resourceSpecification\",\
          \"documentation\": \"Resource configuration details\"\
        },\
        \"UsagePrice\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"usagePrice\",\
          \"documentation\": \"Recurring usage charge for each reserved resource, e.g. '157.0'\"\
        }\
      },\
      \"documentation\": \"Reserved resources available for purchase\"\
    },\
    \"OfferingDurationUnits\": {\
      \"type\": \"string\",\
      \"documentation\": \"Units for duration, e.g. 'MONTHS'\",\
      \"enum\": [\
        \"MONTHS\"\
      ]\
    },\
    \"OfferingType\": {\
      \"type\": \"string\",\
      \"documentation\": \"Offering type, e.g. 'NO_UPFRONT'\",\
      \"enum\": [\
        \"NO_UPFRONT\"\
      ]\
    },\
    \"Output\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AudioDescriptionNames\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"audioDescriptionNames\",\
          \"documentation\": \"The names of the AudioDescriptions used as audio sources for this output.\"\
        },\
        \"CaptionDescriptionNames\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"captionDescriptionNames\",\
          \"documentation\": \"The names of the CaptionDescriptions used as caption sources for this output.\"\
        },\
        \"OutputName\": {\
          \"shape\": \"__stringMin1Max255\",\
          \"locationName\": \"outputName\",\
          \"documentation\": \"The name used to identify an output.\"\
        },\
        \"OutputSettings\": {\
          \"shape\": \"OutputSettings\",\
          \"locationName\": \"outputSettings\",\
          \"documentation\": \"Output type-specific settings.\"\
        },\
        \"VideoDescriptionName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"videoDescriptionName\",\
          \"documentation\": \"The name of the VideoDescription used as the source for this output.\"\
        }\
      },\
      \"documentation\": \"Output settings. There can be multiple outputs within a group.\",\
      \"required\": [\
        \"OutputSettings\"\
      ]\
    },\
    \"OutputDestination\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id\",\
          \"documentation\": \"User-specified id. This is used in an output group or an output.\"\
        },\
        \"MediaPackageSettings\": {\
          \"shape\": \"__listOfMediaPackageOutputDestinationSettings\",\
          \"locationName\": \"mediaPackageSettings\",\
          \"documentation\": \"Destination settings for a MediaPackage output; one destination for both encoders.\"\
        },\
        \"MultiplexSettings\": {\
          \"shape\": \"MultiplexProgramChannelDestinationSettings\",\
          \"locationName\": \"multiplexSettings\",\
          \"documentation\": \"Destination settings for a Multiplex output; one destination for both encoders.\"\
        },\
        \"Settings\": {\
          \"shape\": \"__listOfOutputDestinationSettings\",\
          \"locationName\": \"settings\",\
          \"documentation\": \"Destination settings for a standard output; one destination for each redundant encoder.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for OutputDestination\"\
    },\
    \"OutputDestinationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"PasswordParam\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"passwordParam\",\
          \"documentation\": \"key used to extract the password from EC2 Parameter store\"\
        },\
        \"StreamName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"streamName\",\
          \"documentation\": \"Stream name for RTMP destinations (URLs of type rtmp://)\"\
        },\
        \"Url\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"url\",\
          \"documentation\": \"A URL specifying a destination\"\
        },\
        \"Username\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"username\",\
          \"documentation\": \"username for destination\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for OutputDestinationSettings\"\
    },\
    \"OutputGroup\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Name\": {\
          \"shape\": \"__stringMax32\",\
          \"locationName\": \"name\",\
          \"documentation\": \"Custom output group name optionally defined by the user.  Only letters, numbers, and the underscore character allowed; only 32 characters allowed.\"\
        },\
        \"OutputGroupSettings\": {\
          \"shape\": \"OutputGroupSettings\",\
          \"locationName\": \"outputGroupSettings\",\
          \"documentation\": \"Settings associated with the output group.\"\
        },\
        \"Outputs\": {\
          \"shape\": \"__listOfOutput\",\
          \"locationName\": \"outputs\"\
        }\
      },\
      \"documentation\": \"Output groups for this Live Event. Output groups contain information about where streams should be distributed.\",\
      \"required\": [\
        \"Outputs\",\
        \"OutputGroupSettings\"\
      ]\
    },\
    \"OutputGroupSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ArchiveGroupSettings\": {\
          \"shape\": \"ArchiveGroupSettings\",\
          \"locationName\": \"archiveGroupSettings\"\
        },\
        \"FrameCaptureGroupSettings\": {\
          \"shape\": \"FrameCaptureGroupSettings\",\
          \"locationName\": \"frameCaptureGroupSettings\"\
        },\
        \"HlsGroupSettings\": {\
          \"shape\": \"HlsGroupSettings\",\
          \"locationName\": \"hlsGroupSettings\"\
        },\
        \"MediaPackageGroupSettings\": {\
          \"shape\": \"MediaPackageGroupSettings\",\
          \"locationName\": \"mediaPackageGroupSettings\"\
        },\
        \"MsSmoothGroupSettings\": {\
          \"shape\": \"MsSmoothGroupSettings\",\
          \"locationName\": \"msSmoothGroupSettings\"\
        },\
        \"MultiplexGroupSettings\": {\
          \"shape\": \"MultiplexGroupSettings\",\
          \"locationName\": \"multiplexGroupSettings\"\
        },\
        \"RtmpGroupSettings\": {\
          \"shape\": \"RtmpGroupSettings\",\
          \"locationName\": \"rtmpGroupSettings\"\
        },\
        \"UdpGroupSettings\": {\
          \"shape\": \"UdpGroupSettings\",\
          \"locationName\": \"udpGroupSettings\"\
        }\
      },\
      \"documentation\": \"Output Group Settings\"\
    },\
    \"OutputLocationRef\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DestinationRefId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"destinationRefId\"\
        }\
      },\
      \"documentation\": \"Reference to an OutputDestination ID defined in the channel\"\
    },\
    \"OutputSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ArchiveOutputSettings\": {\
          \"shape\": \"ArchiveOutputSettings\",\
          \"locationName\": \"archiveOutputSettings\"\
        },\
        \"FrameCaptureOutputSettings\": {\
          \"shape\": \"FrameCaptureOutputSettings\",\
          \"locationName\": \"frameCaptureOutputSettings\"\
        },\
        \"HlsOutputSettings\": {\
          \"shape\": \"HlsOutputSettings\",\
          \"locationName\": \"hlsOutputSettings\"\
        },\
        \"MediaPackageOutputSettings\": {\
          \"shape\": \"MediaPackageOutputSettings\",\
          \"locationName\": \"mediaPackageOutputSettings\"\
        },\
        \"MsSmoothOutputSettings\": {\
          \"shape\": \"MsSmoothOutputSettings\",\
          \"locationName\": \"msSmoothOutputSettings\"\
        },\
        \"MultiplexOutputSettings\": {\
          \"shape\": \"MultiplexOutputSettings\",\
          \"locationName\": \"multiplexOutputSettings\"\
        },\
        \"RtmpOutputSettings\": {\
          \"shape\": \"RtmpOutputSettings\",\
          \"locationName\": \"rtmpOutputSettings\"\
        },\
        \"UdpOutputSettings\": {\
          \"shape\": \"UdpOutputSettings\",\
          \"locationName\": \"udpOutputSettings\"\
        }\
      },\
      \"documentation\": \"Output Settings\"\
    },\
    \"PassThroughSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Pass Through Settings\"\
    },\
    \"PauseStateScheduleActionSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Pipelines\": {\
          \"shape\": \"__listOfPipelinePauseStateSettings\",\
          \"locationName\": \"pipelines\"\
        }\
      },\
      \"documentation\": \"Settings for the action to set pause state of a channel.\"\
    },\
    \"PipelineDetail\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ActiveInputAttachmentName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"activeInputAttachmentName\",\
          \"documentation\": \"The name of the active input attachment currently being ingested by this pipeline.\"\
        },\
        \"ActiveInputSwitchActionName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"activeInputSwitchActionName\",\
          \"documentation\": \"The name of the input switch schedule action that occurred most recently and that resulted in the switch to the current input attachment for this pipeline.\"\
        },\
        \"PipelineId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"pipelineId\",\
          \"documentation\": \"Pipeline ID\"\
        }\
      },\
      \"documentation\": \"Runtime details of a pipeline when a channel is running.\"\
    },\
    \"PipelineId\": {\
      \"type\": \"string\",\
      \"documentation\": \"Pipeline ID\",\
      \"enum\": [\
        \"PIPELINE_0\",\
        \"PIPELINE_1\"\
      ]\
    },\
    \"PipelinePauseStateSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"PipelineId\": {\
          \"shape\": \"PipelineId\",\
          \"locationName\": \"pipelineId\",\
          \"documentation\": \"Pipeline ID to pause (\\\"PIPELINE_0\\\" or \\\"PIPELINE_1\\\").\"\
        }\
      },\
      \"documentation\": \"Settings for pausing a pipeline.\",\
      \"required\": [\
        \"PipelineId\"\
      ]\
    },\
    \"PreferredChannelPipeline\": {\
      \"type\": \"string\",\
      \"documentation\": \"Indicates which pipeline is preferred by the multiplex for program ingest.\\nIf set to \\\\\\\"PIPELINE_0\\\\\\\" or \\\\\\\"PIPELINE_1\\\\\\\" and an unhealthy ingest causes the multiplex to switch to the non-preferred pipeline,\\nit will switch back once that ingest is healthy again. If set to \\\\\\\"CURRENTLY_ACTIVE\\\\\\\",\\nit will not switch back to the other pipeline based on it recovering to a healthy state,\\nit will only switch if the active pipeline becomes unhealthy.\\n\",\
      \"enum\": [\
        \"CURRENTLY_ACTIVE\",\
        \"PIPELINE_0\",\
        \"PIPELINE_1\"\
      ]\
    },\
    \"PurchaseOffering\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Count\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"count\",\
          \"documentation\": \"Number of resources\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"Name for the new reservation\"\
        },\
        \"RequestId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"requestId\",\
          \"documentation\": \"Unique request ID to be specified. This is needed to prevent retries from creating multiple resources.\",\
          \"idempotencyToken\": true\
        },\
        \"Start\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"start\",\
          \"documentation\": \"Requested reservation start time (UTC) in ISO-8601 format. The specified time must be between the first day of the current month and one year from now. If no value is given, the default is now.\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs\"\
        }\
      },\
      \"documentation\": \"PurchaseOffering request\",\
      \"required\": [\
        \"Count\"\
      ]\
    },\
    \"PurchaseOfferingRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Count\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"count\",\
          \"documentation\": \"Number of resources\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"Name for the new reservation\"\
        },\
        \"OfferingId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"offeringId\",\
          \"documentation\": \"Offering to purchase, e.g. '87654321'\"\
        },\
        \"RequestId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"requestId\",\
          \"documentation\": \"Unique request ID to be specified. This is needed to prevent retries from creating multiple resources.\",\
          \"idempotencyToken\": true\
        },\
        \"Start\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"start\",\
          \"documentation\": \"Requested reservation start time (UTC) in ISO-8601 format. The specified time must be between the first day of the current month and one year from now. If no value is given, the default is now.\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs\"\
        }\
      },\
      \"required\": [\
        \"OfferingId\",\
        \"Count\"\
      ],\
      \"documentation\": \"Placeholder documentation for PurchaseOfferingRequest\"\
    },\
    \"PurchaseOfferingResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Reservation\": {\
          \"shape\": \"Reservation\",\
          \"locationName\": \"reservation\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for PurchaseOfferingResponse\"\
    },\
    \"PurchaseOfferingResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Reservation\": {\
          \"shape\": \"Reservation\",\
          \"locationName\": \"reservation\"\
        }\
      },\
      \"documentation\": \"PurchaseOffering response\"\
    },\
    \"Rec601Settings\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Rec601 Settings\"\
    },\
    \"Rec709Settings\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Rec709 Settings\"\
    },\
    \"RemixSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelMappings\": {\
          \"shape\": \"__listOfAudioChannelMapping\",\
          \"locationName\": \"channelMappings\",\
          \"documentation\": \"Mapping of input channels to output channels, with appropriate gain adjustments.\"\
        },\
        \"ChannelsIn\": {\
          \"shape\": \"__integerMin1Max16\",\
          \"locationName\": \"channelsIn\",\
          \"documentation\": \"Number of input channels to be used.\"\
        },\
        \"ChannelsOut\": {\
          \"shape\": \"__integerMin1Max8\",\
          \"locationName\": \"channelsOut\",\
          \"documentation\": \"Number of output channels to be produced.\\nValid values: 1, 2, 4, 6, 8\"\
        }\
      },\
      \"documentation\": \"Remix Settings\",\
      \"required\": [\
        \"ChannelMappings\"\
      ]\
    },\
    \"Reservation\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"Unique reservation ARN, e.g. 'arn:aws:medialive:us-west-2:123456789012:reservation:1234567'\"\
        },\
        \"Count\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"count\",\
          \"documentation\": \"Number of reserved resources\"\
        },\
        \"CurrencyCode\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"currencyCode\",\
          \"documentation\": \"Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'\"\
        },\
        \"Duration\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"duration\",\
          \"documentation\": \"Lease duration, e.g. '12'\"\
        },\
        \"DurationUnits\": {\
          \"shape\": \"OfferingDurationUnits\",\
          \"locationName\": \"durationUnits\",\
          \"documentation\": \"Units for duration, e.g. 'MONTHS'\"\
        },\
        \"End\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"end\",\
          \"documentation\": \"Reservation UTC end date and time in ISO-8601 format, e.g. '2019-03-01T00:00:00'\"\
        },\
        \"FixedPrice\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"fixedPrice\",\
          \"documentation\": \"One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT offering\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"User specified reservation name\"\
        },\
        \"OfferingDescription\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"offeringDescription\",\
          \"documentation\": \"Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and standard VQ in US West (Oregon)'\"\
        },\
        \"OfferingId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"offeringId\",\
          \"documentation\": \"Unique offering ID, e.g. '87654321'\"\
        },\
        \"OfferingType\": {\
          \"shape\": \"OfferingType\",\
          \"locationName\": \"offeringType\",\
          \"documentation\": \"Offering type, e.g. 'NO_UPFRONT'\"\
        },\
        \"Region\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"region\",\
          \"documentation\": \"AWS region, e.g. 'us-west-2'\"\
        },\
        \"ReservationId\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"reservationId\",\
          \"documentation\": \"Unique reservation ID, e.g. '1234567'\"\
        },\
        \"ResourceSpecification\": {\
          \"shape\": \"ReservationResourceSpecification\",\
          \"locationName\": \"resourceSpecification\",\
          \"documentation\": \"Resource configuration details\"\
        },\
        \"Start\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"start\",\
          \"documentation\": \"Reservation UTC start date and time in ISO-8601 format, e.g. '2018-03-01T00:00:00'\"\
        },\
        \"State\": {\
          \"shape\": \"ReservationState\",\
          \"locationName\": \"state\",\
          \"documentation\": \"Current state of reservation, e.g. 'ACTIVE'\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs\"\
        },\
        \"UsagePrice\": {\
          \"shape\": \"__double\",\
          \"locationName\": \"usagePrice\",\
          \"documentation\": \"Recurring usage charge for each reserved resource, e.g. '157.0'\"\
        }\
      },\
      \"documentation\": \"Reserved resources available to use\"\
    },\
    \"ReservationCodec\": {\
      \"type\": \"string\",\
      \"documentation\": \"Codec, 'MPEG2', 'AVC', 'HEVC', or 'AUDIO'\",\
      \"enum\": [\
        \"MPEG2\",\
        \"AVC\",\
        \"HEVC\",\
        \"AUDIO\"\
      ]\
    },\
    \"ReservationMaximumBitrate\": {\
      \"type\": \"string\",\
      \"documentation\": \"Maximum bitrate in megabits per second\",\
      \"enum\": [\
        \"MAX_10_MBPS\",\
        \"MAX_20_MBPS\",\
        \"MAX_50_MBPS\"\
      ]\
    },\
    \"ReservationMaximumFramerate\": {\
      \"type\": \"string\",\
      \"documentation\": \"Maximum framerate in frames per second (Outputs only)\",\
      \"enum\": [\
        \"MAX_30_FPS\",\
        \"MAX_60_FPS\"\
      ]\
    },\
    \"ReservationResolution\": {\
      \"type\": \"string\",\
      \"documentation\": \"Resolution based on lines of vertical resolution; SD is less than 720 lines, HD is 720 to 1080 lines, FHD is 1080 lines, UHD is greater than 1080 lines\\n\",\
      \"enum\": [\
        \"SD\",\
        \"HD\",\
        \"FHD\",\
        \"UHD\"\
      ]\
    },\
    \"ReservationResourceSpecification\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelClass\": {\
          \"shape\": \"ChannelClass\",\
          \"locationName\": \"channelClass\",\
          \"documentation\": \"Channel class, e.g. 'STANDARD'\"\
        },\
        \"Codec\": {\
          \"shape\": \"ReservationCodec\",\
          \"locationName\": \"codec\",\
          \"documentation\": \"Codec, e.g. 'AVC'\"\
        },\
        \"MaximumBitrate\": {\
          \"shape\": \"ReservationMaximumBitrate\",\
          \"locationName\": \"maximumBitrate\",\
          \"documentation\": \"Maximum bitrate, e.g. 'MAX_20_MBPS'\"\
        },\
        \"MaximumFramerate\": {\
          \"shape\": \"ReservationMaximumFramerate\",\
          \"locationName\": \"maximumFramerate\",\
          \"documentation\": \"Maximum framerate, e.g. 'MAX_30_FPS' (Outputs only)\"\
        },\
        \"Resolution\": {\
          \"shape\": \"ReservationResolution\",\
          \"locationName\": \"resolution\",\
          \"documentation\": \"Resolution, e.g. 'HD'\"\
        },\
        \"ResourceType\": {\
          \"shape\": \"ReservationResourceType\",\
          \"locationName\": \"resourceType\",\
          \"documentation\": \"Resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'\"\
        },\
        \"SpecialFeature\": {\
          \"shape\": \"ReservationSpecialFeature\",\
          \"locationName\": \"specialFeature\",\
          \"documentation\": \"Special feature, e.g. 'AUDIO_NORMALIZATION' (Channels only)\"\
        },\
        \"VideoQuality\": {\
          \"shape\": \"ReservationVideoQuality\",\
          \"locationName\": \"videoQuality\",\
          \"documentation\": \"Video quality, e.g. 'STANDARD' (Outputs only)\"\
        }\
      },\
      \"documentation\": \"Resource configuration (codec, resolution, bitrate, ...)\"\
    },\
    \"ReservationResourceType\": {\
      \"type\": \"string\",\
      \"documentation\": \"Resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'\",\
      \"enum\": [\
        \"INPUT\",\
        \"OUTPUT\",\
        \"MULTIPLEX\",\
        \"CHANNEL\"\
      ]\
    },\
    \"ReservationSpecialFeature\": {\
      \"type\": \"string\",\
      \"documentation\": \"Special features, 'ADVANCED_AUDIO' or 'AUDIO_NORMALIZATION'\",\
      \"enum\": [\
        \"ADVANCED_AUDIO\",\
        \"AUDIO_NORMALIZATION\"\
      ]\
    },\
    \"ReservationState\": {\
      \"type\": \"string\",\
      \"documentation\": \"Current reservation state\",\
      \"enum\": [\
        \"ACTIVE\",\
        \"EXPIRED\",\
        \"CANCELED\",\
        \"DELETED\"\
      ]\
    },\
    \"ReservationVideoQuality\": {\
      \"type\": \"string\",\
      \"documentation\": \"Video quality, e.g. 'STANDARD' (Outputs only)\",\
      \"enum\": [\
        \"STANDARD\",\
        \"ENHANCED\",\
        \"PREMIUM\"\
      ]\
    },\
    \"ResourceConflict\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ResourceConflict\"\
    },\
    \"ResourceNotFound\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ResourceNotFound\"\
    },\
    \"RtmpCacheFullBehavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"Rtmp Cache Full Behavior\",\
      \"enum\": [\
        \"DISCONNECT_IMMEDIATELY\",\
        \"WAIT_FOR_SERVER\"\
      ]\
    },\
    \"RtmpCaptionData\": {\
      \"type\": \"string\",\
      \"documentation\": \"Rtmp Caption Data\",\
      \"enum\": [\
        \"ALL\",\
        \"FIELD1_608\",\
        \"FIELD1_AND_FIELD2_608\"\
      ]\
    },\
    \"RtmpCaptionInfoDestinationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Rtmp Caption Info Destination Settings\"\
    },\
    \"RtmpGroupSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AuthenticationScheme\": {\
          \"shape\": \"AuthenticationScheme\",\
          \"locationName\": \"authenticationScheme\",\
          \"documentation\": \"Authentication scheme to use when connecting with CDN\"\
        },\
        \"CacheFullBehavior\": {\
          \"shape\": \"RtmpCacheFullBehavior\",\
          \"locationName\": \"cacheFullBehavior\",\
          \"documentation\": \"Controls behavior when content cache fills up. If remote origin server stalls the RTMP connection and does not accept content fast enough the 'Media Cache' will fill up. When the cache reaches the duration specified by cacheLength the cache will stop accepting new content. If set to disconnectImmediately, the RTMP output will force a disconnect. Clear the media cache, and reconnect after restartDelay seconds. If set to waitForServer, the RTMP output will wait up to 5 minutes to allow the origin server to begin accepting data again.\"\
        },\
        \"CacheLength\": {\
          \"shape\": \"__integerMin30\",\
          \"locationName\": \"cacheLength\",\
          \"documentation\": \"Cache length, in seconds, is used to calculate buffer size.\"\
        },\
        \"CaptionData\": {\
          \"shape\": \"RtmpCaptionData\",\
          \"locationName\": \"captionData\",\
          \"documentation\": \"Controls the types of data that passes to onCaptionInfo outputs.  If set to 'all' then 608 and 708 carried DTVCC data will be passed.  If set to 'field1AndField2608' then DTVCC data will be stripped out, but 608 data from both fields will be passed. If set to 'field1608' then only the data carried in 608 from field 1 video will be passed.\"\
        },\
        \"InputLossAction\": {\
          \"shape\": \"InputLossActionForRtmpOut\",\
          \"locationName\": \"inputLossAction\",\
          \"documentation\": \"Controls the behavior of this RTMP group if input becomes unavailable.\\n\\n- emitOutput: Emit a slate until input returns.\\n- pauseOutput: Stop transmitting data until input returns. This does not close the underlying RTMP connection.\"\
        },\
        \"RestartDelay\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"restartDelay\",\
          \"documentation\": \"If a streaming output fails, number of seconds to wait until a restart is initiated. A value of 0 means never restart.\"\
        }\
      },\
      \"documentation\": \"Rtmp Group Settings\"\
    },\
    \"RtmpOutputCertificateMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Rtmp Output Certificate Mode\",\
      \"enum\": [\
        \"SELF_SIGNED\",\
        \"VERIFY_AUTHENTICITY\"\
      ]\
    },\
    \"RtmpOutputSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CertificateMode\": {\
          \"shape\": \"RtmpOutputCertificateMode\",\
          \"locationName\": \"certificateMode\",\
          \"documentation\": \"If set to verifyAuthenticity, verify the tls certificate chain to a trusted Certificate Authority (CA).  This will cause rtmps outputs with self-signed certificates to fail.\"\
        },\
        \"ConnectionRetryInterval\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"connectionRetryInterval\",\
          \"documentation\": \"Number of seconds to wait before retrying a connection to the Flash Media server if the connection is lost.\"\
        },\
        \"Destination\": {\
          \"shape\": \"OutputLocationRef\",\
          \"locationName\": \"destination\",\
          \"documentation\": \"The RTMP endpoint excluding the stream name (eg. rtmp://host/appname). For connection to Akamai, a username and password must be supplied. URI fields accept format identifiers.\"\
        },\
        \"NumRetries\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"numRetries\",\
          \"documentation\": \"Number of retry attempts.\"\
        }\
      },\
      \"documentation\": \"Rtmp Output Settings\",\
      \"required\": [\
        \"Destination\"\
      ]\
    },\
    \"ScheduleAction\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ActionName\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"actionName\",\
          \"documentation\": \"The name of the action, must be unique within the schedule. This name provides the main reference to an action once it is added to the schedule. A name is unique if it is no longer in the schedule. The schedule is automatically cleaned up to remove actions with a start time of more than 1 hour ago (approximately) so at that point a name can be reused.\"\
        },\
        \"ScheduleActionSettings\": {\
          \"shape\": \"ScheduleActionSettings\",\
          \"locationName\": \"scheduleActionSettings\",\
          \"documentation\": \"Settings for this schedule action.\"\
        },\
        \"ScheduleActionStartSettings\": {\
          \"shape\": \"ScheduleActionStartSettings\",\
          \"locationName\": \"scheduleActionStartSettings\",\
          \"documentation\": \"The time for the action to start in the channel.\"\
        }\
      },\
      \"documentation\": \"Contains information on a single schedule action.\",\
      \"required\": [\
        \"ActionName\",\
        \"ScheduleActionStartSettings\",\
        \"ScheduleActionSettings\"\
      ]\
    },\
    \"ScheduleActionSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"HlsId3SegmentTaggingSettings\": {\
          \"shape\": \"HlsId3SegmentTaggingScheduleActionSettings\",\
          \"locationName\": \"hlsId3SegmentTaggingSettings\",\
          \"documentation\": \"Action to insert HLS ID3 segment tagging\"\
        },\
        \"HlsTimedMetadataSettings\": {\
          \"shape\": \"HlsTimedMetadataScheduleActionSettings\",\
          \"locationName\": \"hlsTimedMetadataSettings\",\
          \"documentation\": \"Action to insert HLS metadata\"\
        },\
        \"InputSwitchSettings\": {\
          \"shape\": \"InputSwitchScheduleActionSettings\",\
          \"locationName\": \"inputSwitchSettings\",\
          \"documentation\": \"Action to switch the input\"\
        },\
        \"PauseStateSettings\": {\
          \"shape\": \"PauseStateScheduleActionSettings\",\
          \"locationName\": \"pauseStateSettings\",\
          \"documentation\": \"Action to pause or unpause one or both channel pipelines\"\
        },\
        \"Scte35ReturnToNetworkSettings\": {\
          \"shape\": \"Scte35ReturnToNetworkScheduleActionSettings\",\
          \"locationName\": \"scte35ReturnToNetworkSettings\",\
          \"documentation\": \"Action to insert SCTE-35 return_to_network message\"\
        },\
        \"Scte35SpliceInsertSettings\": {\
          \"shape\": \"Scte35SpliceInsertScheduleActionSettings\",\
          \"locationName\": \"scte35SpliceInsertSettings\",\
          \"documentation\": \"Action to insert SCTE-35 splice_insert message\"\
        },\
        \"Scte35TimeSignalSettings\": {\
          \"shape\": \"Scte35TimeSignalScheduleActionSettings\",\
          \"locationName\": \"scte35TimeSignalSettings\",\
          \"documentation\": \"Action to insert SCTE-35 time_signal message\"\
        },\
        \"StaticImageActivateSettings\": {\
          \"shape\": \"StaticImageActivateScheduleActionSettings\",\
          \"locationName\": \"staticImageActivateSettings\",\
          \"documentation\": \"Action to activate a static image overlay\"\
        },\
        \"StaticImageDeactivateSettings\": {\
          \"shape\": \"StaticImageDeactivateScheduleActionSettings\",\
          \"locationName\": \"staticImageDeactivateSettings\",\
          \"documentation\": \"Action to deactivate a static image overlay\"\
        }\
      },\
      \"documentation\": \"Holds the settings for a single schedule action.\"\
    },\
    \"ScheduleActionStartSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"FixedModeScheduleActionStartSettings\": {\
          \"shape\": \"FixedModeScheduleActionStartSettings\",\
          \"locationName\": \"fixedModeScheduleActionStartSettings\",\
          \"documentation\": \"Option for specifying the start time for an action.\"\
        },\
        \"FollowModeScheduleActionStartSettings\": {\
          \"shape\": \"FollowModeScheduleActionStartSettings\",\
          \"locationName\": \"followModeScheduleActionStartSettings\",\
          \"documentation\": \"Option for specifying an action as relative to another action.\"\
        },\
        \"ImmediateModeScheduleActionStartSettings\": {\
          \"shape\": \"ImmediateModeScheduleActionStartSettings\",\
          \"locationName\": \"immediateModeScheduleActionStartSettings\",\
          \"documentation\": \"Option for specifying an action that should be applied immediately.\"\
        }\
      },\
      \"documentation\": \"Settings to specify when an action should occur. Only one of the options must be selected.\"\
    },\
    \"ScheduleDeleteResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Result of a schedule deletion.\"\
    },\
    \"ScheduleDescribeResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"NextToken\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"nextToken\",\
          \"documentation\": \"The next token; for use in pagination.\"\
        },\
        \"ScheduleActions\": {\
          \"shape\": \"__listOfScheduleAction\",\
          \"locationName\": \"scheduleActions\",\
          \"documentation\": \"The list of actions in the schedule.\"\
        }\
      },\
      \"documentation\": \"Results of a schedule describe.\",\
      \"required\": [\
        \"ScheduleActions\"\
      ]\
    },\
    \"Scte20Convert608To708\": {\
      \"type\": \"string\",\
      \"documentation\": \"Scte20 Convert608 To708\",\
      \"enum\": [\
        \"DISABLED\",\
        \"UPCONVERT\"\
      ]\
    },\
    \"Scte20PlusEmbeddedDestinationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Scte20 Plus Embedded Destination Settings\"\
    },\
    \"Scte20SourceSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Convert608To708\": {\
          \"shape\": \"Scte20Convert608To708\",\
          \"locationName\": \"convert608To708\",\
          \"documentation\": \"If upconvert, 608 data is both passed through via the \\\"608 compatibility bytes\\\" fields of the 708 wrapper as well as translated into 708. 708 data present in the source content will be discarded.\"\
        },\
        \"Source608ChannelNumber\": {\
          \"shape\": \"__integerMin1Max4\",\
          \"locationName\": \"source608ChannelNumber\",\
          \"documentation\": \"Specifies the 608/708 channel number within the video track from which to extract captions. Unused for passthrough.\"\
        }\
      },\
      \"documentation\": \"Scte20 Source Settings\"\
    },\
    \"Scte27DestinationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Scte27 Destination Settings\"\
    },\
    \"Scte27SourceSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Pid\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"pid\",\
          \"documentation\": \"The pid field is used in conjunction with the caption selector languageCode field as follows:\\n  - Specify PID and Language: Extracts captions from that PID; the language is \\\"informational\\\".\\n  - Specify PID and omit Language: Extracts the specified PID.\\n  - Omit PID and specify Language: Extracts the specified language, whichever PID that happens to be.\\n  - Omit PID and omit Language: Valid only if source is DVB-Sub that is being passed through; all languages will be passed through.\"\
        }\
      },\
      \"documentation\": \"Scte27 Source Settings\"\
    },\
    \"Scte35AposNoRegionalBlackoutBehavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"Scte35 Apos No Regional Blackout Behavior\",\
      \"enum\": [\
        \"FOLLOW\",\
        \"IGNORE\"\
      ]\
    },\
    \"Scte35AposWebDeliveryAllowedBehavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"Scte35 Apos Web Delivery Allowed Behavior\",\
      \"enum\": [\
        \"FOLLOW\",\
        \"IGNORE\"\
      ]\
    },\
    \"Scte35ArchiveAllowedFlag\": {\
      \"type\": \"string\",\
      \"documentation\": \"Corresponds to the archive_allowed parameter. A value of ARCHIVE_NOT_ALLOWED corresponds to 0 (false) in the SCTE-35 specification. If you include one of the \\\"restriction\\\" flags then you must include all four of them.\",\
      \"enum\": [\
        \"ARCHIVE_NOT_ALLOWED\",\
        \"ARCHIVE_ALLOWED\"\
      ]\
    },\
    \"Scte35DeliveryRestrictions\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ArchiveAllowedFlag\": {\
          \"shape\": \"Scte35ArchiveAllowedFlag\",\
          \"locationName\": \"archiveAllowedFlag\",\
          \"documentation\": \"Corresponds to SCTE-35 archive_allowed_flag.\"\
        },\
        \"DeviceRestrictions\": {\
          \"shape\": \"Scte35DeviceRestrictions\",\
          \"locationName\": \"deviceRestrictions\",\
          \"documentation\": \"Corresponds to SCTE-35 device_restrictions parameter.\"\
        },\
        \"NoRegionalBlackoutFlag\": {\
          \"shape\": \"Scte35NoRegionalBlackoutFlag\",\
          \"locationName\": \"noRegionalBlackoutFlag\",\
          \"documentation\": \"Corresponds to SCTE-35 no_regional_blackout_flag parameter.\"\
        },\
        \"WebDeliveryAllowedFlag\": {\
          \"shape\": \"Scte35WebDeliveryAllowedFlag\",\
          \"locationName\": \"webDeliveryAllowedFlag\",\
          \"documentation\": \"Corresponds to SCTE-35 web_delivery_allowed_flag parameter.\"\
        }\
      },\
      \"documentation\": \"Corresponds to SCTE-35 delivery_not_restricted_flag parameter. To declare delivery restrictions, include this element and its four \\\"restriction\\\" flags. To declare that there are no restrictions, omit this element.\",\
      \"required\": [\
        \"DeviceRestrictions\",\
        \"ArchiveAllowedFlag\",\
        \"WebDeliveryAllowedFlag\",\
        \"NoRegionalBlackoutFlag\"\
      ]\
    },\
    \"Scte35Descriptor\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Scte35DescriptorSettings\": {\
          \"shape\": \"Scte35DescriptorSettings\",\
          \"locationName\": \"scte35DescriptorSettings\",\
          \"documentation\": \"SCTE-35 Descriptor Settings.\"\
        }\
      },\
      \"documentation\": \"Holds one set of SCTE-35 Descriptor Settings.\",\
      \"required\": [\
        \"Scte35DescriptorSettings\"\
      ]\
    },\
    \"Scte35DescriptorSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SegmentationDescriptorScte35DescriptorSettings\": {\
          \"shape\": \"Scte35SegmentationDescriptor\",\
          \"locationName\": \"segmentationDescriptorScte35DescriptorSettings\",\
          \"documentation\": \"SCTE-35 Segmentation Descriptor.\"\
        }\
      },\
      \"documentation\": \"SCTE-35 Descriptor settings.\",\
      \"required\": [\
        \"SegmentationDescriptorScte35DescriptorSettings\"\
      ]\
    },\
    \"Scte35DeviceRestrictions\": {\
      \"type\": \"string\",\
      \"documentation\": \"Corresponds to the device_restrictions parameter in a segmentation_descriptor. If you include one of the \\\"restriction\\\" flags then you must include all four of them.\",\
      \"enum\": [\
        \"NONE\",\
        \"RESTRICT_GROUP0\",\
        \"RESTRICT_GROUP1\",\
        \"RESTRICT_GROUP2\"\
      ]\
    },\
    \"Scte35NoRegionalBlackoutFlag\": {\
      \"type\": \"string\",\
      \"documentation\": \"Corresponds to the no_regional_blackout_flag parameter. A value of REGIONAL_BLACKOUT corresponds to 0 (false) in the SCTE-35 specification. If you include one of the \\\"restriction\\\" flags then you must include all four of them.\",\
      \"enum\": [\
        \"REGIONAL_BLACKOUT\",\
        \"NO_REGIONAL_BLACKOUT\"\
      ]\
    },\
    \"Scte35ReturnToNetworkScheduleActionSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SpliceEventId\": {\
          \"shape\": \"__longMin0Max4294967295\",\
          \"locationName\": \"spliceEventId\",\
          \"documentation\": \"The splice_event_id for the SCTE-35 splice_insert, as defined in SCTE-35.\"\
        }\
      },\
      \"documentation\": \"Settings for a SCTE-35 return_to_network message.\",\
      \"required\": [\
        \"SpliceEventId\"\
      ]\
    },\
    \"Scte35SegmentationCancelIndicator\": {\
      \"type\": \"string\",\
      \"documentation\": \"Corresponds to SCTE-35 segmentation_event_cancel_indicator. SEGMENTATION_EVENT_NOT_CANCELED corresponds to 0 in the SCTE-35 specification and indicates that this is an insertion request. SEGMENTATION_EVENT_CANCELED corresponds to 1 in the SCTE-35 specification and indicates that this is a cancelation request, in which case complete this field and the existing event ID to cancel.\",\
      \"enum\": [\
        \"SEGMENTATION_EVENT_NOT_CANCELED\",\
        \"SEGMENTATION_EVENT_CANCELED\"\
      ]\
    },\
    \"Scte35SegmentationDescriptor\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"DeliveryRestrictions\": {\
          \"shape\": \"Scte35DeliveryRestrictions\",\
          \"locationName\": \"deliveryRestrictions\",\
          \"documentation\": \"Holds the four SCTE-35 delivery restriction parameters.\"\
        },\
        \"SegmentNum\": {\
          \"shape\": \"__integerMin0Max255\",\
          \"locationName\": \"segmentNum\",\
          \"documentation\": \"Corresponds to SCTE-35 segment_num. A value that is valid for the specified segmentation_type_id.\"\
        },\
        \"SegmentationCancelIndicator\": {\
          \"shape\": \"Scte35SegmentationCancelIndicator\",\
          \"locationName\": \"segmentationCancelIndicator\",\
          \"documentation\": \"Corresponds to SCTE-35 segmentation_event_cancel_indicator.\"\
        },\
        \"SegmentationDuration\": {\
          \"shape\": \"__longMin0Max1099511627775\",\
          \"locationName\": \"segmentationDuration\",\
          \"documentation\": \"Corresponds to SCTE-35 segmentation_duration. Optional. The duration for the time_signal, in 90 KHz ticks. To convert seconds to ticks, multiple the seconds by 90,000. Enter time in 90 KHz clock ticks. If you do not enter a duration, the time_signal will continue until you insert a cancellation message.\"\
        },\
        \"SegmentationEventId\": {\
          \"shape\": \"__longMin0Max4294967295\",\
          \"locationName\": \"segmentationEventId\",\
          \"documentation\": \"Corresponds to SCTE-35 segmentation_event_id. \"\
        },\
        \"SegmentationTypeId\": {\
          \"shape\": \"__integerMin0Max255\",\
          \"locationName\": \"segmentationTypeId\",\
          \"documentation\": \"Corresponds to SCTE-35 segmentation_type_id. One of the segmentation_type_id values listed in the SCTE-35 specification. On the console, enter the ID in decimal (for example, \\\"52\\\"). In the CLI, API, or an SDK, enter the ID in hex (for example, \\\"0x34\\\") or decimal (for example, \\\"52\\\").\"\
        },\
        \"SegmentationUpid\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"segmentationUpid\",\
          \"documentation\": \"Corresponds to SCTE-35 segmentation_upid. Enter a string containing the hexadecimal representation of the characters that make up the SCTE-35 segmentation_upid value. Must contain an even number of hex characters. Do not include spaces between each hex pair. For example, the ASCII \\\"ADS Information\\\" becomes hex \\\"41445320496e666f726d6174696f6e.\"\
        },\
        \"SegmentationUpidType\": {\
          \"shape\": \"__integerMin0Max255\",\
          \"locationName\": \"segmentationUpidType\",\
          \"documentation\": \"Corresponds to SCTE-35 segmentation_upid_type. On the console, enter one of the types listed in the SCTE-35 specification, converted to a decimal. For example, \\\"0x0C\\\" hex from the specification is \\\"12\\\" in decimal. In the CLI, API, or an SDK, enter one of the types listed in the SCTE-35 specification, in either hex (for example, \\\"0x0C\\\" ) or in decimal (for example, \\\"12\\\").\"\
        },\
        \"SegmentsExpected\": {\
          \"shape\": \"__integerMin0Max255\",\
          \"locationName\": \"segmentsExpected\",\
          \"documentation\": \"Corresponds to SCTE-35 segments_expected. A value that is valid for the specified segmentation_type_id.\"\
        },\
        \"SubSegmentNum\": {\
          \"shape\": \"__integerMin0Max255\",\
          \"locationName\": \"subSegmentNum\",\
          \"documentation\": \"Corresponds to SCTE-35 sub_segment_num. A value that is valid for the specified segmentation_type_id.\"\
        },\
        \"SubSegmentsExpected\": {\
          \"shape\": \"__integerMin0Max255\",\
          \"locationName\": \"subSegmentsExpected\",\
          \"documentation\": \"Corresponds to SCTE-35 sub_segments_expected. A value that is valid for the specified segmentation_type_id.\"\
        }\
      },\
      \"documentation\": \"Corresponds to SCTE-35 segmentation_descriptor.\",\
      \"required\": [\
        \"SegmentationEventId\",\
        \"SegmentationCancelIndicator\"\
      ]\
    },\
    \"Scte35SpliceInsert\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AdAvailOffset\": {\
          \"shape\": \"__integerMinNegative1000Max1000\",\
          \"locationName\": \"adAvailOffset\",\
          \"documentation\": \"When specified, this offset (in milliseconds) is added to the input Ad Avail PTS time. This only applies to embedded SCTE 104/35 messages and does not apply to OOB messages.\"\
        },\
        \"NoRegionalBlackoutFlag\": {\
          \"shape\": \"Scte35SpliceInsertNoRegionalBlackoutBehavior\",\
          \"locationName\": \"noRegionalBlackoutFlag\",\
          \"documentation\": \"When set to ignore, Segment Descriptors with noRegionalBlackoutFlag set to 0 will no longer trigger blackouts or Ad Avail slates\"\
        },\
        \"WebDeliveryAllowedFlag\": {\
          \"shape\": \"Scte35SpliceInsertWebDeliveryAllowedBehavior\",\
          \"locationName\": \"webDeliveryAllowedFlag\",\
          \"documentation\": \"When set to ignore, Segment Descriptors with webDeliveryAllowedFlag set to 0 will no longer trigger blackouts or Ad Avail slates\"\
        }\
      },\
      \"documentation\": \"Scte35 Splice Insert\"\
    },\
    \"Scte35SpliceInsertNoRegionalBlackoutBehavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"Scte35 Splice Insert No Regional Blackout Behavior\",\
      \"enum\": [\
        \"FOLLOW\",\
        \"IGNORE\"\
      ]\
    },\
    \"Scte35SpliceInsertScheduleActionSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Duration\": {\
          \"shape\": \"__longMin0Max8589934591\",\
          \"locationName\": \"duration\",\
          \"documentation\": \"Optional, the duration for the splice_insert, in 90 KHz ticks. To convert seconds to ticks, multiple the seconds by 90,000. If you enter a duration, there is an expectation that the downstream system can read the duration and cue in at that time. If you do not enter a duration, the splice_insert will continue indefinitely and there is an expectation that you will enter a return_to_network to end the splice_insert at the appropriate time.\"\
        },\
        \"SpliceEventId\": {\
          \"shape\": \"__longMin0Max4294967295\",\
          \"locationName\": \"spliceEventId\",\
          \"documentation\": \"The splice_event_id for the SCTE-35 splice_insert, as defined in SCTE-35.\"\
        }\
      },\
      \"documentation\": \"Settings for a SCTE-35 splice_insert message.\",\
      \"required\": [\
        \"SpliceEventId\"\
      ]\
    },\
    \"Scte35SpliceInsertWebDeliveryAllowedBehavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"Scte35 Splice Insert Web Delivery Allowed Behavior\",\
      \"enum\": [\
        \"FOLLOW\",\
        \"IGNORE\"\
      ]\
    },\
    \"Scte35TimeSignalApos\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AdAvailOffset\": {\
          \"shape\": \"__integerMinNegative1000Max1000\",\
          \"locationName\": \"adAvailOffset\",\
          \"documentation\": \"When specified, this offset (in milliseconds) is added to the input Ad Avail PTS time. This only applies to embedded SCTE 104/35 messages and does not apply to OOB messages.\"\
        },\
        \"NoRegionalBlackoutFlag\": {\
          \"shape\": \"Scte35AposNoRegionalBlackoutBehavior\",\
          \"locationName\": \"noRegionalBlackoutFlag\",\
          \"documentation\": \"When set to ignore, Segment Descriptors with noRegionalBlackoutFlag set to 0 will no longer trigger blackouts or Ad Avail slates\"\
        },\
        \"WebDeliveryAllowedFlag\": {\
          \"shape\": \"Scte35AposWebDeliveryAllowedBehavior\",\
          \"locationName\": \"webDeliveryAllowedFlag\",\
          \"documentation\": \"When set to ignore, Segment Descriptors with webDeliveryAllowedFlag set to 0 will no longer trigger blackouts or Ad Avail slates\"\
        }\
      },\
      \"documentation\": \"Scte35 Time Signal Apos\"\
    },\
    \"Scte35TimeSignalScheduleActionSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Scte35Descriptors\": {\
          \"shape\": \"__listOfScte35Descriptor\",\
          \"locationName\": \"scte35Descriptors\",\
          \"documentation\": \"The list of SCTE-35 descriptors accompanying the SCTE-35 time_signal.\"\
        }\
      },\
      \"documentation\": \"Settings for a SCTE-35 time_signal.\",\
      \"required\": [\
        \"Scte35Descriptors\"\
      ]\
    },\
    \"Scte35WebDeliveryAllowedFlag\": {\
      \"type\": \"string\",\
      \"documentation\": \"Corresponds to the web_delivery_allowed_flag parameter. A value of WEB_DELIVERY_NOT_ALLOWED corresponds to 0 (false) in the SCTE-35 specification. If you include one of the \\\"restriction\\\" flags then you must include all four of them.\",\
      \"enum\": [\
        \"WEB_DELIVERY_NOT_ALLOWED\",\
        \"WEB_DELIVERY_ALLOWED\"\
      ]\
    },\
    \"SmoothGroupAudioOnlyTimecodeControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"Smooth Group Audio Only Timecode Control\",\
      \"enum\": [\
        \"PASSTHROUGH\",\
        \"USE_CONFIGURED_CLOCK\"\
      ]\
    },\
    \"SmoothGroupCertificateMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Smooth Group Certificate Mode\",\
      \"enum\": [\
        \"SELF_SIGNED\",\
        \"VERIFY_AUTHENTICITY\"\
      ]\
    },\
    \"SmoothGroupEventIdMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Smooth Group Event Id Mode\",\
      \"enum\": [\
        \"NO_EVENT_ID\",\
        \"USE_CONFIGURED\",\
        \"USE_TIMESTAMP\"\
      ]\
    },\
    \"SmoothGroupEventStopBehavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"Smooth Group Event Stop Behavior\",\
      \"enum\": [\
        \"NONE\",\
        \"SEND_EOS\"\
      ]\
    },\
    \"SmoothGroupSegmentationMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Smooth Group Segmentation Mode\",\
      \"enum\": [\
        \"USE_INPUT_SEGMENTATION\",\
        \"USE_SEGMENT_DURATION\"\
      ]\
    },\
    \"SmoothGroupSparseTrackType\": {\
      \"type\": \"string\",\
      \"documentation\": \"Smooth Group Sparse Track Type\",\
      \"enum\": [\
        \"NONE\",\
        \"SCTE_35\",\
        \"SCTE_35_WITHOUT_SEGMENTATION\"\
      ]\
    },\
    \"SmoothGroupStreamManifestBehavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"Smooth Group Stream Manifest Behavior\",\
      \"enum\": [\
        \"DO_NOT_SEND\",\
        \"SEND\"\
      ]\
    },\
    \"SmoothGroupTimestampOffsetMode\": {\
      \"type\": \"string\",\
      \"documentation\": \"Smooth Group Timestamp Offset Mode\",\
      \"enum\": [\
        \"USE_CONFIGURED_OFFSET\",\
        \"USE_EVENT_START_DATE\"\
      ]\
    },\
    \"SmpteTtDestinationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Smpte Tt Destination Settings\"\
    },\
    \"StandardHlsSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"AudioRenditionSets\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"audioRenditionSets\",\
          \"documentation\": \"List all the audio groups that are used with the video output stream. Input all the audio GROUP-IDs that are associated to the video, separate by ','.\"\
        },\
        \"M3u8Settings\": {\
          \"shape\": \"M3u8Settings\",\
          \"locationName\": \"m3u8Settings\"\
        }\
      },\
      \"documentation\": \"Standard Hls Settings\",\
      \"required\": [\
        \"M3u8Settings\"\
      ]\
    },\
    \"StartChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"channelId\",\
          \"documentation\": \"A request to start a channel\"\
        }\
      },\
      \"required\": [\
        \"ChannelId\"\
      ],\
      \"documentation\": \"Placeholder documentation for StartChannelRequest\"\
    },\
    \"StartChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"The unique arn of the channel.\"\
        },\
        \"ChannelClass\": {\
          \"shape\": \"ChannelClass\",\
          \"locationName\": \"channelClass\",\
          \"documentation\": \"The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfOutputDestination\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"A list of destinations of the channel. For UDP outputs, there is one\\ndestination per output. For other types (HLS, for example), there is\\none destination per packager.\\n\"\
        },\
        \"EgressEndpoints\": {\
          \"shape\": \"__listOfChannelEgressEndpoint\",\
          \"locationName\": \"egressEndpoints\",\
          \"documentation\": \"The endpoints where outgoing connections initiate from\"\
        },\
        \"EncoderSettings\": {\
          \"shape\": \"EncoderSettings\",\
          \"locationName\": \"encoderSettings\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id\",\
          \"documentation\": \"The unique id of the channel.\"\
        },\
        \"InputAttachments\": {\
          \"shape\": \"__listOfInputAttachment\",\
          \"locationName\": \"inputAttachments\",\
          \"documentation\": \"List of input attachments for channel.\"\
        },\
        \"InputSpecification\": {\
          \"shape\": \"InputSpecification\",\
          \"locationName\": \"inputSpecification\"\
        },\
        \"LogLevel\": {\
          \"shape\": \"LogLevel\",\
          \"locationName\": \"logLevel\",\
          \"documentation\": \"The log level being written to CloudWatch Logs.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The name of the channel. (user-mutable)\"\
        },\
        \"PipelineDetails\": {\
          \"shape\": \"__listOfPipelineDetail\",\
          \"locationName\": \"pipelineDetails\",\
          \"documentation\": \"Runtime details for the pipelines of a running channel.\"\
        },\
        \"PipelinesRunningCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"pipelinesRunningCount\",\
          \"documentation\": \"The number of currently healthy pipelines.\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"roleArn\",\
          \"documentation\": \"The Amazon Resource Name (ARN) of the role assumed when running the Channel.\"\
        },\
        \"State\": {\
          \"shape\": \"ChannelState\",\
          \"locationName\": \"state\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for StartChannelResponse\"\
    },\
    \"StartMultiplexRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"multiplexId\",\
          \"documentation\": \"The ID of the multiplex.\"\
        }\
      },\
      \"required\": [\
        \"MultiplexId\"\
      ],\
      \"documentation\": \"Placeholder documentation for StartMultiplexRequest\"\
    },\
    \"StartMultiplexResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"The unique arn of the multiplex.\"\
        },\
        \"AvailabilityZones\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"availabilityZones\",\
          \"documentation\": \"A list of availability zones for the multiplex.\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfMultiplexOutputDestination\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"A list of the multiplex output destinations.\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id\",\
          \"documentation\": \"The unique id of the multiplex.\"\
        },\
        \"MultiplexSettings\": {\
          \"shape\": \"MultiplexSettings\",\
          \"locationName\": \"multiplexSettings\",\
          \"documentation\": \"Configuration for a multiplex event.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The name of the multiplex.\"\
        },\
        \"PipelinesRunningCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"pipelinesRunningCount\",\
          \"documentation\": \"The number of currently healthy pipelines.\"\
        },\
        \"ProgramCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"programCount\",\
          \"documentation\": \"The number of programs in the multiplex.\"\
        },\
        \"State\": {\
          \"shape\": \"MultiplexState\",\
          \"locationName\": \"state\",\
          \"documentation\": \"The current state of the multiplex.\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for StartMultiplexResponse\"\
    },\
    \"StartTimecode\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Timecode\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"timecode\",\
          \"documentation\": \"The timecode for the frame where you want to start the clip. Optional; if not specified, the clip starts at first frame in the file. Enter the timecode as HH:MM:SS:FF or HH:MM:SS;FF.\"\
        }\
      },\
      \"documentation\": \"Settings to identify the start of the clip.\"\
    },\
    \"StaticImageActivateScheduleActionSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Duration\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"duration\",\
          \"documentation\": \"The duration in milliseconds for the image to remain on the video. If omitted or set to 0 the duration is unlimited and the image will remain until it is explicitly deactivated.\"\
        },\
        \"FadeIn\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"fadeIn\",\
          \"documentation\": \"The time in milliseconds for the image to fade in. The fade-in starts at the start time of the overlay. Default is 0 (no fade-in).\"\
        },\
        \"FadeOut\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"fadeOut\",\
          \"documentation\": \"Applies only if a duration is specified. The time in milliseconds for the image to fade out. The fade-out starts when the duration time is hit, so it effectively extends the duration. Default is 0 (no fade-out).\"\
        },\
        \"Height\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"height\",\
          \"documentation\": \"The height of the image when inserted into the video, in pixels. The overlay will be scaled up or down to the specified height. Leave blank to use the native height of the overlay.\"\
        },\
        \"Image\": {\
          \"shape\": \"InputLocation\",\
          \"locationName\": \"image\",\
          \"documentation\": \"The location and filename of the image file to overlay on the video. The file must be a 32-bit BMP, PNG, or TGA file, and must not be larger (in pixels) than the input video.\"\
        },\
        \"ImageX\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"imageX\",\
          \"documentation\": \"Placement of the left edge of the overlay relative to the left edge of the video frame, in pixels. 0 (the default) is the left edge of the frame. If the placement causes the overlay to extend beyond the right edge of the underlying video, then the overlay is cropped on the right.\"\
        },\
        \"ImageY\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"imageY\",\
          \"documentation\": \"Placement of the top edge of the overlay relative to the top edge of the video frame, in pixels. 0 (the default) is the top edge of the frame. If the placement causes the overlay to extend beyond the bottom edge of the underlying video, then the overlay is cropped on the bottom.\"\
        },\
        \"Layer\": {\
          \"shape\": \"__integerMin0Max7\",\
          \"locationName\": \"layer\",\
          \"documentation\": \"The number of the layer, 0 to 7. There are 8 layers that can be overlaid on the video, each layer with a different image. The layers are in Z order, which means that overlays with higher values of layer are inserted on top of overlays with lower values of layer. Default is 0.\"\
        },\
        \"Opacity\": {\
          \"shape\": \"__integerMin0Max100\",\
          \"locationName\": \"opacity\",\
          \"documentation\": \"Opacity of image where 0 is transparent and 100 is fully opaque. Default is 100.\"\
        },\
        \"Width\": {\
          \"shape\": \"__integerMin1\",\
          \"locationName\": \"width\",\
          \"documentation\": \"The width of the image when inserted into the video, in pixels. The overlay will be scaled up or down to the specified width. Leave blank to use the native width of the overlay.\"\
        }\
      },\
      \"documentation\": \"Settings for the action to activate a static image.\",\
      \"required\": [\
        \"Image\"\
      ]\
    },\
    \"StaticImageDeactivateScheduleActionSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"FadeOut\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"fadeOut\",\
          \"documentation\": \"The time in milliseconds for the image to fade out. Default is 0 (no fade-out).\"\
        },\
        \"Layer\": {\
          \"shape\": \"__integerMin0Max7\",\
          \"locationName\": \"layer\",\
          \"documentation\": \"The image overlay layer to deactivate, 0 to 7. Default is 0.\"\
        }\
      },\
      \"documentation\": \"Settings for the action to deactivate the image in a specific layer.\"\
    },\
    \"StaticKeySettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"KeyProviderServer\": {\
          \"shape\": \"InputLocation\",\
          \"locationName\": \"keyProviderServer\",\
          \"documentation\": \"The URL of the license server used for protecting content.\"\
        },\
        \"StaticKeyValue\": {\
          \"shape\": \"__stringMin32Max32\",\
          \"locationName\": \"staticKeyValue\",\
          \"documentation\": \"Static key value as a 32 character hexadecimal string.\"\
        }\
      },\
      \"documentation\": \"Static Key Settings\",\
      \"required\": [\
        \"StaticKeyValue\"\
      ]\
    },\
    \"StopChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"channelId\",\
          \"documentation\": \"A request to stop a running channel\"\
        }\
      },\
      \"required\": [\
        \"ChannelId\"\
      ],\
      \"documentation\": \"Placeholder documentation for StopChannelRequest\"\
    },\
    \"StopChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"The unique arn of the channel.\"\
        },\
        \"ChannelClass\": {\
          \"shape\": \"ChannelClass\",\
          \"locationName\": \"channelClass\",\
          \"documentation\": \"The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfOutputDestination\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"A list of destinations of the channel. For UDP outputs, there is one\\ndestination per output. For other types (HLS, for example), there is\\none destination per packager.\\n\"\
        },\
        \"EgressEndpoints\": {\
          \"shape\": \"__listOfChannelEgressEndpoint\",\
          \"locationName\": \"egressEndpoints\",\
          \"documentation\": \"The endpoints where outgoing connections initiate from\"\
        },\
        \"EncoderSettings\": {\
          \"shape\": \"EncoderSettings\",\
          \"locationName\": \"encoderSettings\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id\",\
          \"documentation\": \"The unique id of the channel.\"\
        },\
        \"InputAttachments\": {\
          \"shape\": \"__listOfInputAttachment\",\
          \"locationName\": \"inputAttachments\",\
          \"documentation\": \"List of input attachments for channel.\"\
        },\
        \"InputSpecification\": {\
          \"shape\": \"InputSpecification\",\
          \"locationName\": \"inputSpecification\"\
        },\
        \"LogLevel\": {\
          \"shape\": \"LogLevel\",\
          \"locationName\": \"logLevel\",\
          \"documentation\": \"The log level being written to CloudWatch Logs.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The name of the channel. (user-mutable)\"\
        },\
        \"PipelineDetails\": {\
          \"shape\": \"__listOfPipelineDetail\",\
          \"locationName\": \"pipelineDetails\",\
          \"documentation\": \"Runtime details for the pipelines of a running channel.\"\
        },\
        \"PipelinesRunningCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"pipelinesRunningCount\",\
          \"documentation\": \"The number of currently healthy pipelines.\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"roleArn\",\
          \"documentation\": \"The Amazon Resource Name (ARN) of the role assumed when running the Channel.\"\
        },\
        \"State\": {\
          \"shape\": \"ChannelState\",\
          \"locationName\": \"state\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for StopChannelResponse\"\
    },\
    \"StopMultiplexRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"multiplexId\",\
          \"documentation\": \"The ID of the multiplex.\"\
        }\
      },\
      \"required\": [\
        \"MultiplexId\"\
      ],\
      \"documentation\": \"Placeholder documentation for StopMultiplexRequest\"\
    },\
    \"StopMultiplexResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Arn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"arn\",\
          \"documentation\": \"The unique arn of the multiplex.\"\
        },\
        \"AvailabilityZones\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"availabilityZones\",\
          \"documentation\": \"A list of availability zones for the multiplex.\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfMultiplexOutputDestination\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"A list of the multiplex output destinations.\"\
        },\
        \"Id\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"id\",\
          \"documentation\": \"The unique id of the multiplex.\"\
        },\
        \"MultiplexSettings\": {\
          \"shape\": \"MultiplexSettings\",\
          \"locationName\": \"multiplexSettings\",\
          \"documentation\": \"Configuration for a multiplex event.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The name of the multiplex.\"\
        },\
        \"PipelinesRunningCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"pipelinesRunningCount\",\
          \"documentation\": \"The number of currently healthy pipelines.\"\
        },\
        \"ProgramCount\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"programCount\",\
          \"documentation\": \"The number of programs in the multiplex.\"\
        },\
        \"State\": {\
          \"shape\": \"MultiplexState\",\
          \"locationName\": \"state\",\
          \"documentation\": \"The current state of the multiplex.\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for StopMultiplexResponse\"\
    },\
    \"StopTimecode\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"LastFrameClippingBehavior\": {\
          \"shape\": \"LastFrameClippingBehavior\",\
          \"locationName\": \"lastFrameClippingBehavior\",\
          \"documentation\": \"If you specify a StopTimecode in an input (in order to clip the file), you can specify if you want the clip to exclude (the default) or include the frame specified by the timecode.\"\
        },\
        \"Timecode\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"timecode\",\
          \"documentation\": \"The timecode for the frame where you want to stop the clip. Optional; if not specified, the clip continues to the end of the file. Enter the timecode as HH:MM:SS:FF or HH:MM:SS;FF.\"\
        }\
      },\
      \"documentation\": \"Settings to identify the end of the clip.\"\
    },\
    \"Tags\": {\
      \"type\": \"map\",\
      \"key\": {\
        \"shape\": \"__string\"\
      },\
      \"value\": {\
        \"shape\": \"__string\"\
      },\
      \"documentation\": \"Placeholder documentation for Tags\"\
    },\
    \"TagsModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for TagsModel\"\
    },\
    \"TeletextDestinationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Teletext Destination Settings\"\
    },\
    \"TeletextSourceSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"PageNumber\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"pageNumber\",\
          \"documentation\": \"Specifies the teletext page number within the data stream from which to extract captions. Range of 0x100 (256) to 0x8FF (2303). Unused for passthrough. Should be specified as a hexadecimal string with no \\\"0x\\\" prefix.\"\
        }\
      },\
      \"documentation\": \"Teletext Source Settings\"\
    },\
    \"TemporalFilterPostFilterSharpening\": {\
      \"type\": \"string\",\
      \"documentation\": \"Temporal Filter Post Filter Sharpening\",\
      \"enum\": [\
        \"AUTO\",\
        \"DISABLED\",\
        \"ENABLED\"\
      ]\
    },\
    \"TemporalFilterSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"PostFilterSharpening\": {\
          \"shape\": \"TemporalFilterPostFilterSharpening\",\
          \"locationName\": \"postFilterSharpening\",\
          \"documentation\": \"If set to \\\"ENABLED,\\\" applies post-filter sharpening to improve visual quality. This is most beneficial when using a noisy or compressed input source and low output bitrates.\"\
        },\
        \"Strength\": {\
          \"shape\": \"TemporalFilterStrength\",\
          \"locationName\": \"strength\",\
          \"documentation\": \"Filter strength. A higher value produces stronger filtering.\"\
        }\
      },\
      \"documentation\": \"Temporal Filter Settings\"\
    },\
    \"TemporalFilterStrength\": {\
      \"type\": \"string\",\
      \"documentation\": \"Temporal Filter Strength\",\
      \"enum\": [\
        \"AUTO\",\
        \"STRENGTH_1\",\
        \"STRENGTH_10\",\
        \"STRENGTH_11\",\
        \"STRENGTH_12\",\
        \"STRENGTH_13\",\
        \"STRENGTH_14\",\
        \"STRENGTH_15\",\
        \"STRENGTH_16\",\
        \"STRENGTH_2\",\
        \"STRENGTH_3\",\
        \"STRENGTH_4\",\
        \"STRENGTH_5\",\
        \"STRENGTH_6\",\
        \"STRENGTH_7\",\
        \"STRENGTH_8\",\
        \"STRENGTH_9\"\
      ]\
    },\
    \"TimecodeConfig\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Source\": {\
          \"shape\": \"TimecodeConfigSource\",\
          \"locationName\": \"source\",\
          \"documentation\": \"Identifies the source for the timecode that will be associated with the events outputs.\\n-Embedded (embedded): Initialize the output timecode with timecode from the the source.  If no embedded timecode is detected in the source, the system falls back to using \\\"Start at 0\\\" (zerobased).\\n-System Clock (systemclock): Use the UTC time.\\n-Start at 0 (zerobased): The time of the first frame of the event will be 00:00:00:00.\"\
        },\
        \"SyncThreshold\": {\
          \"shape\": \"__integerMin1Max1000000\",\
          \"locationName\": \"syncThreshold\",\
          \"documentation\": \"Threshold in frames beyond which output timecode is resynchronized to the input timecode. Discrepancies below this threshold are permitted to avoid unnecessary discontinuities in the output timecode. No timecode sync when this is not specified.\"\
        }\
      },\
      \"documentation\": \"Timecode Config\",\
      \"required\": [\
        \"Source\"\
      ]\
    },\
    \"TimecodeConfigSource\": {\
      \"type\": \"string\",\
      \"documentation\": \"Timecode Config Source\",\
      \"enum\": [\
        \"EMBEDDED\",\
        \"SYSTEMCLOCK\",\
        \"ZEROBASED\"\
      ]\
    },\
    \"TooManyRequestsException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\"\
        }\
      },\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 429\
      },\
      \"documentation\": \"Placeholder documentation for TooManyRequestsException\"\
    },\
    \"TtmlDestinationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"StyleControl\": {\
          \"shape\": \"TtmlDestinationStyleControl\",\
          \"locationName\": \"styleControl\",\
          \"documentation\": \"When set to passthrough, passes through style and position information from a TTML-like input source (TTML, SMPTE-TT, CFF-TT) to the CFF-TT output or TTML output.\"\
        }\
      },\
      \"documentation\": \"Ttml Destination Settings\"\
    },\
    \"TtmlDestinationStyleControl\": {\
      \"type\": \"string\",\
      \"documentation\": \"Ttml Destination Style Control\",\
      \"enum\": [\
        \"PASSTHROUGH\",\
        \"USE_CONFIGURED\"\
      ]\
    },\
    \"UdpContainerSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"M2tsSettings\": {\
          \"shape\": \"M2tsSettings\",\
          \"locationName\": \"m2tsSettings\"\
        }\
      },\
      \"documentation\": \"Udp Container Settings\"\
    },\
    \"UdpGroupSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InputLossAction\": {\
          \"shape\": \"InputLossActionForUdpOut\",\
          \"locationName\": \"inputLossAction\",\
          \"documentation\": \"Specifies behavior of last resort when input video is lost, and no more backup inputs are available. When dropTs is selected the entire transport stream will stop being emitted.  When dropProgram is selected the program can be dropped from the transport stream (and replaced with null packets to meet the TS bitrate requirement).  Or, when emitProgram is chosen the transport stream will continue to be produced normally with repeat frames, black frames, or slate frames substituted for the absent input video.\"\
        },\
        \"TimedMetadataId3Frame\": {\
          \"shape\": \"UdpTimedMetadataId3Frame\",\
          \"locationName\": \"timedMetadataId3Frame\",\
          \"documentation\": \"Indicates ID3 frame that has the timecode.\"\
        },\
        \"TimedMetadataId3Period\": {\
          \"shape\": \"__integerMin0\",\
          \"locationName\": \"timedMetadataId3Period\",\
          \"documentation\": \"Timed Metadata interval in seconds.\"\
        }\
      },\
      \"documentation\": \"Udp Group Settings\"\
    },\
    \"UdpOutputSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"BufferMsec\": {\
          \"shape\": \"__integerMin0Max10000\",\
          \"locationName\": \"bufferMsec\",\
          \"documentation\": \"UDP output buffering in milliseconds. Larger values increase latency through the transcoder but simultaneously assist the transcoder in maintaining a constant, low-jitter UDP/RTP output while accommodating clock recovery, input switching, input disruptions, picture reordering, etc.\"\
        },\
        \"ContainerSettings\": {\
          \"shape\": \"UdpContainerSettings\",\
          \"locationName\": \"containerSettings\"\
        },\
        \"Destination\": {\
          \"shape\": \"OutputLocationRef\",\
          \"locationName\": \"destination\",\
          \"documentation\": \"Destination address and port number for RTP or UDP packets. Can be unicast or multicast RTP or UDP (eg. rtp://239.10.10.10:5001 or udp://10.100.100.100:5002).\"\
        },\
        \"FecOutputSettings\": {\
          \"shape\": \"FecOutputSettings\",\
          \"locationName\": \"fecOutputSettings\",\
          \"documentation\": \"Settings for enabling and adjusting Forward Error Correction on UDP outputs.\"\
        }\
      },\
      \"documentation\": \"Udp Output Settings\",\
      \"required\": [\
        \"Destination\",\
        \"ContainerSettings\"\
      ]\
    },\
    \"UdpTimedMetadataId3Frame\": {\
      \"type\": \"string\",\
      \"documentation\": \"Udp Timed Metadata Id3 Frame\",\
      \"enum\": [\
        \"NONE\",\
        \"PRIV\",\
        \"TDRL\"\
      ]\
    },\
    \"UnprocessableEntityException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Message\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"message\",\
          \"documentation\": \"The error message.\"\
        },\
        \"ValidationErrors\": {\
          \"shape\": \"__listOfValidationError\",\
          \"locationName\": \"validationErrors\",\
          \"documentation\": \"A collection of validation error responses.\"\
        }\
      },\
      \"exception\": true,\
      \"error\": {\
        \"httpStatusCode\": 422\
      },\
      \"documentation\": \"Placeholder documentation for UnprocessableEntityException\"\
    },\
    \"UpdateChannel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Destinations\": {\
          \"shape\": \"__listOfOutputDestination\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"A list of output destinations for this channel.\"\
        },\
        \"EncoderSettings\": {\
          \"shape\": \"EncoderSettings\",\
          \"locationName\": \"encoderSettings\",\
          \"documentation\": \"The encoder settings for this channel.\"\
        },\
        \"InputAttachments\": {\
          \"shape\": \"__listOfInputAttachment\",\
          \"locationName\": \"inputAttachments\"\
        },\
        \"InputSpecification\": {\
          \"shape\": \"InputSpecification\",\
          \"locationName\": \"inputSpecification\",\
          \"documentation\": \"Specification of input for this channel (max. bitrate, resolution, codec, etc.)\"\
        },\
        \"LogLevel\": {\
          \"shape\": \"LogLevel\",\
          \"locationName\": \"logLevel\",\
          \"documentation\": \"The log level to write to CloudWatch Logs.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The name of the channel.\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"roleArn\",\
          \"documentation\": \"An optional Amazon Resource Name (ARN) of the role to assume when running the Channel. If you do not specify this on an update call but the role was previously set that role will be removed.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for UpdateChannel\"\
    },\
    \"UpdateChannelClass\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelClass\": {\
          \"shape\": \"ChannelClass\",\
          \"locationName\": \"channelClass\",\
          \"documentation\": \"The channel class that you wish to update this channel to use.\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfOutputDestination\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"A list of output destinations for this channel.\"\
        }\
      },\
      \"required\": [\
        \"ChannelClass\"\
      ],\
      \"documentation\": \"Placeholder documentation for UpdateChannelClass\"\
    },\
    \"UpdateChannelClassRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelClass\": {\
          \"shape\": \"ChannelClass\",\
          \"locationName\": \"channelClass\",\
          \"documentation\": \"The channel class that you wish to update this channel to use.\"\
        },\
        \"ChannelId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"channelId\",\
          \"documentation\": \"Channel Id of the channel whose class should be updated.\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfOutputDestination\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"A list of output destinations for this channel.\"\
        }\
      },\
      \"documentation\": \"Channel class that the channel should be updated to.\",\
      \"required\": [\
        \"ChannelId\",\
        \"ChannelClass\"\
      ]\
    },\
    \"UpdateChannelClassResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Channel\": {\
          \"shape\": \"Channel\",\
          \"locationName\": \"channel\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for UpdateChannelClassResponse\"\
    },\
    \"UpdateChannelRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ChannelId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"channelId\",\
          \"documentation\": \"channel ID\"\
        },\
        \"Destinations\": {\
          \"shape\": \"__listOfOutputDestination\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"A list of output destinations for this channel.\"\
        },\
        \"EncoderSettings\": {\
          \"shape\": \"EncoderSettings\",\
          \"locationName\": \"encoderSettings\",\
          \"documentation\": \"The encoder settings for this channel.\"\
        },\
        \"InputAttachments\": {\
          \"shape\": \"__listOfInputAttachment\",\
          \"locationName\": \"inputAttachments\"\
        },\
        \"InputSpecification\": {\
          \"shape\": \"InputSpecification\",\
          \"locationName\": \"inputSpecification\",\
          \"documentation\": \"Specification of input for this channel (max. bitrate, resolution, codec, etc.)\"\
        },\
        \"LogLevel\": {\
          \"shape\": \"LogLevel\",\
          \"locationName\": \"logLevel\",\
          \"documentation\": \"The log level to write to CloudWatch Logs.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The name of the channel.\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"roleArn\",\
          \"documentation\": \"An optional Amazon Resource Name (ARN) of the role to assume when running the Channel. If you do not specify this on an update call but the role was previously set that role will be removed.\"\
        }\
      },\
      \"documentation\": \"A request to update a channel.\",\
      \"required\": [\
        \"ChannelId\"\
      ]\
    },\
    \"UpdateChannelResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Channel\": {\
          \"shape\": \"Channel\",\
          \"locationName\": \"channel\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for UpdateChannelResponse\"\
    },\
    \"UpdateChannelResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Channel\": {\
          \"shape\": \"Channel\",\
          \"locationName\": \"channel\"\
        }\
      },\
      \"documentation\": \"The updated channel's description.\"\
    },\
    \"UpdateInput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Destinations\": {\
          \"shape\": \"__listOfInputDestinationRequest\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"Destination settings for PUSH type inputs.\"\
        },\
        \"InputSecurityGroups\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"inputSecurityGroups\",\
          \"documentation\": \"A list of security groups referenced by IDs to attach to the input.\"\
        },\
        \"MediaConnectFlows\": {\
          \"shape\": \"__listOfMediaConnectFlowRequest\",\
          \"locationName\": \"mediaConnectFlows\",\
          \"documentation\": \"A list of the MediaConnect Flow ARNs that you want to use as the source of the input. You can specify as few as one\\nFlow and presently, as many as two. The only requirement is when you have more than one is that each Flow is in a\\nseparate Availability Zone as this ensures your EML input is redundant to AZ issues.\\n\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"Name of the input.\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"roleArn\",\
          \"documentation\": \"The Amazon Resource Name (ARN) of the role this input assumes during and after creation.\"\
        },\
        \"Sources\": {\
          \"shape\": \"__listOfInputSourceRequest\",\
          \"locationName\": \"sources\",\
          \"documentation\": \"The source URLs for a PULL-type input. Every PULL type input needs\\nexactly two source URLs for redundancy.\\nOnly specify sources for PULL type Inputs. Leave Destinations empty.\\n\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for UpdateInput\"\
    },\
    \"UpdateInputRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Destinations\": {\
          \"shape\": \"__listOfInputDestinationRequest\",\
          \"locationName\": \"destinations\",\
          \"documentation\": \"Destination settings for PUSH type inputs.\"\
        },\
        \"InputId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"inputId\",\
          \"documentation\": \"Unique ID of the input.\"\
        },\
        \"InputSecurityGroups\": {\
          \"shape\": \"__listOf__string\",\
          \"locationName\": \"inputSecurityGroups\",\
          \"documentation\": \"A list of security groups referenced by IDs to attach to the input.\"\
        },\
        \"MediaConnectFlows\": {\
          \"shape\": \"__listOfMediaConnectFlowRequest\",\
          \"locationName\": \"mediaConnectFlows\",\
          \"documentation\": \"A list of the MediaConnect Flow ARNs that you want to use as the source of the input. You can specify as few as one\\nFlow and presently, as many as two. The only requirement is when you have more than one is that each Flow is in a\\nseparate Availability Zone as this ensures your EML input is redundant to AZ issues.\\n\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"Name of the input.\"\
        },\
        \"RoleArn\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"roleArn\",\
          \"documentation\": \"The Amazon Resource Name (ARN) of the role this input assumes during and after creation.\"\
        },\
        \"Sources\": {\
          \"shape\": \"__listOfInputSourceRequest\",\
          \"locationName\": \"sources\",\
          \"documentation\": \"The source URLs for a PULL-type input. Every PULL type input needs\\nexactly two source URLs for redundancy.\\nOnly specify sources for PULL type Inputs. Leave Destinations empty.\\n\"\
        }\
      },\
      \"documentation\": \"A request to update an input.\",\
      \"required\": [\
        \"InputId\"\
      ]\
    },\
    \"UpdateInputResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Input\": {\
          \"shape\": \"Input\",\
          \"locationName\": \"input\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for UpdateInputResponse\"\
    },\
    \"UpdateInputResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Input\": {\
          \"shape\": \"Input\",\
          \"locationName\": \"input\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for UpdateInputResultModel\"\
    },\
    \"UpdateInputSecurityGroupRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"InputSecurityGroupId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"inputSecurityGroupId\",\
          \"documentation\": \"The id of the Input Security Group to update.\"\
        },\
        \"Tags\": {\
          \"shape\": \"Tags\",\
          \"locationName\": \"tags\",\
          \"documentation\": \"A collection of key-value pairs.\"\
        },\
        \"WhitelistRules\": {\
          \"shape\": \"__listOfInputWhitelistRuleCidr\",\
          \"locationName\": \"whitelistRules\",\
          \"documentation\": \"List of IPv4 CIDR addresses to whitelist\"\
        }\
      },\
      \"documentation\": \"The request to update some combination of the Input Security Group name and the IPv4 CIDRs the Input Security Group should allow.\",\
      \"required\": [\
        \"InputSecurityGroupId\"\
      ]\
    },\
    \"UpdateInputSecurityGroupResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SecurityGroup\": {\
          \"shape\": \"InputSecurityGroup\",\
          \"locationName\": \"securityGroup\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for UpdateInputSecurityGroupResponse\"\
    },\
    \"UpdateInputSecurityGroupResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"SecurityGroup\": {\
          \"shape\": \"InputSecurityGroup\",\
          \"locationName\": \"securityGroup\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for UpdateInputSecurityGroupResultModel\"\
    },\
    \"UpdateMultiplex\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexSettings\": {\
          \"shape\": \"MultiplexSettings\",\
          \"locationName\": \"multiplexSettings\",\
          \"documentation\": \"The new settings for a multiplex.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"Name of the multiplex.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for UpdateMultiplex\"\
    },\
    \"UpdateMultiplexProgram\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexProgramSettings\": {\
          \"shape\": \"MultiplexProgramSettings\",\
          \"locationName\": \"multiplexProgramSettings\",\
          \"documentation\": \"The new settings for a multiplex program.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for UpdateMultiplexProgram\"\
    },\
    \"UpdateMultiplexProgramRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"multiplexId\",\
          \"documentation\": \"The ID of the multiplex of the program to update.\"\
        },\
        \"MultiplexProgramSettings\": {\
          \"shape\": \"MultiplexProgramSettings\",\
          \"locationName\": \"multiplexProgramSettings\",\
          \"documentation\": \"The new settings for a multiplex program.\"\
        },\
        \"ProgramName\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"programName\",\
          \"documentation\": \"The name of the program to update.\"\
        }\
      },\
      \"documentation\": \"A request to update a program in a multiplex.\",\
      \"required\": [\
        \"MultiplexId\",\
        \"ProgramName\"\
      ]\
    },\
    \"UpdateMultiplexProgramResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexProgram\": {\
          \"shape\": \"MultiplexProgram\",\
          \"locationName\": \"multiplexProgram\",\
          \"documentation\": \"The updated multiplex program.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for UpdateMultiplexProgramResponse\"\
    },\
    \"UpdateMultiplexProgramResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexProgram\": {\
          \"shape\": \"MultiplexProgram\",\
          \"locationName\": \"multiplexProgram\",\
          \"documentation\": \"The updated multiplex program.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for UpdateMultiplexProgramResultModel\"\
    },\
    \"UpdateMultiplexRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"MultiplexId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"multiplexId\",\
          \"documentation\": \"ID of the multiplex to update.\"\
        },\
        \"MultiplexSettings\": {\
          \"shape\": \"MultiplexSettings\",\
          \"locationName\": \"multiplexSettings\",\
          \"documentation\": \"The new settings for a multiplex.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"Name of the multiplex.\"\
        }\
      },\
      \"documentation\": \"A request to update a multiplex.\",\
      \"required\": [\
        \"MultiplexId\"\
      ]\
    },\
    \"UpdateMultiplexResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Multiplex\": {\
          \"shape\": \"Multiplex\",\
          \"locationName\": \"multiplex\",\
          \"documentation\": \"The updated multiplex.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for UpdateMultiplexResponse\"\
    },\
    \"UpdateMultiplexResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Multiplex\": {\
          \"shape\": \"Multiplex\",\
          \"locationName\": \"multiplex\",\
          \"documentation\": \"The updated multiplex.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for UpdateMultiplexResultModel\"\
    },\
    \"UpdateReservation\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"Name of the reservation\"\
        }\
      },\
      \"documentation\": \"UpdateReservation request\"\
    },\
    \"UpdateReservationRequest\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"Name of the reservation\"\
        },\
        \"ReservationId\": {\
          \"shape\": \"__string\",\
          \"location\": \"uri\",\
          \"locationName\": \"reservationId\",\
          \"documentation\": \"Unique reservation ID, e.g. '1234567'\"\
        }\
      },\
      \"documentation\": \"Request to update a reservation\",\
      \"required\": [\
        \"ReservationId\"\
      ]\
    },\
    \"UpdateReservationResponse\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Reservation\": {\
          \"shape\": \"Reservation\",\
          \"locationName\": \"reservation\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for UpdateReservationResponse\"\
    },\
    \"UpdateReservationResultModel\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Reservation\": {\
          \"shape\": \"Reservation\",\
          \"locationName\": \"reservation\"\
        }\
      },\
      \"documentation\": \"UpdateReservation response\"\
    },\
    \"ValidationError\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ElementPath\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"elementPath\",\
          \"documentation\": \"Path to the source of the error.\"\
        },\
        \"ErrorMessage\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"errorMessage\",\
          \"documentation\": \"The error message.\"\
        }\
      },\
      \"documentation\": \"Placeholder documentation for ValidationError\"\
    },\
    \"VideoCodecSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"FrameCaptureSettings\": {\
          \"shape\": \"FrameCaptureSettings\",\
          \"locationName\": \"frameCaptureSettings\"\
        },\
        \"H264Settings\": {\
          \"shape\": \"H264Settings\",\
          \"locationName\": \"h264Settings\"\
        },\
        \"H265Settings\": {\
          \"shape\": \"H265Settings\",\
          \"locationName\": \"h265Settings\"\
        }\
      },\
      \"documentation\": \"Video Codec Settings\"\
    },\
    \"VideoDescription\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"CodecSettings\": {\
          \"shape\": \"VideoCodecSettings\",\
          \"locationName\": \"codecSettings\",\
          \"documentation\": \"Video codec settings.\"\
        },\
        \"Height\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"height\",\
          \"documentation\": \"Output video height, in pixels. Must be an even number. For most codecs, you can leave this field and width blank in order to use the height and width (resolution) from the source. Note, however, that leaving blank is not recommended. For the Frame Capture codec, height and width are required.\"\
        },\
        \"Name\": {\
          \"shape\": \"__string\",\
          \"locationName\": \"name\",\
          \"documentation\": \"The name of this VideoDescription. Outputs will use this name to uniquely identify this Description.  Description names should be unique within this Live Event.\"\
        },\
        \"RespondToAfd\": {\
          \"shape\": \"VideoDescriptionRespondToAfd\",\
          \"locationName\": \"respondToAfd\",\
          \"documentation\": \"Indicates how to respond to the AFD values in the input stream. RESPOND causes input video to be clipped, depending on the AFD value, input display aspect ratio, and output display aspect ratio, and (except for FRAMECAPTURE codec) includes the values in the output. PASSTHROUGH (does not apply to FRAMECAPTURE codec) ignores the AFD values and includes the values in the output, so input video is not clipped. NONE ignores the AFD values and does not include the values through to the output, so input video is not clipped.\"\
        },\
        \"ScalingBehavior\": {\
          \"shape\": \"VideoDescriptionScalingBehavior\",\
          \"locationName\": \"scalingBehavior\",\
          \"documentation\": \"STRETCHTOOUTPUT configures the output position to stretch the video to the specified output resolution (height and width). This option will override any position value. DEFAULT may insert black boxes (pillar boxes or letter boxes) around the video to provide the specified output resolution.\"\
        },\
        \"Sharpness\": {\
          \"shape\": \"__integerMin0Max100\",\
          \"locationName\": \"sharpness\",\
          \"documentation\": \"Changes the strength of the anti-alias filter used for scaling. 0 is the softest setting, 100 is the sharpest. A setting of 50 is recommended for most content.\"\
        },\
        \"Width\": {\
          \"shape\": \"__integer\",\
          \"locationName\": \"width\",\
          \"documentation\": \"Output video width, in pixels. Must be an even number. For most codecs, you can leave this field and height blank in order to use the height and width (resolution) from the source. Note, however, that leaving blank is not recommended. For the Frame Capture codec, height and width are required.\"\
        }\
      },\
      \"documentation\": \"Video settings for this stream.\",\
      \"required\": [\
        \"Name\"\
      ]\
    },\
    \"VideoDescriptionRespondToAfd\": {\
      \"type\": \"string\",\
      \"documentation\": \"Video Description Respond To Afd\",\
      \"enum\": [\
        \"NONE\",\
        \"PASSTHROUGH\",\
        \"RESPOND\"\
      ]\
    },\
    \"VideoDescriptionScalingBehavior\": {\
      \"type\": \"string\",\
      \"documentation\": \"Video Description Scaling Behavior\",\
      \"enum\": [\
        \"DEFAULT\",\
        \"STRETCH_TO_OUTPUT\"\
      ]\
    },\
    \"VideoSelector\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ColorSpace\": {\
          \"shape\": \"VideoSelectorColorSpace\",\
          \"locationName\": \"colorSpace\",\
          \"documentation\": \"Specifies the color space of an input. This setting works in tandem with colorSpaceUsage and a video description's colorSpaceSettingsChoice to determine if any conversion will be performed.\"\
        },\
        \"ColorSpaceUsage\": {\
          \"shape\": \"VideoSelectorColorSpaceUsage\",\
          \"locationName\": \"colorSpaceUsage\",\
          \"documentation\": \"Applies only if colorSpace is a value other than follow. This field controls how the value in the colorSpace field will be used. fallback means that when the input does include color space data, that data will be used, but when the input has no color space data, the value in colorSpace will be used. Choose fallback if your input is sometimes missing color space data, but when it does have color space data, that data is correct. force means to always use the value in colorSpace. Choose force if your input usually has no color space data or might have unreliable color space data.\"\
        },\
        \"SelectorSettings\": {\
          \"shape\": \"VideoSelectorSettings\",\
          \"locationName\": \"selectorSettings\",\
          \"documentation\": \"The video selector settings.\"\
        }\
      },\
      \"documentation\": \"Specifies a particular video stream within an input source. An input may have only a single video selector.\"\
    },\
    \"VideoSelectorColorSpace\": {\
      \"type\": \"string\",\
      \"documentation\": \"Video Selector Color Space\",\
      \"enum\": [\
        \"FOLLOW\",\
        \"REC_601\",\
        \"REC_709\"\
      ]\
    },\
    \"VideoSelectorColorSpaceUsage\": {\
      \"type\": \"string\",\
      \"documentation\": \"Video Selector Color Space Usage\",\
      \"enum\": [\
        \"FALLBACK\",\
        \"FORCE\"\
      ]\
    },\
    \"VideoSelectorPid\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"Pid\": {\
          \"shape\": \"__integerMin0Max8191\",\
          \"locationName\": \"pid\",\
          \"documentation\": \"Selects a specific PID from within a video source.\"\
        }\
      },\
      \"documentation\": \"Video Selector Pid\"\
    },\
    \"VideoSelectorProgramId\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"ProgramId\": {\
          \"shape\": \"__integerMin0Max65536\",\
          \"locationName\": \"programId\",\
          \"documentation\": \"Selects a specific program from within a multi-program transport stream. If the program doesn't exist, the first program within the transport stream will be selected by default.\"\
        }\
      },\
      \"documentation\": \"Video Selector Program Id\"\
    },\
    \"VideoSelectorSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"VideoSelectorPid\": {\
          \"shape\": \"VideoSelectorPid\",\
          \"locationName\": \"videoSelectorPid\"\
        },\
        \"VideoSelectorProgramId\": {\
          \"shape\": \"VideoSelectorProgramId\",\
          \"locationName\": \"videoSelectorProgramId\"\
        }\
      },\
      \"documentation\": \"Video Selector Settings\"\
    },\
    \"WebvttDestinationSettings\": {\
      \"type\": \"structure\",\
      \"members\": {\
      },\
      \"documentation\": \"Webvtt Destination Settings\"\
    },\
    \"__boolean\": {\
      \"type\": \"boolean\",\
      \"documentation\": \"Placeholder documentation for __boolean\"\
    },\
    \"__double\": {\
      \"type\": \"double\",\
      \"documentation\": \"Placeholder documentation for __double\"\
    },\
    \"__doubleMin0\": {\
      \"type\": \"double\",\
      \"documentation\": \"Placeholder documentation for __doubleMin0\"\
    },\
    \"__doubleMin1\": {\
      \"type\": \"double\",\
      \"documentation\": \"Placeholder documentation for __doubleMin1\"\
    },\
    \"__doubleMinNegative59Max0\": {\
      \"type\": \"double\",\
      \"documentation\": \"Placeholder documentation for __doubleMinNegative59Max0\"\
    },\
    \"__integer\": {\
      \"type\": \"integer\",\
      \"documentation\": \"Placeholder documentation for __integer\"\
    },\
    \"__integerMin0\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"documentation\": \"Placeholder documentation for __integerMin0\"\
    },\
    \"__integerMin0Max10\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 10,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max10\"\
    },\
    \"__integerMin0Max100\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 100,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max100\"\
    },\
    \"__integerMin0Max1000\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 1000,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max1000\"\
    },\
    \"__integerMin0Max10000\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 10000,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max10000\"\
    },\
    \"__integerMin0Max1000000\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 1000000,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max1000000\"\
    },\
    \"__integerMin0Max100000000\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 100000000,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max100000000\"\
    },\
    \"__integerMin0Max128\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 128,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max128\"\
    },\
    \"__integerMin0Max15\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 15,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max15\"\
    },\
    \"__integerMin0Max255\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 255,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max255\"\
    },\
    \"__integerMin0Max30\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 30,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max30\"\
    },\
    \"__integerMin0Max32768\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 32768,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max32768\"\
    },\
    \"__integerMin0Max3600\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 3600,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max3600\"\
    },\
    \"__integerMin0Max500\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 500,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max500\"\
    },\
    \"__integerMin0Max600\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 600,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max600\"\
    },\
    \"__integerMin0Max65535\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 65535,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max65535\"\
    },\
    \"__integerMin0Max65536\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 65536,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max65536\"\
    },\
    \"__integerMin0Max7\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 7,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max7\"\
    },\
    \"__integerMin0Max8191\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 8191,\
      \"documentation\": \"Placeholder documentation for __integerMin0Max8191\"\
    },\
    \"__integerMin1\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"documentation\": \"Placeholder documentation for __integerMin1\"\
    },\
    \"__integerMin1000\": {\
      \"type\": \"integer\",\
      \"min\": 1000,\
      \"documentation\": \"Placeholder documentation for __integerMin1000\"\
    },\
    \"__integerMin1000000Max100000000\": {\
      \"type\": \"integer\",\
      \"min\": 1000000,\
      \"max\": 100000000,\
      \"documentation\": \"Placeholder documentation for __integerMin1000000Max100000000\"\
    },\
    \"__integerMin100000Max100000000\": {\
      \"type\": \"integer\",\
      \"min\": 100000,\
      \"max\": 100000000,\
      \"documentation\": \"Placeholder documentation for __integerMin100000Max100000000\"\
    },\
    \"__integerMin100000Max40000000\": {\
      \"type\": \"integer\",\
      \"min\": 100000,\
      \"max\": 40000000,\
      \"documentation\": \"Placeholder documentation for __integerMin100000Max40000000\"\
    },\
    \"__integerMin100000Max80000000\": {\
      \"type\": \"integer\",\
      \"min\": 100000,\
      \"max\": 80000000,\
      \"documentation\": \"Placeholder documentation for __integerMin100000Max80000000\"\
    },\
    \"__integerMin1000Max3000\": {\
      \"type\": \"integer\",\
      \"min\": 1000,\
      \"max\": 3000,\
      \"documentation\": \"Placeholder documentation for __integerMin1000Max3000\"\
    },\
    \"__integerMin1000Max30000\": {\
      \"type\": \"integer\",\
      \"min\": 1000,\
      \"max\": 30000,\
      \"documentation\": \"Placeholder documentation for __integerMin1000Max30000\"\
    },\
    \"__integerMin1Max10\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 10,\
      \"documentation\": \"Placeholder documentation for __integerMin1Max10\"\
    },\
    \"__integerMin1Max1000000\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 1000000,\
      \"documentation\": \"Placeholder documentation for __integerMin1Max1000000\"\
    },\
    \"__integerMin1Max16\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 16,\
      \"documentation\": \"Placeholder documentation for __integerMin1Max16\"\
    },\
    \"__integerMin1Max20\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 20,\
      \"documentation\": \"Placeholder documentation for __integerMin1Max20\"\
    },\
    \"__integerMin1Max3003\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 3003,\
      \"documentation\": \"Placeholder documentation for __integerMin1Max3003\"\
    },\
    \"__integerMin1Max31\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 31,\
      \"documentation\": \"Placeholder documentation for __integerMin1Max31\"\
    },\
    \"__integerMin1Max32\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 32,\
      \"documentation\": \"Placeholder documentation for __integerMin1Max32\"\
    },\
    \"__integerMin1Max3600000\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 3600000,\
      \"documentation\": \"Placeholder documentation for __integerMin1Max3600000\"\
    },\
    \"__integerMin1Max4\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 4,\
      \"documentation\": \"Placeholder documentation for __integerMin1Max4\"\
    },\
    \"__integerMin1Max5\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 5,\
      \"documentation\": \"Placeholder documentation for __integerMin1Max5\"\
    },\
    \"__integerMin1Max6\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 6,\
      \"documentation\": \"Placeholder documentation for __integerMin1Max6\"\
    },\
    \"__integerMin1Max8\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 8,\
      \"documentation\": \"Placeholder documentation for __integerMin1Max8\"\
    },\
    \"__integerMin25Max10000\": {\
      \"type\": \"integer\",\
      \"min\": 25,\
      \"max\": 10000,\
      \"documentation\": \"Placeholder documentation for __integerMin25Max10000\"\
    },\
    \"__integerMin25Max2000\": {\
      \"type\": \"integer\",\
      \"min\": 25,\
      \"max\": 2000,\
      \"documentation\": \"Placeholder documentation for __integerMin25Max2000\"\
    },\
    \"__integerMin3\": {\
      \"type\": \"integer\",\
      \"min\": 3,\
      \"documentation\": \"Placeholder documentation for __integerMin3\"\
    },\
    \"__integerMin30\": {\
      \"type\": \"integer\",\
      \"min\": 30,\
      \"documentation\": \"Placeholder documentation for __integerMin30\"\
    },\
    \"__integerMin4Max20\": {\
      \"type\": \"integer\",\
      \"min\": 4,\
      \"max\": 20,\
      \"documentation\": \"Placeholder documentation for __integerMin4Max20\"\
    },\
    \"__integerMin96Max600\": {\
      \"type\": \"integer\",\
      \"min\": 96,\
      \"max\": 600,\
      \"documentation\": \"Placeholder documentation for __integerMin96Max600\"\
    },\
    \"__integerMinNegative1000Max1000\": {\
      \"type\": \"integer\",\
      \"min\": -1000,\
      \"max\": 1000,\
      \"documentation\": \"Placeholder documentation for __integerMinNegative1000Max1000\"\
    },\
    \"__integerMinNegative60Max6\": {\
      \"type\": \"integer\",\
      \"min\": -60,\
      \"max\": 6,\
      \"documentation\": \"Placeholder documentation for __integerMinNegative60Max6\"\
    },\
    \"__integerMinNegative60Max60\": {\
      \"type\": \"integer\",\
      \"min\": -60,\
      \"max\": 60,\
      \"documentation\": \"Placeholder documentation for __integerMinNegative60Max60\"\
    },\
    \"__listOfAudioChannelMapping\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"AudioChannelMapping\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfAudioChannelMapping\"\
    },\
    \"__listOfAudioDescription\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"AudioDescription\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfAudioDescription\"\
    },\
    \"__listOfAudioSelector\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"AudioSelector\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfAudioSelector\"\
    },\
    \"__listOfAudioTrack\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"AudioTrack\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfAudioTrack\"\
    },\
    \"__listOfCaptionDescription\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"CaptionDescription\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfCaptionDescription\"\
    },\
    \"__listOfCaptionLanguageMapping\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"CaptionLanguageMapping\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfCaptionLanguageMapping\"\
    },\
    \"__listOfCaptionSelector\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"CaptionSelector\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfCaptionSelector\"\
    },\
    \"__listOfChannelEgressEndpoint\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"ChannelEgressEndpoint\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfChannelEgressEndpoint\"\
    },\
    \"__listOfChannelSummary\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"ChannelSummary\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfChannelSummary\"\
    },\
    \"__listOfHlsAdMarkers\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"HlsAdMarkers\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfHlsAdMarkers\"\
    },\
    \"__listOfInput\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"Input\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfInput\"\
    },\
    \"__listOfInputAttachment\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"InputAttachment\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfInputAttachment\"\
    },\
    \"__listOfInputChannelLevel\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"InputChannelLevel\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfInputChannelLevel\"\
    },\
    \"__listOfInputDestination\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"InputDestination\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfInputDestination\"\
    },\
    \"__listOfInputDestinationRequest\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"InputDestinationRequest\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfInputDestinationRequest\"\
    },\
    \"__listOfInputSecurityGroup\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"InputSecurityGroup\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfInputSecurityGroup\"\
    },\
    \"__listOfInputSource\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"InputSource\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfInputSource\"\
    },\
    \"__listOfInputSourceRequest\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"InputSourceRequest\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfInputSourceRequest\"\
    },\
    \"__listOfInputWhitelistRule\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"InputWhitelistRule\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfInputWhitelistRule\"\
    },\
    \"__listOfInputWhitelistRuleCidr\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"InputWhitelistRuleCidr\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfInputWhitelistRuleCidr\"\
    },\
    \"__listOfMediaConnectFlow\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"MediaConnectFlow\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfMediaConnectFlow\"\
    },\
    \"__listOfMediaConnectFlowRequest\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"MediaConnectFlowRequest\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfMediaConnectFlowRequest\"\
    },\
    \"__listOfMediaPackageOutputDestinationSettings\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"MediaPackageOutputDestinationSettings\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfMediaPackageOutputDestinationSettings\"\
    },\
    \"__listOfMultiplexOutputDestination\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"MultiplexOutputDestination\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfMultiplexOutputDestination\"\
    },\
    \"__listOfMultiplexProgramSummary\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"MultiplexProgramSummary\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfMultiplexProgramSummary\"\
    },\
    \"__listOfMultiplexSummary\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"MultiplexSummary\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfMultiplexSummary\"\
    },\
    \"__listOfMultiplexValidationError\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"MultiplexValidationError\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfMultiplexValidationError\"\
    },\
    \"__listOfOffering\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"Offering\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfOffering\"\
    },\
    \"__listOfOutput\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"Output\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfOutput\"\
    },\
    \"__listOfOutputDestination\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"OutputDestination\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfOutputDestination\"\
    },\
    \"__listOfOutputDestinationSettings\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"OutputDestinationSettings\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfOutputDestinationSettings\"\
    },\
    \"__listOfOutputGroup\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"OutputGroup\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfOutputGroup\"\
    },\
    \"__listOfPipelineDetail\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"PipelineDetail\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfPipelineDetail\"\
    },\
    \"__listOfPipelinePauseStateSettings\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"PipelinePauseStateSettings\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfPipelinePauseStateSettings\"\
    },\
    \"__listOfReservation\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"Reservation\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfReservation\"\
    },\
    \"__listOfScheduleAction\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"ScheduleAction\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfScheduleAction\"\
    },\
    \"__listOfScte35Descriptor\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"Scte35Descriptor\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfScte35Descriptor\"\
    },\
    \"__listOfValidationError\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"ValidationError\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfValidationError\"\
    },\
    \"__listOfVideoDescription\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"VideoDescription\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOfVideoDescription\"\
    },\
    \"__listOf__integer\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"__integer\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOf__integer\"\
    },\
    \"__listOf__string\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"__string\"\
      },\
      \"documentation\": \"Placeholder documentation for __listOf__string\"\
    },\
    \"__long\": {\
      \"type\": \"long\",\
      \"documentation\": \"Placeholder documentation for __long\"\
    },\
    \"__longMin0Max1099511627775\": {\
      \"type\": \"long\",\
      \"min\": 0,\
      \"max\": 1099511627775,\
      \"documentation\": \"Placeholder documentation for __longMin0Max1099511627775\"\
    },\
    \"__longMin0Max4294967295\": {\
      \"type\": \"long\",\
      \"min\": 0,\
      \"max\": 4294967295,\
      \"documentation\": \"Placeholder documentation for __longMin0Max4294967295\"\
    },\
    \"__longMin0Max8589934591\": {\
      \"type\": \"long\",\
      \"min\": 0,\
      \"max\": 8589934591,\
      \"documentation\": \"Placeholder documentation for __longMin0Max8589934591\"\
    },\
    \"__string\": {\
      \"type\": \"string\",\
      \"documentation\": \"Placeholder documentation for __string\"\
    },\
    \"__stringMax256\": {\
      \"type\": \"string\",\
      \"max\": 256,\
      \"documentation\": \"Placeholder documentation for __stringMax256\"\
    },\
    \"__stringMax32\": {\
      \"type\": \"string\",\
      \"max\": 32,\
      \"documentation\": \"Placeholder documentation for __stringMax32\"\
    },\
    \"__stringMin1\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"documentation\": \"Placeholder documentation for __stringMin1\"\
    },\
    \"__stringMin1Max255\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"max\": 255,\
      \"documentation\": \"Placeholder documentation for __stringMin1Max255\"\
    },\
    \"__stringMin1Max256\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"max\": 256,\
      \"documentation\": \"Placeholder documentation for __stringMin1Max256\"\
    },\
    \"__stringMin32Max32\": {\
      \"type\": \"string\",\
      \"min\": 32,\
      \"max\": 32,\
      \"documentation\": \"Placeholder documentation for __stringMin32Max32\"\
    },\
    \"__stringMin34Max34\": {\
      \"type\": \"string\",\
      \"min\": 34,\
      \"max\": 34,\
      \"documentation\": \"Placeholder documentation for __stringMin34Max34\"\
    },\
    \"__stringMin3Max3\": {\
      \"type\": \"string\",\
      \"min\": 3,\
      \"max\": 3,\
      \"documentation\": \"Placeholder documentation for __stringMin3Max3\"\
    },\
    \"__stringMin6Max6\": {\
      \"type\": \"string\",\
      \"min\": 6,\
      \"max\": 6,\
      \"documentation\": \"Placeholder documentation for __stringMin6Max6\"\
    },\
    \"__timestampIso8601\": {\
      \"type\": \"timestamp\",\
      \"timestampFormat\": \"iso8601\",\
      \"documentation\": \"Placeholder documentation for __timestampIso8601\"\
    },\
    \"__timestampUnix\": {\
      \"type\": \"timestamp\",\
      \"timestampFormat\": \"unixTimestamp\",\
      \"documentation\": \"Placeholder documentation for __timestampUnix\"\
    }\
  },\
  \"documentation\": \"API for AWS Elemental MediaLive\"\
}\
";
}

@end
