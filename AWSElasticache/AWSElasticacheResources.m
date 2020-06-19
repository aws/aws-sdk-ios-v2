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

#import "AWSElasticacheResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSElasticacheResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSElasticacheResources

+ (instancetype)sharedInstance {
    static AWSElasticacheResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSElasticacheResources new];
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
    \"apiVersion\":\"2015-02-02\",\
    \"endpointPrefix\":\"elasticache\",\
    \"protocol\":\"query\",\
    \"serviceFullName\":\"Amazon ElastiCache\",\
    \"serviceId\":\"ElastiCache\",\
    \"signatureVersion\":\"v4\",\
    \"uid\":\"elasticache-2015-02-02\",\
    \"xmlNamespace\":\"http://elasticache.amazonaws.com/doc/2015-02-02/\"\
  },\
  \"operations\":{\
    \"AddTagsToResource\":{\
      \"name\":\"AddTagsToResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AddTagsToResourceMessage\"},\
      \"output\":{\
        \"shape\":\"TagListMessage\",\
        \"resultWrapper\":\"AddTagsToResourceResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheClusterNotFoundFault\"},\
        {\"shape\":\"SnapshotNotFoundFault\"},\
        {\"shape\":\"TagQuotaPerResourceExceeded\"},\
        {\"shape\":\"InvalidARNFault\"}\
      ],\
      \"documentation\":\"<p>Adds up to 50 cost allocation tags to the named resource. A cost allocation tag is a key-value pair where the key and value are case-sensitive. You can use cost allocation tags to categorize and track your AWS costs.</p> <p> When you apply tags to your ElastiCache resources, AWS generates a cost allocation report as a comma-separated value (CSV) file with your usage and costs aggregated by your tags. You can apply tags that represent business categories (such as cost centers, application names, or owners) to organize your costs across multiple services. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Tagging.html\\\">Using Cost Allocation Tags in Amazon ElastiCache</a> in the <i>ElastiCache User Guide</i>.</p>\"\
    },\
    \"AuthorizeCacheSecurityGroupIngress\":{\
      \"name\":\"AuthorizeCacheSecurityGroupIngress\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AuthorizeCacheSecurityGroupIngressMessage\"},\
      \"output\":{\
        \"shape\":\"AuthorizeCacheSecurityGroupIngressResult\",\
        \"resultWrapper\":\"AuthorizeCacheSecurityGroupIngressResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheSecurityGroupNotFoundFault\"},\
        {\"shape\":\"InvalidCacheSecurityGroupStateFault\"},\
        {\"shape\":\"AuthorizationAlreadyExistsFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Allows network ingress to a cache security group. Applications using ElastiCache must be running on Amazon EC2, and Amazon EC2 security groups are used as the authorization mechanism.</p> <note> <p>You cannot authorize ingress from an Amazon EC2 security group in one region to an ElastiCache cluster in another region.</p> </note>\"\
    },\
    \"BatchApplyUpdateAction\":{\
      \"name\":\"BatchApplyUpdateAction\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchApplyUpdateActionMessage\"},\
      \"output\":{\
        \"shape\":\"UpdateActionResultsMessage\",\
        \"resultWrapper\":\"BatchApplyUpdateActionResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ServiceUpdateNotFoundFault\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Apply the service update. For more information on service updates and applying them, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/applying-updates.html\\\">Applying Service Updates</a>.</p>\"\
    },\
    \"BatchStopUpdateAction\":{\
      \"name\":\"BatchStopUpdateAction\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchStopUpdateActionMessage\"},\
      \"output\":{\
        \"shape\":\"UpdateActionResultsMessage\",\
        \"resultWrapper\":\"BatchStopUpdateActionResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ServiceUpdateNotFoundFault\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Stop the service update. For more information on service updates and stopping them, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/stopping-self-service-updates.html\\\">Stopping Service Updates</a>.</p>\"\
    },\
    \"CompleteMigration\":{\
      \"name\":\"CompleteMigration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CompleteMigrationMessage\"},\
      \"output\":{\
        \"shape\":\"CompleteMigrationResponse\",\
        \"resultWrapper\":\"CompleteMigrationResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidReplicationGroupStateFault\"},\
        {\"shape\":\"ReplicationGroupNotUnderMigrationFault\"}\
      ],\
      \"documentation\":\"<p>Complete the migration of data.</p>\"\
    },\
    \"CopySnapshot\":{\
      \"name\":\"CopySnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CopySnapshotMessage\"},\
      \"output\":{\
        \"shape\":\"CopySnapshotResult\",\
        \"resultWrapper\":\"CopySnapshotResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"SnapshotAlreadyExistsFault\"},\
        {\"shape\":\"SnapshotNotFoundFault\"},\
        {\"shape\":\"SnapshotQuotaExceededFault\"},\
        {\"shape\":\"InvalidSnapshotStateFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Makes a copy of an existing snapshot.</p> <note> <p>This operation is valid for Redis only.</p> </note> <important> <p>Users or groups that have permissions to use the <code>CopySnapshot</code> operation can create their own Amazon S3 buckets and copy snapshots to it. To control access to your snapshots, use an IAM policy to control who has the ability to use the <code>CopySnapshot</code> operation. For more information about using IAM to control the use of ElastiCache operations, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html\\\">Exporting Snapshots</a> and <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/IAM.html\\\">Authentication &amp; Access Control</a>.</p> </important> <p>You could receive the following error messages.</p> <p class=\\\"title\\\"> <b>Error Messages</b> </p> <ul> <li> <p> <b>Error Message:</b> The S3 bucket %s is outside of the region.</p> <p> <b>Solution:</b> Create an Amazon S3 bucket in the same region as your snapshot. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket\\\">Step 1: Create an Amazon S3 Bucket</a> in the ElastiCache User Guide.</p> </li> <li> <p> <b>Error Message:</b> The S3 bucket %s does not exist.</p> <p> <b>Solution:</b> Create an Amazon S3 bucket in the same region as your snapshot. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket\\\">Step 1: Create an Amazon S3 Bucket</a> in the ElastiCache User Guide.</p> </li> <li> <p> <b>Error Message:</b> The S3 bucket %s is not owned by the authenticated user.</p> <p> <b>Solution:</b> Create an Amazon S3 bucket in the same region as your snapshot. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket\\\">Step 1: Create an Amazon S3 Bucket</a> in the ElastiCache User Guide.</p> </li> <li> <p> <b>Error Message:</b> The authenticated user does not have sufficient permissions to perform the desired activity.</p> <p> <b>Solution:</b> Contact your system administrator to get the needed permissions.</p> </li> <li> <p> <b>Error Message:</b> The S3 bucket %s already contains an object with key %s.</p> <p> <b>Solution:</b> Give the <code>TargetSnapshotName</code> a new and unique value. If exporting a snapshot, you could alternatively create a new Amazon S3 bucket and use this same value for <code>TargetSnapshotName</code>.</p> </li> <li> <p> <b>Error Message: </b> ElastiCache has not been granted READ permissions %s on the S3 Bucket.</p> <p> <b>Solution:</b> Add List and Read permissions on the bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access\\\">Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket</a> in the ElastiCache User Guide.</p> </li> <li> <p> <b>Error Message: </b> ElastiCache has not been granted WRITE permissions %s on the S3 Bucket.</p> <p> <b>Solution:</b> Add Upload/Delete permissions on the bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access\\\">Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket</a> in the ElastiCache User Guide.</p> </li> <li> <p> <b>Error Message: </b> ElastiCache has not been granted READ_ACP permissions %s on the S3 Bucket.</p> <p> <b>Solution:</b> Add View Permissions on the bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access\\\">Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket</a> in the ElastiCache User Guide.</p> </li> </ul>\"\
    },\
    \"CreateCacheCluster\":{\
      \"name\":\"CreateCacheCluster\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateCacheClusterMessage\"},\
      \"output\":{\
        \"shape\":\"CreateCacheClusterResult\",\
        \"resultWrapper\":\"CreateCacheClusterResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidReplicationGroupStateFault\"},\
        {\"shape\":\"CacheClusterAlreadyExistsFault\"},\
        {\"shape\":\"InsufficientCacheClusterCapacityFault\"},\
        {\"shape\":\"CacheSecurityGroupNotFoundFault\"},\
        {\"shape\":\"CacheSubnetGroupNotFoundFault\"},\
        {\"shape\":\"ClusterQuotaForCustomerExceededFault\"},\
        {\"shape\":\"NodeQuotaForClusterExceededFault\"},\
        {\"shape\":\"NodeQuotaForCustomerExceededFault\"},\
        {\"shape\":\"CacheParameterGroupNotFoundFault\"},\
        {\"shape\":\"InvalidVPCNetworkStateFault\"},\
        {\"shape\":\"TagQuotaPerResourceExceeded\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Creates a cluster. All nodes in the cluster run the same protocol-compliant cache engine software, either Memcached or Redis.</p> <p>This operation is not supported for Redis (cluster mode enabled) clusters.</p>\"\
    },\
    \"CreateCacheParameterGroup\":{\
      \"name\":\"CreateCacheParameterGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateCacheParameterGroupMessage\"},\
      \"output\":{\
        \"shape\":\"CreateCacheParameterGroupResult\",\
        \"resultWrapper\":\"CreateCacheParameterGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheParameterGroupQuotaExceededFault\"},\
        {\"shape\":\"CacheParameterGroupAlreadyExistsFault\"},\
        {\"shape\":\"InvalidCacheParameterGroupStateFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Creates a new Amazon ElastiCache cache parameter group. An ElastiCache cache parameter group is a collection of parameters and their values that are applied to all of the nodes in any cluster or replication group using the CacheParameterGroup.</p> <p>A newly created CacheParameterGroup is an exact duplicate of the default parameter group for the CacheParameterGroupFamily. To customize the newly created CacheParameterGroup you can change the values of specific parameters. For more information, see:</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_ModifyCacheParameterGroup.html\\\">ModifyCacheParameterGroup</a> in the ElastiCache API Reference.</p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ParameterGroups.html\\\">Parameters and Parameter Groups</a> in the ElastiCache User Guide.</p> </li> </ul>\"\
    },\
    \"CreateCacheSecurityGroup\":{\
      \"name\":\"CreateCacheSecurityGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateCacheSecurityGroupMessage\"},\
      \"output\":{\
        \"shape\":\"CreateCacheSecurityGroupResult\",\
        \"resultWrapper\":\"CreateCacheSecurityGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheSecurityGroupAlreadyExistsFault\"},\
        {\"shape\":\"CacheSecurityGroupQuotaExceededFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Creates a new cache security group. Use a cache security group to control access to one or more clusters.</p> <p>Cache security groups are only used when you are creating a cluster outside of an Amazon Virtual Private Cloud (Amazon VPC). If you are creating a cluster inside of a VPC, use a cache subnet group instead. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_CreateCacheSubnetGroup.html\\\">CreateCacheSubnetGroup</a>.</p>\"\
    },\
    \"CreateCacheSubnetGroup\":{\
      \"name\":\"CreateCacheSubnetGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateCacheSubnetGroupMessage\"},\
      \"output\":{\
        \"shape\":\"CreateCacheSubnetGroupResult\",\
        \"resultWrapper\":\"CreateCacheSubnetGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheSubnetGroupAlreadyExistsFault\"},\
        {\"shape\":\"CacheSubnetGroupQuotaExceededFault\"},\
        {\"shape\":\"CacheSubnetQuotaExceededFault\"},\
        {\"shape\":\"InvalidSubnet\"}\
      ],\
      \"documentation\":\"<p>Creates a new cache subnet group.</p> <p>Use this parameter only when you are creating a cluster in an Amazon Virtual Private Cloud (Amazon VPC).</p>\"\
    },\
    \"CreateGlobalReplicationGroup\":{\
      \"name\":\"CreateGlobalReplicationGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateGlobalReplicationGroupMessage\"},\
      \"output\":{\
        \"shape\":\"CreateGlobalReplicationGroupResult\",\
        \"resultWrapper\":\"CreateGlobalReplicationGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidReplicationGroupStateFault\"},\
        {\"shape\":\"GlobalReplicationGroupAlreadyExistsFault\"},\
        {\"shape\":\"ServiceLinkedRoleNotFoundFault\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Global Datastore for Redis offers fully managed, fast, reliable and secure cross-region replication. Using Global Datastore for Redis, you can create cross-region read replica clusters for ElastiCache for Redis to enable low-latency reads and disaster recovery across regions. For more information, see <a href=\\\"/AmazonElastiCache/latest/red-ug/Redis-Global-Clusters.html\\\">Replication Across Regions Using Global Datastore</a>. </p> <ul> <li> <p>The <b>GlobalReplicationGroupIdSuffix</b> is the name of the Global Datastore.</p> </li> <li> <p>The <b>PrimaryReplicationGroupId</b> represents the name of the primary cluster that accepts writes and will replicate updates to the secondary cluster.</p> </li> </ul>\"\
    },\
    \"CreateReplicationGroup\":{\
      \"name\":\"CreateReplicationGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateReplicationGroupMessage\"},\
      \"output\":{\
        \"shape\":\"CreateReplicationGroupResult\",\
        \"resultWrapper\":\"CreateReplicationGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheClusterNotFoundFault\"},\
        {\"shape\":\"InvalidCacheClusterStateFault\"},\
        {\"shape\":\"ReplicationGroupAlreadyExistsFault\"},\
        {\"shape\":\"InsufficientCacheClusterCapacityFault\"},\
        {\"shape\":\"CacheSecurityGroupNotFoundFault\"},\
        {\"shape\":\"CacheSubnetGroupNotFoundFault\"},\
        {\"shape\":\"ClusterQuotaForCustomerExceededFault\"},\
        {\"shape\":\"NodeQuotaForClusterExceededFault\"},\
        {\"shape\":\"NodeQuotaForCustomerExceededFault\"},\
        {\"shape\":\"CacheParameterGroupNotFoundFault\"},\
        {\"shape\":\"InvalidVPCNetworkStateFault\"},\
        {\"shape\":\"TagQuotaPerResourceExceeded\"},\
        {\"shape\":\"NodeGroupsPerReplicationGroupQuotaExceededFault\"},\
        {\"shape\":\"GlobalReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidGlobalReplicationGroupStateFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Creates a Redis (cluster mode disabled) or a Redis (cluster mode enabled) replication group.</p> <p>This API can be used to create a standalone regional replication group or a secondary replication group associated with a Global Datastore.</p> <p>A Redis (cluster mode disabled) replication group is a collection of clusters, where one of the clusters is a read/write primary and the others are read-only replicas. Writes to the primary are asynchronously propagated to the replicas.</p> <p>A Redis (cluster mode enabled) replication group is a collection of 1 to 90 node groups (shards). Each node group (shard) has one read/write primary node and up to 5 read-only replica nodes. Writes to the primary are asynchronously propagated to the replicas. Redis (cluster mode enabled) replication groups partition the data across node groups (shards).</p> <p>When a Redis (cluster mode disabled) replication group has been successfully created, you can add one or more read replicas to it, up to a total of 5 read replicas. You cannot alter a Redis (cluster mode enabled) replication group after it has been created. However, if you need to increase or decrease the number of node groups (console: shards), you can avail yourself of ElastiCache for Redis' enhanced backup and restore. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-restoring.html\\\">Restoring From a Backup with Cluster Resizing</a> in the <i>ElastiCache User Guide</i>.</p> <note> <p>This operation is valid for Redis only.</p> </note>\"\
    },\
    \"CreateSnapshot\":{\
      \"name\":\"CreateSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateSnapshotMessage\"},\
      \"output\":{\
        \"shape\":\"CreateSnapshotResult\",\
        \"resultWrapper\":\"CreateSnapshotResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"SnapshotAlreadyExistsFault\"},\
        {\"shape\":\"CacheClusterNotFoundFault\"},\
        {\"shape\":\"ReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidCacheClusterStateFault\"},\
        {\"shape\":\"InvalidReplicationGroupStateFault\"},\
        {\"shape\":\"SnapshotQuotaExceededFault\"},\
        {\"shape\":\"SnapshotFeatureNotSupportedFault\"},\
        {\"shape\":\"InvalidParameterCombinationException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Creates a copy of an entire cluster or replication group at a specific moment in time.</p> <note> <p>This operation is valid for Redis only.</p> </note>\"\
    },\
    \"DecreaseNodeGroupsInGlobalReplicationGroup\":{\
      \"name\":\"DecreaseNodeGroupsInGlobalReplicationGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DecreaseNodeGroupsInGlobalReplicationGroupMessage\"},\
      \"output\":{\
        \"shape\":\"DecreaseNodeGroupsInGlobalReplicationGroupResult\",\
        \"resultWrapper\":\"DecreaseNodeGroupsInGlobalReplicationGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"GlobalReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidGlobalReplicationGroupStateFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Decreases the number of node groups in a Global Datastore</p>\"\
    },\
    \"DecreaseReplicaCount\":{\
      \"name\":\"DecreaseReplicaCount\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DecreaseReplicaCountMessage\"},\
      \"output\":{\
        \"shape\":\"DecreaseReplicaCountResult\",\
        \"resultWrapper\":\"DecreaseReplicaCountResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidReplicationGroupStateFault\"},\
        {\"shape\":\"InvalidCacheClusterStateFault\"},\
        {\"shape\":\"InvalidVPCNetworkStateFault\"},\
        {\"shape\":\"InsufficientCacheClusterCapacityFault\"},\
        {\"shape\":\"ClusterQuotaForCustomerExceededFault\"},\
        {\"shape\":\"NodeGroupsPerReplicationGroupQuotaExceededFault\"},\
        {\"shape\":\"NodeQuotaForCustomerExceededFault\"},\
        {\"shape\":\"ServiceLinkedRoleNotFoundFault\"},\
        {\"shape\":\"NoOperationFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Dynamically decreases the number of replicas in a Redis (cluster mode disabled) replication group or the number of replica nodes in one or more node groups (shards) of a Redis (cluster mode enabled) replication group. This operation is performed with no cluster down time.</p>\"\
    },\
    \"DeleteCacheCluster\":{\
      \"name\":\"DeleteCacheCluster\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteCacheClusterMessage\"},\
      \"output\":{\
        \"shape\":\"DeleteCacheClusterResult\",\
        \"resultWrapper\":\"DeleteCacheClusterResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheClusterNotFoundFault\"},\
        {\"shape\":\"InvalidCacheClusterStateFault\"},\
        {\"shape\":\"SnapshotAlreadyExistsFault\"},\
        {\"shape\":\"SnapshotFeatureNotSupportedFault\"},\
        {\"shape\":\"SnapshotQuotaExceededFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Deletes a previously provisioned cluster. <code>DeleteCacheCluster</code> deletes all associated cache nodes, node endpoints and the cluster itself. When you receive a successful response from this operation, Amazon ElastiCache immediately begins deleting the cluster; you cannot cancel or revert this operation.</p> <p>This operation is not valid for:</p> <ul> <li> <p>Redis (cluster mode enabled) clusters</p> </li> <li> <p>A cluster that is the last read replica of a replication group</p> </li> <li> <p>A node group (shard) that has Multi-AZ mode enabled</p> </li> <li> <p>A cluster from a Redis (cluster mode enabled) replication group</p> </li> <li> <p>A cluster that is not in the <code>available</code> state</p> </li> </ul>\"\
    },\
    \"DeleteCacheParameterGroup\":{\
      \"name\":\"DeleteCacheParameterGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteCacheParameterGroupMessage\"},\
      \"errors\":[\
        {\"shape\":\"InvalidCacheParameterGroupStateFault\"},\
        {\"shape\":\"CacheParameterGroupNotFoundFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified cache parameter group. You cannot delete a cache parameter group if it is associated with any cache clusters.</p>\"\
    },\
    \"DeleteCacheSecurityGroup\":{\
      \"name\":\"DeleteCacheSecurityGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteCacheSecurityGroupMessage\"},\
      \"errors\":[\
        {\"shape\":\"InvalidCacheSecurityGroupStateFault\"},\
        {\"shape\":\"CacheSecurityGroupNotFoundFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Deletes a cache security group.</p> <note> <p>You cannot delete a cache security group if it is associated with any clusters.</p> </note>\"\
    },\
    \"DeleteCacheSubnetGroup\":{\
      \"name\":\"DeleteCacheSubnetGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteCacheSubnetGroupMessage\"},\
      \"errors\":[\
        {\"shape\":\"CacheSubnetGroupInUse\"},\
        {\"shape\":\"CacheSubnetGroupNotFoundFault\"}\
      ],\
      \"documentation\":\"<p>Deletes a cache subnet group.</p> <note> <p>You cannot delete a cache subnet group if it is associated with any clusters.</p> </note>\"\
    },\
    \"DeleteGlobalReplicationGroup\":{\
      \"name\":\"DeleteGlobalReplicationGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteGlobalReplicationGroupMessage\"},\
      \"output\":{\
        \"shape\":\"DeleteGlobalReplicationGroupResult\",\
        \"resultWrapper\":\"DeleteGlobalReplicationGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"GlobalReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidGlobalReplicationGroupStateFault\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Deleting a Global Datastore is a two-step process: </p> <ul> <li> <p>First, you must <a>DisassociateGlobalReplicationGroup</a> to remove the secondary clusters in the Global Datastore.</p> </li> <li> <p>Once the Global Datastore contains only the primary cluster, you can use DeleteGlobalReplicationGroup API to delete the Global Datastore while retainining the primary cluster using Retainâ¦= true.</p> </li> </ul> <p>Since the Global Datastore has only a primary cluster, you can delete the Global Datastore while retaining the primary by setting <code>RetainPrimaryCluster=true</code>.</p> <p>When you receive a successful response from this operation, Amazon ElastiCache immediately begins deleting the selected resources; you cannot cancel or revert this operation.</p>\"\
    },\
    \"DeleteReplicationGroup\":{\
      \"name\":\"DeleteReplicationGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteReplicationGroupMessage\"},\
      \"output\":{\
        \"shape\":\"DeleteReplicationGroupResult\",\
        \"resultWrapper\":\"DeleteReplicationGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidReplicationGroupStateFault\"},\
        {\"shape\":\"SnapshotAlreadyExistsFault\"},\
        {\"shape\":\"SnapshotFeatureNotSupportedFault\"},\
        {\"shape\":\"SnapshotQuotaExceededFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Deletes an existing replication group. By default, this operation deletes the entire replication group, including the primary/primaries and all of the read replicas. If the replication group has only one primary, you can optionally delete only the read replicas, while retaining the primary by setting <code>RetainPrimaryCluster=true</code>.</p> <p>When you receive a successful response from this operation, Amazon ElastiCache immediately begins deleting the selected resources; you cannot cancel or revert this operation.</p> <note> <p>This operation is valid for Redis only.</p> </note>\"\
    },\
    \"DeleteSnapshot\":{\
      \"name\":\"DeleteSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteSnapshotMessage\"},\
      \"output\":{\
        \"shape\":\"DeleteSnapshotResult\",\
        \"resultWrapper\":\"DeleteSnapshotResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"SnapshotNotFoundFault\"},\
        {\"shape\":\"InvalidSnapshotStateFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Deletes an existing snapshot. When you receive a successful response from this operation, ElastiCache immediately begins deleting the snapshot; you cannot cancel or revert this operation.</p> <note> <p>This operation is valid for Redis only.</p> </note>\"\
    },\
    \"DescribeCacheClusters\":{\
      \"name\":\"DescribeCacheClusters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeCacheClustersMessage\"},\
      \"output\":{\
        \"shape\":\"CacheClusterMessage\",\
        \"resultWrapper\":\"DescribeCacheClustersResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheClusterNotFoundFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Returns information about all provisioned clusters if no cluster identifier is specified, or about a specific cache cluster if a cluster identifier is supplied.</p> <p>By default, abbreviated information about the clusters is returned. You can use the optional <i>ShowCacheNodeInfo</i> flag to retrieve detailed information about the cache nodes associated with the clusters. These details include the DNS address and port for the cache node endpoint.</p> <p>If the cluster is in the <i>creating</i> state, only cluster-level information is displayed until all of the nodes are successfully provisioned.</p> <p>If the cluster is in the <i>deleting</i> state, only cluster-level information is displayed.</p> <p>If cache nodes are currently being added to the cluster, node endpoint information and creation time for the additional nodes are not displayed until they are completely provisioned. When the cluster state is <i>available</i>, the cluster is ready for use.</p> <p>If cache nodes are currently being removed from the cluster, no endpoint information for the removed nodes is displayed.</p>\"\
    },\
    \"DescribeCacheEngineVersions\":{\
      \"name\":\"DescribeCacheEngineVersions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeCacheEngineVersionsMessage\"},\
      \"output\":{\
        \"shape\":\"CacheEngineVersionMessage\",\
        \"resultWrapper\":\"DescribeCacheEngineVersionsResult\"\
      },\
      \"documentation\":\"<p>Returns a list of the available cache engines and their versions.</p>\"\
    },\
    \"DescribeCacheParameterGroups\":{\
      \"name\":\"DescribeCacheParameterGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeCacheParameterGroupsMessage\"},\
      \"output\":{\
        \"shape\":\"CacheParameterGroupsMessage\",\
        \"resultWrapper\":\"DescribeCacheParameterGroupsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheParameterGroupNotFoundFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of cache parameter group descriptions. If a cache parameter group name is specified, the list contains only the descriptions for that group.</p>\"\
    },\
    \"DescribeCacheParameters\":{\
      \"name\":\"DescribeCacheParameters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeCacheParametersMessage\"},\
      \"output\":{\
        \"shape\":\"CacheParameterGroupDetails\",\
        \"resultWrapper\":\"DescribeCacheParametersResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheParameterGroupNotFoundFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Returns the detailed parameter list for a particular cache parameter group.</p>\"\
    },\
    \"DescribeCacheSecurityGroups\":{\
      \"name\":\"DescribeCacheSecurityGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeCacheSecurityGroupsMessage\"},\
      \"output\":{\
        \"shape\":\"CacheSecurityGroupMessage\",\
        \"resultWrapper\":\"DescribeCacheSecurityGroupsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheSecurityGroupNotFoundFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of cache security group descriptions. If a cache security group name is specified, the list contains only the description of that group. This applicable only when you have ElastiCache in Classic setup </p>\"\
    },\
    \"DescribeCacheSubnetGroups\":{\
      \"name\":\"DescribeCacheSubnetGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeCacheSubnetGroupsMessage\"},\
      \"output\":{\
        \"shape\":\"CacheSubnetGroupMessage\",\
        \"resultWrapper\":\"DescribeCacheSubnetGroupsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheSubnetGroupNotFoundFault\"}\
      ],\
      \"documentation\":\"<p>Returns a list of cache subnet group descriptions. If a subnet group name is specified, the list contains only the description of that group. This is applicable only when you have ElastiCache in VPC setup. All ElastiCache clusters now launch in VPC by default. </p>\"\
    },\
    \"DescribeEngineDefaultParameters\":{\
      \"name\":\"DescribeEngineDefaultParameters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeEngineDefaultParametersMessage\"},\
      \"output\":{\
        \"shape\":\"DescribeEngineDefaultParametersResult\",\
        \"resultWrapper\":\"DescribeEngineDefaultParametersResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Returns the default engine and system parameter information for the specified cache engine.</p>\"\
    },\
    \"DescribeEvents\":{\
      \"name\":\"DescribeEvents\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeEventsMessage\"},\
      \"output\":{\
        \"shape\":\"EventsMessage\",\
        \"resultWrapper\":\"DescribeEventsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Returns events related to clusters, cache security groups, and cache parameter groups. You can obtain events specific to a particular cluster, cache security group, or cache parameter group by providing the name as a parameter.</p> <p>By default, only the events occurring within the last hour are returned; however, you can retrieve up to 14 days' worth of events if necessary.</p>\"\
    },\
    \"DescribeGlobalReplicationGroups\":{\
      \"name\":\"DescribeGlobalReplicationGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeGlobalReplicationGroupsMessage\"},\
      \"output\":{\
        \"shape\":\"DescribeGlobalReplicationGroupsResult\",\
        \"resultWrapper\":\"DescribeGlobalReplicationGroupsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"GlobalReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a particular global replication group. If no identifier is specified, returns information about all Global Datastores. </p>\"\
    },\
    \"DescribeReplicationGroups\":{\
      \"name\":\"DescribeReplicationGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeReplicationGroupsMessage\"},\
      \"output\":{\
        \"shape\":\"ReplicationGroupMessage\",\
        \"resultWrapper\":\"DescribeReplicationGroupsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a particular replication group. If no identifier is specified, <code>DescribeReplicationGroups</code> returns information about all replication groups.</p> <note> <p>This operation is valid for Redis only.</p> </note>\"\
    },\
    \"DescribeReservedCacheNodes\":{\
      \"name\":\"DescribeReservedCacheNodes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeReservedCacheNodesMessage\"},\
      \"output\":{\
        \"shape\":\"ReservedCacheNodeMessage\",\
        \"resultWrapper\":\"DescribeReservedCacheNodesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ReservedCacheNodeNotFoundFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Returns information about reserved cache nodes for this account, or about a specified reserved cache node.</p>\"\
    },\
    \"DescribeReservedCacheNodesOfferings\":{\
      \"name\":\"DescribeReservedCacheNodesOfferings\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeReservedCacheNodesOfferingsMessage\"},\
      \"output\":{\
        \"shape\":\"ReservedCacheNodesOfferingMessage\",\
        \"resultWrapper\":\"DescribeReservedCacheNodesOfferingsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ReservedCacheNodesOfferingNotFoundFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Lists available reserved cache node offerings.</p>\"\
    },\
    \"DescribeServiceUpdates\":{\
      \"name\":\"DescribeServiceUpdates\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeServiceUpdatesMessage\"},\
      \"output\":{\
        \"shape\":\"ServiceUpdatesMessage\",\
        \"resultWrapper\":\"DescribeServiceUpdatesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ServiceUpdateNotFoundFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Returns details of the service updates</p>\"\
    },\
    \"DescribeSnapshots\":{\
      \"name\":\"DescribeSnapshots\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSnapshotsMessage\"},\
      \"output\":{\
        \"shape\":\"DescribeSnapshotsListMessage\",\
        \"resultWrapper\":\"DescribeSnapshotsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheClusterNotFoundFault\"},\
        {\"shape\":\"SnapshotNotFoundFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Returns information about cluster or replication group snapshots. By default, <code>DescribeSnapshots</code> lists all of your snapshots; it can optionally describe a single snapshot, or just the snapshots associated with a particular cache cluster.</p> <note> <p>This operation is valid for Redis only.</p> </note>\"\
    },\
    \"DescribeUpdateActions\":{\
      \"name\":\"DescribeUpdateActions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeUpdateActionsMessage\"},\
      \"output\":{\
        \"shape\":\"UpdateActionsMessage\",\
        \"resultWrapper\":\"DescribeUpdateActionsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Returns details of the update actions </p>\"\
    },\
    \"DisassociateGlobalReplicationGroup\":{\
      \"name\":\"DisassociateGlobalReplicationGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisassociateGlobalReplicationGroupMessage\"},\
      \"output\":{\
        \"shape\":\"DisassociateGlobalReplicationGroupResult\",\
        \"resultWrapper\":\"DisassociateGlobalReplicationGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"GlobalReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidGlobalReplicationGroupStateFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Remove a secondary cluster from the Global Datastore using the Global Datastore name. The secondary cluster will no longer receive updates from the primary cluster, but will remain as a standalone cluster in that AWS region.</p>\"\
    },\
    \"FailoverGlobalReplicationGroup\":{\
      \"name\":\"FailoverGlobalReplicationGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"FailoverGlobalReplicationGroupMessage\"},\
      \"output\":{\
        \"shape\":\"FailoverGlobalReplicationGroupResult\",\
        \"resultWrapper\":\"FailoverGlobalReplicationGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"GlobalReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidGlobalReplicationGroupStateFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Used to failover the primary region to a selected secondary region. The selected secondary region will become primary, and all other clusters will become secondary.</p>\"\
    },\
    \"IncreaseNodeGroupsInGlobalReplicationGroup\":{\
      \"name\":\"IncreaseNodeGroupsInGlobalReplicationGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"IncreaseNodeGroupsInGlobalReplicationGroupMessage\"},\
      \"output\":{\
        \"shape\":\"IncreaseNodeGroupsInGlobalReplicationGroupResult\",\
        \"resultWrapper\":\"IncreaseNodeGroupsInGlobalReplicationGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"GlobalReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidGlobalReplicationGroupStateFault\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Increase the number of node groups in the Global Datastore</p>\"\
    },\
    \"IncreaseReplicaCount\":{\
      \"name\":\"IncreaseReplicaCount\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"IncreaseReplicaCountMessage\"},\
      \"output\":{\
        \"shape\":\"IncreaseReplicaCountResult\",\
        \"resultWrapper\":\"IncreaseReplicaCountResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidReplicationGroupStateFault\"},\
        {\"shape\":\"InvalidCacheClusterStateFault\"},\
        {\"shape\":\"InvalidVPCNetworkStateFault\"},\
        {\"shape\":\"InsufficientCacheClusterCapacityFault\"},\
        {\"shape\":\"ClusterQuotaForCustomerExceededFault\"},\
        {\"shape\":\"NodeGroupsPerReplicationGroupQuotaExceededFault\"},\
        {\"shape\":\"NodeQuotaForCustomerExceededFault\"},\
        {\"shape\":\"NoOperationFault\"},\
        {\"shape\":\"InvalidKMSKeyFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Dynamically increases the number of replics in a Redis (cluster mode disabled) replication group or the number of replica nodes in one or more node groups (shards) of a Redis (cluster mode enabled) replication group. This operation is performed with no cluster down time.</p>\"\
    },\
    \"ListAllowedNodeTypeModifications\":{\
      \"name\":\"ListAllowedNodeTypeModifications\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListAllowedNodeTypeModificationsMessage\"},\
      \"output\":{\
        \"shape\":\"AllowedNodeTypeModificationsMessage\",\
        \"resultWrapper\":\"ListAllowedNodeTypeModificationsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheClusterNotFoundFault\"},\
        {\"shape\":\"ReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidParameterCombinationException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Lists all available node types that you can scale your Redis cluster's or replication group's current node type.</p> <p>When you use the <code>ModifyCacheCluster</code> or <code>ModifyReplicationGroup</code> operations to scale your cluster or replication group, the value of the <code>CacheNodeType</code> parameter must be one of the node types returned by this operation.</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceMessage\"},\
      \"output\":{\
        \"shape\":\"TagListMessage\",\
        \"resultWrapper\":\"ListTagsForResourceResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheClusterNotFoundFault\"},\
        {\"shape\":\"SnapshotNotFoundFault\"},\
        {\"shape\":\"InvalidARNFault\"}\
      ],\
      \"documentation\":\"<p>Lists all cost allocation tags currently on the named resource. A <code>cost allocation tag</code> is a key-value pair where the key is case-sensitive and the value is optional. You can use cost allocation tags to categorize and track your AWS costs.</p> <p>If the cluster is not in the <i>available</i> state, <code>ListTagsForResource</code> returns an error.</p> <p>You can have a maximum of 50 cost allocation tags on an ElastiCache resource. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Tagging.html\\\">Monitoring Costs with Tags</a>.</p>\"\
    },\
    \"ModifyCacheCluster\":{\
      \"name\":\"ModifyCacheCluster\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyCacheClusterMessage\"},\
      \"output\":{\
        \"shape\":\"ModifyCacheClusterResult\",\
        \"resultWrapper\":\"ModifyCacheClusterResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidCacheClusterStateFault\"},\
        {\"shape\":\"InvalidCacheSecurityGroupStateFault\"},\
        {\"shape\":\"InsufficientCacheClusterCapacityFault\"},\
        {\"shape\":\"CacheClusterNotFoundFault\"},\
        {\"shape\":\"NodeQuotaForClusterExceededFault\"},\
        {\"shape\":\"NodeQuotaForCustomerExceededFault\"},\
        {\"shape\":\"CacheSecurityGroupNotFoundFault\"},\
        {\"shape\":\"CacheParameterGroupNotFoundFault\"},\
        {\"shape\":\"InvalidVPCNetworkStateFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Modifies the settings for a cluster. You can use this operation to change one or more cluster configuration parameters by specifying the parameters and the new values.</p>\"\
    },\
    \"ModifyCacheParameterGroup\":{\
      \"name\":\"ModifyCacheParameterGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyCacheParameterGroupMessage\"},\
      \"output\":{\
        \"shape\":\"CacheParameterGroupNameMessage\",\
        \"resultWrapper\":\"ModifyCacheParameterGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheParameterGroupNotFoundFault\"},\
        {\"shape\":\"InvalidCacheParameterGroupStateFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"},\
        {\"shape\":\"InvalidGlobalReplicationGroupStateFault\"}\
      ],\
      \"documentation\":\"<p>Modifies the parameters of a cache parameter group. You can modify up to 20 parameters in a single request by submitting a list parameter name and value pairs.</p>\"\
    },\
    \"ModifyCacheSubnetGroup\":{\
      \"name\":\"ModifyCacheSubnetGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyCacheSubnetGroupMessage\"},\
      \"output\":{\
        \"shape\":\"ModifyCacheSubnetGroupResult\",\
        \"resultWrapper\":\"ModifyCacheSubnetGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheSubnetGroupNotFoundFault\"},\
        {\"shape\":\"CacheSubnetQuotaExceededFault\"},\
        {\"shape\":\"SubnetInUse\"},\
        {\"shape\":\"InvalidSubnet\"}\
      ],\
      \"documentation\":\"<p>Modifies an existing cache subnet group.</p>\"\
    },\
    \"ModifyGlobalReplicationGroup\":{\
      \"name\":\"ModifyGlobalReplicationGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyGlobalReplicationGroupMessage\"},\
      \"output\":{\
        \"shape\":\"ModifyGlobalReplicationGroupResult\",\
        \"resultWrapper\":\"ModifyGlobalReplicationGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"GlobalReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidGlobalReplicationGroupStateFault\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Modifies the settings for a Global Datastore.</p>\"\
    },\
    \"ModifyReplicationGroup\":{\
      \"name\":\"ModifyReplicationGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyReplicationGroupMessage\"},\
      \"output\":{\
        \"shape\":\"ModifyReplicationGroupResult\",\
        \"resultWrapper\":\"ModifyReplicationGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidReplicationGroupStateFault\"},\
        {\"shape\":\"InvalidCacheClusterStateFault\"},\
        {\"shape\":\"InvalidCacheSecurityGroupStateFault\"},\
        {\"shape\":\"InsufficientCacheClusterCapacityFault\"},\
        {\"shape\":\"CacheClusterNotFoundFault\"},\
        {\"shape\":\"NodeQuotaForClusterExceededFault\"},\
        {\"shape\":\"NodeQuotaForCustomerExceededFault\"},\
        {\"shape\":\"CacheSecurityGroupNotFoundFault\"},\
        {\"shape\":\"CacheParameterGroupNotFoundFault\"},\
        {\"shape\":\"InvalidVPCNetworkStateFault\"},\
        {\"shape\":\"InvalidKMSKeyFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Modifies the settings for a replication group.</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/scaling-redis-cluster-mode-enabled.html\\\">Scaling for Amazon ElastiCache for Redis (cluster mode enabled)</a> in the ElastiCache User Guide</p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_ModifyReplicationGroupShardConfiguration.html\\\">ModifyReplicationGroupShardConfiguration</a> in the ElastiCache API Reference</p> </li> </ul> <note> <p>This operation is valid for Redis only.</p> </note>\"\
    },\
    \"ModifyReplicationGroupShardConfiguration\":{\
      \"name\":\"ModifyReplicationGroupShardConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyReplicationGroupShardConfigurationMessage\"},\
      \"output\":{\
        \"shape\":\"ModifyReplicationGroupShardConfigurationResult\",\
        \"resultWrapper\":\"ModifyReplicationGroupShardConfigurationResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidReplicationGroupStateFault\"},\
        {\"shape\":\"InvalidCacheClusterStateFault\"},\
        {\"shape\":\"InvalidVPCNetworkStateFault\"},\
        {\"shape\":\"InsufficientCacheClusterCapacityFault\"},\
        {\"shape\":\"NodeGroupsPerReplicationGroupQuotaExceededFault\"},\
        {\"shape\":\"NodeQuotaForCustomerExceededFault\"},\
        {\"shape\":\"InvalidKMSKeyFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Modifies a replication group's shards (node groups) by allowing you to add shards, remove shards, or rebalance the keyspaces among exisiting shards.</p>\"\
    },\
    \"PurchaseReservedCacheNodesOffering\":{\
      \"name\":\"PurchaseReservedCacheNodesOffering\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PurchaseReservedCacheNodesOfferingMessage\"},\
      \"output\":{\
        \"shape\":\"PurchaseReservedCacheNodesOfferingResult\",\
        \"resultWrapper\":\"PurchaseReservedCacheNodesOfferingResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ReservedCacheNodesOfferingNotFoundFault\"},\
        {\"shape\":\"ReservedCacheNodeAlreadyExistsFault\"},\
        {\"shape\":\"ReservedCacheNodeQuotaExceededFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Allows you to purchase a reserved cache node offering.</p>\"\
    },\
    \"RebalanceSlotsInGlobalReplicationGroup\":{\
      \"name\":\"RebalanceSlotsInGlobalReplicationGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RebalanceSlotsInGlobalReplicationGroupMessage\"},\
      \"output\":{\
        \"shape\":\"RebalanceSlotsInGlobalReplicationGroupResult\",\
        \"resultWrapper\":\"RebalanceSlotsInGlobalReplicationGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"GlobalReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidGlobalReplicationGroupStateFault\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Redistribute slots to ensure uniform distribution across existing shards in the cluster.</p>\"\
    },\
    \"RebootCacheCluster\":{\
      \"name\":\"RebootCacheCluster\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RebootCacheClusterMessage\"},\
      \"output\":{\
        \"shape\":\"RebootCacheClusterResult\",\
        \"resultWrapper\":\"RebootCacheClusterResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidCacheClusterStateFault\"},\
        {\"shape\":\"CacheClusterNotFoundFault\"}\
      ],\
      \"documentation\":\"<p>Reboots some, or all, of the cache nodes within a provisioned cluster. This operation applies any modified cache parameter groups to the cluster. The reboot operation takes place as soon as possible, and results in a momentary outage to the cluster. During the reboot, the cluster status is set to REBOOTING.</p> <p>The reboot causes the contents of the cache (for each cache node being rebooted) to be lost.</p> <p>When the reboot is complete, a cluster event is created.</p> <p>Rebooting a cluster is currently supported on Memcached and Redis (cluster mode disabled) clusters. Rebooting is not supported on Redis (cluster mode enabled) clusters.</p> <p>If you make changes to parameters that require a Redis (cluster mode enabled) cluster reboot for the changes to be applied, see <a href=\\\"http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html\\\">Rebooting a Cluster</a> for an alternate process.</p>\"\
    },\
    \"RemoveTagsFromResource\":{\
      \"name\":\"RemoveTagsFromResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RemoveTagsFromResourceMessage\"},\
      \"output\":{\
        \"shape\":\"TagListMessage\",\
        \"resultWrapper\":\"RemoveTagsFromResourceResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheClusterNotFoundFault\"},\
        {\"shape\":\"SnapshotNotFoundFault\"},\
        {\"shape\":\"InvalidARNFault\"},\
        {\"shape\":\"TagNotFoundFault\"}\
      ],\
      \"documentation\":\"<p>Removes the tags identified by the <code>TagKeys</code> list from the named resource.</p>\"\
    },\
    \"ResetCacheParameterGroup\":{\
      \"name\":\"ResetCacheParameterGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ResetCacheParameterGroupMessage\"},\
      \"output\":{\
        \"shape\":\"CacheParameterGroupNameMessage\",\
        \"resultWrapper\":\"ResetCacheParameterGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidCacheParameterGroupStateFault\"},\
        {\"shape\":\"CacheParameterGroupNotFoundFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"},\
        {\"shape\":\"InvalidGlobalReplicationGroupStateFault\"}\
      ],\
      \"documentation\":\"<p>Modifies the parameters of a cache parameter group to the engine or system default value. You can reset specific parameters by submitting a list of parameter names. To reset the entire cache parameter group, specify the <code>ResetAllParameters</code> and <code>CacheParameterGroupName</code> parameters.</p>\"\
    },\
    \"RevokeCacheSecurityGroupIngress\":{\
      \"name\":\"RevokeCacheSecurityGroupIngress\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RevokeCacheSecurityGroupIngressMessage\"},\
      \"output\":{\
        \"shape\":\"RevokeCacheSecurityGroupIngressResult\",\
        \"resultWrapper\":\"RevokeCacheSecurityGroupIngressResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CacheSecurityGroupNotFoundFault\"},\
        {\"shape\":\"AuthorizationNotFoundFault\"},\
        {\"shape\":\"InvalidCacheSecurityGroupStateFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Revokes ingress from a cache security group. Use this operation to disallow access from an Amazon EC2 security group that had been previously authorized.</p>\"\
    },\
    \"StartMigration\":{\
      \"name\":\"StartMigration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartMigrationMessage\"},\
      \"output\":{\
        \"shape\":\"StartMigrationResponse\",\
        \"resultWrapper\":\"StartMigrationResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ReplicationGroupNotFoundFault\"},\
        {\"shape\":\"InvalidReplicationGroupStateFault\"},\
        {\"shape\":\"ReplicationGroupAlreadyUnderMigrationFault\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Start the migration of data.</p>\"\
    },\
    \"TestFailover\":{\
      \"name\":\"TestFailover\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TestFailoverMessage\"},\
      \"output\":{\
        \"shape\":\"TestFailoverResult\",\
        \"resultWrapper\":\"TestFailoverResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"APICallRateForCustomerExceededFault\"},\
        {\"shape\":\"InvalidCacheClusterStateFault\"},\
        {\"shape\":\"InvalidReplicationGroupStateFault\"},\
        {\"shape\":\"NodeGroupNotFoundFault\"},\
        {\"shape\":\"ReplicationGroupNotFoundFault\"},\
        {\"shape\":\"TestFailoverNotAvailableFault\"},\
        {\"shape\":\"InvalidKMSKeyFault\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"}\
      ],\
      \"documentation\":\"<p>Represents the input of a <code>TestFailover</code> operation which test automatic failover on a specified node group (called shard in the console) in a replication group (called cluster in the console).</p> <p class=\\\"title\\\"> <b>Note the following</b> </p> <ul> <li> <p>A customer can use this operation to test automatic failover on up to 5 shards (called node groups in the ElastiCache API and AWS CLI) in any rolling 24-hour period.</p> </li> <li> <p>If calling this operation on shards in different clusters (called replication groups in the API and CLI), the calls can be made concurrently.</p> <p> </p> </li> <li> <p>If calling this operation multiple times on different shards in the same Redis (cluster mode enabled) replication group, the first node replacement must complete before a subsequent call can be made.</p> </li> <li> <p>To determine whether the node replacement is complete you can check Events using the Amazon ElastiCache console, the AWS CLI, or the ElastiCache API. Look for the following automatic failover related events, listed here in order of occurrance:</p> <ol> <li> <p>Replication group message: <code>Test Failover API called for node group &lt;node-group-id&gt;</code> </p> </li> <li> <p>Cache cluster message: <code>Failover from master node &lt;primary-node-id&gt; to replica node &lt;node-id&gt; completed</code> </p> </li> <li> <p>Replication group message: <code>Failover from master node &lt;primary-node-id&gt; to replica node &lt;node-id&gt; completed</code> </p> </li> <li> <p>Cache cluster message: <code>Recovering cache nodes &lt;node-id&gt;</code> </p> </li> <li> <p>Cache cluster message: <code>Finished recovery for cache nodes &lt;node-id&gt;</code> </p> </li> </ol> <p>For more information see:</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ECEvents.Viewing.html\\\">Viewing ElastiCache Events</a> in the <i>ElastiCache User Guide</i> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_DescribeEvents.html\\\">DescribeEvents</a> in the ElastiCache API Reference</p> </li> </ul> </li> </ul> <p>Also see, <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/AutoFailover.html#auto-failover-test\\\">Testing Multi-AZ with Automatic Failover</a> in the <i>ElastiCache User Guide</i>.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"APICallRateForCustomerExceededFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The customer has exceeded the allowed rate of API calls.</p>\",\
      \"error\":{\
        \"code\":\"APICallRateForCustomerExceeded\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"AZMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"single-az\",\
        \"cross-az\"\
      ]\
    },\
    \"AddTagsToResourceMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceName\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource to which the tags are to be added, for example <code>arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster</code> or <code>arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot</code>. ElastiCache resources are <i>cluster</i> and <i>snapshot</i>.</p> <p>For more information about ARNs, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and AWS Service Namespaces</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of cost allocation tags to be added to this resource. A tag is a key-value pair. A tag key must be accompanied by a tag value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of an AddTagsToResource operation.</p>\"\
    },\
    \"AllowedNodeGroupId\":{\
      \"type\":\"string\",\
      \"max\":4,\
      \"min\":1,\
      \"pattern\":\"\\\\d+\"\
    },\
    \"AllowedNodeTypeModificationsMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ScaleUpModifications\":{\
          \"shape\":\"NodeTypeList\",\
          \"documentation\":\"<p>A string list, each element of which specifies a cache node type which you can use to scale your cluster or replication group.</p> <p>When scaling up a Redis cluster or replication group using <code>ModifyCacheCluster</code> or <code>ModifyReplicationGroup</code>, use a value from this list for the <code>CacheNodeType</code> parameter.</p>\"\
        },\
        \"ScaleDownModifications\":{\
          \"shape\":\"NodeTypeList\",\
          \"documentation\":\"<p>A string list, each element of which specifies a cache node type which you can use to scale your cluster or replication group. When scaling down a Redis cluster or replication group using ModifyCacheCluster or ModifyReplicationGroup, use a value from this list for the CacheNodeType parameter. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the allowed node types you can use to modify your cluster or replication group.</p>\"\
    },\
    \"AuthTokenUpdateStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SETTING\",\
        \"ROTATING\"\
      ]\
    },\
    \"AuthTokenUpdateStrategyType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SET\",\
        \"ROTATE\"\
      ]\
    },\
    \"AuthorizationAlreadyExistsFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified Amazon EC2 security group is already authorized for the specified cache security group.</p>\",\
      \"error\":{\
        \"code\":\"AuthorizationAlreadyExists\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"AuthorizationNotFoundFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified Amazon EC2 security group is not authorized for the specified cache security group.</p>\",\
      \"error\":{\
        \"code\":\"AuthorizationNotFound\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"AuthorizeCacheSecurityGroupIngressMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CacheSecurityGroupName\",\
        \"EC2SecurityGroupName\",\
        \"EC2SecurityGroupOwnerId\"\
      ],\
      \"members\":{\
        \"CacheSecurityGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cache security group that allows network ingress.</p>\"\
        },\
        \"EC2SecurityGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon EC2 security group to be authorized for ingress to the cache security group.</p>\"\
        },\
        \"EC2SecurityGroupOwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account number of the Amazon EC2 security group owner. Note that this is not the same thing as an AWS access key ID - you must provide a valid AWS account number for this parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of an AuthorizeCacheSecurityGroupIngress operation.</p>\"\
    },\
    \"AuthorizeCacheSecurityGroupIngressResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheSecurityGroup\":{\"shape\":\"CacheSecurityGroup\"}\
      }\
    },\
    \"AutomaticFailoverStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"enabled\",\
        \"disabled\",\
        \"enabling\",\
        \"disabling\"\
      ]\
    },\
    \"AvailabilityZone\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Availability Zone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an Availability Zone in which the cluster is launched.</p>\",\
      \"wrapper\":true\
    },\
    \"AvailabilityZonesList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"AvailabilityZone\"\
      }\
    },\
    \"AwsQueryErrorMessage\":{\"type\":\"string\"},\
    \"BatchApplyUpdateActionMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"ServiceUpdateName\"],\
      \"members\":{\
        \"ReplicationGroupIds\":{\
          \"shape\":\"ReplicationGroupIdList\",\
          \"documentation\":\"<p>The replication group IDs</p>\"\
        },\
        \"CacheClusterIds\":{\
          \"shape\":\"CacheClusterIdList\",\
          \"documentation\":\"<p>The cache cluster IDs</p>\"\
        },\
        \"ServiceUpdateName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The unique ID of the service update</p>\"\
        }\
      }\
    },\
    \"BatchStopUpdateActionMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"ServiceUpdateName\"],\
      \"members\":{\
        \"ReplicationGroupIds\":{\
          \"shape\":\"ReplicationGroupIdList\",\
          \"documentation\":\"<p>The replication group IDs</p>\"\
        },\
        \"CacheClusterIds\":{\
          \"shape\":\"CacheClusterIdList\",\
          \"documentation\":\"<p>The cache cluster IDs</p>\"\
        },\
        \"ServiceUpdateName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The unique ID of the service update</p>\"\
        }\
      }\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"BooleanOptional\":{\"type\":\"boolean\"},\
    \"CacheCluster\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The user-supplied identifier of the cluster. This identifier is a unique key that identifies a cluster.</p>\"\
        },\
        \"ConfigurationEndpoint\":{\
          \"shape\":\"Endpoint\",\
          \"documentation\":\"<p>Represents a Memcached cluster endpoint which, if Automatic Discovery is enabled on the cluster, can be used by an application to connect to any node in the cluster. The configuration endpoint will always have <code>.cfg</code> in it.</p> <p>Example: <code>mem-3.9dvc4r<u>.cfg</u>.usw2.cache.amazonaws.com:11211</code> </p>\"\
        },\
        \"ClientDownloadLandingPage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The URL of the web page where you can download the latest ElastiCache client library.</p>\"\
        },\
        \"CacheNodeType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the compute and memory capacity node type for the cluster.</p> <p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p> <ul> <li> <p>General purpose:</p> <ul> <li> <p>Current generation: </p> <p> <b>M5 node types:</b> <code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code> </p> <p> <b>M4 node types:</b> <code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code> </p> <p> <b>T3 node types:</b> <code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code> </p> <p> <b>T2 node types:</b> <code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>T1 node types:</b> <code>cache.t1.micro</code> </p> <p> <b>M1 node types:</b> <code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code> </p> <p> <b>M3 node types:</b> <code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code> </p> </li> </ul> </li> <li> <p>Compute optimized:</p> <ul> <li> <p>Previous generation: (not recommended)</p> <p> <b>C1 node types:</b> <code>cache.c1.xlarge</code> </p> </li> </ul> </li> <li> <p>Memory optimized:</p> <ul> <li> <p>Current generation: </p> <p> <b>R5 node types:</b> <code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code> </p> <p> <b>R4 node types:</b> <code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>M2 node types:</b> <code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code> </p> <p> <b>R3 node types:</b> <code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code> </p> </li> </ul> </li> </ul> <p> <b>Additional node type info</b> </p> <ul> <li> <p>All current generation instance types are created in Amazon VPC by default.</p> </li> <li> <p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p> </li> <li> <p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p> </li> <li> <p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p> </li> </ul>\"\
        },\
        \"Engine\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache engine (<code>memcached</code> or <code>redis</code>) to be used for this cluster.</p>\"\
        },\
        \"EngineVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The version of the cache engine that is used in this cluster.</p>\"\
        },\
        \"CacheClusterStatus\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The current state of this cluster, one of the following values: <code>available</code>, <code>creating</code>, <code>deleted</code>, <code>deleting</code>, <code>incompatible-network</code>, <code>modifying</code>, <code>rebooting cluster nodes</code>, <code>restore-failed</code>, or <code>snapshotting</code>.</p>\"\
        },\
        \"NumCacheNodes\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The number of cache nodes in the cluster.</p> <p>For clusters running Redis, this value must be 1. For clusters running Memcached, this value must be between 1 and 20.</p>\"\
        },\
        \"PreferredAvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Availability Zone in which the cluster is located or \\\"Multiple\\\" if the cache nodes are located in different Availability Zones.</p>\"\
        },\
        \"CacheClusterCreateTime\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The date and time when the cluster was created.</p>\"\
        },\
        \"PreferredMaintenanceWindow\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period.</p> <p>Valid values for <code>ddd</code> are:</p> <ul> <li> <p> <code>sun</code> </p> </li> <li> <p> <code>mon</code> </p> </li> <li> <p> <code>tue</code> </p> </li> <li> <p> <code>wed</code> </p> </li> <li> <p> <code>thu</code> </p> </li> <li> <p> <code>fri</code> </p> </li> <li> <p> <code>sat</code> </p> </li> </ul> <p>Example: <code>sun:23:00-mon:01:30</code> </p>\"\
        },\
        \"PendingModifiedValues\":{\"shape\":\"PendingModifiedValues\"},\
        \"NotificationConfiguration\":{\
          \"shape\":\"NotificationConfiguration\",\
          \"documentation\":\"<p>Describes a notification topic and its status. Notification topics are used for publishing ElastiCache events to subscribers using Amazon Simple Notification Service (SNS). </p>\"\
        },\
        \"CacheSecurityGroups\":{\
          \"shape\":\"CacheSecurityGroupMembershipList\",\
          \"documentation\":\"<p>A list of cache security group elements, composed of name and status sub-elements.</p>\"\
        },\
        \"CacheParameterGroup\":{\
          \"shape\":\"CacheParameterGroupStatus\",\
          \"documentation\":\"<p>Status of the cache parameter group.</p>\"\
        },\
        \"CacheSubnetGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache subnet group associated with the cluster.</p>\"\
        },\
        \"CacheNodes\":{\
          \"shape\":\"CacheNodeList\",\
          \"documentation\":\"<p>A list of cache nodes that are members of the cluster.</p>\"\
        },\
        \"AutoMinorVersionUpgrade\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>This parameter is currently disabled.</p>\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"SecurityGroupMembershipList\",\
          \"documentation\":\"<p>A list of VPC Security Groups associated with the cluster.</p>\"\
        },\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The replication group to which this cluster belongs. If this field is empty, the cluster is not associated with any replication group.</p>\"\
        },\
        \"SnapshotRetentionLimit\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The number of days for which ElastiCache retains automatic cluster snapshots before deleting them. For example, if you set <code>SnapshotRetentionLimit</code> to 5, a snapshot that was taken today is retained for 5 days before being deleted.</p> <important> <p> If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off.</p> </important>\"\
        },\
        \"SnapshotWindow\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your cluster.</p> <p>Example: <code>05:00-09:00</code> </p>\"\
        },\
        \"AuthTokenEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>A flag that enables using an <code>AuthToken</code> (password) when issuing Redis commands.</p> <p>Default: <code>false</code> </p>\"\
        },\
        \"AuthTokenLastModifiedDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The date the auth token was last modified</p>\"\
        },\
        \"TransitEncryptionEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>A flag that enables in-transit encryption when set to <code>true</code>.</p> <p>You cannot modify the value of <code>TransitEncryptionEnabled</code> after the cluster is created. To enable in-transit encryption on a cluster you must set <code>TransitEncryptionEnabled</code> to <code>true</code> when you create a cluster.</p> <p> <b>Required:</b> Only available when creating a replication group in an Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or later.</p> <p>Default: <code>false</code> </p>\"\
        },\
        \"AtRestEncryptionEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>A flag that enables encryption at-rest when set to <code>true</code>.</p> <p>You cannot modify the value of <code>AtRestEncryptionEnabled</code> after the cluster is created. To enable at-rest encryption on a cluster you must set <code>AtRestEncryptionEnabled</code> to <code>true</code> when you create a cluster.</p> <p> <b>Required:</b> Only available when creating a replication group in an Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or later.</p> <p>Default: <code>false</code> </p>\"\
        },\
        \"ARN\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN (Amazon Resource Name) of the cache cluster.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains all of the attributes of a specific cluster.</p>\",\
      \"wrapper\":true\
    },\
    \"CacheClusterAlreadyExistsFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You already have a cluster with the given identifier.</p>\",\
      \"error\":{\
        \"code\":\"CacheClusterAlreadyExists\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CacheClusterIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"},\
      \"max\":20\
    },\
    \"CacheClusterList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"CacheCluster\",\
        \"locationName\":\"CacheCluster\"\
      }\
    },\
    \"CacheClusterMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Provides an identifier to allow retrieval of paginated results.</p>\"\
        },\
        \"CacheClusters\":{\
          \"shape\":\"CacheClusterList\",\
          \"documentation\":\"<p>A list of clusters. Each item in the list contains detailed information about one cluster.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output of a <code>DescribeCacheClusters</code> operation.</p>\"\
    },\
    \"CacheClusterNotFoundFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested cluster ID does not refer to an existing cluster.</p>\",\
      \"error\":{\
        \"code\":\"CacheClusterNotFound\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CacheEngineVersion\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Engine\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache engine.</p>\"\
        },\
        \"EngineVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The version number of the cache engine.</p>\"\
        },\
        \"CacheParameterGroupFamily\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache parameter group family associated with this cache engine.</p> <p>Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> | <code>redis2.6</code> | <code>redis2.8</code> | <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> | </p>\"\
        },\
        \"CacheEngineDescription\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description of the cache engine.</p>\"\
        },\
        \"CacheEngineVersionDescription\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description of the cache engine version.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides all of the details about a particular cache engine version.</p>\"\
    },\
    \"CacheEngineVersionList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"CacheEngineVersion\",\
        \"locationName\":\"CacheEngineVersion\"\
      }\
    },\
    \"CacheEngineVersionMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Provides an identifier to allow retrieval of paginated results.</p>\"\
        },\
        \"CacheEngineVersions\":{\
          \"shape\":\"CacheEngineVersionList\",\
          \"documentation\":\"<p>A list of cache engine version details. Each element in the list contains detailed information about one cache engine version.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output of a <a>DescribeCacheEngineVersions</a> operation.</p>\"\
    },\
    \"CacheNode\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheNodeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cache node identifier. A node ID is a numeric identifier (0001, 0002, etc.). The combination of cluster ID and node ID uniquely identifies every cache node used in a customer's AWS account.</p>\"\
        },\
        \"CacheNodeStatus\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The current state of this cache node, one of the following values: <code>available</code>, <code>creating</code>, <code>rebooting</code>, or <code>deleting</code>.</p>\"\
        },\
        \"CacheNodeCreateTime\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The date and time when the cache node was created.</p>\"\
        },\
        \"Endpoint\":{\
          \"shape\":\"Endpoint\",\
          \"documentation\":\"<p>The hostname for connecting to this cache node.</p>\"\
        },\
        \"ParameterGroupStatus\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status of the parameter group applied to this cache node.</p>\"\
        },\
        \"SourceCacheNodeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the primary node to which this read replica node is synchronized. If this field is empty, this node is not associated with a primary cluster.</p>\"\
        },\
        \"CustomerAvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone where this node was created and now resides.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents an individual cache node within a cluster. Each cache node runs its own instance of the cluster's protocol-compliant caching software - either Memcached or Redis.</p> <p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p> <ul> <li> <p>General purpose:</p> <ul> <li> <p>Current generation: </p> <p> <b>M5 node types:</b> <code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code> </p> <p> <b>M4 node types:</b> <code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code> </p> <p> <b>T3 node types:</b> <code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code> </p> <p> <b>T2 node types:</b> <code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>T1 node types:</b> <code>cache.t1.micro</code> </p> <p> <b>M1 node types:</b> <code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code> </p> <p> <b>M3 node types:</b> <code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code> </p> </li> </ul> </li> <li> <p>Compute optimized:</p> <ul> <li> <p>Previous generation: (not recommended)</p> <p> <b>C1 node types:</b> <code>cache.c1.xlarge</code> </p> </li> </ul> </li> <li> <p>Memory optimized:</p> <ul> <li> <p>Current generation: </p> <p> <b>R5 node types:</b> <code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code> </p> <p> <b>R4 node types:</b> <code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>M2 node types:</b> <code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code> </p> <p> <b>R3 node types:</b> <code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code> </p> </li> </ul> </li> </ul> <p> <b>Additional node type info</b> </p> <ul> <li> <p>All current generation instance types are created in Amazon VPC by default.</p> </li> <li> <p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p> </li> <li> <p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p> </li> <li> <p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p> </li> </ul>\"\
    },\
    \"CacheNodeIdsList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"CacheNodeId\"\
      }\
    },\
    \"CacheNodeList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"CacheNode\",\
        \"locationName\":\"CacheNode\"\
      }\
    },\
    \"CacheNodeTypeSpecificParameter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ParameterName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the parameter.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the parameter.</p>\"\
        },\
        \"Source\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The source of the parameter value.</p>\"\
        },\
        \"DataType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The valid data type for the parameter.</p>\"\
        },\
        \"AllowedValues\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The valid range of values for the parameter.</p>\"\
        },\
        \"IsModifiable\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether (<code>true</code>) or not (<code>false</code>) the parameter can be modified. Some parameters have security or operational implications that prevent them from being changed.</p>\"\
        },\
        \"MinimumEngineVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The earliest cache engine version to which the parameter can apply.</p>\"\
        },\
        \"CacheNodeTypeSpecificValues\":{\
          \"shape\":\"CacheNodeTypeSpecificValueList\",\
          \"documentation\":\"<p>A list of cache node types and their corresponding values for this parameter.</p>\"\
        },\
        \"ChangeType\":{\
          \"shape\":\"ChangeType\",\
          \"documentation\":\"<p>Indicates whether a change to the parameter is applied immediately or requires a reboot for the change to be applied. You can force a reboot or wait until the next maintenance window's reboot. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html\\\">Rebooting a Cluster</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A parameter that has a different value for each cache node type it is applied to. For example, in a Redis cluster, a <code>cache.m1.large</code> cache node type would have a larger <code>maxmemory</code> value than a <code>cache.m1.small</code> type.</p>\"\
    },\
    \"CacheNodeTypeSpecificParametersList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"CacheNodeTypeSpecificParameter\",\
        \"locationName\":\"CacheNodeTypeSpecificParameter\"\
      }\
    },\
    \"CacheNodeTypeSpecificValue\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheNodeType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cache node type for which this value applies.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The value for the cache node type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A value that applies only to a certain cache node type.</p>\"\
    },\
    \"CacheNodeTypeSpecificValueList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"CacheNodeTypeSpecificValue\",\
        \"locationName\":\"CacheNodeTypeSpecificValue\"\
      }\
    },\
    \"CacheNodeUpdateStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheNodeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The node ID of the cache cluster</p>\"\
        },\
        \"NodeUpdateStatus\":{\
          \"shape\":\"NodeUpdateStatus\",\
          \"documentation\":\"<p>The update status of the node</p>\"\
        },\
        \"NodeDeletionDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The deletion date of the node</p>\"\
        },\
        \"NodeUpdateStartDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The start date of the update for a node</p>\"\
        },\
        \"NodeUpdateEndDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The end date of the update for a node</p>\"\
        },\
        \"NodeUpdateInitiatedBy\":{\
          \"shape\":\"NodeUpdateInitiatedBy\",\
          \"documentation\":\"<p>Reflects whether the update was initiated by the customer or automatically applied</p>\"\
        },\
        \"NodeUpdateInitiatedDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The date when the update is triggered</p>\"\
        },\
        \"NodeUpdateStatusModifiedDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The date when the NodeUpdateStatus was last modified&gt;</p>\"\
        }\
      },\
      \"documentation\":\"<p>The status of the service update on the cache node</p>\"\
    },\
    \"CacheNodeUpdateStatusList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"CacheNodeUpdateStatus\",\
        \"locationName\":\"CacheNodeUpdateStatus\"\
      }\
    },\
    \"CacheParameterGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheParameterGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache parameter group.</p>\"\
        },\
        \"CacheParameterGroupFamily\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache parameter group family that this cache parameter group is compatible with.</p> <p>Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> | <code>redis2.6</code> | <code>redis2.8</code> | <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> | </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description for this cache parameter group.</p>\"\
        },\
        \"IsGlobal\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the parameter group is associated with a Global Datastore</p>\"\
        },\
        \"ARN\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN (Amazon Resource Name) of the cache parameter group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output of a <code>CreateCacheParameterGroup</code> operation.</p>\",\
      \"wrapper\":true\
    },\
    \"CacheParameterGroupAlreadyExistsFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A cache parameter group with the requested name already exists.</p>\",\
      \"error\":{\
        \"code\":\"CacheParameterGroupAlreadyExists\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CacheParameterGroupDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Provides an identifier to allow retrieval of paginated results.</p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"ParametersList\",\
          \"documentation\":\"<p>A list of <a>Parameter</a> instances.</p>\"\
        },\
        \"CacheNodeTypeSpecificParameters\":{\
          \"shape\":\"CacheNodeTypeSpecificParametersList\",\
          \"documentation\":\"<p>A list of parameters specific to a particular cache node type. Each element in the list contains detailed information about one parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output of a <code>DescribeCacheParameters</code> operation.</p>\"\
    },\
    \"CacheParameterGroupList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"CacheParameterGroup\",\
        \"locationName\":\"CacheParameterGroup\"\
      }\
    },\
    \"CacheParameterGroupNameMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheParameterGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache parameter group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output of one of the following operations:</p> <ul> <li> <p> <code>ModifyCacheParameterGroup</code> </p> </li> <li> <p> <code>ResetCacheParameterGroup</code> </p> </li> </ul>\"\
    },\
    \"CacheParameterGroupNotFoundFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested cache parameter group name does not refer to an existing cache parameter group.</p>\",\
      \"error\":{\
        \"code\":\"CacheParameterGroupNotFound\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CacheParameterGroupQuotaExceededFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The request cannot be processed because it would exceed the maximum number of cache security groups.</p>\",\
      \"error\":{\
        \"code\":\"CacheParameterGroupQuotaExceeded\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CacheParameterGroupStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheParameterGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache parameter group.</p>\"\
        },\
        \"ParameterApplyStatus\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status of parameter updates.</p>\"\
        },\
        \"CacheNodeIdsToReboot\":{\
          \"shape\":\"CacheNodeIdsList\",\
          \"documentation\":\"<p>A list of the cache node IDs which need to be rebooted for parameter changes to be applied. A node ID is a numeric identifier (0001, 0002, etc.).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Status of the cache parameter group.</p>\"\
    },\
    \"CacheParameterGroupsMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Provides an identifier to allow retrieval of paginated results.</p>\"\
        },\
        \"CacheParameterGroups\":{\
          \"shape\":\"CacheParameterGroupList\",\
          \"documentation\":\"<p>A list of cache parameter groups. Each element in the list contains detailed information about one cache parameter group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output of a <code>DescribeCacheParameterGroups</code> operation.</p>\"\
    },\
    \"CacheSecurityGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account ID of the cache security group owner.</p>\"\
        },\
        \"CacheSecurityGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache security group.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description of the cache security group.</p>\"\
        },\
        \"EC2SecurityGroups\":{\
          \"shape\":\"EC2SecurityGroupList\",\
          \"documentation\":\"<p>A list of Amazon EC2 security groups that are associated with this cache security group.</p>\"\
        },\
        \"ARN\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN (Amazon Resource Name) of the cache security group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output of one of the following operations:</p> <ul> <li> <p> <code>AuthorizeCacheSecurityGroupIngress</code> </p> </li> <li> <p> <code>CreateCacheSecurityGroup</code> </p> </li> <li> <p> <code>RevokeCacheSecurityGroupIngress</code> </p> </li> </ul>\",\
      \"wrapper\":true\
    },\
    \"CacheSecurityGroupAlreadyExistsFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A cache security group with the specified name already exists.</p>\",\
      \"error\":{\
        \"code\":\"CacheSecurityGroupAlreadyExists\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CacheSecurityGroupMembership\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheSecurityGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache security group.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The membership status in the cache security group. The status changes when a cache security group is modified, or when the cache security groups assigned to a cluster are modified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a cluster's status within a particular cache security group.</p>\"\
    },\
    \"CacheSecurityGroupMembershipList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"CacheSecurityGroupMembership\",\
        \"locationName\":\"CacheSecurityGroup\"\
      }\
    },\
    \"CacheSecurityGroupMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Provides an identifier to allow retrieval of paginated results.</p>\"\
        },\
        \"CacheSecurityGroups\":{\
          \"shape\":\"CacheSecurityGroups\",\
          \"documentation\":\"<p>A list of cache security groups. Each element in the list contains detailed information about one group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output of a <code>DescribeCacheSecurityGroups</code> operation.</p>\"\
    },\
    \"CacheSecurityGroupNameList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"CacheSecurityGroupName\"\
      }\
    },\
    \"CacheSecurityGroupNotFoundFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested cache security group name does not refer to an existing cache security group.</p>\",\
      \"error\":{\
        \"code\":\"CacheSecurityGroupNotFound\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CacheSecurityGroupQuotaExceededFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The request cannot be processed because it would exceed the allowed number of cache security groups.</p>\",\
      \"error\":{\
        \"code\":\"QuotaExceeded.CacheSecurityGroup\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CacheSecurityGroups\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"CacheSecurityGroup\",\
        \"locationName\":\"CacheSecurityGroup\"\
      }\
    },\
    \"CacheSubnetGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheSubnetGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache subnet group.</p>\"\
        },\
        \"CacheSubnetGroupDescription\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description of the cache subnet group.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Virtual Private Cloud identifier (VPC ID) of the cache subnet group.</p>\"\
        },\
        \"Subnets\":{\
          \"shape\":\"SubnetList\",\
          \"documentation\":\"<p>A list of subnets associated with the cache subnet group.</p>\"\
        },\
        \"ARN\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN (Amazon Resource Name) of the cache subnet group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output of one of the following operations:</p> <ul> <li> <p> <code>CreateCacheSubnetGroup</code> </p> </li> <li> <p> <code>ModifyCacheSubnetGroup</code> </p> </li> </ul>\",\
      \"wrapper\":true\
    },\
    \"CacheSubnetGroupAlreadyExistsFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested cache subnet group name is already in use by an existing cache subnet group.</p>\",\
      \"error\":{\
        \"code\":\"CacheSubnetGroupAlreadyExists\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CacheSubnetGroupInUse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested cache subnet group is currently in use.</p>\",\
      \"error\":{\
        \"code\":\"CacheSubnetGroupInUse\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CacheSubnetGroupMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Provides an identifier to allow retrieval of paginated results.</p>\"\
        },\
        \"CacheSubnetGroups\":{\
          \"shape\":\"CacheSubnetGroups\",\
          \"documentation\":\"<p>A list of cache subnet groups. Each element in the list contains detailed information about one group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output of a <code>DescribeCacheSubnetGroups</code> operation.</p>\"\
    },\
    \"CacheSubnetGroupNotFoundFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested cache subnet group name does not refer to an existing cache subnet group.</p>\",\
      \"error\":{\
        \"code\":\"CacheSubnetGroupNotFoundFault\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CacheSubnetGroupQuotaExceededFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The request cannot be processed because it would exceed the allowed number of cache subnet groups.</p>\",\
      \"error\":{\
        \"code\":\"CacheSubnetGroupQuotaExceeded\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CacheSubnetGroups\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"CacheSubnetGroup\",\
        \"locationName\":\"CacheSubnetGroup\"\
      }\
    },\
    \"CacheSubnetQuotaExceededFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The request cannot be processed because it would exceed the allowed number of subnets in a cache subnet group.</p>\",\
      \"error\":{\
        \"code\":\"CacheSubnetQuotaExceededFault\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ChangeType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"immediate\",\
        \"requires-reboot\"\
      ]\
    },\
    \"ClusterIdList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"ClusterId\"\
      }\
    },\
    \"ClusterQuotaForCustomerExceededFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The request cannot be processed because it would exceed the allowed number of clusters per customer.</p>\",\
      \"error\":{\
        \"code\":\"ClusterQuotaForCustomerExceeded\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CompleteMigrationMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"ReplicationGroupId\"],\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the replication group to which data is being migrated.</p>\"\
        },\
        \"Force\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Forces the migration to stop without ensuring that data is in sync. It is recommended to use this option only to abort the migration and not recommended when application wants to continue migration to ElastiCache.</p>\"\
        }\
      }\
    },\
    \"CompleteMigrationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicationGroup\":{\"shape\":\"ReplicationGroup\"}\
      }\
    },\
    \"ConfigureShard\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"NodeGroupId\",\
        \"NewReplicaCount\"\
      ],\
      \"members\":{\
        \"NodeGroupId\":{\
          \"shape\":\"AllowedNodeGroupId\",\
          \"documentation\":\"<p>The 4-digit id for the node group you are configuring. For Redis (cluster mode disabled) replication groups, the node group id is always 0001. To find a Redis (cluster mode enabled)'s node group's (shard's) id, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/shard-find-id.html\\\">Finding a Shard's Id</a>.</p>\"\
        },\
        \"NewReplicaCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of replicas you want in this node group at the end of this operation. The maximum value for <code>NewReplicaCount</code> is 5. The minimum value depends upon the type of Redis replication group you are working with.</p> <p>The minimum number of replicas in a shard or replication group is:</p> <ul> <li> <p>Redis (cluster mode disabled)</p> <ul> <li> <p>If Multi-AZ with Automatic Failover is enabled: 1</p> </li> <li> <p>If Multi-AZ with Automatic Failover is not enable: 0</p> </li> </ul> </li> <li> <p>Redis (cluster mode enabled): 0 (though you will not be able to failover to a replica if your primary node fails)</p> </li> </ul>\"\
        },\
        \"PreferredAvailabilityZones\":{\
          \"shape\":\"PreferredAvailabilityZoneList\",\
          \"documentation\":\"<p>A list of <code>PreferredAvailabilityZone</code> strings that specify which availability zones the replication group's nodes are to be in. The nummber of <code>PreferredAvailabilityZone</code> values must equal the value of <code>NewReplicaCount</code> plus 1 to account for the primary node. If this member of <code>ReplicaConfiguration</code> is omitted, ElastiCache for Redis selects the availability zone for each of the replicas.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Node group (shard) configuration options when adding or removing replicas. Each node group (shard) configuration has the following members: NodeGroupId, NewReplicaCount, and PreferredAvailabilityZones. </p>\"\
    },\
    \"CopySnapshotMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SourceSnapshotName\",\
        \"TargetSnapshotName\"\
      ],\
      \"members\":{\
        \"SourceSnapshotName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of an existing snapshot from which to make a copy.</p>\"\
        },\
        \"TargetSnapshotName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A name for the snapshot copy. ElastiCache does not permit overwriting a snapshot, therefore this name must be unique within its context - ElastiCache or an Amazon S3 bucket if exporting.</p>\"\
        },\
        \"TargetBucket\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon S3 bucket to which the snapshot is exported. This parameter is used only when exporting a snapshot for external access.</p> <p>When using this parameter to export a snapshot, be sure Amazon ElastiCache has the needed permissions to this S3 bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access\\\">Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket</a> in the <i>Amazon ElastiCache User Guide</i>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Snapshots.Exporting.html\\\">Exporting a Snapshot</a> in the <i>Amazon ElastiCache User Guide</i>.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the KMS key used to encrypt the target snapshot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>CopySnapshotMessage</code> operation.</p>\"\
    },\
    \"CopySnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Snapshot\":{\"shape\":\"Snapshot\"}\
      }\
    },\
    \"CreateCacheClusterMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"CacheClusterId\"],\
      \"members\":{\
        \"CacheClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The node group (shard) identifier. This parameter is stored as a lowercase string.</p> <p> <b>Constraints:</b> </p> <ul> <li> <p>A name must contain from 1 to 50 alphanumeric characters or hyphens.</p> </li> <li> <p>The first character must be a letter.</p> </li> <li> <p>A name cannot end with a hyphen or contain two consecutive hyphens.</p> </li> </ul>\"\
        },\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the replication group to which this cluster should belong. If this parameter is specified, the cluster is added to the specified replication group as a read replica; otherwise, the cluster is a standalone primary that is not part of any replication group.</p> <p>If the specified replication group is Multi-AZ enabled and the Availability Zone is not specified, the cluster is created in Availability Zones that provide the best spread of read replicas across Availability Zones.</p> <note> <p>This parameter is only valid if the <code>Engine</code> parameter is <code>redis</code>.</p> </note>\"\
        },\
        \"AZMode\":{\
          \"shape\":\"AZMode\",\
          \"documentation\":\"<p>Specifies whether the nodes in this Memcached cluster are created in a single Availability Zone or created across multiple Availability Zones in the cluster's region.</p> <p>This parameter is only supported for Memcached clusters.</p> <p>If the <code>AZMode</code> and <code>PreferredAvailabilityZones</code> are not specified, ElastiCache assumes <code>single-az</code> mode.</p>\"\
        },\
        \"PreferredAvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The EC2 Availability Zone in which the cluster is created.</p> <p>All nodes belonging to this cluster are placed in the preferred Availability Zone. If you want to create your nodes across multiple Availability Zones, use <code>PreferredAvailabilityZones</code>.</p> <p>Default: System chosen Availability Zone.</p>\"\
        },\
        \"PreferredAvailabilityZones\":{\
          \"shape\":\"PreferredAvailabilityZoneList\",\
          \"documentation\":\"<p>A list of the Availability Zones in which cache nodes are created. The order of the zones in the list is not important.</p> <p>This option is only supported on Memcached.</p> <note> <p>If you are creating your cluster in an Amazon VPC (recommended) you can only locate nodes in Availability Zones that are associated with the subnets in the selected subnet group.</p> <p>The number of Availability Zones listed must equal the value of <code>NumCacheNodes</code>.</p> </note> <p>If you want all the nodes in the same Availability Zone, use <code>PreferredAvailabilityZone</code> instead, or repeat the Availability Zone multiple times in the list.</p> <p>Default: System chosen Availability Zones.</p>\"\
        },\
        \"NumCacheNodes\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The initial number of cache nodes that the cluster has.</p> <p>For clusters running Redis, this value must be 1. For clusters running Memcached, this value must be between 1 and 20.</p> <p>If you need more than 20 nodes for your Memcached cluster, please fill out the ElastiCache Limit Increase Request form at <a href=\\\"http://aws.amazon.com/contact-us/elasticache-node-limit-request/\\\">http://aws.amazon.com/contact-us/elasticache-node-limit-request/</a>.</p>\"\
        },\
        \"CacheNodeType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The compute and memory capacity of the nodes in the node group (shard).</p> <p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p> <ul> <li> <p>General purpose:</p> <ul> <li> <p>Current generation: </p> <p> <b>M5 node types:</b> <code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code> </p> <p> <b>M4 node types:</b> <code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code> </p> <p> <b>T3 node types:</b> <code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code> </p> <p> <b>T2 node types:</b> <code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>T1 node types:</b> <code>cache.t1.micro</code> </p> <p> <b>M1 node types:</b> <code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code> </p> <p> <b>M3 node types:</b> <code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code> </p> </li> </ul> </li> <li> <p>Compute optimized:</p> <ul> <li> <p>Previous generation: (not recommended)</p> <p> <b>C1 node types:</b> <code>cache.c1.xlarge</code> </p> </li> </ul> </li> <li> <p>Memory optimized:</p> <ul> <li> <p>Current generation: </p> <p> <b>R5 node types:</b> <code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code> </p> <p> <b>R4 node types:</b> <code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>M2 node types:</b> <code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code> </p> <p> <b>R3 node types:</b> <code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code> </p> </li> </ul> </li> </ul> <p> <b>Additional node type info</b> </p> <ul> <li> <p>All current generation instance types are created in Amazon VPC by default.</p> </li> <li> <p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p> </li> <li> <p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p> </li> <li> <p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p> </li> </ul>\"\
        },\
        \"Engine\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache engine to be used for this cluster.</p> <p>Valid values for this parameter are: <code>memcached</code> | <code>redis</code> </p>\"\
        },\
        \"EngineVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The version number of the cache engine to be used for this cluster. To view the supported cache engine versions, use the DescribeCacheEngineVersions operation.</p> <p> <b>Important:</b> You can upgrade to a newer engine version (see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SelectEngine.html#VersionManagement\\\">Selecting a Cache Engine and Version</a>), but you cannot downgrade to an earlier engine version. If you want to use an earlier engine version, you must delete the existing cluster or replication group and create it anew with the earlier engine version. </p>\"\
        },\
        \"CacheParameterGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the parameter group to associate with this cluster. If this argument is omitted, the default parameter group for the specified engine is used. You cannot use any parameter group which has <code>cluster-enabled='yes'</code> when creating a cluster.</p>\"\
        },\
        \"CacheSubnetGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the subnet group to be used for the cluster.</p> <p>Use this parameter only when you are creating a cluster in an Amazon Virtual Private Cloud (Amazon VPC).</p> <important> <p>If you're going to launch your cluster in an Amazon VPC, you need to create a subnet group before you start creating a cluster. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SubnetGroups.html\\\">Subnets and Subnet Groups</a>.</p> </important>\"\
        },\
        \"CacheSecurityGroupNames\":{\
          \"shape\":\"CacheSecurityGroupNameList\",\
          \"documentation\":\"<p>A list of security group names to associate with this cluster.</p> <p>Use this parameter only when you are creating a cluster outside of an Amazon Virtual Private Cloud (Amazon VPC).</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIdsList\",\
          \"documentation\":\"<p>One or more VPC security groups associated with the cluster.</p> <p>Use this parameter only when you are creating a cluster in an Amazon Virtual Private Cloud (Amazon VPC).</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of cost allocation tags to be added to this resource.</p>\"\
        },\
        \"SnapshotArns\":{\
          \"shape\":\"SnapshotArnsList\",\
          \"documentation\":\"<p>A single-element string list containing an Amazon Resource Name (ARN) that uniquely identifies a Redis RDB snapshot file stored in Amazon S3. The snapshot file is used to populate the node group (shard). The Amazon S3 object name in the ARN cannot contain any commas.</p> <note> <p>This parameter is only valid if the <code>Engine</code> parameter is <code>redis</code>.</p> </note> <p>Example of an Amazon S3 ARN: <code>arn:aws:s3:::my_bucket/snapshot1.rdb</code> </p>\"\
        },\
        \"SnapshotName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of a Redis snapshot from which to restore data into the new node group (shard). The snapshot status changes to <code>restoring</code> while the new node group (shard) is being created.</p> <note> <p>This parameter is only valid if the <code>Engine</code> parameter is <code>redis</code>.</p> </note>\"\
        },\
        \"PreferredMaintenanceWindow\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Valid values for <code>ddd</code> are:</p> <p>Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period.</p> <p>Valid values for <code>ddd</code> are:</p> <ul> <li> <p> <code>sun</code> </p> </li> <li> <p> <code>mon</code> </p> </li> <li> <p> <code>tue</code> </p> </li> <li> <p> <code>wed</code> </p> </li> <li> <p> <code>thu</code> </p> </li> <li> <p> <code>fri</code> </p> </li> <li> <p> <code>sat</code> </p> </li> </ul> <p>Example: <code>sun:23:00-mon:01:30</code> </p>\"\
        },\
        \"Port\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The port number on which each of the cache nodes accepts connections.</p>\"\
        },\
        \"NotificationTopicArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic to which notifications are sent.</p> <note> <p>The Amazon SNS topic owner must be the same as the cluster owner.</p> </note>\"\
        },\
        \"AutoMinorVersionUpgrade\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>This parameter is currently disabled.</p>\"\
        },\
        \"SnapshotRetentionLimit\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The number of days for which ElastiCache retains automatic snapshots before deleting them. For example, if you set <code>SnapshotRetentionLimit</code> to 5, a snapshot taken today is retained for 5 days before being deleted.</p> <note> <p>This parameter is only valid if the <code>Engine</code> parameter is <code>redis</code>.</p> </note> <p>Default: 0 (i.e., automatic backups are disabled for this cache cluster).</p>\"\
        },\
        \"SnapshotWindow\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your node group (shard).</p> <p>Example: <code>05:00-09:00</code> </p> <p>If you do not specify this parameter, ElastiCache automatically chooses an appropriate time range.</p> <note> <p>This parameter is only valid if the <code>Engine</code> parameter is <code>redis</code>.</p> </note>\"\
        },\
        \"AuthToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p> <b>Reserved parameter.</b> The password used to access a password protected server.</p> <p>Password constraints:</p> <ul> <li> <p>Must be only printable ASCII characters.</p> </li> <li> <p>Must be at least 16 characters and no more than 128 characters in length.</p> </li> <li> <p>The only permitted printable special characters are !, &amp;, #, $, ^, &lt;, &gt;, and -. Other printable special characters cannot be used in the AUTH token.</p> </li> </ul> <p>For more information, see <a href=\\\"http://redis.io/commands/AUTH\\\">AUTH password</a> at http://redis.io/commands/AUTH.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a CreateCacheCluster operation.</p>\"\
    },\
    \"CreateCacheClusterResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheCluster\":{\"shape\":\"CacheCluster\"}\
      }\
    },\
    \"CreateCacheParameterGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CacheParameterGroupName\",\
        \"CacheParameterGroupFamily\",\
        \"Description\"\
      ],\
      \"members\":{\
        \"CacheParameterGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A user-specified name for the cache parameter group.</p>\"\
        },\
        \"CacheParameterGroupFamily\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache parameter group family that the cache parameter group can be used with.</p> <p>Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> | <code>redis2.6</code> | <code>redis2.8</code> | <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> | </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A user-specified description for the cache parameter group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>CreateCacheParameterGroup</code> operation.</p>\"\
    },\
    \"CreateCacheParameterGroupResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheParameterGroup\":{\"shape\":\"CacheParameterGroup\"}\
      }\
    },\
    \"CreateCacheSecurityGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CacheSecurityGroupName\",\
        \"Description\"\
      ],\
      \"members\":{\
        \"CacheSecurityGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A name for the cache security group. This value is stored as a lowercase string.</p> <p>Constraints: Must contain no more than 255 alphanumeric characters. Cannot be the word \\\"Default\\\".</p> <p>Example: <code>mysecuritygroup</code> </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description for the cache security group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>CreateCacheSecurityGroup</code> operation.</p>\"\
    },\
    \"CreateCacheSecurityGroupResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheSecurityGroup\":{\"shape\":\"CacheSecurityGroup\"}\
      }\
    },\
    \"CreateCacheSubnetGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CacheSubnetGroupName\",\
        \"CacheSubnetGroupDescription\",\
        \"SubnetIds\"\
      ],\
      \"members\":{\
        \"CacheSubnetGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A name for the cache subnet group. This value is stored as a lowercase string.</p> <p>Constraints: Must contain no more than 255 alphanumeric characters or hyphens.</p> <p>Example: <code>mysubnetgroup</code> </p>\"\
        },\
        \"CacheSubnetGroupDescription\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description for the cache subnet group.</p>\"\
        },\
        \"SubnetIds\":{\
          \"shape\":\"SubnetIdentifierList\",\
          \"documentation\":\"<p>A list of VPC subnet IDs for the cache subnet group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>CreateCacheSubnetGroup</code> operation.</p>\"\
    },\
    \"CreateCacheSubnetGroupResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheSubnetGroup\":{\"shape\":\"CacheSubnetGroup\"}\
      }\
    },\
    \"CreateGlobalReplicationGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GlobalReplicationGroupIdSuffix\",\
        \"PrimaryReplicationGroupId\"\
      ],\
      \"members\":{\
        \"GlobalReplicationGroupIdSuffix\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The suffix name of a Global Datastore. The suffix guarantees uniqueness of the Global Datastore name across multiple regions.</p>\"\
        },\
        \"GlobalReplicationGroupDescription\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Provides details of the Global Datastore</p>\"\
        },\
        \"PrimaryReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the primary cluster that accepts writes and will replicate updates to the secondary cluster.</p>\"\
        }\
      }\
    },\
    \"CreateGlobalReplicationGroupResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GlobalReplicationGroup\":{\"shape\":\"GlobalReplicationGroup\"}\
      }\
    },\
    \"CreateReplicationGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ReplicationGroupId\",\
        \"ReplicationGroupDescription\"\
      ],\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The replication group identifier. This parameter is stored as a lowercase string.</p> <p>Constraints:</p> <ul> <li> <p>A name must contain from 1 to 40 alphanumeric characters or hyphens.</p> </li> <li> <p>The first character must be a letter.</p> </li> <li> <p>A name cannot end with a hyphen or contain two consecutive hyphens.</p> </li> </ul>\"\
        },\
        \"ReplicationGroupDescription\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A user-created description for the replication group.</p>\"\
        },\
        \"GlobalReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Global Datastore</p>\"\
        },\
        \"PrimaryClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier of the cluster that serves as the primary for this replication group. This cluster must already exist and have a status of <code>available</code>.</p> <p>This parameter is not required if <code>NumCacheClusters</code>, <code>NumNodeGroups</code>, or <code>ReplicasPerNodeGroup</code> is specified.</p>\"\
        },\
        \"AutomaticFailoverEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>Specifies whether a read-only replica is automatically promoted to read/write primary if the existing primary fails.</p> <p> <code>AutomaticFailoverEnabled</code> must be enabled for Redis (cluster mode enabled) replication groups.</p> <p>Default: false</p> <p>Amazon ElastiCache for Redis does not support Multi-AZ with automatic failover on:</p> <ul> <li> <p>Redis versions earlier than 2.8.6.</p> </li> <li> <p>Redis (cluster mode disabled): T1 node types.</p> </li> <li> <p>Redis (cluster mode enabled): T1 node types.</p> </li> </ul>\"\
        },\
        \"MultiAZEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>A flag indicating if you have Multi-AZ enabled to enhance fault tolerance. For more information, see <a href=\\\"http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/AutoFailover.html\\\">Minimizing Downtime: Multi-AZ</a>.</p>\"\
        },\
        \"NumCacheClusters\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The number of clusters this replication group initially has.</p> <p>This parameter is not used if there is more than one node group (shard). You should use <code>ReplicasPerNodeGroup</code> instead.</p> <p>If <code>AutomaticFailoverEnabled</code> is <code>true</code>, the value of this parameter must be at least 2. If <code>AutomaticFailoverEnabled</code> is <code>false</code> you can omit this parameter (it will default to 1), or you can explicitly set it to a value between 2 and 6.</p> <p>The maximum permitted value for <code>NumCacheClusters</code> is 6 (1 primary plus 5 replicas).</p>\"\
        },\
        \"PreferredCacheClusterAZs\":{\
          \"shape\":\"AvailabilityZonesList\",\
          \"documentation\":\"<p>A list of EC2 Availability Zones in which the replication group's clusters are created. The order of the Availability Zones in the list is the order in which clusters are allocated. The primary cluster is created in the first AZ in the list.</p> <p>This parameter is not used if there is more than one node group (shard). You should use <code>NodeGroupConfiguration</code> instead.</p> <note> <p>If you are creating your replication group in an Amazon VPC (recommended), you can only locate clusters in Availability Zones associated with the subnets in the selected subnet group.</p> <p>The number of Availability Zones listed must equal the value of <code>NumCacheClusters</code>.</p> </note> <p>Default: system chosen Availability Zones.</p>\"\
        },\
        \"NumNodeGroups\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>An optional parameter that specifies the number of node groups (shards) for this Redis (cluster mode enabled) replication group. For Redis (cluster mode disabled) either omit this parameter or set it to 1.</p> <p>Default: 1</p>\"\
        },\
        \"ReplicasPerNodeGroup\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>An optional parameter that specifies the number of replica nodes in each node group (shard). Valid values are 0 to 5.</p>\"\
        },\
        \"NodeGroupConfiguration\":{\
          \"shape\":\"NodeGroupConfigurationList\",\
          \"documentation\":\"<p>A list of node group (shard) configuration options. Each node group (shard) configuration has the following members: <code>PrimaryAvailabilityZone</code>, <code>ReplicaAvailabilityZones</code>, <code>ReplicaCount</code>, and <code>Slots</code>.</p> <p>If you're creating a Redis (cluster mode disabled) or a Redis (cluster mode enabled) replication group, you can use this parameter to individually configure each node group (shard), or you can omit this parameter. However, it is required when seeding a Redis (cluster mode enabled) cluster from a S3 rdb file. You must configure each node group (shard) using this parameter because you must specify the slots for each node group.</p>\"\
        },\
        \"CacheNodeType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The compute and memory capacity of the nodes in the node group (shard).</p> <p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p> <ul> <li> <p>General purpose:</p> <ul> <li> <p>Current generation: </p> <p> <b>M5 node types:</b> <code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code> </p> <p> <b>M4 node types:</b> <code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code> </p> <p> <b>T3 node types:</b> <code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code> </p> <p> <b>T2 node types:</b> <code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>T1 node types:</b> <code>cache.t1.micro</code> </p> <p> <b>M1 node types:</b> <code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code> </p> <p> <b>M3 node types:</b> <code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code> </p> </li> </ul> </li> <li> <p>Compute optimized:</p> <ul> <li> <p>Previous generation: (not recommended)</p> <p> <b>C1 node types:</b> <code>cache.c1.xlarge</code> </p> </li> </ul> </li> <li> <p>Memory optimized:</p> <ul> <li> <p>Current generation: </p> <p> <b>R5 node types:</b> <code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code> </p> <p> <b>R4 node types:</b> <code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>M2 node types:</b> <code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code> </p> <p> <b>R3 node types:</b> <code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code> </p> </li> </ul> </li> </ul> <p> <b>Additional node type info</b> </p> <ul> <li> <p>All current generation instance types are created in Amazon VPC by default.</p> </li> <li> <p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p> </li> <li> <p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p> </li> <li> <p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p> </li> </ul>\"\
        },\
        \"Engine\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache engine to be used for the clusters in this replication group.</p>\"\
        },\
        \"EngineVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The version number of the cache engine to be used for the clusters in this replication group. To view the supported cache engine versions, use the <code>DescribeCacheEngineVersions</code> operation.</p> <p> <b>Important:</b> You can upgrade to a newer engine version (see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SelectEngine.html#VersionManagement\\\">Selecting a Cache Engine and Version</a>) in the <i>ElastiCache User Guide</i>, but you cannot downgrade to an earlier engine version. If you want to use an earlier engine version, you must delete the existing cluster or replication group and create it anew with the earlier engine version. </p>\"\
        },\
        \"CacheParameterGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the parameter group to associate with this replication group. If this argument is omitted, the default cache parameter group for the specified engine is used.</p> <note> <p>If you are restoring to an engine version that is different than the original, you must specify the default version of that version. For example, <code>CacheParameterGroupName=default.redis4.0</code>.</p> </note> <p>If you are running Redis version 3.2.4 or later, only one node group (shard), and want to use a default parameter group, we recommend that you specify the parameter group by name. </p> <ul> <li> <p>To create a Redis (cluster mode disabled) replication group, use <code>CacheParameterGroupName=default.redis3.2</code>.</p> </li> <li> <p>To create a Redis (cluster mode enabled) replication group, use <code>CacheParameterGroupName=default.redis3.2.cluster.on</code>.</p> </li> </ul>\"\
        },\
        \"CacheSubnetGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache subnet group to be used for the replication group.</p> <important> <p>If you're going to launch your cluster in an Amazon VPC, you need to create a subnet group before you start creating a cluster. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SubnetGroups.html\\\">Subnets and Subnet Groups</a>.</p> </important>\"\
        },\
        \"CacheSecurityGroupNames\":{\
          \"shape\":\"CacheSecurityGroupNameList\",\
          \"documentation\":\"<p>A list of cache security group names to associate with this replication group.</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIdsList\",\
          \"documentation\":\"<p>One or more Amazon VPC security groups associated with this replication group.</p> <p>Use this parameter only when you are creating a replication group in an Amazon Virtual Private Cloud (Amazon VPC).</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of cost allocation tags to be added to this resource. Tags are comma-separated key,value pairs (e.g. Key=<code>myKey</code>, Value=<code>myKeyValue</code>. You can include multiple tags as shown following: Key=<code>myKey</code>, Value=<code>myKeyValue</code> Key=<code>mySecondKey</code>, Value=<code>mySecondKeyValue</code>.</p>\"\
        },\
        \"SnapshotArns\":{\
          \"shape\":\"SnapshotArnsList\",\
          \"documentation\":\"<p>A list of Amazon Resource Names (ARN) that uniquely identify the Redis RDB snapshot files stored in Amazon S3. The snapshot files are used to populate the new replication group. The Amazon S3 object name in the ARN cannot contain any commas. The new replication group will have the number of node groups (console: shards) specified by the parameter <i>NumNodeGroups</i> or the number of node groups configured by <i>NodeGroupConfiguration</i> regardless of the number of ARNs specified here.</p> <p>Example of an Amazon S3 ARN: <code>arn:aws:s3:::my_bucket/snapshot1.rdb</code> </p>\"\
        },\
        \"SnapshotName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of a snapshot from which to restore data into the new replication group. The snapshot status changes to <code>restoring</code> while the new replication group is being created.</p>\"\
        },\
        \"PreferredMaintenanceWindow\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Valid values for <code>ddd</code> are:</p> <p>Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period.</p> <p>Valid values for <code>ddd</code> are:</p> <ul> <li> <p> <code>sun</code> </p> </li> <li> <p> <code>mon</code> </p> </li> <li> <p> <code>tue</code> </p> </li> <li> <p> <code>wed</code> </p> </li> <li> <p> <code>thu</code> </p> </li> <li> <p> <code>fri</code> </p> </li> <li> <p> <code>sat</code> </p> </li> </ul> <p>Example: <code>sun:23:00-mon:01:30</code> </p>\"\
        },\
        \"Port\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The port number on which each member of the replication group accepts connections.</p>\"\
        },\
        \"NotificationTopicArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic to which notifications are sent.</p> <note> <p>The Amazon SNS topic owner must be the same as the cluster owner.</p> </note>\"\
        },\
        \"AutoMinorVersionUpgrade\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>This parameter is currently disabled.</p>\"\
        },\
        \"SnapshotRetentionLimit\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The number of days for which ElastiCache retains automatic snapshots before deleting them. For example, if you set <code>SnapshotRetentionLimit</code> to 5, a snapshot that was taken today is retained for 5 days before being deleted.</p> <p>Default: 0 (i.e., automatic backups are disabled for this cluster).</p>\"\
        },\
        \"SnapshotWindow\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your node group (shard).</p> <p>Example: <code>05:00-09:00</code> </p> <p>If you do not specify this parameter, ElastiCache automatically chooses an appropriate time range.</p>\"\
        },\
        \"AuthToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p> <b>Reserved parameter.</b> The password used to access a password protected server.</p> <p> <code>AuthToken</code> can be specified only on replication groups where <code>TransitEncryptionEnabled</code> is <code>true</code>.</p> <important> <p>For HIPAA compliance, you must specify <code>TransitEncryptionEnabled</code> as <code>true</code>, an <code>AuthToken</code>, and a <code>CacheSubnetGroup</code>.</p> </important> <p>Password constraints:</p> <ul> <li> <p>Must be only printable ASCII characters.</p> </li> <li> <p>Must be at least 16 characters and no more than 128 characters in length.</p> </li> <li> <p>The only permitted printable special characters are !, &amp;, #, $, ^, &lt;, &gt;, and -. Other printable special characters cannot be used in the AUTH token.</p> </li> </ul> <p>For more information, see <a href=\\\"http://redis.io/commands/AUTH\\\">AUTH password</a> at http://redis.io/commands/AUTH.</p>\"\
        },\
        \"TransitEncryptionEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>A flag that enables in-transit encryption when set to <code>true</code>.</p> <p>You cannot modify the value of <code>TransitEncryptionEnabled</code> after the cluster is created. To enable in-transit encryption on a cluster you must set <code>TransitEncryptionEnabled</code> to <code>true</code> when you create a cluster.</p> <p>This parameter is valid only if the <code>Engine</code> parameter is <code>redis</code>, the <code>EngineVersion</code> parameter is <code>3.2.6</code>, <code>4.x</code> or later, and the cluster is being created in an Amazon VPC.</p> <p>If you enable in-transit encryption, you must also specify a value for <code>CacheSubnetGroup</code>.</p> <p> <b>Required:</b> Only available when creating a replication group in an Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or later.</p> <p>Default: <code>false</code> </p> <important> <p>For HIPAA compliance, you must specify <code>TransitEncryptionEnabled</code> as <code>true</code>, an <code>AuthToken</code>, and a <code>CacheSubnetGroup</code>.</p> </important>\"\
        },\
        \"AtRestEncryptionEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>A flag that enables encryption at rest when set to <code>true</code>.</p> <p>You cannot modify the value of <code>AtRestEncryptionEnabled</code> after the replication group is created. To enable encryption at rest on a replication group you must set <code>AtRestEncryptionEnabled</code> to <code>true</code> when you create the replication group. </p> <p> <b>Required:</b> Only available when creating a replication group in an Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or later.</p> <p>Default: <code>false</code> </p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the KMS key used to encrypt the disk in the cluster.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>CreateReplicationGroup</code> operation.</p>\"\
    },\
    \"CreateReplicationGroupResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicationGroup\":{\"shape\":\"ReplicationGroup\"}\
      }\
    },\
    \"CreateSnapshotMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"SnapshotName\"],\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier of an existing replication group. The snapshot is created from this replication group.</p>\"\
        },\
        \"CacheClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier of an existing cluster. The snapshot is created from this cluster.</p>\"\
        },\
        \"SnapshotName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A name for the snapshot being created.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the KMS key used to encrypt the snapshot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>CreateSnapshot</code> operation.</p>\"\
    },\
    \"CreateSnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Snapshot\":{\"shape\":\"Snapshot\"}\
      }\
    },\
    \"CustomerNodeEndpoint\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Address\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The address of the node endpoint</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The port of the node endpoint</p>\"\
        }\
      },\
      \"documentation\":\"<p>The endpoint from which data should be migrated.</p>\"\
    },\
    \"CustomerNodeEndpointList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CustomerNodeEndpoint\"}\
    },\
    \"DecreaseNodeGroupsInGlobalReplicationGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GlobalReplicationGroupId\",\
        \"NodeGroupCount\",\
        \"ApplyImmediately\"\
      ],\
      \"members\":{\
        \"GlobalReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Global Datastore</p>\"\
        },\
        \"NodeGroupCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of node groups (shards) that results from the modification of the shard configuration</p>\"\
        },\
        \"GlobalNodeGroupsToRemove\":{\
          \"shape\":\"GlobalNodeGroupIdList\",\
          \"documentation\":\"<p>If the value of NodeGroupCount is less than the current number of node groups (shards), then either NodeGroupsToRemove or NodeGroupsToRetain is required. NodeGroupsToRemove is a list of NodeGroupIds to remove from the cluster. ElastiCache for Redis will attempt to remove all node groups listed by NodeGroupsToRemove from the cluster. </p>\"\
        },\
        \"GlobalNodeGroupsToRetain\":{\
          \"shape\":\"GlobalNodeGroupIdList\",\
          \"documentation\":\"<p>If the value of NodeGroupCount is less than the current number of node groups (shards), then either NodeGroupsToRemove or NodeGroupsToRetain is required. NodeGroupsToRemove is a list of NodeGroupIds to remove from the cluster. ElastiCache for Redis will attempt to remove all node groups listed by NodeGroupsToRemove from the cluster. </p>\"\
        },\
        \"ApplyImmediately\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates that the shard reconfiguration process begins immediately. At present, the only permitted value for this parameter is true. </p>\"\
        }\
      }\
    },\
    \"DecreaseNodeGroupsInGlobalReplicationGroupResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GlobalReplicationGroup\":{\"shape\":\"GlobalReplicationGroup\"}\
      }\
    },\
    \"DecreaseReplicaCountMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ReplicationGroupId\",\
        \"ApplyImmediately\"\
      ],\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The id of the replication group from which you want to remove replica nodes.</p>\"\
        },\
        \"NewReplicaCount\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The number of read replica nodes you want at the completion of this operation. For Redis (cluster mode disabled) replication groups, this is the number of replica nodes in the replication group. For Redis (cluster mode enabled) replication groups, this is the number of replica nodes in each of the replication group's node groups.</p> <p>The minimum number of replicas in a shard or replication group is:</p> <ul> <li> <p>Redis (cluster mode disabled)</p> <ul> <li> <p>If Multi-AZ with Automatic Failover is enabled: 1</p> </li> <li> <p>If Multi-AZ with Automatic Failover is not enabled: 0</p> </li> </ul> </li> <li> <p>Redis (cluster mode enabled): 0 (though you will not be able to failover to a replica if your primary node fails)</p> </li> </ul>\"\
        },\
        \"ReplicaConfiguration\":{\
          \"shape\":\"ReplicaConfigurationList\",\
          \"documentation\":\"<p>A list of <code>ConfigureShard</code> objects that can be used to configure each shard in a Redis (cluster mode enabled) replication group. The <code>ConfigureShard</code> has three members: <code>NewReplicaCount</code>, <code>NodeGroupId</code>, and <code>PreferredAvailabilityZones</code>.</p>\"\
        },\
        \"ReplicasToRemove\":{\
          \"shape\":\"RemoveReplicasList\",\
          \"documentation\":\"<p>A list of the node ids to remove from the replication group or node group (shard).</p>\"\
        },\
        \"ApplyImmediately\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If <code>True</code>, the number of replica nodes is decreased immediately. <code>ApplyImmediately=False</code> is not currently supported.</p>\"\
        }\
      }\
    },\
    \"DecreaseReplicaCountResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicationGroup\":{\"shape\":\"ReplicationGroup\"}\
      }\
    },\
    \"DeleteCacheClusterMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"CacheClusterId\"],\
      \"members\":{\
        \"CacheClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cluster identifier for the cluster to be deleted. This parameter is not case sensitive.</p>\"\
        },\
        \"FinalSnapshotIdentifier\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The user-supplied name of a final cluster snapshot. This is the unique name that identifies the snapshot. ElastiCache creates the snapshot, and then deletes the cluster immediately afterward.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DeleteCacheCluster</code> operation.</p>\"\
    },\
    \"DeleteCacheClusterResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheCluster\":{\"shape\":\"CacheCluster\"}\
      }\
    },\
    \"DeleteCacheParameterGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"CacheParameterGroupName\"],\
      \"members\":{\
        \"CacheParameterGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache parameter group to delete.</p> <note> <p>The specified cache security group must not be associated with any clusters.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DeleteCacheParameterGroup</code> operation.</p>\"\
    },\
    \"DeleteCacheSecurityGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"CacheSecurityGroupName\"],\
      \"members\":{\
        \"CacheSecurityGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache security group to delete.</p> <note> <p>You cannot delete the default security group.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DeleteCacheSecurityGroup</code> operation.</p>\"\
    },\
    \"DeleteCacheSubnetGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"CacheSubnetGroupName\"],\
      \"members\":{\
        \"CacheSubnetGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache subnet group to delete.</p> <p>Constraints: Must contain no more than 255 alphanumeric characters or hyphens.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DeleteCacheSubnetGroup</code> operation.</p>\"\
    },\
    \"DeleteGlobalReplicationGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GlobalReplicationGroupId\",\
        \"RetainPrimaryReplicationGroup\"\
      ],\
      \"members\":{\
        \"GlobalReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Global Datastore</p>\"\
        },\
        \"RetainPrimaryReplicationGroup\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>The primary replication group is retained as a standalone replication group. </p>\"\
        }\
      }\
    },\
    \"DeleteGlobalReplicationGroupResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GlobalReplicationGroup\":{\"shape\":\"GlobalReplicationGroup\"}\
      }\
    },\
    \"DeleteReplicationGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"ReplicationGroupId\"],\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier for the cluster to be deleted. This parameter is not case sensitive.</p>\"\
        },\
        \"RetainPrimaryCluster\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>If set to <code>true</code>, all of the read replicas are deleted, but the primary node is retained.</p>\"\
        },\
        \"FinalSnapshotIdentifier\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of a final node group (shard) snapshot. ElastiCache creates the snapshot from the primary node in the cluster, rather than one of the replicas; this is to ensure that it captures the freshest data. After the final snapshot is taken, the replication group is immediately deleted.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DeleteReplicationGroup</code> operation.</p>\"\
    },\
    \"DeleteReplicationGroupResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicationGroup\":{\"shape\":\"ReplicationGroup\"}\
      }\
    },\
    \"DeleteSnapshotMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"SnapshotName\"],\
      \"members\":{\
        \"SnapshotName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the snapshot to be deleted.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DeleteSnapshot</code> operation.</p>\"\
    },\
    \"DeleteSnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Snapshot\":{\"shape\":\"Snapshot\"}\
      }\
    },\
    \"DescribeCacheClustersMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The user-supplied cluster identifier. If this parameter is specified, only information about that specific cluster is returned. This parameter isn't case sensitive.</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p> <p>Default: 100</p> <p>Constraints: minimum 20; maximum 100.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>\"\
        },\
        \"ShowCacheNodeInfo\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>An optional flag that can be included in the <code>DescribeCacheCluster</code> request to retrieve information about the individual cache nodes.</p>\"\
        },\
        \"ShowCacheClustersNotInReplicationGroups\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>An optional flag that can be included in the <code>DescribeCacheCluster</code> request to show only nodes (API/CLI: clusters) that are not members of a replication group. In practice, this mean Memcached and single node Redis clusters.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DescribeCacheClusters</code> operation.</p>\"\
    },\
    \"DescribeCacheEngineVersionsMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Engine\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cache engine to return. Valid values: <code>memcached</code> | <code>redis</code> </p>\"\
        },\
        \"EngineVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cache engine version to return.</p> <p>Example: <code>1.4.14</code> </p>\"\
        },\
        \"CacheParameterGroupFamily\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of a specific cache parameter group family to return details for.</p> <p>Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> | <code>redis2.6</code> | <code>redis2.8</code> | <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> | </p> <p>Constraints:</p> <ul> <li> <p>Must be 1 to 255 alphanumeric characters</p> </li> <li> <p>First character must be a letter</p> </li> <li> <p>Cannot end with a hyphen or contain two consecutive hyphens</p> </li> </ul>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p> <p>Default: 100</p> <p>Constraints: minimum 20; maximum 100.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>\"\
        },\
        \"DefaultOnly\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If <code>true</code>, specifies that only the default version of the specified engine or engine and major version combination is to be returned.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DescribeCacheEngineVersions</code> operation.</p>\"\
    },\
    \"DescribeCacheParameterGroupsMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheParameterGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of a specific cache parameter group to return details for.</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p> <p>Default: 100</p> <p>Constraints: minimum 20; maximum 100.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DescribeCacheParameterGroups</code> operation.</p>\"\
    },\
    \"DescribeCacheParametersMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"CacheParameterGroupName\"],\
      \"members\":{\
        \"CacheParameterGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of a specific cache parameter group to return details for.</p>\"\
        },\
        \"Source\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The parameter types to return.</p> <p>Valid values: <code>user</code> | <code>system</code> | <code>engine-default</code> </p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p> <p>Default: 100</p> <p>Constraints: minimum 20; maximum 100.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DescribeCacheParameters</code> operation.</p>\"\
    },\
    \"DescribeCacheSecurityGroupsMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheSecurityGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache security group to return details for.</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p> <p>Default: 100</p> <p>Constraints: minimum 20; maximum 100.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DescribeCacheSecurityGroups</code> operation.</p>\"\
    },\
    \"DescribeCacheSubnetGroupsMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheSubnetGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache subnet group to return details for.</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p> <p>Default: 100</p> <p>Constraints: minimum 20; maximum 100.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DescribeCacheSubnetGroups</code> operation.</p>\"\
    },\
    \"DescribeEngineDefaultParametersMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"CacheParameterGroupFamily\"],\
      \"members\":{\
        \"CacheParameterGroupFamily\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache parameter group family.</p> <p>Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> | <code>redis2.6</code> | <code>redis2.8</code> | <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> | </p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p> <p>Default: 100</p> <p>Constraints: minimum 20; maximum 100.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DescribeEngineDefaultParameters</code> operation.</p>\"\
    },\
    \"DescribeEngineDefaultParametersResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EngineDefaults\":{\"shape\":\"EngineDefaults\"}\
      }\
    },\
    \"DescribeEventsMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SourceIdentifier\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier of the event source for which events are returned. If not specified, all sources are included in the response.</p>\"\
        },\
        \"SourceType\":{\
          \"shape\":\"SourceType\",\
          \"documentation\":\"<p>The event source to retrieve events for. If no value is specified, all events are returned.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The beginning of the time interval to retrieve events for, specified in ISO 8601 format.</p> <p> <b>Example:</b> 2017-03-30T07:03:49.555Z</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The end of the time interval for which to retrieve events, specified in ISO 8601 format.</p> <p> <b>Example:</b> 2017-03-30T07:03:49.555Z</p>\"\
        },\
        \"Duration\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The number of minutes worth of events to retrieve.</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p> <p>Default: 100</p> <p>Constraints: minimum 20; maximum 100.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DescribeEvents</code> operation.</p>\"\
    },\
    \"DescribeGlobalReplicationGroupsMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GlobalReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Global Datastore</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a marker is included in the response so that the remaining results can be retrieved. </p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>\"\
        },\
        \"ShowMemberInfo\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>Returns the list of members that comprise the Global Datastore.</p>\"\
        }\
      }\
    },\
    \"DescribeGlobalReplicationGroupsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. &gt;</p>\"\
        },\
        \"GlobalReplicationGroups\":{\
          \"shape\":\"GlobalReplicationGroupList\",\
          \"documentation\":\"<p>Indicates the slot configuration and global identifier for each slice group.</p>\"\
        }\
      }\
    },\
    \"DescribeReplicationGroupsMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier for the replication group to be described. This parameter is not case sensitive.</p> <p>If you do not specify this parameter, information about all replication groups is returned.</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p> <p>Default: 100</p> <p>Constraints: minimum 20; maximum 100.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DescribeReplicationGroups</code> operation.</p>\"\
    },\
    \"DescribeReservedCacheNodesMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedCacheNodeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The reserved cache node identifier filter value. Use this parameter to show only the reservation that matches the specified reservation ID.</p>\"\
        },\
        \"ReservedCacheNodesOfferingId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The offering identifier filter value. Use this parameter to show only purchased reservations matching the specified offering identifier.</p>\"\
        },\
        \"CacheNodeType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cache node type filter value. Use this parameter to show only those reservations matching the specified cache node type.</p> <p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p> <ul> <li> <p>General purpose:</p> <ul> <li> <p>Current generation: </p> <p> <b>M5 node types:</b> <code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code> </p> <p> <b>M4 node types:</b> <code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code> </p> <p> <b>T3 node types:</b> <code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code> </p> <p> <b>T2 node types:</b> <code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>T1 node types:</b> <code>cache.t1.micro</code> </p> <p> <b>M1 node types:</b> <code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code> </p> <p> <b>M3 node types:</b> <code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code> </p> </li> </ul> </li> <li> <p>Compute optimized:</p> <ul> <li> <p>Previous generation: (not recommended)</p> <p> <b>C1 node types:</b> <code>cache.c1.xlarge</code> </p> </li> </ul> </li> <li> <p>Memory optimized:</p> <ul> <li> <p>Current generation: </p> <p> <b>R5 node types:</b> <code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code> </p> <p> <b>R4 node types:</b> <code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>M2 node types:</b> <code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code> </p> <p> <b>R3 node types:</b> <code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code> </p> </li> </ul> </li> </ul> <p> <b>Additional node type info</b> </p> <ul> <li> <p>All current generation instance types are created in Amazon VPC by default.</p> </li> <li> <p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p> </li> <li> <p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p> </li> <li> <p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p> </li> </ul>\"\
        },\
        \"Duration\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The duration filter value, specified in years or seconds. Use this parameter to show only reservations for this duration.</p> <p>Valid Values: <code>1 | 3 | 31536000 | 94608000</code> </p>\"\
        },\
        \"ProductDescription\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The product description filter value. Use this parameter to show only those reservations matching the specified product description.</p>\"\
        },\
        \"OfferingType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The offering type filter value. Use this parameter to show only the available offerings matching the specified offering type.</p> <p>Valid values: <code>\\\"Light Utilization\\\"|\\\"Medium Utilization\\\"|\\\"Heavy Utilization\\\"</code> </p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p> <p>Default: 100</p> <p>Constraints: minimum 20; maximum 100.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DescribeReservedCacheNodes</code> operation.</p>\"\
    },\
    \"DescribeReservedCacheNodesOfferingsMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedCacheNodesOfferingId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The offering identifier filter value. Use this parameter to show only the available offering that matches the specified reservation identifier.</p> <p>Example: <code>438012d3-4052-4cc7-b2e3-8d3372e0e706</code> </p>\"\
        },\
        \"CacheNodeType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cache node type filter value. Use this parameter to show only the available offerings matching the specified cache node type.</p> <p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p> <ul> <li> <p>General purpose:</p> <ul> <li> <p>Current generation: </p> <p> <b>M5 node types:</b> <code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code> </p> <p> <b>M4 node types:</b> <code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code> </p> <p> <b>T3 node types:</b> <code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code> </p> <p> <b>T2 node types:</b> <code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>T1 node types:</b> <code>cache.t1.micro</code> </p> <p> <b>M1 node types:</b> <code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code> </p> <p> <b>M3 node types:</b> <code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code> </p> </li> </ul> </li> <li> <p>Compute optimized:</p> <ul> <li> <p>Previous generation: (not recommended)</p> <p> <b>C1 node types:</b> <code>cache.c1.xlarge</code> </p> </li> </ul> </li> <li> <p>Memory optimized:</p> <ul> <li> <p>Current generation: </p> <p> <b>R5 node types:</b> <code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code> </p> <p> <b>R4 node types:</b> <code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>M2 node types:</b> <code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code> </p> <p> <b>R3 node types:</b> <code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code> </p> </li> </ul> </li> </ul> <p> <b>Additional node type info</b> </p> <ul> <li> <p>All current generation instance types are created in Amazon VPC by default.</p> </li> <li> <p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p> </li> <li> <p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p> </li> <li> <p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p> </li> </ul>\"\
        },\
        \"Duration\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Duration filter value, specified in years or seconds. Use this parameter to show only reservations for a given duration.</p> <p>Valid Values: <code>1 | 3 | 31536000 | 94608000</code> </p>\"\
        },\
        \"ProductDescription\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The product description filter value. Use this parameter to show only the available offerings matching the specified product description.</p>\"\
        },\
        \"OfferingType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The offering type filter value. Use this parameter to show only the available offerings matching the specified offering type.</p> <p>Valid Values: <code>\\\"Light Utilization\\\"|\\\"Medium Utilization\\\"|\\\"Heavy Utilization\\\"</code> </p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p> <p>Default: 100</p> <p>Constraints: minimum 20; maximum 100.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DescribeReservedCacheNodesOfferings</code> operation.</p>\"\
    },\
    \"DescribeServiceUpdatesMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ServiceUpdateName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The unique ID of the service update</p>\"\
        },\
        \"ServiceUpdateStatus\":{\
          \"shape\":\"ServiceUpdateStatusList\",\
          \"documentation\":\"<p>The status of the service update</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The maximum number of records to include in the response</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>\"\
        }\
      }\
    },\
    \"DescribeSnapshotsListMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>\"\
        },\
        \"Snapshots\":{\
          \"shape\":\"SnapshotList\",\
          \"documentation\":\"<p>A list of snapshots. Each item in the list contains detailed information about one snapshot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output of a <code>DescribeSnapshots</code> operation.</p>\"\
    },\
    \"DescribeSnapshotsMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A user-supplied replication group identifier. If this parameter is specified, only snapshots associated with that specific replication group are described.</p>\"\
        },\
        \"CacheClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A user-supplied cluster identifier. If this parameter is specified, only snapshots associated with that specific cluster are described.</p>\"\
        },\
        \"SnapshotName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A user-supplied name of the snapshot. If this parameter is specified, only this snapshot are described.</p>\"\
        },\
        \"SnapshotSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If set to <code>system</code>, the output shows snapshots that were automatically created by ElastiCache. If set to <code>user</code> the output shows snapshots that were manually created. If omitted, the output shows both automatically and manually created snapshots.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p> <p>Default: 50</p> <p>Constraints: minimum 20; maximum 50.</p>\"\
        },\
        \"ShowNodeGroupConfig\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>A Boolean value which if true, the node group (shard) configuration is included in the snapshot description.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>DescribeSnapshotsMessage</code> operation.</p>\"\
    },\
    \"DescribeUpdateActionsMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ServiceUpdateName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The unique ID of the service update</p>\"\
        },\
        \"ReplicationGroupIds\":{\
          \"shape\":\"ReplicationGroupIdList\",\
          \"documentation\":\"<p>The replication group IDs</p>\"\
        },\
        \"CacheClusterIds\":{\
          \"shape\":\"CacheClusterIdList\",\
          \"documentation\":\"<p>The cache cluster IDs</p>\"\
        },\
        \"Engine\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Elasticache engine to which the update applies. Either Redis or Memcached </p>\"\
        },\
        \"ServiceUpdateStatus\":{\
          \"shape\":\"ServiceUpdateStatusList\",\
          \"documentation\":\"<p>The status of the service update</p>\"\
        },\
        \"ServiceUpdateTimeRange\":{\
          \"shape\":\"TimeRangeFilter\",\
          \"documentation\":\"<p>The range of time specified to search for service updates that are in available status</p>\"\
        },\
        \"UpdateActionStatus\":{\
          \"shape\":\"UpdateActionStatusList\",\
          \"documentation\":\"<p>The status of the update action.</p>\"\
        },\
        \"ShowNodeLevelUpdateStatus\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>Dictates whether to include node level update status in the response </p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The maximum number of records to include in the response</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>\"\
        }\
      }\
    },\
    \"DisassociateGlobalReplicationGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GlobalReplicationGroupId\",\
        \"ReplicationGroupId\",\
        \"ReplicationGroupRegion\"\
      ],\
      \"members\":{\
        \"GlobalReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Global Datastore</p>\"\
        },\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the secondary cluster you wish to remove from the Global Datastore</p>\"\
        },\
        \"ReplicationGroupRegion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS region of secondary cluster you wish to remove from the Global Datastore</p>\"\
        }\
      }\
    },\
    \"DisassociateGlobalReplicationGroupResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GlobalReplicationGroup\":{\"shape\":\"GlobalReplicationGroup\"}\
      }\
    },\
    \"Double\":{\"type\":\"double\"},\
    \"EC2SecurityGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status of the Amazon EC2 security group.</p>\"\
        },\
        \"EC2SecurityGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Amazon EC2 security group.</p>\"\
        },\
        \"EC2SecurityGroupOwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account ID of the Amazon EC2 security group owner.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides ownership and status information for an Amazon EC2 security group.</p>\"\
    },\
    \"EC2SecurityGroupList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"EC2SecurityGroup\",\
        \"locationName\":\"EC2SecurityGroup\"\
      }\
    },\
    \"Endpoint\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Address\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The DNS hostname of the cache node.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The port number that the cache engine is listening on.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the information required for client programs to connect to a cache node.</p>\"\
    },\
    \"EngineDefaults\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheParameterGroupFamily\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the name of the cache parameter group family to which the engine default parameters apply.</p> <p>Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> | <code>redis2.6</code> | <code>redis2.8</code> | <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> | </p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Provides an identifier to allow retrieval of paginated results.</p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"ParametersList\",\
          \"documentation\":\"<p>Contains a list of engine default parameters.</p>\"\
        },\
        \"CacheNodeTypeSpecificParameters\":{\
          \"shape\":\"CacheNodeTypeSpecificParametersList\",\
          \"documentation\":\"<p>A list of parameters specific to a particular cache node type. Each element in the list contains detailed information about one parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output of a <code>DescribeEngineDefaultParameters</code> operation.</p>\",\
      \"wrapper\":true\
    },\
    \"Event\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SourceIdentifier\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier for the source of the event. For example, if the event occurred at the cluster level, the identifier would be the name of the cluster.</p>\"\
        },\
        \"SourceType\":{\
          \"shape\":\"SourceType\",\
          \"documentation\":\"<p>Specifies the origin of this event - a cluster, a parameter group, a security group, etc.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The text of the event.</p>\"\
        },\
        \"Date\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The date and time when the event occurred.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a single occurrence of something interesting within the system. Some examples of events are creating a cluster, adding or removing a cache node, or rebooting a node.</p>\"\
    },\
    \"EventList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Event\",\
        \"locationName\":\"Event\"\
      }\
    },\
    \"EventsMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Provides an identifier to allow retrieval of paginated results.</p>\"\
        },\
        \"Events\":{\
          \"shape\":\"EventList\",\
          \"documentation\":\"<p>A list of events. Each element in the list contains detailed information about one event.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output of a <code>DescribeEvents</code> operation.</p>\"\
    },\
    \"FailoverGlobalReplicationGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GlobalReplicationGroupId\",\
        \"PrimaryRegion\",\
        \"PrimaryReplicationGroupId\"\
      ],\
      \"members\":{\
        \"GlobalReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Global Datastore</p>\"\
        },\
        \"PrimaryRegion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS region of the primary cluster of the Global Datastore</p>\"\
        },\
        \"PrimaryReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the primary replication group</p>\"\
        }\
      }\
    },\
    \"FailoverGlobalReplicationGroupResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GlobalReplicationGroup\":{\"shape\":\"GlobalReplicationGroup\"}\
      }\
    },\
    \"GlobalNodeGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GlobalNodeGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the global node group</p>\"\
        },\
        \"Slots\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The keyspace for this node group</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates the slot configuration and global identifier for a slice group.</p>\"\
    },\
    \"GlobalNodeGroupIdList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"GlobalNodeGroupId\"\
      }\
    },\
    \"GlobalNodeGroupList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"GlobalNodeGroup\",\
        \"locationName\":\"GlobalNodeGroup\"\
      }\
    },\
    \"GlobalReplicationGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GlobalReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Global Datastore</p>\"\
        },\
        \"GlobalReplicationGroupDescription\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The optional description of the Global Datastore</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status of the Global Datastore</p>\"\
        },\
        \"CacheNodeType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cache node type of the Global Datastore</p>\"\
        },\
        \"Engine\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Elasticache engine. For Redis only.</p>\"\
        },\
        \"EngineVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Elasticache Redis engine version. For preview, it is Redis version 5.0.5 only.</p>\"\
        },\
        \"Members\":{\
          \"shape\":\"GlobalReplicationGroupMemberList\",\
          \"documentation\":\"<p>The replication groups that comprise the Global Datastore.</p>\"\
        },\
        \"ClusterEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>A flag that indicates whether the Global Datastore is cluster enabled.</p>\"\
        },\
        \"GlobalNodeGroups\":{\
          \"shape\":\"GlobalNodeGroupList\",\
          \"documentation\":\"<p>Indicates the slot configuration and global identifier for each slice group.</p>\"\
        },\
        \"AuthTokenEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>A flag that enables using an <code>AuthToken</code> (password) when issuing Redis commands.</p> <p>Default: <code>false</code> </p>\"\
        },\
        \"TransitEncryptionEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>A flag that enables in-transit encryption when set to true. You cannot modify the value of <code>TransitEncryptionEnabled</code> after the cluster is created. To enable in-transit encryption on a cluster you must set <code>TransitEncryptionEnabled</code> to true when you create a cluster. </p>\"\
        },\
        \"AtRestEncryptionEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>A flag that enables encryption at rest when set to <code>true</code>.</p> <p>You cannot modify the value of <code>AtRestEncryptionEnabled</code> after the replication group is created. To enable encryption at rest on a replication group you must set <code>AtRestEncryptionEnabled</code> to <code>true</code> when you create the replication group. </p> <p> <b>Required:</b> Only available when creating a replication group in an Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or later.</p>\"\
        },\
        \"ARN\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN (Amazon Resource Name) of the global replication group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Consists of a primary cluster that accepts writes and an associated secondary cluster that resides in a different AWS region. The secondary cluster accepts only reads. The primary cluster automatically replicates updates to the secondary cluster.</p> <ul> <li> <p>The <b>GlobalReplicationGroupIdSuffix</b> represents the name of the Global Datastore, which is what you use to associate a secondary cluster.</p> </li> </ul>\",\
      \"wrapper\":true\
    },\
    \"GlobalReplicationGroupAlreadyExistsFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The Global Datastore name already exists.</p>\",\
      \"error\":{\
        \"code\":\"GlobalReplicationGroupAlreadyExistsFault\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"GlobalReplicationGroupInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GlobalReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Global Datastore</p>\"\
        },\
        \"GlobalReplicationGroupMemberRole\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The role of the replication group in a Global Datastore. Can be primary or secondary.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The name of the Global Datastore and role of this replication group in the Global Datastore.</p>\"\
    },\
    \"GlobalReplicationGroupList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"GlobalReplicationGroup\",\
        \"locationName\":\"GlobalReplicationGroup\"\
      }\
    },\
    \"GlobalReplicationGroupMember\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The replication group id of the Global Datastore member.</p>\"\
        },\
        \"ReplicationGroupRegion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS region of the Global Datastore member.</p>\"\
        },\
        \"Role\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Indicates the role of the replication group, primary or secondary.</p>\"\
        },\
        \"AutomaticFailover\":{\
          \"shape\":\"AutomaticFailoverStatus\",\
          \"documentation\":\"<p>Indicates whether automatic failover is enabled for the replication group.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status of the membership of the replication group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A member of a Global Datastore. It contains the Replication Group Id, the AWS region and the role of the replication group. </p>\",\
      \"wrapper\":true\
    },\
    \"GlobalReplicationGroupMemberList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"GlobalReplicationGroupMember\",\
        \"locationName\":\"GlobalReplicationGroupMember\"\
      }\
    },\
    \"GlobalReplicationGroupNotFoundFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The Global Datastore does not exist</p>\",\
      \"error\":{\
        \"code\":\"GlobalReplicationGroupNotFoundFault\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"IncreaseNodeGroupsInGlobalReplicationGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GlobalReplicationGroupId\",\
        \"NodeGroupCount\",\
        \"ApplyImmediately\"\
      ],\
      \"members\":{\
        \"GlobalReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Global Datastore</p>\"\
        },\
        \"NodeGroupCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of node groups you wish to add</p>\"\
        },\
        \"RegionalConfigurations\":{\
          \"shape\":\"RegionalConfigurationList\",\
          \"documentation\":\"<p>Describes the replication group IDs, the AWS regions where they are stored and the shard configuration for each that comprise the Global Datastore</p>\"\
        },\
        \"ApplyImmediately\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates that the process begins immediately. At present, the only permitted value for this parameter is true.</p>\"\
        }\
      }\
    },\
    \"IncreaseNodeGroupsInGlobalReplicationGroupResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GlobalReplicationGroup\":{\"shape\":\"GlobalReplicationGroup\"}\
      }\
    },\
    \"IncreaseReplicaCountMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ReplicationGroupId\",\
        \"ApplyImmediately\"\
      ],\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The id of the replication group to which you want to add replica nodes.</p>\"\
        },\
        \"NewReplicaCount\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The number of read replica nodes you want at the completion of this operation. For Redis (cluster mode disabled) replication groups, this is the number of replica nodes in the replication group. For Redis (cluster mode enabled) replication groups, this is the number of replica nodes in each of the replication group's node groups.</p>\"\
        },\
        \"ReplicaConfiguration\":{\
          \"shape\":\"ReplicaConfigurationList\",\
          \"documentation\":\"<p>A list of <code>ConfigureShard</code> objects that can be used to configure each shard in a Redis (cluster mode enabled) replication group. The <code>ConfigureShard</code> has three members: <code>NewReplicaCount</code>, <code>NodeGroupId</code>, and <code>PreferredAvailabilityZones</code>.</p>\"\
        },\
        \"ApplyImmediately\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If <code>True</code>, the number of replica nodes is increased immediately. <code>ApplyImmediately=False</code> is not currently supported.</p>\"\
        }\
      }\
    },\
    \"IncreaseReplicaCountResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicationGroup\":{\"shape\":\"ReplicationGroup\"}\
      }\
    },\
    \"InsufficientCacheClusterCapacityFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested cache node type is not available in the specified Availability Zone. For more information, see <a href=\\\"http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ErrorMessages.html#ErrorMessages.INSUFFICIENT_CACHE_CLUSTER_CAPACITY\\\">InsufficientCacheClusterCapacity</a> in the ElastiCache User Guide.</p>\",\
      \"error\":{\
        \"code\":\"InsufficientCacheClusterCapacity\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Integer\":{\"type\":\"integer\"},\
    \"IntegerOptional\":{\"type\":\"integer\"},\
    \"InvalidARNFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested Amazon Resource Name (ARN) does not refer to an existing resource.</p>\",\
      \"error\":{\
        \"code\":\"InvalidARN\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidCacheClusterStateFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested cluster is not in the <code>available</code> state.</p>\",\
      \"error\":{\
        \"code\":\"InvalidCacheClusterState\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidCacheParameterGroupStateFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The current state of the cache parameter group does not allow the requested operation to occur.</p>\",\
      \"error\":{\
        \"code\":\"InvalidCacheParameterGroupState\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidCacheSecurityGroupStateFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The current state of the cache security group does not allow deletion.</p>\",\
      \"error\":{\
        \"code\":\"InvalidCacheSecurityGroupState\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidGlobalReplicationGroupStateFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The Global Datastore is not available or in primary-only state.</p>\",\
      \"error\":{\
        \"code\":\"InvalidGlobalReplicationGroupState\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidKMSKeyFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The KMS key supplied is not valid.</p>\",\
      \"error\":{\
        \"code\":\"InvalidKMSKeyFault\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidParameterCombinationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"AwsQueryErrorMessage\",\
          \"documentation\":\"<p>Two or more parameters that must not be used together were used together.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Two or more incompatible parameters were specified.</p>\",\
      \"error\":{\
        \"code\":\"InvalidParameterCombination\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true,\
      \"synthetic\":true\
    },\
    \"InvalidParameterValueException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"AwsQueryErrorMessage\",\
          \"documentation\":\"<p>A parameter value is invalid.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The value for a parameter is invalid.</p>\",\
      \"error\":{\
        \"code\":\"InvalidParameterValue\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true,\
      \"synthetic\":true\
    },\
    \"InvalidReplicationGroupStateFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested replication group is not in the <code>available</code> state.</p>\",\
      \"error\":{\
        \"code\":\"InvalidReplicationGroupState\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidSnapshotStateFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The current state of the snapshot does not allow the requested operation to occur.</p>\",\
      \"error\":{\
        \"code\":\"InvalidSnapshotState\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidSubnet\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An invalid subnet identifier was specified.</p>\",\
      \"error\":{\
        \"code\":\"InvalidSubnet\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidVPCNetworkStateFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The VPC network is in an invalid state.</p>\",\
      \"error\":{\
        \"code\":\"InvalidVPCNetworkStateFault\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"KeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"ListAllowedNodeTypeModificationsMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cluster you want to scale up to a larger node instanced type. ElastiCache uses the cluster id to identify the current node type of this cluster and from that to create a list of node types you can scale up to.</p> <important> <p>You must provide a value for either the <code>CacheClusterId</code> or the <code>ReplicationGroupId</code>.</p> </important>\"\
        },\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the replication group want to scale up to a larger node type. ElastiCache uses the replication group id to identify the current node type being used by this replication group, and from that to create a list of node types you can scale up to.</p> <important> <p>You must provide a value for either the <code>CacheClusterId</code> or the <code>ReplicationGroupId</code>.</p> </important>\"\
        }\
      },\
      \"documentation\":\"<p>The input parameters for the <code>ListAllowedNodeTypeModifications</code> operation.</p>\"\
    },\
    \"ListTagsForResourceMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceName\"],\
      \"members\":{\
        \"ResourceName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource for which you want the list of tags, for example <code>arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster</code> or <code>arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot</code>.</p> <p>For more information about ARNs, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and AWS Service Namespaces</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input parameters for the <code>ListTagsForResource</code> operation.</p>\"\
    },\
    \"ModifyCacheClusterMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"CacheClusterId\"],\
      \"members\":{\
        \"CacheClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cluster identifier. This value is stored as a lowercase string.</p>\"\
        },\
        \"NumCacheNodes\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The number of cache nodes that the cluster should have. If the value for <code>NumCacheNodes</code> is greater than the sum of the number of current cache nodes and the number of cache nodes pending creation (which may be zero), more nodes are added. If the value is less than the number of existing cache nodes, nodes are removed. If the value is equal to the number of current cache nodes, any pending add or remove requests are canceled.</p> <p>If you are removing cache nodes, you must use the <code>CacheNodeIdsToRemove</code> parameter to provide the IDs of the specific cache nodes to remove.</p> <p>For clusters running Redis, this value must be 1. For clusters running Memcached, this value must be between 1 and 20.</p> <note> <p>Adding or removing Memcached cache nodes can be applied immediately or as a pending operation (see <code>ApplyImmediately</code>).</p> <p>A pending operation to modify the number of cache nodes in a cluster during its maintenance window, whether by adding or removing nodes in accordance with the scale out architecture, is not queued. The customer's latest request to add or remove nodes to the cluster overrides any previous pending operations to modify the number of cache nodes in the cluster. For example, a request to remove 2 nodes would override a previous pending operation to remove 3 nodes. Similarly, a request to add 2 nodes would override a previous pending operation to remove 3 nodes and vice versa. As Memcached cache nodes may now be provisioned in different Availability Zones with flexible cache node placement, a request to add nodes does not automatically override a previous pending operation to add nodes. The customer can modify the previous pending operation to add more nodes or explicitly cancel the pending request and retry the new request. To cancel pending operations to modify the number of cache nodes in a cluster, use the <code>ModifyCacheCluster</code> request and set <code>NumCacheNodes</code> equal to the number of cache nodes currently in the cluster.</p> </note>\"\
        },\
        \"CacheNodeIdsToRemove\":{\
          \"shape\":\"CacheNodeIdsList\",\
          \"documentation\":\"<p>A list of cache node IDs to be removed. A node ID is a numeric identifier (0001, 0002, etc.). This parameter is only valid when <code>NumCacheNodes</code> is less than the existing number of cache nodes. The number of cache node IDs supplied in this parameter must match the difference between the existing number of cache nodes in the cluster or pending cache nodes, whichever is greater, and the value of <code>NumCacheNodes</code> in the request.</p> <p>For example: If you have 3 active cache nodes, 7 pending cache nodes, and the number of cache nodes in this <code>ModifyCacheCluster</code> call is 5, you must list 2 (7 - 5) cache node IDs to remove.</p>\"\
        },\
        \"AZMode\":{\
          \"shape\":\"AZMode\",\
          \"documentation\":\"<p>Specifies whether the new nodes in this Memcached cluster are all created in a single Availability Zone or created across multiple Availability Zones.</p> <p>Valid values: <code>single-az</code> | <code>cross-az</code>.</p> <p>This option is only supported for Memcached clusters.</p> <note> <p>You cannot specify <code>single-az</code> if the Memcached cluster already has cache nodes in different Availability Zones. If <code>cross-az</code> is specified, existing Memcached nodes remain in their current Availability Zone.</p> <p>Only newly created nodes are located in different Availability Zones. </p> </note>\"\
        },\
        \"NewAvailabilityZones\":{\
          \"shape\":\"PreferredAvailabilityZoneList\",\
          \"documentation\":\"<p>The list of Availability Zones where the new Memcached cache nodes are created.</p> <p>This parameter is only valid when <code>NumCacheNodes</code> in the request is greater than the sum of the number of active cache nodes and the number of cache nodes pending creation (which may be zero). The number of Availability Zones supplied in this list must match the cache nodes being added in this request.</p> <p>This option is only supported on Memcached clusters.</p> <p>Scenarios:</p> <ul> <li> <p> <b>Scenario 1:</b> You have 3 active nodes and wish to add 2 nodes. Specify <code>NumCacheNodes=5</code> (3 + 2) and optionally specify two Availability Zones for the two new nodes.</p> </li> <li> <p> <b>Scenario 2:</b> You have 3 active nodes and 2 nodes pending creation (from the scenario 1 call) and want to add 1 more node. Specify <code>NumCacheNodes=6</code> ((3 + 2) + 1) and optionally specify an Availability Zone for the new node.</p> </li> <li> <p> <b>Scenario 3:</b> You want to cancel all pending operations. Specify <code>NumCacheNodes=3</code> to cancel all pending operations.</p> </li> </ul> <p>The Availability Zone placement of nodes pending creation cannot be modified. If you wish to cancel any nodes pending creation, add 0 nodes by setting <code>NumCacheNodes</code> to the number of current nodes.</p> <p>If <code>cross-az</code> is specified, existing Memcached nodes remain in their current Availability Zone. Only newly created nodes can be located in different Availability Zones. For guidance on how to move existing Memcached nodes to different Availability Zones, see the <b>Availability Zone Considerations</b> section of <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/CacheNodes.SupportedTypes.html\\\">Cache Node Considerations for Memcached</a>.</p> <p> <b>Impact of new add/remove requests upon pending requests</b> </p> <ul> <li> <p>Scenario-1</p> <ul> <li> <p>Pending Action: Delete</p> </li> <li> <p>New Request: Delete</p> </li> <li> <p>Result: The new delete, pending or immediate, replaces the pending delete.</p> </li> </ul> </li> <li> <p>Scenario-2</p> <ul> <li> <p>Pending Action: Delete</p> </li> <li> <p>New Request: Create</p> </li> <li> <p>Result: The new create, pending or immediate, replaces the pending delete.</p> </li> </ul> </li> <li> <p>Scenario-3</p> <ul> <li> <p>Pending Action: Create</p> </li> <li> <p>New Request: Delete</p> </li> <li> <p>Result: The new delete, pending or immediate, replaces the pending create.</p> </li> </ul> </li> <li> <p>Scenario-4</p> <ul> <li> <p>Pending Action: Create</p> </li> <li> <p>New Request: Create</p> </li> <li> <p>Result: The new create is added to the pending create.</p> <important> <p> <b>Important:</b> If the new create request is <b>Apply Immediately - Yes</b>, all creates are performed immediately. If the new create request is <b>Apply Immediately - No</b>, all creates are pending.</p> </important> </li> </ul> </li> </ul>\"\
        },\
        \"CacheSecurityGroupNames\":{\
          \"shape\":\"CacheSecurityGroupNameList\",\
          \"documentation\":\"<p>A list of cache security group names to authorize on this cluster. This change is asynchronously applied as soon as possible.</p> <p>You can use this parameter only with clusters that are created outside of an Amazon Virtual Private Cloud (Amazon VPC).</p> <p>Constraints: Must contain no more than 255 alphanumeric characters. Must not be \\\"Default\\\".</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIdsList\",\
          \"documentation\":\"<p>Specifies the VPC Security Groups associated with the cluster.</p> <p>This parameter can be used only with clusters that are created in an Amazon Virtual Private Cloud (Amazon VPC).</p>\"\
        },\
        \"PreferredMaintenanceWindow\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period.</p> <p>Valid values for <code>ddd</code> are:</p> <ul> <li> <p> <code>sun</code> </p> </li> <li> <p> <code>mon</code> </p> </li> <li> <p> <code>tue</code> </p> </li> <li> <p> <code>wed</code> </p> </li> <li> <p> <code>thu</code> </p> </li> <li> <p> <code>fri</code> </p> </li> <li> <p> <code>sat</code> </p> </li> </ul> <p>Example: <code>sun:23:00-mon:01:30</code> </p>\"\
        },\
        \"NotificationTopicArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic to which notifications are sent.</p> <note> <p>The Amazon SNS topic owner must be same as the cluster owner.</p> </note>\"\
        },\
        \"CacheParameterGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache parameter group to apply to this cluster. This change is asynchronously applied as soon as possible for parameters when the <code>ApplyImmediately</code> parameter is specified as <code>true</code> for this request.</p>\"\
        },\
        \"NotificationTopicStatus\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status of the Amazon SNS notification topic. Notifications are sent only if the status is <code>active</code>.</p> <p>Valid values: <code>active</code> | <code>inactive</code> </p>\"\
        },\
        \"ApplyImmediately\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If <code>true</code>, this parameter causes the modifications in this request and any pending modifications to be applied, asynchronously and as soon as possible, regardless of the <code>PreferredMaintenanceWindow</code> setting for the cluster.</p> <p>If <code>false</code>, changes to the cluster are applied on the next maintenance reboot, or the next failure reboot, whichever occurs first.</p> <important> <p>If you perform a <code>ModifyCacheCluster</code> before a pending modification is applied, the pending modification is replaced by the newer modification.</p> </important> <p>Valid values: <code>true</code> | <code>false</code> </p> <p>Default: <code>false</code> </p>\"\
        },\
        \"EngineVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The upgraded version of the cache engine to be run on the cache nodes.</p> <p> <b>Important:</b> You can upgrade to a newer engine version (see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SelectEngine.html#VersionManagement\\\">Selecting a Cache Engine and Version</a>), but you cannot downgrade to an earlier engine version. If you want to use an earlier engine version, you must delete the existing cluster and create it anew with the earlier engine version. </p>\"\
        },\
        \"AutoMinorVersionUpgrade\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>This parameter is currently disabled.</p>\"\
        },\
        \"SnapshotRetentionLimit\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The number of days for which ElastiCache retains automatic cluster snapshots before deleting them. For example, if you set <code>SnapshotRetentionLimit</code> to 5, a snapshot that was taken today is retained for 5 days before being deleted.</p> <note> <p>If the value of <code>SnapshotRetentionLimit</code> is set to zero (0), backups are turned off.</p> </note>\"\
        },\
        \"SnapshotWindow\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your cluster. </p>\"\
        },\
        \"CacheNodeType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A valid cache node type that you want to scale this cluster up to.</p>\"\
        },\
        \"AuthToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Reserved parameter. The password used to access a password protected server. This parameter must be specified with the <code>auth-token-update</code> parameter. Password constraints:</p> <ul> <li> <p>Must be only printable ASCII characters</p> </li> <li> <p>Must be at least 16 characters and no more than 128 characters in length</p> </li> <li> <p>Cannot contain any of the following characters: '/', '\\\"', or '@', '%'</p> </li> </ul> <p> For more information, see AUTH password at <a href=\\\"http://redis.io/commands/AUTH\\\">AUTH</a>.</p>\"\
        },\
        \"AuthTokenUpdateStrategy\":{\
          \"shape\":\"AuthTokenUpdateStrategyType\",\
          \"documentation\":\"<p>Specifies the strategy to use to update the AUTH token. This parameter must be specified with the <code>auth-token</code> parameter. Possible values:</p> <ul> <li> <p>Rotate</p> </li> <li> <p>Set</p> </li> </ul> <p> For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/auth.html\\\">Authenticating Users with Redis AUTH</a> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>ModifyCacheCluster</code> operation.</p>\"\
    },\
    \"ModifyCacheClusterResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheCluster\":{\"shape\":\"CacheCluster\"}\
      }\
    },\
    \"ModifyCacheParameterGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CacheParameterGroupName\",\
        \"ParameterNameValues\"\
      ],\
      \"members\":{\
        \"CacheParameterGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache parameter group to modify.</p>\"\
        },\
        \"ParameterNameValues\":{\
          \"shape\":\"ParameterNameValueList\",\
          \"documentation\":\"<p>An array of parameter names and values for the parameter update. You must supply at least one parameter name and value; subsequent arguments are optional. A maximum of 20 parameters may be modified per request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>ModifyCacheParameterGroup</code> operation.</p>\"\
    },\
    \"ModifyCacheSubnetGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"CacheSubnetGroupName\"],\
      \"members\":{\
        \"CacheSubnetGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name for the cache subnet group. This value is stored as a lowercase string.</p> <p>Constraints: Must contain no more than 255 alphanumeric characters or hyphens.</p> <p>Example: <code>mysubnetgroup</code> </p>\"\
        },\
        \"CacheSubnetGroupDescription\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the cache subnet group.</p>\"\
        },\
        \"SubnetIds\":{\
          \"shape\":\"SubnetIdentifierList\",\
          \"documentation\":\"<p>The EC2 subnet IDs for the cache subnet group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>ModifyCacheSubnetGroup</code> operation.</p>\"\
    },\
    \"ModifyCacheSubnetGroupResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheSubnetGroup\":{\"shape\":\"CacheSubnetGroup\"}\
      }\
    },\
    \"ModifyGlobalReplicationGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GlobalReplicationGroupId\",\
        \"ApplyImmediately\"\
      ],\
      \"members\":{\
        \"GlobalReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Global Datastore</p>\"\
        },\
        \"ApplyImmediately\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>This parameter causes the modifications in this request and any pending modifications to be applied, asynchronously and as soon as possible. Modifications to Global Replication Groups cannot be requested to be applied in PreferredMaintenceWindow. </p>\"\
        },\
        \"CacheNodeType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A valid cache node type that you want to scale this Global Datastore to.</p>\"\
        },\
        \"EngineVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The upgraded version of the cache engine to be run on the clusters in the Global Datastore. </p>\"\
        },\
        \"GlobalReplicationGroupDescription\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the Global Datastore</p>\"\
        },\
        \"AutomaticFailoverEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>Determines whether a read replica is automatically promoted to read/write primary if the existing primary encounters a failure. </p>\"\
        }\
      }\
    },\
    \"ModifyGlobalReplicationGroupResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GlobalReplicationGroup\":{\"shape\":\"GlobalReplicationGroup\"}\
      }\
    },\
    \"ModifyReplicationGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"ReplicationGroupId\"],\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier of the replication group to modify.</p>\"\
        },\
        \"ReplicationGroupDescription\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description for the replication group. Maximum length is 255 characters.</p>\"\
        },\
        \"PrimaryClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>For replication groups with a single primary, if this parameter is specified, ElastiCache promotes the specified cluster in the specified replication group to the primary role. The nodes of all other clusters in the replication group are read replicas.</p>\"\
        },\
        \"SnapshottingClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cluster ID that is used as the daily snapshot source for the replication group. This parameter cannot be set for Redis (cluster mode enabled) replication groups.</p>\"\
        },\
        \"AutomaticFailoverEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>Determines whether a read replica is automatically promoted to read/write primary if the existing primary encounters a failure.</p> <p>Valid values: <code>true</code> | <code>false</code> </p> <p>Amazon ElastiCache for Redis does not support Multi-AZ with automatic failover on:</p> <ul> <li> <p>Redis versions earlier than 2.8.6.</p> </li> <li> <p>Redis (cluster mode disabled): T1 node types.</p> </li> <li> <p>Redis (cluster mode enabled): T1 node types.</p> </li> </ul>\"\
        },\
        \"MultiAZEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>A flag indicating if you have Multi-AZ enabled to enhance fault tolerance. For more information, see <a href=\\\"http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/AutoFailover.html\\\">Minimizing Downtime: Multi-AZ</a>.</p>\"\
        },\
        \"NodeGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Deprecated. This parameter is not used.</p>\",\
          \"deprecated\":true\
        },\
        \"CacheSecurityGroupNames\":{\
          \"shape\":\"CacheSecurityGroupNameList\",\
          \"documentation\":\"<p>A list of cache security group names to authorize for the clusters in this replication group. This change is asynchronously applied as soon as possible.</p> <p>This parameter can be used only with replication group containing clusters running outside of an Amazon Virtual Private Cloud (Amazon VPC).</p> <p>Constraints: Must contain no more than 255 alphanumeric characters. Must not be <code>Default</code>.</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIdsList\",\
          \"documentation\":\"<p>Specifies the VPC Security Groups associated with the clusters in the replication group.</p> <p>This parameter can be used only with replication group containing clusters running in an Amazon Virtual Private Cloud (Amazon VPC).</p>\"\
        },\
        \"PreferredMaintenanceWindow\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period.</p> <p>Valid values for <code>ddd</code> are:</p> <ul> <li> <p> <code>sun</code> </p> </li> <li> <p> <code>mon</code> </p> </li> <li> <p> <code>tue</code> </p> </li> <li> <p> <code>wed</code> </p> </li> <li> <p> <code>thu</code> </p> </li> <li> <p> <code>fri</code> </p> </li> <li> <p> <code>sat</code> </p> </li> </ul> <p>Example: <code>sun:23:00-mon:01:30</code> </p>\"\
        },\
        \"NotificationTopicArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic to which notifications are sent.</p> <note> <p>The Amazon SNS topic owner must be same as the replication group owner. </p> </note>\"\
        },\
        \"CacheParameterGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache parameter group to apply to all of the clusters in this replication group. This change is asynchronously applied as soon as possible for parameters when the <code>ApplyImmediately</code> parameter is specified as <code>true</code> for this request.</p>\"\
        },\
        \"NotificationTopicStatus\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status of the Amazon SNS notification topic for the replication group. Notifications are sent only if the status is <code>active</code>.</p> <p>Valid values: <code>active</code> | <code>inactive</code> </p>\"\
        },\
        \"ApplyImmediately\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If <code>true</code>, this parameter causes the modifications in this request and any pending modifications to be applied, asynchronously and as soon as possible, regardless of the <code>PreferredMaintenanceWindow</code> setting for the replication group.</p> <p>If <code>false</code>, changes to the nodes in the replication group are applied on the next maintenance reboot, or the next failure reboot, whichever occurs first.</p> <p>Valid values: <code>true</code> | <code>false</code> </p> <p>Default: <code>false</code> </p>\"\
        },\
        \"EngineVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The upgraded version of the cache engine to be run on the clusters in the replication group.</p> <p> <b>Important:</b> You can upgrade to a newer engine version (see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SelectEngine.html#VersionManagement\\\">Selecting a Cache Engine and Version</a>), but you cannot downgrade to an earlier engine version. If you want to use an earlier engine version, you must delete the existing replication group and create it anew with the earlier engine version. </p>\"\
        },\
        \"AutoMinorVersionUpgrade\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>This parameter is currently disabled.</p>\"\
        },\
        \"SnapshotRetentionLimit\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The number of days for which ElastiCache retains automatic node group (shard) snapshots before deleting them. For example, if you set <code>SnapshotRetentionLimit</code> to 5, a snapshot that was taken today is retained for 5 days before being deleted.</p> <p> <b>Important</b> If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off.</p>\"\
        },\
        \"SnapshotWindow\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of the node group (shard) specified by <code>SnapshottingClusterId</code>.</p> <p>Example: <code>05:00-09:00</code> </p> <p>If you do not specify this parameter, ElastiCache automatically chooses an appropriate time range.</p>\"\
        },\
        \"CacheNodeType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A valid cache node type that you want to scale this replication group to.</p>\"\
        },\
        \"AuthToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Reserved parameter. The password used to access a password protected server. This parameter must be specified with the <code>auth-token-update-strategy </code> parameter. Password constraints:</p> <ul> <li> <p>Must be only printable ASCII characters</p> </li> <li> <p>Must be at least 16 characters and no more than 128 characters in length</p> </li> <li> <p>Cannot contain any of the following characters: '/', '\\\"', or '@', '%'</p> </li> </ul> <p> For more information, see AUTH password at <a href=\\\"http://redis.io/commands/AUTH\\\">AUTH</a>.</p>\"\
        },\
        \"AuthTokenUpdateStrategy\":{\
          \"shape\":\"AuthTokenUpdateStrategyType\",\
          \"documentation\":\"<p>Specifies the strategy to use to update the AUTH token. This parameter must be specified with the <code>auth-token</code> parameter. Possible values:</p> <ul> <li> <p>Rotate</p> </li> <li> <p>Set</p> </li> </ul> <p> For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/auth.html\\\">Authenticating Users with Redis AUTH</a> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>ModifyReplicationGroups</code> operation.</p>\"\
    },\
    \"ModifyReplicationGroupResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicationGroup\":{\"shape\":\"ReplicationGroup\"}\
      }\
    },\
    \"ModifyReplicationGroupShardConfigurationMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ReplicationGroupId\",\
        \"NodeGroupCount\",\
        \"ApplyImmediately\"\
      ],\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Redis (cluster mode enabled) cluster (replication group) on which the shards are to be configured.</p>\"\
        },\
        \"NodeGroupCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of node groups (shards) that results from the modification of the shard configuration.</p>\"\
        },\
        \"ApplyImmediately\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates that the shard reconfiguration process begins immediately. At present, the only permitted value for this parameter is <code>true</code>.</p> <p>Value: true</p>\"\
        },\
        \"ReshardingConfiguration\":{\
          \"shape\":\"ReshardingConfigurationList\",\
          \"documentation\":\"<p>Specifies the preferred availability zones for each node group in the cluster. If the value of <code>NodeGroupCount</code> is greater than the current number of node groups (shards), you can use this parameter to specify the preferred availability zones of the cluster's shards. If you omit this parameter ElastiCache selects availability zones for you.</p> <p>You can specify this parameter only if the value of <code>NodeGroupCount</code> is greater than the current number of node groups (shards).</p>\"\
        },\
        \"NodeGroupsToRemove\":{\
          \"shape\":\"NodeGroupsToRemoveList\",\
          \"documentation\":\"<p>If the value of <code>NodeGroupCount</code> is less than the current number of node groups (shards), then either <code>NodeGroupsToRemove</code> or <code>NodeGroupsToRetain</code> is required. <code>NodeGroupsToRemove</code> is a list of <code>NodeGroupId</code>s to remove from the cluster.</p> <p>ElastiCache for Redis will attempt to remove all node groups listed by <code>NodeGroupsToRemove</code> from the cluster.</p>\"\
        },\
        \"NodeGroupsToRetain\":{\
          \"shape\":\"NodeGroupsToRetainList\",\
          \"documentation\":\"<p>If the value of <code>NodeGroupCount</code> is less than the current number of node groups (shards), then either <code>NodeGroupsToRemove</code> or <code>NodeGroupsToRetain</code> is required. <code>NodeGroupsToRetain</code> is a list of <code>NodeGroupId</code>s to retain in the cluster.</p> <p>ElastiCache for Redis will attempt to remove all node groups except those listed by <code>NodeGroupsToRetain</code> from the cluster.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input for a <code>ModifyReplicationGroupShardConfiguration</code> operation.</p>\"\
    },\
    \"ModifyReplicationGroupShardConfigurationResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicationGroup\":{\"shape\":\"ReplicationGroup\"}\
      }\
    },\
    \"MultiAZStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"enabled\",\
        \"disabled\"\
      ]\
    },\
    \"NoOperationFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The operation was not performed because no changes were required.</p>\",\
      \"error\":{\
        \"code\":\"NoOperationFault\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"NodeGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NodeGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier for the node group (shard). A Redis (cluster mode disabled) replication group contains only 1 node group; therefore, the node group ID is 0001. A Redis (cluster mode enabled) replication group contains 1 to 90 node groups numbered 0001 to 0090. Optionally, the user can provide the id for a node group. </p>\"\
        },\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The current state of this replication group - <code>creating</code>, <code>available</code>, <code>modifying</code>, <code>deleting</code>.</p>\"\
        },\
        \"PrimaryEndpoint\":{\
          \"shape\":\"Endpoint\",\
          \"documentation\":\"<p>The endpoint of the primary node in this node group (shard).</p>\"\
        },\
        \"ReaderEndpoint\":{\
          \"shape\":\"Endpoint\",\
          \"documentation\":\"<p>The endpoint of the replica nodes in this node group (shard).</p>\"\
        },\
        \"Slots\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The keyspace for this node group (shard).</p>\"\
        },\
        \"NodeGroupMembers\":{\
          \"shape\":\"NodeGroupMemberList\",\
          \"documentation\":\"<p>A list containing information about individual nodes within the node group (shard).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a collection of cache nodes in a replication group. One node in the node group is the read/write primary node. All the other nodes are read-only Replica nodes.</p>\"\
    },\
    \"NodeGroupConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NodeGroupId\":{\
          \"shape\":\"AllowedNodeGroupId\",\
          \"documentation\":\"<p>Either the ElastiCache for Redis supplied 4-digit id or a user supplied id for the node group these configuration values apply to.</p>\"\
        },\
        \"Slots\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A string that specifies the keyspace for a particular node group. Keyspaces range from 0 to 16,383. The string is in the format <code>startkey-endkey</code>.</p> <p>Example: <code>\\\"0-3999\\\"</code> </p>\"\
        },\
        \"ReplicaCount\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The number of read replica nodes in this node group (shard).</p>\"\
        },\
        \"PrimaryAvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone where the primary node of this node group (shard) is launched.</p>\"\
        },\
        \"ReplicaAvailabilityZones\":{\
          \"shape\":\"AvailabilityZonesList\",\
          \"documentation\":\"<p>A list of Availability Zones to be used for the read replicas. The number of Availability Zones in this list must match the value of <code>ReplicaCount</code> or <code>ReplicasPerNodeGroup</code> if not specified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Node group (shard) configuration options. Each node group (shard) configuration has the following: <code>Slots</code>, <code>PrimaryAvailabilityZone</code>, <code>ReplicaAvailabilityZones</code>, <code>ReplicaCount</code>.</p>\"\
    },\
    \"NodeGroupConfigurationList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"NodeGroupConfiguration\",\
        \"locationName\":\"NodeGroupConfiguration\"\
      }\
    },\
    \"NodeGroupList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"NodeGroup\",\
        \"locationName\":\"NodeGroup\"\
      }\
    },\
    \"NodeGroupMember\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the cluster to which the node belongs.</p>\"\
        },\
        \"CacheNodeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the node within its cluster. A node ID is a numeric identifier (0001, 0002, etc.).</p>\"\
        },\
        \"ReadEndpoint\":{\
          \"shape\":\"Endpoint\",\
          \"documentation\":\"<p>The information required for client programs to connect to a node for read operations. The read endpoint is only applicable on Redis (cluster mode disabled) clusters.</p>\"\
        },\
        \"PreferredAvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Availability Zone in which the node is located.</p>\"\
        },\
        \"CurrentRole\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The role that is currently assigned to the node - <code>primary</code> or <code>replica</code>. This member is only applicable for Redis (cluster mode disabled) replication groups.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a single node within a node group (shard).</p>\"\
    },\
    \"NodeGroupMemberList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"NodeGroupMember\",\
        \"locationName\":\"NodeGroupMember\"\
      }\
    },\
    \"NodeGroupMemberUpdateStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cache cluster ID</p>\"\
        },\
        \"CacheNodeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The node ID of the cache cluster</p>\"\
        },\
        \"NodeUpdateStatus\":{\
          \"shape\":\"NodeUpdateStatus\",\
          \"documentation\":\"<p>The update status of the node</p>\"\
        },\
        \"NodeDeletionDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The deletion date of the node</p>\"\
        },\
        \"NodeUpdateStartDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The start date of the update for a node</p>\"\
        },\
        \"NodeUpdateEndDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The end date of the update for a node</p>\"\
        },\
        \"NodeUpdateInitiatedBy\":{\
          \"shape\":\"NodeUpdateInitiatedBy\",\
          \"documentation\":\"<p>Reflects whether the update was initiated by the customer or automatically applied</p>\"\
        },\
        \"NodeUpdateInitiatedDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The date when the update is triggered</p>\"\
        },\
        \"NodeUpdateStatusModifiedDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The date when the NodeUpdateStatus was last modified</p>\"\
        }\
      },\
      \"documentation\":\"<p>The status of the service update on the node group member </p>\"\
    },\
    \"NodeGroupMemberUpdateStatusList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"NodeGroupMemberUpdateStatus\",\
        \"locationName\":\"NodeGroupMemberUpdateStatus\"\
      }\
    },\
    \"NodeGroupNotFoundFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The node group specified by the <code>NodeGroupId</code> parameter could not be found. Please verify that the node group exists and that you spelled the <code>NodeGroupId</code> value correctly.</p>\",\
      \"error\":{\
        \"code\":\"NodeGroupNotFoundFault\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"NodeGroupUpdateStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NodeGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the node group</p>\"\
        },\
        \"NodeGroupMemberUpdateStatus\":{\
          \"shape\":\"NodeGroupMemberUpdateStatusList\",\
          \"documentation\":\"<p>The status of the service update on the node group member</p>\"\
        }\
      },\
      \"documentation\":\"<p>The status of the service update on the node group </p>\"\
    },\
    \"NodeGroupUpdateStatusList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"NodeGroupUpdateStatus\",\
        \"locationName\":\"NodeGroupUpdateStatus\"\
      }\
    },\
    \"NodeGroupsPerReplicationGroupQuotaExceededFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The request cannot be processed because it would exceed the maximum allowed number of node groups (shards) in a single replication group. The default maximum is 90</p>\",\
      \"error\":{\
        \"code\":\"NodeGroupsPerReplicationGroupQuotaExceeded\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"NodeGroupsToRemoveList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"AllowedNodeGroupId\",\
        \"locationName\":\"NodeGroupToRemove\"\
      }\
    },\
    \"NodeGroupsToRetainList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"AllowedNodeGroupId\",\
        \"locationName\":\"NodeGroupToRetain\"\
      }\
    },\
    \"NodeQuotaForClusterExceededFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The request cannot be processed because it would exceed the allowed number of cache nodes in a single cluster.</p>\",\
      \"error\":{\
        \"code\":\"NodeQuotaForClusterExceeded\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"NodeQuotaForCustomerExceededFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The request cannot be processed because it would exceed the allowed number of cache nodes per customer.</p>\",\
      \"error\":{\
        \"code\":\"NodeQuotaForCustomerExceeded\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"NodeSnapshot\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique identifier for the source cluster.</p>\"\
        },\
        \"NodeGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique identifier for the source node group (shard).</p>\"\
        },\
        \"CacheNodeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cache node identifier for the node in the source cluster.</p>\"\
        },\
        \"NodeGroupConfiguration\":{\
          \"shape\":\"NodeGroupConfiguration\",\
          \"documentation\":\"<p>The configuration for the source node group (shard).</p>\"\
        },\
        \"CacheSize\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The size of the cache on the source cache node.</p>\"\
        },\
        \"CacheNodeCreateTime\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The date and time when the cache node was created in the source cluster.</p>\"\
        },\
        \"SnapshotCreateTime\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The date and time when the source node's metadata and cache data set was obtained for the snapshot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents an individual cache node in a snapshot of a cluster.</p>\",\
      \"wrapper\":true\
    },\
    \"NodeSnapshotList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"NodeSnapshot\",\
        \"locationName\":\"NodeSnapshot\"\
      }\
    },\
    \"NodeTypeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"NodeUpdateInitiatedBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"system\",\
        \"customer\"\
      ]\
    },\
    \"NodeUpdateStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"not-applied\",\
        \"waiting-to-start\",\
        \"in-progress\",\
        \"stopping\",\
        \"stopped\",\
        \"complete\"\
      ]\
    },\
    \"NotificationConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the topic.</p>\"\
        },\
        \"TopicStatus\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The current state of the topic.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a notification topic and its status. Notification topics are used for publishing ElastiCache events to subscribers using Amazon Simple Notification Service (SNS).</p>\"\
    },\
    \"Parameter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ParameterName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the parameter.</p>\"\
        },\
        \"ParameterValue\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The value of the parameter.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the parameter.</p>\"\
        },\
        \"Source\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The source of the parameter.</p>\"\
        },\
        \"DataType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The valid data type for the parameter.</p>\"\
        },\
        \"AllowedValues\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The valid range of values for the parameter.</p>\"\
        },\
        \"IsModifiable\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether (<code>true</code>) or not (<code>false</code>) the parameter can be modified. Some parameters have security or operational implications that prevent them from being changed.</p>\"\
        },\
        \"MinimumEngineVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The earliest cache engine version to which the parameter can apply.</p>\"\
        },\
        \"ChangeType\":{\
          \"shape\":\"ChangeType\",\
          \"documentation\":\"<p>Indicates whether a change to the parameter is applied immediately or requires a reboot for the change to be applied. You can force a reboot or wait until the next maintenance window's reboot. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html\\\">Rebooting a Cluster</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an individual setting that controls some aspect of ElastiCache behavior.</p>\"\
    },\
    \"ParameterNameValue\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ParameterName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the parameter.</p>\"\
        },\
        \"ParameterValue\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The value of the parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a name-value pair that is used to update the value of a parameter.</p>\"\
    },\
    \"ParameterNameValueList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ParameterNameValue\",\
        \"locationName\":\"ParameterNameValue\"\
      }\
    },\
    \"ParametersList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Parameter\",\
        \"locationName\":\"Parameter\"\
      }\
    },\
    \"PendingAutomaticFailoverStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"enabled\",\
        \"disabled\"\
      ]\
    },\
    \"PendingModifiedValues\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NumCacheNodes\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The new number of cache nodes for the cluster.</p> <p>For clusters running Redis, this value must be 1. For clusters running Memcached, this value must be between 1 and 20.</p>\"\
        },\
        \"CacheNodeIdsToRemove\":{\
          \"shape\":\"CacheNodeIdsList\",\
          \"documentation\":\"<p>A list of cache node IDs that are being removed (or will be removed) from the cluster. A node ID is a 4-digit numeric identifier (0001, 0002, etc.).</p>\"\
        },\
        \"EngineVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The new cache engine version that the cluster runs.</p>\"\
        },\
        \"CacheNodeType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cache node type that this cluster or replication group is scaled to.</p>\"\
        },\
        \"AuthTokenStatus\":{\
          \"shape\":\"AuthTokenUpdateStatus\",\
          \"documentation\":\"<p>The auth token status</p>\"\
        }\
      },\
      \"documentation\":\"<p>A group of settings that are applied to the cluster in the future, or that are currently being applied.</p>\"\
    },\
    \"PreferredAvailabilityZoneList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"PreferredAvailabilityZone\"\
      }\
    },\
    \"ProcessedUpdateAction\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the replication group</p>\"\
        },\
        \"CacheClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the cache cluster</p>\"\
        },\
        \"ServiceUpdateName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The unique ID of the service update</p>\"\
        },\
        \"UpdateActionStatus\":{\
          \"shape\":\"UpdateActionStatus\",\
          \"documentation\":\"<p>The status of the update action on the Redis cluster</p>\"\
        }\
      },\
      \"documentation\":\"<p>Update action that has been processed for the corresponding apply/stop request</p>\"\
    },\
    \"ProcessedUpdateActionList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ProcessedUpdateAction\",\
        \"locationName\":\"ProcessedUpdateAction\"\
      }\
    },\
    \"PurchaseReservedCacheNodesOfferingMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"ReservedCacheNodesOfferingId\"],\
      \"members\":{\
        \"ReservedCacheNodesOfferingId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the reserved cache node offering to purchase.</p> <p>Example: <code>438012d3-4052-4cc7-b2e3-8d3372e0e706</code> </p>\"\
        },\
        \"ReservedCacheNodeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A customer-specified identifier to track this reservation.</p> <note> <p>The Reserved Cache Node ID is an unique customer-specified identifier to track this reservation. If this parameter is not specified, ElastiCache automatically generates an identifier for the reservation.</p> </note> <p>Example: myreservationID</p>\"\
        },\
        \"CacheNodeCount\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The number of cache node instances to reserve.</p> <p>Default: <code>1</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>PurchaseReservedCacheNodesOffering</code> operation.</p>\"\
    },\
    \"PurchaseReservedCacheNodesOfferingResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedCacheNode\":{\"shape\":\"ReservedCacheNode\"}\
      }\
    },\
    \"RebalanceSlotsInGlobalReplicationGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GlobalReplicationGroupId\",\
        \"ApplyImmediately\"\
      ],\
      \"members\":{\
        \"GlobalReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Global Datastore</p>\"\
        },\
        \"ApplyImmediately\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If <code>True</code>, redistribution is applied immediately.</p>\"\
        }\
      }\
    },\
    \"RebalanceSlotsInGlobalReplicationGroupResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GlobalReplicationGroup\":{\"shape\":\"GlobalReplicationGroup\"}\
      }\
    },\
    \"RebootCacheClusterMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CacheClusterId\",\
        \"CacheNodeIdsToReboot\"\
      ],\
      \"members\":{\
        \"CacheClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cluster identifier. This parameter is stored as a lowercase string.</p>\"\
        },\
        \"CacheNodeIdsToReboot\":{\
          \"shape\":\"CacheNodeIdsList\",\
          \"documentation\":\"<p>A list of cache node IDs to reboot. A node ID is a numeric identifier (0001, 0002, etc.). To reboot an entire cluster, specify all of the cache node IDs.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>RebootCacheCluster</code> operation.</p>\"\
    },\
    \"RebootCacheClusterResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheCluster\":{\"shape\":\"CacheCluster\"}\
      }\
    },\
    \"RecurringCharge\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RecurringChargeAmount\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The monetary amount of the recurring charge.</p>\"\
        },\
        \"RecurringChargeFrequency\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The frequency of the recurring charge.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the specific price and frequency of a recurring charges for a reserved cache node, or for a reserved cache node offering.</p>\",\
      \"wrapper\":true\
    },\
    \"RecurringChargeList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"RecurringCharge\",\
        \"locationName\":\"RecurringCharge\"\
      }\
    },\
    \"RegionalConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ReplicationGroupId\",\
        \"ReplicationGroupRegion\",\
        \"ReshardingConfiguration\"\
      ],\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the secondary cluster</p>\"\
        },\
        \"ReplicationGroupRegion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS region where the cluster is stored</p>\"\
        },\
        \"ReshardingConfiguration\":{\
          \"shape\":\"ReshardingConfigurationList\",\
          \"documentation\":\"<p>A list of <code>PreferredAvailabilityZones</code> objects that specifies the configuration of a node group in the resharded cluster. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of the replication groups </p>\"\
    },\
    \"RegionalConfigurationList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"RegionalConfiguration\",\
        \"locationName\":\"RegionalConfiguration\"\
      }\
    },\
    \"RemoveReplicasList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"RemoveTagsFromResourceMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceName\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource from which you want the tags removed, for example <code>arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster</code> or <code>arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot</code>.</p> <p>For more information about ARNs, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html\\\">Amazon Resource Names (ARNs) and AWS Service Namespaces</a>.</p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"KeyList\",\
          \"documentation\":\"<p>A list of <code>TagKeys</code> identifying the tags you want removed from the named resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>RemoveTagsFromResource</code> operation.</p>\"\
    },\
    \"ReplicaConfigurationList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ConfigureShard\",\
        \"locationName\":\"ConfigureShard\"\
      }\
    },\
    \"ReplicationGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier for the replication group.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The user supplied description of the replication group.</p>\"\
        },\
        \"GlobalReplicationGroupInfo\":{\
          \"shape\":\"GlobalReplicationGroupInfo\",\
          \"documentation\":\"<p>The name of the Global Datastore and role of this replication group in the Global Datastore.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The current state of this replication group - <code>creating</code>, <code>available</code>, <code>modifying</code>, <code>deleting</code>, <code>create-failed</code>, <code>snapshotting</code>.</p>\"\
        },\
        \"PendingModifiedValues\":{\
          \"shape\":\"ReplicationGroupPendingModifiedValues\",\
          \"documentation\":\"<p>A group of settings to be applied to the replication group, either immediately or during the next maintenance window.</p>\"\
        },\
        \"MemberClusters\":{\
          \"shape\":\"ClusterIdList\",\
          \"documentation\":\"<p>The names of all the cache clusters that are part of this replication group.</p>\"\
        },\
        \"NodeGroups\":{\
          \"shape\":\"NodeGroupList\",\
          \"documentation\":\"<p>A list of node groups in this replication group. For Redis (cluster mode disabled) replication groups, this is a single-element list. For Redis (cluster mode enabled) replication groups, the list contains an entry for each node group (shard).</p>\"\
        },\
        \"SnapshottingClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cluster ID that is used as the daily snapshot source for the replication group.</p>\"\
        },\
        \"AutomaticFailover\":{\
          \"shape\":\"AutomaticFailoverStatus\",\
          \"documentation\":\"<p>Indicates the status of Multi-AZ with automatic failover for this Redis replication group.</p> <p>Amazon ElastiCache for Redis does not support Multi-AZ with automatic failover on:</p> <ul> <li> <p>Redis versions earlier than 2.8.6.</p> </li> <li> <p>Redis (cluster mode disabled): T1 node types.</p> </li> <li> <p>Redis (cluster mode enabled): T1 node types.</p> </li> </ul>\"\
        },\
        \"MultiAZ\":{\
          \"shape\":\"MultiAZStatus\",\
          \"documentation\":\"<p>A flag indicating if you have Multi-AZ enabled to enhance fault tolerance. For more information, see <a href=\\\"http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/AutoFailover.html\\\">Minimizing Downtime: Multi-AZ</a> </p>\"\
        },\
        \"ConfigurationEndpoint\":{\
          \"shape\":\"Endpoint\",\
          \"documentation\":\"<p>The configuration endpoint for this replication group. Use the configuration endpoint to connect to this replication group.</p>\"\
        },\
        \"SnapshotRetentionLimit\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The number of days for which ElastiCache retains automatic cluster snapshots before deleting them. For example, if you set <code>SnapshotRetentionLimit</code> to 5, a snapshot that was taken today is retained for 5 days before being deleted.</p> <important> <p> If the value of <code>SnapshotRetentionLimit</code> is set to zero (0), backups are turned off.</p> </important>\"\
        },\
        \"SnapshotWindow\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your node group (shard).</p> <p>Example: <code>05:00-09:00</code> </p> <p>If you do not specify this parameter, ElastiCache automatically chooses an appropriate time range.</p> <note> <p>This parameter is only valid if the <code>Engine</code> parameter is <code>redis</code>.</p> </note>\"\
        },\
        \"ClusterEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>A flag indicating whether or not this replication group is cluster enabled; i.e., whether its data can be partitioned across multiple shards (API/CLI: node groups).</p> <p>Valid values: <code>true</code> | <code>false</code> </p>\"\
        },\
        \"CacheNodeType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the compute and memory capacity node type for each node in the replication group.</p>\"\
        },\
        \"AuthTokenEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>A flag that enables using an <code>AuthToken</code> (password) when issuing Redis commands.</p> <p>Default: <code>false</code> </p>\"\
        },\
        \"AuthTokenLastModifiedDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The date the auth token was last modified</p>\"\
        },\
        \"TransitEncryptionEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>A flag that enables in-transit encryption when set to <code>true</code>.</p> <p>You cannot modify the value of <code>TransitEncryptionEnabled</code> after the cluster is created. To enable in-transit encryption on a cluster you must set <code>TransitEncryptionEnabled</code> to <code>true</code> when you create a cluster.</p> <p> <b>Required:</b> Only available when creating a replication group in an Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or later.</p> <p>Default: <code>false</code> </p>\"\
        },\
        \"AtRestEncryptionEnabled\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>A flag that enables encryption at-rest when set to <code>true</code>.</p> <p>You cannot modify the value of <code>AtRestEncryptionEnabled</code> after the cluster is created. To enable encryption at-rest on a cluster you must set <code>AtRestEncryptionEnabled</code> to <code>true</code> when you create a cluster.</p> <p> <b>Required:</b> Only available when creating a replication group in an Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or later.</p> <p>Default: <code>false</code> </p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the KMS key used to encrypt the disk in the cluster.</p>\"\
        },\
        \"ARN\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN (Amazon Resource Name) of the replication group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains all of the attributes of a specific Redis replication group.</p>\",\
      \"wrapper\":true\
    },\
    \"ReplicationGroupAlreadyExistsFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified replication group already exists.</p>\",\
      \"error\":{\
        \"code\":\"ReplicationGroupAlreadyExists\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ReplicationGroupAlreadyUnderMigrationFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The targeted replication group is not available. </p>\",\
      \"error\":{\
        \"code\":\"ReplicationGroupAlreadyUnderMigrationFault\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ReplicationGroupIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"},\
      \"max\":20\
    },\
    \"ReplicationGroupList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ReplicationGroup\",\
        \"locationName\":\"ReplicationGroup\"\
      }\
    },\
    \"ReplicationGroupMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Provides an identifier to allow retrieval of paginated results.</p>\"\
        },\
        \"ReplicationGroups\":{\
          \"shape\":\"ReplicationGroupList\",\
          \"documentation\":\"<p>A list of replication groups. Each item in the list contains detailed information about one replication group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output of a <code>DescribeReplicationGroups</code> operation.</p>\"\
    },\
    \"ReplicationGroupNotFoundFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified replication group does not exist.</p>\",\
      \"error\":{\
        \"code\":\"ReplicationGroupNotFoundFault\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ReplicationGroupNotUnderMigrationFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The designated replication group is not available for data migration.</p>\",\
      \"error\":{\
        \"code\":\"ReplicationGroupNotUnderMigrationFault\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ReplicationGroupPendingModifiedValues\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PrimaryClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The primary cluster ID that is applied immediately (if <code>--apply-immediately</code> was specified), or during the next maintenance window.</p>\"\
        },\
        \"AutomaticFailoverStatus\":{\
          \"shape\":\"PendingAutomaticFailoverStatus\",\
          \"documentation\":\"<p>Indicates the status of Multi-AZ with automatic failover for this Redis replication group.</p> <p>Amazon ElastiCache for Redis does not support Multi-AZ with automatic failover on:</p> <ul> <li> <p>Redis versions earlier than 2.8.6.</p> </li> <li> <p>Redis (cluster mode disabled): T1 node types.</p> </li> <li> <p>Redis (cluster mode enabled): T1 node types.</p> </li> </ul>\"\
        },\
        \"Resharding\":{\
          \"shape\":\"ReshardingStatus\",\
          \"documentation\":\"<p>The status of an online resharding operation.</p>\"\
        },\
        \"AuthTokenStatus\":{\
          \"shape\":\"AuthTokenUpdateStatus\",\
          \"documentation\":\"<p>The auth token status</p>\"\
        }\
      },\
      \"documentation\":\"<p>The settings to be applied to the Redis replication group, either immediately or during the next maintenance window.</p>\"\
    },\
    \"ReservedCacheNode\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedCacheNodeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The unique identifier for the reservation.</p>\"\
        },\
        \"ReservedCacheNodesOfferingId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The offering identifier.</p>\"\
        },\
        \"CacheNodeType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cache node type for the reserved cache nodes.</p> <p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p> <ul> <li> <p>General purpose:</p> <ul> <li> <p>Current generation: </p> <p> <b>M5 node types:</b> <code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code> </p> <p> <b>M4 node types:</b> <code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code> </p> <p> <b>T3 node types:</b> <code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code> </p> <p> <b>T2 node types:</b> <code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>T1 node types:</b> <code>cache.t1.micro</code> </p> <p> <b>M1 node types:</b> <code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code> </p> <p> <b>M3 node types:</b> <code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code> </p> </li> </ul> </li> <li> <p>Compute optimized:</p> <ul> <li> <p>Previous generation: (not recommended)</p> <p> <b>C1 node types:</b> <code>cache.c1.xlarge</code> </p> </li> </ul> </li> <li> <p>Memory optimized:</p> <ul> <li> <p>Current generation: </p> <p> <b>R5 node types:</b> <code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code> </p> <p> <b>R4 node types:</b> <code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>M2 node types:</b> <code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code> </p> <p> <b>R3 node types:</b> <code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code> </p> </li> </ul> </li> </ul> <p> <b>Additional node type info</b> </p> <ul> <li> <p>All current generation instance types are created in Amazon VPC by default.</p> </li> <li> <p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p> </li> <li> <p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p> </li> <li> <p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p> </li> </ul>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The time the reservation started.</p>\"\
        },\
        \"Duration\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The duration of the reservation in seconds.</p>\"\
        },\
        \"FixedPrice\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The fixed price charged for this reserved cache node.</p>\"\
        },\
        \"UsagePrice\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The hourly price charged for this reserved cache node.</p>\"\
        },\
        \"CacheNodeCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of cache nodes that have been reserved.</p>\"\
        },\
        \"ProductDescription\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description of the reserved cache node.</p>\"\
        },\
        \"OfferingType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The offering type of this reserved cache node.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The state of the reserved cache node.</p>\"\
        },\
        \"RecurringCharges\":{\
          \"shape\":\"RecurringChargeList\",\
          \"documentation\":\"<p>The recurring price charged to run this reserved cache node.</p>\"\
        },\
        \"ReservationARN\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the reserved cache node.</p> <p>Example: <code>arn:aws:elasticache:us-east-1:123456789012:reserved-instance:ri-2017-03-27-08-33-25-582</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output of a <code>PurchaseReservedCacheNodesOffering</code> operation.</p>\",\
      \"wrapper\":true\
    },\
    \"ReservedCacheNodeAlreadyExistsFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You already have a reservation with the given identifier.</p>\",\
      \"error\":{\
        \"code\":\"ReservedCacheNodeAlreadyExists\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ReservedCacheNodeList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ReservedCacheNode\",\
        \"locationName\":\"ReservedCacheNode\"\
      }\
    },\
    \"ReservedCacheNodeMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Provides an identifier to allow retrieval of paginated results.</p>\"\
        },\
        \"ReservedCacheNodes\":{\
          \"shape\":\"ReservedCacheNodeList\",\
          \"documentation\":\"<p>A list of reserved cache nodes. Each element in the list contains detailed information about one node.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output of a <code>DescribeReservedCacheNodes</code> operation.</p>\"\
    },\
    \"ReservedCacheNodeNotFoundFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested reserved cache node was not found.</p>\",\
      \"error\":{\
        \"code\":\"ReservedCacheNodeNotFound\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ReservedCacheNodeQuotaExceededFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The request cannot be processed because it would exceed the user's cache node quota.</p>\",\
      \"error\":{\
        \"code\":\"ReservedCacheNodeQuotaExceeded\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ReservedCacheNodesOffering\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedCacheNodesOfferingId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique identifier for the reserved cache node offering.</p>\"\
        },\
        \"CacheNodeType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cache node type for the reserved cache node.</p> <p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p> <ul> <li> <p>General purpose:</p> <ul> <li> <p>Current generation: </p> <p> <b>M5 node types:</b> <code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code> </p> <p> <b>M4 node types:</b> <code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code> </p> <p> <b>T3 node types:</b> <code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code> </p> <p> <b>T2 node types:</b> <code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>T1 node types:</b> <code>cache.t1.micro</code> </p> <p> <b>M1 node types:</b> <code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code> </p> <p> <b>M3 node types:</b> <code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code> </p> </li> </ul> </li> <li> <p>Compute optimized:</p> <ul> <li> <p>Previous generation: (not recommended)</p> <p> <b>C1 node types:</b> <code>cache.c1.xlarge</code> </p> </li> </ul> </li> <li> <p>Memory optimized:</p> <ul> <li> <p>Current generation: </p> <p> <b>R5 node types:</b> <code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code> </p> <p> <b>R4 node types:</b> <code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>M2 node types:</b> <code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code> </p> <p> <b>R3 node types:</b> <code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code> </p> </li> </ul> </li> </ul> <p> <b>Additional node type info</b> </p> <ul> <li> <p>All current generation instance types are created in Amazon VPC by default.</p> </li> <li> <p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p> </li> <li> <p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p> </li> <li> <p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p> </li> </ul>\"\
        },\
        \"Duration\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The duration of the offering. in seconds.</p>\"\
        },\
        \"FixedPrice\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The fixed price charged for this offering.</p>\"\
        },\
        \"UsagePrice\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The hourly price charged for this offering.</p>\"\
        },\
        \"ProductDescription\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cache engine used by the offering.</p>\"\
        },\
        \"OfferingType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The offering type.</p>\"\
        },\
        \"RecurringCharges\":{\
          \"shape\":\"RecurringChargeList\",\
          \"documentation\":\"<p>The recurring price charged to run this reserved cache node.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes all of the attributes of a reserved cache node offering.</p>\",\
      \"wrapper\":true\
    },\
    \"ReservedCacheNodesOfferingList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ReservedCacheNodesOffering\",\
        \"locationName\":\"ReservedCacheNodesOffering\"\
      }\
    },\
    \"ReservedCacheNodesOfferingMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Provides an identifier to allow retrieval of paginated results.</p>\"\
        },\
        \"ReservedCacheNodesOfferings\":{\
          \"shape\":\"ReservedCacheNodesOfferingList\",\
          \"documentation\":\"<p>A list of reserved cache node offerings. Each element in the list contains detailed information about one offering.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output of a <code>DescribeReservedCacheNodesOfferings</code> operation.</p>\"\
    },\
    \"ReservedCacheNodesOfferingNotFoundFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested cache node offering does not exist.</p>\",\
      \"error\":{\
        \"code\":\"ReservedCacheNodesOfferingNotFound\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ResetCacheParameterGroupMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"CacheParameterGroupName\"],\
      \"members\":{\
        \"CacheParameterGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache parameter group to reset.</p>\"\
        },\
        \"ResetAllParameters\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If <code>true</code>, all parameters in the cache parameter group are reset to their default values. If <code>false</code>, only the parameters listed by <code>ParameterNameValues</code> are reset to their default values.</p> <p>Valid values: <code>true</code> | <code>false</code> </p>\"\
        },\
        \"ParameterNameValues\":{\
          \"shape\":\"ParameterNameValueList\",\
          \"documentation\":\"<p>An array of parameter names to reset to their default values. If <code>ResetAllParameters</code> is <code>true</code>, do not use <code>ParameterNameValues</code>. If <code>ResetAllParameters</code> is <code>false</code>, you must specify the name of at least one parameter to reset.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>ResetCacheParameterGroup</code> operation.</p>\"\
    },\
    \"ReshardingConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NodeGroupId\":{\
          \"shape\":\"AllowedNodeGroupId\",\
          \"documentation\":\"<p>Either the ElastiCache for Redis supplied 4-digit id or a user supplied id for the node group these configuration values apply to.</p>\"\
        },\
        \"PreferredAvailabilityZones\":{\
          \"shape\":\"AvailabilityZonesList\",\
          \"documentation\":\"<p>A list of preferred availability zones for the nodes in this cluster.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of <code>PreferredAvailabilityZones</code> objects that specifies the configuration of a node group in the resharded cluster.</p>\"\
    },\
    \"ReshardingConfigurationList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ReshardingConfiguration\",\
        \"locationName\":\"ReshardingConfiguration\"\
      }\
    },\
    \"ReshardingStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SlotMigration\":{\
          \"shape\":\"SlotMigration\",\
          \"documentation\":\"<p>Represents the progress of an online resharding operation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The status of an online resharding operation.</p>\"\
    },\
    \"RevokeCacheSecurityGroupIngressMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CacheSecurityGroupName\",\
        \"EC2SecurityGroupName\",\
        \"EC2SecurityGroupOwnerId\"\
      ],\
      \"members\":{\
        \"CacheSecurityGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache security group to revoke ingress from.</p>\"\
        },\
        \"EC2SecurityGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Amazon EC2 security group to revoke access from.</p>\"\
        },\
        \"EC2SecurityGroupOwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account number of the Amazon EC2 security group owner. Note that this is not the same thing as an AWS access key ID - you must provide a valid AWS account number for this parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the input of a <code>RevokeCacheSecurityGroupIngress</code> operation.</p>\"\
    },\
    \"RevokeCacheSecurityGroupIngressResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CacheSecurityGroup\":{\"shape\":\"CacheSecurityGroup\"}\
      }\
    },\
    \"SecurityGroupIdsList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"SecurityGroupId\"\
      }\
    },\
    \"SecurityGroupMembership\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecurityGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier of the cache security group.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status of the cache security group membership. The status changes whenever a cache security group is modified, or when the cache security groups assigned to a cluster are modified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a single cache security group and its status.</p>\"\
    },\
    \"SecurityGroupMembershipList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityGroupMembership\"}\
    },\
    \"ServiceLinkedRoleNotFoundFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified service linked role (SLR) was not found.</p>\",\
      \"error\":{\
        \"code\":\"ServiceLinkedRoleNotFoundFault\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ServiceUpdate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ServiceUpdateName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The unique ID of the service update</p>\"\
        },\
        \"ServiceUpdateReleaseDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The date when the service update is initially available</p>\"\
        },\
        \"ServiceUpdateEndDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The date after which the service update is no longer available</p>\"\
        },\
        \"ServiceUpdateSeverity\":{\
          \"shape\":\"ServiceUpdateSeverity\",\
          \"documentation\":\"<p>The severity of the service update</p>\"\
        },\
        \"ServiceUpdateRecommendedApplyByDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The recommendend date to apply the service update in order to ensure compliance. For information on compliance, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/elasticache-compliance.html#elasticache-compliance-self-service\\\">Self-Service Security Updates for Compliance</a>.</p>\"\
        },\
        \"ServiceUpdateStatus\":{\
          \"shape\":\"ServiceUpdateStatus\",\
          \"documentation\":\"<p>The status of the service update</p>\"\
        },\
        \"ServiceUpdateDescription\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Provides details of the service update</p>\"\
        },\
        \"ServiceUpdateType\":{\
          \"shape\":\"ServiceUpdateType\",\
          \"documentation\":\"<p>Reflects the nature of the service update</p>\"\
        },\
        \"Engine\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Elasticache engine to which the update applies. Either Redis or Memcached</p>\"\
        },\
        \"EngineVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Elasticache engine version to which the update applies. Either Redis or Memcached engine version</p>\"\
        },\
        \"AutoUpdateAfterRecommendedApplyByDate\":{\
          \"shape\":\"BooleanOptional\",\
          \"documentation\":\"<p>Indicates whether the service update will be automatically applied once the recommended apply-by date has expired. </p>\"\
        },\
        \"EstimatedUpdateTime\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The estimated length of time the service update will take</p>\"\
        }\
      },\
      \"documentation\":\"<p>An update that you can apply to your Redis clusters.</p>\"\
    },\
    \"ServiceUpdateList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ServiceUpdate\",\
        \"locationName\":\"ServiceUpdate\"\
      }\
    },\
    \"ServiceUpdateNotFoundFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The service update doesn't exist</p>\",\
      \"error\":{\
        \"code\":\"ServiceUpdateNotFoundFault\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ServiceUpdateSeverity\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"critical\",\
        \"important\",\
        \"medium\",\
        \"low\"\
      ]\
    },\
    \"ServiceUpdateStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"available\",\
        \"cancelled\",\
        \"expired\"\
      ]\
    },\
    \"ServiceUpdateStatusList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ServiceUpdateStatus\"},\
      \"max\":3\
    },\
    \"ServiceUpdateType\":{\
      \"type\":\"string\",\
      \"enum\":[\"security-update\"]\
    },\
    \"ServiceUpdatesMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>\"\
        },\
        \"ServiceUpdates\":{\
          \"shape\":\"ServiceUpdateList\",\
          \"documentation\":\"<p>A list of service updates</p>\"\
        }\
      }\
    },\
    \"SlaMet\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"yes\",\
        \"no\",\
        \"n/a\"\
      ]\
    },\
    \"SlotMigration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProgressPercentage\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The percentage of the slot migration that is complete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the progress of an online resharding operation.</p>\"\
    },\
    \"Snapshot\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SnapshotName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of a snapshot. For an automatic snapshot, the name is system-generated. For a manual snapshot, this is the user-provided name.</p>\"\
        },\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The unique identifier of the source replication group.</p>\"\
        },\
        \"ReplicationGroupDescription\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the source replication group.</p>\"\
        },\
        \"CacheClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The user-supplied identifier of the source cluster.</p>\"\
        },\
        \"SnapshotStatus\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status of the snapshot. Valid values: <code>creating</code> | <code>available</code> | <code>restoring</code> | <code>copying</code> | <code>deleting</code>.</p>\"\
        },\
        \"SnapshotSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Indicates whether the snapshot is from an automatic backup (<code>automated</code>) or was created manually (<code>manual</code>).</p>\"\
        },\
        \"CacheNodeType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the compute and memory capacity node type for the source cluster.</p> <p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p> <ul> <li> <p>General purpose:</p> <ul> <li> <p>Current generation: </p> <p> <b>M5 node types:</b> <code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code> </p> <p> <b>M4 node types:</b> <code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code> </p> <p> <b>T3 node types:</b> <code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code> </p> <p> <b>T2 node types:</b> <code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>T1 node types:</b> <code>cache.t1.micro</code> </p> <p> <b>M1 node types:</b> <code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code> </p> <p> <b>M3 node types:</b> <code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code> </p> </li> </ul> </li> <li> <p>Compute optimized:</p> <ul> <li> <p>Previous generation: (not recommended)</p> <p> <b>C1 node types:</b> <code>cache.c1.xlarge</code> </p> </li> </ul> </li> <li> <p>Memory optimized:</p> <ul> <li> <p>Current generation: </p> <p> <b>R5 node types:</b> <code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code> </p> <p> <b>R4 node types:</b> <code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code> </p> </li> <li> <p>Previous generation: (not recommended)</p> <p> <b>M2 node types:</b> <code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code> </p> <p> <b>R3 node types:</b> <code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code> </p> </li> </ul> </li> </ul> <p> <b>Additional node type info</b> </p> <ul> <li> <p>All current generation instance types are created in Amazon VPC by default.</p> </li> <li> <p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p> </li> <li> <p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p> </li> <li> <p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p> </li> </ul>\"\
        },\
        \"Engine\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache engine (<code>memcached</code> or <code>redis</code>) used by the source cluster.</p>\"\
        },\
        \"EngineVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The version of the cache engine version that is used by the source cluster.</p>\"\
        },\
        \"NumCacheNodes\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The number of cache nodes in the source cluster.</p> <p>For clusters running Redis, this value must be 1. For clusters running Memcached, this value must be between 1 and 20.</p>\"\
        },\
        \"PreferredAvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Availability Zone in which the source cluster is located.</p>\"\
        },\
        \"CacheClusterCreateTime\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The date and time when the source cluster was created.</p>\"\
        },\
        \"PreferredMaintenanceWindow\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period.</p> <p>Valid values for <code>ddd</code> are:</p> <ul> <li> <p> <code>sun</code> </p> </li> <li> <p> <code>mon</code> </p> </li> <li> <p> <code>tue</code> </p> </li> <li> <p> <code>wed</code> </p> </li> <li> <p> <code>thu</code> </p> </li> <li> <p> <code>fri</code> </p> </li> <li> <p> <code>sat</code> </p> </li> </ul> <p>Example: <code>sun:23:00-mon:01:30</code> </p>\"\
        },\
        \"TopicArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the topic used by the source cluster for publishing notifications.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The port number used by each cache nodes in the source cluster.</p>\"\
        },\
        \"CacheParameterGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The cache parameter group that is associated with the source cluster.</p>\"\
        },\
        \"CacheSubnetGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the cache subnet group associated with the source cluster.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Virtual Private Cloud identifier (VPC ID) of the cache subnet group for the source cluster.</p>\"\
        },\
        \"AutoMinorVersionUpgrade\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>This parameter is currently disabled.</p>\"\
        },\
        \"SnapshotRetentionLimit\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>For an automatic snapshot, the number of days for which ElastiCache retains the snapshot before deleting it.</p> <p>For manual snapshots, this field reflects the <code>SnapshotRetentionLimit</code> for the source cluster when the snapshot was created. This field is otherwise ignored: Manual snapshots do not expire, and can only be deleted using the <code>DeleteSnapshot</code> operation. </p> <p> <b>Important</b> If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off.</p>\"\
        },\
        \"SnapshotWindow\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The daily time range during which ElastiCache takes daily snapshots of the source cluster.</p>\"\
        },\
        \"NumNodeGroups\":{\
          \"shape\":\"IntegerOptional\",\
          \"documentation\":\"<p>The number of node groups (shards) in this snapshot. When restoring from a snapshot, the number of node groups (shards) in the snapshot and in the restored replication group must be the same.</p>\"\
        },\
        \"AutomaticFailover\":{\
          \"shape\":\"AutomaticFailoverStatus\",\
          \"documentation\":\"<p>Indicates the status of Multi-AZ with automatic failover for the source Redis replication group.</p> <p>Amazon ElastiCache for Redis does not support Multi-AZ with automatic failover on:</p> <ul> <li> <p>Redis versions earlier than 2.8.6.</p> </li> <li> <p>Redis (cluster mode disabled): T1 node types.</p> </li> <li> <p>Redis (cluster mode enabled): T1 node types.</p> </li> </ul>\"\
        },\
        \"NodeSnapshots\":{\
          \"shape\":\"NodeSnapshotList\",\
          \"documentation\":\"<p>A list of the cache nodes in the source cluster.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the KMS key used to encrypt the snapshot.</p>\"\
        },\
        \"ARN\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN (Amazon Resource Name) of the snapshot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a copy of an entire Redis cluster as of the time when the snapshot was taken.</p>\",\
      \"wrapper\":true\
    },\
    \"SnapshotAlreadyExistsFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You already have a snapshot with the given name.</p>\",\
      \"error\":{\
        \"code\":\"SnapshotAlreadyExistsFault\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"SnapshotArnsList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"SnapshotArn\"\
      }\
    },\
    \"SnapshotFeatureNotSupportedFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You attempted one of the following operations:</p> <ul> <li> <p>Creating a snapshot of a Redis cluster running on a <code>cache.t1.micro</code> cache node.</p> </li> <li> <p>Creating a snapshot of a cluster that is running Memcached rather than Redis.</p> </li> </ul> <p>Neither of these are supported by ElastiCache.</p>\",\
      \"error\":{\
        \"code\":\"SnapshotFeatureNotSupportedFault\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"SnapshotList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Snapshot\",\
        \"locationName\":\"Snapshot\"\
      }\
    },\
    \"SnapshotNotFoundFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested snapshot name does not refer to an existing snapshot.</p>\",\
      \"error\":{\
        \"code\":\"SnapshotNotFoundFault\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"SnapshotQuotaExceededFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The request cannot be processed because it would exceed the maximum number of snapshots.</p>\",\
      \"error\":{\
        \"code\":\"SnapshotQuotaExceededFault\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"SourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"cache-cluster\",\
        \"cache-parameter-group\",\
        \"cache-security-group\",\
        \"cache-subnet-group\",\
        \"replication-group\"\
      ]\
    },\
    \"StartMigrationMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ReplicationGroupId\",\
        \"CustomerNodeEndpointList\"\
      ],\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the replication group to which data should be migrated.</p>\"\
        },\
        \"CustomerNodeEndpointList\":{\
          \"shape\":\"CustomerNodeEndpointList\",\
          \"documentation\":\"<p>List of endpoints from which data should be migrated. For Redis (cluster mode disabled), list should have only one element.</p>\"\
        }\
      }\
    },\
    \"StartMigrationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicationGroup\":{\"shape\":\"ReplicationGroup\"}\
      }\
    },\
    \"String\":{\"type\":\"string\"},\
    \"Subnet\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SubnetIdentifier\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The unique identifier for the subnet.</p>\"\
        },\
        \"SubnetAvailabilityZone\":{\
          \"shape\":\"AvailabilityZone\",\
          \"documentation\":\"<p>The Availability Zone associated with the subnet.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the subnet associated with a cluster. This parameter refers to subnets defined in Amazon Virtual Private Cloud (Amazon VPC) and used with ElastiCache.</p>\"\
    },\
    \"SubnetIdentifierList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"SubnetIdentifier\"\
      }\
    },\
    \"SubnetInUse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested subnet is being used by another cache subnet group.</p>\",\
      \"error\":{\
        \"code\":\"SubnetInUse\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"SubnetList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Subnet\",\
        \"locationName\":\"Subnet\"\
      }\
    },\
    \"TStamp\":{\"type\":\"timestamp\"},\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The key for the tag. May not be null.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The tag's value. May be null.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A cost allocation Tag that can be added to an ElastiCache cluster or replication group. Tags are composed of a Key/Value pair. A tag with a null Value is permitted.</p>\"\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Tag\",\
        \"locationName\":\"Tag\"\
      }\
    },\
    \"TagListMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TagList\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of cost allocation tags as key-value pairs.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the output from the <code>AddTagsToResource</code>, <code>ListTagsForResource</code>, and <code>RemoveTagsFromResource</code> operations.</p>\"\
    },\
    \"TagNotFoundFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested tag was not found on this resource.</p>\",\
      \"error\":{\
        \"code\":\"TagNotFound\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TagQuotaPerResourceExceeded\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The request cannot be processed because it would cause the resource to have more than the allowed number of tags. The maximum number of tags permitted on a resource is 50.</p>\",\
      \"error\":{\
        \"code\":\"TagQuotaPerResourceExceeded\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TestFailoverMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ReplicationGroupId\",\
        \"NodeGroupId\"\
      ],\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the replication group (console: cluster) whose automatic failover is being tested by this operation.</p>\"\
        },\
        \"NodeGroupId\":{\
          \"shape\":\"AllowedNodeGroupId\",\
          \"documentation\":\"<p>The name of the node group (called shard in the console) in this replication group on which automatic failover is to be tested. You may test automatic failover on up to 5 node groups in any rolling 24-hour period.</p>\"\
        }\
      }\
    },\
    \"TestFailoverNotAvailableFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The <code>TestFailover</code> action is not available.</p>\",\
      \"error\":{\
        \"code\":\"TestFailoverNotAvailableFault\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TestFailoverResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicationGroup\":{\"shape\":\"ReplicationGroup\"}\
      }\
    },\
    \"TimeRangeFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StartTime\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The start time of the time range filter</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The end time of the time range filter</p>\"\
        }\
      },\
      \"documentation\":\"<p>Filters update actions from the service updates that are in available status during the time range.</p>\"\
    },\
    \"UnprocessedUpdateAction\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The replication group ID</p>\"\
        },\
        \"CacheClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the cache cluster</p>\"\
        },\
        \"ServiceUpdateName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The unique ID of the service update</p>\"\
        },\
        \"ErrorType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The error type for requests that are not processed</p>\"\
        },\
        \"ErrorMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The error message that describes the reason the request was not processed</p>\"\
        }\
      },\
      \"documentation\":\"<p>Update action that has failed to be processed for the corresponding apply/stop request</p>\"\
    },\
    \"UnprocessedUpdateActionList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"UnprocessedUpdateAction\",\
        \"locationName\":\"UnprocessedUpdateAction\"\
      }\
    },\
    \"UpdateAction\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReplicationGroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the replication group</p>\"\
        },\
        \"CacheClusterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the cache cluster</p>\"\
        },\
        \"ServiceUpdateName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The unique ID of the service update</p>\"\
        },\
        \"ServiceUpdateReleaseDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The date the update is first available</p>\"\
        },\
        \"ServiceUpdateSeverity\":{\
          \"shape\":\"ServiceUpdateSeverity\",\
          \"documentation\":\"<p>The severity of the service update</p>\"\
        },\
        \"ServiceUpdateStatus\":{\
          \"shape\":\"ServiceUpdateStatus\",\
          \"documentation\":\"<p>The status of the service update</p>\"\
        },\
        \"ServiceUpdateRecommendedApplyByDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The recommended date to apply the service update to ensure compliance. For information on compliance, see <a href=\\\"https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/elasticache-compliance.html#elasticache-compliance-self-service\\\">Self-Service Security Updates for Compliance</a>.</p>\"\
        },\
        \"ServiceUpdateType\":{\
          \"shape\":\"ServiceUpdateType\",\
          \"documentation\":\"<p>Reflects the nature of the service update </p>\"\
        },\
        \"UpdateActionAvailableDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The date that the service update is available to a replication group</p>\"\
        },\
        \"UpdateActionStatus\":{\
          \"shape\":\"UpdateActionStatus\",\
          \"documentation\":\"<p>The status of the update action</p>\"\
        },\
        \"NodesUpdated\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The progress of the service update on the replication group</p>\"\
        },\
        \"UpdateActionStatusModifiedDate\":{\
          \"shape\":\"TStamp\",\
          \"documentation\":\"<p>The date when the UpdateActionStatus was last modified</p>\"\
        },\
        \"SlaMet\":{\
          \"shape\":\"SlaMet\",\
          \"documentation\":\"<p>If yes, all nodes in the replication group have been updated by the recommended apply-by date. If no, at least one node in the replication group have not been updated by the recommended apply-by date. If N/A, the replication group was created after the recommended apply-by date.</p>\"\
        },\
        \"NodeGroupUpdateStatus\":{\
          \"shape\":\"NodeGroupUpdateStatusList\",\
          \"documentation\":\"<p>The status of the service update on the node group</p>\"\
        },\
        \"CacheNodeUpdateStatus\":{\
          \"shape\":\"CacheNodeUpdateStatusList\",\
          \"documentation\":\"<p>The status of the service update on the cache node</p>\"\
        },\
        \"EstimatedUpdateTime\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The estimated length of time for the update to complete</p>\"\
        },\
        \"Engine\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Elasticache engine to which the update applies. Either Redis or Memcached</p>\"\
        }\
      },\
      \"documentation\":\"<p>The status of the service update for a specific replication group</p>\"\
    },\
    \"UpdateActionList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"UpdateAction\",\
        \"locationName\":\"UpdateAction\"\
      }\
    },\
    \"UpdateActionResultsMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProcessedUpdateActions\":{\
          \"shape\":\"ProcessedUpdateActionList\",\
          \"documentation\":\"<p>Update actions that have been processed successfully</p>\"\
        },\
        \"UnprocessedUpdateActions\":{\
          \"shape\":\"UnprocessedUpdateActionList\",\
          \"documentation\":\"<p>Update actions that haven't been processed successfully</p>\"\
        }\
      }\
    },\
    \"UpdateActionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"not-applied\",\
        \"waiting-to-start\",\
        \"in-progress\",\
        \"stopping\",\
        \"stopped\",\
        \"complete\",\
        \"scheduling\",\
        \"scheduled\",\
        \"not-applicable\"\
      ]\
    },\
    \"UpdateActionStatusList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UpdateActionStatus\"},\
      \"max\":9\
    },\
    \"UpdateActionsMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>\"\
        },\
        \"UpdateActions\":{\
          \"shape\":\"UpdateActionList\",\
          \"documentation\":\"<p>Returns a list of update actions</p>\"\
        }\
      }\
    }\
  },\
  \"documentation\":\"<fullname>Amazon ElastiCache</fullname> <p>Amazon ElastiCache is a web service that makes it easier to set up, operate, and scale a distributed cache in the cloud.</p> <p>With ElastiCache, customers get all of the benefits of a high-performance, in-memory cache with less of the administrative burden involved in launching and managing a distributed cache. The service makes setup, scaling, and cluster failure handling much simpler than in a self-managed cache deployment.</p> <p>In addition, through integration with Amazon CloudWatch, customers get enhanced visibility into the key performance statistics associated with their cache and can receive alarms if a part of their cache runs hot.</p>\"\
}\
";
}

@end
