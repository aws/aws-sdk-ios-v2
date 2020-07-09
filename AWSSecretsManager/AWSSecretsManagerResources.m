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

#import "AWSSecretsManagerResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSSecretsManagerResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSSecretsManagerResources

+ (instancetype)sharedInstance {
    static AWSSecretsManagerResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSSecretsManagerResources new];
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
    \"apiVersion\":\"2017-10-17\",\
    \"endpointPrefix\":\"secretsmanager\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"AWS Secrets Manager\",\
    \"serviceId\":\"Secrets Manager\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"secretsmanager\",\
    \"targetPrefix\":\"secretsmanager\",\
    \"uid\":\"secretsmanager-2017-10-17\"\
  },\
  \"operations\":{\
    \"CancelRotateSecret\":{\
      \"name\":\"CancelRotateSecret\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelRotateSecretRequest\"},\
      \"output\":{\"shape\":\"CancelRotateSecretResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceError\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Disables automatic scheduled rotation and cancels the rotation of a secret if currently in progress.</p> <p>To re-enable scheduled rotation, call <a>RotateSecret</a> with <code>AutomaticallyRotateAfterDays</code> set to a value greater than 0. This immediately rotates your secret and then enables the automatic schedule.</p> <note> <p>If you cancel a rotation while in progress, it can leave the <code>VersionStage</code> labels in an unexpected state. Depending on the step of the rotation in progress, you might need to remove the staging label <code>AWSPENDING</code> from the partially created version, specified by the <code>VersionId</code> response value. You should also evaluate the partially rotated new version to see if it should be deleted, which you can do by removing all staging labels from the new version <code>VersionStage</code> field.</p> </note> <p>To successfully start a rotation, the staging label <code>AWSPENDING</code> must be in one of the following states:</p> <ul> <li> <p>Not attached to any version at all</p> </li> <li> <p>Attached to the same version as the staging label <code>AWSCURRENT</code> </p> </li> </ul> <p>If the staging label <code>AWSPENDING</code> attached to a different version than the version with <code>AWSCURRENT</code> then the attempt to rotate fails.</p> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:CancelRotateSecret</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p>To configure rotation for a secret or to manually trigger a rotation, use <a>RotateSecret</a>.</p> </li> <li> <p>To get the rotation configuration details for a secret, use <a>DescribeSecret</a>.</p> </li> <li> <p>To list all of the currently available secrets, use <a>ListSecrets</a>.</p> </li> <li> <p>To list all of the versions currently associated with a secret, use <a>ListSecretVersionIds</a>.</p> </li> </ul>\"\
    },\
    \"CreateSecret\":{\
      \"name\":\"CreateSecret\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateSecretRequest\"},\
      \"output\":{\"shape\":\"CreateSecretResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"EncryptionFailure\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"MalformedPolicyDocumentException\"},\
        {\"shape\":\"InternalServiceError\"},\
        {\"shape\":\"PreconditionNotMetException\"}\
      ],\
      \"documentation\":\"<p>Creates a new secret. A secret in Secrets Manager consists of both the protected secret data and the important information needed to manage the secret.</p> <p>Secrets Manager stores the encrypted secret data in one of a collection of \\\"versions\\\" associated with the secret. Each version contains a copy of the encrypted secret data. Each version is associated with one or more \\\"staging labels\\\" that identify where the version is in the rotation cycle. The <code>SecretVersionsToStages</code> field of the secret contains the mapping of staging labels to the active versions of the secret. Versions without a staging label are considered deprecated and not included in the list.</p> <p>You provide the secret data to be encrypted by putting text in either the <code>SecretString</code> parameter or binary data in the <code>SecretBinary</code> parameter, but not both. If you include <code>SecretString</code> or <code>SecretBinary</code> then Secrets Manager also creates an initial secret version and automatically attaches the staging label <code>AWSCURRENT</code> to the new version.</p> <note> <ul> <li> <p>If you call an operation to encrypt or decrypt the <code>SecretString</code> or <code>SecretBinary</code> for a secret in the same account as the calling user and that secret doesn't specify a AWS KMS encryption key, Secrets Manager uses the account's default AWS managed customer master key (CMK) with the alias <code>aws/secretsmanager</code>. If this key doesn't already exist in your account then Secrets Manager creates it for you automatically. All users and roles in the same AWS account automatically have access to use the default CMK. Note that if an Secrets Manager API call results in AWS creating the account's AWS-managed CMK, it can result in a one-time significant delay in returning the result.</p> </li> <li> <p>If the secret resides in a different AWS account from the credentials calling an API that requires encryption or decryption of the secret value then you must create and use a custom AWS KMS CMK because you can't access the default CMK for the account using credentials from a different AWS account. Store the ARN of the CMK in the secret when you create the secret or when you update it by including it in the <code>KMSKeyId</code>. If you call an API that must encrypt or decrypt <code>SecretString</code> or <code>SecretBinary</code> using credentials from a different account then the AWS KMS key policy must grant cross-account access to that other account's user or role for both the kms:GenerateDataKey and kms:Decrypt operations.</p> </li> </ul> </note> <p> </p> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:CreateSecret</p> </li> <li> <p>kms:GenerateDataKey - needed only if you use a customer-managed AWS KMS key to encrypt the secret. You do not need this permission to use the account default AWS managed CMK for Secrets Manager.</p> </li> <li> <p>kms:Decrypt - needed only if you use a customer-managed AWS KMS key to encrypt the secret. You do not need this permission to use the account default AWS managed CMK for Secrets Manager.</p> </li> <li> <p>secretsmanager:TagResource - needed only if you include the <code>Tags</code> parameter. </p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p>To delete a secret, use <a>DeleteSecret</a>.</p> </li> <li> <p>To modify an existing secret, use <a>UpdateSecret</a>.</p> </li> <li> <p>To create a new version of a secret, use <a>PutSecretValue</a>.</p> </li> <li> <p>To retrieve the encrypted secure string and secure binary values, use <a>GetSecretValue</a>.</p> </li> <li> <p>To retrieve all other details for a secret, use <a>DescribeSecret</a>. This does not include the encrypted secure string and secure binary values.</p> </li> <li> <p>To retrieve the list of secret versions associated with the current secret, use <a>DescribeSecret</a> and examine the <code>SecretVersionsToStages</code> response value.</p> </li> </ul>\"\
    },\
    \"DeleteResourcePolicy\":{\
      \"name\":\"DeleteResourcePolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteResourcePolicyRequest\"},\
      \"output\":{\"shape\":\"DeleteResourcePolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceError\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Deletes the resource-based permission policy attached to the secret.</p> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:DeleteResourcePolicy</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p>To attach a resource policy to a secret, use <a>PutResourcePolicy</a>.</p> </li> <li> <p>To retrieve the current resource-based policy that's attached to a secret, use <a>GetResourcePolicy</a>.</p> </li> <li> <p>To list all of the currently available secrets, use <a>ListSecrets</a>.</p> </li> </ul>\"\
    },\
    \"DeleteSecret\":{\
      \"name\":\"DeleteSecret\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteSecretRequest\"},\
      \"output\":{\"shape\":\"DeleteSecretResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalServiceError\"}\
      ],\
      \"documentation\":\"<p>Deletes an entire secret and all of its versions. You can optionally include a recovery window during which you can restore the secret. If you don't specify a recovery window value, the operation defaults to 30 days. Secrets Manager attaches a <code>DeletionDate</code> stamp to the secret that specifies the end of the recovery window. At the end of the recovery window, Secrets Manager deletes the secret permanently.</p> <p>At any time before recovery window ends, you can use <a>RestoreSecret</a> to remove the <code>DeletionDate</code> and cancel the deletion of the secret.</p> <p>You cannot access the encrypted secret information in any secret that is scheduled for deletion. If you need to access that information, you must cancel the deletion with <a>RestoreSecret</a> and then retrieve the information.</p> <note> <ul> <li> <p>There is no explicit operation to delete a version of a secret. Instead, remove all staging labels from the <code>VersionStage</code> field of a version. That marks the version as deprecated and allows Secrets Manager to delete it as needed. Versions that do not have any staging labels do not show up in <a>ListSecretVersionIds</a> unless you specify <code>IncludeDeprecated</code>.</p> </li> <li> <p>The permanent secret deletion at the end of the waiting period is performed as a background task with low priority. There is no guarantee of a specific time after the recovery window for the actual delete operation to occur.</p> </li> </ul> </note> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:DeleteSecret</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p>To create a secret, use <a>CreateSecret</a>.</p> </li> <li> <p>To cancel deletion of a version of a secret before the recovery window has expired, use <a>RestoreSecret</a>.</p> </li> </ul>\"\
    },\
    \"DescribeSecret\":{\
      \"name\":\"DescribeSecret\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSecretRequest\"},\
      \"output\":{\"shape\":\"DescribeSecretResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceError\"}\
      ],\
      \"documentation\":\"<p>Retrieves the details of a secret. It does not include the encrypted fields. Secrets Manager only returns fields populated with a value in the response. </p> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:DescribeSecret</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p>To create a secret, use <a>CreateSecret</a>.</p> </li> <li> <p>To modify a secret, use <a>UpdateSecret</a>.</p> </li> <li> <p>To retrieve the encrypted secret information in a version of the secret, use <a>GetSecretValue</a>.</p> </li> <li> <p>To list all of the secrets in the AWS account, use <a>ListSecrets</a>.</p> </li> </ul>\"\
    },\
    \"GetRandomPassword\":{\
      \"name\":\"GetRandomPassword\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetRandomPasswordRequest\"},\
      \"output\":{\"shape\":\"GetRandomPasswordResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalServiceError\"}\
      ],\
      \"documentation\":\"<p>Generates a random password of the specified complexity. This operation is intended for use in the Lambda rotation function. Per best practice, we recommend that you specify the maximum length and include every character type that the system you are generating a password for can support.</p> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:GetRandomPassword</p> </li> </ul>\"\
    },\
    \"GetResourcePolicy\":{\
      \"name\":\"GetResourcePolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetResourcePolicyRequest\"},\
      \"output\":{\"shape\":\"GetResourcePolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceError\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the JSON text of the resource-based policy document attached to the specified secret. The JSON request string input and response output displays formatted code with white space and line breaks for better readability. Submit your input as a single line JSON string.</p> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:GetResourcePolicy</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p>To attach a resource policy to a secret, use <a>PutResourcePolicy</a>.</p> </li> <li> <p>To delete the resource-based policy attached to a secret, use <a>DeleteResourcePolicy</a>.</p> </li> <li> <p>To list all of the currently available secrets, use <a>ListSecrets</a>.</p> </li> </ul>\"\
    },\
    \"GetSecretValue\":{\
      \"name\":\"GetSecretValue\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetSecretValueRequest\"},\
      \"output\":{\"shape\":\"GetSecretValueResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"DecryptionFailure\"},\
        {\"shape\":\"InternalServiceError\"}\
      ],\
      \"documentation\":\"<p>Retrieves the contents of the encrypted fields <code>SecretString</code> or <code>SecretBinary</code> from the specified version of a secret, whichever contains content.</p> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:GetSecretValue</p> </li> <li> <p>kms:Decrypt - required only if you use a customer-managed AWS KMS key to encrypt the secret. You do not need this permission to use the account's default AWS managed CMK for Secrets Manager.</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p>To create a new version of the secret with different encrypted information, use <a>PutSecretValue</a>.</p> </li> <li> <p>To retrieve the non-encrypted details for the secret, use <a>DescribeSecret</a>.</p> </li> </ul>\"\
    },\
    \"ListSecretVersionIds\":{\
      \"name\":\"ListSecretVersionIds\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListSecretVersionIdsRequest\"},\
      \"output\":{\"shape\":\"ListSecretVersionIdsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceError\"}\
      ],\
      \"documentation\":\"<p>Lists all of the versions attached to the specified secret. The output does not include the <code>SecretString</code> or <code>SecretBinary</code> fields. By default, the list includes only versions that have at least one staging label in <code>VersionStage</code> attached.</p> <note> <p>Always check the <code>NextToken</code> response parameter when calling any of the <code>List*</code> operations. These operations can occasionally return an empty or shorter than expected list of results even when there more results become available. When this happens, the <code>NextToken</code> response parameter contains a value to pass to the next call to the same API to request the next part of the list.</p> </note> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:ListSecretVersionIds</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p>To list the secrets in an account, use <a>ListSecrets</a>.</p> </li> </ul>\"\
    },\
    \"ListSecrets\":{\
      \"name\":\"ListSecrets\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListSecretsRequest\"},\
      \"output\":{\"shape\":\"ListSecretsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidNextTokenException\"},\
        {\"shape\":\"InternalServiceError\"}\
      ],\
      \"documentation\":\"<p>Lists all of the secrets that are stored by Secrets Manager in the AWS account. To list the versions currently stored for a specific secret, use <a>ListSecretVersionIds</a>. The encrypted fields <code>SecretString</code> and <code>SecretBinary</code> are not included in the output. To get that information, call the <a>GetSecretValue</a> operation.</p> <note> <p>Always check the <code>NextToken</code> response parameter when calling any of the <code>List*</code> operations. These operations can occasionally return an empty or shorter than expected list of results even when there more results become available. When this happens, the <code>NextToken</code> response parameter contains a value to pass to the next call to the same API to request the next part of the list.</p> </note> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:ListSecrets</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p>To list the versions attached to a secret, use <a>ListSecretVersionIds</a>.</p> </li> </ul>\"\
    },\
    \"PutResourcePolicy\":{\
      \"name\":\"PutResourcePolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutResourcePolicyRequest\"},\
      \"output\":{\"shape\":\"PutResourcePolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"MalformedPolicyDocumentException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceError\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"PublicPolicyException\"}\
      ],\
      \"documentation\":\"<p>Attaches the contents of the specified resource-based permission policy to a secret. A resource-based policy is optional. Alternatively, you can use IAM identity-based policies that specify the secret's Amazon Resource Name (ARN) in the policy statement's <code>Resources</code> element. You can also use a combination of both identity-based and resource-based policies. The affected users and roles receive the permissions that are permitted by all of the relevant policies. For more information, see <a href=\\\"http://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_resource-based-policies.html\\\">Using Resource-Based Policies for AWS Secrets Manager</a>. For the complete description of the AWS policy syntax and grammar, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html\\\">IAM JSON Policy Reference</a> in the <i>IAM User Guide</i>.</p> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:PutResourcePolicy</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p>To retrieve the resource policy attached to a secret, use <a>GetResourcePolicy</a>.</p> </li> <li> <p>To delete the resource-based policy that's attached to a secret, use <a>DeleteResourcePolicy</a>.</p> </li> <li> <p>To list all of the currently available secrets, use <a>ListSecrets</a>.</p> </li> </ul>\"\
    },\
    \"PutSecretValue\":{\
      \"name\":\"PutSecretValue\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutSecretValueRequest\"},\
      \"output\":{\"shape\":\"PutSecretValueResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"EncryptionFailure\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceError\"}\
      ],\
      \"documentation\":\"<p>Stores a new encrypted secret value in the specified secret. To do this, the operation creates a new version and attaches it to the secret. The version can contain a new <code>SecretString</code> value or a new <code>SecretBinary</code> value. You can also specify the staging labels that are initially attached to the new version.</p> <note> <p>The Secrets Manager console uses only the <code>SecretString</code> field. To add binary data to a secret with the <code>SecretBinary</code> field you must use the AWS CLI or one of the AWS SDKs.</p> </note> <ul> <li> <p>If this operation creates the first version for the secret then Secrets Manager automatically attaches the staging label <code>AWSCURRENT</code> to the new version.</p> </li> <li> <p>If another version of this secret already exists, then this operation does not automatically move any staging labels other than those that you explicitly specify in the <code>VersionStages</code> parameter.</p> </li> <li> <p>If this operation moves the staging label <code>AWSCURRENT</code> from another version to this version (because you included it in the <code>StagingLabels</code> parameter) then Secrets Manager also automatically moves the staging label <code>AWSPREVIOUS</code> to the version that <code>AWSCURRENT</code> was removed from.</p> </li> <li> <p>This operation is idempotent. If a version with a <code>VersionId</code> with the same value as the <code>ClientRequestToken</code> parameter already exists and you specify the same secret data, the operation succeeds but does nothing. However, if the secret data is different, then the operation fails because you cannot modify an existing version; you can only create new ones.</p> </li> </ul> <note> <ul> <li> <p>If you call an operation to encrypt or decrypt the <code>SecretString</code> or <code>SecretBinary</code> for a secret in the same account as the calling user and that secret doesn't specify a AWS KMS encryption key, Secrets Manager uses the account's default AWS managed customer master key (CMK) with the alias <code>aws/secretsmanager</code>. If this key doesn't already exist in your account then Secrets Manager creates it for you automatically. All users and roles in the same AWS account automatically have access to use the default CMK. Note that if an Secrets Manager API call results in AWS creating the account's AWS-managed CMK, it can result in a one-time significant delay in returning the result.</p> </li> <li> <p>If the secret resides in a different AWS account from the credentials calling an API that requires encryption or decryption of the secret value then you must create and use a custom AWS KMS CMK because you can't access the default CMK for the account using credentials from a different AWS account. Store the ARN of the CMK in the secret when you create the secret or when you update it by including it in the <code>KMSKeyId</code>. If you call an API that must encrypt or decrypt <code>SecretString</code> or <code>SecretBinary</code> using credentials from a different account then the AWS KMS key policy must grant cross-account access to that other account's user or role for both the kms:GenerateDataKey and kms:Decrypt operations.</p> </li> </ul> </note> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:PutSecretValue</p> </li> <li> <p>kms:GenerateDataKey - needed only if you use a customer-managed AWS KMS key to encrypt the secret. You do not need this permission to use the account's default AWS managed CMK for Secrets Manager.</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p>To retrieve the encrypted value you store in the version of a secret, use <a>GetSecretValue</a>.</p> </li> <li> <p>To create a secret, use <a>CreateSecret</a>.</p> </li> <li> <p>To get the details for a secret, use <a>DescribeSecret</a>.</p> </li> <li> <p>To list the versions attached to a secret, use <a>ListSecretVersionIds</a>.</p> </li> </ul>\"\
    },\
    \"RestoreSecret\":{\
      \"name\":\"RestoreSecret\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RestoreSecretRequest\"},\
      \"output\":{\"shape\":\"RestoreSecretResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalServiceError\"}\
      ],\
      \"documentation\":\"<p>Cancels the scheduled deletion of a secret by removing the <code>DeletedDate</code> time stamp. This makes the secret accessible to query once again.</p> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:RestoreSecret</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p>To delete a secret, use <a>DeleteSecret</a>.</p> </li> </ul>\"\
    },\
    \"RotateSecret\":{\
      \"name\":\"RotateSecret\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RotateSecretRequest\"},\
      \"output\":{\"shape\":\"RotateSecretResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceError\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Configures and starts the asynchronous process of rotating this secret. If you include the configuration parameters, the operation sets those values for the secret and then immediately starts a rotation. If you do not include the configuration parameters, the operation starts a rotation with the values already stored in the secret. After the rotation completes, the protected service and its clients all use the new version of the secret. </p> <p>This required configuration information includes the ARN of an AWS Lambda function and the time between scheduled rotations. The Lambda rotation function creates a new version of the secret and creates or updates the credentials on the protected service to match. After testing the new credentials, the function marks the new secret with the staging label <code>AWSCURRENT</code> so that your clients all immediately begin to use the new version. For more information about rotating secrets and how to configure a Lambda function to rotate the secrets for your protected service, see <a href=\\\"https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets.html\\\">Rotating Secrets in AWS Secrets Manager</a> in the <i>AWS Secrets Manager User Guide</i>.</p> <p>Secrets Manager schedules the next rotation when the previous one completes. Secrets Manager schedules the date by adding the rotation interval (number of days) to the actual date of the last rotation. The service chooses the hour within that 24-hour date window randomly. The minute is also chosen somewhat randomly, but weighted towards the top of the hour and influenced by a variety of factors that help distribute load.</p> <p>The rotation function must end with the versions of the secret in one of two states:</p> <ul> <li> <p>The <code>AWSPENDING</code> and <code>AWSCURRENT</code> staging labels are attached to the same version of the secret, or</p> </li> <li> <p>The <code>AWSPENDING</code> staging label is not attached to any version of the secret.</p> </li> </ul> <p>If the <code>AWSPENDING</code> staging label is present but not attached to the same version as <code>AWSCURRENT</code> then any later invocation of <code>RotateSecret</code> assumes that a previous rotation request is still in progress and returns an error.</p> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:RotateSecret</p> </li> <li> <p>lambda:InvokeFunction (on the function specified in the secret's metadata)</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p>To list the secrets in your account, use <a>ListSecrets</a>.</p> </li> <li> <p>To get the details for a version of a secret, use <a>DescribeSecret</a>.</p> </li> <li> <p>To create a new version of a secret, use <a>CreateSecret</a>.</p> </li> <li> <p>To attach staging labels to or remove staging labels from a version of a secret, use <a>UpdateSecretVersionStage</a>.</p> </li> </ul>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceError\"}\
      ],\
      \"documentation\":\"<p>Attaches one or more tags, each consisting of a key name and a value, to the specified secret. Tags are part of the secret's overall metadata, and are not associated with any specific version of the secret. This operation only appends tags to the existing list of tags. To remove tags, you must use <a>UntagResource</a>.</p> <p>The following basic restrictions apply to tags:</p> <ul> <li> <p>Maximum number of tags per secretâ50</p> </li> <li> <p>Maximum key lengthâ127 Unicode characters in UTF-8</p> </li> <li> <p>Maximum value lengthâ255 Unicode characters in UTF-8</p> </li> <li> <p>Tag keys and values are case sensitive.</p> </li> <li> <p>Do not use the <code>aws:</code> prefix in your tag names or values because AWS reserves it for AWS use. You can't edit or delete tag names or values with this prefix. Tags with this prefix do not count against your tags per secret limit.</p> </li> <li> <p>If you use your tagging schema across multiple services and resources, remember other services might have restrictions on allowed characters. Generally allowed characters: letters, spaces, and numbers representable in UTF-8, plus the following special characters: + - = . _ : / @.</p> </li> </ul> <important> <p>If you use tags as part of your security strategy, then adding or removing a tag can change permissions. If successfully completing this operation would result in you losing your permissions for this secret, then the operation is blocked and returns an Access Denied error.</p> </important> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:TagResource</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p>To remove one or more tags from the collection attached to a secret, use <a>UntagResource</a>.</p> </li> <li> <p>To view the list of tags attached to a secret, use <a>DescribeSecret</a>.</p> </li> </ul>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceError\"}\
      ],\
      \"documentation\":\"<p>Removes one or more tags from the specified secret.</p> <p>This operation is idempotent. If a requested tag is not attached to the secret, no error is returned and the secret metadata is unchanged.</p> <important> <p>If you use tags as part of your security strategy, then removing a tag can change permissions. If successfully completing this operation would result in you losing your permissions for this secret, then the operation is blocked and returns an Access Denied error.</p> </important> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:UntagResource</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p>To add one or more tags to the collection attached to a secret, use <a>TagResource</a>.</p> </li> <li> <p>To view the list of tags attached to a secret, use <a>DescribeSecret</a>.</p> </li> </ul>\"\
    },\
    \"UpdateSecret\":{\
      \"name\":\"UpdateSecret\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateSecretRequest\"},\
      \"output\":{\"shape\":\"UpdateSecretResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"EncryptionFailure\"},\
        {\"shape\":\"ResourceExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"MalformedPolicyDocumentException\"},\
        {\"shape\":\"InternalServiceError\"},\
        {\"shape\":\"PreconditionNotMetException\"}\
      ],\
      \"documentation\":\"<p>Modifies many of the details of the specified secret. If you include a <code>ClientRequestToken</code> and <i>either</i> <code>SecretString</code> or <code>SecretBinary</code> then it also creates a new version attached to the secret.</p> <p>To modify the rotation configuration of a secret, use <a>RotateSecret</a> instead.</p> <note> <p>The Secrets Manager console uses only the <code>SecretString</code> parameter and therefore limits you to encrypting and storing only a text string. To encrypt and store binary data as part of the version of a secret, you must use either the AWS CLI or one of the AWS SDKs.</p> </note> <ul> <li> <p>If a version with a <code>VersionId</code> with the same value as the <code>ClientRequestToken</code> parameter already exists, the operation results in an error. You cannot modify an existing version, you can only create a new version.</p> </li> <li> <p>If you include <code>SecretString</code> or <code>SecretBinary</code> to create a new secret version, Secrets Manager automatically attaches the staging label <code>AWSCURRENT</code> to the new version. </p> </li> </ul> <note> <ul> <li> <p>If you call an operation to encrypt or decrypt the <code>SecretString</code> or <code>SecretBinary</code> for a secret in the same account as the calling user and that secret doesn't specify a AWS KMS encryption key, Secrets Manager uses the account's default AWS managed customer master key (CMK) with the alias <code>aws/secretsmanager</code>. If this key doesn't already exist in your account then Secrets Manager creates it for you automatically. All users and roles in the same AWS account automatically have access to use the default CMK. Note that if an Secrets Manager API call results in AWS creating the account's AWS-managed CMK, it can result in a one-time significant delay in returning the result.</p> </li> <li> <p>If the secret resides in a different AWS account from the credentials calling an API that requires encryption or decryption of the secret value then you must create and use a custom AWS KMS CMK because you can't access the default CMK for the account using credentials from a different AWS account. Store the ARN of the CMK in the secret when you create the secret or when you update it by including it in the <code>KMSKeyId</code>. If you call an API that must encrypt or decrypt <code>SecretString</code> or <code>SecretBinary</code> using credentials from a different account then the AWS KMS key policy must grant cross-account access to that other account's user or role for both the kms:GenerateDataKey and kms:Decrypt operations.</p> </li> </ul> </note> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:UpdateSecret</p> </li> <li> <p>kms:GenerateDataKey - needed only if you use a custom AWS KMS key to encrypt the secret. You do not need this permission to use the account's AWS managed CMK for Secrets Manager.</p> </li> <li> <p>kms:Decrypt - needed only if you use a custom AWS KMS key to encrypt the secret. You do not need this permission to use the account's AWS managed CMK for Secrets Manager.</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p>To create a new secret, use <a>CreateSecret</a>.</p> </li> <li> <p>To add only a new version to an existing secret, use <a>PutSecretValue</a>.</p> </li> <li> <p>To get the details for a secret, use <a>DescribeSecret</a>.</p> </li> <li> <p>To list the versions contained in a secret, use <a>ListSecretVersionIds</a>.</p> </li> </ul>\"\
    },\
    \"UpdateSecretVersionStage\":{\
      \"name\":\"UpdateSecretVersionStage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateSecretVersionStageRequest\"},\
      \"output\":{\"shape\":\"UpdateSecretVersionStageResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalServiceError\"}\
      ],\
      \"documentation\":\"<p>Modifies the staging labels attached to a version of a secret. Staging labels are used to track a version as it progresses through the secret rotation process. You can attach a staging label to only one version of a secret at a time. If a staging label to be added is already attached to another version, then it is moved--removed from the other version first and then attached to this one. For more information about staging labels, see <a href=\\\"https://docs.aws.amazon.com/secretsmanager/latest/userguide/terms-concepts.html#term_staging-label\\\">Staging Labels</a> in the <i>AWS Secrets Manager User Guide</i>. </p> <p>The staging labels that you specify in the <code>VersionStage</code> parameter are added to the existing list of staging labels--they don't replace it.</p> <p>You can move the <code>AWSCURRENT</code> staging label to this version by including it in this call.</p> <note> <p>Whenever you move <code>AWSCURRENT</code>, Secrets Manager automatically moves the label <code>AWSPREVIOUS</code> to the version that <code>AWSCURRENT</code> was removed from.</p> </note> <p>If this action results in the last label being removed from a version, then the version is considered to be 'deprecated' and can be deleted by Secrets Manager.</p> <p> <b>Minimum permissions</b> </p> <p>To run this command, you must have the following permissions:</p> <ul> <li> <p>secretsmanager:UpdateSecretVersionStage</p> </li> </ul> <p> <b>Related operations</b> </p> <ul> <li> <p>To get the list of staging labels that are currently associated with a version of a secret, use <code> <a>DescribeSecret</a> </code> and examine the <code>SecretVersionsToStages</code> response value. </p> </li> </ul>\"\
    },\
    \"ValidateResourcePolicy\":{\
      \"name\":\"ValidateResourcePolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ValidateResourcePolicyRequest\"},\
      \"output\":{\"shape\":\"ValidateResourcePolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"MalformedPolicyDocumentException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceError\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Validates the JSON text of the resource-based policy document attached to the specified secret. The JSON request string input and response output displays formatted code with white space and line breaks for better readability. Submit your input as a single line JSON string. A resource-based policy is optional.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AutomaticallyRotateAfterDaysType\":{\
      \"type\":\"long\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"BooleanType\":{\"type\":\"boolean\"},\
    \"CancelRotateSecretRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SecretId\"],\
      \"members\":{\
        \"SecretId\":{\
          \"shape\":\"SecretIdType\",\
          \"documentation\":\"<p>Specifies the secret to cancel a rotation request. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p> <note> <p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN tooâfor example, if you donât include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that youâre specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you donât create secret names ending with a hyphen followed by six characters.</p> <p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p> </note>\"\
        }\
      }\
    },\
    \"CancelRotateSecretResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ARN\":{\
          \"shape\":\"SecretARNType\",\
          \"documentation\":\"<p>The ARN of the secret for which rotation was canceled.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"SecretNameType\",\
          \"documentation\":\"<p>The friendly name of the secret for which rotation was canceled.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"SecretVersionIdType\",\
          \"documentation\":\"<p>The unique identifier of the version of the secret created during the rotation. This version might not be complete, and should be evaluated for possible deletion. At the very least, you should remove the <code>VersionStage</code> value <code>AWSPENDING</code> to enable this version to be deleted. Failing to clean up a cancelled rotation can block you from successfully starting future rotations.</p>\"\
        }\
      }\
    },\
    \"ClientRequestTokenType\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":32\
    },\
    \"CreateSecretRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"NameType\",\
          \"documentation\":\"<p>Specifies the friendly name of the new secret.</p> <p>The secret name must be ASCII letters, digits, or the following characters : /_+=.@-</p> <note> <p>Do not end your secret name with a hyphen followed by six characters. If you do so, you risk confusion and unexpected results when searching for a secret by partial ARN. Secrets Manager automatically adds a hyphen and six random characters at the end of the ARN.</p> </note>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenType\",\
          \"documentation\":\"<p>(Optional) If you include <code>SecretString</code> or <code>SecretBinary</code>, then an initial version is created as part of the secret, and this parameter specifies a unique identifier for the new version. </p> <note> <p>If you use the AWS CLI or one of the AWS SDK to call this operation, then you can leave this parameter empty. The CLI or SDK generates a random UUID for you and includes it as the value for this parameter in the request. If you don't use the SDK and instead generate a raw HTTP request to the Secrets Manager service endpoint, then you must generate a <code>ClientRequestToken</code> yourself for the new version and include the value in the request.</p> </note> <p>This value helps ensure idempotency. Secrets Manager uses this value to prevent the accidental creation of duplicate versions if there are failures and retries during a rotation. We recommend that you generate a <a href=\\\"https://wikipedia.org/wiki/Universally_unique_identifier\\\">UUID-type</a> value to ensure uniqueness of your versions within the specified secret. </p> <ul> <li> <p>If the <code>ClientRequestToken</code> value isn't already associated with a version of the secret then a new version of the secret is created. </p> </li> <li> <p>If a version with this value already exists and the version <code>SecretString</code> and <code>SecretBinary</code> values are the same as those in the request, then the request is ignored.</p> </li> <li> <p>If a version with this value already exists and that version's <code>SecretString</code> and <code>SecretBinary</code> values are different from those in the request then the request fails because you cannot modify an existing version. Instead, use <a>PutSecretValue</a> to create a new version.</p> </li> </ul> <p>This value becomes the <code>VersionId</code> of the new version.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"Description\":{\
          \"shape\":\"DescriptionType\",\
          \"documentation\":\"<p>(Optional) Specifies a user-provided description of the secret.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyIdType\",\
          \"documentation\":\"<p>(Optional) Specifies the ARN, Key ID, or alias of the AWS KMS customer master key (CMK) to be used to encrypt the <code>SecretString</code> or <code>SecretBinary</code> values in the versions stored in this secret.</p> <p>You can specify any of the supported ways to identify a AWS KMS key ID. If you need to reference a CMK in a different account, you can use only the key ARN or the alias ARN.</p> <p>If you don't specify this value, then Secrets Manager defaults to using the AWS account's default CMK (the one named <code>aws/secretsmanager</code>). If a AWS KMS CMK with that name doesn't yet exist, then Secrets Manager creates it for you automatically the first time it needs to encrypt a version's <code>SecretString</code> or <code>SecretBinary</code> fields.</p> <important> <p>You can use the account default CMK to encrypt and decrypt only if you call this operation using credentials from the same account that owns the secret. If the secret resides in a different account, then you must create a custom CMK and specify the ARN in this field. </p> </important>\"\
        },\
        \"SecretBinary\":{\
          \"shape\":\"SecretBinaryType\",\
          \"documentation\":\"<p>(Optional) Specifies binary data that you want to encrypt and store in the new version of the secret. To use this parameter in the command-line tools, we recommend that you store your binary data in a file and then use the appropriate technique for your tool to pass the contents of the file as a parameter.</p> <p>Either <code>SecretString</code> or <code>SecretBinary</code> must have a value, but not both. They cannot both be empty.</p> <p>This parameter is not available using the Secrets Manager console. It can be accessed only by using the AWS CLI or one of the AWS SDKs.</p>\"\
        },\
        \"SecretString\":{\
          \"shape\":\"SecretStringType\",\
          \"documentation\":\"<p>(Optional) Specifies text data that you want to encrypt and store in this new version of the secret.</p> <p>Either <code>SecretString</code> or <code>SecretBinary</code> must have a value, but not both. They cannot both be empty.</p> <p>If you create a secret by using the Secrets Manager console then Secrets Manager puts the protected secret text in only the <code>SecretString</code> parameter. The Secrets Manager console stores the information as a JSON structure of key/value pairs that the Lambda rotation function knows how to parse.</p> <p>For storing multiple values, we recommend that you use a JSON text string argument and specify key/value pairs. For information on how to format a JSON parameter for the various command line tool environments, see <a href=\\\"https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json\\\">Using JSON for Parameters</a> in the <i>AWS CLI User Guide</i>. For example:</p> <p> <code>{\\\"username\\\":\\\"bob\\\",\\\"password\\\":\\\"abc123xyz456\\\"}</code> </p> <p>If your command-line tool or SDK requires quotation marks around the parameter, you should use single quotes to avoid confusion with the double quotes required in the JSON text. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagListType\",\
          \"documentation\":\"<p>(Optional) Specifies a list of user-defined tags that are attached to the secret. Each tag is a \\\"Key\\\" and \\\"Value\\\" pair of strings. This operation only appends tags to the existing list of tags. To remove tags, you must use <a>UntagResource</a>.</p> <important> <ul> <li> <p>Secrets Manager tag key names are case sensitive. A tag with the key \\\"ABC\\\" is a different tag from one with key \\\"abc\\\".</p> </li> <li> <p>If you check tags in IAM policy <code>Condition</code> elements as part of your security strategy, then adding or removing a tag can change permissions. If the successful completion of this operation would result in you losing your permissions for this secret, then this operation is blocked and returns an <code>Access Denied</code> error.</p> </li> </ul> </important> <p>This parameter requires a JSON text string argument. For information on how to format a JSON parameter for the various command line tool environments, see <a href=\\\"https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json\\\">Using JSON for Parameters</a> in the <i>AWS CLI User Guide</i>. For example:</p> <p> <code>[{\\\"Key\\\":\\\"CostCenter\\\",\\\"Value\\\":\\\"12345\\\"},{\\\"Key\\\":\\\"environment\\\",\\\"Value\\\":\\\"production\\\"}]</code> </p> <p>If your command-line tool or SDK requires quotation marks around the parameter, you should use single quotes to avoid confusion with the double quotes required in the JSON text. </p> <p>The following basic restrictions apply to tags:</p> <ul> <li> <p>Maximum number of tags per secretâ50</p> </li> <li> <p>Maximum key lengthâ127 Unicode characters in UTF-8</p> </li> <li> <p>Maximum value lengthâ255 Unicode characters in UTF-8</p> </li> <li> <p>Tag keys and values are case sensitive.</p> </li> <li> <p>Do not use the <code>aws:</code> prefix in your tag names or values because AWS reserves it for AWS use. You can't edit or delete tag names or values with this prefix. Tags with this prefix do not count against your tags per secret limit.</p> </li> <li> <p>If you use your tagging schema across multiple services and resources, remember other services might have restrictions on allowed characters. Generally allowed characters: letters, spaces, and numbers representable in UTF-8, plus the following special characters: + - = . _ : / @.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"CreateSecretResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ARN\":{\
          \"shape\":\"SecretARNType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the secret that you just created.</p> <note> <p>Secrets Manager automatically adds several random characters to the name at the end of the ARN when you initially create a secret. This affects only the ARN and not the actual friendly name. This ensures that if you create a new secret with the same name as an old secret that you previously deleted, then users with access to the old secret <i>don't</i> automatically get access to the new secret because the ARNs are different.</p> </note>\"\
        },\
        \"Name\":{\
          \"shape\":\"SecretNameType\",\
          \"documentation\":\"<p>The friendly name of the secret that you just created.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"SecretVersionIdType\",\
          \"documentation\":\"<p>The unique identifier associated with the version of the secret you just created.</p>\"\
        }\
      }\
    },\
    \"CreatedDateType\":{\"type\":\"timestamp\"},\
    \"DecryptionFailure\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Secrets Manager can't decrypt the protected secret text using the provided KMS key. </p>\",\
      \"exception\":true\
    },\
    \"DeleteResourcePolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SecretId\"],\
      \"members\":{\
        \"SecretId\":{\
          \"shape\":\"SecretIdType\",\
          \"documentation\":\"<p>Specifies the secret that you want to delete the attached resource-based policy for. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p> <note> <p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN tooâfor example, if you donât include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that youâre specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you donât create secret names ending with a hyphen followed by six characters.</p> <p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p> </note>\"\
        }\
      }\
    },\
    \"DeleteResourcePolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ARN\":{\
          \"shape\":\"SecretARNType\",\
          \"documentation\":\"<p>The ARN of the secret that the resource-based policy was deleted for.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"NameType\",\
          \"documentation\":\"<p>The friendly name of the secret that the resource-based policy was deleted for.</p>\"\
        }\
      }\
    },\
    \"DeleteSecretRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SecretId\"],\
      \"members\":{\
        \"SecretId\":{\
          \"shape\":\"SecretIdType\",\
          \"documentation\":\"<p>Specifies the secret that you want to delete. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p> <note> <p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN tooâfor example, if you donât include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that youâre specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you donât create secret names ending with a hyphen followed by six characters.</p> <p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p> </note>\"\
        },\
        \"RecoveryWindowInDays\":{\
          \"shape\":\"RecoveryWindowInDaysType\",\
          \"documentation\":\"<p>(Optional) Specifies the number of days that Secrets Manager waits before it can delete the secret. You can't use both this parameter and the <code>ForceDeleteWithoutRecovery</code> parameter in the same API call.</p> <p>This value can range from 7 to 30 days. The default value is 30.</p>\",\
          \"box\":true\
        },\
        \"ForceDeleteWithoutRecovery\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>(Optional) Specifies that the secret is to be deleted without any recovery window. You can't use both this parameter and the <code>RecoveryWindowInDays</code> parameter in the same API call.</p> <p>An asynchronous background process performs the actual deletion, so there can be a short delay before the operation completes. If you write code to delete and then immediately recreate a secret with the same name, ensure that your code includes appropriate back off and retry logic.</p> <important> <p>Use this parameter with caution. This parameter causes the operation to skip the normal waiting period before the permanent deletion that AWS would normally impose with the <code>RecoveryWindowInDays</code> parameter. If you delete a secret with the <code>ForceDeleteWithouRecovery</code> parameter, then you have no opportunity to recover the secret. It is permanently lost.</p> </important>\",\
          \"box\":true\
        }\
      }\
    },\
    \"DeleteSecretResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ARN\":{\
          \"shape\":\"SecretARNType\",\
          \"documentation\":\"<p>The ARN of the secret that is now scheduled for deletion.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"SecretNameType\",\
          \"documentation\":\"<p>The friendly name of the secret that is now scheduled for deletion.</p>\"\
        },\
        \"DeletionDate\":{\
          \"shape\":\"DeletionDateType\",\
          \"documentation\":\"<p>The date and time after which this secret can be deleted by Secrets Manager and can no longer be restored. This value is the date and time of the delete request plus the number of days specified in <code>RecoveryWindowInDays</code>.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"DeletedDateType\":{\"type\":\"timestamp\"},\
    \"DeletionDateType\":{\"type\":\"timestamp\"},\
    \"DescribeSecretRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SecretId\"],\
      \"members\":{\
        \"SecretId\":{\
          \"shape\":\"SecretIdType\",\
          \"documentation\":\"<p>The identifier of the secret whose details you want to retrieve. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p> <note> <p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN tooâfor example, if you donât include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that youâre specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you donât create secret names ending with a hyphen followed by six characters.</p> <p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p> </note>\"\
        }\
      }\
    },\
    \"DescribeSecretResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ARN\":{\
          \"shape\":\"SecretARNType\",\
          \"documentation\":\"<p>The ARN of the secret.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"SecretNameType\",\
          \"documentation\":\"<p>The user-provided friendly name of the secret.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"DescriptionType\",\
          \"documentation\":\"<p>The user-provided description of the secret.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyIdType\",\
          \"documentation\":\"<p>The ARN or alias of the AWS KMS customer master key (CMK) that's used to encrypt the <code>SecretString</code> or <code>SecretBinary</code> fields in each version of the secret. If you don't provide a key, then Secrets Manager defaults to encrypting the secret fields with the default AWS KMS CMK (the one named <code>awssecretsmanager</code>) for this account.</p>\"\
        },\
        \"RotationEnabled\":{\
          \"shape\":\"RotationEnabledType\",\
          \"documentation\":\"<p>Specifies whether automatic rotation is enabled for this secret.</p> <p>To enable rotation, use <a>RotateSecret</a> with <code>AutomaticallyRotateAfterDays</code> set to a value greater than 0. To disable rotation, use <a>CancelRotateSecret</a>.</p>\",\
          \"box\":true\
        },\
        \"RotationLambdaARN\":{\
          \"shape\":\"RotationLambdaARNType\",\
          \"documentation\":\"<p>The ARN of a Lambda function that's invoked by Secrets Manager to rotate the secret either automatically per the schedule or manually by a call to <code>RotateSecret</code>.</p>\"\
        },\
        \"RotationRules\":{\
          \"shape\":\"RotationRulesType\",\
          \"documentation\":\"<p>A structure that contains the rotation configuration for this secret.</p>\"\
        },\
        \"LastRotatedDate\":{\
          \"shape\":\"LastRotatedDateType\",\
          \"documentation\":\"<p>The most recent date and time that the Secrets Manager rotation process was successfully completed. This value is null if the secret has never rotated.</p>\",\
          \"box\":true\
        },\
        \"LastChangedDate\":{\
          \"shape\":\"LastChangedDateType\",\
          \"documentation\":\"<p>The last date and time that this secret was modified in any way.</p>\",\
          \"box\":true\
        },\
        \"LastAccessedDate\":{\
          \"shape\":\"LastAccessedDateType\",\
          \"documentation\":\"<p>The last date that this secret was accessed. This value is truncated to midnight of the date and therefore shows only the date, not the time.</p>\",\
          \"box\":true\
        },\
        \"DeletedDate\":{\
          \"shape\":\"DeletedDateType\",\
          \"documentation\":\"<p>This value exists if the secret is scheduled for deletion. Some time after the specified date and time, Secrets Manager deletes the secret and all of its versions.</p> <p>If a secret is scheduled for deletion, then its details, including the encrypted secret information, is not accessible. To cancel a scheduled deletion and restore access, use <a>RestoreSecret</a>.</p>\",\
          \"box\":true\
        },\
        \"Tags\":{\
          \"shape\":\"TagListType\",\
          \"documentation\":\"<p>The list of user-defined tags that are associated with the secret. To add tags to a secret, use <a>TagResource</a>. To remove tags, use <a>UntagResource</a>.</p>\"\
        },\
        \"VersionIdsToStages\":{\
          \"shape\":\"SecretVersionsToStagesMapType\",\
          \"documentation\":\"<p>A list of all of the currently assigned <code>VersionStage</code> staging labels and the <code>VersionId</code> that each is attached to. Staging labels are used to keep track of the different versions during the rotation process.</p> <note> <p>A version that does not have any staging labels attached is considered deprecated and subject to deletion. Such versions are not included in this list.</p> </note>\"\
        },\
        \"OwningService\":{\
          \"shape\":\"OwningServiceType\",\
          \"documentation\":\"<p>Returns the name of the service that created this secret.</p>\"\
        },\
        \"CreatedDate\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date that the secret was created.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"DescriptionType\":{\
      \"type\":\"string\",\
      \"max\":2048\
    },\
    \"EncryptionFailure\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Secrets Manager can't encrypt the protected secret text using the provided KMS key. Check that the customer master key (CMK) is available, enabled, and not in an invalid state. For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/key-state.html\\\">How Key State Affects Use of a Customer Master Key</a>.</p>\",\
      \"exception\":true\
    },\
    \"ErrorMessage\":{\"type\":\"string\"},\
    \"ExcludeCharactersType\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":0\
    },\
    \"ExcludeLowercaseType\":{\"type\":\"boolean\"},\
    \"ExcludeNumbersType\":{\"type\":\"boolean\"},\
    \"ExcludePunctuationType\":{\"type\":\"boolean\"},\
    \"ExcludeUppercaseType\":{\"type\":\"boolean\"},\
    \"Filter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"FilterNameStringType\",\
          \"documentation\":\"<p>Filters your list of secrets by a specific key.</p>\"\
        },\
        \"Values\":{\
          \"shape\":\"FilterValuesStringList\",\
          \"documentation\":\"<p>Filters your list of secrets by a specific value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Allows you to filter your list of secrets.</p>\"\
    },\
    \"FilterNameStringType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"description\",\
        \"name\",\
        \"tag-key\",\
        \"tag-value\",\
        \"all\"\
      ]\
    },\
    \"FilterValueStringType\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9 :_@\\\\/\\\\+\\\\=\\\\.\\\\-]+\"\
    },\
    \"FilterValuesStringList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FilterValueStringType\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"FiltersListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Filter\"},\
      \"max\":10\
    },\
    \"GetRandomPasswordRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PasswordLength\":{\
          \"shape\":\"PasswordLengthType\",\
          \"documentation\":\"<p>The desired length of the generated password. The default value if you do not include this parameter is 32 characters.</p>\",\
          \"box\":true\
        },\
        \"ExcludeCharacters\":{\
          \"shape\":\"ExcludeCharactersType\",\
          \"documentation\":\"<p>A string that includes characters that should not be included in the generated password. The default is that all characters from the included sets can be used.</p>\"\
        },\
        \"ExcludeNumbers\":{\
          \"shape\":\"ExcludeNumbersType\",\
          \"documentation\":\"<p>Specifies that the generated password should not include digits. The default if you do not include this switch parameter is that digits can be included.</p>\",\
          \"box\":true\
        },\
        \"ExcludePunctuation\":{\
          \"shape\":\"ExcludePunctuationType\",\
          \"documentation\":\"<p>Specifies that the generated password should not include punctuation characters. The default if you do not include this switch parameter is that punctuation characters can be included.</p> <p>The following are the punctuation characters that <i>can</i> be included in the generated password if you don't explicitly exclude them with <code>ExcludeCharacters</code> or <code>ExcludePunctuation</code>:</p> <p> <code>! \\\" # $ % &amp; ' ( ) * + , - . / : ; &lt; = &gt; ? @ [ \\\\ ] ^ _ ` { | } ~</code> </p>\",\
          \"box\":true\
        },\
        \"ExcludeUppercase\":{\
          \"shape\":\"ExcludeUppercaseType\",\
          \"documentation\":\"<p>Specifies that the generated password should not include uppercase letters. The default if you do not include this switch parameter is that uppercase letters can be included.</p>\",\
          \"box\":true\
        },\
        \"ExcludeLowercase\":{\
          \"shape\":\"ExcludeLowercaseType\",\
          \"documentation\":\"<p>Specifies that the generated password should not include lowercase letters. The default if you do not include this switch parameter is that lowercase letters can be included.</p>\",\
          \"box\":true\
        },\
        \"IncludeSpace\":{\
          \"shape\":\"IncludeSpaceType\",\
          \"documentation\":\"<p>Specifies that the generated password can include the space character. The default if you do not include this switch parameter is that the space character is not included.</p>\",\
          \"box\":true\
        },\
        \"RequireEachIncludedType\":{\
          \"shape\":\"RequireEachIncludedTypeType\",\
          \"documentation\":\"<p>A boolean value that specifies whether the generated password must include at least one of every allowed character type. The default value is <code>True</code> and the operation requires at least one of every character type.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"GetRandomPasswordResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RandomPassword\":{\
          \"shape\":\"RandomPasswordType\",\
          \"documentation\":\"<p>A string with the generated password.</p>\"\
        }\
      }\
    },\
    \"GetResourcePolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SecretId\"],\
      \"members\":{\
        \"SecretId\":{\
          \"shape\":\"SecretIdType\",\
          \"documentation\":\"<p>Specifies the secret that you want to retrieve the attached resource-based policy for. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p> <note> <p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN tooâfor example, if you donât include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that youâre specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you donât create secret names ending with a hyphen followed by six characters.</p> <p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p> </note>\"\
        }\
      }\
    },\
    \"GetResourcePolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ARN\":{\
          \"shape\":\"SecretARNType\",\
          \"documentation\":\"<p>The ARN of the secret that the resource-based policy was retrieved for.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"NameType\",\
          \"documentation\":\"<p>The friendly name of the secret that the resource-based policy was retrieved for.</p>\"\
        },\
        \"ResourcePolicy\":{\
          \"shape\":\"NonEmptyResourcePolicyType\",\
          \"documentation\":\"<p>A JSON-formatted string that describes the permissions that are associated with the attached secret. These permissions are combined with any permissions that are associated with the user or role that attempts to access this secret. The combined permissions specify who can access the secret and what actions they can perform. For more information, see <a href=\\\"http://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html\\\">Authentication and Access Control for AWS Secrets Manager</a> in the <i>AWS Secrets Manager User Guide</i>.</p>\"\
        }\
      }\
    },\
    \"GetSecretValueRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SecretId\"],\
      \"members\":{\
        \"SecretId\":{\
          \"shape\":\"SecretIdType\",\
          \"documentation\":\"<p>Specifies the secret containing the version that you want to retrieve. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p> <note> <p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN tooâfor example, if you donât include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that youâre specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you donât create secret names ending with a hyphen followed by six characters.</p> <p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p> </note>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"SecretVersionIdType\",\
          \"documentation\":\"<p>Specifies the unique identifier of the version of the secret that you want to retrieve. If you specify this parameter then don't specify <code>VersionStage</code>. If you don't specify either a <code>VersionStage</code> or <code>VersionId</code> then the default is to perform the operation on the version with the <code>VersionStage</code> value of <code>AWSCURRENT</code>.</p> <p>This value is typically a <a href=\\\"https://wikipedia.org/wiki/Universally_unique_identifier\\\">UUID-type</a> value with 32 hexadecimal digits.</p>\"\
        },\
        \"VersionStage\":{\
          \"shape\":\"SecretVersionStageType\",\
          \"documentation\":\"<p>Specifies the secret version that you want to retrieve by the staging label attached to the version.</p> <p>Staging labels are used to keep track of different versions during the rotation process. If you use this parameter then don't specify <code>VersionId</code>. If you don't specify either a <code>VersionStage</code> or <code>VersionId</code>, then the default is to perform the operation on the version with the <code>VersionStage</code> value of <code>AWSCURRENT</code>.</p>\"\
        }\
      }\
    },\
    \"GetSecretValueResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ARN\":{\
          \"shape\":\"SecretARNType\",\
          \"documentation\":\"<p>The ARN of the secret.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"SecretNameType\",\
          \"documentation\":\"<p>The friendly name of the secret.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"SecretVersionIdType\",\
          \"documentation\":\"<p>The unique identifier of this version of the secret.</p>\"\
        },\
        \"SecretBinary\":{\
          \"shape\":\"SecretBinaryType\",\
          \"documentation\":\"<p>The decrypted part of the protected secret information that was originally provided as binary data in the form of a byte array. The response parameter represents the binary data as a <a href=\\\"https://tools.ietf.org/html/rfc4648#section-4\\\">base64-encoded</a> string.</p> <p>This parameter is not used if the secret is created by the Secrets Manager console.</p> <p>If you store custom information in this field of the secret, then you must code your Lambda rotation function to parse and interpret whatever you store in the <code>SecretString</code> or <code>SecretBinary</code> fields.</p>\"\
        },\
        \"SecretString\":{\
          \"shape\":\"SecretStringType\",\
          \"documentation\":\"<p>The decrypted part of the protected secret information that was originally provided as a string.</p> <p>If you create this secret by using the Secrets Manager console then only the <code>SecretString</code> parameter contains data. Secrets Manager stores the information as a JSON structure of key/value pairs that the Lambda rotation function knows how to parse.</p> <p>If you store custom information in the secret by using the <a>CreateSecret</a>, <a>UpdateSecret</a>, or <a>PutSecretValue</a> API operations instead of the Secrets Manager console, or by using the <b>Other secret type</b> in the console, then you must code your Lambda rotation function to parse and interpret those values.</p>\"\
        },\
        \"VersionStages\":{\
          \"shape\":\"SecretVersionStagesType\",\
          \"documentation\":\"<p>A list of all of the staging labels currently attached to this version of the secret.</p>\"\
        },\
        \"CreatedDate\":{\
          \"shape\":\"CreatedDateType\",\
          \"documentation\":\"<p>The date and time that this version of the secret was created.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"IncludeSpaceType\":{\"type\":\"boolean\"},\
    \"InternalServiceError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>An error occurred on the server side.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidNextTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>You provided an invalid <code>NextToken</code> value.</p>\",\
      \"exception\":true\
    },\
    \"InvalidParameterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>You provided an invalid value for a parameter.</p>\",\
      \"exception\":true\
    },\
    \"InvalidRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>You provided a parameter value that is not valid for the current state of the resource.</p> <p>Possible causes:</p> <ul> <li> <p>You tried to perform the operation on a secret that's currently marked deleted.</p> </li> <li> <p>You tried to enable rotation on a secret that doesn't already have a Lambda function ARN configured and you didn't include such an ARN as a parameter in this call. </p> </li> </ul>\",\
      \"exception\":true\
    },\
    \"KmsKeyIdType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":0\
    },\
    \"LastAccessedDateType\":{\"type\":\"timestamp\"},\
    \"LastChangedDateType\":{\"type\":\"timestamp\"},\
    \"LastRotatedDateType\":{\"type\":\"timestamp\"},\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The request failed because it would exceed one of the Secrets Manager internal limits.</p>\",\
      \"exception\":true\
    },\
    \"ListSecretVersionIdsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SecretId\"],\
      \"members\":{\
        \"SecretId\":{\
          \"shape\":\"SecretIdType\",\
          \"documentation\":\"<p>The identifier for the secret containing the versions you want to list. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p> <note> <p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN tooâfor example, if you donât include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that youâre specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you donât create secret names ending with a hyphen followed by six characters.</p> <p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p> </note>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsType\",\
          \"documentation\":\"<p>(Optional) Limits the number of results you want to include in the response. If you don't include this parameter, it defaults to a value that's specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (isn't null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Secrets Manager might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>\",\
          \"box\":true\
        },\
        \"NextToken\":{\
          \"shape\":\"NextTokenType\",\
          \"documentation\":\"<p>(Optional) Use this parameter in a request if you receive a <code>NextToken</code> response in a previous request indicating there's more output available. In a subsequent call, set it to the value of the previous call <code>NextToken</code> response to indicate where the output should continue from.</p>\"\
        },\
        \"IncludeDeprecated\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>(Optional) Specifies that you want the results to include versions that do not have any staging labels attached to them. Such versions are considered deprecated and are subject to deletion by Secrets Manager as needed.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"ListSecretVersionIdsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Versions\":{\
          \"shape\":\"SecretVersionsListType\",\
          \"documentation\":\"<p>The list of the currently available versions of the specified secret.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextTokenType\",\
          \"documentation\":\"<p>If present in the response, this value indicates that there's more output available than included in the current response. This can occur even when the response includes no values at all, such as when you ask for a filtered view of a very long list. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to continue processing and get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back empty (as <code>null</code>).</p>\"\
        },\
        \"ARN\":{\
          \"shape\":\"SecretARNType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the secret.</p> <note> <p>Secrets Manager automatically adds several random characters to the name at the end of the ARN when you initially create a secret. This affects only the ARN and not the actual friendly name. This ensures that if you create a new secret with the same name as an old secret that you previously deleted, then users with access to the old secret <i>don't</i> automatically get access to the new secret because the ARNs are different.</p> </note>\"\
        },\
        \"Name\":{\
          \"shape\":\"SecretNameType\",\
          \"documentation\":\"<p>The friendly name of the secret.</p>\"\
        }\
      }\
    },\
    \"ListSecretsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsType\",\
          \"documentation\":\"<p>(Optional) Limits the number of results you want to include in the response. If you don't include this parameter, it defaults to a value that's specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (isn't null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Secrets Manager might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>\",\
          \"box\":true\
        },\
        \"NextToken\":{\
          \"shape\":\"NextTokenType\",\
          \"documentation\":\"<p>(Optional) Use this parameter in a request if you receive a <code>NextToken</code> response in a previous request indicating there's more output available. In a subsequent call, set it to the value of the previous call <code>NextToken</code> response to indicate where the output should continue from.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"FiltersListType\",\
          \"documentation\":\"<p>Lists the secret request filters.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrderType\",\
          \"documentation\":\"<p>Lists secrets in the requested order. </p>\"\
        }\
      }\
    },\
    \"ListSecretsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecretList\":{\
          \"shape\":\"SecretListType\",\
          \"documentation\":\"<p>A list of the secrets in the account.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextTokenType\",\
          \"documentation\":\"<p>If present in the response, this value indicates that there's more output available than included in the current response. This can occur even when the response includes no values at all, such as when you ask for a filtered view of a very long list. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to continue processing and get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back empty (as <code>null</code>).</p>\"\
        }\
      }\
    },\
    \"MalformedPolicyDocumentException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The policy document that you provided isn't valid.</p>\",\
      \"exception\":true\
    },\
    \"MaxResultsType\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"NameType\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1\
    },\
    \"NextTokenType\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":1\
    },\
    \"NonEmptyResourcePolicyType\":{\
      \"type\":\"string\",\
      \"max\":20480,\
      \"min\":1\
    },\
    \"OwningServiceType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"PasswordLengthType\":{\
      \"type\":\"long\",\
      \"max\":4096,\
      \"min\":1\
    },\
    \"PreconditionNotMetException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The request failed because you did not complete all the prerequisite steps.</p>\",\
      \"exception\":true\
    },\
    \"PublicPolicyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The resource policy did not prevent broad access to the secret.</p>\",\
      \"exception\":true\
    },\
    \"PutResourcePolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SecretId\",\
        \"ResourcePolicy\"\
      ],\
      \"members\":{\
        \"SecretId\":{\
          \"shape\":\"SecretIdType\",\
          \"documentation\":\"<p>Specifies the secret that you want to attach the resource-based policy to. You can specify either the ARN or the friendly name of the secret.</p> <note> <p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN tooâfor example, if you donât include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that youâre specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you donât create secret names ending with a hyphen followed by six characters.</p> <p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p> </note>\"\
        },\
        \"ResourcePolicy\":{\
          \"shape\":\"NonEmptyResourcePolicyType\",\
          \"documentation\":\"<p>A JSON-formatted string that's constructed according to the grammar and syntax for an AWS resource-based policy. The policy in the string identifies who can access or manage this secret and its versions. For information on how to format a JSON parameter for the various command line tool environments, see <a href=\\\"http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json\\\">Using JSON for Parameters</a> in the <i>AWS CLI User Guide</i>.</p>\"\
        },\
        \"BlockPublicPolicy\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Makes an optional API call to Zelkova to validate the Resource Policy to prevent broad access to your secret.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"PutResourcePolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ARN\":{\
          \"shape\":\"SecretARNType\",\
          \"documentation\":\"<p>The ARN of the secret retrieved by the resource-based policy.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"NameType\",\
          \"documentation\":\"<p>The friendly name of the secret that the retrieved by the resource-based policy.</p>\"\
        }\
      }\
    },\
    \"PutSecretValueRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SecretId\"],\
      \"members\":{\
        \"SecretId\":{\
          \"shape\":\"SecretIdType\",\
          \"documentation\":\"<p>Specifies the secret to which you want to add a new version. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret. The secret must already exist.</p> <note> <p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN tooâfor example, if you donât include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that youâre specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you donât create secret names ending with a hyphen followed by six characters.</p> <p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p> </note>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenType\",\
          \"documentation\":\"<p>(Optional) Specifies a unique identifier for the new version of the secret. </p> <note> <p>If you use the AWS CLI or one of the AWS SDK to call this operation, then you can leave this parameter empty. The CLI or SDK generates a random UUID for you and includes that in the request. If you don't use the SDK and instead generate a raw HTTP request to the Secrets Manager service endpoint, then you must generate a <code>ClientRequestToken</code> yourself for new versions and include that value in the request. </p> </note> <p>This value helps ensure idempotency. Secrets Manager uses this value to prevent the accidental creation of duplicate versions if there are failures and retries during the Lambda rotation function's processing. We recommend that you generate a <a href=\\\"https://wikipedia.org/wiki/Universally_unique_identifier\\\">UUID-type</a> value to ensure uniqueness within the specified secret. </p> <ul> <li> <p>If the <code>ClientRequestToken</code> value isn't already associated with a version of the secret then a new version of the secret is created. </p> </li> <li> <p>If a version with this value already exists and that version's <code>SecretString</code> or <code>SecretBinary</code> values are the same as those in the request then the request is ignored (the operation is idempotent). </p> </li> <li> <p>If a version with this value already exists and the version of the <code>SecretString</code> and <code>SecretBinary</code> values are different from those in the request then the request fails because you cannot modify an existing secret version. You can only create new versions to store new secret values.</p> </li> </ul> <p>This value becomes the <code>VersionId</code> of the new version.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"SecretBinary\":{\
          \"shape\":\"SecretBinaryType\",\
          \"documentation\":\"<p>(Optional) Specifies binary data that you want to encrypt and store in the new version of the secret. To use this parameter in the command-line tools, we recommend that you store your binary data in a file and then use the appropriate technique for your tool to pass the contents of the file as a parameter. Either <code>SecretBinary</code> or <code>SecretString</code> must have a value, but not both. They cannot both be empty.</p> <p>This parameter is not accessible if the secret using the Secrets Manager console.</p> <p/>\"\
        },\
        \"SecretString\":{\
          \"shape\":\"SecretStringType\",\
          \"documentation\":\"<p>(Optional) Specifies text data that you want to encrypt and store in this new version of the secret. Either <code>SecretString</code> or <code>SecretBinary</code> must have a value, but not both. They cannot both be empty.</p> <p>If you create this secret by using the Secrets Manager console then Secrets Manager puts the protected secret text in only the <code>SecretString</code> parameter. The Secrets Manager console stores the information as a JSON structure of key/value pairs that the default Lambda rotation function knows how to parse.</p> <p>For storing multiple values, we recommend that you use a JSON text string argument and specify key/value pairs. For information on how to format a JSON parameter for the various command line tool environments, see <a href=\\\"https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json\\\">Using JSON for Parameters</a> in the <i>AWS CLI User Guide</i>.</p> <p> For example:</p> <p> <code>[{\\\"username\\\":\\\"bob\\\"},{\\\"password\\\":\\\"abc123xyz456\\\"}]</code> </p> <p>If your command-line tool or SDK requires quotation marks around the parameter, you should use single quotes to avoid confusion with the double quotes required in the JSON text.</p>\"\
        },\
        \"VersionStages\":{\
          \"shape\":\"SecretVersionStagesType\",\
          \"documentation\":\"<p>(Optional) Specifies a list of staging labels that are attached to this version of the secret. These staging labels are used to track the versions through the rotation process by the Lambda rotation function.</p> <p>A staging label must be unique to a single version of the secret. If you specify a staging label that's already associated with a different version of the same secret then that staging label is automatically removed from the other version and attached to this version.</p> <p>If you do not specify a value for <code>VersionStages</code> then Secrets Manager automatically moves the staging label <code>AWSCURRENT</code> to this new version.</p>\"\
        }\
      }\
    },\
    \"PutSecretValueResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ARN\":{\
          \"shape\":\"SecretARNType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the secret for which you just created a version.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"SecretNameType\",\
          \"documentation\":\"<p>The friendly name of the secret for which you just created or updated a version.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"SecretVersionIdType\",\
          \"documentation\":\"<p>The unique identifier of the version of the secret you just created or updated.</p>\"\
        },\
        \"VersionStages\":{\
          \"shape\":\"SecretVersionStagesType\",\
          \"documentation\":\"<p>The list of staging labels that are currently attached to this version of the secret. Staging labels are used to track a version as it progresses through the secret rotation process.</p>\"\
        }\
      }\
    },\
    \"RandomPasswordType\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":0,\
      \"sensitive\":true\
    },\
    \"RecoveryWindowInDaysType\":{\"type\":\"long\"},\
    \"RequireEachIncludedTypeType\":{\"type\":\"boolean\"},\
    \"ResourceExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>A resource with the ID you requested already exists.</p>\",\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>We can't find the resource that you asked for.</p>\",\
      \"exception\":true\
    },\
    \"RestoreSecretRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SecretId\"],\
      \"members\":{\
        \"SecretId\":{\
          \"shape\":\"SecretIdType\",\
          \"documentation\":\"<p>Specifies the secret that you want to restore from a previously scheduled deletion. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p> <note> <p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN tooâfor example, if you donât include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that youâre specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you donât create secret names ending with a hyphen followed by six characters.</p> <p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p> </note>\"\
        }\
      }\
    },\
    \"RestoreSecretResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ARN\":{\
          \"shape\":\"SecretARNType\",\
          \"documentation\":\"<p>The ARN of the secret that was restored.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"SecretNameType\",\
          \"documentation\":\"<p>The friendly name of the secret that was restored.</p>\"\
        }\
      }\
    },\
    \"RotateSecretRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SecretId\"],\
      \"members\":{\
        \"SecretId\":{\
          \"shape\":\"SecretIdType\",\
          \"documentation\":\"<p>Specifies the secret that you want to rotate. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p> <note> <p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN tooâfor example, if you donât include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that youâre specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you donât create secret names ending with a hyphen followed by six characters.</p> <p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p> </note>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenType\",\
          \"documentation\":\"<p>(Optional) Specifies a unique identifier for the new version of the secret that helps ensure idempotency. </p> <p>If you use the AWS CLI or one of the AWS SDK to call this operation, then you can leave this parameter empty. The CLI or SDK generates a random UUID for you and includes that in the request for this parameter. If you don't use the SDK and instead generate a raw HTTP request to the Secrets Manager service endpoint, then you must generate a <code>ClientRequestToken</code> yourself for new versions and include that value in the request.</p> <p>You only need to specify your own value if you implement your own retry logic and want to ensure that a given secret is not created twice. We recommend that you generate a <a href=\\\"https://wikipedia.org/wiki/Universally_unique_identifier\\\">UUID-type</a> value to ensure uniqueness within the specified secret. </p> <p>Secrets Manager uses this value to prevent the accidental creation of duplicate versions if there are failures and retries during the function's processing. This value becomes the <code>VersionId</code> of the new version.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"RotationLambdaARN\":{\
          \"shape\":\"RotationLambdaARNType\",\
          \"documentation\":\"<p>(Optional) Specifies the ARN of the Lambda function that can rotate the secret.</p>\"\
        },\
        \"RotationRules\":{\
          \"shape\":\"RotationRulesType\",\
          \"documentation\":\"<p>A structure that defines the rotation configuration for this secret.</p>\"\
        }\
      }\
    },\
    \"RotateSecretResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ARN\":{\
          \"shape\":\"SecretARNType\",\
          \"documentation\":\"<p>The ARN of the secret.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"SecretNameType\",\
          \"documentation\":\"<p>The friendly name of the secret.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"SecretVersionIdType\",\
          \"documentation\":\"<p>The ID of the new version of the secret created by the rotation started by this request.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"RotationEnabledType\":{\"type\":\"boolean\"},\
    \"RotationLambdaARNType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":0\
    },\
    \"RotationRulesType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AutomaticallyAfterDays\":{\
          \"shape\":\"AutomaticallyRotateAfterDaysType\",\
          \"documentation\":\"<p>Specifies the number of days between automatic scheduled rotations of the secret.</p> <p>Secrets Manager schedules the next rotation when the previous one is complete. Secrets Manager schedules the date by adding the rotation interval (number of days) to the actual date of the last rotation. The service chooses the hour within that 24-hour date window randomly. The minute is also chosen somewhat randomly, but weighted towards the top of the hour and influenced by a variety of factors that help distribute load.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>A structure that defines the rotation configuration for the secret.</p>\"\
    },\
    \"SecretARNType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20\
    },\
    \"SecretBinaryType\":{\
      \"type\":\"blob\",\
      \"max\":65536,\
      \"min\":0,\
      \"sensitive\":true\
    },\
    \"SecretIdType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"SecretListEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ARN\":{\
          \"shape\":\"SecretARNType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the secret.</p> <p>For more information about ARNs in Secrets Manager, see <a href=\\\"https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#iam-resources\\\">Policy Resources</a> in the <i>AWS Secrets Manager User Guide</i>.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"SecretNameType\",\
          \"documentation\":\"<p>The friendly name of the secret. You can use forward slashes in the name to represent a path hierarchy. For example, <code>/prod/databases/dbserver1</code> could represent the secret for a server named <code>dbserver1</code> in the folder <code>databases</code> in the folder <code>prod</code>. </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"DescriptionType\",\
          \"documentation\":\"<p>The user-provided description of the secret.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyIdType\",\
          \"documentation\":\"<p>The ARN or alias of the AWS KMS customer master key (CMK) used to encrypt the <code>SecretString</code> and <code>SecretBinary</code> fields in each version of the secret. If you don't provide a key, then Secrets Manager defaults to encrypting the secret fields with the default KMS CMK, the key named <code>awssecretsmanager</code>, for this account.</p>\"\
        },\
        \"RotationEnabled\":{\
          \"shape\":\"RotationEnabledType\",\
          \"documentation\":\"<p>Indicates whether automatic, scheduled rotation is enabled for this secret.</p>\",\
          \"box\":true\
        },\
        \"RotationLambdaARN\":{\
          \"shape\":\"RotationLambdaARNType\",\
          \"documentation\":\"<p>The ARN of an AWS Lambda function invoked by Secrets Manager to rotate and expire the secret either automatically per the schedule or manually by a call to <a>RotateSecret</a>.</p>\"\
        },\
        \"RotationRules\":{\
          \"shape\":\"RotationRulesType\",\
          \"documentation\":\"<p>A structure that defines the rotation configuration for the secret.</p>\"\
        },\
        \"LastRotatedDate\":{\
          \"shape\":\"LastRotatedDateType\",\
          \"documentation\":\"<p>The last date and time that the rotation process for this secret was invoked.</p>\",\
          \"box\":true\
        },\
        \"LastChangedDate\":{\
          \"shape\":\"LastChangedDateType\",\
          \"documentation\":\"<p>The last date and time that this secret was modified in any way.</p>\",\
          \"box\":true\
        },\
        \"LastAccessedDate\":{\
          \"shape\":\"LastAccessedDateType\",\
          \"documentation\":\"<p>The last date that this secret was accessed. This value is truncated to midnight of the date and therefore shows only the date, not the time.</p>\",\
          \"box\":true\
        },\
        \"DeletedDate\":{\
          \"shape\":\"DeletedDateType\",\
          \"documentation\":\"<p>The date and time the deletion of the secret occurred. Not present on active secrets. The secret can be recovered until the number of days in the recovery window has passed, as specified in the <code>RecoveryWindowInDays</code> parameter of the <a>DeleteSecret</a> operation.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagListType\",\
          \"documentation\":\"<p>The list of user-defined tags associated with the secret. To add tags to a secret, use <a>TagResource</a>. To remove tags, use <a>UntagResource</a>.</p>\"\
        },\
        \"SecretVersionsToStages\":{\
          \"shape\":\"SecretVersionsToStagesMapType\",\
          \"documentation\":\"<p>A list of all of the currently assigned <code>SecretVersionStage</code> staging labels and the <code>SecretVersionId</code> attached to each one. Staging labels are used to keep track of the different versions during the rotation process.</p> <note> <p>A version that does not have any <code>SecretVersionStage</code> is considered deprecated and subject to deletion. Such versions are not included in this list.</p> </note>\"\
        },\
        \"OwningService\":{\
          \"shape\":\"OwningServiceType\",\
          \"documentation\":\"<p>Returns the name of the service that created the secret.</p>\"\
        },\
        \"CreatedDate\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time when a secret was created.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>A structure that contains the details about a secret. It does not include the encrypted <code>SecretString</code> and <code>SecretBinary</code> values. To get those values, use the <a>GetSecretValue</a> operation.</p>\"\
    },\
    \"SecretListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecretListEntry\"}\
    },\
    \"SecretNameType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"SecretStringType\":{\
      \"type\":\"string\",\
      \"max\":65536,\
      \"min\":0,\
      \"sensitive\":true\
    },\
    \"SecretVersionIdType\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":32\
    },\
    \"SecretVersionStageType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"SecretVersionStagesType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecretVersionStageType\"},\
      \"max\":20,\
      \"min\":1\
    },\
    \"SecretVersionsListEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VersionId\":{\
          \"shape\":\"SecretVersionIdType\",\
          \"documentation\":\"<p>The unique version identifier of this version of the secret.</p>\"\
        },\
        \"VersionStages\":{\
          \"shape\":\"SecretVersionStagesType\",\
          \"documentation\":\"<p>An array of staging labels that are currently associated with this version of the secret.</p>\"\
        },\
        \"LastAccessedDate\":{\
          \"shape\":\"LastAccessedDateType\",\
          \"documentation\":\"<p>The date that this version of the secret was last accessed. Note that the resolution of this field is at the date level and does not include the time.</p>\",\
          \"box\":true\
        },\
        \"CreatedDate\":{\
          \"shape\":\"CreatedDateType\",\
          \"documentation\":\"<p>The date and time this version of the secret was created.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>A structure that contains information about one version of a secret.</p>\"\
    },\
    \"SecretVersionsListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecretVersionsListEntry\"}\
    },\
    \"SecretVersionsToStagesMapType\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"SecretVersionIdType\"},\
      \"value\":{\"shape\":\"SecretVersionStagesType\"}\
    },\
    \"SortOrderType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"asc\",\
        \"desc\"\
      ]\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKeyType\",\
          \"documentation\":\"<p>The key identifier, or name, of the tag.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValueType\",\
          \"documentation\":\"<p>The string value associated with the key of the tag.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure that contains information about a tag.</p>\"\
    },\
    \"TagKeyListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKeyType\"}\
    },\
    \"TagKeyType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"TagListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"}\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SecretId\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"SecretId\":{\
          \"shape\":\"SecretIdType\",\
          \"documentation\":\"<p>The identifier for the secret that you want to attach tags to. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p> <note> <p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN tooâfor example, if you donât include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that youâre specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you donât create secret names ending with a hyphen followed by six characters.</p> <p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p> </note>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagListType\",\
          \"documentation\":\"<p>The tags to attach to the secret. Each element in the list consists of a <code>Key</code> and a <code>Value</code>.</p> <p>This parameter to the API requires a JSON text string argument. For information on how to format a JSON parameter for the various command line tool environments, see <a href=\\\"https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json\\\">Using JSON for Parameters</a> in the <i>AWS CLI User Guide</i>. For the AWS CLI, you can also use the syntax: <code>--Tags Key=\\\"Key1\\\",Value=\\\"Value1\\\",Key=\\\"Key2\\\",Value=\\\"Value2\\\"[,â¦]</code> </p>\"\
        }\
      }\
    },\
    \"TagValueType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"TimestampType\":{\"type\":\"timestamp\"},\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SecretId\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"SecretId\":{\
          \"shape\":\"SecretIdType\",\
          \"documentation\":\"<p>The identifier for the secret that you want to remove tags from. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p> <note> <p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN tooâfor example, if you donât include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that youâre specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you donât create secret names ending with a hyphen followed by six characters.</p> <p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p> </note>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyListType\",\
          \"documentation\":\"<p>A list of tag key names to remove from the secret. You don't specify the value. Both the key and its associated value are removed.</p> <p>This parameter to the API requires a JSON text string argument. For information on how to format a JSON parameter for the various command line tool environments, see <a href=\\\"https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json\\\">Using JSON for Parameters</a> in the <i>AWS CLI User Guide</i>.</p>\"\
        }\
      }\
    },\
    \"UpdateSecretRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SecretId\"],\
      \"members\":{\
        \"SecretId\":{\
          \"shape\":\"SecretIdType\",\
          \"documentation\":\"<p>Specifies the secret that you want to modify or to which you want to add a new version. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p> <note> <p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN tooâfor example, if you donât include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that youâre specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you donât create secret names ending with a hyphen followed by six characters.</p> <p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p> </note>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenType\",\
          \"documentation\":\"<p>(Optional) If you want to add a new version to the secret, this parameter specifies a unique identifier for the new version that helps ensure idempotency. </p> <p>If you use the AWS CLI or one of the AWS SDK to call this operation, then you can leave this parameter empty. The CLI or SDK generates a random UUID for you and includes that in the request. If you don't use the SDK and instead generate a raw HTTP request to the Secrets Manager service endpoint, then you must generate a <code>ClientRequestToken</code> yourself for new versions and include that value in the request.</p> <p>You typically only need to interact with this value if you implement your own retry logic and want to ensure that a given secret is not created twice. We recommend that you generate a <a href=\\\"https://wikipedia.org/wiki/Universally_unique_identifier\\\">UUID-type</a> value to ensure uniqueness within the specified secret. </p> <p>Secrets Manager uses this value to prevent the accidental creation of duplicate versions if there are failures and retries during the Lambda rotation function's processing.</p> <ul> <li> <p>If the <code>ClientRequestToken</code> value isn't already associated with a version of the secret then a new version of the secret is created. </p> </li> <li> <p>If a version with this value already exists and that version's <code>SecretString</code> and <code>SecretBinary</code> values are the same as those in the request then the request is ignored (the operation is idempotent). </p> </li> <li> <p>If a version with this value already exists and that version's <code>SecretString</code> and <code>SecretBinary</code> values are different from the request then an error occurs because you cannot modify an existing secret value.</p> </li> </ul> <p>This value becomes the <code>VersionId</code> of the new version.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"Description\":{\
          \"shape\":\"DescriptionType\",\
          \"documentation\":\"<p>(Optional) Specifies an updated user-provided description of the secret.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyIdType\",\
          \"documentation\":\"<p>(Optional) Specifies an updated ARN or alias of the AWS KMS customer master key (CMK) to be used to encrypt the protected text in new versions of this secret.</p> <important> <p>You can only use the account's default CMK to encrypt and decrypt if you call this operation using credentials from the same account that owns the secret. If the secret is in a different account, then you must create a custom CMK and provide the ARN of that CMK in this field. The user making the call must have permissions to both the secret and the CMK in their respective accounts.</p> </important>\"\
        },\
        \"SecretBinary\":{\
          \"shape\":\"SecretBinaryType\",\
          \"documentation\":\"<p>(Optional) Specifies updated binary data that you want to encrypt and store in the new version of the secret. To use this parameter in the command-line tools, we recommend that you store your binary data in a file and then use the appropriate technique for your tool to pass the contents of the file as a parameter. Either <code>SecretBinary</code> or <code>SecretString</code> must have a value, but not both. They cannot both be empty.</p> <p>This parameter is not accessible using the Secrets Manager console.</p>\"\
        },\
        \"SecretString\":{\
          \"shape\":\"SecretStringType\",\
          \"documentation\":\"<p>(Optional) Specifies updated text data that you want to encrypt and store in this new version of the secret. Either <code>SecretBinary</code> or <code>SecretString</code> must have a value, but not both. They cannot both be empty.</p> <p>If you create this secret by using the Secrets Manager console then Secrets Manager puts the protected secret text in only the <code>SecretString</code> parameter. The Secrets Manager console stores the information as a JSON structure of key/value pairs that the default Lambda rotation function knows how to parse.</p> <p>For storing multiple values, we recommend that you use a JSON text string argument and specify key/value pairs. For information on how to format a JSON parameter for the various command line tool environments, see <a href=\\\"https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json\\\">Using JSON for Parameters</a> in the <i>AWS CLI User Guide</i>. For example:</p> <p> <code>[{\\\"username\\\":\\\"bob\\\"},{\\\"password\\\":\\\"abc123xyz456\\\"}]</code> </p> <p>If your command-line tool or SDK requires quotation marks around the parameter, you should use single quotes to avoid confusion with the double quotes required in the JSON text. You can also 'escape' the double quote character in the embedded JSON text by prefacing each with a backslash. For example, the following string is surrounded by double-quotes. All of the embedded double quotes are escaped:</p> <p> <code>\\\"[{\\\\\\\"username\\\\\\\":\\\\\\\"bob\\\\\\\"},{\\\\\\\"password\\\\\\\":\\\\\\\"abc123xyz456\\\\\\\"}]\\\"</code> </p>\"\
        }\
      }\
    },\
    \"UpdateSecretResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ARN\":{\
          \"shape\":\"SecretARNType\",\
          \"documentation\":\"<p>The ARN of the secret that was updated.</p> <note> <p>Secrets Manager automatically adds several random characters to the name at the end of the ARN when you initially create a secret. This affects only the ARN and not the actual friendly name. This ensures that if you create a new secret with the same name as an old secret that you previously deleted, then users with access to the old secret <i>don't</i> automatically get access to the new secret because the ARNs are different.</p> </note>\"\
        },\
        \"Name\":{\
          \"shape\":\"SecretNameType\",\
          \"documentation\":\"<p>The friendly name of the secret that was updated.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"SecretVersionIdType\",\
          \"documentation\":\"<p>If a new version of the secret was created by this operation, then <code>VersionId</code> contains the unique identifier of the new version.</p>\"\
        }\
      }\
    },\
    \"UpdateSecretVersionStageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SecretId\",\
        \"VersionStage\"\
      ],\
      \"members\":{\
        \"SecretId\":{\
          \"shape\":\"SecretIdType\",\
          \"documentation\":\"<p>Specifies the secret with the version with the list of staging labels you want to modify. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p> <note> <p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN tooâfor example, if you donât include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that youâre specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you donât create secret names ending with a hyphen followed by six characters.</p> <p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p> </note>\"\
        },\
        \"VersionStage\":{\
          \"shape\":\"SecretVersionStageType\",\
          \"documentation\":\"<p>The staging label to add to this version.</p>\"\
        },\
        \"RemoveFromVersionId\":{\
          \"shape\":\"SecretVersionIdType\",\
          \"documentation\":\"<p>Specifies the secret version ID of the version that the staging label is to be removed from. If the staging label you are trying to attach to one version is already attached to a different version, then you must include this parameter and specify the version that the label is to be removed from. If the label is attached and you either do not specify this parameter, or the version ID does not match, then the operation fails.</p>\",\
          \"box\":true\
        },\
        \"MoveToVersionId\":{\
          \"shape\":\"SecretVersionIdType\",\
          \"documentation\":\"<p>(Optional) The secret version ID that you want to add the staging label. If you want to remove a label from a version, then do not specify this parameter.</p> <p>If the staging label is already attached to a different version of the secret, then you must also specify the <code>RemoveFromVersionId</code> parameter. </p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"UpdateSecretVersionStageResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ARN\":{\
          \"shape\":\"SecretARNType\",\
          \"documentation\":\"<p>The ARN of the secret with the modified staging label.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"SecretNameType\",\
          \"documentation\":\"<p>The friendly name of the secret with the modified staging label.</p>\"\
        }\
      }\
    },\
    \"ValidateResourcePolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourcePolicy\"],\
      \"members\":{\
        \"SecretId\":{\
          \"shape\":\"SecretIdType\",\
          \"documentation\":\"<p> The identifier for the secret that you want to validate a resource policy. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p> <note> <p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN tooâfor example, if you donât include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that youâre specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you donât create secret names ending with a hyphen followed by six characters.</p> <p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p> </note>\"\
        },\
        \"ResourcePolicy\":{\
          \"shape\":\"NonEmptyResourcePolicyType\",\
          \"documentation\":\"<p>Identifies the Resource Policy attached to the secret.</p>\"\
        }\
      }\
    },\
    \"ValidateResourcePolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyValidationPassed\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Returns a message stating that your Reource Policy passed validation. </p>\"\
        },\
        \"ValidationErrors\":{\
          \"shape\":\"ValidationErrorsType\",\
          \"documentation\":\"<p>Returns an error message if your policy doesn't pass validatation.</p>\"\
        }\
      }\
    },\
    \"ValidationErrorsEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CheckName\":{\
          \"shape\":\"NameType\",\
          \"documentation\":\"<p>Checks the name of the policy.</p>\"\
        },\
        \"ErrorMessage\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Displays error messages if validation encounters problems during validation of the resource policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Displays errors that occurred during validation of the resource policy.</p>\"\
    },\
    \"ValidationErrorsType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ValidationErrorsEntry\"}\
    }\
  },\
  \"documentation\":\"<fullname>AWS Secrets Manager API Reference</fullname> <p>AWS Secrets Manager provides a service to enable you to store, manage, and retrieve, secrets.</p> <p>This guide provides descriptions of the Secrets Manager API. For more information about using this service, see the <a href=\\\"https://docs.aws.amazon.com/secretsmanager/latest/userguide/introduction.html\\\">AWS Secrets Manager User Guide</a>.</p> <p> <b>API Version</b> </p> <p>This version of the Secrets Manager API Reference documents the Secrets Manager API version 2017-10-17.</p> <note> <p>As an alternative to using the API, you can use one of the AWS SDKs, which consist of libraries and sample code for various programming languages and platforms such as Java, Ruby, .NET, iOS, and Android. The SDKs provide a convenient way to create programmatic access to AWS Secrets Manager. For example, the SDKs provide cryptographically signing requests, managing errors, and retrying requests automatically. For more information about the AWS SDKs, including downloading and installing them, see <a href=\\\"http://aws.amazon.com/tools/\\\">Tools for Amazon Web Services</a>.</p> </note> <p>We recommend you use the AWS SDKs to make programmatic API calls to Secrets Manager. However, you also can use the Secrets Manager HTTP Query API to make direct calls to the Secrets Manager web service. To learn more about the Secrets Manager HTTP Query API, see <a href=\\\"https://docs.aws.amazon.com/secretsmanager/latest/userguide/query-requests.html\\\">Making Query Requests</a> in the <i>AWS Secrets Manager User Guide</i>. </p> <p>Secrets Manager API supports GET and POST requests for all actions, and doesn't require you to use GET for some actions and POST for others. However, GET requests are subject to the limitation size of a URL. Therefore, for operations that require larger sizes, use a POST request.</p> <p> <b>Support and Feedback for AWS Secrets Manager</b> </p> <p>We welcome your feedback. Send your comments to <a href=\\\"mailto:awssecretsmanager-feedback@amazon.com\\\">awssecretsmanager-feedback@amazon.com</a>, or post your feedback and questions in the <a href=\\\"http://forums.aws.amazon.com/forum.jspa?forumID=296\\\">AWS Secrets Manager Discussion Forum</a>. For more information about the AWS Discussion Forums, see <a href=\\\"http://forums.aws.amazon.com/help.jspa\\\">Forums Help</a>.</p> <p> <b>How examples are presented</b> </p> <p>The JSON that AWS Secrets Manager expects as your request parameters and the service returns as a response to HTTP query requests contain single, long strings without line breaks or white space formatting. The JSON shown in the examples displays the code formatted with both line breaks and white space to improve readability. When example input parameters can also cause long strings extending beyond the screen, you can insert line breaks to enhance readability. You should always submit the input as a single JSON text string.</p> <p> <b>Logging API Requests</b> </p> <p>AWS Secrets Manager supports AWS CloudTrail, a service that records AWS API calls for your AWS account and delivers log files to an Amazon S3 bucket. By using information that's collected by AWS CloudTrail, you can determine the requests successfully made to Secrets Manager, who made the request, when it was made, and so on. For more about AWS Secrets Manager and support for AWS CloudTrail, see <a href=\\\"http://docs.aws.amazon.com/secretsmanager/latest/userguide/monitoring.html#monitoring_cloudtrail\\\">Logging AWS Secrets Manager Events with AWS CloudTrail</a> in the <i>AWS Secrets Manager User Guide</i>. To learn more about CloudTrail, including enabling it and find your log files, see the <a href=\\\"https://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html\\\">AWS CloudTrail User Guide</a>.</p>\"\
}\
";
}

@end
