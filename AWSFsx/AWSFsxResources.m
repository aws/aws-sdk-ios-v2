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

#import "AWSFsxResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSFsxResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSFsxResources

+ (instancetype)sharedInstance {
    static AWSFsxResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSFsxResources new];
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
    \"apiVersion\":\"2018-03-01\",\
    \"endpointPrefix\":\"fsx\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon FSx\",\
    \"serviceId\":\"FSx\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"fsx\",\
    \"targetPrefix\":\"AWSSimbaAPIService_v20180301\",\
    \"uid\":\"fsx-2018-03-01\"\
  },\
  \"operations\":{\
    \"CancelDataRepositoryTask\":{\
      \"name\":\"CancelDataRepositoryTask\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelDataRepositoryTaskRequest\"},\
      \"output\":{\"shape\":\"CancelDataRepositoryTaskResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequest\"},\
        {\"shape\":\"UnsupportedOperation\"},\
        {\"shape\":\"DataRepositoryTaskNotFound\"},\
        {\"shape\":\"DataRepositoryTaskEnded\"},\
        {\"shape\":\"InternalServerError\"}\
      ],\
      \"documentation\":\"<p>Cancels an existing Amazon FSx for Lustre data repository task if that task is in either the <code>PENDING</code> or <code>EXECUTING</code> state. When you cancel a task, Amazon FSx does the following.</p> <ul> <li> <p>Any files that FSx has already exported are not reverted.</p> </li> <li> <p>FSx continues to export any files that are \\\"in-flight\\\" when the cancel operation is received.</p> </li> <li> <p>FSx does not export any files that have not yet been exported.</p> </li> </ul>\",\
      \"idempotent\":true\
    },\
    \"CreateBackup\":{\
      \"name\":\"CreateBackup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateBackupRequest\"},\
      \"output\":{\"shape\":\"CreateBackupResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequest\"},\
        {\"shape\":\"UnsupportedOperation\"},\
        {\"shape\":\"FileSystemNotFound\"},\
        {\"shape\":\"BackupInProgress\"},\
        {\"shape\":\"IncompatibleParameterError\"},\
        {\"shape\":\"ServiceLimitExceeded\"},\
        {\"shape\":\"InternalServerError\"}\
      ],\
      \"documentation\":\"<p>Creates a backup of an existing Amazon FSx for Windows File Server file system. Creating regular backups for your file system is a best practice that complements the replication that Amazon FSx for Windows File Server performs for your file system. It also enables you to restore from user modification of data.</p> <p>If a backup with the specified client request token exists, and the parameters match, this operation returns the description of the existing backup. If a backup specified client request token exists, and the parameters don't match, this operation returns <code>IncompatibleParameterError</code>. If a backup with the specified client request token doesn't exist, <code>CreateBackup</code> does the following: </p> <ul> <li> <p>Creates a new Amazon FSx backup with an assigned ID, and an initial lifecycle state of <code>CREATING</code>.</p> </li> <li> <p>Returns the description of the backup.</p> </li> </ul> <p>By using the idempotent operation, you can retry a <code>CreateBackup</code> operation without the risk of creating an extra backup. This approach can be useful when an initial call fails in a way that makes it unclear whether a backup was created. If you use the same client request token and the initial call created a backup, the operation returns a successful result because all the parameters are the same.</p> <p>The <code>CreateFileSystem</code> operation returns while the backup's lifecycle state is still <code>CREATING</code>. You can check the file system creation status by calling the <a>DescribeBackups</a> operation, which returns the backup state along with other information.</p> <note> <p/> </note>\",\
      \"idempotent\":true\
    },\
    \"CreateDataRepositoryTask\":{\
      \"name\":\"CreateDataRepositoryTask\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateDataRepositoryTaskRequest\"},\
      \"output\":{\"shape\":\"CreateDataRepositoryTaskResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequest\"},\
        {\"shape\":\"UnsupportedOperation\"},\
        {\"shape\":\"FileSystemNotFound\"},\
        {\"shape\":\"IncompatibleParameterError\"},\
        {\"shape\":\"ServiceLimitExceeded\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"DataRepositoryTaskExecuting\"}\
      ],\
      \"documentation\":\"<p>Creates an Amazon FSx for Lustre data repository task. You use data repository tasks to perform bulk operations between your Amazon FSx file system and its linked data repository. An example of a data repository task is exporting any data and metadata changes, including POSIX metadata, to files, directories, and symbolic links (symlinks) from your FSx file system to its linked data repository. A <code>CreateDataRepositoryTask</code> operation will fail if a data repository is not linked to the FSx file system. To learn more about data repository tasks, see <a href=\\\"https://docs.aws.amazon.com/fsx/latest/LustreGuide/data-repository-tasks.html\\\">Using Data Repository Tasks</a>. To learn more about linking a data repository to your file system, see <a href=\\\"https://docs.aws.amazon.com/fsx/latest/LustreGuide/export-data-repository.html#export-prefix\\\">Setting the Export Prefix</a>.</p>\",\
      \"idempotent\":true\
    },\
    \"CreateFileSystem\":{\
      \"name\":\"CreateFileSystem\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateFileSystemRequest\"},\
      \"output\":{\"shape\":\"CreateFileSystemResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequest\"},\
        {\"shape\":\"ActiveDirectoryError\"},\
        {\"shape\":\"IncompatibleParameterError\"},\
        {\"shape\":\"InvalidImportPath\"},\
        {\"shape\":\"InvalidExportPath\"},\
        {\"shape\":\"InvalidNetworkSettings\"},\
        {\"shape\":\"InvalidPerUnitStorageThroughput\"},\
        {\"shape\":\"ServiceLimitExceeded\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"MissingFileSystemConfiguration\"}\
      ],\
      \"documentation\":\"<p>Creates a new, empty Amazon FSx file system.</p> <p>If a file system with the specified client request token exists and the parameters match, <code>CreateFileSystem</code> returns the description of the existing file system. If a file system specified client request token exists and the parameters don't match, this call returns <code>IncompatibleParameterError</code>. If a file system with the specified client request token doesn't exist, <code>CreateFileSystem</code> does the following: </p> <ul> <li> <p>Creates a new, empty Amazon FSx file system with an assigned ID, and an initial lifecycle state of <code>CREATING</code>.</p> </li> <li> <p>Returns the description of the file system.</p> </li> </ul> <p>This operation requires a client request token in the request that Amazon FSx uses to ensure idempotent creation. This means that calling the operation multiple times with the same client request token has no effect. By using the idempotent operation, you can retry a <code>CreateFileSystem</code> operation without the risk of creating an extra file system. This approach can be useful when an initial call fails in a way that makes it unclear whether a file system was created. Examples are if a transport level timeout occurred, or your connection was reset. If you use the same client request token and the initial call created a file system, the client receives success as long as the parameters are the same.</p> <note> <p>The <code>CreateFileSystem</code> call returns while the file system's lifecycle state is still <code>CREATING</code>. You can check the file-system creation status by calling the <a>DescribeFileSystems</a> operation, which returns the file system state along with other information.</p> </note>\"\
    },\
    \"CreateFileSystemFromBackup\":{\
      \"name\":\"CreateFileSystemFromBackup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateFileSystemFromBackupRequest\"},\
      \"output\":{\"shape\":\"CreateFileSystemFromBackupResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequest\"},\
        {\"shape\":\"ActiveDirectoryError\"},\
        {\"shape\":\"IncompatibleParameterError\"},\
        {\"shape\":\"InvalidNetworkSettings\"},\
        {\"shape\":\"ServiceLimitExceeded\"},\
        {\"shape\":\"BackupNotFound\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"MissingFileSystemConfiguration\"}\
      ],\
      \"documentation\":\"<p>Creates a new Amazon FSx file system from an existing Amazon FSx for Windows File Server backup.</p> <p>If a file system with the specified client request token exists and the parameters match, this operation returns the description of the file system. If a client request token specified by the file system exists and the parameters don't match, this call returns <code>IncompatibleParameterError</code>. If a file system with the specified client request token doesn't exist, this operation does the following:</p> <ul> <li> <p>Creates a new Amazon FSx file system from backup with an assigned ID, and an initial lifecycle state of <code>CREATING</code>.</p> </li> <li> <p>Returns the description of the file system.</p> </li> </ul> <p>Parameters like Active Directory, default share name, automatic backup, and backup settings default to the parameters of the file system that was backed up, unless overridden. You can explicitly supply other settings.</p> <p>By using the idempotent operation, you can retry a <code>CreateFileSystemFromBackup</code> call without the risk of creating an extra file system. This approach can be useful when an initial call fails in a way that makes it unclear whether a file system was created. Examples are if a transport level timeout occurred, or your connection was reset. If you use the same client request token and the initial call created a file system, the client receives success as long as the parameters are the same.</p> <note> <p>The <code>CreateFileSystemFromBackup</code> call returns while the file system's lifecycle state is still <code>CREATING</code>. You can check the file-system creation status by calling the <a>DescribeFileSystems</a> operation, which returns the file system state along with other information.</p> </note>\"\
    },\
    \"DeleteBackup\":{\
      \"name\":\"DeleteBackup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteBackupRequest\"},\
      \"output\":{\"shape\":\"DeleteBackupResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequest\"},\
        {\"shape\":\"BackupInProgress\"},\
        {\"shape\":\"BackupNotFound\"},\
        {\"shape\":\"BackupRestoring\"},\
        {\"shape\":\"IncompatibleParameterError\"},\
        {\"shape\":\"InternalServerError\"}\
      ],\
      \"documentation\":\"<p>Deletes an Amazon FSx for Windows File Server backup, deleting its contents. After deletion, the backup no longer exists, and its data is gone.</p> <p>The <code>DeleteBackup</code> call returns instantly. The backup will not show up in later <code>DescribeBackups</code> calls.</p> <important> <p>The data in a deleted backup is also deleted and can't be recovered by any means.</p> </important>\",\
      \"idempotent\":true\
    },\
    \"DeleteFileSystem\":{\
      \"name\":\"DeleteFileSystem\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteFileSystemRequest\"},\
      \"output\":{\"shape\":\"DeleteFileSystemResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequest\"},\
        {\"shape\":\"IncompatibleParameterError\"},\
        {\"shape\":\"FileSystemNotFound\"},\
        {\"shape\":\"ServiceLimitExceeded\"},\
        {\"shape\":\"InternalServerError\"}\
      ],\
      \"documentation\":\"<p>Deletes a file system, deleting its contents. After deletion, the file system no longer exists, and its data is gone. Any existing automatic backups will also be deleted.</p> <p>By default, when you delete an Amazon FSx for Windows File Server file system, a final backup is created upon deletion. This final backup is not subject to the file system's retention policy, and must be manually deleted.</p> <p>The <code>DeleteFileSystem</code> action returns while the file system has the <code>DELETING</code> status. You can check the file system deletion status by calling the <a>DescribeFileSystems</a> action, which returns a list of file systems in your account. If you pass the file system ID for a deleted file system, the <a>DescribeFileSystems</a> returns a <code>FileSystemNotFound</code> error.</p> <note> <p>Deleting an Amazon FSx for Lustre file system will fail with a 400 BadRequest if a data repository task is in a <code>PENDING</code> or <code>EXECUTING</code> state.</p> </note> <important> <p>The data in a deleted file system is also deleted and can't be recovered by any means.</p> </important>\",\
      \"idempotent\":true\
    },\
    \"DescribeBackups\":{\
      \"name\":\"DescribeBackups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeBackupsRequest\"},\
      \"output\":{\"shape\":\"DescribeBackupsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequest\"},\
        {\"shape\":\"FileSystemNotFound\"},\
        {\"shape\":\"BackupNotFound\"},\
        {\"shape\":\"InternalServerError\"}\
      ],\
      \"documentation\":\"<p>Returns the description of specific Amazon FSx for Windows File Server backups, if a <code>BackupIds</code> value is provided for that backup. Otherwise, it returns all backups owned by your AWS account in the AWS Region of the endpoint that you're calling.</p> <p>When retrieving all backups, you can optionally specify the <code>MaxResults</code> parameter to limit the number of backups in a response. If more backups remain, Amazon FSx returns a <code>NextToken</code> value in the response. In this case, send a later request with the <code>NextToken</code> request parameter set to the value of <code>NextToken</code> from the last response.</p> <p>This action is used in an iterative process to retrieve a list of your backups. <code>DescribeBackups</code> is called first without a <code>NextToken</code>value. Then the action continues to be called with the <code>NextToken</code> parameter set to the value of the last <code>NextToken</code> value until a response has no <code>NextToken</code>.</p> <p>When using this action, keep the following in mind:</p> <ul> <li> <p>The implementation might return fewer than <code>MaxResults</code> file system descriptions while still including a <code>NextToken</code> value.</p> </li> <li> <p>The order of backups returned in the response of one <code>DescribeBackups</code> call and the order of backups returned across the responses of a multi-call iteration is unspecified.</p> </li> </ul>\"\
    },\
    \"DescribeDataRepositoryTasks\":{\
      \"name\":\"DescribeDataRepositoryTasks\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDataRepositoryTasksRequest\"},\
      \"output\":{\"shape\":\"DescribeDataRepositoryTasksResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequest\"},\
        {\"shape\":\"FileSystemNotFound\"},\
        {\"shape\":\"DataRepositoryTaskNotFound\"},\
        {\"shape\":\"InternalServerError\"}\
      ],\
      \"documentation\":\"<p>Returns the description of specific Amazon FSx for Lustre data repository tasks, if one or more <code>TaskIds</code> values are provided in the request, or if filters are used in the request. You can use filters to narrow the response to include just tasks for specific file systems, or tasks in a specific lifecycle state. Otherwise, it returns all data repository tasks owned by your AWS account in the AWS Region of the endpoint that you're calling.</p> <p>When retrieving all tasks, you can paginate the response by using the optional <code>MaxResults</code> parameter to limit the number of tasks returned in a response. If more tasks remain, Amazon FSx returns a <code>NextToken</code> value in the response. In this case, send a later request with the <code>NextToken</code> request parameter set to the value of <code>NextToken</code> from the last response.</p>\"\
    },\
    \"DescribeFileSystems\":{\
      \"name\":\"DescribeFileSystems\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeFileSystemsRequest\"},\
      \"output\":{\"shape\":\"DescribeFileSystemsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequest\"},\
        {\"shape\":\"FileSystemNotFound\"},\
        {\"shape\":\"InternalServerError\"}\
      ],\
      \"documentation\":\"<p>Returns the description of specific Amazon FSx file systems, if a <code>FileSystemIds</code> value is provided for that file system. Otherwise, it returns descriptions of all file systems owned by your AWS account in the AWS Region of the endpoint that you're calling.</p> <p>When retrieving all file system descriptions, you can optionally specify the <code>MaxResults</code> parameter to limit the number of descriptions in a response. If more file system descriptions remain, Amazon FSx returns a <code>NextToken</code> value in the response. In this case, send a later request with the <code>NextToken</code> request parameter set to the value of <code>NextToken</code> from the last response.</p> <p>This action is used in an iterative process to retrieve a list of your file system descriptions. <code>DescribeFileSystems</code> is called first without a <code>NextToken</code>value. Then the action continues to be called with the <code>NextToken</code> parameter set to the value of the last <code>NextToken</code> value until a response has no <code>NextToken</code>.</p> <p>When using this action, keep the following in mind:</p> <ul> <li> <p>The implementation might return fewer than <code>MaxResults</code> file system descriptions while still including a <code>NextToken</code> value.</p> </li> <li> <p>The order of file systems returned in the response of one <code>DescribeFileSystems</code> call and the order of file systems returned across the responses of a multicall iteration is unspecified.</p> </li> </ul>\"\
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
        {\"shape\":\"BadRequest\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ResourceNotFound\"},\
        {\"shape\":\"NotServiceResourceError\"},\
        {\"shape\":\"ResourceDoesNotSupportTagging\"}\
      ],\
      \"documentation\":\"<p>Lists tags for an Amazon FSx file systems and backups in the case of Amazon FSx for Windows File Server.</p> <p>When retrieving all tags, you can optionally specify the <code>MaxResults</code> parameter to limit the number of tags in a response. If more tags remain, Amazon FSx returns a <code>NextToken</code> value in the response. In this case, send a later request with the <code>NextToken</code> request parameter set to the value of <code>NextToken</code> from the last response.</p> <p>This action is used in an iterative process to retrieve a list of your tags. <code>ListTagsForResource</code> is called first without a <code>NextToken</code>value. Then the action continues to be called with the <code>NextToken</code> parameter set to the value of the last <code>NextToken</code> value until a response has no <code>NextToken</code>.</p> <p>When using this action, keep the following in mind:</p> <ul> <li> <p>The implementation might return fewer than <code>MaxResults</code> file system descriptions while still including a <code>NextToken</code> value.</p> </li> <li> <p>The order of tags returned in the response of one <code>ListTagsForResource</code> call and the order of tags returned across the responses of a multi-call iteration is unspecified.</p> </li> </ul>\"\
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
        {\"shape\":\"BadRequest\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ResourceNotFound\"},\
        {\"shape\":\"NotServiceResourceError\"},\
        {\"shape\":\"ResourceDoesNotSupportTagging\"}\
      ],\
      \"documentation\":\"<p>Tags an Amazon FSx resource.</p>\",\
      \"idempotent\":true\
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
        {\"shape\":\"BadRequest\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ResourceNotFound\"},\
        {\"shape\":\"NotServiceResourceError\"},\
        {\"shape\":\"ResourceDoesNotSupportTagging\"}\
      ],\
      \"documentation\":\"<p>This action removes a tag from an Amazon FSx resource.</p>\",\
      \"idempotent\":true\
    },\
    \"UpdateFileSystem\":{\
      \"name\":\"UpdateFileSystem\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateFileSystemRequest\"},\
      \"output\":{\"shape\":\"UpdateFileSystemResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequest\"},\
        {\"shape\":\"UnsupportedOperation\"},\
        {\"shape\":\"IncompatibleParameterError\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"FileSystemNotFound\"},\
        {\"shape\":\"MissingFileSystemConfiguration\"},\
        {\"shape\":\"ServiceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Use this operation to update the configuration of an existing Amazon FSx file system. For an Amazon FSx for Lustre file system, you can update only the WeeklyMaintenanceStartTime. For an Amazon for Windows File Server file system, you can update the following properties:</p> <ul> <li> <p>AutomaticBackupRetentionDays</p> </li> <li> <p>DailyAutomaticBackupStartTime</p> </li> <li> <p>SelfManagedActiveDirectoryConfiguration</p> </li> <li> <p>StorageCapacity</p> </li> <li> <p>ThroughputCapacity</p> </li> <li> <p>WeeklyMaintenanceStartTime</p> </li> </ul> <p>You can update multiple properties in a single request.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AWSAccountId\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>An AWS account ID. This ID is a 12-digit number that you use to construct Amazon Resource Names (ARNs) for resources.</p>\",\
      \"max\":12,\
      \"min\":12,\
      \"pattern\":\"^\\\\d{12}$\"\
    },\
    \"ActiveDirectoryBackupAttributes\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"ActiveDirectoryFullyQualifiedName\",\
          \"documentation\":\"<p>The fully qualified domain name of the self-managed AD directory.</p>\"\
        },\
        \"ActiveDirectoryId\":{\
          \"shape\":\"DirectoryId\",\
          \"documentation\":\"<p>The ID of the AWS Managed Microsoft Active Directory instance to which the file system is joined.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Microsoft AD attributes of the Amazon FSx for Windows File Server file system.</p>\"\
    },\
    \"ActiveDirectoryError\":{\
      \"type\":\"structure\",\
      \"required\":[\"ActiveDirectoryId\"],\
      \"members\":{\
        \"ActiveDirectoryId\":{\
          \"shape\":\"DirectoryId\",\
          \"documentation\":\"<p>The directory ID of the directory that an error pertains to.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"ActiveDirectoryErrorType\",\
          \"documentation\":\"<p>The type of Active Directory error.</p>\"\
        },\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>An Active Directory error.</p>\",\
      \"exception\":true\
    },\
    \"ActiveDirectoryErrorType\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The type of error relating to Microsoft Active Directory. NOT_FOUND means that no directory was found by specifying the given directory. INCOMPATIBLE_MODE means that the directory specified is not a Microsoft AD directory. WRONG_VPC means that the specified directory isn't accessible from the specified VPC. WRONG_STAGE means that the specified directory isn't currently in the ACTIVE state.</p>\",\
      \"enum\":[\
        \"DOMAIN_NOT_FOUND\",\
        \"INCOMPATIBLE_DOMAIN_MODE\",\
        \"WRONG_VPC\",\
        \"INVALID_DOMAIN_STAGE\"\
      ]\
    },\
    \"ActiveDirectoryFullyQualifiedName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\"^.{1,255}$\"\
    },\
    \"AdministrativeAction\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AdministrativeActionType\":{\"shape\":\"AdministrativeActionType\"},\
        \"ProgressPercent\":{\
          \"shape\":\"ProgressPercent\",\
          \"documentation\":\"<p>Provides the percent complete of a <code>STORAGE_OPTIMIZATION</code> administrative action.</p>\"\
        },\
        \"RequestTime\":{\
          \"shape\":\"RequestTime\",\
          \"documentation\":\"<p>Time that the administrative action request was received.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"Status\",\
          \"documentation\":\"<p>Describes the status of the administrative action, as follows:</p> <ul> <li> <p> <code>FAILED</code> - Amazon FSx failed to process the administrative action successfully.</p> </li> <li> <p> <code>IN_PROGRESS</code> - Amazon FSx is processing the administrative action.</p> </li> <li> <p> <code>PENDING</code> - Amazon FSx is waiting to process the administrative action.</p> </li> <li> <p> <code>COMPLETED</code> - Amazon FSx has finished processing the administrative task.</p> </li> <li> <p> <code>UPDATED_OPTIMIZING</code> - For a storage capacity increase update, Amazon FSx has updated the file system with the new storage capacity, and is now performing the storage optimization process. For more information, see <a href=\\\"https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-storage-capacity.html\\\">Managing Storage Capacity</a>.</p> </li> </ul>\"\
        },\
        \"TargetFileSystemValues\":{\
          \"shape\":\"FileSystem\",\
          \"documentation\":\"<p>Describes the target <code>StorageCapacity</code> or <code>ThroughputCapacity</code> value provided in the <code>UpdateFileSystem</code> operation. Returned for <code>FILE_SYSTEM_UPDATE</code> administrative actions. </p>\"\
        },\
        \"FailureDetails\":{\"shape\":\"AdministrativeActionFailureDetails\"}\
      },\
      \"documentation\":\"<p>Describes a specific Amazon FSx Administrative Action for the current Windows file system.</p>\"\
    },\
    \"AdministrativeActionFailureDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Error message providing details about the failure.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a failed administrative action.</p>\"\
    },\
    \"AdministrativeActionType\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>Describes the type of administrative action, as follows:</p> <ul> <li> <p> <code>FILE_SYSTEM_UPDATE</code> - A file system update administrative action initiated by the user from the Amazon FSx console, API (UpdateFileSystem), or CLI (update-file-system). A</p> </li> <li> <p> <code>STORAGE_OPTIMIZATION</code> - Once the <code>FILE_SYSTEM_UPDATE</code> task to increase a file system's storage capacity completes successfully, a <code>STORAGE_OPTIMIZATION</code> task starts. Storage optimization is the process of migrating the file system data to the new, larger disks. You can track the storage migration progress using the <code>ProgressPercent</code> property. When <code>STORAGE_OPTIMIZATION</code> completes successfully, the parent <code>FILE_SYSTEM_UPDATE</code> action status changes to <code>COMPLETED</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-storage-capacity.html\\\">Managing Storage Capacity</a>. </p> </li> </ul>\",\
      \"enum\":[\
        \"FILE_SYSTEM_UPDATE\",\
        \"STORAGE_OPTIMIZATION\"\
      ]\
    },\
    \"AdministrativeActions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AdministrativeAction\"},\
      \"max\":50\
    },\
    \"ArchivePath\":{\
      \"type\":\"string\",\
      \"max\":900,\
      \"min\":3,\
      \"pattern\":\"^.{3,900}$\"\
    },\
    \"AutomaticBackupRetentionDays\":{\
      \"type\":\"integer\",\
      \"documentation\":\"<p>The number of days to retain automatic backups. Setting this to 0 disables automatic backups. You can retain automatic backups for a maximum of 35 days.</p>\",\
      \"max\":35,\
      \"min\":0\
    },\
    \"Backup\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BackupId\",\
        \"Lifecycle\",\
        \"Type\",\
        \"CreationTime\",\
        \"FileSystem\"\
      ],\
      \"members\":{\
        \"BackupId\":{\
          \"shape\":\"BackupId\",\
          \"documentation\":\"<p>The ID of the backup.</p>\"\
        },\
        \"Lifecycle\":{\
          \"shape\":\"BackupLifecycle\",\
          \"documentation\":\"<p>The lifecycle status of the backup.</p>\"\
        },\
        \"FailureDetails\":{\
          \"shape\":\"BackupFailureDetails\",\
          \"documentation\":\"<p>Details explaining any failures that occur when creating a backup.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"BackupType\",\
          \"documentation\":\"<p>The type of the backup.</p>\"\
        },\
        \"ProgressPercent\":{\"shape\":\"ProgressPercent\"},\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>The time when a particular backup was created.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The ID of the AWS Key Management Service (AWS KMS) key used to encrypt this backup of the Amazon FSx for Windows file system's data at rest. Amazon FSx for Lustre does not support KMS encryption.</p>\"\
        },\
        \"ResourceARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the backup resource.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>Tags associated with a particular file system.</p>\"\
        },\
        \"FileSystem\":{\
          \"shape\":\"FileSystem\",\
          \"documentation\":\"<p>Metadata of the file system associated with the backup. This metadata is persisted even if the file system is deleted.</p>\"\
        },\
        \"DirectoryInformation\":{\
          \"shape\":\"ActiveDirectoryBackupAttributes\",\
          \"documentation\":\"<p>The configuration of the self-managed Microsoft Active Directory (AD) to which the Windows File Server instance is joined.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A backup of an Amazon FSx for Windows File Server file system. You can create a new file system from a backup to protect against data loss.</p>\"\
    },\
    \"BackupFailureDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>A message describing the backup creation failure.</p>\"\
        }\
      },\
      \"documentation\":\"<p>If backup creation fails, this structure contains the details of that failure.</p>\"\
    },\
    \"BackupId\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The ID of the backup. Specifies the backup to use if you're creating a file system from an existing backup.</p>\",\
      \"max\":128,\
      \"min\":12,\
      \"pattern\":\"^(backup-[0-9a-f]{8,})$\"\
    },\
    \"BackupIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BackupId\"},\
      \"documentation\":\"<p>A list of backup IDs.</p>\",\
      \"max\":50\
    },\
    \"BackupInProgress\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Another backup is already under way. Wait for completion before initiating additional backups of this file system.</p>\",\
      \"exception\":true\
    },\
    \"BackupLifecycle\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The lifecycle status of the backup.</p>\",\
      \"enum\":[\
        \"AVAILABLE\",\
        \"CREATING\",\
        \"DELETED\",\
        \"FAILED\"\
      ]\
    },\
    \"BackupNotFound\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>No Amazon FSx backups were found based upon the supplied parameters.</p>\",\
      \"exception\":true\
    },\
    \"BackupRestoring\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"},\
        \"FileSystemId\":{\
          \"shape\":\"FileSystemId\",\
          \"documentation\":\"<p>The ID of a file system being restored from the backup.</p>\"\
        }\
      },\
      \"documentation\":\"<p>You can't delete a backup while it's being used to restore a file system.</p>\",\
      \"exception\":true\
    },\
    \"BackupType\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The type of the backup.</p>\",\
      \"enum\":[\
        \"AUTOMATIC\",\
        \"USER_INITIATED\"\
      ]\
    },\
    \"Backups\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Backup\"},\
      \"documentation\":\"<p>A list of backups.</p>\",\
      \"max\":50\
    },\
    \"BadRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>A generic error indicating a failure with a client request.</p>\",\
      \"exception\":true\
    },\
    \"CancelDataRepositoryTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TaskId\"],\
      \"members\":{\
        \"TaskId\":{\
          \"shape\":\"TaskId\",\
          \"documentation\":\"<p>Specifies the data repository task to cancel.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Cancels a data repository task.</p>\"\
    },\
    \"CancelDataRepositoryTaskResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Lifecycle\":{\
          \"shape\":\"DataRepositoryTaskLifecycle\",\
          \"documentation\":\"<p>The lifecycle status of the data repository task, as follows:</p> <ul> <li> <p> <code>PENDING</code> - Amazon FSx has not started the task.</p> </li> <li> <p> <code>EXECUTING</code> - Amazon FSx is processing the task.</p> </li> <li> <p> <code>FAILED</code> - Amazon FSx was not able to complete the task. For example, there may be files the task failed to process. The <a>DataRepositoryTaskFailureDetails</a> property provides more information about task failures.</p> </li> <li> <p> <code>SUCCEEDED</code> - FSx completed the task successfully.</p> </li> <li> <p> <code>CANCELED</code> - Amazon FSx canceled the task and it did not complete.</p> </li> <li> <p> <code>CANCELING</code> - FSx is in process of canceling the task.</p> </li> </ul>\"\
        },\
        \"TaskId\":{\
          \"shape\":\"TaskId\",\
          \"documentation\":\"<p>The ID of the task being canceled.</p>\"\
        }\
      }\
    },\
    \"ClientRequestToken\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>(Optional) An idempotency token for resource creation, in a string of up to 64 ASCII characters. This token is automatically filled on your behalf when you use the AWS Command Line Interface (AWS CLI) or an AWS SDK.</p>\",\
      \"max\":63,\
      \"min\":1,\
      \"pattern\":\"[A-za-z0-9_.-]{0,63}$\"\
    },\
    \"CompletionReport\":{\
      \"type\":\"structure\",\
      \"required\":[\"Enabled\"],\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"Flag\",\
          \"documentation\":\"<p>Set <code>Enabled</code> to <code>True</code> to generate a <code>CompletionReport</code> when the task completes. If set to <code>true</code>, then you need to provide a report <code>Scope</code>, <code>Path</code>, and <code>Format</code>. Set <code>Enabled</code> to <code>False</code> if you do not want a <code>CompletionReport</code> generated when the task completes.</p>\"\
        },\
        \"Path\":{\
          \"shape\":\"ArchivePath\",\
          \"documentation\":\"<p>Required if <code>Enabled</code> is set to <code>true</code>. Specifies the location of the report on the file system's linked S3 data repository. An absolute path that defines where the completion report will be stored in the destination location. The <code>Path</code> you provide must be located within the file systemâs ExportPath. An example <code>Path</code> value is \\\"s3://myBucket/myExportPath/optionalPrefix\\\". The report provides the following information for each file in the report: FilePath, FileStatus, and ErrorCode. To learn more about a file system's <code>ExportPath</code>, see . </p>\"\
        },\
        \"Format\":{\
          \"shape\":\"ReportFormat\",\
          \"documentation\":\"<p>Required if <code>Enabled</code> is set to <code>true</code>. Specifies the format of the <code>CompletionReport</code>. <code>REPORT_CSV_20191124</code> is the only format currently supported. When <code>Format</code> is set to <code>REPORT_CSV_20191124</code>, the <code>CompletionReport</code> is provided in CSV format, and is delivered to <code>{path}/task-{id}/failures.csv</code>. </p>\"\
        },\
        \"Scope\":{\
          \"shape\":\"ReportScope\",\
          \"documentation\":\"<p>Required if <code>Enabled</code> is set to <code>true</code>. Specifies the scope of the <code>CompletionReport</code>; <code>FAILED_FILES_ONLY</code> is the only scope currently supported. When <code>Scope</code> is set to <code>FAILED_FILES_ONLY</code>, the <code>CompletionReport</code> only contains information about files that the data repository task failed to process.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides a report detailing the data repository task results of the files processed that match the criteria specified in the report <code>Scope</code> parameter. FSx delivers the report to the file system's linked data repository in Amazon S3, using the path specified in the report <code>Path</code> parameter. You can specify whether or not a report gets generated for a task using the <code>Enabled</code> parameter.</p>\"\
    },\
    \"CreateBackupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FileSystemId\"],\
      \"members\":{\
        \"FileSystemId\":{\
          \"shape\":\"FileSystemId\",\
          \"documentation\":\"<p>The ID of the file system to back up.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>(Optional) A string of up to 64 ASCII characters that Amazon FSx uses to ensure idempotent creation. This string is automatically filled on your behalf when you use the AWS Command Line Interface (AWS CLI) or an AWS SDK.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The tags to apply to the backup at backup creation. The key value of the <code>Name</code> tag appears in the console as the backup name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request object for the <code>CreateBackup</code> operation.</p>\"\
    },\
    \"CreateBackupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Backup\":{\
          \"shape\":\"Backup\",\
          \"documentation\":\"<p>A description of the backup.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response object for the <code>CreateBackup</code> operation.</p>\"\
    },\
    \"CreateDataRepositoryTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Type\",\
        \"FileSystemId\",\
        \"Report\"\
      ],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"DataRepositoryTaskType\",\
          \"documentation\":\"<p>Specifies the type of data repository task to create.</p>\"\
        },\
        \"Paths\":{\
          \"shape\":\"DataRepositoryTaskPaths\",\
          \"documentation\":\"<p>(Optional) The path or paths on the Amazon FSx file system to use when the data repository task is processed. The default path is the file system root directory. The paths you provide need to be relative to the mount point of the file system. If the mount point is <code>/mnt/fsx</code> and <code>/mnt/fsx/path1</code> is a directory or file on the file system you want to export, then the path to provide is <code>path1</code>. If a path that you provide isn't valid, the task fails.</p>\"\
        },\
        \"FileSystemId\":{\"shape\":\"FileSystemId\"},\
        \"Report\":{\
          \"shape\":\"CompletionReport\",\
          \"documentation\":\"<p>Defines whether or not Amazon FSx provides a CompletionReport once the task has completed. A CompletionReport provides a detailed report on the files that Amazon FSx processed that meet the criteria specified by the <code>Scope</code> parameter. For more information, see <a href=\\\"https://docs.aws.amazon.com/fsx/latest/LustreGuide/task-completion-report.html\\\">Working with Task Completion Reports</a>.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"idempotencyToken\":true\
        },\
        \"Tags\":{\"shape\":\"Tags\"}\
      }\
    },\
    \"CreateDataRepositoryTaskResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DataRepositoryTask\":{\
          \"shape\":\"DataRepositoryTask\",\
          \"documentation\":\"<p>The description of the data repository task that you just created.</p>\"\
        }\
      }\
    },\
    \"CreateFileSystemFromBackupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BackupId\",\
        \"SubnetIds\"\
      ],\
      \"members\":{\
        \"BackupId\":{\"shape\":\"BackupId\"},\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>(Optional) A string of up to 64 ASCII characters that Amazon FSx uses to ensure idempotent creation. This string is automatically filled on your behalf when you use the AWS Command Line Interface (AWS CLI) or an AWS SDK.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"SubnetIds\":{\
          \"shape\":\"SubnetIds\",\
          \"documentation\":\"<p>Specifies the IDs of the subnets that the file system will be accessible from. For Windows <code>MULTI_AZ_1</code> file system deployment types, provide exactly two subnet IDs, one for the preferred file server and one for the standby file server. You specify one of these subnets as the preferred subnet using the <code>WindowsConfiguration &gt; PreferredSubnetID</code> property.</p> <p>For Windows <code>SINGLE_AZ_1</code> and <code>SINGLE_AZ_2</code> deployment types and Lustre file systems, provide exactly one subnet ID. The file server is launched in that subnet's Availability Zone.</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIds\",\
          \"documentation\":\"<p>A list of IDs for the security groups that apply to the specified network interfaces created for file system access. These security groups apply to all network interfaces. This value isn't returned in later DescribeFileSystem requests.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The tags to be applied to the file system at file system creation. The key value of the <code>Name</code> tag appears in the console as the file system name.</p>\"\
        },\
        \"WindowsConfiguration\":{\
          \"shape\":\"CreateFileSystemWindowsConfiguration\",\
          \"documentation\":\"<p>The configuration for this Microsoft Windows file system.</p>\"\
        },\
        \"StorageType\":{\
          \"shape\":\"StorageType\",\
          \"documentation\":\"<p>Sets the storage type for the Windows file system you're creating from a backup. Valid values are <code>SSD</code> and <code>HDD</code>.</p> <ul> <li> <p>Set to <code>SSD</code> to use solid state drive storage. Supported on all Windows deployment types.</p> </li> <li> <p>Set to <code>HDD</code> to use hard disk drive storage. Supported on <code>SINGLE_AZ_2</code> and <code>MULTI_AZ_1</code> Windows file system deployment types. </p> </li> </ul> <p> Default value is <code>SSD</code>. </p> <note> <p>HDD and SSD storage types have different minimum storage capacity requirements. A restored file system's storage capacity is tied to the file system that was backed up. You can create a file system that uses HDD storage from a backup of a file system that used SSD storage only if the original SSD file system had a storage capacity of at least 2000 GiB. </p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The request object for the <code>CreateFileSystemFromBackup</code> operation.</p>\"\
    },\
    \"CreateFileSystemFromBackupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FileSystem\":{\
          \"shape\":\"FileSystem\",\
          \"documentation\":\"<p>A description of the file system.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response object for the <code>CreateFileSystemFromBackup</code> operation.</p>\"\
    },\
    \"CreateFileSystemLustreConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"WeeklyMaintenanceStartTime\":{\
          \"shape\":\"WeeklyTime\",\
          \"documentation\":\"<p>The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time zone, where d is the weekday number, from 1 through 7, beginning with Monday and ending with Sunday.</p>\"\
        },\
        \"ImportPath\":{\
          \"shape\":\"ArchivePath\",\
          \"documentation\":\"<p>(Optional) The path to the Amazon S3 bucket (including the optional prefix) that you're using as the data repository for your Amazon FSx for Lustre file system. The root of your FSx for Lustre file system will be mapped to the root of the Amazon S3 bucket you select. An example is <code>s3://import-bucket/optional-prefix</code>. If you specify a prefix after the Amazon S3 bucket name, only object keys with that prefix are loaded into the file system.</p>\"\
        },\
        \"ExportPath\":{\
          \"shape\":\"ArchivePath\",\
          \"documentation\":\"<p>(Optional) The path in Amazon S3 where the root of your Amazon FSx file system is exported. The path must use the same Amazon S3 bucket as specified in ImportPath. You can provide an optional prefix to which new and changed data is to be exported from your Amazon FSx for Lustre file system. If an <code>ExportPath</code> value is not provided, Amazon FSx sets a default export path, <code>s3://import-bucket/FSxLustre[creation-timestamp]</code>. The timestamp is in UTC format, for example <code>s3://import-bucket/FSxLustre20181105T222312Z</code>.</p> <p>The Amazon S3 export bucket must be the same as the import bucket specified by <code>ImportPath</code>. If you only specify a bucket name, such as <code>s3://import-bucket</code>, you get a 1:1 mapping of file system objects to S3 bucket objects. This mapping means that the input data in S3 is overwritten on export. If you provide a custom prefix in the export path, such as <code>s3://import-bucket/[custom-optional-prefix]</code>, Amazon FSx exports the contents of your file system to that export prefix in the Amazon S3 bucket.</p>\"\
        },\
        \"ImportedFileChunkSize\":{\
          \"shape\":\"Megabytes\",\
          \"documentation\":\"<p>(Optional) For files imported from a data repository, this value determines the stripe count and maximum amount of data per file (in MiB) stored on a single physical disk. The maximum number of disks that a single file can be striped across is limited by the total number of disks that make up the file system.</p> <p>The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000 MiB (500 GiB). Amazon S3 objects have a maximum size of 5 TB.</p>\"\
        },\
        \"DeploymentType\":{\
          \"shape\":\"LustreDeploymentType\",\
          \"documentation\":\"<p>(Optional) Choose <code>SCRATCH_1</code> and <code>SCRATCH_2</code> deployment types when you need temporary storage and shorter-term processing of data. The <code>SCRATCH_2</code> deployment type provides in-transit encryption of data and higher burst throughput capacity than <code>SCRATCH_1</code>.</p> <p>Choose <code>PERSISTENT_1</code> deployment type for longer-term storage and workloads and encryption of data in transit. To learn more about deployment types, see <a href=\\\"https://docs.aws.amazon.com/fsx/latest/LustreGuide/lustre-deployment-types.html\\\"> FSx for Lustre Deployment Options</a>.</p> <p>Encryption of data in-transit is automatically enabled when you access a <code>SCRATCH_2</code> or <code>PERSISTENT_1</code> file system from Amazon EC2 instances that <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/data- protection.html\\\">support this feature</a>. (Default = <code>SCRATCH_1</code>) </p> <p>Encryption of data in-transit for <code>SCRATCH_2</code> and <code>PERSISTENT_1</code> deployment types is supported when accessed from supported instance types in supported AWS Regions. To learn more, <a href=\\\"https://docs.aws.amazon.com/fsx/latest/LustreGuide/encryption-in-transit-fsxl.html\\\">Encrypting Data in Transit</a>.</p>\"\
        },\
        \"PerUnitStorageThroughput\":{\
          \"shape\":\"PerUnitStorageThroughput\",\
          \"documentation\":\"<p> Required for the <code>PERSISTENT_1</code> deployment type, describes the amount of read and write throughput for each 1 tebibyte of storage, in MB/s/TiB. File system throughput capacity is calculated by multiplying ï¬le system storage capacity (TiB) by the PerUnitStorageThroughput (MB/s/TiB). For a 2.4 TiB ï¬le system, provisioning 50 MB/s/TiB of PerUnitStorageThroughput yields 117 MB/s of ï¬le system throughput. You pay for the amount of throughput that you provision. </p> <p>Valid values are 50, 100, 200.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Lustre configuration for the file system being created. </p>\"\
    },\
    \"CreateFileSystemRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FileSystemType\",\
        \"StorageCapacity\",\
        \"SubnetIds\"\
      ],\
      \"members\":{\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>(Optional) A string of up to 64 ASCII characters that Amazon FSx uses to ensure idempotent creation. This string is automatically filled on your behalf when you use the AWS Command Line Interface (AWS CLI) or an AWS SDK.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"FileSystemType\":{\
          \"shape\":\"FileSystemType\",\
          \"documentation\":\"<p>The type of Amazon FSx file system to create, either <code>WINDOWS</code> or <code>LUSTRE</code>.</p>\"\
        },\
        \"StorageCapacity\":{\
          \"shape\":\"StorageCapacity\",\
          \"documentation\":\"<p>Sets the storage capacity of the file system that you're creating.</p> <p>For Lustre file systems:</p> <ul> <li> <p>For <code>SCRATCH_2</code> and <code>PERSISTENT_1</code> deployment types, valid values are 1.2, 2.4, and increments of 2.4 TiB.</p> </li> <li> <p>For <code>SCRATCH_1</code> deployment type, valid values are 1.2, 2.4, and increments of 3.6 TiB.</p> </li> </ul> <p>For Windows file systems:</p> <ul> <li> <p>If <code>StorageType=SSD</code>, valid values are 32 GiB - 65,536 GiB (64 TiB).</p> </li> <li> <p>If <code>StorageType=HDD</code>, valid values are 2000 GiB - 65,536 GiB (64 TiB).</p> </li> </ul>\"\
        },\
        \"StorageType\":{\
          \"shape\":\"StorageType\",\
          \"documentation\":\"<p>Sets the storage type for the Amazon FSx for Windows file system you're creating. Valid values are <code>SSD</code> and <code>HDD</code>.</p> <ul> <li> <p>Set to <code>SSD</code> to use solid state drive storage. SSD is supported on all Windows deployment types.</p> </li> <li> <p>Set to <code>HDD</code> to use hard disk drive storage. HDD is supported on <code>SINGLE_AZ_2</code> and <code>MULTI_AZ_1</code> Windows file system deployment types. </p> </li> </ul> <p> Default value is <code>SSD</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/fsx/latest/WindowsGuide/optimize-fsx-costs.html#storage-type-options\\\"> Storage Type Options</a> in the <i>Amazon FSx for Windows User Guide</i>. </p>\"\
        },\
        \"SubnetIds\":{\
          \"shape\":\"SubnetIds\",\
          \"documentation\":\"<p>Specifies the IDs of the subnets that the file system will be accessible from. For Windows <code>MULTI_AZ_1</code> file system deployment types, provide exactly two subnet IDs, one for the preferred file server and one for the standby file server. You specify one of these subnets as the preferred subnet using the <code>WindowsConfiguration &gt; PreferredSubnetID</code> property.</p> <p>For Windows <code>SINGLE_AZ_1</code> and <code>SINGLE_AZ_2</code> file system deployment types and Lustre file systems, provide exactly one subnet ID. The file server is launched in that subnet's Availability Zone.</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIds\",\
          \"documentation\":\"<p>A list of IDs specifying the security groups to apply to all network interfaces created for file system access. This list isn't returned in later requests to describe the file system.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The tags to apply to the file system being created. The key value of the <code>Name</code> tag appears in the console as the file system name.</p>\"\
        },\
        \"KmsKeyId\":{\"shape\":\"KmsKeyId\"},\
        \"WindowsConfiguration\":{\
          \"shape\":\"CreateFileSystemWindowsConfiguration\",\
          \"documentation\":\"<p>The Microsoft Windows configuration for the file system being created. </p>\"\
        },\
        \"LustreConfiguration\":{\"shape\":\"CreateFileSystemLustreConfiguration\"}\
      },\
      \"documentation\":\"<p>The request object used to create a new Amazon FSx file system.</p>\"\
    },\
    \"CreateFileSystemResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FileSystem\":{\
          \"shape\":\"FileSystem\",\
          \"documentation\":\"<p>The configuration of the file system that was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response object returned after the file system is created.</p>\"\
    },\
    \"CreateFileSystemWindowsConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"ThroughputCapacity\"],\
      \"members\":{\
        \"ActiveDirectoryId\":{\
          \"shape\":\"DirectoryId\",\
          \"documentation\":\"<p>The ID for an existing AWS Managed Microsoft Active Directory (AD) instance that the file system should join when it's created.</p>\"\
        },\
        \"SelfManagedActiveDirectoryConfiguration\":{\"shape\":\"SelfManagedActiveDirectoryConfiguration\"},\
        \"DeploymentType\":{\
          \"shape\":\"WindowsDeploymentType\",\
          \"documentation\":\"<p>Specifies the file system deployment type, valid values are the following:</p> <ul> <li> <p> <code>MULTI_AZ_1</code> - Deploys a high availability file system that is configured for Multi-AZ redundancy to tolerate temporary Availability Zone (AZ) unavailability. You can only deploy a Multi-AZ file system in AWS Regions that have a minimum of three Availability Zones. Also supports HDD storage type</p> </li> <li> <p> <code>SINGLE_AZ_1</code> - (Default) Choose to deploy a file system that is configured for single AZ redundancy.</p> </li> <li> <p> <code>SINGLE_AZ_2</code> - The latest generation Single AZ file system. Specifies a file system that is configured for single AZ redundancy and supports HDD storage type.</p> </li> </ul> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/fsx/latest/WindowsGuide/high-availability-multiAZ.html\\\"> Availability and Durability: Single-AZ and Multi-AZ File Systems</a>.</p>\"\
        },\
        \"PreferredSubnetId\":{\
          \"shape\":\"SubnetId\",\
          \"documentation\":\"<p>Required when <code>DeploymentType</code> is set to <code>MULTI_AZ_1</code>. This specifies the subnet in which you want the preferred file server to be located. For in-AWS applications, we recommend that you launch your clients in the same Availability Zone (AZ) as your preferred file server to reduce cross-AZ data transfer costs and minimize latency. </p>\"\
        },\
        \"ThroughputCapacity\":{\
          \"shape\":\"MegabytesPerSecond\",\
          \"documentation\":\"<p>The throughput of an Amazon FSx file system, measured in megabytes per second, in 2 to the <i>n</i>th increments, between 2^3 (8) and 2^11 (2048).</p>\"\
        },\
        \"WeeklyMaintenanceStartTime\":{\
          \"shape\":\"WeeklyTime\",\
          \"documentation\":\"<p>The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time zone, where d is the weekday number, from 1 through 7, beginning with Monday and ending with Sunday.</p>\"\
        },\
        \"DailyAutomaticBackupStartTime\":{\
          \"shape\":\"DailyTime\",\
          \"documentation\":\"<p>The preferred time to take daily automatic backups, formatted HH:MM in the UTC time zone.</p>\"\
        },\
        \"AutomaticBackupRetentionDays\":{\
          \"shape\":\"AutomaticBackupRetentionDays\",\
          \"documentation\":\"<p>The number of days to retain automatic backups. The default is to retain backups for 7 days. Setting this value to 0 disables the creation of automatic backups. The maximum retention period for backups is 35 days.</p>\"\
        },\
        \"CopyTagsToBackups\":{\
          \"shape\":\"Flag\",\
          \"documentation\":\"<p>A boolean flag indicating whether tags for the file system should be copied to backups. This value defaults to false. If it's set to true, all tags for the file system are copied to all automatic and user-initiated backups where the user doesn't specify tags. If this value is true, and you specify one or more tags, only the specified tags are copied to backups. If you specify one or more tags when creating a user-initiated backup, no tags are copied from the file system, regardless of this value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration object for the Microsoft Windows file system used in <code>CreateFileSystem</code> and <code>CreateFileSystemFromBackup</code> operations.</p>\"\
    },\
    \"CreationTime\":{\
      \"type\":\"timestamp\",\
      \"documentation\":\"<p>The time that the resource was created, in seconds (since 1970-01-01T00:00:00Z), also known as Unix time.</p>\"\
    },\
    \"DNSName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The Domain Name Service (DNS) name for the file system. You can mount your file system using its DNS name.</p>\",\
      \"max\":275,\
      \"min\":16,\
      \"pattern\":\"^(fsi?-[0-9a-f]{8,}\\\\..{4,253})$\"\
    },\
    \"DailyTime\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>A recurring daily time, in the format <code>HH:MM</code>. <code>HH</code> is the zero-padded hour of the day (0-23), and <code>MM</code> is the zero-padded minute of the hour. For example, <code>05:00</code> specifies 5 AM daily. </p>\",\
      \"max\":5,\
      \"min\":5,\
      \"pattern\":\"^([01]\\\\d|2[0-3]):?([0-5]\\\\d)$\"\
    },\
    \"DataRepositoryConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImportPath\":{\
          \"shape\":\"ArchivePath\",\
          \"documentation\":\"<p>The import path to the Amazon S3 bucket (and optional prefix) that you're using as the data repository for your FSx for Lustre file system, for example <code>s3://import-bucket/optional-prefix</code>. If a prefix is specified after the Amazon S3 bucket name, only object keys with that prefix are loaded into the file system.</p>\"\
        },\
        \"ExportPath\":{\
          \"shape\":\"ArchivePath\",\
          \"documentation\":\"<p>The export path to the Amazon S3 bucket (and prefix) that you are using to store new and changed Lustre file system files in S3.</p>\"\
        },\
        \"ImportedFileChunkSize\":{\
          \"shape\":\"Megabytes\",\
          \"documentation\":\"<p>For files imported from a data repository, this value determines the stripe count and maximum amount of data per file (in MiB) stored on a single physical disk. The maximum number of disks that a single file can be striped across is limited by the total number of disks that make up the file system.</p> <p>The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000 MiB (500 GiB). Amazon S3 objects have a maximum size of 5 TB.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The data repository configuration object for Lustre file systems returned in the response of the <code>CreateFileSystem</code> operation.</p>\"\
    },\
    \"DataRepositoryTask\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TaskId\",\
        \"Lifecycle\",\
        \"Type\",\
        \"CreationTime\",\
        \"FileSystemId\"\
      ],\
      \"members\":{\
        \"TaskId\":{\
          \"shape\":\"TaskId\",\
          \"documentation\":\"<p>The system-generated, unique 17-digit ID of the data repository task.</p>\"\
        },\
        \"Lifecycle\":{\
          \"shape\":\"DataRepositoryTaskLifecycle\",\
          \"documentation\":\"<p>The lifecycle status of the data repository task, as follows:</p> <ul> <li> <p> <code>PENDING</code> - Amazon FSx has not started the task.</p> </li> <li> <p> <code>EXECUTING</code> - Amazon FSx is processing the task.</p> </li> <li> <p> <code>FAILED</code> - Amazon FSx was not able to complete the task. For example, there may be files the task failed to process. The <a>DataRepositoryTaskFailureDetails</a> property provides more information about task failures.</p> </li> <li> <p> <code>SUCCEEDED</code> - FSx completed the task successfully.</p> </li> <li> <p> <code>CANCELED</code> - Amazon FSx canceled the task and it did not complete.</p> </li> <li> <p> <code>CANCELING</code> - FSx is in process of canceling the task.</p> </li> </ul> <note> <p>You cannot delete an FSx for Lustre file system if there are data repository tasks for the file system in the <code>PENDING</code> or <code>EXECUTING</code> states. Please retry when the data repository task is finished (with a status of <code>CANCELED</code>, <code>SUCCEEDED</code>, or <code>FAILED</code>). You can use the DescribeDataRepositoryTask action to monitor the task status. Contact the FSx team if you need to delete your file system immediately.</p> </note>\"\
        },\
        \"Type\":{\
          \"shape\":\"DataRepositoryTaskType\",\
          \"documentation\":\"<p>The type of data repository task; EXPORT_TO_REPOSITORY is the only type currently supported.</p>\"\
        },\
        \"CreationTime\":{\"shape\":\"CreationTime\"},\
        \"StartTime\":{\
          \"shape\":\"StartTime\",\
          \"documentation\":\"<p>The time that Amazon FSx began processing the task.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"EndTime\",\
          \"documentation\":\"<p>The time that Amazon FSx completed processing the task, populated after the task is complete.</p>\"\
        },\
        \"ResourceARN\":{\"shape\":\"ResourceARN\"},\
        \"Tags\":{\"shape\":\"Tags\"},\
        \"FileSystemId\":{\"shape\":\"FileSystemId\"},\
        \"Paths\":{\
          \"shape\":\"DataRepositoryTaskPaths\",\
          \"documentation\":\"<p>An array of paths on the Amazon FSx for Lustre file system that specify the data for the data repository task to process. For example, in an EXPORT_TO_REPOSITORY task, the paths specify which data to export to the linked data repository.</p> <p>(Default) If <code>Paths</code> is not specified, Amazon FSx uses the file system root directory.</p>\"\
        },\
        \"FailureDetails\":{\
          \"shape\":\"DataRepositoryTaskFailureDetails\",\
          \"documentation\":\"<p>Failure message describing why the task failed, it is populated only when <code>Lifecycle</code> is set to <code>FAILED</code>.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"DataRepositoryTaskStatus\",\
          \"documentation\":\"<p>Provides the status of the number of files that the task has processed successfully and failed to process.</p>\"\
        },\
        \"Report\":{\"shape\":\"CompletionReport\"}\
      },\
      \"documentation\":\"<p>A description of the data repository task. You use data repository tasks to perform bulk transfer operations between your Amazon FSx file system and its linked data repository.</p>\"\
    },\
    \"DataRepositoryTaskEnded\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The data repository task could not be canceled because the task has already ended.</p>\",\
      \"exception\":true\
    },\
    \"DataRepositoryTaskExecuting\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>An existing data repository task is currently executing on the file system. Wait until the existing task has completed, then create the new task.</p>\",\
      \"exception\":true\
    },\
    \"DataRepositoryTaskFailureDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Provides information about why a data repository task failed. Only populated when the task <code>Lifecycle</code> is set to <code>FAILED</code>.</p>\"\
    },\
    \"DataRepositoryTaskFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"DataRepositoryTaskFilterName\",\
          \"documentation\":\"<p>Name of the task property to use in filtering the tasks returned in the response.</p> <ul> <li> <p>Use <code>file-system-id</code> to retrieve data repository tasks for specific file systems.</p> </li> <li> <p>Use <code>task-lifecycle</code> to retrieve data repository tasks with one or more specific lifecycle states, as follows: CANCELED, EXECUTING, FAILED, PENDING, and SUCCEEDED.</p> </li> </ul>\"\
        },\
        \"Values\":{\
          \"shape\":\"DataRepositoryTaskFilterValues\",\
          \"documentation\":\"<p>Use Values to include the specific file system IDs and task lifecycle states for the filters you are using.</p>\"\
        }\
      },\
      \"documentation\":\"<p>(Optional) An array of filter objects you can use to filter the response of data repository tasks you will see in the the response. You can filter the tasks returned in the response by one or more file system IDs, task lifecycles, and by task type. A filter object consists of a filter <code>Name</code>, and one or more <code>Values</code> for the filter.</p>\"\
    },\
    \"DataRepositoryTaskFilterName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"file-system-id\",\
        \"task-lifecycle\"\
      ]\
    },\
    \"DataRepositoryTaskFilterValue\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z\\\\*\\\\.\\\\\\\\/\\\\?\\\\-\\\\_]*$\"\
    },\
    \"DataRepositoryTaskFilterValues\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DataRepositoryTaskFilterValue\"},\
      \"max\":20\
    },\
    \"DataRepositoryTaskFilters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DataRepositoryTaskFilter\"},\
      \"max\":3\
    },\
    \"DataRepositoryTaskLifecycle\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"EXECUTING\",\
        \"FAILED\",\
        \"SUCCEEDED\",\
        \"CANCELED\",\
        \"CANCELING\"\
      ]\
    },\
    \"DataRepositoryTaskNotFound\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The data repository task or tasks you specified could not be found.</p>\",\
      \"exception\":true\
    },\
    \"DataRepositoryTaskPath\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":0,\
      \"pattern\":\"^.{0,4096}$\"\
    },\
    \"DataRepositoryTaskPaths\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DataRepositoryTaskPath\"},\
      \"max\":100\
    },\
    \"DataRepositoryTaskStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TotalCount\":{\
          \"shape\":\"TotalCount\",\
          \"documentation\":\"<p>The total number of files that the task will process. While a task is executing, the sum of <code>SucceededCount</code> plus <code>FailedCount</code> may not equal <code>TotalCount</code>. When the task is complete, <code>TotalCount</code> equals the sum of <code>SucceededCount</code> plus <code>FailedCount</code>.</p>\"\
        },\
        \"SucceededCount\":{\
          \"shape\":\"SucceededCount\",\
          \"documentation\":\"<p>A running total of the number of files that the task has successfully processed.</p>\"\
        },\
        \"FailedCount\":{\
          \"shape\":\"FailedCount\",\
          \"documentation\":\"<p>A running total of the number of files that the task failed to process.</p>\"\
        },\
        \"LastUpdatedTime\":{\
          \"shape\":\"LastUpdatedTime\",\
          \"documentation\":\"<p>The time at which the task status was last updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides the task status showing a running total of the total number of files to be processed, the number successfully processed, and the number of files the task failed to process.</p>\"\
    },\
    \"DataRepositoryTaskType\":{\
      \"type\":\"string\",\
      \"enum\":[\"EXPORT_TO_REPOSITORY\"]\
    },\
    \"DataRepositoryTasks\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DataRepositoryTask\"},\
      \"max\":50\
    },\
    \"DeleteBackupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupId\"],\
      \"members\":{\
        \"BackupId\":{\
          \"shape\":\"BackupId\",\
          \"documentation\":\"<p>The ID of the backup you want to delete.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>(Optional) A string of up to 64 ASCII characters that Amazon FSx uses to ensure idempotent deletion. This is automatically filled on your behalf when using the AWS CLI or SDK.</p>\",\
          \"idempotencyToken\":true\
        }\
      },\
      \"documentation\":\"<p>The request object for <code>DeleteBackup</code> operation.</p>\"\
    },\
    \"DeleteBackupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupId\":{\
          \"shape\":\"BackupId\",\
          \"documentation\":\"<p>The ID of the backup deleted.</p>\"\
        },\
        \"Lifecycle\":{\
          \"shape\":\"BackupLifecycle\",\
          \"documentation\":\"<p>The lifecycle of the backup. Should be <code>DELETED</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response object for <code>DeleteBackup</code> operation.</p>\"\
    },\
    \"DeleteFileSystemRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FileSystemId\"],\
      \"members\":{\
        \"FileSystemId\":{\
          \"shape\":\"FileSystemId\",\
          \"documentation\":\"<p>The ID of the file system you want to delete.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>(Optional) A string of up to 64 ASCII characters that Amazon FSx uses to ensure idempotent deletion. This is automatically filled on your behalf when using the AWS CLI or SDK.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"WindowsConfiguration\":{\"shape\":\"DeleteFileSystemWindowsConfiguration\"}\
      },\
      \"documentation\":\"<p>The request object for <code>DeleteFileSystem</code> operation.</p>\"\
    },\
    \"DeleteFileSystemResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FileSystemId\":{\
          \"shape\":\"FileSystemId\",\
          \"documentation\":\"<p>The ID of the file system being deleted.</p>\"\
        },\
        \"Lifecycle\":{\
          \"shape\":\"FileSystemLifecycle\",\
          \"documentation\":\"<p>The file system lifecycle for the deletion request. Should be <code>DELETING</code>.</p>\"\
        },\
        \"WindowsResponse\":{\"shape\":\"DeleteFileSystemWindowsResponse\"}\
      },\
      \"documentation\":\"<p>The response object for the <code>DeleteFileSystem</code> operation.</p>\"\
    },\
    \"DeleteFileSystemWindowsConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SkipFinalBackup\":{\
          \"shape\":\"Flag\",\
          \"documentation\":\"<p>By default, Amazon FSx for Windows takes a final backup on your behalf when the <code>DeleteFileSystem</code> operation is invoked. Doing this helps protect you from data loss, and we highly recommend taking the final backup. If you want to skip this backup, use this flag to do so.</p>\"\
        },\
        \"FinalBackupTags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>A set of tags for your final backup.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration object for the Microsoft Windows file system used in the <code>DeleteFileSystem</code> operation.</p>\"\
    },\
    \"DeleteFileSystemWindowsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FinalBackupId\":{\
          \"shape\":\"BackupId\",\
          \"documentation\":\"<p>The ID of the final backup for this file system.</p>\"\
        },\
        \"FinalBackupTags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The set of tags applied to the final backup.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response object for the Microsoft Windows file system used in the <code>DeleteFileSystem</code> operation.</p>\"\
    },\
    \"DescribeBackupsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupIds\":{\
          \"shape\":\"BackupIds\",\
          \"documentation\":\"<p>(Optional) IDs of the backups you want to retrieve (String). This overrides any filters. If any IDs are not found, BackupNotFound will be thrown.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"Filters\",\
          \"documentation\":\"<p>(Optional) Filters structure. Supported names are file-system-id and backup-type.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>(Optional) Maximum number of backups to return in the response (integer). This parameter value must be greater than 0. The number of items that Amazon FSx returns is the minimum of the <code>MaxResults</code> parameter specified in the request and the service's internal maximum number of items per page.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>(Optional) Opaque pagination token returned from a previous <code>DescribeBackups</code> operation (String). If a token present, the action continues the list from where the returning call left off.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request object for <code>DescribeBackups</code> operation.</p>\"\
    },\
    \"DescribeBackupsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Backups\":{\
          \"shape\":\"Backups\",\
          \"documentation\":\"<p>Any array of backups.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>This is present if there are more backups than returned in the response (String). You can use the <code>NextToken</code> value in the later request to fetch the backups. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Response object for <code>DescribeBackups</code> operation.</p>\"\
    },\
    \"DescribeDataRepositoryTasksRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TaskIds\":{\
          \"shape\":\"TaskIds\",\
          \"documentation\":\"<p>(Optional) IDs of the tasks whose descriptions you want to retrieve (String).</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"DataRepositoryTaskFilters\",\
          \"documentation\":\"<p>(Optional) You can use filters to narrow the <code>DescribeDataRepositoryTasks</code> response to include just tasks for specific file systems, or tasks in a specific lifecycle state.</p>\"\
        },\
        \"MaxResults\":{\"shape\":\"MaxResults\"},\
        \"NextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeDataRepositoryTasksResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DataRepositoryTasks\":{\
          \"shape\":\"DataRepositoryTasks\",\
          \"documentation\":\"<p>The collection of data repository task descriptions returned.</p>\"\
        },\
        \"NextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeFileSystemsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FileSystemIds\":{\
          \"shape\":\"FileSystemIds\",\
          \"documentation\":\"<p>(Optional) IDs of the file systems whose descriptions you want to retrieve (String).</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>(Optional) Maximum number of file systems to return in the response (integer). This parameter value must be greater than 0. The number of items that Amazon FSx returns is the minimum of the <code>MaxResults</code> parameter specified in the request and the service's internal maximum number of items per page.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>(Optional) Opaque pagination token returned from a previous <code>DescribeFileSystems</code> operation (String). If a token present, the action continues the list from where the returning call left off.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request object for <code>DescribeFileSystems</code> operation.</p>\"\
    },\
    \"DescribeFileSystemsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FileSystems\":{\
          \"shape\":\"FileSystems\",\
          \"documentation\":\"<p>An array of file system descriptions.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>Present if there are more file systems than returned in the response (String). You can use the <code>NextToken</code> value in the later request to fetch the descriptions. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The response object for <code>DescribeFileSystems</code> operation.</p>\"\
    },\
    \"DirectoryId\":{\
      \"type\":\"string\",\
      \"max\":12,\
      \"min\":12,\
      \"pattern\":\"^d-[0-9a-f]{10}$\"\
    },\
    \"DirectoryPassword\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"^.{1,256}$\",\
      \"sensitive\":true\
    },\
    \"DirectoryUserName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"^.{1,256}$\"\
    },\
    \"DnsIps\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IpAddress\"},\
      \"max\":2,\
      \"min\":1\
    },\
    \"EndTime\":{\"type\":\"timestamp\"},\
    \"ErrorMessage\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>A detailed error message.</p>\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"FailedCount\":{\"type\":\"long\"},\
    \"FileSystem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OwnerId\":{\
          \"shape\":\"AWSAccountId\",\
          \"documentation\":\"<p>The AWS account that created the file system. If the file system was created by an AWS Identity and Access Management (IAM) user, the AWS account to which the IAM user belongs is the owner.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>The time that the file system was created, in seconds (since 1970-01-01T00:00:00Z), also known as Unix time.</p>\"\
        },\
        \"FileSystemId\":{\
          \"shape\":\"FileSystemId\",\
          \"documentation\":\"<p>The system-generated, unique 17-digit ID of the file system.</p>\"\
        },\
        \"FileSystemType\":{\
          \"shape\":\"FileSystemType\",\
          \"documentation\":\"<p>The type of Amazon FSx file system, either <code>LUSTRE</code> or <code>WINDOWS</code>.</p>\"\
        },\
        \"Lifecycle\":{\
          \"shape\":\"FileSystemLifecycle\",\
          \"documentation\":\"<p>The lifecycle status of the file system, following are the possible values and what they mean:</p> <ul> <li> <p> <code>AVAILABLE</code> - The file system is in a healthy state, and is reachable and available for use.</p> </li> <li> <p> <code>CREATING</code> - Amazon FSx is creating the new file system.</p> </li> <li> <p> <code>DELETING</code> - Amazon FSx is deleting an existing file system.</p> </li> <li> <p> <code>FAILED</code> - An existing file system has experienced an unrecoverable failure. When creating a new file system, Amazon FSx was unable to create the file system.</p> </li> <li> <p> <code>MISCONFIGURED</code> indicates that the file system is in a failed but recoverable state.</p> </li> <li> <p> <code>UPDATING</code> indicates that the file system is undergoing a customer initiated update.</p> </li> </ul>\"\
        },\
        \"FailureDetails\":{\"shape\":\"FileSystemFailureDetails\"},\
        \"StorageCapacity\":{\
          \"shape\":\"StorageCapacity\",\
          \"documentation\":\"<p>The storage capacity of the file system in gigabytes (GB).</p>\"\
        },\
        \"StorageType\":{\
          \"shape\":\"StorageType\",\
          \"documentation\":\"<p>The storage type of the file system. Valid values are <code>SSD</code> and <code>HDD</code>. If set to <code>SSD</code>, the file system uses solid state drive storage. If set to <code>HDD</code>, the file system uses hard disk drive storage. </p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"VpcId\",\
          \"documentation\":\"<p>The ID of the primary VPC for the file system.</p>\"\
        },\
        \"SubnetIds\":{\
          \"shape\":\"SubnetIds\",\
          \"documentation\":\"<p>Specifies the IDs of the subnets that the file system is accessible from. For Windows <code>MULTI_AZ_1</code> file system deployment type, there are two subnet IDs, one for the preferred file server and one for the standby file server. The preferred file server subnet identified in the <code>PreferredSubnetID</code> property. All other file systems have only one subnet ID.</p> <p>For Lustre file systems, and Single-AZ Windows file systems, this is the ID of the subnet that contains the endpoint for the file system. For <code>MULTI_AZ_1</code> Windows file systems, the endpoint for the file system is available in the <code>PreferredSubnetID</code>.</p>\"\
        },\
        \"NetworkInterfaceIds\":{\
          \"shape\":\"NetworkInterfaceIds\",\
          \"documentation\":\"<p>The IDs of the elastic network interface from which a specific file system is accessible. The elastic network interface is automatically created in the same VPC that the Amazon FSx file system was created in. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html\\\">Elastic Network Interfaces</a> in the <i>Amazon EC2 User Guide.</i> </p> <p>For an Amazon FSx for Windows File Server file system, you can have one network interface ID. For an Amazon FSx for Lustre file system, you can have more than one.</p>\"\
        },\
        \"DNSName\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>The DNS name for the file system.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The ID of the AWS Key Management Service (AWS KMS) key used to encrypt the file system's data for Amazon FSx for Windows File Server file systems and persistent Amazon FSx for Lustre file systems at rest. In either case, if not specified, the Amazon FSx managed key is used. The scratch Amazon FSx for Lustre file systems are always encrypted at rest using Amazon FSx managed keys. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_Encrypt.html\\\">Encrypt</a> in the <i>AWS Key Management Service API Reference</i>.</p>\"\
        },\
        \"ResourceARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the file system resource.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The tags to associate with the file system. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html\\\">Tagging Your Amazon EC2 Resources</a> in the <i>Amazon EC2 User Guide</i>.</p>\"\
        },\
        \"WindowsConfiguration\":{\
          \"shape\":\"WindowsFileSystemConfiguration\",\
          \"documentation\":\"<p>The configuration for this Microsoft Windows file system.</p>\"\
        },\
        \"LustreConfiguration\":{\"shape\":\"LustreFileSystemConfiguration\"},\
        \"AdministrativeActions\":{\
          \"shape\":\"AdministrativeActions\",\
          \"documentation\":\"<p>A list of administrative actions for the file system that are in process or waiting to be processed. Administrative actions describe changes to the Windows file system that you have initiated using the <code>UpdateFileSystem</code> action. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A description of a specific Amazon FSx file system.</p>\"\
    },\
    \"FileSystemAdministratorsGroupName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"^.{1,256}$\"\
    },\
    \"FileSystemFailureDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>A message describing any failures that occurred during file system creation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure providing details of any failures that occur when creating the file system has failed.</p>\"\
    },\
    \"FileSystemId\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The globally unique ID of the file system, assigned by Amazon FSx.</p>\",\
      \"max\":21,\
      \"min\":11,\
      \"pattern\":\"^(fs-[0-9a-f]{8,})$\"\
    },\
    \"FileSystemIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FileSystemId\"},\
      \"documentation\":\"<p>A list of <code>FileSystemId</code>s.</p>\",\
      \"max\":50\
    },\
    \"FileSystemLifecycle\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The lifecycle status of the file system.</p>\",\
      \"enum\":[\
        \"AVAILABLE\",\
        \"CREATING\",\
        \"FAILED\",\
        \"DELETING\",\
        \"MISCONFIGURED\",\
        \"UPDATING\"\
      ]\
    },\
    \"FileSystemMaintenanceOperation\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>An enumeration specifying the currently ongoing maintenance operation.</p>\",\
      \"enum\":[\
        \"PATCHING\",\
        \"BACKING_UP\"\
      ]\
    },\
    \"FileSystemMaintenanceOperations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FileSystemMaintenanceOperation\"},\
      \"documentation\":\"<p>A list of maintenance operations.</p>\",\
      \"max\":20\
    },\
    \"FileSystemNotFound\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>No Amazon FSx file systems were found based upon supplied parameters.</p>\",\
      \"exception\":true\
    },\
    \"FileSystemType\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The type of file system.</p>\",\
      \"enum\":[\
        \"WINDOWS\",\
        \"LUSTRE\"\
      ]\
    },\
    \"FileSystems\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FileSystem\"},\
      \"documentation\":\"<p>A list of file systems.</p>\",\
      \"max\":50\
    },\
    \"Filter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The name for this filter.</p>\"\
        },\
        \"Values\":{\
          \"shape\":\"FilterValues\",\
          \"documentation\":\"<p>The values of the filter. These are all the values for any of the applied filters.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A filter used to restrict the results of describe calls. You can use multiple filters to return results that meet all applied filter requirements.</p>\"\
    },\
    \"FilterName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The name for a filter.</p>\",\
      \"enum\":[\
        \"file-system-id\",\
        \"backup-type\"\
      ]\
    },\
    \"FilterValue\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The value for a filter.</p>\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z\\\\*\\\\.\\\\\\\\/\\\\?\\\\-\\\\_]*$\"\
    },\
    \"FilterValues\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FilterValue\"},\
      \"documentation\":\"<p>A list of filter values.</p>\",\
      \"max\":20\
    },\
    \"Filters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Filter\"},\
      \"documentation\":\"<p>A list of <code>Filter</code> elements.</p>\",\
      \"max\":10\
    },\
    \"Flag\":{\"type\":\"boolean\"},\
    \"IncompatibleParameterError\":{\
      \"type\":\"structure\",\
      \"required\":[\"Parameter\"],\
      \"members\":{\
        \"Parameter\":{\
          \"shape\":\"Parameter\",\
          \"documentation\":\"<p>A parameter that is incompatible with the earlier request.</p>\"\
        },\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The error returned when a second request is received with the same client request token but different parameters settings. A client request token should always uniquely identify a single request.</p>\",\
      \"exception\":true\
    },\
    \"InternalServerError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>A generic error indicating a server-side failure.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidExportPath\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The path provided for data repository export isn't valid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidImportPath\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The path provided for data repository import isn't valid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidNetworkSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"},\
        \"InvalidSubnetId\":{\"shape\":\"SubnetId\"},\
        \"InvalidSecurityGroupId\":{\"shape\":\"SecurityGroupId\"}\
      },\
      \"documentation\":\"<p>One or more network settings specified in the request are invalid. <code>InvalidVpcId</code> means that the ID passed for the virtual private cloud (VPC) is invalid. <code>InvalidSubnetIds</code> returns the list of IDs for subnets that are either invalid or not part of the VPC specified. <code>InvalidSecurityGroupIds</code> returns the list of IDs for security groups that are either invalid or not part of the VPC specified.</p>\",\
      \"exception\":true\
    },\
    \"InvalidPerUnitStorageThroughput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>An invalid value for <code>PerUnitStorageThroughput</code> was provided. Please create your file system again, using a valid value.</p>\",\
      \"exception\":true\
    },\
    \"IpAddress\":{\
      \"type\":\"string\",\
      \"max\":15,\
      \"min\":7,\
      \"pattern\":\"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$\"\
    },\
    \"KmsKeyId\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The ID of the AWS Key Management Service (AWS KMS) key used to encrypt the file system's data for Amazon FSx for Windows File Server file systems and Amazon FSx for Lustre <code>PERSISTENT_1</code> file systems at rest. In either case, if not specified, the Amazon FSx managed key is used. The Amazon FSx for Lustre <code>SCRATCH_1</code> and <code>SCRATCH_2</code> file systems are always encrypted at rest using Amazon FSx managed keys. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/APIReference/API_Encrypt.html\\\">Encrypt</a> in the <i>AWS Key Management Service API Reference</i>.</p>\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"^.{1,2048}$\"\
    },\
    \"LastUpdatedTime\":{\"type\":\"timestamp\"},\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceARN\"],\
      \"members\":{\
        \"ResourceARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The ARN of the Amazon FSx resource that will have its tags listed.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>(Optional) Maximum number of tags to return in the response (integer). This parameter value must be greater than 0. The number of items that Amazon FSx returns is the minimum of the <code>MaxResults</code> parameter specified in the request and the service's internal maximum number of items per page.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>(Optional) Opaque pagination token returned from a previous <code>ListTagsForResource</code> operation (String). If a token present, the action continues the list from where the returning call left off.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request object for <code>ListTagsForResource</code> operation.</p>\"\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>A list of tags on the resource.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>This is present if there are more tags than returned in the response (String). You can use the <code>NextToken</code> value in the later request to fetch the tags. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The response object for <code>ListTagsForResource</code> operation.</p>\"\
    },\
    \"LustreDeploymentType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SCRATCH_1\",\
        \"SCRATCH_2\",\
        \"PERSISTENT_1\"\
      ]\
    },\
    \"LustreFileSystemConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"WeeklyMaintenanceStartTime\":{\
          \"shape\":\"WeeklyTime\",\
          \"documentation\":\"<p>The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time zone. d is the weekday number, from 1 through 7, beginning with Monday and ending with Sunday.</p>\"\
        },\
        \"DataRepositoryConfiguration\":{\"shape\":\"DataRepositoryConfiguration\"},\
        \"DeploymentType\":{\
          \"shape\":\"LustreDeploymentType\",\
          \"documentation\":\"<p>The deployment type of the FSX for Lustre file system.</p>\"\
        },\
        \"PerUnitStorageThroughput\":{\
          \"shape\":\"PerUnitStorageThroughput\",\
          \"documentation\":\"<p> Per unit storage throughput represents the megabytes per second of read or write throughput per 1 tebibyte of storage provisioned. File system throughput capacity is equal to Storage capacity (TiB) * PerUnitStorageThroughput (MB/s/TiB). This option is only valid for <code>PERSISTENT_1</code> deployment types. Valid values are 50, 100, 200. </p>\"\
        },\
        \"MountName\":{\
          \"shape\":\"LustreFileSystemMountName\",\
          \"documentation\":\"<p>You use the <code>MountName</code> value when mounting the file system.</p> <p>For the <code>SCRATCH_1</code> deployment type, this value is always \\\"<code>fsx</code>\\\". For <code>SCRATCH_2</code> and <code>PERSISTENT_1</code> deployment types, this value is a string that is unique within an AWS Region. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration for the Amazon FSx for Lustre file system.</p>\"\
    },\
    \"LustreFileSystemMountName\":{\
      \"type\":\"string\",\
      \"max\":8,\
      \"min\":1,\
      \"pattern\":\"^([A-Za-z0-9_-]{1,8})$\"\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"documentation\":\"<p>The maximum number of resources to return in the response. This value must be an integer greater than zero.</p>\",\
      \"max\":2147483647,\
      \"min\":1\
    },\
    \"Megabytes\":{\
      \"type\":\"integer\",\
      \"max\":512000,\
      \"min\":1\
    },\
    \"MegabytesPerSecond\":{\
      \"type\":\"integer\",\
      \"documentation\":\"<p>Sustained throughput of an Amazon FSx file system in MBps.</p>\",\
      \"max\":2048,\
      \"min\":8\
    },\
    \"MissingFileSystemConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>A file system configuration is required for this operation.</p>\",\
      \"exception\":true\
    },\
    \"NetworkInterfaceId\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>An elastic network interface ID. An elastic network interface is a logical networking component in a virtual private cloud (VPC) that represents a virtual network card. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html\\\">Elastic Network Interfaces</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\",\
      \"max\":21,\
      \"min\":12,\
      \"pattern\":\"^(eni-[0-9a-f]{8,})$\"\
    },\
    \"NetworkInterfaceIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NetworkInterfaceId\"},\
      \"documentation\":\"<p>A list of network interface IDs.</p>\",\
      \"max\":50\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>(Optional) Opaque pagination token returned from a previous operation (String). If present, this token indicates from what point you can continue processing the request, where the previous <code>NextToken</code> value left off.</p>\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\"^(?:[A-Za-z0-9+\\\\/]{4})*(?:[A-Za-z0-9+\\\\/]{2}==|[A-Za-z0-9+\\\\/]{3}=)?$\"\
    },\
    \"NotServiceResourceError\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceARN\"],\
      \"members\":{\
        \"ResourceARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the non-Amazon FSx resource.</p>\"\
        },\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The resource specified for the tagging operation is not a resource type owned by Amazon FSx. Use the API of the relevant service to perform the operation. </p>\",\
      \"exception\":true\
    },\
    \"OrganizationalUnitDistinguishedName\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1,\
      \"pattern\":\"^.{1,2000}$\"\
    },\
    \"Parameter\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The name of a parameter for the request. Parameter names are returned in PascalCase.</p>\",\
      \"min\":1\
    },\
    \"PerUnitStorageThroughput\":{\
      \"type\":\"integer\",\
      \"max\":200,\
      \"min\":50\
    },\
    \"ProgressPercent\":{\
      \"type\":\"integer\",\
      \"documentation\":\"<p>The current percent of progress of an asynchronous task.</p>\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"ReportFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\"REPORT_CSV_20191124\"]\
    },\
    \"ReportScope\":{\
      \"type\":\"string\",\
      \"enum\":[\"FAILED_FILES_ONLY\"]\
    },\
    \"RequestTime\":{\"type\":\"timestamp\"},\
    \"ResourceARN\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The Amazon Resource Name (ARN) for a given resource. ARNs uniquely identify AWS resources. We require an ARN when you need to specify a resource unambiguously across all of AWS. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>\",\
      \"max\":512,\
      \"min\":8,\
      \"pattern\":\"^arn:(?=[^:]+:fsx:[^:]+:\\\\d{12}:)((|(?=[a-z0-9-.]{1,63})(?!\\\\d{1,3}(\\\\.\\\\d{1,3}){3})(?![^:]*-{2})(?![^:]*-\\\\.)(?![^:]*\\\\.-)[a-z0-9].*(?<!-)):){4}(?!/).{0,1024}$\"\
    },\
    \"ResourceDoesNotSupportTagging\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceARN\"],\
      \"members\":{\
        \"ResourceARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource that doesn't support tagging.</p>\"\
        },\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The resource specified does not support tagging. </p>\",\
      \"exception\":true\
    },\
    \"ResourceNotFound\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceARN\"],\
      \"members\":{\
        \"ResourceARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The resource ARN of the resource that can't be found.</p>\"\
        },\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The resource specified by the Amazon Resource Name (ARN) can't be found.</p>\",\
      \"exception\":true\
    },\
    \"SecurityGroupId\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The ID of your Amazon EC2 security group. This ID is used to control network access to the endpoint that Amazon FSx creates on your behalf in each subnet. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html\\\">Amazon EC2 Security Groups for Linux Instances</a> in the <i>Amazon EC2 User Guide</i>.</p>\",\
      \"max\":20,\
      \"min\":11,\
      \"pattern\":\"^(sg-[0-9a-f]{8,})$\"\
    },\
    \"SecurityGroupIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityGroupId\"},\
      \"documentation\":\"<p>A list of security group IDs.</p>\",\
      \"max\":50\
    },\
    \"SelfManagedActiveDirectoryAttributes\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"ActiveDirectoryFullyQualifiedName\",\
          \"documentation\":\"<p>The fully qualified domain name of the self-managed AD directory.</p>\"\
        },\
        \"OrganizationalUnitDistinguishedName\":{\
          \"shape\":\"OrganizationalUnitDistinguishedName\",\
          \"documentation\":\"<p>The fully qualified distinguished name of the organizational unit within the self-managed AD directory to which the Windows File Server instance is joined.</p>\"\
        },\
        \"FileSystemAdministratorsGroup\":{\
          \"shape\":\"FileSystemAdministratorsGroupName\",\
          \"documentation\":\"<p>The name of the domain group whose members have administrative privileges for the FSx file system.</p>\"\
        },\
        \"UserName\":{\
          \"shape\":\"DirectoryUserName\",\
          \"documentation\":\"<p>The user name for the service account on your self-managed AD domain that FSx uses to join to your AD domain.</p>\"\
        },\
        \"DnsIps\":{\
          \"shape\":\"DnsIps\",\
          \"documentation\":\"<p>A list of up to two IP addresses of DNS servers or domain controllers in the self-managed AD directory.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration of the self-managed Microsoft Active Directory (AD) directory to which the Windows File Server instance is joined.</p>\"\
    },\
    \"SelfManagedActiveDirectoryConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainName\",\
        \"UserName\",\
        \"Password\",\
        \"DnsIps\"\
      ],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"ActiveDirectoryFullyQualifiedName\",\
          \"documentation\":\"<p>The fully qualified domain name of the self-managed AD directory, such as <code>corp.example.com</code>.</p>\"\
        },\
        \"OrganizationalUnitDistinguishedName\":{\
          \"shape\":\"OrganizationalUnitDistinguishedName\",\
          \"documentation\":\"<p>(Optional) The fully qualified distinguished name of the organizational unit within your self-managed AD directory that the Windows File Server instance will join. Amazon FSx only accepts OU as the direct parent of the file system. An example is <code>OU=FSx,DC=yourdomain,DC=corp,DC=com</code>. To learn more, see <a href=\\\"https://tools.ietf.org/html/rfc2253\\\">RFC 2253</a>. If none is provided, the FSx file system is created in the default location of your self-managed AD directory. </p> <important> <p>Only Organizational Unit (OU) objects can be the direct parent of the file system that you're creating.</p> </important>\"\
        },\
        \"FileSystemAdministratorsGroup\":{\
          \"shape\":\"FileSystemAdministratorsGroupName\",\
          \"documentation\":\"<p>(Optional) The name of the domain group whose members are granted administrative privileges for the file system. Administrative privileges include taking ownership of files and folders, setting audit controls (audit ACLs) on files and folders, and administering the file system remotely by using the FSx Remote PowerShell. The group that you specify must already exist in your domain. If you don't provide one, your AD domain's Domain Admins group is used.</p>\"\
        },\
        \"UserName\":{\
          \"shape\":\"DirectoryUserName\",\
          \"documentation\":\"<p>The user name for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain. This account must have the permission to join computers to the domain in the organizational unit provided in <code>OrganizationalUnitDistinguishedName</code>, or in the default location of your AD domain.</p>\"\
        },\
        \"Password\":{\
          \"shape\":\"DirectoryPassword\",\
          \"documentation\":\"<p>The password for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain.</p>\"\
        },\
        \"DnsIps\":{\
          \"shape\":\"DnsIps\",\
          \"documentation\":\"<p>A list of up to two IP addresses of DNS servers or domain controllers in the self-managed AD directory. The IP addresses need to be either in the same VPC CIDR range as the one in which your Amazon FSx file system is being created, or in the private IP version 4 (IPv4) address ranges, as specified in <a href=\\\"http://www.faqs.org/rfcs/rfc1918.html\\\">RFC 1918</a>:</p> <ul> <li> <p>10.0.0.0 - 10.255.255.255 (10/8 prefix)</p> </li> <li> <p>172.16.0.0 - 172.31.255.255 (172.16/12 prefix)</p> </li> <li> <p>192.168.0.0 - 192.168.255.255 (192.168/16 prefix)</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration that Amazon FSx uses to join the Windows File Server instance to your self-managed (including on-premises) Microsoft Active Directory (AD) directory.</p>\"\
    },\
    \"SelfManagedActiveDirectoryConfigurationUpdates\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserName\":{\
          \"shape\":\"DirectoryUserName\",\
          \"documentation\":\"<p>The user name for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain. This account must have the permission to join computers to the domain in the organizational unit provided in <code>OrganizationalUnitDistinguishedName</code>.</p>\"\
        },\
        \"Password\":{\
          \"shape\":\"DirectoryPassword\",\
          \"documentation\":\"<p>The password for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain.</p>\"\
        },\
        \"DnsIps\":{\
          \"shape\":\"DnsIps\",\
          \"documentation\":\"<p>A list of up to two IP addresses of DNS servers or domain controllers in the self-managed AD directory.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration that Amazon FSx uses to join the Windows File Server instance to a self-managed Microsoft Active Directory (AD) directory.</p>\"\
    },\
    \"ServiceLimit\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The types of limits on your service utilization. Limits include file system count, total throughput capacity, total storage, and total user-initiated backups. These limits apply for a specific account in a specific AWS Region. You can increase some of them by contacting AWS Support. </p>\",\
      \"enum\":[\
        \"FILE_SYSTEM_COUNT\",\
        \"TOTAL_THROUGHPUT_CAPACITY\",\
        \"TOTAL_STORAGE\",\
        \"TOTAL_USER_INITIATED_BACKUPS\"\
      ]\
    },\
    \"ServiceLimitExceeded\":{\
      \"type\":\"structure\",\
      \"required\":[\"Limit\"],\
      \"members\":{\
        \"Limit\":{\
          \"shape\":\"ServiceLimit\",\
          \"documentation\":\"<p>Enumeration of the service limit that was exceeded. </p>\"\
        },\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>An error indicating that a particular service limit was exceeded. You can increase some service limits by contacting AWS Support. </p>\",\
      \"exception\":true\
    },\
    \"StartTime\":{\"type\":\"timestamp\"},\
    \"Status\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FAILED\",\
        \"IN_PROGRESS\",\
        \"PENDING\",\
        \"COMPLETED\",\
        \"UPDATED_OPTIMIZING\"\
      ]\
    },\
    \"StorageCapacity\":{\
      \"type\":\"integer\",\
      \"documentation\":\"<p>The storage capacity for your Amazon FSx file system, in gibibytes.</p>\",\
      \"max\":2147483647,\
      \"min\":0\
    },\
    \"StorageType\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The storage type for your Amazon FSx file system.</p>\",\
      \"enum\":[\
        \"SSD\",\
        \"HDD\"\
      ]\
    },\
    \"SubnetId\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The ID for a subnet. A <i>subnet</i> is a range of IP addresses in your virtual private cloud (VPC). For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html\\\">VPC and Subnets</a> in the <i>Amazon VPC User Guide.</i> </p>\",\
      \"max\":24,\
      \"min\":15,\
      \"pattern\":\"^(subnet-[0-9a-f]{8,})$\"\
    },\
    \"SubnetIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubnetId\"},\
      \"documentation\":\"<p>A list of subnet IDs. Currently, you can specify only one subnet ID in a call to the <code>CreateFileSystem</code> operation.</p>\",\
      \"max\":50\
    },\
    \"SucceededCount\":{\"type\":\"long\"},\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>A value that specifies the <code>TagKey</code>, the name of the tag. Tag keys must be unique for the resource to which they are attached.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>A value that specifies the <code>TagValue</code>, the value assigned to the corresponding tag key. Tag values can be null and don't have to be unique in a tag set. For example, you can have a key-value pair in a tag set of <code>finances : April</code> and also of <code>payroll : April</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies a key-value pair for a resource tag.</p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>A string of 1 to 128 characters that specifies the key for a tag. Tag keys must be unique for the resource to which they are attached.</p>\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"TagKeys\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"documentation\":\"<p>A list of <code>TagKey</code> values, with a maximum of 50 elements.</p>\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceARN\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon FSx resource that you want to tag.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>A list of tags for the resource. If a tag with a given key already exists, the value is replaced by the one specified in this parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request object for the <code>TagResource</code> operation.</p>\"\
    },\
    \"TagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The response object for the <code>TagResource</code> operation.</p>\"\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>A string of 0 to 256 characters that specifies the value for a tag. Tag values can be null and don't have to be unique in a tag set.</p>\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"Tags\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"documentation\":\"<p>A list of <code>Tag</code> values, with a maximum of 50 elements.</p>\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"TaskId\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":12,\
      \"pattern\":\"^(task-[0-9a-f]{17,})$\"\
    },\
    \"TaskIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TaskId\"},\
      \"max\":50\
    },\
    \"TotalCount\":{\"type\":\"long\"},\
    \"UnsupportedOperation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The requested operation is not supported for this resource or API.</p>\",\
      \"exception\":true\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceARN\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The ARN of the Amazon FSx resource to untag.</p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeys\",\
          \"documentation\":\"<p>A list of keys of tags on the resource to untag. In case the tag key doesn't exist, the call will still succeed to be idempotent.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request object for <code>UntagResource</code> action.</p>\"\
    },\
    \"UntagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The response object for <code>UntagResource</code> action.</p>\"\
    },\
    \"UpdateFileSystemLustreConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"WeeklyMaintenanceStartTime\":{\
          \"shape\":\"WeeklyTime\",\
          \"documentation\":\"<p>The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time zone. d is the weekday number, from 1 through 7, beginning with Monday and ending with Sunday.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration object for Amazon FSx for Lustre file systems used in the <code>UpdateFileSystem</code> operation.</p>\"\
    },\
    \"UpdateFileSystemRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FileSystemId\"],\
      \"members\":{\
        \"FileSystemId\":{\
          \"shape\":\"FileSystemId\",\
          \"documentation\":\"<p>Identifies the file system that you are updating.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>A string of up to 64 ASCII characters that Amazon FSx uses to ensure idempotent updates. This string is automatically filled on your behalf when you use the AWS Command Line Interface (AWS CLI) or an AWS SDK.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"StorageCapacity\":{\
          \"shape\":\"StorageCapacity\",\
          \"documentation\":\"<p>Use this parameter to increase the storage capacity of an Amazon FSx for Windows File Server file system. Specifies the storage capacity target value, GiB, for the file system you're updating. The storage capacity target value must be at least 10 percent (%) greater than the current storage capacity value. In order to increase storage capacity, the file system needs to have at least 16 MB/s of throughput capacity. You cannot make a storage capacity increase request if there is an existing storage capacity increase request in progress. For more information, see <a href=\\\"https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-storage-capacity.html\\\">Managing Storage Capacity</a>.</p>\"\
        },\
        \"WindowsConfiguration\":{\
          \"shape\":\"UpdateFileSystemWindowsConfiguration\",\
          \"documentation\":\"<p>The configuration updates for an Amazon FSx for Windows File Server file system.</p>\"\
        },\
        \"LustreConfiguration\":{\"shape\":\"UpdateFileSystemLustreConfiguration\"}\
      },\
      \"documentation\":\"<p>The request object for the <code>UpdateFileSystem</code> operation.</p>\"\
    },\
    \"UpdateFileSystemResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FileSystem\":{\
          \"shape\":\"FileSystem\",\
          \"documentation\":\"<p>A description of the file system that was updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response object for the <code>UpdateFileSystem</code> operation.</p>\"\
    },\
    \"UpdateFileSystemWindowsConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"WeeklyMaintenanceStartTime\":{\
          \"shape\":\"WeeklyTime\",\
          \"documentation\":\"<p>The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time zone. Where d is the weekday number, from 1 through 7, with 1 = Monday and 7 = Sunday.</p>\"\
        },\
        \"DailyAutomaticBackupStartTime\":{\
          \"shape\":\"DailyTime\",\
          \"documentation\":\"<p>The preferred time to start the daily automatic backup, in the UTC time zone, for example, <code>02:00</code> </p>\"\
        },\
        \"AutomaticBackupRetentionDays\":{\
          \"shape\":\"AutomaticBackupRetentionDays\",\
          \"documentation\":\"<p>The number of days to retain automatic daily backups. Setting this to zero (0) disables automatic daily backups. You can retain automatic daily backups for a maximum of 35 days. For more information, see <a href=\\\"https://docs.aws.amazon.com/fsx/latest/WindowsGuide/using-backups.html#automatic-backups\\\">Working with Automatic Daily Backups</a>.</p>\"\
        },\
        \"ThroughputCapacity\":{\
          \"shape\":\"MegabytesPerSecond\",\
          \"documentation\":\"<p>Sets the target value for a file system's throughput capacity, in MB/s, that you are updating the file system to. Valid values are 8, 16, 32, 64, 128, 256, 512, 1024, 2048. You cannot make a throughput capacity update request if there is an existing throughput capacity update request in progress. For more information, see <a href=\\\"https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-throughput-capacity.html\\\">Managing Throughput Capacity</a>.</p>\"\
        },\
        \"SelfManagedActiveDirectoryConfiguration\":{\
          \"shape\":\"SelfManagedActiveDirectoryConfigurationUpdates\",\
          \"documentation\":\"<p>The configuration Amazon FSx uses to join the Windows File Server instance to the self-managed Microsoft AD directory. You cannot make a self-managed Microsoft AD update request if there is an existing self-managed Microsoft AD update request in progress.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Updates the configuration for an existing Amazon FSx for Windows File Server file system. Amazon FSx only overwrites existing properties with non-null values provided in the request.</p>\"\
    },\
    \"VpcId\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The ID of your virtual private cloud (VPC). For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html\\\">VPC and Subnets</a> in the <i>Amazon VPC User Guide</i>.</p>\",\
      \"max\":21,\
      \"min\":12,\
      \"pattern\":\"^(vpc-[0-9a-f]{8,})$\"\
    },\
    \"WeeklyTime\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>A recurring weekly time, in the format <code>D:HH:MM</code>. </p> <p> <code>D</code> is the day of the week, for which 1 represents Monday and 7 represents Sunday. For further details, see <a href=\\\"https://en.wikipedia.org/wiki/ISO_week_date\\\">the ISO-8601 spec as described on Wikipedia</a>.</p> <p> <code>HH</code> is the zero-padded hour of the day (0-23), and <code>MM</code> is the zero-padded minute of the hour. </p> <p>For example, <code>1:05:00</code> specifies maintenance at 5 AM Monday.</p>\",\
      \"max\":7,\
      \"min\":7,\
      \"pattern\":\"^[1-7]:([01]\\\\d|2[0-3]):?([0-5]\\\\d)$\"\
    },\
    \"WindowsDeploymentType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"MULTI_AZ_1\",\
        \"SINGLE_AZ_1\",\
        \"SINGLE_AZ_2\"\
      ]\
    },\
    \"WindowsFileSystemConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ActiveDirectoryId\":{\
          \"shape\":\"DirectoryId\",\
          \"documentation\":\"<p>The ID for an existing Microsoft Active Directory instance that the file system should join when it's created.</p>\"\
        },\
        \"SelfManagedActiveDirectoryConfiguration\":{\"shape\":\"SelfManagedActiveDirectoryAttributes\"},\
        \"DeploymentType\":{\
          \"shape\":\"WindowsDeploymentType\",\
          \"documentation\":\"<p>Specifies the file system deployment type, valid values are the following:</p> <ul> <li> <p> <code>MULTI_AZ_1</code> - Specifies a high availability file system that is configured for Multi-AZ redundancy to tolerate temporary Availability Zone (AZ) unavailability, and supports SSD and HDD storage.</p> </li> <li> <p> <code>SINGLE_AZ_1</code> - (Default) Specifies a file system that is configured for single AZ redundancy, only supports SSD storage.</p> </li> <li> <p> <code>SINGLE_AZ_2</code> - Latest generation Single AZ file system. Specifies a file system that is configured for single AZ redundancy and supports SSD and HDD storage.</p> </li> </ul> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/fsx/latest/WindowsGuide/high-availability-multiAZ.html\\\">Single-AZ and Multi-AZ File Systems</a>.</p>\"\
        },\
        \"RemoteAdministrationEndpoint\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>For <code>MULTI_AZ_1</code> deployment types, use this endpoint when performing administrative tasks on the file system using Amazon FSx Remote PowerShell.</p> <p>For <code>SINGLE_AZ_1</code> and <code>SINGLE_AZ_2</code> deployment types, this is the DNS name of the file system.</p> <p>This endpoint is temporarily unavailable when the file system is undergoing maintenance.</p>\"\
        },\
        \"PreferredSubnetId\":{\
          \"shape\":\"SubnetId\",\
          \"documentation\":\"<p>For <code>MULTI_AZ_1</code> deployment types, it specifies the ID of the subnet where the preferred file server is located. Must be one of the two subnet IDs specified in <code>SubnetIds</code> property. Amazon FSx serves traffic from this subnet except in the event of a failover to the secondary file server.</p> <p>For <code>SINGLE_AZ_1</code> and <code>SINGLE_AZ_2</code> deployment types, this value is the same as that for <code>SubnetIDs</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/fsx/latest/WindowsGuide/high-availability-multiAZ.html#single-multi-az-resources\\\">Availability and Durability: Single-AZ and Multi-AZ File Systems</a> </p>\"\
        },\
        \"PreferredFileServerIp\":{\
          \"shape\":\"IpAddress\",\
          \"documentation\":\"<p>For <code>MULTI_AZ_1</code> deployment types, the IP address of the primary, or preferred, file server.</p> <p>Use this IP address when mounting the file system on Linux SMB clients or Windows SMB clients that are not joined to a Microsoft Active Directory. Applicable for all Windows file system deployment types. This IP address is temporarily unavailable when the file system is undergoing maintenance. For Linux and Windows SMB clients that are joined to an Active Directory, use the file system's DNSName instead. For more information on mapping and mounting file shares, see <a href=\\\"https://docs.aws.amazon.com/fsx/latest/WindowsGuide/accessing-file-shares.html\\\">Accessing File Shares</a>.</p>\"\
        },\
        \"ThroughputCapacity\":{\
          \"shape\":\"MegabytesPerSecond\",\
          \"documentation\":\"<p>The throughput of an Amazon FSx file system, measured in megabytes per second.</p>\"\
        },\
        \"MaintenanceOperationsInProgress\":{\
          \"shape\":\"FileSystemMaintenanceOperations\",\
          \"documentation\":\"<p>The list of maintenance operations in progress for this file system.</p>\"\
        },\
        \"WeeklyMaintenanceStartTime\":{\
          \"shape\":\"WeeklyTime\",\
          \"documentation\":\"<p>The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time zone. d is the weekday number, from 1 through 7, beginning with Monday and ending with Sunday.</p>\"\
        },\
        \"DailyAutomaticBackupStartTime\":{\
          \"shape\":\"DailyTime\",\
          \"documentation\":\"<p>The preferred time to take daily automatic backups, in the UTC time zone.</p>\"\
        },\
        \"AutomaticBackupRetentionDays\":{\
          \"shape\":\"AutomaticBackupRetentionDays\",\
          \"documentation\":\"<p>The number of days to retain automatic backups. Setting this to 0 disables automatic backups. You can retain automatic backups for a maximum of 35 days.</p>\"\
        },\
        \"CopyTagsToBackups\":{\
          \"shape\":\"Flag\",\
          \"documentation\":\"<p>A boolean flag indicating whether tags on the file system should be copied to backups. This value defaults to false. If it's set to true, all tags on the file system are copied to all automatic backups and any user-initiated backups where the user doesn't specify any tags. If this value is true, and you specify one or more tags, only the specified tags are copied to backups. If you specify one or more tags when creating a user-initiated backup, no tags are copied from the file system, regardless of this value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration for this Microsoft Windows file system.</p>\"\
    }\
  },\
  \"documentation\":\"<p>Amazon FSx is a fully managed service that makes it easy for storage and application administrators to launch and use shared file storage.</p>\"\
}\
";
}

@end
