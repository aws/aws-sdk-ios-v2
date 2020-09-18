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

#import "AWSComprehendResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSComprehendResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSComprehendResources

+ (instancetype)sharedInstance {
    static AWSComprehendResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSComprehendResources new];
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
    \"apiVersion\":\"2017-11-27\",\
    \"endpointPrefix\":\"comprehend\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Comprehend\",\
    \"serviceId\":\"Comprehend\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"comprehend\",\
    \"targetPrefix\":\"Comprehend_20171127\",\
    \"uid\":\"comprehend-2017-11-27\"\
  },\
  \"operations\":{\
    \"BatchDetectDominantLanguage\":{\
      \"name\":\"BatchDetectDominantLanguage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchDetectDominantLanguageRequest\"},\
      \"output\":{\"shape\":\"BatchDetectDominantLanguageResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"BatchSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Determines the dominant language of the input text for a batch of documents. For a list of languages that Amazon Comprehend can detect, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html\\\">Amazon Comprehend Supported Languages</a>. </p>\"\
    },\
    \"BatchDetectEntities\":{\
      \"name\":\"BatchDetectEntities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchDetectEntitiesRequest\"},\
      \"output\":{\"shape\":\"BatchDetectEntitiesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"BatchSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects the text of a batch of documents for named entities and returns information about them. For more information about named entities, see <a>how-entities</a> </p>\"\
    },\
    \"BatchDetectKeyPhrases\":{\
      \"name\":\"BatchDetectKeyPhrases\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchDetectKeyPhrasesRequest\"},\
      \"output\":{\"shape\":\"BatchDetectKeyPhrasesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"BatchSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Detects the key noun phrases found in a batch of documents.</p>\"\
    },\
    \"BatchDetectSentiment\":{\
      \"name\":\"BatchDetectSentiment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchDetectSentimentRequest\"},\
      \"output\":{\"shape\":\"BatchDetectSentimentResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"BatchSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects a batch of documents and returns an inference of the prevailing sentiment, <code>POSITIVE</code>, <code>NEUTRAL</code>, <code>MIXED</code>, or <code>NEGATIVE</code>, in each one.</p>\"\
    },\
    \"BatchDetectSyntax\":{\
      \"name\":\"BatchDetectSyntax\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchDetectSyntaxRequest\"},\
      \"output\":{\"shape\":\"BatchDetectSyntaxResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"BatchSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects the text of a batch of documents for the syntax and part of speech of the words in the document and returns information about them. For more information, see <a>how-syntax</a>.</p>\"\
    },\
    \"ClassifyDocument\":{\
      \"name\":\"ClassifyDocument\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ClassifyDocumentRequest\"},\
      \"output\":{\"shape\":\"ClassifyDocumentResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceUnavailableException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Creates a new document classification request to analyze a single document in real-time, using a previously created and trained custom model and an endpoint.</p>\"\
    },\
    \"CreateDocumentClassifier\":{\
      \"name\":\"CreateDocumentClassifier\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateDocumentClassifierRequest\"},\
      \"output\":{\"shape\":\"CreateDocumentClassifierResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Creates a new document classifier that you can use to categorize documents. To create a classifier, you provide a set of training documents that labeled with the categories that you want to use. After the classifier is trained you can use it to categorize a set of labeled documents into the categories. For more information, see <a>how-document-classification</a>.</p>\"\
    },\
    \"CreateEndpoint\":{\
      \"name\":\"CreateEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateEndpointRequest\"},\
      \"output\":{\"shape\":\"CreateEndpointResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceUnavailableException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Creates a model-specific endpoint for synchronous inference for a previously trained custom model </p>\"\
    },\
    \"CreateEntityRecognizer\":{\
      \"name\":\"CreateEntityRecognizer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateEntityRecognizerRequest\"},\
      \"output\":{\"shape\":\"CreateEntityRecognizerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Creates an entity recognizer using submitted files. After your <code>CreateEntityRecognizer</code> request is submitted, you can check job status using the API. </p>\"\
    },\
    \"DeleteDocumentClassifier\":{\
      \"name\":\"DeleteDocumentClassifier\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDocumentClassifierRequest\"},\
      \"output\":{\"shape\":\"DeleteDocumentClassifierResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceUnavailableException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Deletes a previously created document classifier</p> <p>Only those classifiers that are in terminated states (IN_ERROR, TRAINED) will be deleted. If an active inference job is using the model, a <code>ResourceInUseException</code> will be returned.</p> <p>This is an asynchronous action that puts the classifier into a DELETING state, and it is then removed by a background job. Once removed, the classifier disappears from your account and is no longer available for use. </p>\"\
    },\
    \"DeleteEndpoint\":{\
      \"name\":\"DeleteEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteEndpointRequest\"},\
      \"output\":{\"shape\":\"DeleteEndpointResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Deletes a model-specific endpoint for a previously-trained custom model. All endpoints must be deleted in order for the model to be deleted.</p>\"\
    },\
    \"DeleteEntityRecognizer\":{\
      \"name\":\"DeleteEntityRecognizer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteEntityRecognizerRequest\"},\
      \"output\":{\"shape\":\"DeleteEntityRecognizerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceUnavailableException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Deletes an entity recognizer.</p> <p>Only those recognizers that are in terminated states (IN_ERROR, TRAINED) will be deleted. If an active inference job is using the model, a <code>ResourceInUseException</code> will be returned.</p> <p>This is an asynchronous action that puts the recognizer into a DELETING state, and it is then removed by a background job. Once removed, the recognizer disappears from your account and is no longer available for use. </p>\"\
    },\
    \"DescribeDocumentClassificationJob\":{\
      \"name\":\"DescribeDocumentClassificationJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDocumentClassificationJobRequest\"},\
      \"output\":{\"shape\":\"DescribeDocumentClassificationJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a document classification job. Use this operation to get the status of a classification job.</p>\"\
    },\
    \"DescribeDocumentClassifier\":{\
      \"name\":\"DescribeDocumentClassifier\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDocumentClassifierRequest\"},\
      \"output\":{\"shape\":\"DescribeDocumentClassifierResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a document classifier.</p>\"\
    },\
    \"DescribeDominantLanguageDetectionJob\":{\
      \"name\":\"DescribeDominantLanguageDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDominantLanguageDetectionJobRequest\"},\
      \"output\":{\"shape\":\"DescribeDominantLanguageDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a dominant language detection job. Use this operation to get the status of a detection job.</p>\"\
    },\
    \"DescribeEndpoint\":{\
      \"name\":\"DescribeEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeEndpointRequest\"},\
      \"output\":{\"shape\":\"DescribeEndpointResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a specific endpoint. Use this operation to get the status of an endpoint.</p>\"\
    },\
    \"DescribeEntitiesDetectionJob\":{\
      \"name\":\"DescribeEntitiesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeEntitiesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"DescribeEntitiesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with an entities detection job. Use this operation to get the status of a detection job.</p>\"\
    },\
    \"DescribeEntityRecognizer\":{\
      \"name\":\"DescribeEntityRecognizer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeEntityRecognizerRequest\"},\
      \"output\":{\"shape\":\"DescribeEntityRecognizerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Provides details about an entity recognizer including status, S3 buckets containing training data, recognizer metadata, metrics, and so on.</p>\"\
    },\
    \"DescribeKeyPhrasesDetectionJob\":{\
      \"name\":\"DescribeKeyPhrasesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeKeyPhrasesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"DescribeKeyPhrasesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a key phrases detection job. Use this operation to get the status of a detection job.</p>\"\
    },\
    \"DescribePiiEntitiesDetectionJob\":{\
      \"name\":\"DescribePiiEntitiesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribePiiEntitiesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"DescribePiiEntitiesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a PII entities detection job. For example, you can use this operation to get the job status.</p>\"\
    },\
    \"DescribeSentimentDetectionJob\":{\
      \"name\":\"DescribeSentimentDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSentimentDetectionJobRequest\"},\
      \"output\":{\"shape\":\"DescribeSentimentDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a sentiment detection job. Use this operation to get the status of a detection job.</p>\"\
    },\
    \"DescribeTopicsDetectionJob\":{\
      \"name\":\"DescribeTopicsDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTopicsDetectionJobRequest\"},\
      \"output\":{\"shape\":\"DescribeTopicsDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a topic detection job. Use this operation to get the status of a detection job.</p>\"\
    },\
    \"DetectDominantLanguage\":{\
      \"name\":\"DetectDominantLanguage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectDominantLanguageRequest\"},\
      \"output\":{\"shape\":\"DetectDominantLanguageResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Determines the dominant language of the input text. For a list of languages that Amazon Comprehend can detect, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html\\\">Amazon Comprehend Supported Languages</a>. </p>\"\
    },\
    \"DetectEntities\":{\
      \"name\":\"DetectEntities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectEntitiesRequest\"},\
      \"output\":{\"shape\":\"DetectEntitiesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceUnavailableException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects text for named entities, and returns information about them. For more information, about named entities, see <a>how-entities</a>. </p>\"\
    },\
    \"DetectKeyPhrases\":{\
      \"name\":\"DetectKeyPhrases\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectKeyPhrasesRequest\"},\
      \"output\":{\"shape\":\"DetectKeyPhrasesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Detects the key noun phrases found in the text. </p>\"\
    },\
    \"DetectPiiEntities\":{\
      \"name\":\"DetectPiiEntities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectPiiEntitiesRequest\"},\
      \"output\":{\"shape\":\"DetectPiiEntitiesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects the input text for entities that contain personally identifiable information (PII) and returns information about them.</p>\"\
    },\
    \"DetectSentiment\":{\
      \"name\":\"DetectSentiment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectSentimentRequest\"},\
      \"output\":{\"shape\":\"DetectSentimentResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects text and returns an inference of the prevailing sentiment (<code>POSITIVE</code>, <code>NEUTRAL</code>, <code>MIXED</code>, or <code>NEGATIVE</code>). </p>\"\
    },\
    \"DetectSyntax\":{\
      \"name\":\"DetectSyntax\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectSyntaxRequest\"},\
      \"output\":{\"shape\":\"DetectSyntaxResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects text for syntax and the part of speech of words in the document. For more information, <a>how-syntax</a>.</p>\"\
    },\
    \"ListDocumentClassificationJobs\":{\
      \"name\":\"ListDocumentClassificationJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListDocumentClassificationJobsRequest\"},\
      \"output\":{\"shape\":\"ListDocumentClassificationJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the documentation classification jobs that you have submitted.</p>\"\
    },\
    \"ListDocumentClassifiers\":{\
      \"name\":\"ListDocumentClassifiers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListDocumentClassifiersRequest\"},\
      \"output\":{\"shape\":\"ListDocumentClassifiersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the document classifiers that you have created.</p>\"\
    },\
    \"ListDominantLanguageDetectionJobs\":{\
      \"name\":\"ListDominantLanguageDetectionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListDominantLanguageDetectionJobsRequest\"},\
      \"output\":{\"shape\":\"ListDominantLanguageDetectionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the dominant language detection jobs that you have submitted.</p>\"\
    },\
    \"ListEndpoints\":{\
      \"name\":\"ListEndpoints\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListEndpointsRequest\"},\
      \"output\":{\"shape\":\"ListEndpointsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of all existing endpoints that you've created.</p>\"\
    },\
    \"ListEntitiesDetectionJobs\":{\
      \"name\":\"ListEntitiesDetectionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListEntitiesDetectionJobsRequest\"},\
      \"output\":{\"shape\":\"ListEntitiesDetectionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the entity detection jobs that you have submitted.</p>\"\
    },\
    \"ListEntityRecognizers\":{\
      \"name\":\"ListEntityRecognizers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListEntityRecognizersRequest\"},\
      \"output\":{\"shape\":\"ListEntityRecognizersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the properties of all entity recognizers that you created, including recognizers currently in training. Allows you to filter the list of recognizers based on criteria such as status and submission time. This call returns up to 500 entity recognizers in the list, with a default number of 100 recognizers in the list.</p> <p>The results of this list are not in any particular order. Please get the list and sort locally if needed.</p>\"\
    },\
    \"ListKeyPhrasesDetectionJobs\":{\
      \"name\":\"ListKeyPhrasesDetectionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListKeyPhrasesDetectionJobsRequest\"},\
      \"output\":{\"shape\":\"ListKeyPhrasesDetectionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Get a list of key phrase detection jobs that you have submitted.</p>\"\
    },\
    \"ListPiiEntitiesDetectionJobs\":{\
      \"name\":\"ListPiiEntitiesDetectionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListPiiEntitiesDetectionJobsRequest\"},\
      \"output\":{\"shape\":\"ListPiiEntitiesDetectionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the PII entity detection jobs that you have submitted.</p>\"\
    },\
    \"ListSentimentDetectionJobs\":{\
      \"name\":\"ListSentimentDetectionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListSentimentDetectionJobsRequest\"},\
      \"output\":{\"shape\":\"ListSentimentDetectionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of sentiment detection jobs that you have submitted.</p>\"\
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
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Lists all tags associated with a given Amazon Comprehend resource. </p>\"\
    },\
    \"ListTopicsDetectionJobs\":{\
      \"name\":\"ListTopicsDetectionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTopicsDetectionJobsRequest\"},\
      \"output\":{\"shape\":\"ListTopicsDetectionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the topic detection jobs that you have submitted.</p>\"\
    },\
    \"StartDocumentClassificationJob\":{\
      \"name\":\"StartDocumentClassificationJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartDocumentClassificationJobRequest\"},\
      \"output\":{\"shape\":\"StartDocumentClassificationJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceUnavailableException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous document classification job. Use the operation to track the progress of the job.</p>\"\
    },\
    \"StartDominantLanguageDetectionJob\":{\
      \"name\":\"StartDominantLanguageDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartDominantLanguageDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StartDominantLanguageDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous dominant language detection job for a collection of documents. Use the operation to track the status of a job.</p>\"\
    },\
    \"StartEntitiesDetectionJob\":{\
      \"name\":\"StartEntitiesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartEntitiesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StartEntitiesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceUnavailableException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous entity detection job for a collection of documents. Use the operation to track the status of a job.</p> <p>This API can be used for either standard entity detection or custom entity recognition. In order to be used for custom entity recognition, the optional <code>EntityRecognizerArn</code> must be used in order to provide access to the recognizer being used to detect the custom entity.</p>\"\
    },\
    \"StartKeyPhrasesDetectionJob\":{\
      \"name\":\"StartKeyPhrasesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartKeyPhrasesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StartKeyPhrasesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous key phrase detection job for a collection of documents. Use the operation to track the status of a job.</p>\"\
    },\
    \"StartPiiEntitiesDetectionJob\":{\
      \"name\":\"StartPiiEntitiesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartPiiEntitiesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StartPiiEntitiesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous PII entity detection job for a collection of documents.</p>\"\
    },\
    \"StartSentimentDetectionJob\":{\
      \"name\":\"StartSentimentDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartSentimentDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StartSentimentDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous sentiment detection job for a collection of documents. use the operation to track the status of a job.</p>\"\
    },\
    \"StartTopicsDetectionJob\":{\
      \"name\":\"StartTopicsDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartTopicsDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StartTopicsDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous topic detection job. Use the <code>DescribeTopicDetectionJob</code> operation to track the status of a job.</p>\"\
    },\
    \"StopDominantLanguageDetectionJob\":{\
      \"name\":\"StopDominantLanguageDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopDominantLanguageDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StopDominantLanguageDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Stops a dominant language detection job in progress.</p> <p>If the job state is <code>IN_PROGRESS</code> the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state; otherwise the job is stopped and put into the <code>STOPPED</code> state.</p> <p>If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state when you call the <code>StopDominantLanguageDetectionJob</code> operation, the operation returns a 400 Internal Request Exception. </p> <p>When a job is stopped, any documents already processed are written to the output location.</p>\"\
    },\
    \"StopEntitiesDetectionJob\":{\
      \"name\":\"StopEntitiesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopEntitiesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StopEntitiesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Stops an entities detection job in progress.</p> <p>If the job state is <code>IN_PROGRESS</code> the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state; otherwise the job is stopped and put into the <code>STOPPED</code> state.</p> <p>If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state when you call the <code>StopDominantLanguageDetectionJob</code> operation, the operation returns a 400 Internal Request Exception. </p> <p>When a job is stopped, any documents already processed are written to the output location.</p>\"\
    },\
    \"StopKeyPhrasesDetectionJob\":{\
      \"name\":\"StopKeyPhrasesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopKeyPhrasesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StopKeyPhrasesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Stops a key phrases detection job in progress.</p> <p>If the job state is <code>IN_PROGRESS</code> the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state; otherwise the job is stopped and put into the <code>STOPPED</code> state.</p> <p>If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state when you call the <code>StopDominantLanguageDetectionJob</code> operation, the operation returns a 400 Internal Request Exception. </p> <p>When a job is stopped, any documents already processed are written to the output location.</p>\"\
    },\
    \"StopPiiEntitiesDetectionJob\":{\
      \"name\":\"StopPiiEntitiesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopPiiEntitiesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StopPiiEntitiesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Stops a PII entities detection job in progress.</p>\"\
    },\
    \"StopSentimentDetectionJob\":{\
      \"name\":\"StopSentimentDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopSentimentDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StopSentimentDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Stops a sentiment detection job in progress.</p> <p>If the job state is <code>IN_PROGRESS</code> the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state; otherwise the job is be stopped and put into the <code>STOPPED</code> state.</p> <p>If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state when you call the <code>StopDominantLanguageDetectionJob</code> operation, the operation returns a 400 Internal Request Exception. </p> <p>When a job is stopped, any documents already processed are written to the output location.</p>\"\
    },\
    \"StopTrainingDocumentClassifier\":{\
      \"name\":\"StopTrainingDocumentClassifier\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopTrainingDocumentClassifierRequest\"},\
      \"output\":{\"shape\":\"StopTrainingDocumentClassifierResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Stops a document classifier training job while in progress.</p> <p>If the training job state is <code>TRAINING</code>, the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the training job completes before it can be stopped, it is put into the <code>TRAINED</code>; otherwise the training job is stopped and put into the <code>STOPPED</code> state and the service sends back an HTTP 200 response with an empty HTTP body. </p>\"\
    },\
    \"StopTrainingEntityRecognizer\":{\
      \"name\":\"StopTrainingEntityRecognizer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopTrainingEntityRecognizerRequest\"},\
      \"output\":{\"shape\":\"StopTrainingEntityRecognizerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Stops an entity recognizer training job while in progress.</p> <p>If the training job state is <code>TRAINING</code>, the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the training job completes before it can be stopped, it is put into the <code>TRAINED</code>; otherwise the training job is stopped and putted into the <code>STOPPED</code> state and the service sends back an HTTP 200 response with an empty HTTP body.</p>\"\
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
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ConcurrentModificationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Associates a specific tag with an Amazon Comprehend resource. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department. </p>\"\
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
        {\"shape\":\"TooManyTagKeysException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ConcurrentModificationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Removes a specific tag associated with an Amazon Comprehend resource. </p>\"\
    },\
    \"UpdateEndpoint\":{\
      \"name\":\"UpdateEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateEndpointRequest\"},\
      \"output\":{\"shape\":\"UpdateEndpointResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceUnavailableException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Updates information about the specified endpoint.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AnyLengthString\":{\"type\":\"string\"},\
    \"BatchDetectDominantLanguageItemResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of the document in the input list.</p>\"\
        },\
        \"Languages\":{\
          \"shape\":\"ListOfDominantLanguages\",\
          \"documentation\":\"<p>One or more <a>DominantLanguage</a> objects describing the dominant languages in the document.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>\"\
    },\
    \"BatchDetectDominantLanguageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TextList\"],\
      \"members\":{\
        \"TextList\":{\
          \"shape\":\"CustomerInputStringList\",\
          \"documentation\":\"<p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document should contain at least 20 characters and must contain fewer than 5,000 bytes of UTF-8 encoded characters.</p>\"\
        }\
      }\
    },\
    \"BatchDetectDominantLanguageResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResultList\",\
        \"ErrorList\"\
      ],\
      \"members\":{\
        \"ResultList\":{\
          \"shape\":\"ListOfDetectDominantLanguageResult\",\
          \"documentation\":\"<p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>\"\
        },\
        \"ErrorList\":{\
          \"shape\":\"BatchItemErrorList\",\
          \"documentation\":\"<p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"BatchDetectEntitiesItemResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of the document in the input list.</p>\"\
        },\
        \"Entities\":{\
          \"shape\":\"ListOfEntities\",\
          \"documentation\":\"<p>One or more <a>Entity</a> objects, one for each entity detected in the document.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>\"\
    },\
    \"BatchDetectEntitiesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TextList\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"TextList\":{\
          \"shape\":\"CustomerInputStringList\",\
          \"documentation\":\"<p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer than 5,000 bytes of UTF-8 encoded characters.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>\"\
        }\
      }\
    },\
    \"BatchDetectEntitiesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResultList\",\
        \"ErrorList\"\
      ],\
      \"members\":{\
        \"ResultList\":{\
          \"shape\":\"ListOfDetectEntitiesResult\",\
          \"documentation\":\"<p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>\"\
        },\
        \"ErrorList\":{\
          \"shape\":\"BatchItemErrorList\",\
          \"documentation\":\"<p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"BatchDetectKeyPhrasesItemResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of the document in the input list.</p>\"\
        },\
        \"KeyPhrases\":{\
          \"shape\":\"ListOfKeyPhrases\",\
          \"documentation\":\"<p>One or more <a>KeyPhrase</a> objects, one for each key phrase detected in the document.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>\"\
    },\
    \"BatchDetectKeyPhrasesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TextList\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"TextList\":{\
          \"shape\":\"CustomerInputStringList\",\
          \"documentation\":\"<p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>\"\
        }\
      }\
    },\
    \"BatchDetectKeyPhrasesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResultList\",\
        \"ErrorList\"\
      ],\
      \"members\":{\
        \"ResultList\":{\
          \"shape\":\"ListOfDetectKeyPhrasesResult\",\
          \"documentation\":\"<p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>\"\
        },\
        \"ErrorList\":{\
          \"shape\":\"BatchItemErrorList\",\
          \"documentation\":\"<p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"BatchDetectSentimentItemResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of the document in the input list.</p>\"\
        },\
        \"Sentiment\":{\
          \"shape\":\"SentimentType\",\
          \"documentation\":\"<p>The sentiment detected in the document.</p>\"\
        },\
        \"SentimentScore\":{\
          \"shape\":\"SentimentScore\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of its sentiment detection.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>\"\
    },\
    \"BatchDetectSentimentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TextList\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"TextList\":{\
          \"shape\":\"CustomerInputStringList\",\
          \"documentation\":\"<p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>\"\
        }\
      }\
    },\
    \"BatchDetectSentimentResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResultList\",\
        \"ErrorList\"\
      ],\
      \"members\":{\
        \"ResultList\":{\
          \"shape\":\"ListOfDetectSentimentResult\",\
          \"documentation\":\"<p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>\"\
        },\
        \"ErrorList\":{\
          \"shape\":\"BatchItemErrorList\",\
          \"documentation\":\"<p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"BatchDetectSyntaxItemResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of the document in the input list.</p>\"\
        },\
        \"SyntaxTokens\":{\
          \"shape\":\"ListOfSyntaxTokens\",\
          \"documentation\":\"<p>The syntax tokens for the words in the document, one token for each word.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The result of calling the operation. The operation returns one object that is successfully processed by the operation.</p>\"\
    },\
    \"BatchDetectSyntaxRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TextList\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"TextList\":{\
          \"shape\":\"CustomerInputStringList\",\
          \"documentation\":\"<p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"SyntaxLanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the following languages supported by Amazon Comprehend: German (\\\"de\\\"), English (\\\"en\\\"), Spanish (\\\"es\\\"), French (\\\"fr\\\"), Italian (\\\"it\\\"), or Portuguese (\\\"pt\\\"). All documents must be in the same language.</p>\"\
        }\
      }\
    },\
    \"BatchDetectSyntaxResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResultList\",\
        \"ErrorList\"\
      ],\
      \"members\":{\
        \"ResultList\":{\
          \"shape\":\"ListOfDetectSyntaxResult\",\
          \"documentation\":\"<p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>\"\
        },\
        \"ErrorList\":{\
          \"shape\":\"BatchItemErrorList\",\
          \"documentation\":\"<p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"BatchItemError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of the document in the input list.</p>\"\
        },\
        \"ErrorCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The numeric error code of the error.</p>\"\
        },\
        \"ErrorMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A text description of the error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an error that occurred while processing a document in a batch. The operation returns on <code>BatchItemError</code> object for each document that contained an error.</p>\"\
    },\
    \"BatchItemErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchItemError\"}\
    },\
    \"BatchSizeLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The number of documents in the request exceeds the limit of 25. Try your request again with fewer documents.</p>\",\
      \"exception\":true\
    },\
    \"ClassifierEvaluationMetrics\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Accuracy\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The fraction of the labels that were correct recognized. It is computed by dividing the number of labels in the test documents that were correctly recognized by the total number of labels in the test documents.</p>\"\
        },\
        \"Precision\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of the usefulness of the classifier results in the test data. High precision means that the classifier returned substantially more relevant results than irrelevant ones.</p>\"\
        },\
        \"Recall\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of how complete the classifier results are for the test data. High recall means that the classifier returned most of the relevant results. </p>\"\
        },\
        \"F1Score\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of how accurate the classifier results are for the test data. It is derived from the <code>Precision</code> and <code>Recall</code> values. The <code>F1Score</code> is the harmonic average of the two scores. The highest score is 1, and the worst score is 0. </p>\"\
        },\
        \"MicroPrecision\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of the usefulness of the recognizer results in the test data. High precision means that the recognizer returned substantially more relevant results than irrelevant ones. Unlike the Precision metric which comes from averaging the precision of all available labels, this is based on the overall score of all precision scores added together.</p>\"\
        },\
        \"MicroRecall\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of how complete the classifier results are for the test data. High recall means that the classifier returned most of the relevant results. Specifically, this indicates how many of the correct categories in the text that the model can predict. It is a percentage of correct categories in the text that can found. Instead of averaging the recall scores of all labels (as with Recall), micro Recall is based on the overall score of all recall scores added together.</p>\"\
        },\
        \"MicroF1Score\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of how accurate the classifier results are for the test data. It is a combination of the <code>Micro Precision</code> and <code>Micro Recall</code> values. The <code>Micro F1Score</code> is the harmonic mean of the two scores. The highest score is 1, and the worst score is 0.</p>\"\
        },\
        \"HammingLoss\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>Indicates the fraction of labels that are incorrectly predicted. Also seen as the fraction of wrong labels compared to the total number of labels. Scores closer to zero are better.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the result metrics for the test data associated with an documentation classifier.</p>\"\
    },\
    \"ClassifierMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NumberOfLabels\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of labels in the input data. </p>\"\
        },\
        \"NumberOfTrainedDocuments\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of documents in the input data that were used to train the classifier. Typically this is 80 to 90 percent of the input documents.</p>\"\
        },\
        \"NumberOfTestDocuments\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of documents in the input data that were used to test the classifier. Typically this is 10 to 20 percent of the input documents, up to 10,000 documents.</p>\"\
        },\
        \"EvaluationMetrics\":{\
          \"shape\":\"ClassifierEvaluationMetrics\",\
          \"documentation\":\"<p> Describes the result metrics for the test data associated with an documentation classifier.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a document classifier.</p>\",\
      \"sensitive\":true\
    },\
    \"ClassifyDocumentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Text\",\
        \"EndpointArn\"\
      ],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"CustomerInputString\",\
          \"documentation\":\"<p>The document text to be analyzed.</p>\"\
        },\
        \"EndpointArn\":{\
          \"shape\":\"DocumentClassifierEndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the endpoint.</p>\"\
        }\
      }\
    },\
    \"ClassifyDocumentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Classes\":{\
          \"shape\":\"ListOfClasses\",\
          \"documentation\":\"<p>The classes used by the document being analyzed. These are used for multi-class trained models. Individual classes are mutually exclusive and each document is expected to have only a single class assigned to it. For example, an animal can be a dog or a cat, but not both at the same time. </p>\"\
        },\
        \"Labels\":{\
          \"shape\":\"ListOfLabels\",\
          \"documentation\":\"<p>The labels used the document being analyzed. These are used for multi-label trained models. Individual labels represent different categories that are related in some manner and are not multually exclusive. For example, a movie can be just an action movie, or it can be an action movie, a science fiction movie, and a comedy, all at the same time. </p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"ClientRequestTokenString\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9-]+$\"\
    },\
    \"ComprehendArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws(-[^:]+)?:comprehend:[a-zA-Z0-9-]*:[0-9]{12}:[a-zA-Z0-9-]{1,64}/[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"ComprehendArnName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$\"\
    },\
    \"ComprehendEndpointArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws(-[^:]+)?:comprehend:[a-zA-Z0-9-]*:[0-9]{12}:(document-classifier-endpoint|entity-recognizer-endpoint)/[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"ComprehendEndpointName\":{\
      \"type\":\"string\",\
      \"max\":40,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$\"\
    },\
    \"ComprehendModelArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws(-[^:]+)?:comprehend:[a-zA-Z0-9-]*:[0-9]{12}:(document-classifier|entity-recognizer)/[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"ConcurrentModificationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Concurrent modification of the tags associated with an Amazon Comprehend resource is not supported. </p>\",\
      \"exception\":true\
    },\
    \"CreateDocumentClassifierRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DocumentClassifierName\",\
        \"DataAccessRoleArn\",\
        \"InputDataConfig\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"DocumentClassifierName\":{\
          \"shape\":\"ComprehendArnName\",\
          \"documentation\":\"<p>The name of the document classifier.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags to be associated with the document classifier being created. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department. </p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"DocumentClassifierInputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data for the job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"DocumentClassifierOutputDataConfig\",\
          \"documentation\":\"<p>Enables the addition of output results configuration parameters for custom classifier jobs.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the following languages supported by Amazon Comprehend: German (\\\"de\\\"), English (\\\"en\\\"), Spanish (\\\"es\\\"), French (\\\"fr\\\"), Italian (\\\"it\\\"), or Portuguese (\\\"pt\\\"). All documents must be in the same language.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your custom classifier. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        },\
        \"Mode\":{\
          \"shape\":\"DocumentClassifierMode\",\
          \"documentation\":\"<p>Indicates the mode in which the classifier will be trained. The classifier can be trained in multi-class mode, which identifies one and only one class for each document, or multi-label mode, which identifies one or more labels for each document. In multi-label mode, multiple labels for an individual document are separated by a delimiter. The default delimiter between labels is a pipe (|).</p>\"\
        }\
      }\
    },\
    \"CreateDocumentClassifierResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentClassifierArn\":{\
          \"shape\":\"DocumentClassifierArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the document classifier.</p>\"\
        }\
      }\
    },\
    \"CreateEndpointRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EndpointName\",\
        \"ModelArn\",\
        \"DesiredInferenceUnits\"\
      ],\
      \"members\":{\
        \"EndpointName\":{\
          \"shape\":\"ComprehendEndpointName\",\
          \"documentation\":\"<p>This is the descriptive suffix that becomes part of the <code>EndpointArn</code> used for all subsequent requests to this resource. </p>\"\
        },\
        \"ModelArn\":{\
          \"shape\":\"ComprehendModelArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the model to which the endpoint will be attached.</p>\"\
        },\
        \"DesiredInferenceUnits\":{\
          \"shape\":\"InferenceUnitsInteger\",\
          \"documentation\":\"<p> The desired number of inference units to be used by the model using this endpoint. Each inference unit represents of a throughput of 100 characters per second.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>An idempotency token provided by the customer. If this token matches a previous endpoint creation request, Amazon Comprehend will not return a <code>ResourceInUseException</code>. </p>\",\
          \"idempotencyToken\":true\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags associated with the endpoint being created. A tag is a key-value pair that adds metadata to the endpoint. For example, a tag with \\\"Sales\\\" as the key might be added to an endpoint to indicate its use by the sales department. </p>\"\
        }\
      }\
    },\
    \"CreateEndpointResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"ComprehendEndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the endpoint being created.</p>\"\
        }\
      }\
    },\
    \"CreateEntityRecognizerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RecognizerName\",\
        \"DataAccessRoleArn\",\
        \"InputDataConfig\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"RecognizerName\":{\
          \"shape\":\"ComprehendArnName\",\
          \"documentation\":\"<p>The name given to the newly created recognizer. Recognizer names can be a maximum of 256 characters. Alphanumeric characters, hyphens (-) and underscores (_) are allowed. The name must be unique in the account/region.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags to be associated with the entity recognizer being created. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department. </p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"EntityRecognizerInputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data. The S3 bucket containing the input data must be located in the same region as the entity recognizer being created. </p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p> A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p> You can specify any of the following languages supported by Amazon Comprehend: English (\\\"en\\\"), Spanish (\\\"es\\\"), French (\\\"fr\\\"), Italian (\\\"it\\\"), German (\\\"de\\\"), or Portuguese (\\\"pt\\\"). All documents must be in the same language.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your custom entity recognizer. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      }\
    },\
    \"CreateEntityRecognizerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EntityRecognizerArn\":{\
          \"shape\":\"EntityRecognizerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the entity recognizer.</p>\"\
        }\
      }\
    },\
    \"CustomerInputString\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"sensitive\":true\
    },\
    \"CustomerInputStringList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CustomerInputString\"},\
      \"sensitive\":true\
    },\
    \"DeleteDocumentClassifierRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DocumentClassifierArn\"],\
      \"members\":{\
        \"DocumentClassifierArn\":{\
          \"shape\":\"DocumentClassifierArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the document classifier. </p>\"\
        }\
      }\
    },\
    \"DeleteDocumentClassifierResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteEndpointRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointArn\"],\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"ComprehendEndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the endpoint being deleted.</p>\"\
        }\
      }\
    },\
    \"DeleteEndpointResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteEntityRecognizerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EntityRecognizerArn\"],\
      \"members\":{\
        \"EntityRecognizerArn\":{\
          \"shape\":\"EntityRecognizerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the entity recognizer.</p>\"\
        }\
      }\
    },\
    \"DeleteEntityRecognizerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeDocumentClassificationJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>\"\
        }\
      }\
    },\
    \"DescribeDocumentClassificationJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentClassificationJobProperties\":{\
          \"shape\":\"DocumentClassificationJobProperties\",\
          \"documentation\":\"<p>An object that describes the properties associated with the document classification job.</p>\"\
        }\
      }\
    },\
    \"DescribeDocumentClassifierRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DocumentClassifierArn\"],\
      \"members\":{\
        \"DocumentClassifierArn\":{\
          \"shape\":\"DocumentClassifierArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the document classifier. The operation returns this identifier in its response.</p>\"\
        }\
      }\
    },\
    \"DescribeDocumentClassifierResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentClassifierProperties\":{\
          \"shape\":\"DocumentClassifierProperties\",\
          \"documentation\":\"<p>An object that contains the properties associated with a document classifier.</p>\"\
        }\
      }\
    },\
    \"DescribeDominantLanguageDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>\"\
        }\
      }\
    },\
    \"DescribeDominantLanguageDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DominantLanguageDetectionJobProperties\":{\
          \"shape\":\"DominantLanguageDetectionJobProperties\",\
          \"documentation\":\"<p>An object that contains the properties associated with a dominant language detection job.</p>\"\
        }\
      }\
    },\
    \"DescribeEndpointRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointArn\"],\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"ComprehendEndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the endpoint being described.</p>\"\
        }\
      }\
    },\
    \"DescribeEndpointResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EndpointProperties\":{\
          \"shape\":\"EndpointProperties\",\
          \"documentation\":\"<p>Describes information associated with the specific endpoint.</p>\"\
        }\
      }\
    },\
    \"DescribeEntitiesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>\"\
        }\
      }\
    },\
    \"DescribeEntitiesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EntitiesDetectionJobProperties\":{\
          \"shape\":\"EntitiesDetectionJobProperties\",\
          \"documentation\":\"<p>An object that contains the properties associated with an entities detection job.</p>\"\
        }\
      }\
    },\
    \"DescribeEntityRecognizerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EntityRecognizerArn\"],\
      \"members\":{\
        \"EntityRecognizerArn\":{\
          \"shape\":\"EntityRecognizerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the entity recognizer.</p>\"\
        }\
      }\
    },\
    \"DescribeEntityRecognizerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EntityRecognizerProperties\":{\
          \"shape\":\"EntityRecognizerProperties\",\
          \"documentation\":\"<p>Describes information associated with an entity recognizer.</p>\"\
        }\
      }\
    },\
    \"DescribeKeyPhrasesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>\"\
        }\
      }\
    },\
    \"DescribeKeyPhrasesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyPhrasesDetectionJobProperties\":{\
          \"shape\":\"KeyPhrasesDetectionJobProperties\",\
          \"documentation\":\"<p>An object that contains the properties associated with a key phrases detection job. </p>\"\
        }\
      }\
    },\
    \"DescribePiiEntitiesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>\"\
        }\
      }\
    },\
    \"DescribePiiEntitiesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PiiEntitiesDetectionJobProperties\":{\"shape\":\"PiiEntitiesDetectionJobProperties\"}\
      }\
    },\
    \"DescribeSentimentDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>\"\
        }\
      }\
    },\
    \"DescribeSentimentDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SentimentDetectionJobProperties\":{\
          \"shape\":\"SentimentDetectionJobProperties\",\
          \"documentation\":\"<p>An object that contains the properties associated with a sentiment detection job.</p>\"\
        }\
      }\
    },\
    \"DescribeTopicsDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned by the user to the detection job.</p>\"\
        }\
      }\
    },\
    \"DescribeTopicsDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TopicsDetectionJobProperties\":{\
          \"shape\":\"TopicsDetectionJobProperties\",\
          \"documentation\":\"<p>The list of properties for the requested job.</p>\"\
        }\
      }\
    },\
    \"DetectDominantLanguageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Text\"],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"CustomerInputString\",\
          \"documentation\":\"<p>A UTF-8 text string. Each string should contain at least 20 characters and must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>\"\
        }\
      }\
    },\
    \"DetectDominantLanguageResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Languages\":{\
          \"shape\":\"ListOfDominantLanguages\",\
          \"documentation\":\"<p>The languages that Amazon Comprehend detected in the input text. For each language, the response returns the RFC 5646 language code and the level of confidence that Amazon Comprehend has in the accuracy of its inference. For more information about RFC 5646, see <a href=\\\"https://tools.ietf.org/html/rfc5646\\\">Tags for Identifying Languages</a> on the <i>IETF Tools</i> web site.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"DetectEntitiesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Text\"],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"CustomerInputString\",\
          \"documentation\":\"<p>A UTF-8 text string. Each string must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p> <p>If your request includes the endpoint for a custom entity recognition model, Amazon Comprehend uses the language of your custom model, and it ignores any language code that you specify here.</p>\"\
        },\
        \"EndpointArn\":{\
          \"shape\":\"EntityRecognizerEndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Name of an endpoint that is associated with a custom entity recognition model. Provide an endpoint if you want to detect entities by using your own custom model instead of the default model that is used by Amazon Comprehend.</p> <p>If you specify an endpoint, Amazon Comprehend uses the language of your custom model, and it ignores any language code that you provide in your request.</p>\"\
        }\
      }\
    },\
    \"DetectEntitiesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Entities\":{\
          \"shape\":\"ListOfEntities\",\
          \"documentation\":\"<p>A collection of entities identified in the input text. For each entity, the response provides the entity text, entity type, where the entity text begins and ends, and the level of confidence that Amazon Comprehend has in the detection. </p> <p>If your request uses a custom entity recognition model, Amazon Comprehend detects the entities that the model is trained to recognize. Otherwise, it detects the default entity types. For a list of default entity types, see <a>how-entities</a>.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"DetectKeyPhrasesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Text\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"CustomerInputString\",\
          \"documentation\":\"<p>A UTF-8 text string. Each string must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>\"\
        }\
      }\
    },\
    \"DetectKeyPhrasesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyPhrases\":{\
          \"shape\":\"ListOfKeyPhrases\",\
          \"documentation\":\"<p>A collection of key phrases that Amazon Comprehend identified in the input text. For each key phrase, the response provides the text of the key phrase, where the key phrase begins and ends, and the level of confidence that Amazon Comprehend has in the accuracy of the detection. </p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"DetectPiiEntitiesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Text\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A UTF-8 text string. Each string must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents.</p>\"\
        }\
      }\
    },\
    \"DetectPiiEntitiesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Entities\":{\
          \"shape\":\"ListOfPiiEntities\",\
          \"documentation\":\"<p>A collection of PII entities identified in the input text. For each entity, the response provides the entity type, where the entity text begins and ends, and the level of confidence that Amazon Comprehend has in the detection.</p>\"\
        }\
      }\
    },\
    \"DetectSentimentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Text\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"CustomerInputString\",\
          \"documentation\":\"<p>A UTF-8 text string. Each string must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>\"\
        }\
      }\
    },\
    \"DetectSentimentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Sentiment\":{\
          \"shape\":\"SentimentType\",\
          \"documentation\":\"<p>The inferred sentiment that Amazon Comprehend has the highest level of confidence in.</p>\"\
        },\
        \"SentimentScore\":{\
          \"shape\":\"SentimentScore\",\
          \"documentation\":\"<p>An object that lists the sentiments, and their corresponding confidence levels.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"DetectSyntaxRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Text\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"CustomerInputString\",\
          \"documentation\":\"<p>A UTF-8 string. Each string must contain fewer that 5,000 bytes of UTF encoded characters.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"SyntaxLanguageCode\",\
          \"documentation\":\"<p>The language code of the input documents. You can specify any of the following languages supported by Amazon Comprehend: German (\\\"de\\\"), English (\\\"en\\\"), Spanish (\\\"es\\\"), French (\\\"fr\\\"), Italian (\\\"it\\\"), or Portuguese (\\\"pt\\\").</p>\"\
        }\
      }\
    },\
    \"DetectSyntaxResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SyntaxTokens\":{\
          \"shape\":\"ListOfSyntaxTokens\",\
          \"documentation\":\"<p>A collection of syntax tokens describing the text. For each token, the response provides the text, the token type, where the text begins and ends, and the level of confidence that Amazon Comprehend has that the token is correct. For a list of token types, see <a>how-syntax</a>.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"DocumentClass\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the class.</p>\"\
        },\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The confidence score that Amazon Comprehend has this class correctly attributed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the class that categorizes the document being analyzed</p>\"\
    },\
    \"DocumentClassificationJobFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>Filters on the name of the job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Filters the list based on job status. Returns only jobs with the specified status.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of document classification jobs. For more information, see the operation. You can provide only one filter parameter in each request.</p>\"\
    },\
    \"DocumentClassificationJobProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned to the document classification job.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The name that you assigned to the document classification job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the document classification job. If the status is <code>FAILED</code>, the <code>Message</code> field shows the reason for the failure.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>A description of the status of the job.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the document classification job was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the document classification job completed.</p>\"\
        },\
        \"DocumentClassifierArn\":{\
          \"shape\":\"DocumentClassifierArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the document classifier. </p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input data configuration that you supplied when you created the document classification job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>The output data configuration that you supplied when you created the document classification job.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your document classification job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a document classification job.</p>\"\
    },\
    \"DocumentClassificationJobPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DocumentClassificationJobProperties\"}\
    },\
    \"DocumentClassifierArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws(-[^:]+)?:comprehend:[a-zA-Z0-9-]*:[0-9]{12}:document-classifier/[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"DocumentClassifierEndpointArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws(-[^:]+)?:comprehend:[a-zA-Z0-9-]*:[0-9]{12}:document-classifier-endpoint/[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"DocumentClassifierFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>Filters the list of classifiers based on status. </p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of classifiers based on the time that the classifier was submitted for processing. Returns only classifiers submitted before the specified time. Classifiers are returned in ascending order, oldest to newest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of classifiers based on the time that the classifier was submitted for processing. Returns only classifiers submitted after the specified time. Classifiers are returned in descending order, newest to oldest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of document classifiers. You can only specify one filtering parameter in a request. For more information, see the operation.</p>\"\
    },\
    \"DocumentClassifierInputDataConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3Uri\"],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The Amazon S3 URI for the input data. The S3 bucket must be in the same region as the API endpoint that you are calling. The URI can point to a single input file or it can provide the prefix for a collection of input files.</p> <p>For example, if you use the URI <code>S3://bucketName/prefix</code>, if the prefix is a single file, Amazon Comprehend uses that file as input. If more than one file begins with the prefix, Amazon Comprehend uses all of them as input.</p>\"\
        },\
        \"LabelDelimiter\":{\
          \"shape\":\"LabelDelimiter\",\
          \"documentation\":\"<p>Indicates the delimiter used to separate each label for training a multi-label classifier. The default delimiter between labels is a pipe (|). You can use a different character as a delimiter (if it's an allowed character) by specifying it under Delimiter for labels. If the training documents use a delimiter other than the default or the delimiter you specify, the labels on that line will be combined to make a single unique label, such as LABELLABELLABEL.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input properties for training a document classifier. </p> <p>For more information on how the input file is formatted, see <a>how-document-classification-training-data</a>. </p>\"\
    },\
    \"DocumentClassifierMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"MULTI_CLASS\",\
        \"MULTI_LABEL\"\
      ]\
    },\
    \"DocumentClassifierOutputDataConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>When you use the <code>OutputDataConfig</code> object while creating a custom classifier, you specify the Amazon S3 location where you want to write the confusion matrix. The URI must be in the same region as the API endpoint that you are calling. The location is used as the prefix for the actual location of this output file.</p> <p>When the custom classifier job is finished, the service creates the output file in a directory specific to the job. The <code>S3Uri</code> field contains the location of the output file, called <code>output.tar.gz</code>. It is a compressed archive that contains the confusion matrix.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt the output results from an analysis job. The KmsKeyId can be one of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>KMS Key Alias: <code>\\\"alias/ExampleAlias\\\"</code> </p> </li> <li> <p>ARN of a KMS Key Alias: <code>\\\"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias\\\"</code> </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Provides output results configuration parameters for custom classifier jobs. </p>\"\
    },\
    \"DocumentClassifierProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentClassifierArn\":{\
          \"shape\":\"DocumentClassifierArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the document classifier.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the language of the documents that the classifier was trained on.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>The status of the document classifier. If the status is <code>TRAINED</code> the classifier is ready to use. If the status is <code>FAILED</code> you can see additional information about why the classifier wasn't trained in the <code>Message</code> field.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>Additional information about the status of the classifier.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the document classifier was submitted for training.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that training the document classifier completed.</p>\"\
        },\
        \"TrainingStartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Indicates the time when the training starts on documentation classifiers. You are billed for the time interval between this time and the value of TrainingEndTime. </p>\"\
        },\
        \"TrainingEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that training of the document classifier was completed. Indicates the time when the training completes on documentation classifiers. You are billed for the time interval between this time and the value of TrainingStartTime.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"DocumentClassifierInputDataConfig\",\
          \"documentation\":\"<p>The input data configuration that you supplied when you created the document classifier for training.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"DocumentClassifierOutputDataConfig\",\
          \"documentation\":\"<p> Provides output results configuration parameters for custom classifier jobs.</p>\"\
        },\
        \"ClassifierMetadata\":{\
          \"shape\":\"ClassifierMetadata\",\
          \"documentation\":\"<p>Information about the document classifier, including the number of documents used for training the classifier, the number of documents used for test the classifier, and an accuracy rating.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your custom classifier. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        },\
        \"Mode\":{\
          \"shape\":\"DocumentClassifierMode\",\
          \"documentation\":\"<p>Indicates the mode in which the specific classifier was trained. This also indicates the format of input documents and the format of the confusion matrix. Each classifier can only be trained in one mode and this cannot be changed once the classifier is trained.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a document classifier.</p>\"\
    },\
    \"DocumentClassifierPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DocumentClassifierProperties\"}\
    },\
    \"DocumentLabel\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the label.</p>\"\
        },\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The confidence score that Amazon Comprehend has this label correctly attributed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies one of the label or labels that categorize the document being analyzed.</p>\"\
    },\
    \"DominantLanguage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LanguageCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The RFC 5646 language code for the dominant language. For more information about RFC 5646, see <a href=\\\"https://tools.ietf.org/html/rfc5646\\\">Tags for Identifying Languages</a> on the <i>IETF Tools</i> web site.</p>\"\
        },\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Returns the code for the dominant language in the input text and the level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>\"\
    },\
    \"DominantLanguageDetectionJobFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>Filters on the name of the job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of dominant language detection jobs. For more information, see the operation.</p>\"\
    },\
    \"DominantLanguageDetectionJobProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned to the dominant language detection job.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The name that you assigned to the dominant language detection job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the dominant language detection job. If the status is <code>FAILED</code>, the <code>Message</code> field shows the reason for the failure.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>A description for the status of a job.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the dominant language detection job was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the dominant language detection job completed.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input data configuration that you supplied when you created the dominant language detection job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>The output data configuration that you supplied when you created the dominant language detection job.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your dominant language detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a dominant language detection job.</p>\"\
    },\
    \"DominantLanguageDetectionJobPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DominantLanguageDetectionJobProperties\"}\
    },\
    \"Double\":{\"type\":\"double\"},\
    \"EndpointFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ModelArn\":{\
          \"shape\":\"ComprehendModelArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the model to which the endpoint is attached.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"EndpointStatus\",\
          \"documentation\":\"<p>Specifies the status of the endpoint being returned. Possible values are: Creating, Ready, Updating, Deleting, Failed.</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Specifies a date before which the returned endpoint or endpoints were created.</p>\"\
        },\
        \"CreationTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Specifies a date after which the returned endpoint or endpoints were created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The filter used to determine which endpoints are are returned. You can filter jobs on their name, model, status, or the date and time that they were created. You can only set one filter at a time. </p>\"\
    },\
    \"EndpointProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"ComprehendEndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the endpoint.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"EndpointStatus\",\
          \"documentation\":\"<p>Specifies the status of the endpoint. Because the endpoint updates and creation are asynchronous, so customers will need to wait for the endpoint to be <code>Ready</code> status before making inference requests.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>Specifies a reason for failure in cases of <code>Failed</code> status.</p>\"\
        },\
        \"ModelArn\":{\
          \"shape\":\"ComprehendModelArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the model to which the endpoint is attached.</p>\"\
        },\
        \"DesiredInferenceUnits\":{\
          \"shape\":\"InferenceUnitsInteger\",\
          \"documentation\":\"<p>The desired number of inference units to be used by the model using this endpoint. Each inference unit represents of a throughput of 100 characters per second.</p>\"\
        },\
        \"CurrentInferenceUnits\":{\
          \"shape\":\"InferenceUnitsInteger\",\
          \"documentation\":\"<p>The number of inference units currently used by the model using this endpoint.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation date and time of the endpoint.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the endpoint was last modified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies information about the specified endpoint.</p>\"\
    },\
    \"EndpointPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EndpointProperties\"}\
    },\
    \"EndpointStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATING\",\
        \"DELETING\",\
        \"FAILED\",\
        \"IN_SERVICE\",\
        \"UPDATING\"\
      ]\
    },\
    \"EntitiesDetectionJobFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>Filters on the name of the job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of dominant language detection jobs. For more information, see the operation.</p>\"\
    },\
    \"EntitiesDetectionJobProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned to the entities detection job.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The name that you assigned the entities detection job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the entities detection job. If the status is <code>FAILED</code>, the <code>Message</code> field shows the reason for the failure.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>A description of the status of a job.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the entities detection job was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the entities detection job completed</p>\"\
        },\
        \"EntityRecognizerArn\":{\
          \"shape\":\"EntityRecognizerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the entity recognizer.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input data configuration that you supplied when you created the entities detection job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>The output data configuration that you supplied when you created the entities detection job. </p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the input documents.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your entity detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about an entities detection job.</p>\"\
    },\
    \"EntitiesDetectionJobPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EntitiesDetectionJobProperties\"}\
    },\
    \"Entity\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"EntityType\",\
          \"documentation\":\"<p>The entity's type.</p>\"\
        },\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The text of the entity.</p>\"\
        },\
        \"BeginOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>A character offset in the input text that shows where the entity begins (the first character is at position 0). The offset returns the position of each UTF-8 code point in the string. A <i>code point</i> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point.</p>\"\
        },\
        \"EndOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>A character offset in the input text that shows where the entity ends. The offset returns the position of each UTF-8 code point in the string. A <i>code point</i> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about an entity. </p> <p> </p>\"\
    },\
    \"EntityRecognizerAnnotations\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3Uri\"],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p> Specifies the Amazon S3 location where the annotations for an entity recognizer are located. The URI must be in the same region as the API endpoint that you are calling.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the annotations associated with a entity recognizer.</p>\"\
    },\
    \"EntityRecognizerArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws(-[^:]+)?:comprehend:[a-zA-Z0-9-]*:[0-9]{12}:entity-recognizer/[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"EntityRecognizerDocuments\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3Uri\"],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p> Specifies the Amazon S3 location where the training documents for an entity recognizer are located. The URI must be in the same region as the API endpoint that you are calling.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the training documents submitted with an entity recognizer.</p>\"\
    },\
    \"EntityRecognizerEndpointArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws(-[^:]+)?:comprehend:[a-zA-Z0-9-]*:[0-9]{12}:entity-recognizer-endpoint/[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"EntityRecognizerEntityList\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3Uri\"],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>Specifies the Amazon S3 location where the entity list is located. The URI must be in the same region as the API endpoint that you are calling.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the entity recognizer submitted with an entity recognizer.</p>\"\
    },\
    \"EntityRecognizerEvaluationMetrics\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Precision\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of the usefulness of the recognizer results in the test data. High precision means that the recognizer returned substantially more relevant results than irrelevant ones. </p>\"\
        },\
        \"Recall\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of how complete the recognizer results are for the test data. High recall means that the recognizer returned most of the relevant results.</p>\"\
        },\
        \"F1Score\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of how accurate the recognizer results are for the test data. It is derived from the <code>Precision</code> and <code>Recall</code> values. The <code>F1Score</code> is the harmonic average of the two scores. The highest score is 1, and the worst score is 0. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Detailed information about the accuracy of an entity recognizer. </p>\"\
    },\
    \"EntityRecognizerFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>The status of an entity recognizer.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of entities based on the time that the list was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of entities based on the time that the list was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of entity recognizers. You can only specify one filtering parameter in a request. For more information, see the operation./&gt;</p>\"\
    },\
    \"EntityRecognizerInputDataConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EntityTypes\",\
        \"Documents\"\
      ],\
      \"members\":{\
        \"EntityTypes\":{\
          \"shape\":\"EntityTypesList\",\
          \"documentation\":\"<p>The entity types in the input data for an entity recognizer. A maximum of 25 entity types can be used at one time to train an entity recognizer.</p>\"\
        },\
        \"Documents\":{\
          \"shape\":\"EntityRecognizerDocuments\",\
          \"documentation\":\"<p>S3 location of the documents folder for an entity recognizer</p>\"\
        },\
        \"Annotations\":{\
          \"shape\":\"EntityRecognizerAnnotations\",\
          \"documentation\":\"<p>S3 location of the annotations file for an entity recognizer.</p>\"\
        },\
        \"EntityList\":{\
          \"shape\":\"EntityRecognizerEntityList\",\
          \"documentation\":\"<p>S3 location of the entity list for an entity recognizer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the format and location of the input data.</p>\"\
    },\
    \"EntityRecognizerMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NumberOfTrainedDocuments\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p> The number of documents in the input data that were used to train the entity recognizer. Typically this is 80 to 90 percent of the input documents.</p>\"\
        },\
        \"NumberOfTestDocuments\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p> The number of documents in the input data that were used to test the entity recognizer. Typically this is 10 to 20 percent of the input documents.</p>\"\
        },\
        \"EvaluationMetrics\":{\
          \"shape\":\"EntityRecognizerEvaluationMetrics\",\
          \"documentation\":\"<p>Detailed information about the accuracy of an entity recognizer.</p>\"\
        },\
        \"EntityTypes\":{\
          \"shape\":\"EntityRecognizerMetadataEntityTypesList\",\
          \"documentation\":\"<p>Entity types from the metadata of an entity recognizer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Detailed information about an entity recognizer.</p>\",\
      \"sensitive\":true\
    },\
    \"EntityRecognizerMetadataEntityTypesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EntityRecognizerMetadataEntityTypesListItem\"}\
    },\
    \"EntityRecognizerMetadataEntityTypesListItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>Type of entity from the list of entity types in the metadata of an entity recognizer. </p>\"\
        },\
        \"EvaluationMetrics\":{\
          \"shape\":\"EntityTypesEvaluationMetrics\",\
          \"documentation\":\"<p>Detailed information about the accuracy of the entity recognizer for a specific item on the list of entity types. </p>\"\
        },\
        \"NumberOfTrainMentions\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Indicates the number of times the given entity type was seen in the training data. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Individual item from the list of entity types in the metadata of an entity recognizer.</p>\"\
    },\
    \"EntityRecognizerProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EntityRecognizerArn\":{\
          \"shape\":\"EntityRecognizerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the entity recognizer.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p> The language of the input documents. All documents must be in the same language. Only English (\\\"en\\\") is currently supported.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>Provides the status of the entity recognizer.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p> A description of the status of the recognizer.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the recognizer was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the recognizer creation completed.</p>\"\
        },\
        \"TrainingStartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that training of the entity recognizer started.</p>\"\
        },\
        \"TrainingEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that training of the entity recognizer was completed.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"EntityRecognizerInputDataConfig\",\
          \"documentation\":\"<p>The input data properties of an entity recognizer.</p>\"\
        },\
        \"RecognizerMetadata\":{\
          \"shape\":\"EntityRecognizerMetadata\",\
          \"documentation\":\"<p> Provides information about an entity recognizer.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your custom entity recognizer. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes information about an entity recognizer.</p>\"\
    },\
    \"EntityRecognizerPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EntityRecognizerProperties\"}\
    },\
    \"EntityType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PERSON\",\
        \"LOCATION\",\
        \"ORGANIZATION\",\
        \"COMMERCIAL_ITEM\",\
        \"EVENT\",\
        \"DATE\",\
        \"QUANTITY\",\
        \"TITLE\",\
        \"OTHER\"\
      ]\
    },\
    \"EntityTypeName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"pattern\":\"[_A-Z0-9]+\"\
    },\
    \"EntityTypesEvaluationMetrics\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Precision\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of the usefulness of the recognizer results for a specific entity type in the test data. High precision means that the recognizer returned substantially more relevant results than irrelevant ones. </p>\"\
        },\
        \"Recall\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of how complete the recognizer results are for a specific entity type in the test data. High recall means that the recognizer returned most of the relevant results.</p>\"\
        },\
        \"F1Score\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of how accurate the recognizer results are for for a specific entity type in the test data. It is derived from the <code>Precision</code> and <code>Recall</code> values. The <code>F1Score</code> is the harmonic average of the two scores. The highest score is 1, and the worst score is 0. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Detailed information about the accuracy of an entity recognizer for a specific entity type. </p>\"\
    },\
    \"EntityTypesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EntityTypesListItem\"}\
    },\
    \"EntityTypesListItem\":{\
      \"type\":\"structure\",\
      \"required\":[\"Type\"],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"EntityTypeName\",\
          \"documentation\":\"<p>Entity type of an item on an entity type list.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an individual item on a list of entity types.</p>\"\
    },\
    \"Float\":{\"type\":\"float\"},\
    \"IamRoleArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20,\
      \"pattern\":\"arn:aws(-[^:]+)?:iam::[0-9]{12}:role/.+\"\
    },\
    \"InferenceUnitsInteger\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"InputDataConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3Uri\"],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The Amazon S3 URI for the input data. The URI must be in same region as the API endpoint that you are calling. The URI can point to a single input file or it can provide the prefix for a collection of data files. </p> <p>For example, if you use the URI <code>S3://bucketName/prefix</code>, if the prefix is a single file, Amazon Comprehend uses that file as input. If more than one file begins with the prefix, Amazon Comprehend uses all of them as input.</p>\"\
        },\
        \"InputFormat\":{\
          \"shape\":\"InputFormat\",\
          \"documentation\":\"<p>Specifies how the text in an input file should be processed:</p> <ul> <li> <p> <code>ONE_DOC_PER_FILE</code> - Each file is considered a separate document. Use this option when you are processing large documents, such as newspaper articles or scientific papers.</p> </li> <li> <p> <code>ONE_DOC_PER_LINE</code> - Each line in a file is considered a separate document. Use this option when you are processing many short documents, such as text messages.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>The input properties for a topic detection job.</p>\"\
    },\
    \"InputFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ONE_DOC_PER_FILE\",\
        \"ONE_DOC_PER_LINE\"\
      ]\
    },\
    \"Integer\":{\"type\":\"integer\"},\
    \"InternalServerException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>An internal server error occurred. Retry your request.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidFilterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The filter specified for the operation is invalid. Specify a different filter.</p>\",\
      \"exception\":true\
    },\
    \"InvalidRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The request is invalid.</p>\",\
      \"exception\":true\
    },\
    \"JobId\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-%@]*)$\"\
    },\
    \"JobName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-%@]*)$\"\
    },\
    \"JobNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The specified job was not found. Check the job ID and try again.</p>\",\
      \"exception\":true\
    },\
    \"JobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SUBMITTED\",\
        \"IN_PROGRESS\",\
        \"COMPLETED\",\
        \"FAILED\",\
        \"STOP_REQUESTED\",\
        \"STOPPED\"\
      ]\
    },\
    \"KeyPhrase\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>\"\
        },\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The text of a key noun phrase.</p>\"\
        },\
        \"BeginOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>A character offset in the input text that shows where the key phrase begins (the first character is at position 0). The offset returns the position of each UTF-8 code point in the string. A <i>code point</i> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point.</p>\"\
        },\
        \"EndOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>A character offset in the input text where the key phrase ends. The offset returns the position of each UTF-8 code point in the string. A <code>code point</code> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a key noun phrase.</p>\"\
    },\
    \"KeyPhrasesDetectionJobFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>Filters on the name of the job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of dominant language detection jobs. For more information, see the operation.</p>\"\
    },\
    \"KeyPhrasesDetectionJobProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned to the key phrases detection job.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The name that you assigned the key phrases detection job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the key phrases detection job. If the status is <code>FAILED</code>, the <code>Message</code> field shows the reason for the failure.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>A description of the status of a job.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the key phrases detection job was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the key phrases detection job completed.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input data configuration that you supplied when you created the key phrases detection job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>The output data configuration that you supplied when you created the key phrases detection job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the input documents.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your key phrases detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a key phrases detection job.</p>\"\
    },\
    \"KeyPhrasesDetectionJobPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"KeyPhrasesDetectionJobProperties\"}\
    },\
    \"KmsKeyId\":{\
      \"type\":\"string\",\
      \"max\":2048\
    },\
    \"KmsKeyValidationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The KMS customer managed key (CMK) entered cannot be validated. Verify the key and re-enter it.</p>\",\
      \"exception\":true\
    },\
    \"LabelDelimiter\":{\
      \"type\":\"string\",\
      \"max\":1,\
      \"min\":1,\
      \"pattern\":\"^[ ~!@#$%^*\\\\-_+=|\\\\\\\\:;\\\\t>?/]$\"\
    },\
    \"LanguageCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"en\",\
        \"es\",\
        \"fr\",\
        \"de\",\
        \"it\",\
        \"pt\",\
        \"ar\",\
        \"hi\",\
        \"ja\",\
        \"ko\",\
        \"zh\",\
        \"zh-TW\"\
      ]\
    },\
    \"ListDocumentClassificationJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"DocumentClassificationJobFilter\",\
          \"documentation\":\"<p>Filters the jobs that are returned. You can filter jobs on their names, status, or the date and time that they were submitted. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListDocumentClassificationJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentClassificationJobPropertiesList\":{\
          \"shape\":\"DocumentClassificationJobPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListDocumentClassifiersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"DocumentClassifierFilter\",\
          \"documentation\":\"<p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListDocumentClassifiersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentClassifierPropertiesList\":{\
          \"shape\":\"DocumentClassifierPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListDominantLanguageDetectionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"DominantLanguageDetectionJobFilter\",\
          \"documentation\":\"<p>Filters that jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListDominantLanguageDetectionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DominantLanguageDetectionJobPropertiesList\":{\
          \"shape\":\"DominantLanguageDetectionJobPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job that is returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListEndpointsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"EndpointFilter\",\
          \"documentation\":\"<p>Filters the endpoints that are returned. You can filter endpoints on their name, model, status, or the date and time that they were created. You can only set one filter at a time. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListEndpointsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EndpointPropertiesList\":{\
          \"shape\":\"EndpointPropertiesList\",\
          \"documentation\":\"<p>Displays a list of endpoint properties being retrieved by the service in response to the request.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListEntitiesDetectionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"EntitiesDetectionJobFilter\",\
          \"documentation\":\"<p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListEntitiesDetectionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EntitiesDetectionJobPropertiesList\":{\
          \"shape\":\"EntitiesDetectionJobPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job that is returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListEntityRecognizersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"EntityRecognizerFilter\",\
          \"documentation\":\"<p>Filters the list of entities returned. You can filter on <code>Status</code>, <code>SubmitTimeBefore</code>, or <code>SubmitTimeAfter</code>. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p> The maximum number of results to return on each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListEntityRecognizersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EntityRecognizerPropertiesList\":{\
          \"shape\":\"EntityRecognizerPropertiesList\",\
          \"documentation\":\"<p>The list of properties of an entity recognizer.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListKeyPhrasesDetectionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"KeyPhrasesDetectionJobFilter\",\
          \"documentation\":\"<p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListKeyPhrasesDetectionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyPhrasesDetectionJobPropertiesList\":{\
          \"shape\":\"KeyPhrasesDetectionJobPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job that is returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListOfClasses\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DocumentClass\"}\
    },\
    \"ListOfDetectDominantLanguageResult\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDetectDominantLanguageItemResult\"}\
    },\
    \"ListOfDetectEntitiesResult\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDetectEntitiesItemResult\"}\
    },\
    \"ListOfDetectKeyPhrasesResult\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDetectKeyPhrasesItemResult\"}\
    },\
    \"ListOfDetectSentimentResult\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDetectSentimentItemResult\"}\
    },\
    \"ListOfDetectSyntaxResult\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDetectSyntaxItemResult\"}\
    },\
    \"ListOfDominantLanguages\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DominantLanguage\"}\
    },\
    \"ListOfEntities\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Entity\"}\
    },\
    \"ListOfKeyPhrases\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"KeyPhrase\"}\
    },\
    \"ListOfLabels\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DocumentLabel\"}\
    },\
    \"ListOfPiiEntities\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PiiEntity\"}\
    },\
    \"ListOfPiiEntityTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PiiEntityType\"}\
    },\
    \"ListOfSyntaxTokens\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SyntaxToken\"}\
    },\
    \"ListPiiEntitiesDetectionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"PiiEntitiesDetectionJobFilter\",\
          \"documentation\":\"<p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page.</p>\"\
        }\
      }\
    },\
    \"ListPiiEntitiesDetectionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PiiEntitiesDetectionJobPropertiesList\":{\
          \"shape\":\"PiiEntitiesDetectionJobPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job that is returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListSentimentDetectionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"SentimentDetectionJobFilter\",\
          \"documentation\":\"<p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListSentimentDetectionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SentimentDetectionJobPropertiesList\":{\
          \"shape\":\"SentimentDetectionJobPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job that is returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the given Amazon Comprehend resource you are querying. </p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the given Amazon Comprehend resource you are querying.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags associated with the Amazon Comprehend resource being queried. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department. </p>\"\
        }\
      }\
    },\
    \"ListTopicsDetectionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"TopicsDetectionJobFilter\",\
          \"documentation\":\"<p>Filters the jobs that are returned. Jobs can be filtered on their name, status, or the date and time that they were submitted. You can set only one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListTopicsDetectionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TopicsDetectionJobPropertiesList\":{\
          \"shape\":\"TopicsDetectionJobPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job that is returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"MaskCharacter\":{\
      \"type\":\"string\",\
      \"max\":1,\
      \"min\":1,\
      \"pattern\":\"[!@#$%&*]\"\
    },\
    \"MaxResultsInteger\":{\
      \"type\":\"integer\",\
      \"max\":500,\
      \"min\":1\
    },\
    \"ModelStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SUBMITTED\",\
        \"TRAINING\",\
        \"DELETING\",\
        \"STOP_REQUESTED\",\
        \"STOPPED\",\
        \"IN_ERROR\",\
        \"TRAINED\"\
      ]\
    },\
    \"NumberOfTopicsInteger\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"OutputDataConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3Uri\"],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>When you use the <code>OutputDataConfig</code> object with asynchronous operations, you specify the Amazon S3 location where you want to write the output data. The URI must be in the same region as the API endpoint that you are calling. The location is used as the prefix for the actual location of the output file.</p> <p>When the topic detection job is finished, the service creates an output file in a directory specific to the job. The <code>S3Uri</code> field contains the location of the output file, called <code>output.tar.gz</code>. It is a compressed archive that contains the ouput of the operation.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt the output results from an analysis job. The KmsKeyId can be one of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>KMS Key Alias: <code>\\\"alias/ExampleAlias\\\"</code> </p> </li> <li> <p>ARN of a KMS Key Alias: <code>\\\"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias\\\"</code> </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Provides configuration parameters for the output of topic detection jobs.</p> <p/>\"\
    },\
    \"PartOfSpeechTag\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tag\":{\
          \"shape\":\"PartOfSpeechTagType\",\
          \"documentation\":\"<p>Identifies the part of speech that the token represents.</p>\"\
        },\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The confidence that Amazon Comprehend has that the part of speech was correctly identified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies the part of speech represented by the token and gives the confidence that Amazon Comprehend has that the part of speech was correctly identified. For more information about the parts of speech that Amazon Comprehend can identify, see <a>how-syntax</a>.</p>\"\
    },\
    \"PartOfSpeechTagType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ADJ\",\
        \"ADP\",\
        \"ADV\",\
        \"AUX\",\
        \"CONJ\",\
        \"CCONJ\",\
        \"DET\",\
        \"INTJ\",\
        \"NOUN\",\
        \"NUM\",\
        \"O\",\
        \"PART\",\
        \"PRON\",\
        \"PROPN\",\
        \"PUNCT\",\
        \"SCONJ\",\
        \"SYM\",\
        \"VERB\"\
      ]\
    },\
    \"PiiEntitiesDetectionJobFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>Filters on the name of the job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of PII entity detection jobs.</p>\"\
    },\
    \"PiiEntitiesDetectionJobProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned to the PII entities detection job.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The name that you assigned the PII entities detection job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the PII entities detection job. If the status is <code>FAILED</code>, the <code>Message</code> field shows the reason for the failure.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>A description of the status of a job.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the PII entities detection job was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the PII entities detection job completed.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input properties for a PII entities detection job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"PiiOutputDataConfig\",\
          \"documentation\":\"<p>The output data configuration that you supplied when you created the PII entities detection job.</p>\"\
        },\
        \"RedactionConfig\":{\
          \"shape\":\"RedactionConfig\",\
          \"documentation\":\"<p>Provides configuration parameters for PII entity redaction.</p> <p>This parameter is required if you set the <code>Mode</code> parameter to <code>ONLY_REDACTION</code>. In that case, you must provide a <code>RedactionConfig</code> definition that includes the <code>PiiEntityTypes</code> parameter.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the input documents</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"Mode\":{\
          \"shape\":\"PiiEntitiesDetectionMode\",\
          \"documentation\":\"<p>Specifies whether the output provides the locations (offsets) of PII entities or a file in which PII entities are redacted.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a PII entities detection job.</p>\"\
    },\
    \"PiiEntitiesDetectionJobPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PiiEntitiesDetectionJobProperties\"}\
    },\
    \"PiiEntitiesDetectionMaskMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"MASK\",\
        \"REPLACE_WITH_PII_ENTITY_TYPE\"\
      ]\
    },\
    \"PiiEntitiesDetectionMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ONLY_REDACTION\",\
        \"ONLY_OFFSETS\"\
      ]\
    },\
    \"PiiEntity\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"PiiEntityType\",\
          \"documentation\":\"<p>The entity's type.</p>\"\
        },\
        \"BeginOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>A character offset in the input text that shows where the PII entity begins (the first character is at position 0). The offset returns the position of each UTF-8 code point in the string. A <i>code point</i> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point.</p>\"\
        },\
        \"EndOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>A character offset in the input text that shows where the PII entity ends. The offset returns the position of each UTF-8 code point in the string. A <i>code point</i> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a PII entity.</p>\"\
    },\
    \"PiiEntityType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"BANK_ACCOUNT_NUMBER\",\
        \"BANK_ROUTING\",\
        \"CREDIT_DEBIT_NUMBER\",\
        \"CREDIT_DEBIT_CVV\",\
        \"CREDIT_DEBIT_EXPIRY\",\
        \"PIN\",\
        \"EMAIL\",\
        \"ADDRESS\",\
        \"NAME\",\
        \"PHONE\",\
        \"SSN\",\
        \"DATE_TIME\",\
        \"PASSPORT_NUMBER\",\
        \"DRIVER_ID\",\
        \"URL\",\
        \"AGE\",\
        \"USERNAME\",\
        \"PASSWORD\",\
        \"AWS_ACCESS_KEY\",\
        \"AWS_SECRET_KEY\",\
        \"IP_ADDRESS\",\
        \"MAC_ADDRESS\",\
        \"ALL\"\
      ]\
    },\
    \"PiiOutputDataConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3Uri\"],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>When you use the <code>PiiOutputDataConfig</code> object with asynchronous operations, you specify the Amazon S3 location where you want to write the output data. </p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt the output results from an analysis job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides configuration parameters for the output of PII entity detection jobs.</p>\"\
    },\
    \"RedactionConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PiiEntityTypes\":{\
          \"shape\":\"ListOfPiiEntityTypes\",\
          \"documentation\":\"<p>An array of the types of PII entities that Amazon Comprehend detects in the input text for your request.</p>\"\
        },\
        \"MaskMode\":{\
          \"shape\":\"PiiEntitiesDetectionMaskMode\",\
          \"documentation\":\"<p>Specifies whether the PII entity is redacted with the mask character or the entity type.</p>\"\
        },\
        \"MaskCharacter\":{\
          \"shape\":\"MaskCharacter\",\
          \"documentation\":\"<p>A character that replaces each character in the redacted PII entity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides configuration parameters for PII entity redaction.</p>\"\
    },\
    \"ResourceInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The specified resource name is already in use. Use a different name and try your request again.</p>\",\
      \"exception\":true\
    },\
    \"ResourceLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The maximum number of resources per account has been exceeded. Review the resources, and then try your request again.</p>\",\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The specified resource ARN was not found. Check the ARN and try your request again.</p>\",\
      \"exception\":true\
    },\
    \"ResourceUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The specified resource is not available. Check the resource and try your request again.</p>\",\
      \"exception\":true\
    },\
    \"S3Uri\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"s3://[a-z0-9][\\\\.\\\\-a-z0-9]{1,61}[a-z0-9](/.*)?\"\
    },\
    \"SecurityGroupId\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1,\
      \"pattern\":\"[-0-9a-zA-Z]+\"\
    },\
    \"SecurityGroupIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityGroupId\"},\
      \"max\":5,\
      \"min\":1\
    },\
    \"SentimentDetectionJobFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>Filters on the name of the job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of dominant language detection jobs. For more information, see the operation.</p>\"\
    },\
    \"SentimentDetectionJobProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned to the sentiment detection job.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The name that you assigned to the sentiment detection job</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the sentiment detection job. If the status is <code>FAILED</code>, the <code>Messages</code> field shows the reason for the failure.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>A description of the status of a job.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the sentiment detection job was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the sentiment detection job ended.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input data configuration that you supplied when you created the sentiment detection job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>The output data configuration that you supplied when you created the sentiment detection job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the input documents.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your sentiment detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a sentiment detection job.</p>\"\
    },\
    \"SentimentDetectionJobPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SentimentDetectionJobProperties\"}\
    },\
    \"SentimentScore\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Positive\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>POSITIVE</code> sentiment.</p>\"\
        },\
        \"Negative\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>NEGATIVE</code> sentiment.</p>\"\
        },\
        \"Neutral\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>NEUTRAL</code> sentiment.</p>\"\
        },\
        \"Mixed\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>MIXED</code> sentiment.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the level of confidence that Amazon Comprehend has in the accuracy of its detection of sentiments.</p>\"\
    },\
    \"SentimentType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"POSITIVE\",\
        \"NEGATIVE\",\
        \"NEUTRAL\",\
        \"MIXED\"\
      ]\
    },\
    \"StartDocumentClassificationJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DocumentClassifierArn\",\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"DataAccessRoleArn\"\
      ],\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The identifier of the job.</p>\"\
        },\
        \"DocumentClassifierArn\":{\
          \"shape\":\"DocumentClassifierArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the document classifier to use to process the job.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data for the job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Specifies where to send the output files.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you do not set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your document classification job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      }\
    },\
    \"StartDocumentClassificationJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier generated for the job. To get the status of the job, use this identifier with the operation.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the job:</p> <ul> <li> <p>SUBMITTED - The job has been received and queued for processing.</p> </li> <li> <p>IN_PROGRESS - Amazon Comprehend is processing the job.</p> </li> <li> <p>COMPLETED - The job was successfully completed and the output is available.</p> </li> <li> <p>FAILED - The job did not complete. For details, use the operation.</p> </li> <li> <p>STOP_REQUESTED - Amazon Comprehend has received a stop request for the job and is processing the request.</p> </li> <li> <p>STOPPED - The job was successfully stopped without completing.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"StartDominantLanguageDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"DataAccessRoleArn\"\
      ],\
      \"members\":{\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data for the job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Specifies where to send the output files.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions\\\">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>An identifier for the job.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you do not set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your dominant language detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      }\
    },\
    \"StartDominantLanguageDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier generated for the job. To get the status of a job, use this identifier with the operation.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the job. </p> <ul> <li> <p>SUBMITTED - The job has been received and is queued for processing.</p> </li> <li> <p>IN_PROGRESS - Amazon Comprehend is processing the job.</p> </li> <li> <p>COMPLETED - The job was successfully completed and the output is available.</p> </li> <li> <p>FAILED - The job did not complete. To get details, use the operation.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"StartEntitiesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"DataAccessRoleArn\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data for the job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Specifies where to send the output files.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions\\\">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The identifier of the job.</p>\"\
        },\
        \"EntityRecognizerArn\":{\
          \"shape\":\"EntityRecognizerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the specific entity recognizer to be used by the <code>StartEntitiesDetectionJob</code>. This ARN is optional and is only used for a custom entity recognition job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. All documents must be in the same language. You can specify any of the languages supported by Amazon Comprehend. If custom entities recognition is used, this parameter is ignored and the language used for training the model is used instead.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your entity detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      }\
    },\
    \"StartEntitiesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier generated for the job. To get the status of job, use this identifier with the operation.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the job. </p> <ul> <li> <p>SUBMITTED - The job has been received and is queued for processing.</p> </li> <li> <p>IN_PROGRESS - Amazon Comprehend is processing the job.</p> </li> <li> <p>COMPLETED - The job was successfully completed and the output is available.</p> </li> <li> <p>FAILED - The job did not complete. To get details, use the operation.</p> </li> <li> <p>STOP_REQUESTED - Amazon Comprehend has received a stop request for the job and is processing the request.</p> </li> <li> <p>STOPPED - The job was successfully stopped without completing.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"StartKeyPhrasesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"DataAccessRoleArn\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data for the job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Specifies where to send the output files.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions\\\">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The identifier of the job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p> Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your key phrases detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      }\
    },\
    \"StartKeyPhrasesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier generated for the job. To get the status of a job, use this identifier with the operation.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the job. </p> <ul> <li> <p>SUBMITTED - The job has been received and is queued for processing.</p> </li> <li> <p>IN_PROGRESS - Amazon Comprehend is processing the job.</p> </li> <li> <p>COMPLETED - The job was successfully completed and the output is available.</p> </li> <li> <p>FAILED - The job did not complete. To get details, use the operation.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"StartPiiEntitiesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"Mode\",\
        \"DataAccessRoleArn\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input properties for a PII entities detection job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Provides conï¬guration parameters for the output of PII entity detection jobs.</p>\"\
        },\
        \"Mode\":{\
          \"shape\":\"PiiEntitiesDetectionMode\",\
          \"documentation\":\"<p>Specifies whether the output provides the locations (offsets) of PII entities or a file in which PII entities are redacted.</p>\"\
        },\
        \"RedactionConfig\":{\
          \"shape\":\"RedactionConfig\",\
          \"documentation\":\"<p>Provides configuration parameters for PII entity redaction.</p> <p>This parameter is required if you set the <code>Mode</code> parameter to <code>ONLY_REDACTION</code>. In that case, you must provide a <code>RedactionConfig</code> definition that includes the <code>PiiEntityTypes</code> parameter.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The identifier of the job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"StartPiiEntitiesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier generated for the job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the job.</p>\"\
        }\
      }\
    },\
    \"StartSentimentDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"DataAccessRoleArn\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data for the job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Specifies where to send the output files. </p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions\\\">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The identifier of the job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your sentiment detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      }\
    },\
    \"StartSentimentDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier generated for the job. To get the status of a job, use this identifier with the operation.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the job. </p> <ul> <li> <p>SUBMITTED - The job has been received and is queued for processing.</p> </li> <li> <p>IN_PROGRESS - Amazon Comprehend is processing the job.</p> </li> <li> <p>COMPLETED - The job was successfully completed and the output is available.</p> </li> <li> <p>FAILED - The job did not complete. To get details, use the operation.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"StartTopicsDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"DataAccessRoleArn\"\
      ],\
      \"members\":{\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data for the job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Specifies where to send the output files. The output is a compressed archive with two files, <code>topic-terms.csv</code> that lists the terms associated with each topic, and <code>doc-topics.csv</code> that lists the documents associated with each topic</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions\\\">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The identifier of the job.</p>\"\
        },\
        \"NumberOfTopics\":{\
          \"shape\":\"NumberOfTopicsInteger\",\
          \"documentation\":\"<p>The number of topics to detect.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you do not set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your topic detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      }\
    },\
    \"StartTopicsDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier generated for the job. To get the status of the job, use this identifier with the <code>DescribeTopicDetectionJob</code> operation.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the job: </p> <ul> <li> <p>SUBMITTED - The job has been received and is queued for processing.</p> </li> <li> <p>IN_PROGRESS - Amazon Comprehend is processing the job.</p> </li> <li> <p>COMPLETED - The job was successfully completed and the output is available.</p> </li> <li> <p>FAILED - The job did not complete. To get details, use the <code>DescribeTopicDetectionJob</code> operation.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"StopDominantLanguageDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the dominant language detection job to stop.</p>\"\
        }\
      }\
    },\
    \"StopDominantLanguageDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the dominant language detection job to stop.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Either <code>STOP_REQUESTED</code> if the job is currently running, or <code>STOPPED</code> if the job was previously stopped with the <code>StopDominantLanguageDetectionJob</code> operation.</p>\"\
        }\
      }\
    },\
    \"StopEntitiesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the entities detection job to stop.</p>\"\
        }\
      }\
    },\
    \"StopEntitiesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the entities detection job to stop.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Either <code>STOP_REQUESTED</code> if the job is currently running, or <code>STOPPED</code> if the job was previously stopped with the <code>StopEntitiesDetectionJob</code> operation.</p>\"\
        }\
      }\
    },\
    \"StopKeyPhrasesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the key phrases detection job to stop.</p>\"\
        }\
      }\
    },\
    \"StopKeyPhrasesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the key phrases detection job to stop.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Either <code>STOP_REQUESTED</code> if the job is currently running, or <code>STOPPED</code> if the job was previously stopped with the <code>StopKeyPhrasesDetectionJob</code> operation.</p>\"\
        }\
      }\
    },\
    \"StopPiiEntitiesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the PII entities detection job to stop.</p>\"\
        }\
      }\
    },\
    \"StopPiiEntitiesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the PII entities detection job to stop.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the PII entities detection job.</p>\"\
        }\
      }\
    },\
    \"StopSentimentDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the sentiment detection job to stop.</p>\"\
        }\
      }\
    },\
    \"StopSentimentDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the sentiment detection job to stop.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Either <code>STOP_REQUESTED</code> if the job is currently running, or <code>STOPPED</code> if the job was previously stopped with the <code>StopSentimentDetectionJob</code> operation.</p>\"\
        }\
      }\
    },\
    \"StopTrainingDocumentClassifierRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DocumentClassifierArn\"],\
      \"members\":{\
        \"DocumentClassifierArn\":{\
          \"shape\":\"DocumentClassifierArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the document classifier currently being trained.</p>\"\
        }\
      }\
    },\
    \"StopTrainingDocumentClassifierResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"StopTrainingEntityRecognizerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EntityRecognizerArn\"],\
      \"members\":{\
        \"EntityRecognizerArn\":{\
          \"shape\":\"EntityRecognizerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the entity recognizer currently being trained.</p>\"\
        }\
      }\
    },\
    \"StopTrainingEntityRecognizerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"String\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"SubnetId\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1,\
      \"pattern\":\"[-0-9a-zA-Z]+\"\
    },\
    \"Subnets\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubnetId\"},\
      \"max\":16,\
      \"min\":1\
    },\
    \"SyntaxLanguageCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"en\",\
        \"es\",\
        \"fr\",\
        \"de\",\
        \"it\",\
        \"pt\"\
      ]\
    },\
    \"SyntaxToken\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TokenId\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>A unique identifier for a token.</p>\"\
        },\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The word that was recognized in the source text.</p>\"\
        },\
        \"BeginOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based offset from the beginning of the source text to the first character in the word.</p>\"\
        },\
        \"EndOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based offset from the beginning of the source text to the last character in the word.</p>\"\
        },\
        \"PartOfSpeech\":{\
          \"shape\":\"PartOfSpeechTag\",\
          \"documentation\":\"<p>Provides the part of speech label and the confidence level that Amazon Comprehend has that the part of speech was correctly identified. For more information, see <a>how-syntax</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a work in the input text that was recognized and assigned a part of speech. There is one syntax token record for each word in the source text.</p>\"\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\"Key\"],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The initial part of a key-value pair that forms a tag associated with a given resource. For instance, if you want to show which resources are used by which departments, you might use âDepartmentâ as the key portion of the pair, with multiple possible values such as âsales,â âlegal,â and âadministration.â </p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p> The second part of a key-value pair that forms a tag associated with a given resource. For instance, if you want to show which resources are used by which departments, you might use âDepartmentâ as the initial (key) portion of the pair, with a value of âsalesâ to indicate the sales department. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with the key-value pair âDepartmentâ:âSalesâ might be added to a resource to indicate its use by a particular department. </p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"}\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"}\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the given Amazon Comprehend resource to which you want to associate the tags. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags being associated with a specific Amazon Comprehend resource. There can be a maximum of 50 tags (both existing and pending) associated with a specific resource. </p>\"\
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
      \"min\":0\
    },\
    \"TextSizeLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The size of the input text exceeds the limit. Use a smaller document.</p>\",\
      \"exception\":true\
    },\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"TooManyRequestsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The number of requests exceeds the limit. Resubmit your request later.</p>\",\
      \"exception\":true\
    },\
    \"TooManyTagKeysException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The request contains more tag keys than can be associated with a resource (50 tag keys per resource).</p>\",\
      \"exception\":true\
    },\
    \"TooManyTagsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The request contains more tags than can be associated with a resource (50 tags per resource). The maximum number of tags includes both existing tags and those included in your current request. </p>\",\
      \"exception\":true\
    },\
    \"TopicsDetectionJobFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p/>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Filters the list of topic detection jobs based on job status. Returns only jobs with the specified status.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Only returns jobs submitted before the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Only returns jobs submitted after the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering topic detection jobs. For more information, see .</p>\"\
    },\
    \"TopicsDetectionJobProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned to the topic detection job.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The name of the topic detection job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the topic detection job. If the status is <code>Failed</code>, the reason for the failure is shown in the <code>Message</code> field.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>A description for the status of a job.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the topic detection job was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the topic detection job was completed.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input data configuration supplied when you created the topic detection job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>The output data configuration supplied when you created the topic detection job.</p>\"\
        },\
        \"NumberOfTopics\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of topics to detect supplied when you created the topic detection job. The default is 10. </p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that grants Amazon Comprehend read access to your job data. </p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your topic detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a topic detection job.</p>\"\
    },\
    \"TopicsDetectionJobPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TopicsDetectionJobProperties\"}\
    },\
    \"UnsupportedLanguageException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Amazon Comprehend can't process the language of the input text. For all custom entity recognition APIs (such as <code>CreateEntityRecognizer</code>), only English, Spanish, French, Italian, German, or Portuguese are accepted. For most other APIs, such as those for Custom Classification, Amazon Comprehend accepts text in all supported languages. For a list of supported languages, see <a>supported-languages</a>. </p>\",\
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
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the given Amazon Comprehend resource from which you want to remove the tags. </p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The initial part of a key-value pair that forms a tag being removed from a given resource. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department. Keys must be unique and cannot be duplicated for a particular resource. </p>\"\
        }\
      }\
    },\
    \"UntagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateEndpointRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EndpointArn\",\
        \"DesiredInferenceUnits\"\
      ],\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"ComprehendEndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the endpoint being updated.</p>\"\
        },\
        \"DesiredInferenceUnits\":{\
          \"shape\":\"InferenceUnitsInteger\",\
          \"documentation\":\"<p> The desired number of inference units to be used by the model using this endpoint. Each inference unit represents of a throughput of 100 characters per second.</p>\"\
        }\
      }\
    },\
    \"UpdateEndpointResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"VpcConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SecurityGroupIds\",\
        \"Subnets\"\
      ],\
      \"members\":{\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIds\",\
          \"documentation\":\"<p>The ID number for a security group on an instance of your private VPC. Security groups on your VPC function serve as a virtual firewall to control inbound and outbound traffic and provides security for the resources that youâll be accessing on the VPC. This ID number is preceded by \\\"sg-\\\", for instance: \\\"sg-03b388029b0a285ea\\\". For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html\\\">Security Groups for your VPC</a>. </p>\"\
        },\
        \"Subnets\":{\
          \"shape\":\"Subnets\",\
          \"documentation\":\"<p>The ID for each subnet being used in your private VPC. This subnet is a subset of the a range of IPv4 addresses used by the VPC and is specific to a given availability zone in the VPCâs region. This ID number is preceded by \\\"subnet-\\\", for instance: \\\"subnet-04ccf456919e69055\\\". For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html\\\">VPCs and Subnets</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for the job. For For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
    }\
  },\
  \"documentation\":\"<p>Amazon Comprehend is an AWS service for gaining insight into the content of documents. Use these actions to determine the topics contained in your documents, the topics they discuss, the predominant sentiment expressed in them, the predominant language used, and more.</p>\"\
}\
";
}

@end
