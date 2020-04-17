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

#import "AWSfrauddetectorResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSfrauddetectorResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSfrauddetectorResources

+ (instancetype)sharedInstance {
    static AWSfrauddetectorResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSfrauddetectorResources new];
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
    \"apiVersion\":\"2019-11-15\",\
    \"endpointPrefix\":\"frauddetector\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Fraud Detector\",\
    \"serviceId\":\"FraudDetector\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"AWSHawksNestServiceFacade\",\
    \"uid\":\"frauddetector-2019-11-15\"\
  },\
  \"operations\":{\
    \"BatchCreateVariable\":{\
      \"name\":\"BatchCreateVariable\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchCreateVariableRequest\"},\
      \"output\":{\"shape\":\"BatchCreateVariableResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a batch of variables.</p>\"\
    },\
    \"BatchGetVariable\":{\
      \"name\":\"BatchGetVariable\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchGetVariableRequest\"},\
      \"output\":{\"shape\":\"BatchGetVariableResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets a batch of variables.</p>\"\
    },\
    \"CreateDetectorVersion\":{\
      \"name\":\"CreateDetectorVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateDetectorVersionRequest\"},\
      \"output\":{\"shape\":\"CreateDetectorVersionResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a detector version. The detector version starts in a <code>DRAFT</code> status.</p>\"\
    },\
    \"CreateModelVersion\":{\
      \"name\":\"CreateModelVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateModelVersionRequest\"},\
      \"output\":{\"shape\":\"CreateModelVersionResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a version of the model using the specified model type. </p>\"\
    },\
    \"CreateRule\":{\
      \"name\":\"CreateRule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateRuleRequest\"},\
      \"output\":{\"shape\":\"CreateRuleResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a rule for use with the specified detector. </p>\"\
    },\
    \"CreateVariable\":{\
      \"name\":\"CreateVariable\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVariableRequest\"},\
      \"output\":{\"shape\":\"CreateVariableResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a variable.</p>\"\
    },\
    \"DeleteDetector\":{\
      \"name\":\"DeleteDetector\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDetectorRequest\"},\
      \"output\":{\"shape\":\"DeleteDetectorResult\"},\
      \"errors\":[\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes the detector. Before deleting a detector, you must first delete all detector versions and rule versions associated with the detector.</p>\"\
    },\
    \"DeleteDetectorVersion\":{\
      \"name\":\"DeleteDetectorVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDetectorVersionRequest\"},\
      \"output\":{\"shape\":\"DeleteDetectorVersionResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Deletes the detector version. You cannot delete detector versions that are in <code>ACTIVE</code> status.</p>\"\
    },\
    \"DeleteEvent\":{\
      \"name\":\"DeleteEvent\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteEventRequest\"},\
      \"output\":{\"shape\":\"DeleteEventResult\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified event.</p>\"\
    },\
    \"DeleteRuleVersion\":{\
      \"name\":\"DeleteRuleVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteRuleVersionRequest\"},\
      \"output\":{\"shape\":\"DeleteRuleVersionResult\"},\
      \"errors\":[\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes the rule version. You cannot delete a rule version if it is used by an <code>ACTIVE</code> or <code>INACTIVE</code> detector version.</p>\"\
    },\
    \"DescribeDetector\":{\
      \"name\":\"DescribeDetector\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDetectorRequest\"},\
      \"output\":{\"shape\":\"DescribeDetectorResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets all versions for a specified detector.</p>\"\
    },\
    \"DescribeModelVersions\":{\
      \"name\":\"DescribeModelVersions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeModelVersionsRequest\"},\
      \"output\":{\"shape\":\"DescribeModelVersionsResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets all of the model versions for the specified model type or for the specified model type and model ID. You can also get details for a single, specified model version. </p>\"\
    },\
    \"GetDetectorVersion\":{\
      \"name\":\"GetDetectorVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDetectorVersionRequest\"},\
      \"output\":{\"shape\":\"GetDetectorVersionResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets a particular detector version. </p>\"\
    },\
    \"GetDetectors\":{\
      \"name\":\"GetDetectors\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDetectorsRequest\"},\
      \"output\":{\"shape\":\"GetDetectorsResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets all of detectors. This is a paginated API. If you provide a null <code>maxSizePerPage</code>, this actions retrieves a maximum of 10 records per page. If you provide a <code>maxSizePerPage</code>, the value must be between 5 and 10. To get the next page results, provide the pagination token from the <code>GetEventTypesResponse</code> as part of your request. A null pagination token fetches the records from the beginning. </p>\"\
    },\
    \"GetExternalModels\":{\
      \"name\":\"GetExternalModels\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetExternalModelsRequest\"},\
      \"output\":{\"shape\":\"GetExternalModelsResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets the details for one or more Amazon SageMaker models that have been imported into the service. This is a paginated API. If you provide a null <code>maxSizePerPage</code>, this actions retrieves a maximum of 10 records per page. If you provide a <code>maxSizePerPage</code>, the value must be between 5 and 10. To get the next page results, provide the pagination token from the <code>GetExternalModelsResult</code> as part of your request. A null pagination token fetches the records from the beginning. </p>\"\
    },\
    \"GetModelVersion\":{\
      \"name\":\"GetModelVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetModelVersionRequest\"},\
      \"output\":{\"shape\":\"GetModelVersionResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets a model version. </p>\"\
    },\
    \"GetModels\":{\
      \"name\":\"GetModels\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetModelsRequest\"},\
      \"output\":{\"shape\":\"GetModelsResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets all of the models for the AWS account, or the specified model type, or gets a single model for the specified model type, model ID combination. </p>\"\
    },\
    \"GetOutcomes\":{\
      \"name\":\"GetOutcomes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetOutcomesRequest\"},\
      \"output\":{\"shape\":\"GetOutcomesResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets one or more outcomes. This is a paginated API. If you provide a null <code>maxSizePerPage</code>, this actions retrieves a maximum of 10 records per page. If you provide a <code>maxSizePerPage</code>, the value must be between 50 and 100. To get the next page results, provide the pagination token from the <code>GetOutcomesResult</code> as part of your request. A null pagination token fetches the records from the beginning. </p>\"\
    },\
    \"GetPrediction\":{\
      \"name\":\"GetPrediction\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetPredictionRequest\"},\
      \"output\":{\"shape\":\"GetPredictionResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Evaluates an event against a detector version. If a version ID is not provided, the detectorâs (<code>ACTIVE</code>) version is used. </p>\"\
    },\
    \"GetRules\":{\
      \"name\":\"GetRules\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetRulesRequest\"},\
      \"output\":{\"shape\":\"GetRulesResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets all rules available for the specified detector.</p>\"\
    },\
    \"GetVariables\":{\
      \"name\":\"GetVariables\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetVariablesRequest\"},\
      \"output\":{\"shape\":\"GetVariablesResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets all of the variables or the specific variable. This is a paginated API. Providing null <code>maxSizePerPage</code> results in retrieving maximum of 100 records per page. If you provide <code>maxSizePerPage</code> the value must be between 50 and 100. To get the next page result, a provide a pagination token from <code>GetVariablesResult</code> as part of your request. Null pagination token fetches the records from the beginning. </p>\"\
    },\
    \"PutDetector\":{\
      \"name\":\"PutDetector\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutDetectorRequest\"},\
      \"output\":{\"shape\":\"PutDetectorResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a detector. </p>\"\
    },\
    \"PutExternalModel\":{\
      \"name\":\"PutExternalModel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutExternalModelRequest\"},\
      \"output\":{\"shape\":\"PutExternalModelResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates an Amazon SageMaker model endpoint. You can also use this action to update the configuration of the model endpoint, including the IAM role and/or the mapped variables. </p>\"\
    },\
    \"PutModel\":{\
      \"name\":\"PutModel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutModelRequest\"},\
      \"output\":{\"shape\":\"PutModelResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a model. </p>\"\
    },\
    \"PutOutcome\":{\
      \"name\":\"PutOutcome\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutOutcomeRequest\"},\
      \"output\":{\"shape\":\"PutOutcomeResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates an outcome. </p>\"\
    },\
    \"UpdateDetectorVersion\":{\
      \"name\":\"UpdateDetectorVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateDetectorVersionRequest\"},\
      \"output\":{\"shape\":\"UpdateDetectorVersionResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p> Updates a detector version. The detector version attributes that you can update include models, external model endpoints, rules, and description. You can only update a <code>DRAFT</code> detector version.</p>\"\
    },\
    \"UpdateDetectorVersionMetadata\":{\
      \"name\":\"UpdateDetectorVersionMetadata\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateDetectorVersionMetadataRequest\"},\
      \"output\":{\"shape\":\"UpdateDetectorVersionMetadataResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Updates the detector version's description. You can update the metadata for any detector version (<code>DRAFT, ACTIVE,</code> or <code>INACTIVE</code>). </p>\"\
    },\
    \"UpdateDetectorVersionStatus\":{\
      \"name\":\"UpdateDetectorVersionStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateDetectorVersionStatusRequest\"},\
      \"output\":{\"shape\":\"UpdateDetectorVersionStatusResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Updates the detector versionâs status. You can perform the following promotions or demotions using <code>UpdateDetectorVersionStatus</code>: <code>DRAFT</code> to <code>ACTIVE</code>, <code>ACTIVE</code> to <code>INACTIVE</code>, and <code>INACTIVE</code> to <code>ACTIVE</code>.</p>\"\
    },\
    \"UpdateModelVersion\":{\
      \"name\":\"UpdateModelVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateModelVersionRequest\"},\
      \"output\":{\"shape\":\"UpdateModelVersionResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Updates a model version. You can update the description and status attributes using this action. You can perform the following status updates: </p> <ol> <li> <p>Change the <code>TRAINING_COMPLETE</code> status to <code>ACTIVE</code> </p> </li> <li> <p>Change <code>ACTIVE</code> back to <code>TRAINING_COMPLETE</code> </p> </li> </ol>\"\
    },\
    \"UpdateRuleMetadata\":{\
      \"name\":\"UpdateRuleMetadata\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateRuleMetadataRequest\"},\
      \"output\":{\"shape\":\"UpdateRuleMetadataResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Updates a rule's metadata. </p>\"\
    },\
    \"UpdateRuleVersion\":{\
      \"name\":\"UpdateRuleVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateRuleVersionRequest\"},\
      \"output\":{\"shape\":\"UpdateRuleVersionResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Updates a rule version resulting in a new rule version. </p>\"\
    },\
    \"UpdateVariable\":{\
      \"name\":\"UpdateVariable\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateVariableRequest\"},\
      \"output\":{\"shape\":\"UpdateVariableResult\"},\
      \"errors\":[\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Updates a variable.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"BatchCreateVariableError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The name.</p>\"\
        },\
        \"code\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The error code. </p>\"\
        },\
        \"message\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The error message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides the error of the batch create variable API.</p>\"\
    },\
    \"BatchCreateVariableErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchCreateVariableError\"}\
    },\
    \"BatchCreateVariableRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"variableEntries\"],\
      \"members\":{\
        \"variableEntries\":{\
          \"shape\":\"VariableEntryList\",\
          \"documentation\":\"<p>The list of variables for the batch create variable request.</p>\"\
        }\
      }\
    },\
    \"BatchCreateVariableResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"errors\":{\
          \"shape\":\"BatchCreateVariableErrorList\",\
          \"documentation\":\"<p>Provides the errors for the <code>BatchCreateVariable</code> request.</p>\"\
        }\
      }\
    },\
    \"BatchGetVariableError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The error name. </p>\"\
        },\
        \"code\":{\
          \"shape\":\"integer\",\
          \"documentation\":\"<p>The error code. </p>\"\
        },\
        \"message\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The error message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides the error of the batch get variable API.</p>\"\
    },\
    \"BatchGetVariableErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchGetVariableError\"}\
    },\
    \"BatchGetVariableRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"names\"],\
      \"members\":{\
        \"names\":{\
          \"shape\":\"NameList\",\
          \"documentation\":\"<p>The list of variable names to get.</p>\"\
        }\
      }\
    },\
    \"BatchGetVariableResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"variables\":{\
          \"shape\":\"VariableList\",\
          \"documentation\":\"<p>The returned variables.</p>\"\
        },\
        \"errors\":{\
          \"shape\":\"BatchGetVariableErrorList\",\
          \"documentation\":\"<p>The errors from the request.</p>\"\
        }\
      }\
    },\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>An exception indicating there was a conflict during a delete operation. The following delete operations can cause a conflict exception:</p> <ul> <li> <p>DeleteDetector: A conflict exception will occur if the detector has associated <code>Rules</code> or <code>DetectorVersions</code>. You can only delete a detector if it has no <code>Rules</code> or <code>DetectorVersions</code>.</p> </li> <li> <p>DeleteDetectorVersion: A conflict exception will occur if the <code>DetectorVersion</code> status is <code>ACTIVE</code>.</p> </li> <li> <p>DeleteRuleVersion: A conflict exception will occur if the <code>RuleVersion</code> is in use by an associated <code>ACTIVE</code> or <code>INACTIVE DetectorVersion</code>.</p> </li> </ul>\",\
      \"exception\":true\
    },\
    \"CreateDetectorVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"detectorId\",\
        \"rules\"\
      ],\
      \"members\":{\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The ID of the detector under which you want to create a new version.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The description of the detector version.</p>\"\
        },\
        \"externalModelEndpoints\":{\
          \"shape\":\"ListOfStrings\",\
          \"documentation\":\"<p>The Amazon Sagemaker model endpoints to include in the detector version.</p>\"\
        },\
        \"rules\":{\
          \"shape\":\"RuleList\",\
          \"documentation\":\"<p>The rules to include in the detector version.</p>\"\
        },\
        \"modelVersions\":{\
          \"shape\":\"ListOfModelVersions\",\
          \"documentation\":\"<p>The model versions to include in the detector version.</p>\"\
        },\
        \"ruleExecutionMode\":{\
          \"shape\":\"RuleExecutionMode\",\
          \"documentation\":\"<p>The rule execution mode for the rules included in the detector version.</p> <p>You can define and edit the rule mode at the detector version level, when it is in draft status.</p> <p>If you specify <code>FIRST_MATCHED</code>, Amazon Fraud Detector evaluates rules sequentially, first to last, stopping at the first matched rule. Amazon Fraud dectector then provides the outcomes for that single rule.</p> <p>If you specifiy <code>ALL_MATCHED</code>, Amazon Fraud Detector evaluates all rules and returns the outcomes for all matched rules. </p> <p>The default behavior is <code>FIRST_MATCHED</code>.</p>\"\
        }\
      }\
    },\
    \"CreateDetectorVersionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The ID for the created version's parent detector.</p>\"\
        },\
        \"detectorVersionId\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The ID for the created detector. </p>\"\
        },\
        \"status\":{\
          \"shape\":\"DetectorVersionStatus\",\
          \"documentation\":\"<p>The status of the detector version.</p>\"\
        }\
      }\
    },\
    \"CreateModelVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"modelId\",\
        \"modelType\"\
      ],\
      \"members\":{\
        \"modelId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The model ID. </p>\"\
        },\
        \"modelType\":{\
          \"shape\":\"ModelTypeEnum\",\
          \"documentation\":\"<p>The model type.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The model version description.</p>\"\
        }\
      }\
    },\
    \"CreateModelVersionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"modelId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The model ID. </p>\"\
        },\
        \"modelType\":{\
          \"shape\":\"ModelTypeEnum\",\
          \"documentation\":\"<p>The model type.</p>\"\
        },\
        \"modelVersionNumber\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The version of the model. </p>\"\
        },\
        \"status\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The model version status. </p>\"\
        }\
      }\
    },\
    \"CreateRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ruleId\",\
        \"detectorId\",\
        \"expression\",\
        \"language\",\
        \"outcomes\"\
      ],\
      \"members\":{\
        \"ruleId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The rule ID.</p>\"\
        },\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The detector ID for the rule's parent detector.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The rule description.</p>\"\
        },\
        \"expression\":{\
          \"shape\":\"ruleExpression\",\
          \"documentation\":\"<p>The rule expression.</p>\"\
        },\
        \"language\":{\
          \"shape\":\"Language\",\
          \"documentation\":\"<p>The language of the rule.</p>\"\
        },\
        \"outcomes\":{\
          \"shape\":\"NonEmptyListOfStrings\",\
          \"documentation\":\"<p>The outcome or outcomes returned when the rule expression matches.</p>\"\
        }\
      }\
    },\
    \"CreateRuleResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"rule\":{\
          \"shape\":\"Rule\",\
          \"documentation\":\"<p>The created rule.</p>\"\
        }\
      }\
    },\
    \"CreateVariableRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"name\",\
        \"dataType\",\
        \"dataSource\",\
        \"defaultValue\"\
      ],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The name of the variable.</p>\"\
        },\
        \"dataType\":{\
          \"shape\":\"DataType\",\
          \"documentation\":\"<p>The data type.</p>\"\
        },\
        \"dataSource\":{\
          \"shape\":\"DataSource\",\
          \"documentation\":\"<p>The source of the data.</p>\"\
        },\
        \"defaultValue\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The default value for the variable when no value is received.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The description.</p>\"\
        },\
        \"variableType\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The variable type.</p>\"\
        }\
      }\
    },\
    \"CreateVariableResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"CsvIndexToVariableMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"string\"},\
      \"value\":{\"shape\":\"string\"}\
    },\
    \"DataSource\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"EVENT\",\
        \"MODEL_SCORE\",\
        \"EXTERNAL_MODEL_SCORE\"\
      ]\
    },\
    \"DataType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STRING\",\
        \"INTEGER\",\
        \"FLOAT\",\
        \"BOOLEAN\"\
      ]\
    },\
    \"DeleteDetectorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"detectorId\"],\
      \"members\":{\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The ID of the detector to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteDetectorResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteDetectorVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"detectorId\",\
        \"detectorVersionId\"\
      ],\
      \"members\":{\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The ID of the parent detector for the detector version to delete.</p>\"\
        },\
        \"detectorVersionId\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The ID of the detector version to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteDetectorVersionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteEventRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"eventId\"],\
      \"members\":{\
        \"eventId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The ID of the event to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteEventResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteRuleVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"detectorId\",\
        \"ruleId\",\
        \"ruleVersion\"\
      ],\
      \"members\":{\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The ID of the detector that includes the rule version to delete.</p>\"\
        },\
        \"ruleId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The rule ID of the rule version to delete.</p>\"\
        },\
        \"ruleVersion\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The rule version to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteRuleVersionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeDetectorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"detectorId\"],\
      \"members\":{\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The detector ID.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next token from the previous response.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"DetectorVersionMaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return for the request.</p>\"\
        }\
      }\
    },\
    \"DescribeDetectorResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The detector ID.</p>\"\
        },\
        \"detectorVersionSummaries\":{\
          \"shape\":\"DetectorVersionSummaryList\",\
          \"documentation\":\"<p>The status and description for each detector version.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next token to be used for subsequent requests.</p>\"\
        }\
      }\
    },\
    \"DescribeModelVersionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"modelId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The model ID.</p>\"\
        },\
        \"modelVersionNumber\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The model version. </p>\"\
        },\
        \"modelType\":{\
          \"shape\":\"ModelTypeEnum\",\
          \"documentation\":\"<p>The model type.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next token from the previous results.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return.</p>\"\
        }\
      }\
    },\
    \"DescribeModelVersionsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"modelVersionDetails\":{\
          \"shape\":\"ModelVersionDetailList\",\
          \"documentation\":\"<p>The model version details.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next token.</p>\"\
        }\
      }\
    },\
    \"Detector\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The detector ID.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The detector description.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"time\",\
          \"documentation\":\"<p>Timestamp of when the detector was last updated.</p>\"\
        },\
        \"createdTime\":{\
          \"shape\":\"time\",\
          \"documentation\":\"<p>Timestamp of when the detector was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The detector.</p>\"\
    },\
    \"DetectorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Detector\"}\
    },\
    \"DetectorVersionMaxResults\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":2500,\
      \"min\":1000\
    },\
    \"DetectorVersionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DRAFT\",\
        \"ACTIVE\",\
        \"INACTIVE\"\
      ]\
    },\
    \"DetectorVersionSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"detectorVersionId\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The detector version ID. </p>\"\
        },\
        \"status\":{\
          \"shape\":\"DetectorVersionStatus\",\
          \"documentation\":\"<p>The detector version status. </p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The detector version description. </p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"time\",\
          \"documentation\":\"<p>Timestamp of when the detector version was last updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The summary of the detector version.</p>\"\
    },\
    \"DetectorVersionSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DetectorVersionSummary\"}\
    },\
    \"DetectorsMaxResults\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":10,\
      \"min\":5\
    },\
    \"EventAttributeMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"attributeKey\"},\
      \"value\":{\"shape\":\"attributeValue\"}\
    },\
    \"ExternalModel\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"modelEndpoint\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The Amazon SageMaker model endpoints.</p>\"\
        },\
        \"modelSource\":{\
          \"shape\":\"ModelSource\",\
          \"documentation\":\"<p>The source of the model.</p>\"\
        },\
        \"role\":{\
          \"shape\":\"Role\",\
          \"documentation\":\"<p>The role used to invoke the model. </p>\"\
        },\
        \"inputConfiguration\":{\
          \"shape\":\"ModelInputConfiguration\",\
          \"documentation\":\"<p>The input configuration.</p>\"\
        },\
        \"outputConfiguration\":{\
          \"shape\":\"ModelOutputConfiguration\",\
          \"documentation\":\"<p>The output configuration.</p>\"\
        },\
        \"modelEndpointStatus\":{\
          \"shape\":\"ModelEndpointStatus\",\
          \"documentation\":\"<p>The Amazon Fraud Detector status for the external model endpoint</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"time\",\
          \"documentation\":\"<p>Timestamp of when the model was last updated.</p>\"\
        },\
        \"createdTime\":{\
          \"shape\":\"time\",\
          \"documentation\":\"<p>Timestamp of when the model was last created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Amazon SageMaker model.</p>\"\
    },\
    \"ExternalModelEndpointDataBlobMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"string\"},\
      \"value\":{\"shape\":\"ModelEndpointDataBlob\"},\
      \"sensitive\":true\
    },\
    \"ExternalModelList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ExternalModel\"}\
    },\
    \"ExternalModelsMaxResults\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":10,\
      \"min\":5\
    },\
    \"GetDetectorVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"detectorId\",\
        \"detectorVersionId\"\
      ],\
      \"members\":{\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The detector ID.</p>\"\
        },\
        \"detectorVersionId\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The detector version ID.</p>\"\
        }\
      }\
    },\
    \"GetDetectorVersionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The detector ID.</p>\"\
        },\
        \"detectorVersionId\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The detector version ID.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The detector version description.</p>\"\
        },\
        \"externalModelEndpoints\":{\
          \"shape\":\"ListOfStrings\",\
          \"documentation\":\"<p>The Amazon SageMaker model endpoints included in the detector version.</p>\"\
        },\
        \"modelVersions\":{\
          \"shape\":\"ListOfModelVersions\",\
          \"documentation\":\"<p>The model versions included in the detector version. </p>\"\
        },\
        \"rules\":{\
          \"shape\":\"RuleList\",\
          \"documentation\":\"<p>The rules included in the detector version.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"DetectorVersionStatus\",\
          \"documentation\":\"<p>The status of the detector version.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"time\",\
          \"documentation\":\"<p>The timestamp when the detector version was last updated. </p>\"\
        },\
        \"createdTime\":{\
          \"shape\":\"time\",\
          \"documentation\":\"<p>The timestamp when the detector version was created. </p>\"\
        },\
        \"ruleExecutionMode\":{\
          \"shape\":\"RuleExecutionMode\",\
          \"documentation\":\"<p>The execution mode of the rule in the dectector</p> <p> <code>FIRST_MATCHED</code> indicates that Amazon Fraud Detector evaluates rules sequentially, first to last, stopping at the first matched rule. Amazon Fraud dectector then provides the outcomes for that single rule.</p> <p> <code>ALL_MATCHED</code> indicates that Amazon Fraud Detector evaluates all rules and returns the outcomes for all matched rules. You can define and edit the rule mode at the detector version level, when it is in draft status.</p>\"\
        }\
      }\
    },\
    \"GetDetectorsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The detector ID.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next token for the subsequent request.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"DetectorsMaxResults\",\
          \"documentation\":\"<p>The maximum number of objects to return for the request.</p>\"\
        }\
      }\
    },\
    \"GetDetectorsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"detectors\":{\
          \"shape\":\"DetectorList\",\
          \"documentation\":\"<p>The detectors.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next page token.</p>\"\
        }\
      }\
    },\
    \"GetExternalModelsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"modelEndpoint\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The Amazon SageMaker model endpoint.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next page token for the request.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"ExternalModelsMaxResults\",\
          \"documentation\":\"<p>The maximum number of objects to return for the request.</p>\"\
        }\
      }\
    },\
    \"GetExternalModelsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"externalModels\":{\
          \"shape\":\"ExternalModelList\",\
          \"documentation\":\"<p>Gets the Amazon SageMaker models.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next page token to be used in subsequent requests.</p>\"\
        }\
      }\
    },\
    \"GetModelVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"modelId\",\
        \"modelType\",\
        \"modelVersionNumber\"\
      ],\
      \"members\":{\
        \"modelId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The model ID. </p>\"\
        },\
        \"modelType\":{\
          \"shape\":\"ModelTypeEnum\",\
          \"documentation\":\"<p>The model type. </p>\"\
        },\
        \"modelVersionNumber\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The model version. </p>\"\
        }\
      }\
    },\
    \"GetModelVersionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"modelId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The model ID. </p>\"\
        },\
        \"modelType\":{\
          \"shape\":\"ModelTypeEnum\",\
          \"documentation\":\"<p>The model type. </p>\"\
        },\
        \"modelVersionNumber\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The model version. </p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The model version description.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The model version status. </p>\"\
        }\
      }\
    },\
    \"GetModelsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"modelType\":{\
          \"shape\":\"ModelTypeEnum\",\
          \"documentation\":\"<p>The model type.</p>\"\
        },\
        \"modelId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The model ID.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next token for the request.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum results to return for the request.</p>\"\
        }\
      }\
    },\
    \"GetModelsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next token for subsequent requests. </p>\"\
        },\
        \"models\":{\
          \"shape\":\"ModelList\",\
          \"documentation\":\"<p>The returned models. </p>\"\
        }\
      }\
    },\
    \"GetOutcomesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The name of the outcome or outcomes to get.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next page token for the request. </p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"OutcomesMaxResults\",\
          \"documentation\":\"<p>The maximum number of objects to return for the request. </p>\"\
        }\
      }\
    },\
    \"GetOutcomesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"outcomes\":{\
          \"shape\":\"OutcomeList\",\
          \"documentation\":\"<p>The outcomes. </p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next page token for subsequent requests.</p>\"\
        }\
      }\
    },\
    \"GetPredictionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"detectorId\",\
        \"eventId\"\
      ],\
      \"members\":{\
        \"detectorId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The detector ID. </p>\"\
        },\
        \"detectorVersionId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The detector version ID.</p>\"\
        },\
        \"eventId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The unique ID used to identify the event.</p>\"\
        },\
        \"eventAttributes\":{\
          \"shape\":\"EventAttributeMap\",\
          \"documentation\":\"<p>Names of variables you defined in Amazon Fraud Detector to represent event data elements and their corresponding values for the event you are sending for evaluation.</p>\"\
        },\
        \"externalModelEndpointDataBlobs\":{\
          \"shape\":\"ExternalModelEndpointDataBlobMap\",\
          \"documentation\":\"<p>The Amazon SageMaker model endpoint input data blobs.</p>\"\
        }\
      }\
    },\
    \"GetPredictionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"outcomes\":{\
          \"shape\":\"ListOfStrings\",\
          \"documentation\":\"<p>The prediction outcomes.</p>\"\
        },\
        \"modelScores\":{\
          \"shape\":\"ListOfModelScores\",\
          \"documentation\":\"<p>The model scores for models used in the detector version.</p>\"\
        },\
        \"ruleResults\":{\
          \"shape\":\"ListOfRuleResults\",\
          \"documentation\":\"<p>The rule results in the prediction.</p>\"\
        }\
      }\
    },\
    \"GetRulesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"detectorId\"],\
      \"members\":{\
        \"ruleId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The rule ID.</p>\"\
        },\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The detector ID.</p>\"\
        },\
        \"ruleVersion\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The rule version.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next page token.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"RulesMaxResults\",\
          \"documentation\":\"<p>The maximum number of rules to return for the request.</p>\"\
        }\
      }\
    },\
    \"GetRulesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ruleDetails\":{\
          \"shape\":\"RuleDetailList\",\
          \"documentation\":\"<p>The details of the requested rule.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next page token to be used in subsequent requests.</p>\"\
        }\
      }\
    },\
    \"GetVariablesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The name of the variable. </p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next page token of the get variable request. </p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"VariablesMaxResults\",\
          \"documentation\":\"<p>The max size per page determined for the get variable request. </p>\"\
        }\
      }\
    },\
    \"GetVariablesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"variables\":{\
          \"shape\":\"VariableList\",\
          \"documentation\":\"<p>The names of the variables returned. </p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next page token to be used in subsequent requests. </p>\"\
        }\
      }\
    },\
    \"InternalServerException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>An exception indicating an internal server error.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"IsOpaque\":{\"type\":\"boolean\"},\
    \"JsonKeyToVariableMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"string\"},\
      \"value\":{\"shape\":\"string\"}\
    },\
    \"LabelMapper\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"string\"},\
      \"value\":{\"shape\":\"ListOfStrings\"}\
    },\
    \"LabelSchema\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"labelKey\",\
        \"labelMapper\"\
      ],\
      \"members\":{\
        \"labelKey\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The label key.</p>\"\
        },\
        \"labelMapper\":{\
          \"shape\":\"LabelMapper\",\
          \"documentation\":\"<p>The label mapper maps the Amazon Fraud Detector supported label to the appropriate source labels. For example, if <code>\\\"FRAUD\\\"</code> and <code>\\\"LEGIT\\\"</code> are Amazon Fraud Detector supported labels, this mapper could be: <code>{\\\"FRAUD\\\" =&gt; [\\\"0\\\"]</code>, \\\"LEGIT\\\" =&gt; [\\\"1\\\"]} or <code>{\\\"FRAUD\\\" =&gt; [\\\"false\\\"], \\\"LEGIT\\\" =&gt; [\\\"true\\\"]}</code> or <code>{\\\"FRAUD\\\" =&gt; [\\\"fraud\\\", \\\"abuse\\\"], \\\"LEGIT\\\" =&gt; [\\\"legit\\\", \\\"safe\\\"]}</code>. The value part of the mapper is a list, because you may have multiple variants for a single Amazon Fraud Detector label. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The label schema.</p>\"\
    },\
    \"Language\":{\
      \"type\":\"string\",\
      \"enum\":[\"DETECTORPL\"]\
    },\
    \"ListOfModelScores\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ModelScores\"}\
    },\
    \"ListOfModelVersions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ModelVersion\"}\
    },\
    \"ListOfRuleResults\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RuleResult\"}\
    },\
    \"ListOfStrings\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"string\"}\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":10,\
      \"min\":1\
    },\
    \"MetricsMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"string\"},\
      \"value\":{\"shape\":\"string\"}\
    },\
    \"Model\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"modelId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The model ID.</p>\"\
        },\
        \"modelType\":{\
          \"shape\":\"ModelTypeEnum\",\
          \"documentation\":\"<p>The model type.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The model description.</p>\"\
        },\
        \"trainingDataSource\":{\
          \"shape\":\"TrainingDataSource\",\
          \"documentation\":\"<p>The model training data source in Amazon S3.</p>\"\
        },\
        \"modelVariables\":{\
          \"shape\":\"ModelVariablesList\",\
          \"documentation\":\"<p>The model input variables.</p>\"\
        },\
        \"labelSchema\":{\
          \"shape\":\"LabelSchema\",\
          \"documentation\":\"<p>The model label schema.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"time\",\
          \"documentation\":\"<p>Timestamp of last time the model was updated.</p>\"\
        },\
        \"createdTime\":{\
          \"shape\":\"time\",\
          \"documentation\":\"<p>Timestamp of when the model was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The model.</p>\"\
    },\
    \"ModelEndpointDataBlob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"byteBuffer\":{\
          \"shape\":\"blob\",\
          \"documentation\":\"<p>The byte buffer of the Amazon SageMaker model endpoint input data blob.</p>\"\
        },\
        \"contentType\":{\
          \"shape\":\"contentType\",\
          \"documentation\":\"<p>The content type of the Amazon SageMaker model endpoint input data blob. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A pre-formed Amazon SageMaker model input you can include if your detector version includes an imported Amazon SageMaker model endpoint with pass-through input configuration.</p>\"\
    },\
    \"ModelEndpointStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ASSOCIATED\",\
        \"DISSOCIATED\"\
      ]\
    },\
    \"ModelInputConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"isOpaque\"],\
      \"members\":{\
        \"format\":{\
          \"shape\":\"ModelInputDataFormat\",\
          \"documentation\":\"<p> The format of the model input configuration. The format differs depending on if it is passed through to SageMaker or constructed by Amazon Fraud Detector.</p>\"\
        },\
        \"isOpaque\":{\
          \"shape\":\"IsOpaque\",\
          \"documentation\":\"<p> For an opaque-model, the input to the model will be a ByteBuffer blob provided in the getPrediction request, and will be passed to SageMaker as-is. For non-opaque models, the input will be constructed by Amazon Fraud Detector based on the model-configuration. </p>\"\
        },\
        \"jsonInputTemplate\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p> Template for constructing the JSON input-data sent to SageMaker. At event-evaluation, the placeholders for variable names in the template will be replaced with the variable values before being sent to SageMaker. </p>\"\
        },\
        \"csvInputTemplate\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p> Template for constructing the CSV input-data sent to SageMaker. At event-evaluation, the placeholders for variable-names in the template will be replaced with the variable values before being sent to SageMaker. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The model input configuration.</p>\"\
    },\
    \"ModelInputDataFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TEXT_CSV\",\
        \"APPLICATION_JSON\"\
      ]\
    },\
    \"ModelList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Model\"}\
    },\
    \"ModelOutputConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"format\"],\
      \"members\":{\
        \"format\":{\
          \"shape\":\"ModelOutputDataFormat\",\
          \"documentation\":\"<p>The format of the model output configuration.</p>\"\
        },\
        \"jsonKeyToVariableMap\":{\
          \"shape\":\"JsonKeyToVariableMap\",\
          \"documentation\":\"<p>A map of JSON keys in response from SageMaker to the Amazon Fraud Detector variables. </p>\"\
        },\
        \"csvIndexToVariableMap\":{\
          \"shape\":\"CsvIndexToVariableMap\",\
          \"documentation\":\"<p>A map of CSV index values in the SageMaker response to the Amazon Fraud Detector variables. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides the model output configuration.</p>\"\
    },\
    \"ModelOutputDataFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TEXT_CSV\",\
        \"APPLICATION_JSONLINES\"\
      ]\
    },\
    \"ModelPredictionMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"string\"},\
      \"value\":{\"shape\":\"float\"}\
    },\
    \"ModelScores\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"modelVersion\":{\
          \"shape\":\"ModelVersion\",\
          \"documentation\":\"<p>The model version.</p>\"\
        },\
        \"scores\":{\
          \"shape\":\"ModelPredictionMap\",\
          \"documentation\":\"<p>The model's fraud prediction scores.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The fraud prediction scores.</p>\"\
    },\
    \"ModelSource\":{\
      \"type\":\"string\",\
      \"enum\":[\"SAGEMAKER\"]\
    },\
    \"ModelTypeEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\"ONLINE_FRAUD_INSIGHTS\"]\
    },\
    \"ModelVariable\":{\
      \"type\":\"structure\",\
      \"required\":[\"name\"],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The model variable's name.&gt;</p>\"\
        },\
        \"index\":{\
          \"shape\":\"ModelVariableIndex\",\
          \"documentation\":\"<p>The model variable's index.&gt;</p>\"\
        }\
      },\
      \"documentation\":\"<p>The model variable.&gt;</p>\"\
    },\
    \"ModelVariableIndex\":{\"type\":\"integer\"},\
    \"ModelVariablesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ModelVariable\"}\
    },\
    \"ModelVersion\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"modelId\",\
        \"modelType\",\
        \"modelVersionNumber\"\
      ],\
      \"members\":{\
        \"modelId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The parent model ID.</p>\"\
        },\
        \"modelType\":{\
          \"shape\":\"ModelTypeEnum\",\
          \"documentation\":\"<p>The model type.</p>\"\
        },\
        \"modelVersionNumber\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The model version.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The model version.</p>\"\
    },\
    \"ModelVersionDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"modelId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The model ID.</p>\"\
        },\
        \"modelType\":{\
          \"shape\":\"ModelTypeEnum\",\
          \"documentation\":\"<p>The model type.</p>\"\
        },\
        \"modelVersionNumber\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The model version.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The model description.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The model status.</p>\"\
        },\
        \"trainingDataSource\":{\
          \"shape\":\"TrainingDataSource\",\
          \"documentation\":\"<p>The model training data source.</p>\"\
        },\
        \"modelVariables\":{\
          \"shape\":\"ModelVariablesList\",\
          \"documentation\":\"<p>The model variables.</p>\"\
        },\
        \"labelSchema\":{\
          \"shape\":\"LabelSchema\",\
          \"documentation\":\"<p>The model label schema.</p>\"\
        },\
        \"validationMetrics\":{\
          \"shape\":\"MetricsMap\",\
          \"documentation\":\"<p>The model validation metrics.</p>\"\
        },\
        \"trainingMetrics\":{\
          \"shape\":\"MetricsMap\",\
          \"documentation\":\"<p>The model training metrics.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"time\",\
          \"documentation\":\"<p>The timestamp when the model was last updated.</p>\"\
        },\
        \"createdTime\":{\
          \"shape\":\"time\",\
          \"documentation\":\"<p>The timestamp when the model was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides the model version details. </p>\"\
    },\
    \"ModelVersionDetailList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ModelVersionDetail\"}\
    },\
    \"ModelVersionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TRAINING_IN_PROGRESS\",\
        \"TRAINING_COMPLETE\",\
        \"ACTIVATE_REQUESTED\",\
        \"ACTIVATE_IN_PROGRESS\",\
        \"ACTIVE\",\
        \"INACTIVATE_IN_PROGRESS\",\
        \"INACTIVE\",\
        \"ERROR\"\
      ]\
    },\
    \"NameList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"string\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"NonEmptyListOfStrings\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"string\"},\
      \"min\":1\
    },\
    \"Outcome\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The outcome name.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The outcome description.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"time\",\
          \"documentation\":\"<p>The timestamp when the outcome was last updated.</p>\"\
        },\
        \"createdTime\":{\
          \"shape\":\"time\",\
          \"documentation\":\"<p>The timestamp when the outcome was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The outcome.</p>\"\
    },\
    \"OutcomeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Outcome\"}\
    },\
    \"OutcomesMaxResults\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":100,\
      \"min\":50\
    },\
    \"PutDetectorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"detectorId\"],\
      \"members\":{\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The detector ID. </p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The description of the detector.</p>\"\
        }\
      }\
    },\
    \"PutDetectorResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"PutExternalModelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"modelEndpoint\",\
        \"modelSource\",\
        \"role\",\
        \"inputConfiguration\",\
        \"outputConfiguration\",\
        \"modelEndpointStatus\"\
      ],\
      \"members\":{\
        \"modelEndpoint\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The model endpoints name.</p>\"\
        },\
        \"modelSource\":{\
          \"shape\":\"ModelSource\",\
          \"documentation\":\"<p>The source of the model.</p>\"\
        },\
        \"role\":{\
          \"shape\":\"Role\",\
          \"documentation\":\"<p>The IAM role used to invoke the model endpoint.</p>\"\
        },\
        \"inputConfiguration\":{\
          \"shape\":\"ModelInputConfiguration\",\
          \"documentation\":\"<p>The model endpoint input configuration.</p>\"\
        },\
        \"outputConfiguration\":{\
          \"shape\":\"ModelOutputConfiguration\",\
          \"documentation\":\"<p>The model endpoint output configuration.</p>\"\
        },\
        \"modelEndpointStatus\":{\
          \"shape\":\"ModelEndpointStatus\",\
          \"documentation\":\"<p>The model endpointâs status in Amazon Fraud Detector.</p>\"\
        }\
      }\
    },\
    \"PutExternalModelResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"PutModelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"modelId\",\
        \"modelType\",\
        \"trainingDataSource\",\
        \"modelVariables\",\
        \"labelSchema\"\
      ],\
      \"members\":{\
        \"modelId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The model ID.</p>\"\
        },\
        \"modelType\":{\
          \"shape\":\"ModelTypeEnum\",\
          \"documentation\":\"<p>The model type. </p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The model description. </p>\"\
        },\
        \"trainingDataSource\":{\
          \"shape\":\"TrainingDataSource\",\
          \"documentation\":\"<p>The training data source location in Amazon S3. </p>\"\
        },\
        \"modelVariables\":{\
          \"shape\":\"ModelVariablesList\",\
          \"documentation\":\"<p>The model input variables.</p>\"\
        },\
        \"labelSchema\":{\
          \"shape\":\"LabelSchema\",\
          \"documentation\":\"<p>The label schema.</p>\"\
        }\
      }\
    },\
    \"PutModelResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"PutOutcomeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"name\"],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The name of the outcome.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The outcome description.</p>\"\
        }\
      }\
    },\
    \"PutOutcomeResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>An exception indicating the specified resource was not found.</p>\",\
      \"exception\":true\
    },\
    \"Role\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"arn\",\
        \"name\"\
      ],\
      \"members\":{\
        \"arn\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The role ARN.</p>\"\
        },\
        \"name\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The role name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The role used to invoke external model endpoints.</p>\"\
    },\
    \"Rule\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"detectorId\",\
        \"ruleId\",\
        \"ruleVersion\"\
      ],\
      \"members\":{\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The detector for which the rule is associated.</p>\"\
        },\
        \"ruleId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The rule ID.</p>\"\
        },\
        \"ruleVersion\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The rule version.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A rule.</p>\"\
    },\
    \"RuleDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ruleId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The rule ID.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The rule description.</p>\"\
        },\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The detector for which the rule is associated.</p>\"\
        },\
        \"ruleVersion\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The rule version.</p>\"\
        },\
        \"expression\":{\
          \"shape\":\"ruleExpression\",\
          \"documentation\":\"<p>The rule expression.</p>\"\
        },\
        \"language\":{\
          \"shape\":\"Language\",\
          \"documentation\":\"<p>The rule language.</p>\"\
        },\
        \"outcomes\":{\
          \"shape\":\"NonEmptyListOfStrings\",\
          \"documentation\":\"<p>The rule outcomes.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"time\",\
          \"documentation\":\"<p>Timestamp of the last time the rule was updated.</p>\"\
        },\
        \"createdTime\":{\
          \"shape\":\"time\",\
          \"documentation\":\"<p>The timestamp of when the rule was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of the rule.</p>\"\
    },\
    \"RuleDetailList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RuleDetail\"}\
    },\
    \"RuleExecutionMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ALL_MATCHED\",\
        \"FIRST_MATCHED\"\
      ]\
    },\
    \"RuleList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Rule\"}\
    },\
    \"RuleResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ruleId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The rule ID that was matched, based on the rule execution mode.</p>\"\
        },\
        \"outcomes\":{\
          \"shape\":\"ListOfStrings\",\
          \"documentation\":\"<p>The outcomes of the matched rule, based on the rule execution mode.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The rule results.</p>\"\
    },\
    \"RulesMaxResults\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":100,\
      \"min\":50\
    },\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>An exception indicating a throttling error.</p>\",\
      \"exception\":true\
    },\
    \"TrainingDataSource\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"dataLocation\",\
        \"dataAccessRoleArn\"\
      ],\
      \"members\":{\
        \"dataLocation\":{\
          \"shape\":\"s3BucketLocation\",\
          \"documentation\":\"<p>The data location of the training data source.</p>\"\
        },\
        \"dataAccessRoleArn\":{\
          \"shape\":\"iamRoleArn\",\
          \"documentation\":\"<p>The data access role ARN for the training data source.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The training data source.</p>\"\
    },\
    \"UpdateDetectorVersionMetadataRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"detectorId\",\
        \"detectorVersionId\",\
        \"description\"\
      ],\
      \"members\":{\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The detector ID.</p>\"\
        },\
        \"detectorVersionId\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The detector version ID. </p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The description.</p>\"\
        }\
      }\
    },\
    \"UpdateDetectorVersionMetadataResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateDetectorVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"detectorId\",\
        \"detectorVersionId\",\
        \"externalModelEndpoints\",\
        \"rules\"\
      ],\
      \"members\":{\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The parent detector ID for the detector version you want to update.</p>\"\
        },\
        \"detectorVersionId\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The detector version ID. </p>\"\
        },\
        \"externalModelEndpoints\":{\
          \"shape\":\"ListOfStrings\",\
          \"documentation\":\"<p>The Amazon SageMaker model endpoints to include in the detector version.</p>\"\
        },\
        \"rules\":{\
          \"shape\":\"RuleList\",\
          \"documentation\":\"<p>The rules to include in the detector version.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The detector version description. </p>\"\
        },\
        \"modelVersions\":{\
          \"shape\":\"ListOfModelVersions\",\
          \"documentation\":\"<p>The model versions to include in the detector version.</p>\"\
        },\
        \"ruleExecutionMode\":{\
          \"shape\":\"RuleExecutionMode\",\
          \"documentation\":\"<p>The rule execution mode to add to the detector.</p> <p>If you specify <code>FIRST_MATCHED</code>, Amazon Fraud Detector evaluates rules sequentially, first to last, stopping at the first matched rule. Amazon Fraud dectector then provides the outcomes for that single rule.</p> <p>If you specifiy <code>ALL_MATCHED</code>, Amazon Fraud Detector evaluates all rules and returns the outcomes for all matched rules. You can define and edit the rule mode at the detector version level, when it is in draft status.</p> <p>The default behavior is <code>FIRST_MATCHED</code>.</p>\"\
        }\
      }\
    },\
    \"UpdateDetectorVersionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateDetectorVersionStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"detectorId\",\
        \"detectorVersionId\",\
        \"status\"\
      ],\
      \"members\":{\
        \"detectorId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The detector ID. </p>\"\
        },\
        \"detectorVersionId\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The detector version ID. </p>\"\
        },\
        \"status\":{\
          \"shape\":\"DetectorVersionStatus\",\
          \"documentation\":\"<p>The new status.</p>\"\
        }\
      }\
    },\
    \"UpdateDetectorVersionStatusResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateModelVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"modelId\",\
        \"modelType\",\
        \"modelVersionNumber\",\
        \"description\",\
        \"status\"\
      ],\
      \"members\":{\
        \"modelId\":{\
          \"shape\":\"identifier\",\
          \"documentation\":\"<p>The model ID.</p>\"\
        },\
        \"modelType\":{\
          \"shape\":\"ModelTypeEnum\",\
          \"documentation\":\"<p>The model type.</p>\"\
        },\
        \"modelVersionNumber\":{\
          \"shape\":\"nonEmptyString\",\
          \"documentation\":\"<p>The model version.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The model description.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"ModelVersionStatus\",\
          \"documentation\":\"<p>The new model status.</p>\"\
        }\
      }\
    },\
    \"UpdateModelVersionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateRuleMetadataRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"rule\",\
        \"description\"\
      ],\
      \"members\":{\
        \"rule\":{\
          \"shape\":\"Rule\",\
          \"documentation\":\"<p>The rule to update.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The rule description.</p>\"\
        }\
      }\
    },\
    \"UpdateRuleMetadataResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateRuleVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"rule\",\
        \"expression\",\
        \"language\",\
        \"outcomes\"\
      ],\
      \"members\":{\
        \"rule\":{\
          \"shape\":\"Rule\",\
          \"documentation\":\"<p>The rule to update.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"description\",\
          \"documentation\":\"<p>The description.</p>\"\
        },\
        \"expression\":{\
          \"shape\":\"ruleExpression\",\
          \"documentation\":\"<p>The rule expression.</p>\"\
        },\
        \"language\":{\
          \"shape\":\"Language\",\
          \"documentation\":\"<p>The language.</p>\"\
        },\
        \"outcomes\":{\
          \"shape\":\"NonEmptyListOfStrings\",\
          \"documentation\":\"<p>The outcomes.</p>\"\
        }\
      }\
    },\
    \"UpdateRuleVersionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"rule\":{\
          \"shape\":\"Rule\",\
          \"documentation\":\"<p>The new rule version that was created.</p>\"\
        }\
      }\
    },\
    \"UpdateVariableRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"name\"],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The name of the variable.</p>\"\
        },\
        \"defaultValue\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The new default value of the variable.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The new description.</p>\"\
        },\
        \"variableType\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The variable type.</p>\"\
        }\
      }\
    },\
    \"UpdateVariableResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"ValidationException\":{\
      \"type\":\"structure\",\
      \"required\":[\"message\"],\
      \"members\":{\
        \"message\":{\"shape\":\"string\"}\
      },\
      \"documentation\":\"<p>An exception indicating a specified value is not allowed.</p>\",\
      \"exception\":true\
    },\
    \"Variable\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The name of the variable.</p>\"\
        },\
        \"dataType\":{\
          \"shape\":\"DataType\",\
          \"documentation\":\"<p>The data type of the variable.</p>\"\
        },\
        \"dataSource\":{\
          \"shape\":\"DataSource\",\
          \"documentation\":\"<p>The data source of the variable.</p>\"\
        },\
        \"defaultValue\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The default value of the variable.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The description of the variable. </p>\"\
        },\
        \"variableType\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The variable type of the variable.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"time\",\
          \"documentation\":\"<p>The time when variable was last updated.</p>\"\
        },\
        \"createdTime\":{\
          \"shape\":\"time\",\
          \"documentation\":\"<p>The time when the variable was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The variable.</p>\"\
    },\
    \"VariableEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The name of the variable entry.</p>\"\
        },\
        \"dataType\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The data type of the variable entry.</p>\"\
        },\
        \"dataSource\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The data source of the variable entry.</p>\"\
        },\
        \"defaultValue\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The default value of the variable entry.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The description of the variable entry.</p>\"\
        },\
        \"variableType\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The type of the variable entry.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The variable entry in a list.</p>\"\
    },\
    \"VariableEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VariableEntry\"},\
      \"max\":25,\
      \"min\":1\
    },\
    \"VariableList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Variable\"}\
    },\
    \"VariablesMaxResults\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":100,\
      \"min\":50\
    },\
    \"attributeKey\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"attributeValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"sensitive\":true\
    },\
    \"blob\":{\"type\":\"blob\"},\
    \"contentType\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"description\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"float\":{\"type\":\"float\"},\
    \"iamRoleArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"^arn\\\\:aws\\\\:iam\\\\:\\\\:[0-9]{12}\\\\:role\\\\/[^\\\\s]{2,64}$\"\
    },\
    \"identifier\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-z_-]+$\"\
    },\
    \"integer\":{\"type\":\"integer\"},\
    \"nonEmptyString\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"ruleExpression\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":1\
    },\
    \"s3BucketLocation\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"^s3:\\\\/\\\\/(.+)$\"\
    },\
    \"string\":{\"type\":\"string\"},\
    \"time\":{\"type\":\"string\"}\
  },\
  \"documentation\":\"<p>This is the Amazon Fraud Detector API Reference. This guide is for developers who need detailed information about Amazon Fraud Detector API actions, data types, and errors. For more information about Amazon Fraud Detector features, see the <a href=\\\"https://docs.aws.amazon.com/frauddetector/latest/ug/\\\">Amazon Fraud Detector User Guide</a>.</p>\"\
}\
";
}

@end
