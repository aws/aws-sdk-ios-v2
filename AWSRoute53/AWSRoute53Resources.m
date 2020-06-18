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

#import "AWSRoute53Resources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSRoute53Resources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSRoute53Resources

+ (instancetype)sharedInstance {
    static AWSRoute53Resources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSRoute53Resources new];
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
    \"apiVersion\":\"2013-04-01\",\
    \"endpointPrefix\":\"route53\",\
    \"globalEndpoint\":\"route53.amazonaws.com\",\
    \"protocol\":\"rest-xml\",\
    \"serviceAbbreviation\":\"Route 53\",\
    \"serviceFullName\":\"Amazon Route 53\",\
    \"serviceId\":\"Route 53\",\
    \"signatureVersion\":\"v4\",\
    \"uid\":\"route53-2013-04-01\"\
  },\
  \"operations\":{\
    \"AssociateVPCWithHostedZone\":{\
      \"name\":\"AssociateVPCWithHostedZone\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/hostedzone/{Id}/associatevpc\"\
      },\
      \"input\":{\
        \"shape\":\"AssociateVPCWithHostedZoneRequest\",\
        \"locationName\":\"AssociateVPCWithHostedZoneRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"AssociateVPCWithHostedZoneResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchHostedZone\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidVPCId\"},\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"PublicZoneVPCAssociation\"},\
        {\"shape\":\"ConflictingDomainExists\"},\
        {\"shape\":\"LimitsExceeded\"},\
        {\"shape\":\"PriorRequestNotComplete\"}\
      ],\
      \"documentation\":\"<p>Associates an Amazon VPC with a private hosted zone. </p> <note> <p>To perform the association, the VPC and the private hosted zone must already exist. Also, you can't convert a public hosted zone into a private hosted zone.</p> </note> <p>If you want to associate a VPC that was created by one AWS account with a private hosted zone that was created by a different account, do one of the following:</p> <ul> <li> <p>Use the AWS account that created the private hosted zone to submit a <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateVPCAssociationAuthorization.html\\\">CreateVPCAssociationAuthorization</a> request. Then use the account that created the VPC to submit an <code>AssociateVPCWithHostedZone</code> request.</p> </li> <li> <p>If a subnet in the VPC was shared with another account, you can use the account that the subnet was shared with to submit an <code>AssociateVPCWithHostedZone</code> request. For more information about sharing subnets, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/vpc-sharing.html\\\">Working with Shared VPCs</a>.</p> </li> </ul>\"\
    },\
    \"ChangeResourceRecordSets\":{\
      \"name\":\"ChangeResourceRecordSets\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/hostedzone/{Id}/rrset/\"\
      },\
      \"input\":{\
        \"shape\":\"ChangeResourceRecordSetsRequest\",\
        \"locationName\":\"ChangeResourceRecordSetsRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"ChangeResourceRecordSetsResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchHostedZone\"},\
        {\"shape\":\"NoSuchHealthCheck\"},\
        {\"shape\":\"InvalidChangeBatch\"},\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"PriorRequestNotComplete\"}\
      ],\
      \"documentation\":\"<p>Creates, changes, or deletes a resource record set, which contains authoritative DNS information for a specified domain name or subdomain name. For example, you can use <code>ChangeResourceRecordSets</code> to create a resource record set that routes traffic for test.example.com to a web server that has an IP address of 192.0.2.44.</p> <p> <b>Deleting Resource Record Sets</b> </p> <p>To delete a resource record set, you must specify all the same values that you specified when you created it.</p> <p> <b>Change Batches and Transactional Changes</b> </p> <p>The request body must include a document with a <code>ChangeResourceRecordSetsRequest</code> element. The request body contains a list of change items, known as a change batch. Change batches are considered transactional changes. Route 53 validates the changes in the request and then either makes all or none of the changes in the change batch request. This ensures that DNS routing isn't adversely affected by partial changes to the resource record sets in a hosted zone. </p> <p>For example, suppose a change batch request contains two changes: it deletes the <code>CNAME</code> resource record set for www.example.com and creates an alias resource record set for www.example.com. If validation for both records succeeds, Route 53 deletes the first resource record set and creates the second resource record set in a single operation. If validation for either the <code>DELETE</code> or the <code>CREATE</code> action fails, then the request is canceled, and the original <code>CNAME</code> record continues to exist.</p> <note> <p>If you try to delete the same resource record set more than once in a single change batch, Route 53 returns an <code>InvalidChangeBatch</code> error.</p> </note> <p> <b>Traffic Flow</b> </p> <p>To create resource record sets for complex routing configurations, use either the traffic flow visual editor in the Route 53 console or the API actions for traffic policies and traffic policy instances. Save the configuration as a traffic policy, then associate the traffic policy with one or more domain names (such as example.com) or subdomain names (such as www.example.com), in the same hosted zone or in multiple hosted zones. You can roll back the updates if the new configuration isn't performing as expected. For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/traffic-flow.html\\\">Using Traffic Flow to Route DNS Traffic</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p> <b>Create, Delete, and Upsert</b> </p> <p>Use <code>ChangeResourceRecordsSetsRequest</code> to perform the following actions:</p> <ul> <li> <p> <code>CREATE</code>: Creates a resource record set that has the specified values.</p> </li> <li> <p> <code>DELETE</code>: Deletes an existing resource record set that has the specified values.</p> </li> <li> <p> <code>UPSERT</code>: If a resource record set does not already exist, AWS creates it. If a resource set does exist, Route 53 updates it with the values in the request. </p> </li> </ul> <p> <b>Syntaxes for Creating, Updating, and Deleting Resource Record Sets</b> </p> <p>The syntax for a request depends on the type of resource record set that you want to create, delete, or update, such as weighted, alias, or failover. The XML elements in your request must appear in the order listed in the syntax. </p> <p>For an example for each type of resource record set, see \\\"Examples.\\\"</p> <p>Don't refer to the syntax in the \\\"Parameter Syntax\\\" section, which includes all of the elements for every kind of resource record set that you can create, delete, or update by using <code>ChangeResourceRecordSets</code>. </p> <p> <b>Change Propagation to Route 53 DNS Servers</b> </p> <p>When you submit a <code>ChangeResourceRecordSets</code> request, Route 53 propagates your changes to all of the Route 53 authoritative DNS servers. While your changes are propagating, <code>GetChange</code> returns a status of <code>PENDING</code>. When propagation is complete, <code>GetChange</code> returns a status of <code>INSYNC</code>. Changes generally propagate to all Route 53 name servers within 60 seconds. For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetChange.html\\\">GetChange</a>.</p> <p> <b>Limits on ChangeResourceRecordSets Requests</b> </p> <p>For information about the limits on a <code>ChangeResourceRecordSets</code> request, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html\\\">Limits</a> in the <i>Amazon Route 53 Developer Guide</i>.</p>\"\
    },\
    \"ChangeTagsForResource\":{\
      \"name\":\"ChangeTagsForResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/tags/{ResourceType}/{ResourceId}\"\
      },\
      \"input\":{\
        \"shape\":\"ChangeTagsForResourceRequest\",\
        \"locationName\":\"ChangeTagsForResourceRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"ChangeTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"NoSuchHealthCheck\"},\
        {\"shape\":\"NoSuchHostedZone\"},\
        {\"shape\":\"PriorRequestNotComplete\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Adds, edits, or deletes tags for a health check or a hosted zone.</p> <p>For information about using tags for cost allocation, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html\\\">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>\"\
    },\
    \"CreateHealthCheck\":{\
      \"name\":\"CreateHealthCheck\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/healthcheck\",\
        \"responseCode\":201\
      },\
      \"input\":{\
        \"shape\":\"CreateHealthCheckRequest\",\
        \"locationName\":\"CreateHealthCheckRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"CreateHealthCheckResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyHealthChecks\"},\
        {\"shape\":\"HealthCheckAlreadyExists\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Creates a new health check.</p> <p>For information about adding health checks to resource record sets, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_ResourceRecordSet.html#Route53-Type-ResourceRecordSet-HealthCheckId\\\">HealthCheckId</a> in <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_ChangeResourceRecordSets.html\\\">ChangeResourceRecordSets</a>. </p> <p> <b>ELB Load Balancers</b> </p> <p>If you're registering EC2 instances with an Elastic Load Balancing (ELB) load balancer, do not create Amazon Route 53 health checks for the EC2 instances. When you register an EC2 instance with a load balancer, you configure settings for an ELB health check, which performs a similar function to a Route 53 health check.</p> <p> <b>Private Hosted Zones</b> </p> <p>You can associate health checks with failover resource record sets in a private hosted zone. Note the following:</p> <ul> <li> <p>Route 53 health checkers are outside the VPC. To check the health of an endpoint within a VPC by IP address, you must assign a public IP address to the instance in the VPC.</p> </li> <li> <p>You can configure a health checker to check the health of an external resource that the instance relies on, such as a database server.</p> </li> <li> <p>You can create a CloudWatch metric, associate an alarm with the metric, and then create a health check that is based on the state of the alarm. For example, you might create a CloudWatch metric that checks the status of the Amazon EC2 <code>StatusCheckFailed</code> metric, add an alarm to the metric, and then create a health check that is based on the state of the alarm. For information about creating CloudWatch metrics and alarms by using the CloudWatch console, see the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/WhatIsCloudWatch.html\\\">Amazon CloudWatch User Guide</a>.</p> </li> </ul>\"\
    },\
    \"CreateHostedZone\":{\
      \"name\":\"CreateHostedZone\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/hostedzone\",\
        \"responseCode\":201\
      },\
      \"input\":{\
        \"shape\":\"CreateHostedZoneRequest\",\
        \"locationName\":\"CreateHostedZoneRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"CreateHostedZoneResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidDomainName\"},\
        {\"shape\":\"HostedZoneAlreadyExists\"},\
        {\"shape\":\"TooManyHostedZones\"},\
        {\"shape\":\"InvalidVPCId\"},\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"DelegationSetNotAvailable\"},\
        {\"shape\":\"ConflictingDomainExists\"},\
        {\"shape\":\"NoSuchDelegationSet\"},\
        {\"shape\":\"DelegationSetNotReusable\"}\
      ],\
      \"documentation\":\"<p>Creates a new public or private hosted zone. You create records in a public hosted zone to define how you want to route traffic on the internet for a domain, such as example.com, and its subdomains (apex.example.com, acme.example.com). You create records in a private hosted zone to define how you want to route traffic for a domain and its subdomains within one or more Amazon Virtual Private Clouds (Amazon VPCs). </p> <important> <p>You can't convert a public hosted zone to a private hosted zone or vice versa. Instead, you must create a new hosted zone with the same name and create new resource record sets.</p> </important> <p>For more information about charges for hosted zones, see <a href=\\\"http://aws.amazon.com/route53/pricing/\\\">Amazon Route 53 Pricing</a>.</p> <p>Note the following:</p> <ul> <li> <p>You can't create a hosted zone for a top-level domain (TLD) such as .com.</p> </li> <li> <p>For public hosted zones, Route 53 automatically creates a default SOA record and four NS records for the zone. For more information about SOA and NS records, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/SOA-NSrecords.html\\\">NS and SOA Records that Route 53 Creates for a Hosted Zone</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>If you want to use the same name servers for multiple public hosted zones, you can optionally associate a reusable delegation set with the hosted zone. See the <code>DelegationSetId</code> element.</p> </li> <li> <p>If your domain is registered with a registrar other than Route 53, you must update the name servers with your registrar to make Route 53 the DNS service for the domain. For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/MigratingDNS.html\\\">Migrating DNS Service for an Existing Domain to Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>. </p> </li> </ul> <p>When you submit a <code>CreateHostedZone</code> request, the initial status of the hosted zone is <code>PENDING</code>. For public hosted zones, this means that the NS and SOA records are not yet available on all Route 53 DNS servers. When the NS and SOA records are available, the status of the zone changes to <code>INSYNC</code>.</p>\"\
    },\
    \"CreateQueryLoggingConfig\":{\
      \"name\":\"CreateQueryLoggingConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/queryloggingconfig\",\
        \"responseCode\":201\
      },\
      \"input\":{\
        \"shape\":\"CreateQueryLoggingConfigRequest\",\
        \"locationName\":\"CreateQueryLoggingConfigRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"CreateQueryLoggingConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"ConcurrentModification\"},\
        {\"shape\":\"NoSuchHostedZone\"},\
        {\"shape\":\"NoSuchCloudWatchLogsLogGroup\"},\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"QueryLoggingConfigAlreadyExists\"},\
        {\"shape\":\"InsufficientCloudWatchLogsResourcePolicy\"}\
      ],\
      \"documentation\":\"<p>Creates a configuration for DNS query logging. After you create a query logging configuration, Amazon Route 53 begins to publish log data to an Amazon CloudWatch Logs log group.</p> <p>DNS query logs contain information about the queries that Route 53 receives for a specified public hosted zone, such as the following:</p> <ul> <li> <p>Route 53 edge location that responded to the DNS query</p> </li> <li> <p>Domain or subdomain that was requested</p> </li> <li> <p>DNS record type, such as A or AAAA</p> </li> <li> <p>DNS response code, such as <code>NoError</code> or <code>ServFail</code> </p> </li> </ul> <dl> <dt>Log Group and Resource Policy</dt> <dd> <p>Before you create a query logging configuration, perform the following operations.</p> <note> <p>If you create a query logging configuration using the Route 53 console, Route 53 performs these operations automatically.</p> </note> <ol> <li> <p>Create a CloudWatch Logs log group, and make note of the ARN, which you specify when you create a query logging configuration. Note the following:</p> <ul> <li> <p>You must create the log group in the us-east-1 region.</p> </li> <li> <p>You must use the same AWS account to create the log group and the hosted zone that you want to configure query logging for.</p> </li> <li> <p>When you create log groups for query logging, we recommend that you use a consistent prefix, for example:</p> <p> <code>/aws/route53/<i>hosted zone name</i> </code> </p> <p>In the next step, you'll create a resource policy, which controls access to one or more log groups and the associated AWS resources, such as Route 53 hosted zones. There's a limit on the number of resource policies that you can create, so we recommend that you use a consistent prefix so you can use the same resource policy for all the log groups that you create for query logging.</p> </li> </ul> </li> <li> <p>Create a CloudWatch Logs resource policy, and give it the permissions that Route 53 needs to create log streams and to send query logs to log streams. For the value of <code>Resource</code>, specify the ARN for the log group that you created in the previous step. To use the same resource policy for all the CloudWatch Logs log groups that you created for query logging configurations, replace the hosted zone name with <code>*</code>, for example:</p> <p> <code>arn:aws:logs:us-east-1:123412341234:log-group:/aws/route53/*</code> </p> <note> <p>You can't use the CloudWatch console to create or edit a resource policy. You must use the CloudWatch API, one of the AWS SDKs, or the AWS CLI.</p> </note> </li> </ol> </dd> <dt>Log Streams and Edge Locations</dt> <dd> <p>When Route 53 finishes creating the configuration for DNS query logging, it does the following:</p> <ul> <li> <p>Creates a log stream for an edge location the first time that the edge location responds to DNS queries for the specified hosted zone. That log stream is used to log all queries that Route 53 responds to for that edge location.</p> </li> <li> <p>Begins to send query logs to the applicable log stream.</p> </li> </ul> <p>The name of each log stream is in the following format:</p> <p> <code> <i>hosted zone ID</i>/<i>edge location code</i> </code> </p> <p>The edge location code is a three-letter code and an arbitrarily assigned number, for example, DFW3. The three-letter code typically corresponds with the International Air Transport Association airport code for an airport near the edge location. (These abbreviations might change in the future.) For a list of edge locations, see \\\"The Route 53 Global Network\\\" on the <a href=\\\"http://aws.amazon.com/route53/details/\\\">Route 53 Product Details</a> page.</p> </dd> <dt>Queries That Are Logged</dt> <dd> <p>Query logs contain only the queries that DNS resolvers forward to Route 53. If a DNS resolver has already cached the response to a query (such as the IP address for a load balancer for example.com), the resolver will continue to return the cached response. It doesn't forward another query to Route 53 until the TTL for the corresponding resource record set expires. Depending on how many DNS queries are submitted for a resource record set, and depending on the TTL for that resource record set, query logs might contain information about only one query out of every several thousand queries that are submitted to DNS. For more information about how DNS works, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/welcome-dns-service.html\\\">Routing Internet Traffic to Your Website or Web Application</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> </dd> <dt>Log File Format</dt> <dd> <p>For a list of the values in each query log and the format of each value, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/query-logs.html\\\">Logging DNS Queries</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> </dd> <dt>Pricing</dt> <dd> <p>For information about charges for query logs, see <a href=\\\"http://aws.amazon.com/cloudwatch/pricing/\\\">Amazon CloudWatch Pricing</a>.</p> </dd> <dt>How to Stop Logging</dt> <dd> <p>If you want Route 53 to stop sending query logs to CloudWatch Logs, delete the query logging configuration. For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_DeleteQueryLoggingConfig.html\\\">DeleteQueryLoggingConfig</a>.</p> </dd> </dl>\"\
    },\
    \"CreateReusableDelegationSet\":{\
      \"name\":\"CreateReusableDelegationSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/delegationset\",\
        \"responseCode\":201\
      },\
      \"input\":{\
        \"shape\":\"CreateReusableDelegationSetRequest\",\
        \"locationName\":\"CreateReusableDelegationSetRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"CreateReusableDelegationSetResponse\"},\
      \"errors\":[\
        {\"shape\":\"DelegationSetAlreadyCreated\"},\
        {\"shape\":\"LimitsExceeded\"},\
        {\"shape\":\"HostedZoneNotFound\"},\
        {\"shape\":\"InvalidArgument\"},\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"DelegationSetNotAvailable\"},\
        {\"shape\":\"DelegationSetAlreadyReusable\"}\
      ],\
      \"documentation\":\"<p>Creates a delegation set (a group of four name servers) that can be reused by multiple hosted zones that were created by the same AWS account. </p> <p>You can also create a reusable delegation set that uses the four name servers that are associated with an existing hosted zone. Specify the hosted zone ID in the <code>CreateReusableDelegationSet</code> request.</p> <note> <p>You can't associate a reusable delegation set with a private hosted zone.</p> </note> <p>For information about using a reusable delegation set to configure white label name servers, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/white-label-name-servers.html\\\">Configuring White Label Name Servers</a>.</p> <p>The process for migrating existing hosted zones to use a reusable delegation set is comparable to the process for configuring white label name servers. You need to perform the following steps:</p> <ol> <li> <p>Create a reusable delegation set.</p> </li> <li> <p>Recreate hosted zones, and reduce the TTL to 60 seconds or less.</p> </li> <li> <p>Recreate resource record sets in the new hosted zones.</p> </li> <li> <p>Change the registrar's name servers to use the name servers for the new hosted zones.</p> </li> <li> <p>Monitor traffic for the website or application.</p> </li> <li> <p>Change TTLs back to their original values.</p> </li> </ol> <p>If you want to migrate existing hosted zones to use a reusable delegation set, the existing hosted zones can't use any of the name servers that are assigned to the reusable delegation set. If one or more hosted zones do use one or more name servers that are assigned to the reusable delegation set, you can do one of the following:</p> <ul> <li> <p>For small numbers of hosted zonesâup to a few hundredâit's relatively easy to create reusable delegation sets until you get one that has four name servers that don't overlap with any of the name servers in your hosted zones.</p> </li> <li> <p>For larger numbers of hosted zones, the easiest solution is to use more than one reusable delegation set.</p> </li> <li> <p>For larger numbers of hosted zones, you can also migrate hosted zones that have overlapping name servers to hosted zones that don't have overlapping name servers, then migrate the hosted zones again to use the reusable delegation set.</p> </li> </ul>\"\
    },\
    \"CreateTrafficPolicy\":{\
      \"name\":\"CreateTrafficPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/trafficpolicy\",\
        \"responseCode\":201\
      },\
      \"input\":{\
        \"shape\":\"CreateTrafficPolicyRequest\",\
        \"locationName\":\"CreateTrafficPolicyRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"CreateTrafficPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"TooManyTrafficPolicies\"},\
        {\"shape\":\"TrafficPolicyAlreadyExists\"},\
        {\"shape\":\"InvalidTrafficPolicyDocument\"}\
      ],\
      \"documentation\":\"<p>Creates a traffic policy, which you use to create multiple DNS resource record sets for one domain name (such as example.com) or one subdomain name (such as www.example.com).</p>\"\
    },\
    \"CreateTrafficPolicyInstance\":{\
      \"name\":\"CreateTrafficPolicyInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/trafficpolicyinstance\",\
        \"responseCode\":201\
      },\
      \"input\":{\
        \"shape\":\"CreateTrafficPolicyInstanceRequest\",\
        \"locationName\":\"CreateTrafficPolicyInstanceRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"CreateTrafficPolicyInstanceResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchHostedZone\"},\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"TooManyTrafficPolicyInstances\"},\
        {\"shape\":\"NoSuchTrafficPolicy\"},\
        {\"shape\":\"TrafficPolicyInstanceAlreadyExists\"}\
      ],\
      \"documentation\":\"<p>Creates resource record sets in a specified hosted zone based on the settings in a specified traffic policy version. In addition, <code>CreateTrafficPolicyInstance</code> associates the resource record sets with a specified domain name (such as example.com) or subdomain name (such as www.example.com). Amazon Route 53 responds to DNS queries for the domain or subdomain name by using the resource record sets that <code>CreateTrafficPolicyInstance</code> created.</p>\"\
    },\
    \"CreateTrafficPolicyVersion\":{\
      \"name\":\"CreateTrafficPolicyVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/trafficpolicy/{Id}\",\
        \"responseCode\":201\
      },\
      \"input\":{\
        \"shape\":\"CreateTrafficPolicyVersionRequest\",\
        \"locationName\":\"CreateTrafficPolicyVersionRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"CreateTrafficPolicyVersionResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchTrafficPolicy\"},\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"TooManyTrafficPolicyVersionsForCurrentPolicy\"},\
        {\"shape\":\"ConcurrentModification\"},\
        {\"shape\":\"InvalidTrafficPolicyDocument\"}\
      ],\
      \"documentation\":\"<p>Creates a new version of an existing traffic policy. When you create a new version of a traffic policy, you specify the ID of the traffic policy that you want to update and a JSON-formatted document that describes the new version. You use traffic policies to create multiple DNS resource record sets for one domain name (such as example.com) or one subdomain name (such as www.example.com). You can create a maximum of 1000 versions of a traffic policy. If you reach the limit and need to create another version, you'll need to start a new traffic policy.</p>\"\
    },\
    \"CreateVPCAssociationAuthorization\":{\
      \"name\":\"CreateVPCAssociationAuthorization\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/hostedzone/{Id}/authorizevpcassociation\"\
      },\
      \"input\":{\
        \"shape\":\"CreateVPCAssociationAuthorizationRequest\",\
        \"locationName\":\"CreateVPCAssociationAuthorizationRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"CreateVPCAssociationAuthorizationResponse\"},\
      \"errors\":[\
        {\"shape\":\"ConcurrentModification\"},\
        {\"shape\":\"TooManyVPCAssociationAuthorizations\"},\
        {\"shape\":\"NoSuchHostedZone\"},\
        {\"shape\":\"InvalidVPCId\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Authorizes the AWS account that created a specified VPC to submit an <code>AssociateVPCWithHostedZone</code> request to associate the VPC with a specified hosted zone that was created by a different account. To submit a <code>CreateVPCAssociationAuthorization</code> request, you must use the account that created the hosted zone. After you authorize the association, use the account that created the VPC to submit an <code>AssociateVPCWithHostedZone</code> request.</p> <note> <p>If you want to associate multiple VPCs that you created by using one account with a hosted zone that you created by using a different account, you must submit one authorization request for each VPC.</p> </note>\"\
    },\
    \"DeleteHealthCheck\":{\
      \"name\":\"DeleteHealthCheck\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2013-04-01/healthcheck/{HealthCheckId}\"\
      },\
      \"input\":{\"shape\":\"DeleteHealthCheckRequest\"},\
      \"output\":{\"shape\":\"DeleteHealthCheckResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchHealthCheck\"},\
        {\"shape\":\"HealthCheckInUse\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Deletes a health check.</p> <important> <p>Amazon Route 53 does not prevent you from deleting a health check even if the health check is associated with one or more resource record sets. If you delete a health check and you don't update the associated resource record sets, the future status of the health check can't be predicted and may change. This will affect the routing of DNS queries for your DNS failover configuration. For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/health-checks-creating-deleting.html#health-checks-deleting.html\\\">Replacing and Deleting Health Checks</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> </important> <p>If you're using AWS Cloud Map and you configured Cloud Map to create a Route 53 health check when you register an instance, you can't use the Route 53 <code>DeleteHealthCheck</code> command to delete the health check. The health check is deleted automatically when you deregister the instance; there can be a delay of several hours before the health check is deleted from Route 53. </p>\"\
    },\
    \"DeleteHostedZone\":{\
      \"name\":\"DeleteHostedZone\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2013-04-01/hostedzone/{Id}\"\
      },\
      \"input\":{\"shape\":\"DeleteHostedZoneRequest\"},\
      \"output\":{\"shape\":\"DeleteHostedZoneResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchHostedZone\"},\
        {\"shape\":\"HostedZoneNotEmpty\"},\
        {\"shape\":\"PriorRequestNotComplete\"},\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"InvalidDomainName\"}\
      ],\
      \"documentation\":\"<p>Deletes a hosted zone.</p> <p>If the hosted zone was created by another service, such as AWS Cloud Map, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DeleteHostedZone.html#delete-public-hosted-zone-created-by-another-service\\\">Deleting Public Hosted Zones That Were Created by Another Service</a> in the <i>Amazon Route 53 Developer Guide</i> for information about how to delete it. (The process is the same for public and private hosted zones that were created by another service.)</p> <p>If you want to keep your domain registration but you want to stop routing internet traffic to your website or web application, we recommend that you delete resource record sets in the hosted zone instead of deleting the hosted zone.</p> <important> <p>If you delete a hosted zone, you can't undelete it. You must create a new hosted zone and update the name servers for your domain registration, which can require up to 48 hours to take effect. (If you delegated responsibility for a subdomain to a hosted zone and you delete the child hosted zone, you must update the name servers in the parent hosted zone.) In addition, if you delete a hosted zone, someone could hijack the domain and route traffic to their own resources using your domain name.</p> </important> <p>If you want to avoid the monthly charge for the hosted zone, you can transfer DNS service for the domain to a free DNS service. When you transfer DNS service, you have to update the name servers for the domain registration. If the domain is registered with Route 53, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_UpdateDomainNameservers.html\\\">UpdateDomainNameservers</a> for information about how to replace Route 53 name servers with name servers for the new DNS service. If the domain is registered with another registrar, use the method provided by the registrar to update name servers for the domain registration. For more information, perform an internet search on \\\"free DNS service.\\\"</p> <p>You can delete a hosted zone only if it contains only the default SOA record and NS resource record sets. If the hosted zone contains other resource record sets, you must delete them before you can delete the hosted zone. If you try to delete a hosted zone that contains other resource record sets, the request fails, and Route 53 returns a <code>HostedZoneNotEmpty</code> error. For information about deleting records from your hosted zone, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_ChangeResourceRecordSets.html\\\">ChangeResourceRecordSets</a>.</p> <p>To verify that the hosted zone has been deleted, do one of the following:</p> <ul> <li> <p>Use the <code>GetHostedZone</code> action to request information about the hosted zone.</p> </li> <li> <p>Use the <code>ListHostedZones</code> action to get a list of the hosted zones associated with the current AWS account.</p> </li> </ul>\"\
    },\
    \"DeleteQueryLoggingConfig\":{\
      \"name\":\"DeleteQueryLoggingConfig\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2013-04-01/queryloggingconfig/{Id}\"\
      },\
      \"input\":{\"shape\":\"DeleteQueryLoggingConfigRequest\"},\
      \"output\":{\"shape\":\"DeleteQueryLoggingConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"ConcurrentModification\"},\
        {\"shape\":\"NoSuchQueryLoggingConfig\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Deletes a configuration for DNS query logging. If you delete a configuration, Amazon Route 53 stops sending query logs to CloudWatch Logs. Route 53 doesn't delete any logs that are already in CloudWatch Logs.</p> <p>For more information about DNS query logs, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateQueryLoggingConfig.html\\\">CreateQueryLoggingConfig</a>.</p>\"\
    },\
    \"DeleteReusableDelegationSet\":{\
      \"name\":\"DeleteReusableDelegationSet\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2013-04-01/delegationset/{Id}\"\
      },\
      \"input\":{\"shape\":\"DeleteReusableDelegationSetRequest\"},\
      \"output\":{\"shape\":\"DeleteReusableDelegationSetResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchDelegationSet\"},\
        {\"shape\":\"DelegationSetInUse\"},\
        {\"shape\":\"DelegationSetNotReusable\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Deletes a reusable delegation set.</p> <important> <p>You can delete a reusable delegation set only if it isn't associated with any hosted zones.</p> </important> <p>To verify that the reusable delegation set is not associated with any hosted zones, submit a <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetReusableDelegationSet.html\\\">GetReusableDelegationSet</a> request and specify the ID of the reusable delegation set that you want to delete.</p>\"\
    },\
    \"DeleteTrafficPolicy\":{\
      \"name\":\"DeleteTrafficPolicy\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2013-04-01/trafficpolicy/{Id}/{Version}\"\
      },\
      \"input\":{\"shape\":\"DeleteTrafficPolicyRequest\"},\
      \"output\":{\"shape\":\"DeleteTrafficPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchTrafficPolicy\"},\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"TrafficPolicyInUse\"},\
        {\"shape\":\"ConcurrentModification\"}\
      ],\
      \"documentation\":\"<p>Deletes a traffic policy.</p>\"\
    },\
    \"DeleteTrafficPolicyInstance\":{\
      \"name\":\"DeleteTrafficPolicyInstance\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2013-04-01/trafficpolicyinstance/{Id}\"\
      },\
      \"input\":{\"shape\":\"DeleteTrafficPolicyInstanceRequest\"},\
      \"output\":{\"shape\":\"DeleteTrafficPolicyInstanceResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchTrafficPolicyInstance\"},\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"PriorRequestNotComplete\"}\
      ],\
      \"documentation\":\"<p>Deletes a traffic policy instance and all of the resource record sets that Amazon Route 53 created when you created the instance.</p> <note> <p>In the Route 53 console, traffic policy instances are known as policy records.</p> </note>\"\
    },\
    \"DeleteVPCAssociationAuthorization\":{\
      \"name\":\"DeleteVPCAssociationAuthorization\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/hostedzone/{Id}/deauthorizevpcassociation\"\
      },\
      \"input\":{\
        \"shape\":\"DeleteVPCAssociationAuthorizationRequest\",\
        \"locationName\":\"DeleteVPCAssociationAuthorizationRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"DeleteVPCAssociationAuthorizationResponse\"},\
      \"errors\":[\
        {\"shape\":\"ConcurrentModification\"},\
        {\"shape\":\"VPCAssociationAuthorizationNotFound\"},\
        {\"shape\":\"NoSuchHostedZone\"},\
        {\"shape\":\"InvalidVPCId\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Removes authorization to submit an <code>AssociateVPCWithHostedZone</code> request to associate a specified VPC with a hosted zone that was created by a different account. You must use the account that created the hosted zone to submit a <code>DeleteVPCAssociationAuthorization</code> request.</p> <important> <p>Sending this request only prevents the AWS account that created the VPC from associating the VPC with the Amazon Route 53 hosted zone in the future. If the VPC is already associated with the hosted zone, <code>DeleteVPCAssociationAuthorization</code> won't disassociate the VPC from the hosted zone. If you want to delete an existing association, use <code>DisassociateVPCFromHostedZone</code>.</p> </important>\"\
    },\
    \"DisassociateVPCFromHostedZone\":{\
      \"name\":\"DisassociateVPCFromHostedZone\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/hostedzone/{Id}/disassociatevpc\"\
      },\
      \"input\":{\
        \"shape\":\"DisassociateVPCFromHostedZoneRequest\",\
        \"locationName\":\"DisassociateVPCFromHostedZoneRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"DisassociateVPCFromHostedZoneResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchHostedZone\"},\
        {\"shape\":\"InvalidVPCId\"},\
        {\"shape\":\"VPCAssociationNotFound\"},\
        {\"shape\":\"LastVPCAssociation\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Disassociates an Amazon Virtual Private Cloud (Amazon VPC) from an Amazon Route 53 private hosted zone. Note the following:</p> <ul> <li> <p>You can't disassociate the last Amazon VPC from a private hosted zone.</p> </li> <li> <p>You can't convert a private hosted zone into a public hosted zone.</p> </li> <li> <p>You can submit a <code>DisassociateVPCFromHostedZone</code> request using either the account that created the hosted zone or the account that created the Amazon VPC.</p> </li> <li> <p>Some services, such as AWS Cloud Map and Amazon Elastic File System (Amazon EFS) automatically create hosted zones and associate VPCs with the hosted zones. A service can create a hosted zone using your account or using its own account. You can disassociate a VPC from a hosted zone only if the service created the hosted zone using your account.</p> <p>When you run <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_ListHostedZonesByVPC.html\\\">DisassociateVPCFromHostedZone</a>, if the hosted zone has a value for <code>OwningAccount</code>, you can use <code>DisassociateVPCFromHostedZone</code>. If the hosted zone has a value for <code>OwningService</code>, you can't use <code>DisassociateVPCFromHostedZone</code>.</p> </li> </ul>\"\
    },\
    \"GetAccountLimit\":{\
      \"name\":\"GetAccountLimit\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/accountlimit/{Type}\"\
      },\
      \"input\":{\"shape\":\"GetAccountLimitRequest\"},\
      \"output\":{\"shape\":\"GetAccountLimitResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Gets the specified limit for the current account, for example, the maximum number of health checks that you can create using the account.</p> <p>For the default limit, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html\\\">Limits</a> in the <i>Amazon Route 53 Developer Guide</i>. To request a higher limit, <a href=\\\"https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&amp;limitType=service-code-route53\\\">open a case</a>.</p> <note> <p>You can also view account limits in AWS Trusted Advisor. Sign in to the AWS Management Console and open the Trusted Advisor console at <a href=\\\"https://console.aws.amazon.com/trustedadvisor\\\">https://console.aws.amazon.com/trustedadvisor/</a>. Then choose <b>Service limits</b> in the navigation pane.</p> </note>\"\
    },\
    \"GetChange\":{\
      \"name\":\"GetChange\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/change/{Id}\"\
      },\
      \"input\":{\"shape\":\"GetChangeRequest\"},\
      \"output\":{\"shape\":\"GetChangeResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchChange\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Returns the current status of a change batch request. The status is one of the following values:</p> <ul> <li> <p> <code>PENDING</code> indicates that the changes in this request have not propagated to all Amazon Route 53 DNS servers. This is the initial status of all change batch requests.</p> </li> <li> <p> <code>INSYNC</code> indicates that the changes have propagated to all Route 53 DNS servers. </p> </li> </ul>\"\
    },\
    \"GetCheckerIpRanges\":{\
      \"name\":\"GetCheckerIpRanges\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/checkeripranges\"\
      },\
      \"input\":{\"shape\":\"GetCheckerIpRangesRequest\"},\
      \"output\":{\"shape\":\"GetCheckerIpRangesResponse\"},\
      \"documentation\":\"<important> <p> <code>GetCheckerIpRanges</code> still works, but we recommend that you download ip-ranges.json, which includes IP address ranges for all AWS services. For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/route-53-ip-addresses.html\\\">IP Address Ranges of Amazon Route 53 Servers</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> </important>\"\
    },\
    \"GetGeoLocation\":{\
      \"name\":\"GetGeoLocation\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/geolocation\"\
      },\
      \"input\":{\"shape\":\"GetGeoLocationRequest\"},\
      \"output\":{\"shape\":\"GetGeoLocationResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchGeoLocation\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Gets information about whether a specified geographic location is supported for Amazon Route 53 geolocation resource record sets.</p> <p>Use the following syntax to determine whether a continent is supported for geolocation:</p> <p> <code>GET /2013-04-01/geolocation?continentcode=<i>two-letter abbreviation for a continent</i> </code> </p> <p>Use the following syntax to determine whether a country is supported for geolocation:</p> <p> <code>GET /2013-04-01/geolocation?countrycode=<i>two-character country code</i> </code> </p> <p>Use the following syntax to determine whether a subdivision of a country is supported for geolocation:</p> <p> <code>GET /2013-04-01/geolocation?countrycode=<i>two-character country code</i>&amp;subdivisioncode=<i>subdivision code</i> </code> </p>\"\
    },\
    \"GetHealthCheck\":{\
      \"name\":\"GetHealthCheck\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/healthcheck/{HealthCheckId}\"\
      },\
      \"input\":{\"shape\":\"GetHealthCheckRequest\"},\
      \"output\":{\"shape\":\"GetHealthCheckResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchHealthCheck\"},\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"IncompatibleVersion\"}\
      ],\
      \"documentation\":\"<p>Gets information about a specified health check.</p>\"\
    },\
    \"GetHealthCheckCount\":{\
      \"name\":\"GetHealthCheckCount\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/healthcheckcount\"\
      },\
      \"input\":{\"shape\":\"GetHealthCheckCountRequest\"},\
      \"output\":{\"shape\":\"GetHealthCheckCountResponse\"},\
      \"documentation\":\"<p>Retrieves the number of health checks that are associated with the current AWS account.</p>\"\
    },\
    \"GetHealthCheckLastFailureReason\":{\
      \"name\":\"GetHealthCheckLastFailureReason\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/healthcheck/{HealthCheckId}/lastfailurereason\"\
      },\
      \"input\":{\"shape\":\"GetHealthCheckLastFailureReasonRequest\"},\
      \"output\":{\"shape\":\"GetHealthCheckLastFailureReasonResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchHealthCheck\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Gets the reason that a specified health check failed most recently.</p>\"\
    },\
    \"GetHealthCheckStatus\":{\
      \"name\":\"GetHealthCheckStatus\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/healthcheck/{HealthCheckId}/status\"\
      },\
      \"input\":{\"shape\":\"GetHealthCheckStatusRequest\"},\
      \"output\":{\"shape\":\"GetHealthCheckStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchHealthCheck\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Gets status of a specified health check. </p>\"\
    },\
    \"GetHostedZone\":{\
      \"name\":\"GetHostedZone\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/hostedzone/{Id}\"\
      },\
      \"input\":{\"shape\":\"GetHostedZoneRequest\"},\
      \"output\":{\"shape\":\"GetHostedZoneResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchHostedZone\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Gets information about a specified hosted zone including the four name servers assigned to the hosted zone.</p>\"\
    },\
    \"GetHostedZoneCount\":{\
      \"name\":\"GetHostedZoneCount\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/hostedzonecount\"\
      },\
      \"input\":{\"shape\":\"GetHostedZoneCountRequest\"},\
      \"output\":{\"shape\":\"GetHostedZoneCountResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Retrieves the number of hosted zones that are associated with the current AWS account.</p>\"\
    },\
    \"GetHostedZoneLimit\":{\
      \"name\":\"GetHostedZoneLimit\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/hostedzonelimit/{Id}/{Type}\"\
      },\
      \"input\":{\"shape\":\"GetHostedZoneLimitRequest\"},\
      \"output\":{\"shape\":\"GetHostedZoneLimitResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchHostedZone\"},\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"HostedZoneNotPrivate\"}\
      ],\
      \"documentation\":\"<p>Gets the specified limit for a specified hosted zone, for example, the maximum number of records that you can create in the hosted zone. </p> <p>For the default limit, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html\\\">Limits</a> in the <i>Amazon Route 53 Developer Guide</i>. To request a higher limit, <a href=\\\"https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&amp;limitType=service-code-route53\\\">open a case</a>.</p>\"\
    },\
    \"GetQueryLoggingConfig\":{\
      \"name\":\"GetQueryLoggingConfig\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/queryloggingconfig/{Id}\"\
      },\
      \"input\":{\"shape\":\"GetQueryLoggingConfigRequest\"},\
      \"output\":{\"shape\":\"GetQueryLoggingConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchQueryLoggingConfig\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Gets information about a specified configuration for DNS query logging.</p> <p>For more information about DNS query logs, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateQueryLoggingConfig.html\\\">CreateQueryLoggingConfig</a> and <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/query-logs.html\\\">Logging DNS Queries</a>.</p>\"\
    },\
    \"GetReusableDelegationSet\":{\
      \"name\":\"GetReusableDelegationSet\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/delegationset/{Id}\"\
      },\
      \"input\":{\"shape\":\"GetReusableDelegationSetRequest\"},\
      \"output\":{\"shape\":\"GetReusableDelegationSetResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchDelegationSet\"},\
        {\"shape\":\"DelegationSetNotReusable\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Retrieves information about a specified reusable delegation set, including the four name servers that are assigned to the delegation set.</p>\"\
    },\
    \"GetReusableDelegationSetLimit\":{\
      \"name\":\"GetReusableDelegationSetLimit\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/reusabledelegationsetlimit/{Id}/{Type}\"\
      },\
      \"input\":{\"shape\":\"GetReusableDelegationSetLimitRequest\"},\
      \"output\":{\"shape\":\"GetReusableDelegationSetLimitResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"NoSuchDelegationSet\"}\
      ],\
      \"documentation\":\"<p>Gets the maximum number of hosted zones that you can associate with the specified reusable delegation set.</p> <p>For the default limit, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html\\\">Limits</a> in the <i>Amazon Route 53 Developer Guide</i>. To request a higher limit, <a href=\\\"https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&amp;limitType=service-code-route53\\\">open a case</a>.</p>\"\
    },\
    \"GetTrafficPolicy\":{\
      \"name\":\"GetTrafficPolicy\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/trafficpolicy/{Id}/{Version}\"\
      },\
      \"input\":{\"shape\":\"GetTrafficPolicyRequest\"},\
      \"output\":{\"shape\":\"GetTrafficPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchTrafficPolicy\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Gets information about a specific traffic policy version.</p>\"\
    },\
    \"GetTrafficPolicyInstance\":{\
      \"name\":\"GetTrafficPolicyInstance\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/trafficpolicyinstance/{Id}\"\
      },\
      \"input\":{\"shape\":\"GetTrafficPolicyInstanceRequest\"},\
      \"output\":{\"shape\":\"GetTrafficPolicyInstanceResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchTrafficPolicyInstance\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Gets information about a specified traffic policy instance.</p> <note> <p>After you submit a <code>CreateTrafficPolicyInstance</code> or an <code>UpdateTrafficPolicyInstance</code> request, there's a brief delay while Amazon Route 53 creates the resource record sets that are specified in the traffic policy definition. For more information, see the <code>State</code> response element.</p> </note> <note> <p>In the Route 53 console, traffic policy instances are known as policy records.</p> </note>\"\
    },\
    \"GetTrafficPolicyInstanceCount\":{\
      \"name\":\"GetTrafficPolicyInstanceCount\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/trafficpolicyinstancecount\"\
      },\
      \"input\":{\"shape\":\"GetTrafficPolicyInstanceCountRequest\"},\
      \"output\":{\"shape\":\"GetTrafficPolicyInstanceCountResponse\"},\
      \"documentation\":\"<p>Gets the number of traffic policy instances that are associated with the current AWS account.</p>\"\
    },\
    \"ListGeoLocations\":{\
      \"name\":\"ListGeoLocations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/geolocations\"\
      },\
      \"input\":{\"shape\":\"ListGeoLocationsRequest\"},\
      \"output\":{\"shape\":\"ListGeoLocationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Retrieves a list of supported geographic locations.</p> <p>Countries are listed first, and continents are listed last. If Amazon Route 53 supports subdivisions for a country (for example, states or provinces), the subdivisions for that country are listed in alphabetical order immediately after the corresponding country.</p> <p>For a list of supported geolocation codes, see the <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_GeoLocation.html\\\">GeoLocation</a> data type.</p>\"\
    },\
    \"ListHealthChecks\":{\
      \"name\":\"ListHealthChecks\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/healthcheck\"\
      },\
      \"input\":{\"shape\":\"ListHealthChecksRequest\"},\
      \"output\":{\"shape\":\"ListHealthChecksResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"IncompatibleVersion\"}\
      ],\
      \"documentation\":\"<p>Retrieve a list of the health checks that are associated with the current AWS account. </p>\"\
    },\
    \"ListHostedZones\":{\
      \"name\":\"ListHostedZones\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/hostedzone\"\
      },\
      \"input\":{\"shape\":\"ListHostedZonesRequest\"},\
      \"output\":{\"shape\":\"ListHostedZonesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"NoSuchDelegationSet\"},\
        {\"shape\":\"DelegationSetNotReusable\"}\
      ],\
      \"documentation\":\"<p>Retrieves a list of the public and private hosted zones that are associated with the current AWS account. The response includes a <code>HostedZones</code> child element for each hosted zone.</p> <p>Amazon Route 53 returns a maximum of 100 items in each response. If you have a lot of hosted zones, you can use the <code>maxitems</code> parameter to list them in groups of up to 100.</p>\"\
    },\
    \"ListHostedZonesByName\":{\
      \"name\":\"ListHostedZonesByName\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/hostedzonesbyname\"\
      },\
      \"input\":{\"shape\":\"ListHostedZonesByNameRequest\"},\
      \"output\":{\"shape\":\"ListHostedZonesByNameResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"InvalidDomainName\"}\
      ],\
      \"documentation\":\"<p>Retrieves a list of your hosted zones in lexicographic order. The response includes a <code>HostedZones</code> child element for each hosted zone created by the current AWS account. </p> <p> <code>ListHostedZonesByName</code> sorts hosted zones by name with the labels reversed. For example:</p> <p> <code>com.example.www.</code> </p> <p>Note the trailing dot, which can change the sort order in some circumstances.</p> <p>If the domain name includes escape characters or Punycode, <code>ListHostedZonesByName</code> alphabetizes the domain name using the escaped or Punycoded value, which is the format that Amazon Route 53 saves in its database. For example, to create a hosted zone for exÃ¤mple.com, you specify ex\\\\344mple.com for the domain name. <code>ListHostedZonesByName</code> alphabetizes it as:</p> <p> <code>com.ex\\\\344mple.</code> </p> <p>The labels are reversed and alphabetized using the escaped value. For more information about valid domain name formats, including internationalized domain names, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html\\\">DNS Domain Name Format</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>Route 53 returns up to 100 items in each response. If you have a lot of hosted zones, use the <code>MaxItems</code> parameter to list them in groups of up to 100. The response includes values that help navigate from one group of <code>MaxItems</code> hosted zones to the next:</p> <ul> <li> <p>The <code>DNSName</code> and <code>HostedZoneId</code> elements in the response contain the values, if any, specified for the <code>dnsname</code> and <code>hostedzoneid</code> parameters in the request that produced the current response.</p> </li> <li> <p>The <code>MaxItems</code> element in the response contains the value, if any, that you specified for the <code>maxitems</code> parameter in the request that produced the current response.</p> </li> <li> <p>If the value of <code>IsTruncated</code> in the response is true, there are more hosted zones associated with the current AWS account. </p> <p>If <code>IsTruncated</code> is false, this response includes the last hosted zone that is associated with the current account. The <code>NextDNSName</code> element and <code>NextHostedZoneId</code> elements are omitted from the response.</p> </li> <li> <p>The <code>NextDNSName</code> and <code>NextHostedZoneId</code> elements in the response contain the domain name and the hosted zone ID of the next hosted zone that is associated with the current AWS account. If you want to list more hosted zones, make another call to <code>ListHostedZonesByName</code>, and specify the value of <code>NextDNSName</code> and <code>NextHostedZoneId</code> in the <code>dnsname</code> and <code>hostedzoneid</code> parameters, respectively.</p> </li> </ul>\"\
    },\
    \"ListHostedZonesByVPC\":{\
      \"name\":\"ListHostedZonesByVPC\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/hostedzonesbyvpc\"\
      },\
      \"input\":{\"shape\":\"ListHostedZonesByVPCRequest\"},\
      \"output\":{\"shape\":\"ListHostedZonesByVPCResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"InvalidPaginationToken\"}\
      ],\
      \"documentation\":\"<p>Lists all the private hosted zones that a specified VPC is associated with, regardless of which AWS account or AWS service owns the hosted zones. The <code>HostedZoneOwner</code> structure in the response contains one of the following values:</p> <ul> <li> <p>An <code>OwningAccount</code> element, which contains the account number of either the current AWS account or another AWS account. Some services, such as AWS Cloud Map, create hosted zones using the current account. </p> </li> <li> <p>An <code>OwningService</code> element, which identifies the AWS service that created and owns the hosted zone. For example, if a hosted zone was created by Amazon Elastic File System (Amazon EFS), the value of <code>Owner</code> is <code>efs.amazonaws.com</code>. </p> </li> </ul>\"\
    },\
    \"ListQueryLoggingConfigs\":{\
      \"name\":\"ListQueryLoggingConfigs\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/queryloggingconfig\"\
      },\
      \"input\":{\"shape\":\"ListQueryLoggingConfigsRequest\"},\
      \"output\":{\"shape\":\"ListQueryLoggingConfigsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"InvalidPaginationToken\"},\
        {\"shape\":\"NoSuchHostedZone\"}\
      ],\
      \"documentation\":\"<p>Lists the configurations for DNS query logging that are associated with the current AWS account or the configuration that is associated with a specified hosted zone.</p> <p>For more information about DNS query logs, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateQueryLoggingConfig.html\\\">CreateQueryLoggingConfig</a>. Additional information, including the format of DNS query logs, appears in <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/query-logs.html\\\">Logging DNS Queries</a> in the <i>Amazon Route 53 Developer Guide</i>.</p>\"\
    },\
    \"ListResourceRecordSets\":{\
      \"name\":\"ListResourceRecordSets\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/hostedzone/{Id}/rrset\"\
      },\
      \"input\":{\"shape\":\"ListResourceRecordSetsRequest\"},\
      \"output\":{\"shape\":\"ListResourceRecordSetsResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchHostedZone\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Lists the resource record sets in a specified hosted zone.</p> <p> <code>ListResourceRecordSets</code> returns up to 100 resource record sets at a time in ASCII order, beginning at a position specified by the <code>name</code> and <code>type</code> elements.</p> <p> <b>Sort order</b> </p> <p> <code>ListResourceRecordSets</code> sorts results first by DNS name with the labels reversed, for example:</p> <p> <code>com.example.www.</code> </p> <p>Note the trailing dot, which can change the sort order when the record name contains characters that appear before <code>.</code> (decimal 46) in the ASCII table. These characters include the following: <code>! \\\" # $ % &amp; ' ( ) * + , -</code> </p> <p>When multiple records have the same DNS name, <code>ListResourceRecordSets</code> sorts results by the record type.</p> <p> <b>Specifying where to start listing records</b> </p> <p>You can use the name and type elements to specify the resource record set that the list begins with:</p> <dl> <dt>If you do not specify Name or Type</dt> <dd> <p>The results begin with the first resource record set that the hosted zone contains.</p> </dd> <dt>If you specify Name but not Type</dt> <dd> <p>The results begin with the first resource record set in the list whose name is greater than or equal to <code>Name</code>.</p> </dd> <dt>If you specify Type but not Name</dt> <dd> <p>Amazon Route 53 returns the <code>InvalidInput</code> error.</p> </dd> <dt>If you specify both Name and Type</dt> <dd> <p>The results begin with the first resource record set in the list whose name is greater than or equal to <code>Name</code>, and whose type is greater than or equal to <code>Type</code>.</p> </dd> </dl> <p> <b>Resource record sets that are PENDING</b> </p> <p>This action returns the most current version of the records. This includes records that are <code>PENDING</code>, and that are not yet available on all Route 53 DNS servers.</p> <p> <b>Changing resource record sets</b> </p> <p>To ensure that you get an accurate listing of the resource record sets for a hosted zone at a point in time, do not submit a <code>ChangeResourceRecordSets</code> request while you're paging through the results of a <code>ListResourceRecordSets</code> request. If you do, some pages may display results without the latest changes while other pages display results with the latest changes.</p> <p> <b>Displaying the next page of results</b> </p> <p>If a <code>ListResourceRecordSets</code> command returns more than one page of results, the value of <code>IsTruncated</code> is <code>true</code>. To display the next page of results, get the values of <code>NextRecordName</code>, <code>NextRecordType</code>, and <code>NextRecordIdentifier</code> (if any) from the response. Then submit another <code>ListResourceRecordSets</code> request, and specify those values for <code>StartRecordName</code>, <code>StartRecordType</code>, and <code>StartRecordIdentifier</code>.</p>\"\
    },\
    \"ListReusableDelegationSets\":{\
      \"name\":\"ListReusableDelegationSets\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/delegationset\"\
      },\
      \"input\":{\"shape\":\"ListReusableDelegationSetsRequest\"},\
      \"output\":{\"shape\":\"ListReusableDelegationSetsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Retrieves a list of the reusable delegation sets that are associated with the current AWS account.</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/tags/{ResourceType}/{ResourceId}\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"NoSuchHealthCheck\"},\
        {\"shape\":\"NoSuchHostedZone\"},\
        {\"shape\":\"PriorRequestNotComplete\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists tags for one health check or hosted zone. </p> <p>For information about using tags for cost allocation, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html\\\">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>\"\
    },\
    \"ListTagsForResources\":{\
      \"name\":\"ListTagsForResources\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/tags/{ResourceType}\"\
      },\
      \"input\":{\
        \"shape\":\"ListTagsForResourcesRequest\",\
        \"locationName\":\"ListTagsForResourcesRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"ListTagsForResourcesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"NoSuchHealthCheck\"},\
        {\"shape\":\"NoSuchHostedZone\"},\
        {\"shape\":\"PriorRequestNotComplete\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists tags for up to 10 health checks or hosted zones.</p> <p>For information about using tags for cost allocation, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html\\\">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>\"\
    },\
    \"ListTrafficPolicies\":{\
      \"name\":\"ListTrafficPolicies\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/trafficpolicies\"\
      },\
      \"input\":{\"shape\":\"ListTrafficPoliciesRequest\"},\
      \"output\":{\"shape\":\"ListTrafficPoliciesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Gets information about the latest version for every traffic policy that is associated with the current AWS account. Policies are listed in the order that they were created in. </p>\"\
    },\
    \"ListTrafficPolicyInstances\":{\
      \"name\":\"ListTrafficPolicyInstances\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/trafficpolicyinstances\"\
      },\
      \"input\":{\"shape\":\"ListTrafficPolicyInstancesRequest\"},\
      \"output\":{\"shape\":\"ListTrafficPolicyInstancesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"NoSuchTrafficPolicyInstance\"}\
      ],\
      \"documentation\":\"<p>Gets information about the traffic policy instances that you created by using the current AWS account.</p> <note> <p>After you submit an <code>UpdateTrafficPolicyInstance</code> request, there's a brief delay while Amazon Route 53 creates the resource record sets that are specified in the traffic policy definition. For more information, see the <code>State</code> response element.</p> </note> <p>Route 53 returns a maximum of 100 items in each response. If you have a lot of traffic policy instances, you can use the <code>MaxItems</code> parameter to list them in groups of up to 100.</p>\"\
    },\
    \"ListTrafficPolicyInstancesByHostedZone\":{\
      \"name\":\"ListTrafficPolicyInstancesByHostedZone\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/trafficpolicyinstances/hostedzone\"\
      },\
      \"input\":{\"shape\":\"ListTrafficPolicyInstancesByHostedZoneRequest\"},\
      \"output\":{\"shape\":\"ListTrafficPolicyInstancesByHostedZoneResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"NoSuchTrafficPolicyInstance\"},\
        {\"shape\":\"NoSuchHostedZone\"}\
      ],\
      \"documentation\":\"<p>Gets information about the traffic policy instances that you created in a specified hosted zone.</p> <note> <p>After you submit a <code>CreateTrafficPolicyInstance</code> or an <code>UpdateTrafficPolicyInstance</code> request, there's a brief delay while Amazon Route 53 creates the resource record sets that are specified in the traffic policy definition. For more information, see the <code>State</code> response element.</p> </note> <p>Route 53 returns a maximum of 100 items in each response. If you have a lot of traffic policy instances, you can use the <code>MaxItems</code> parameter to list them in groups of up to 100.</p>\"\
    },\
    \"ListTrafficPolicyInstancesByPolicy\":{\
      \"name\":\"ListTrafficPolicyInstancesByPolicy\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/trafficpolicyinstances/trafficpolicy\"\
      },\
      \"input\":{\"shape\":\"ListTrafficPolicyInstancesByPolicyRequest\"},\
      \"output\":{\"shape\":\"ListTrafficPolicyInstancesByPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"NoSuchTrafficPolicyInstance\"},\
        {\"shape\":\"NoSuchTrafficPolicy\"}\
      ],\
      \"documentation\":\"<p>Gets information about the traffic policy instances that you created by using a specify traffic policy version.</p> <note> <p>After you submit a <code>CreateTrafficPolicyInstance</code> or an <code>UpdateTrafficPolicyInstance</code> request, there's a brief delay while Amazon Route 53 creates the resource record sets that are specified in the traffic policy definition. For more information, see the <code>State</code> response element.</p> </note> <p>Route 53 returns a maximum of 100 items in each response. If you have a lot of traffic policy instances, you can use the <code>MaxItems</code> parameter to list them in groups of up to 100.</p>\"\
    },\
    \"ListTrafficPolicyVersions\":{\
      \"name\":\"ListTrafficPolicyVersions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/trafficpolicies/{Id}/versions\"\
      },\
      \"input\":{\"shape\":\"ListTrafficPolicyVersionsRequest\"},\
      \"output\":{\"shape\":\"ListTrafficPolicyVersionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"NoSuchTrafficPolicy\"}\
      ],\
      \"documentation\":\"<p>Gets information about all of the versions for a specified traffic policy.</p> <p>Traffic policy versions are listed in numerical order by <code>VersionNumber</code>.</p>\"\
    },\
    \"ListVPCAssociationAuthorizations\":{\
      \"name\":\"ListVPCAssociationAuthorizations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/hostedzone/{Id}/authorizevpcassociation\"\
      },\
      \"input\":{\"shape\":\"ListVPCAssociationAuthorizationsRequest\"},\
      \"output\":{\"shape\":\"ListVPCAssociationAuthorizationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchHostedZone\"},\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"InvalidPaginationToken\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the VPCs that were created by other accounts and that can be associated with a specified hosted zone because you've submitted one or more <code>CreateVPCAssociationAuthorization</code> requests. </p> <p>The response includes a <code>VPCs</code> element with a <code>VPC</code> child element for each VPC that can be associated with the hosted zone.</p>\"\
    },\
    \"TestDNSAnswer\":{\
      \"name\":\"TestDNSAnswer\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2013-04-01/testdnsanswer\"\
      },\
      \"input\":{\"shape\":\"TestDNSAnswerRequest\"},\
      \"output\":{\"shape\":\"TestDNSAnswerResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchHostedZone\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Gets the value that Amazon Route 53 returns in response to a DNS request for a specified record name and type. You can optionally specify the IP address of a DNS resolver, an EDNS0 client subnet IP address, and a subnet mask. </p>\"\
    },\
    \"UpdateHealthCheck\":{\
      \"name\":\"UpdateHealthCheck\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/healthcheck/{HealthCheckId}\"\
      },\
      \"input\":{\
        \"shape\":\"UpdateHealthCheckRequest\",\
        \"locationName\":\"UpdateHealthCheckRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"UpdateHealthCheckResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchHealthCheck\"},\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"HealthCheckVersionMismatch\"}\
      ],\
      \"documentation\":\"<p>Updates an existing health check. Note that some values can't be updated. </p> <p>For more information about updating health checks, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/health-checks-creating-deleting.html\\\">Creating, Updating, and Deleting Health Checks</a> in the <i>Amazon Route 53 Developer Guide</i>.</p>\"\
    },\
    \"UpdateHostedZoneComment\":{\
      \"name\":\"UpdateHostedZoneComment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/hostedzone/{Id}\"\
      },\
      \"input\":{\
        \"shape\":\"UpdateHostedZoneCommentRequest\",\
        \"locationName\":\"UpdateHostedZoneCommentRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"UpdateHostedZoneCommentResponse\"},\
      \"errors\":[\
        {\"shape\":\"NoSuchHostedZone\"},\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Updates the comment for a specified hosted zone.</p>\"\
    },\
    \"UpdateTrafficPolicyComment\":{\
      \"name\":\"UpdateTrafficPolicyComment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/trafficpolicy/{Id}/{Version}\"\
      },\
      \"input\":{\
        \"shape\":\"UpdateTrafficPolicyCommentRequest\",\
        \"locationName\":\"UpdateTrafficPolicyCommentRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"UpdateTrafficPolicyCommentResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"NoSuchTrafficPolicy\"},\
        {\"shape\":\"ConcurrentModification\"}\
      ],\
      \"documentation\":\"<p>Updates the comment for a specified traffic policy version.</p>\"\
    },\
    \"UpdateTrafficPolicyInstance\":{\
      \"name\":\"UpdateTrafficPolicyInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2013-04-01/trafficpolicyinstance/{Id}\"\
      },\
      \"input\":{\
        \"shape\":\"UpdateTrafficPolicyInstanceRequest\",\
        \"locationName\":\"UpdateTrafficPolicyInstanceRequest\",\
        \"xmlNamespace\":{\"uri\":\"https://route53.amazonaws.com/doc/2013-04-01/\"}\
      },\
      \"output\":{\"shape\":\"UpdateTrafficPolicyInstanceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"NoSuchTrafficPolicy\"},\
        {\"shape\":\"NoSuchTrafficPolicyInstance\"},\
        {\"shape\":\"PriorRequestNotComplete\"},\
        {\"shape\":\"ConflictingTypes\"}\
      ],\
      \"documentation\":\"<p>Updates the resource record sets in a specified hosted zone that were created based on the settings in a specified traffic policy version.</p> <p>When you update a traffic policy instance, Amazon Route 53 continues to respond to DNS queries for the root resource record set name (such as example.com) while it replaces one group of resource record sets with another. Route 53 performs the following operations:</p> <ol> <li> <p>Route 53 creates a new group of resource record sets based on the specified traffic policy. This is true regardless of how significant the differences are between the existing resource record sets and the new resource record sets. </p> </li> <li> <p>When all of the new resource record sets have been created, Route 53 starts to respond to DNS queries for the root resource record set name (such as example.com) by using the new resource record sets.</p> </li> <li> <p>Route 53 deletes the old group of resource record sets that are associated with the root resource record set name.</p> </li> </ol>\"\
    }\
  },\
  \"shapes\":{\
    \"AWSAccountID\":{\"type\":\"string\"},\
    \"AccountLimit\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Type\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"AccountLimitType\",\
          \"documentation\":\"<p>The limit that you requested. Valid values include the following:</p> <ul> <li> <p> <b>MAX_HEALTH_CHECKS_BY_OWNER</b>: The maximum number of health checks that you can create using the current account.</p> </li> <li> <p> <b>MAX_HOSTED_ZONES_BY_OWNER</b>: The maximum number of hosted zones that you can create using the current account.</p> </li> <li> <p> <b>MAX_REUSABLE_DELEGATION_SETS_BY_OWNER</b>: The maximum number of reusable delegation sets that you can create using the current account.</p> </li> <li> <p> <b>MAX_TRAFFIC_POLICIES_BY_OWNER</b>: The maximum number of traffic policies that you can create using the current account.</p> </li> <li> <p> <b>MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER</b>: The maximum number of traffic policy instances that you can create using the current account. (Traffic policy instances are referred to as traffic flow policy records in the Amazon Route 53 console.)</p> </li> </ul>\"\
        },\
        \"Value\":{\
          \"shape\":\"LimitValue\",\
          \"documentation\":\"<p>The current value for the limit that is specified by <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_AccountLimit.html#Route53-Type-AccountLimit-Type\\\">Type</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the type of limit that you specified in the request and the current value for that limit.</p>\"\
    },\
    \"AccountLimitType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"MAX_HEALTH_CHECKS_BY_OWNER\",\
        \"MAX_HOSTED_ZONES_BY_OWNER\",\
        \"MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER\",\
        \"MAX_REUSABLE_DELEGATION_SETS_BY_OWNER\",\
        \"MAX_TRAFFIC_POLICIES_BY_OWNER\"\
      ]\
    },\
    \"AlarmIdentifier\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Region\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"Region\":{\
          \"shape\":\"CloudWatchRegion\",\
          \"documentation\":\"<p>For the CloudWatch alarm that you want Route 53 health checkers to use to determine whether this health check is healthy, the region that the alarm was created in.</p> <p>For the current list of CloudWatch regions, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/rande.html#cw_region\\\">Amazon CloudWatch</a> in the <i>AWS Service Endpoints</i> chapter of the <i>Amazon Web Services General Reference</i>.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"AlarmName\",\
          \"documentation\":\"<p>The name of the CloudWatch alarm that you want Amazon Route 53 health checkers to use to determine whether this health check is healthy.</p> <note> <p>Route 53 supports CloudWatch alarms with the following features:</p> <ul> <li> <p>Standard-resolution metrics. High-resolution metrics aren't supported. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/publishingMetrics.html#high-resolution-metrics\\\">High-Resolution Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.</p> </li> <li> <p>Statistics: Average, Minimum, Maximum, Sum, and SampleCount. Extended statistics aren't supported.</p> </li> </ul> </note>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that identifies the CloudWatch alarm that you want Amazon Route 53 health checkers to use to determine whether the specified health check is healthy.</p>\"\
    },\
    \"AlarmName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"AliasHealthEnabled\":{\"type\":\"boolean\"},\
    \"AliasTarget\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HostedZoneId\",\
        \"DNSName\",\
        \"EvaluateTargetHealth\"\
      ],\
      \"members\":{\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p> <i>Alias resource records sets only</i>: The value used depends on where you want to route traffic:</p> <dl> <dt>Amazon API Gateway custom regional APIs and edge-optimized APIs</dt> <dd> <p>Specify the hosted zone ID for your API. You can get the applicable value using the AWS CLI command <a href=\\\"https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-domain-names.html\\\">get-domain-names</a>:</p> <ul> <li> <p>For regional APIs, specify the value of <code>regionalHostedZoneId</code>.</p> </li> <li> <p>For edge-optimized APIs, specify the value of <code>distributionHostedZoneId</code>.</p> </li> </ul> </dd> <dt>Amazon Virtual Private Cloud interface VPC endpoint</dt> <dd> <p>Specify the hosted zone ID for your interface endpoint. You can get the value of <code>HostedZoneId</code> using the AWS CLI command <a href=\\\"https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-vpc-endpoints.html\\\">describe-vpc-endpoints</a>.</p> </dd> <dt>CloudFront distribution</dt> <dd> <p>Specify <code>Z2FDTNDATAQYW2</code>.</p> <note> <p>Alias resource record sets for CloudFront can't be created in a private zone.</p> </note> </dd> <dt>Elastic Beanstalk environment</dt> <dd> <p>Specify the hosted zone ID for the region that you created the environment in. The environment must have a regionalized subdomain. For a list of regions and the corresponding hosted zone IDs, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/rande.html#elasticbeanstalk_region\\\">AWS Elastic Beanstalk</a> in the \\\"AWS Service Endpoints\\\" chapter of the <i>Amazon Web Services General Reference</i>.</p> </dd> <dt>ELB load balancer</dt> <dd> <p>Specify the value of the hosted zone ID for the load balancer. Use the following methods to get the hosted zone ID:</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/elb.html\\\">Service Endpoints</a> table in the \\\"Elastic Load Balancing Endpoints and Quotas\\\" topic in the <i>Amazon Web Services General Reference</i>: Use the value that corresponds with the region that you created your load balancer in. Note that there are separate columns for Application and Classic Load Balancers and for Network Load Balancers.</p> </li> <li> <p> <b>AWS Management Console</b>: Go to the Amazon EC2 page, choose <b>Load Balancers</b> in the navigation pane, select the load balancer, and get the value of the <b>Hosted zone</b> field on the <b>Description</b> tab.</p> </li> <li> <p> <b>Elastic Load Balancing API</b>: Use <code>DescribeLoadBalancers</code> to get the applicable value. For more information, see the applicable guide:</p> <ul> <li> <p>Classic Load Balancers: Use <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/2012-06-01/APIReference/API_DescribeLoadBalancers.html\\\">DescribeLoadBalancers</a> to get the value of <code>CanonicalHostedZoneNameId</code>.</p> </li> <li> <p>Application and Network Load Balancers: Use <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html\\\">DescribeLoadBalancers</a> to get the value of <code>CanonicalHostedZoneId</code>.</p> </li> </ul> </li> <li> <p> <b>AWS CLI</b>: Use <code>describe-load-balancers</code> to get the applicable value. For more information, see the applicable guide:</p> <ul> <li> <p>Classic Load Balancers: Use <a href=\\\"http://docs.aws.amazon.com/cli/latest/reference/elb/describe-load-balancers.html\\\">describe-load-balancers</a> to get the value of <code>CanonicalHostedZoneNameId</code>.</p> </li> <li> <p>Application and Network Load Balancers: Use <a href=\\\"http://docs.aws.amazon.com/cli/latest/reference/elbv2/describe-load-balancers.html\\\">describe-load-balancers</a> to get the value of <code>CanonicalHostedZoneId</code>.</p> </li> </ul> </li> </ul> </dd> <dt>AWS Global Accelerator accelerator</dt> <dd> <p>Specify <code>Z2BJ6XQ5FK7U4H</code>.</p> </dd> <dt>An Amazon S3 bucket configured as a static website</dt> <dd> <p>Specify the hosted zone ID for the region that you created the bucket in. For more information about valid values, see the table <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/s3.html#s3_website_region_endpoints\\\">Amazon S3 Website Endpoints</a> in the <i>Amazon Web Services General Reference</i>.</p> </dd> <dt>Another Route 53 resource record set in your hosted zone</dt> <dd> <p>Specify the hosted zone ID of your hosted zone. (An alias resource record set can't reference a resource record set in a different hosted zone.)</p> </dd> </dl>\"\
        },\
        \"DNSName\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p> <i>Alias resource record sets only:</i> The value that you specify depends on where you want to route queries:</p> <dl> <dt>Amazon API Gateway custom regional APIs and edge-optimized APIs</dt> <dd> <p>Specify the applicable domain name for your API. You can get the applicable value using the AWS CLI command <a href=\\\"https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-domain-names.html\\\">get-domain-names</a>:</p> <ul> <li> <p>For regional APIs, specify the value of <code>regionalDomainName</code>.</p> </li> <li> <p>For edge-optimized APIs, specify the value of <code>distributionDomainName</code>. This is the name of the associated CloudFront distribution, such as <code>da1b2c3d4e5.cloudfront.net</code>.</p> </li> </ul> <note> <p>The name of the record that you're creating must match a custom domain name for your API, such as <code>api.example.com</code>.</p> </note> </dd> <dt>Amazon Virtual Private Cloud interface VPC endpoint</dt> <dd> <p>Enter the API endpoint for the interface endpoint, such as <code>vpce-123456789abcdef01-example-us-east-1a.elasticloadbalancing.us-east-1.vpce.amazonaws.com</code>. For edge-optimized APIs, this is the domain name for the corresponding CloudFront distribution. You can get the value of <code>DnsName</code> using the AWS CLI command <a href=\\\"https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-vpc-endpoints.html\\\">describe-vpc-endpoints</a>.</p> </dd> <dt>CloudFront distribution</dt> <dd> <p>Specify the domain name that CloudFront assigned when you created your distribution.</p> <p>Your CloudFront distribution must include an alternate domain name that matches the name of the resource record set. For example, if the name of the resource record set is <i>acme.example.com</i>, your CloudFront distribution must include <i>acme.example.com</i> as one of the alternate domain names. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/CNAMEs.html\\\">Using Alternate Domain Names (CNAMEs)</a> in the <i>Amazon CloudFront Developer Guide</i>.</p> <p>You can't create a resource record set in a private hosted zone to route traffic to a CloudFront distribution.</p> <note> <p>For failover alias records, you can't specify a CloudFront distribution for both the primary and secondary records. A distribution must include an alternate domain name that matches the name of the record. However, the primary and secondary records have the same name, and you can't include the same alternate domain name in more than one distribution. </p> </note> </dd> <dt>Elastic Beanstalk environment</dt> <dd> <p>If the domain name for your Elastic Beanstalk environment includes the region that you deployed the environment in, you can create an alias record that routes traffic to the environment. For example, the domain name <code>my-environment.<i>us-west-2</i>.elasticbeanstalk.com</code> is a regionalized domain name. </p> <important> <p>For environments that were created before early 2016, the domain name doesn't include the region. To route traffic to these environments, you must create a CNAME record instead of an alias record. Note that you can't create a CNAME record for the root domain name. For example, if your domain name is example.com, you can create a record that routes traffic for acme.example.com to your Elastic Beanstalk environment, but you can't create a record that routes traffic for example.com to your Elastic Beanstalk environment.</p> </important> <p>For Elastic Beanstalk environments that have regionalized subdomains, specify the <code>CNAME</code> attribute for the environment. You can use the following methods to get the value of the CNAME attribute:</p> <ul> <li> <p> <i>AWS Management Console</i>: For information about how to get the value by using the console, see <a href=\\\"https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/customdomains.html\\\">Using Custom Domains with AWS Elastic Beanstalk</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.</p> </li> <li> <p> <i>Elastic Beanstalk API</i>: Use the <code>DescribeEnvironments</code> action to get the value of the <code>CNAME</code> attribute. For more information, see <a href=\\\"https://docs.aws.amazon.com/elasticbeanstalk/latest/api/API_DescribeEnvironments.html\\\">DescribeEnvironments</a> in the <i>AWS Elastic Beanstalk API Reference</i>.</p> </li> <li> <p> <i>AWS CLI</i>: Use the <code>describe-environments</code> command to get the value of the <code>CNAME</code> attribute. For more information, see <a href=\\\"https://docs.aws.amazon.com/cli/latest/reference/elasticbeanstalk/describe-environments.html\\\">describe-environments</a> in the <i>AWS CLI Command Reference</i>.</p> </li> </ul> </dd> <dt>ELB load balancer</dt> <dd> <p>Specify the DNS name that is associated with the load balancer. Get the DNS name by using the AWS Management Console, the ELB API, or the AWS CLI. </p> <ul> <li> <p> <b>AWS Management Console</b>: Go to the EC2 page, choose <b>Load Balancers</b> in the navigation pane, choose the load balancer, choose the <b>Description</b> tab, and get the value of the <b>DNS name</b> field. </p> <p>If you're routing traffic to a Classic Load Balancer, get the value that begins with <b>dualstack</b>. If you're routing traffic to another type of load balancer, get the value that applies to the record type, A or AAAA.</p> </li> <li> <p> <b>Elastic Load Balancing API</b>: Use <code>DescribeLoadBalancers</code> to get the value of <code>DNSName</code>. For more information, see the applicable guide:</p> <ul> <li> <p>Classic Load Balancers: <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/2012-06-01/APIReference/API_DescribeLoadBalancers.html\\\">DescribeLoadBalancers</a> </p> </li> <li> <p>Application and Network Load Balancers: <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html\\\">DescribeLoadBalancers</a> </p> </li> </ul> </li> <li> <p> <b>AWS CLI</b>: Use <code>describe-load-balancers</code> to get the value of <code>DNSName</code>. For more information, see the applicable guide:</p> <ul> <li> <p>Classic Load Balancers: <a href=\\\"http://docs.aws.amazon.com/cli/latest/reference/elb/describe-load-balancers.html\\\">describe-load-balancers</a> </p> </li> <li> <p>Application and Network Load Balancers: <a href=\\\"http://docs.aws.amazon.com/cli/latest/reference/elbv2/describe-load-balancers.html\\\">describe-load-balancers</a> </p> </li> </ul> </li> </ul> </dd> <dt>AWS Global Accelerator accelerator</dt> <dd> <p>Specify the DNS name for your accelerator:</p> <ul> <li> <p> <b>Global Accelerator API:</b> To get the DNS name, use <a href=\\\"https://docs.aws.amazon.com/global-accelerator/latest/api/API_DescribeAccelerator.html\\\">DescribeAccelerator</a>.</p> </li> <li> <p> <b>AWS CLI:</b> To get the DNS name, use <a href=\\\"https://docs.aws.amazon.com/cli/latest/reference/globalaccelerator/describe-accelerator.html\\\">describe-accelerator</a>.</p> </li> </ul> </dd> <dt>Amazon S3 bucket that is configured as a static website</dt> <dd> <p>Specify the domain name of the Amazon S3 website endpoint that you created the bucket in, for example, <code>s3-website.us-east-2.amazonaws.com</code>. For more information about valid values, see the table <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/s3.html#s3_website_region_endpoints\\\">Amazon S3 Website Endpoints</a> in the <i>Amazon Web Services General Reference</i>. For more information about using S3 buckets for websites, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/getting-started.html\\\">Getting Started with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide.</i> </p> </dd> <dt>Another Route 53 resource record set</dt> <dd> <p>Specify the value of the <code>Name</code> element for a resource record set in the current hosted zone.</p> <note> <p>If you're creating an alias record that has the same name as the hosted zone (known as the zone apex), you can't specify the domain name for a record for which the value of <code>Type</code> is <code>CNAME</code>. This is because the alias record must have the same type as the record that you're routing traffic to, and creating a CNAME record for the zone apex isn't supported even for an alias record.</p> </note> </dd> </dl>\"\
        },\
        \"EvaluateTargetHealth\":{\
          \"shape\":\"AliasHealthEnabled\",\
          \"documentation\":\"<p> <i>Applies only to alias, failover alias, geolocation alias, latency alias, and weighted alias resource record sets:</i> When <code>EvaluateTargetHealth</code> is <code>true</code>, an alias resource record set inherits the health of the referenced AWS resource, such as an ELB load balancer or another resource record set in the hosted zone.</p> <p>Note the following:</p> <dl> <dt>CloudFront distributions</dt> <dd> <p>You can't set <code>EvaluateTargetHealth</code> to <code>true</code> when the alias target is a CloudFront distribution.</p> </dd> <dt>Elastic Beanstalk environments that have regionalized subdomains</dt> <dd> <p>If you specify an Elastic Beanstalk environment in <code>DNSName</code> and the environment contains an ELB load balancer, Elastic Load Balancing routes queries only to the healthy Amazon EC2 instances that are registered with the load balancer. (An environment automatically contains an ELB load balancer if it includes more than one Amazon EC2 instance.) If you set <code>EvaluateTargetHealth</code> to <code>true</code> and either no Amazon EC2 instances are healthy or the load balancer itself is unhealthy, Route 53 routes queries to other available resources that are healthy, if any. </p> <p>If the environment contains a single Amazon EC2 instance, there are no special requirements.</p> </dd> <dt>ELB load balancers</dt> <dd> <p>Health checking behavior depends on the type of load balancer:</p> <ul> <li> <p> <b>Classic Load Balancers</b>: If you specify an ELB Classic Load Balancer in <code>DNSName</code>, Elastic Load Balancing routes queries only to the healthy Amazon EC2 instances that are registered with the load balancer. If you set <code>EvaluateTargetHealth</code> to <code>true</code> and either no EC2 instances are healthy or the load balancer itself is unhealthy, Route 53 routes queries to other resources.</p> </li> <li> <p> <b>Application and Network Load Balancers</b>: If you specify an ELB Application or Network Load Balancer and you set <code>EvaluateTargetHealth</code> to <code>true</code>, Route 53 routes queries to the load balancer based on the health of the target groups that are associated with the load balancer:</p> <ul> <li> <p>For an Application or Network Load Balancer to be considered healthy, every target group that contains targets must contain at least one healthy target. If any target group contains only unhealthy targets, the load balancer is considered unhealthy, and Route 53 routes queries to other resources.</p> </li> <li> <p>A target group that has no registered targets is considered unhealthy.</p> </li> </ul> </li> </ul> <note> <p>When you create a load balancer, you configure settings for Elastic Load Balancing health checks; they're not Route 53 health checks, but they perform a similar function. Do not create Route 53 health checks for the EC2 instances that you register with an ELB load balancer. </p> </note> </dd> <dt>S3 buckets</dt> <dd> <p>There are no special requirements for setting <code>EvaluateTargetHealth</code> to <code>true</code> when the alias target is an S3 bucket.</p> </dd> <dt>Other records in the same hosted zone</dt> <dd> <p>If the AWS resource that you specify in <code>DNSName</code> is a record or a group of records (for example, a group of weighted records) but is not another alias record, we recommend that you associate a health check with all of the records in the alias target. For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-complex-configs.html#dns-failover-complex-configs-hc-omitting\\\">What Happens When You Omit Health Checks?</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> </dd> </dl> <p>For more information and examples, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover.html\\\">Amazon Route 53 Health Checks and DNS Failover</a> in the <i>Amazon Route 53 Developer Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p> <i>Alias resource record sets only:</i> Information about the AWS resource, such as a CloudFront distribution or an Amazon S3 bucket, that you want to route traffic to.</p> <p>When creating resource record sets for a private hosted zone, note the following:</p> <ul> <li> <p>Creating geolocation alias resource record sets or latency alias resource record sets in a private hosted zone is unsupported.</p> </li> <li> <p>For information about creating failover resource record sets in a private hosted zone, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-private-hosted-zones.html\\\">Configuring Failover in a Private Hosted Zone</a>.</p> </li> </ul>\"\
    },\
    \"AssociateVPCComment\":{\"type\":\"string\"},\
    \"AssociateVPCWithHostedZoneRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HostedZoneId\",\
        \"VPC\"\
      ],\
      \"members\":{\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the private hosted zone that you want to associate an Amazon VPC with.</p> <p>Note that you can't associate a VPC with a hosted zone that doesn't have an existing VPC association.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        },\
        \"VPC\":{\
          \"shape\":\"VPC\",\
          \"documentation\":\"<p>A complex type that contains information about the VPC that you want to associate with a private hosted zone.</p>\"\
        },\
        \"Comment\":{\
          \"shape\":\"AssociateVPCComment\",\
          \"documentation\":\"<p> <i>Optional:</i> A comment about the association request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the request to associate a VPC with a private hosted zone.</p>\"\
    },\
    \"AssociateVPCWithHostedZoneResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ChangeInfo\"],\
      \"members\":{\
        \"ChangeInfo\":{\
          \"shape\":\"ChangeInfo\",\
          \"documentation\":\"<p>A complex type that describes the changes made to your hosted zone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response information for the <code>AssociateVPCWithHostedZone</code> request.</p>\"\
    },\
    \"Change\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Action\",\
        \"ResourceRecordSet\"\
      ],\
      \"members\":{\
        \"Action\":{\
          \"shape\":\"ChangeAction\",\
          \"documentation\":\"<p>The action to perform:</p> <ul> <li> <p> <code>CREATE</code>: Creates a resource record set that has the specified values.</p> </li> <li> <p> <code>DELETE</code>: Deletes a existing resource record set.</p> <important> <p>To delete the resource record set that is associated with a traffic policy instance, use <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_DeleteTrafficPolicyInstance.html\\\">DeleteTrafficPolicyInstance</a>. Amazon Route 53 will delete the resource record set automatically. If you delete the resource record set by using <code>ChangeResourceRecordSets</code>, Route 53 doesn't automatically delete the traffic policy instance, and you'll continue to be charged for it even though it's no longer in use. </p> </important> </li> <li> <p> <code>UPSERT</code>: If a resource record set doesn't already exist, Route 53 creates it. If a resource record set does exist, Route 53 updates it with the values in the request.</p> </li> </ul>\"\
        },\
        \"ResourceRecordSet\":{\
          \"shape\":\"ResourceRecordSet\",\
          \"documentation\":\"<p>Information about the resource record set to create, delete, or update.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The information for each resource record set that you want to change.</p>\"\
    },\
    \"ChangeAction\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATE\",\
        \"DELETE\",\
        \"UPSERT\"\
      ]\
    },\
    \"ChangeBatch\":{\
      \"type\":\"structure\",\
      \"required\":[\"Changes\"],\
      \"members\":{\
        \"Comment\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p> <i>Optional:</i> Any comments you want to include about a change batch request.</p>\"\
        },\
        \"Changes\":{\
          \"shape\":\"Changes\",\
          \"documentation\":\"<p>Information about the changes to make to the record sets.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The information for a change request.</p>\"\
    },\
    \"ChangeInfo\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Id\",\
        \"Status\",\
        \"SubmittedAt\"\
      ],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the request.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ChangeStatus\",\
          \"documentation\":\"<p>The current state of the request. <code>PENDING</code> indicates that this request has not yet been applied to all Amazon Route 53 DNS servers.</p>\"\
        },\
        \"SubmittedAt\":{\
          \"shape\":\"TimeStamp\",\
          \"documentation\":\"<p>The date and time that the change request was submitted in <a href=\\\"https://en.wikipedia.org/wiki/ISO_8601\\\">ISO 8601 format</a> and Coordinated Universal Time (UTC). For example, the value <code>2017-03-27T17:48:16.751Z</code> represents March 27, 2017 at 17:48:16.751 UTC.</p>\"\
        },\
        \"Comment\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>A complex type that describes change information about changes made to your hosted zone.</p> <p>This element contains an ID that you use when performing a <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetChange.html\\\">GetChange</a> action to get detailed information about the change.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that describes change information about changes made to your hosted zone.</p>\"\
    },\
    \"ChangeResourceRecordSetsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HostedZoneId\",\
        \"ChangeBatch\"\
      ],\
      \"members\":{\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the hosted zone that contains the resource record sets that you want to change.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        },\
        \"ChangeBatch\":{\
          \"shape\":\"ChangeBatch\",\
          \"documentation\":\"<p>A complex type that contains an optional comment and the <code>Changes</code> element.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains change information for the resource record set.</p>\"\
    },\
    \"ChangeResourceRecordSetsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ChangeInfo\"],\
      \"members\":{\
        \"ChangeInfo\":{\
          \"shape\":\"ChangeInfo\",\
          \"documentation\":\"<p>A complex type that contains information about changes made to your hosted zone.</p> <p>This element contains an ID that you use when performing a <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetChange.html\\\">GetChange</a> action to get detailed information about the change.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type containing the response for the request.</p>\"\
    },\
    \"ChangeStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"INSYNC\"\
      ]\
    },\
    \"ChangeTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceType\",\
        \"ResourceId\"\
      ],\
      \"members\":{\
        \"ResourceType\":{\
          \"shape\":\"TagResourceType\",\
          \"documentation\":\"<p>The type of the resource.</p> <ul> <li> <p>The resource type for health checks is <code>healthcheck</code>.</p> </li> <li> <p>The resource type for hosted zones is <code>hostedzone</code>.</p> </li> </ul>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ResourceType\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"TagResourceId\",\
          \"documentation\":\"<p>The ID of the resource for which you want to add, change, or delete tags.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ResourceId\"\
        },\
        \"AddTags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A complex type that contains a list of the tags that you want to add to the specified health check or hosted zone and/or the tags that you want to edit <code>Value</code> for.</p> <p>You can add a maximum of 10 tags to a health check or a hosted zone.</p>\"\
        },\
        \"RemoveTagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>A complex type that contains a list of the tags that you want to delete from the specified health check or hosted zone. You can specify up to 10 keys.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the tags that you want to add, edit, or delete.</p>\"\
    },\
    \"ChangeTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Empty response for the request.</p>\"\
    },\
    \"Changes\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Change\",\
        \"locationName\":\"Change\"\
      },\
      \"min\":1\
    },\
    \"CheckerIpRanges\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IPAddressCidr\"}\
    },\
    \"ChildHealthCheckList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"HealthCheckId\",\
        \"locationName\":\"ChildHealthCheck\"\
      },\
      \"max\":256\
    },\
    \"CloudWatchAlarmConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EvaluationPeriods\",\
        \"Threshold\",\
        \"ComparisonOperator\",\
        \"Period\",\
        \"MetricName\",\
        \"Namespace\",\
        \"Statistic\"\
      ],\
      \"members\":{\
        \"EvaluationPeriods\":{\
          \"shape\":\"EvaluationPeriods\",\
          \"documentation\":\"<p>For the metric that the CloudWatch alarm is associated with, the number of periods that the metric is compared to the threshold.</p>\"\
        },\
        \"Threshold\":{\
          \"shape\":\"Threshold\",\
          \"documentation\":\"<p>For the metric that the CloudWatch alarm is associated with, the value the metric is compared with.</p>\"\
        },\
        \"ComparisonOperator\":{\
          \"shape\":\"ComparisonOperator\",\
          \"documentation\":\"<p>For the metric that the CloudWatch alarm is associated with, the arithmetic operation that is used for the comparison.</p>\"\
        },\
        \"Period\":{\
          \"shape\":\"Period\",\
          \"documentation\":\"<p>For the metric that the CloudWatch alarm is associated with, the duration of one evaluation period in seconds.</p>\"\
        },\
        \"MetricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the CloudWatch metric that the alarm is associated with.</p>\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace of the metric that the alarm is associated with. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/CW_Support_For_AWS.html\\\">Amazon CloudWatch Namespaces, Dimensions, and Metrics Reference</a> in the <i>Amazon CloudWatch User Guide</i>.</p>\"\
        },\
        \"Statistic\":{\
          \"shape\":\"Statistic\",\
          \"documentation\":\"<p>For the metric that the CloudWatch alarm is associated with, the statistic that is applied to the metric.</p>\"\
        },\
        \"Dimensions\":{\
          \"shape\":\"DimensionList\",\
          \"documentation\":\"<p>For the metric that the CloudWatch alarm is associated with, a complex type that contains information about the dimensions for the metric. For information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/CW_Support_For_AWS.html\\\">Amazon CloudWatch Namespaces, Dimensions, and Metrics Reference</a> in the <i>Amazon CloudWatch User Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the CloudWatch alarm that Amazon Route 53 is monitoring for this health check.</p>\"\
    },\
    \"CloudWatchLogsLogGroupArn\":{\"type\":\"string\"},\
    \"CloudWatchRegion\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"us-east-1\",\
        \"us-east-2\",\
        \"us-west-1\",\
        \"us-west-2\",\
        \"ca-central-1\",\
        \"eu-central-1\",\
        \"eu-west-1\",\
        \"eu-west-2\",\
        \"eu-west-3\",\
        \"ap-east-1\",\
        \"me-south-1\",\
        \"ap-south-1\",\
        \"ap-southeast-1\",\
        \"ap-southeast-2\",\
        \"ap-northeast-1\",\
        \"ap-northeast-2\",\
        \"ap-northeast-3\",\
        \"eu-north-1\",\
        \"sa-east-1\",\
        \"cn-northwest-1\",\
        \"cn-north-1\",\
        \"af-south-1\",\
        \"eu-south-1\",\
        \"us-gov-west-1\",\
        \"us-gov-east-1\",\
        \"us-iso-east-1\",\
        \"us-isob-east-1\"\
      ],\
      \"max\":64,\
      \"min\":1\
    },\
    \"ComparisonOperator\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"GreaterThanOrEqualToThreshold\",\
        \"GreaterThanThreshold\",\
        \"LessThanThreshold\",\
        \"LessThanOrEqualToThreshold\"\
      ]\
    },\
    \"ConcurrentModification\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Another user submitted a request to create, update, or delete the object at the same time that you did. Retry the request. </p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ConflictingDomainExists\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The cause of this error depends on the operation that you're performing:</p> <ul> <li> <p> <b>Create a public hosted zone:</b> Two hosted zones that have the same name or that have a parent/child relationship (example.com and test.example.com) can't have any common name servers. You tried to create a hosted zone that has the same name as an existing hosted zone or that's the parent or child of an existing hosted zone, and you specified a delegation set that shares one or more name servers with the existing hosted zone. For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateReusableDelegationSet.html\\\">CreateReusableDelegationSet</a>.</p> </li> <li> <p> <b>Create a private hosted zone:</b> A hosted zone with the specified name already exists and is already associated with the Amazon VPC that you specified.</p> </li> <li> <p> <b>Associate VPCs with a private hosted zone:</b> The VPC that you specified is already associated with another hosted zone that has the same name.</p> </li> </ul>\",\
      \"exception\":true\
    },\
    \"ConflictingTypes\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>You tried to update a traffic policy instance by using a traffic policy version that has a different DNS type than the current type for the instance. You specified the type in the JSON document in the <code>CreateTrafficPolicy</code> or <code>CreateTrafficPolicyVersion</code>request. </p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"CreateHealthCheckRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CallerReference\",\
        \"HealthCheckConfig\"\
      ],\
      \"members\":{\
        \"CallerReference\":{\
          \"shape\":\"HealthCheckNonce\",\
          \"documentation\":\"<p>A unique string that identifies the request and that allows you to retry a failed <code>CreateHealthCheck</code> request without the risk of creating two identical health checks:</p> <ul> <li> <p>If you send a <code>CreateHealthCheck</code> request with the same <code>CallerReference</code> and settings as a previous request, and if the health check doesn't exist, Amazon Route 53 creates the health check. If the health check does exist, Route 53 returns the settings for the existing health check.</p> </li> <li> <p>If you send a <code>CreateHealthCheck</code> request with the same <code>CallerReference</code> as a deleted health check, regardless of the settings, Route 53 returns a <code>HealthCheckAlreadyExists</code> error.</p> </li> <li> <p>If you send a <code>CreateHealthCheck</code> request with the same <code>CallerReference</code> as an existing health check but with different settings, Route 53 returns a <code>HealthCheckAlreadyExists</code> error.</p> </li> <li> <p>If you send a <code>CreateHealthCheck</code> request with a unique <code>CallerReference</code> but settings identical to an existing health check, Route 53 creates the health check.</p> </li> </ul>\"\
        },\
        \"HealthCheckConfig\":{\
          \"shape\":\"HealthCheckConfig\",\
          \"documentation\":\"<p>A complex type that contains settings for a new health check.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the health check request information.</p>\"\
    },\
    \"CreateHealthCheckResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HealthCheck\",\
        \"Location\"\
      ],\
      \"members\":{\
        \"HealthCheck\":{\
          \"shape\":\"HealthCheck\",\
          \"documentation\":\"<p>A complex type that contains identifying information about the health check.</p>\"\
        },\
        \"Location\":{\
          \"shape\":\"ResourceURI\",\
          \"documentation\":\"<p>The unique URL representing the new health check.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Location\"\
        }\
      },\
      \"documentation\":\"<p>A complex type containing the response information for the new health check.</p>\"\
    },\
    \"CreateHostedZoneRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"CallerReference\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>The name of the domain. Specify a fully qualified domain name, for example, <i>www.example.com</i>. The trailing dot is optional; Amazon Route 53 assumes that the domain name is fully qualified. This means that Route 53 treats <i>www.example.com</i> (without a trailing dot) and <i>www.example.com.</i> (with a trailing dot) as identical.</p> <p>If you're creating a public hosted zone, this is the name you have registered with your DNS registrar. If your domain name is registered with a registrar other than Route 53, change the name servers for your domain to the set of <code>NameServers</code> that <code>CreateHostedZone</code> returns in <code>DelegationSet</code>.</p>\"\
        },\
        \"VPC\":{\
          \"shape\":\"VPC\",\
          \"documentation\":\"<p>(Private hosted zones only) A complex type that contains information about the Amazon VPC that you're associating with this hosted zone.</p> <p>You can specify only one Amazon VPC when you create a private hosted zone. To associate additional Amazon VPCs with the hosted zone, use <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_AssociateVPCWithHostedZone.html\\\">AssociateVPCWithHostedZone</a> after you create a hosted zone.</p>\"\
        },\
        \"CallerReference\":{\
          \"shape\":\"Nonce\",\
          \"documentation\":\"<p>A unique string that identifies the request and that allows failed <code>CreateHostedZone</code> requests to be retried without the risk of executing the operation twice. You must use a unique <code>CallerReference</code> string every time you submit a <code>CreateHostedZone</code> request. <code>CallerReference</code> can be any unique string, for example, a date/time stamp.</p>\"\
        },\
        \"HostedZoneConfig\":{\
          \"shape\":\"HostedZoneConfig\",\
          \"documentation\":\"<p>(Optional) A complex type that contains the following optional values:</p> <ul> <li> <p>For public and private hosted zones, an optional comment</p> </li> <li> <p>For private hosted zones, an optional <code>PrivateZone</code> element</p> </li> </ul> <p>If you don't specify a comment or the <code>PrivateZone</code> element, omit <code>HostedZoneConfig</code> and the other elements.</p>\"\
        },\
        \"DelegationSetId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>If you want to associate a reusable delegation set with this hosted zone, the ID that Amazon Route 53 assigned to the reusable delegation set when you created it. For more information about reusable delegation sets, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateReusableDelegationSet.html\\\">CreateReusableDelegationSet</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the request to create a public or private hosted zone.</p>\"\
    },\
    \"CreateHostedZoneResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HostedZone\",\
        \"ChangeInfo\",\
        \"DelegationSet\",\
        \"Location\"\
      ],\
      \"members\":{\
        \"HostedZone\":{\
          \"shape\":\"HostedZone\",\
          \"documentation\":\"<p>A complex type that contains general information about the hosted zone.</p>\"\
        },\
        \"ChangeInfo\":{\
          \"shape\":\"ChangeInfo\",\
          \"documentation\":\"<p>A complex type that contains information about the <code>CreateHostedZone</code> request.</p>\"\
        },\
        \"DelegationSet\":{\
          \"shape\":\"DelegationSet\",\
          \"documentation\":\"<p>A complex type that describes the name servers for this hosted zone.</p>\"\
        },\
        \"VPC\":{\
          \"shape\":\"VPC\",\
          \"documentation\":\"<p>A complex type that contains information about an Amazon VPC that you associated with this hosted zone.</p>\"\
        },\
        \"Location\":{\
          \"shape\":\"ResourceURI\",\
          \"documentation\":\"<p>The unique URL representing the new hosted zone.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Location\"\
        }\
      },\
      \"documentation\":\"<p>A complex type containing the response information for the hosted zone.</p>\"\
    },\
    \"CreateQueryLoggingConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HostedZoneId\",\
        \"CloudWatchLogsLogGroupArn\"\
      ],\
      \"members\":{\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the hosted zone that you want to log queries for. You can log queries only for public hosted zones.</p>\"\
        },\
        \"CloudWatchLogsLogGroupArn\":{\
          \"shape\":\"CloudWatchLogsLogGroupArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the log group that you want to Amazon Route 53 to send query logs to. This is the format of the ARN:</p> <p>arn:aws:logs:<i>region</i>:<i>account-id</i>:log-group:<i>log_group_name</i> </p> <p>To get the ARN for a log group, you can use the CloudWatch console, the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeLogGroups.html\\\">DescribeLogGroups</a> API action, the <a href=\\\"https://docs.aws.amazon.com/cli/latest/reference/logs/describe-log-groups.html\\\">describe-log-groups</a> command, or the applicable command in one of the AWS SDKs.</p>\"\
        }\
      }\
    },\
    \"CreateQueryLoggingConfigResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"QueryLoggingConfig\",\
        \"Location\"\
      ],\
      \"members\":{\
        \"QueryLoggingConfig\":{\
          \"shape\":\"QueryLoggingConfig\",\
          \"documentation\":\"<p>A complex type that contains the ID for a query logging configuration, the ID of the hosted zone that you want to log queries for, and the ARN for the log group that you want Amazon Route 53 to send query logs to.</p>\"\
        },\
        \"Location\":{\
          \"shape\":\"ResourceURI\",\
          \"documentation\":\"<p>The unique URL representing the new query logging configuration.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Location\"\
        }\
      }\
    },\
    \"CreateReusableDelegationSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CallerReference\"],\
      \"members\":{\
        \"CallerReference\":{\
          \"shape\":\"Nonce\",\
          \"documentation\":\"<p>A unique string that identifies the request, and that allows you to retry failed <code>CreateReusableDelegationSet</code> requests without the risk of executing the operation twice. You must use a unique <code>CallerReference</code> string every time you submit a <code>CreateReusableDelegationSet</code> request. <code>CallerReference</code> can be any unique string, for example a date/time stamp.</p>\"\
        },\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>If you want to mark the delegation set for an existing hosted zone as reusable, the ID for that hosted zone.</p>\"\
        }\
      }\
    },\
    \"CreateReusableDelegationSetResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DelegationSet\",\
        \"Location\"\
      ],\
      \"members\":{\
        \"DelegationSet\":{\
          \"shape\":\"DelegationSet\",\
          \"documentation\":\"<p>A complex type that contains name server information.</p>\"\
        },\
        \"Location\":{\
          \"shape\":\"ResourceURI\",\
          \"documentation\":\"<p>The unique URL representing the new reusable delegation set.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Location\"\
        }\
      }\
    },\
    \"CreateTrafficPolicyInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HostedZoneId\",\
        \"Name\",\
        \"TTL\",\
        \"TrafficPolicyId\",\
        \"TrafficPolicyVersion\"\
      ],\
      \"members\":{\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the hosted zone that you want Amazon Route 53 to create resource record sets in by using the configuration in a traffic policy.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>The domain name (such as example.com) or subdomain name (such as www.example.com) for which Amazon Route 53 responds to DNS queries by using the resource record sets that Route 53 creates for this traffic policy instance.</p>\"\
        },\
        \"TTL\":{\
          \"shape\":\"TTL\",\
          \"documentation\":\"<p>(Optional) The TTL that you want Amazon Route 53 to assign to all of the resource record sets that it creates in the specified hosted zone.</p>\"\
        },\
        \"TrafficPolicyId\":{\
          \"shape\":\"TrafficPolicyId\",\
          \"documentation\":\"<p>The ID of the traffic policy that you want to use to create resource record sets in the specified hosted zone.</p>\"\
        },\
        \"TrafficPolicyVersion\":{\
          \"shape\":\"TrafficPolicyVersion\",\
          \"documentation\":\"<p>The version of the traffic policy that you want to use to create resource record sets in the specified hosted zone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the resource record sets that you want to create based on a specified traffic policy.</p>\"\
    },\
    \"CreateTrafficPolicyInstanceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrafficPolicyInstance\",\
        \"Location\"\
      ],\
      \"members\":{\
        \"TrafficPolicyInstance\":{\
          \"shape\":\"TrafficPolicyInstance\",\
          \"documentation\":\"<p>A complex type that contains settings for the new traffic policy instance.</p>\"\
        },\
        \"Location\":{\
          \"shape\":\"ResourceURI\",\
          \"documentation\":\"<p>A unique URL that represents a new traffic policy instance.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Location\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response information for the <code>CreateTrafficPolicyInstance</code> request.</p>\"\
    },\
    \"CreateTrafficPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Document\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"TrafficPolicyName\",\
          \"documentation\":\"<p>The name of the traffic policy.</p>\"\
        },\
        \"Document\":{\
          \"shape\":\"TrafficPolicyDocument\",\
          \"documentation\":\"<p>The definition of this traffic policy in JSON format. For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/api-policies-traffic-policy-document-format.html\\\">Traffic Policy Document Format</a>.</p>\"\
        },\
        \"Comment\":{\
          \"shape\":\"TrafficPolicyComment\",\
          \"documentation\":\"<p>(Optional) Any comments that you want to include about the traffic policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the traffic policy that you want to create.</p>\"\
    },\
    \"CreateTrafficPolicyResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrafficPolicy\",\
        \"Location\"\
      ],\
      \"members\":{\
        \"TrafficPolicy\":{\
          \"shape\":\"TrafficPolicy\",\
          \"documentation\":\"<p>A complex type that contains settings for the new traffic policy.</p>\"\
        },\
        \"Location\":{\
          \"shape\":\"ResourceURI\",\
          \"documentation\":\"<p>A unique URL that represents a new traffic policy.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Location\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response information for the <code>CreateTrafficPolicy</code> request.</p>\"\
    },\
    \"CreateTrafficPolicyVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Id\",\
        \"Document\"\
      ],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TrafficPolicyId\",\
          \"documentation\":\"<p>The ID of the traffic policy for which you want to create a new version.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        },\
        \"Document\":{\
          \"shape\":\"TrafficPolicyDocument\",\
          \"documentation\":\"<p>The definition of this version of the traffic policy, in JSON format. You specified the JSON in the <code>CreateTrafficPolicyVersion</code> request. For more information about the JSON format, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateTrafficPolicy.html\\\">CreateTrafficPolicy</a>.</p>\"\
        },\
        \"Comment\":{\
          \"shape\":\"TrafficPolicyComment\",\
          \"documentation\":\"<p>The comment that you specified in the <code>CreateTrafficPolicyVersion</code> request, if any.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the traffic policy that you want to create a new version for.</p>\"\
    },\
    \"CreateTrafficPolicyVersionResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrafficPolicy\",\
        \"Location\"\
      ],\
      \"members\":{\
        \"TrafficPolicy\":{\
          \"shape\":\"TrafficPolicy\",\
          \"documentation\":\"<p>A complex type that contains settings for the new version of the traffic policy.</p>\"\
        },\
        \"Location\":{\
          \"shape\":\"ResourceURI\",\
          \"documentation\":\"<p>A unique URL that represents a new traffic policy version.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Location\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response information for the <code>CreateTrafficPolicyVersion</code> request.</p>\"\
    },\
    \"CreateVPCAssociationAuthorizationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HostedZoneId\",\
        \"VPC\"\
      ],\
      \"members\":{\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the private hosted zone that you want to authorize associating a VPC with.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        },\
        \"VPC\":{\
          \"shape\":\"VPC\",\
          \"documentation\":\"<p>A complex type that contains the VPC ID and region for the VPC that you want to authorize associating with your hosted zone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the request to authorize associating a VPC with your private hosted zone. Authorization is only required when a private hosted zone and a VPC were created by using different accounts.</p>\"\
    },\
    \"CreateVPCAssociationAuthorizationResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HostedZoneId\",\
        \"VPC\"\
      ],\
      \"members\":{\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the hosted zone that you authorized associating a VPC with.</p>\"\
        },\
        \"VPC\":{\
          \"shape\":\"VPC\",\
          \"documentation\":\"<p>The VPC that you authorized associating with a hosted zone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response information from a <code>CreateVPCAssociationAuthorization</code> request.</p>\"\
    },\
    \"DNSName\":{\
      \"type\":\"string\",\
      \"max\":1024\
    },\
    \"DNSRCode\":{\"type\":\"string\"},\
    \"DelegationSet\":{\
      \"type\":\"structure\",\
      \"required\":[\"NameServers\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID that Amazon Route 53 assigns to a reusable delegation set.</p>\"\
        },\
        \"CallerReference\":{\
          \"shape\":\"Nonce\",\
          \"documentation\":\"<p>The value that you specified for <code>CallerReference</code> when you created the reusable delegation set.</p>\"\
        },\
        \"NameServers\":{\
          \"shape\":\"DelegationSetNameServers\",\
          \"documentation\":\"<p>A complex type that contains a list of the authoritative name servers for a hosted zone or for a reusable delegation set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that lists the name servers in a delegation set, as well as the <code>CallerReference</code> and the <code>ID</code> for the delegation set.</p>\"\
    },\
    \"DelegationSetAlreadyCreated\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A delegation set with the same owner and caller reference combination has already been created.</p>\",\
      \"exception\":true\
    },\
    \"DelegationSetAlreadyReusable\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified delegation set has already been marked as reusable.</p>\",\
      \"exception\":true\
    },\
    \"DelegationSetInUse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified delegation contains associated hosted zones which must be deleted before the reusable delegation set can be deleted.</p>\",\
      \"exception\":true\
    },\
    \"DelegationSetNameServers\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"DNSName\",\
        \"locationName\":\"NameServer\"\
      },\
      \"min\":1\
    },\
    \"DelegationSetNotAvailable\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>You can create a hosted zone that has the same name as an existing hosted zone (example.com is common), but there is a limit to the number of hosted zones that have the same name. If you get this error, Amazon Route 53 has reached that limit. If you own the domain name and Route 53 generates this error, contact Customer Support.</p>\",\
      \"exception\":true\
    },\
    \"DelegationSetNotReusable\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A reusable delegation set with the specified ID does not exist.</p>\",\
      \"exception\":true\
    },\
    \"DelegationSets\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"DelegationSet\",\
        \"locationName\":\"DelegationSet\"\
      }\
    },\
    \"DeleteHealthCheckRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"HealthCheckId\"],\
      \"members\":{\
        \"HealthCheckId\":{\
          \"shape\":\"HealthCheckId\",\
          \"documentation\":\"<p>The ID of the health check that you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"HealthCheckId\"\
        }\
      },\
      \"documentation\":\"<p>This action deletes a health check.</p>\"\
    },\
    \"DeleteHealthCheckResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element.</p>\"\
    },\
    \"DeleteHostedZoneRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the hosted zone you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        }\
      },\
      \"documentation\":\"<p>A request to delete a hosted zone.</p>\"\
    },\
    \"DeleteHostedZoneResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ChangeInfo\"],\
      \"members\":{\
        \"ChangeInfo\":{\
          \"shape\":\"ChangeInfo\",\
          \"documentation\":\"<p>A complex type that contains the ID, the status, and the date and time of a request to delete a hosted zone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response to a <code>DeleteHostedZone</code> request.</p>\"\
    },\
    \"DeleteQueryLoggingConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"QueryLoggingConfigId\",\
          \"documentation\":\"<p>The ID of the configuration that you want to delete. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        }\
      }\
    },\
    \"DeleteQueryLoggingConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteReusableDelegationSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the reusable delegation set that you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        }\
      },\
      \"documentation\":\"<p>A request to delete a reusable delegation set.</p>\"\
    },\
    \"DeleteReusableDelegationSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element.</p>\"\
    },\
    \"DeleteTrafficPolicyInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TrafficPolicyInstanceId\",\
          \"documentation\":\"<p>The ID of the traffic policy instance that you want to delete. </p> <important> <p>When you delete a traffic policy instance, Amazon Route 53 also deletes all of the resource record sets that were created when you created the traffic policy instance.</p> </important>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        }\
      },\
      \"documentation\":\"<p>A request to delete a specified traffic policy instance.</p>\"\
    },\
    \"DeleteTrafficPolicyInstanceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element.</p>\"\
    },\
    \"DeleteTrafficPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Id\",\
        \"Version\"\
      ],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TrafficPolicyId\",\
          \"documentation\":\"<p>The ID of the traffic policy that you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        },\
        \"Version\":{\
          \"shape\":\"TrafficPolicyVersion\",\
          \"documentation\":\"<p>The version number of the traffic policy that you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Version\"\
        }\
      },\
      \"documentation\":\"<p>A request to delete a specified traffic policy version.</p>\"\
    },\
    \"DeleteTrafficPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element.</p>\"\
    },\
    \"DeleteVPCAssociationAuthorizationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HostedZoneId\",\
        \"VPC\"\
      ],\
      \"members\":{\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>When removing authorization to associate a VPC that was created by one AWS account with a hosted zone that was created with a different AWS account, the ID of the hosted zone.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        },\
        \"VPC\":{\
          \"shape\":\"VPC\",\
          \"documentation\":\"<p>When removing authorization to associate a VPC that was created by one AWS account with a hosted zone that was created with a different AWS account, a complex type that includes the ID and region of the VPC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the request to remove authorization to associate a VPC that was created by one AWS account with a hosted zone that was created with a different AWS account. </p>\"\
    },\
    \"DeleteVPCAssociationAuthorizationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Empty response for the request.</p>\"\
    },\
    \"Dimension\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"DimensionField\",\
          \"documentation\":\"<p>For the metric that the CloudWatch alarm is associated with, the name of one dimension.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"DimensionField\",\
          \"documentation\":\"<p>For the metric that the CloudWatch alarm is associated with, the value of one dimension.</p>\"\
        }\
      },\
      \"documentation\":\"<p>For the metric that the CloudWatch alarm is associated with, a complex type that contains information about one dimension.</p>\"\
    },\
    \"DimensionField\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"DimensionList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Dimension\",\
        \"locationName\":\"Dimension\"\
      },\
      \"max\":10\
    },\
    \"Disabled\":{\"type\":\"boolean\"},\
    \"DisassociateVPCComment\":{\"type\":\"string\"},\
    \"DisassociateVPCFromHostedZoneRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HostedZoneId\",\
        \"VPC\"\
      ],\
      \"members\":{\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the private hosted zone that you want to disassociate a VPC from.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        },\
        \"VPC\":{\
          \"shape\":\"VPC\",\
          \"documentation\":\"<p>A complex type that contains information about the VPC that you're disassociating from the specified hosted zone.</p>\"\
        },\
        \"Comment\":{\
          \"shape\":\"DisassociateVPCComment\",\
          \"documentation\":\"<p> <i>Optional:</i> A comment about the disassociation request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the VPC that you want to disassociate from a specified private hosted zone.</p>\"\
    },\
    \"DisassociateVPCFromHostedZoneResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ChangeInfo\"],\
      \"members\":{\
        \"ChangeInfo\":{\
          \"shape\":\"ChangeInfo\",\
          \"documentation\":\"<p>A complex type that describes the changes made to the specified private hosted zone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response information for the disassociate request.</p>\"\
    },\
    \"EnableSNI\":{\"type\":\"boolean\"},\
    \"ErrorMessage\":{\"type\":\"string\"},\
    \"ErrorMessages\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ErrorMessage\",\
        \"locationName\":\"Message\"\
      }\
    },\
    \"EvaluationPeriods\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"FailureThreshold\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":1\
    },\
    \"FullyQualifiedDomainName\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"GeoLocation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContinentCode\":{\
          \"shape\":\"GeoLocationContinentCode\",\
          \"documentation\":\"<p>The two-letter code for the continent.</p> <p>Amazon Route 53 supports the following continent codes:</p> <ul> <li> <p> <b>AF</b>: Africa</p> </li> <li> <p> <b>AN</b>: Antarctica</p> </li> <li> <p> <b>AS</b>: Asia</p> </li> <li> <p> <b>EU</b>: Europe</p> </li> <li> <p> <b>OC</b>: Oceania</p> </li> <li> <p> <b>NA</b>: North America</p> </li> <li> <p> <b>SA</b>: South America</p> </li> </ul> <p>Constraint: Specifying <code>ContinentCode</code> with either <code>CountryCode</code> or <code>SubdivisionCode</code> returns an <code>InvalidInput</code> error.</p>\"\
        },\
        \"CountryCode\":{\
          \"shape\":\"GeoLocationCountryCode\",\
          \"documentation\":\"<p>For geolocation resource record sets, the two-letter code for a country.</p> <p>Amazon Route 53 uses the two-letter country codes that are specified in <a href=\\\"https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2\\\">ISO standard 3166-1 alpha-2</a>.</p>\"\
        },\
        \"SubdivisionCode\":{\
          \"shape\":\"GeoLocationSubdivisionCode\",\
          \"documentation\":\"<p>For geolocation resource record sets, the two-letter code for a state of the United States. Route 53 doesn't support any other values for <code>SubdivisionCode</code>. For a list of state abbreviations, see <a href=\\\"https://pe.usps.com/text/pub28/28apb.htm\\\">Appendix B: TwoâLetter State and Possession Abbreviations</a> on the United States Postal Service website. </p> <p>If you specify <code>subdivisioncode</code>, you must also specify <code>US</code> for <code>CountryCode</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about a geographic location.</p>\"\
    },\
    \"GeoLocationContinentCode\":{\
      \"type\":\"string\",\
      \"max\":2,\
      \"min\":2\
    },\
    \"GeoLocationContinentName\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1\
    },\
    \"GeoLocationCountryCode\":{\
      \"type\":\"string\",\
      \"max\":2,\
      \"min\":1\
    },\
    \"GeoLocationCountryName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"GeoLocationDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContinentCode\":{\
          \"shape\":\"GeoLocationContinentCode\",\
          \"documentation\":\"<p>The two-letter code for the continent.</p>\"\
        },\
        \"ContinentName\":{\
          \"shape\":\"GeoLocationContinentName\",\
          \"documentation\":\"<p>The full name of the continent.</p>\"\
        },\
        \"CountryCode\":{\
          \"shape\":\"GeoLocationCountryCode\",\
          \"documentation\":\"<p>The two-letter code for the country.</p>\"\
        },\
        \"CountryName\":{\
          \"shape\":\"GeoLocationCountryName\",\
          \"documentation\":\"<p>The name of the country.</p>\"\
        },\
        \"SubdivisionCode\":{\
          \"shape\":\"GeoLocationSubdivisionCode\",\
          \"documentation\":\"<p>The code for the subdivision. Route 53 currently supports only states in the United States.</p>\"\
        },\
        \"SubdivisionName\":{\
          \"shape\":\"GeoLocationSubdivisionName\",\
          \"documentation\":\"<p>The full name of the subdivision. Route 53 currently supports only states in the United States.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the codes and full continent, country, and subdivision names for the specified <code>geolocation</code> code.</p>\"\
    },\
    \"GeoLocationDetailsList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"GeoLocationDetails\",\
        \"locationName\":\"GeoLocationDetails\"\
      }\
    },\
    \"GeoLocationSubdivisionCode\":{\
      \"type\":\"string\",\
      \"max\":3,\
      \"min\":1\
    },\
    \"GeoLocationSubdivisionName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"GetAccountLimitRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Type\"],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"AccountLimitType\",\
          \"documentation\":\"<p>The limit that you want to get. Valid values include the following:</p> <ul> <li> <p> <b>MAX_HEALTH_CHECKS_BY_OWNER</b>: The maximum number of health checks that you can create using the current account.</p> </li> <li> <p> <b>MAX_HOSTED_ZONES_BY_OWNER</b>: The maximum number of hosted zones that you can create using the current account.</p> </li> <li> <p> <b>MAX_REUSABLE_DELEGATION_SETS_BY_OWNER</b>: The maximum number of reusable delegation sets that you can create using the current account.</p> </li> <li> <p> <b>MAX_TRAFFIC_POLICIES_BY_OWNER</b>: The maximum number of traffic policies that you can create using the current account.</p> </li> <li> <p> <b>MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER</b>: The maximum number of traffic policy instances that you can create using the current account. (Traffic policy instances are referred to as traffic flow policy records in the Amazon Route 53 console.)</p> </li> </ul>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Type\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the request to create a hosted zone.</p>\"\
    },\
    \"GetAccountLimitResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Limit\",\
        \"Count\"\
      ],\
      \"members\":{\
        \"Limit\":{\
          \"shape\":\"AccountLimit\",\
          \"documentation\":\"<p>The current setting for the specified limit. For example, if you specified <code>MAX_HEALTH_CHECKS_BY_OWNER</code> for the value of <code>Type</code> in the request, the value of <code>Limit</code> is the maximum number of health checks that you can create using the current account.</p>\"\
        },\
        \"Count\":{\
          \"shape\":\"UsageCount\",\
          \"documentation\":\"<p>The current number of entities that you have created of the specified type. For example, if you specified <code>MAX_HEALTH_CHECKS_BY_OWNER</code> for the value of <code>Type</code> in the request, the value of <code>Count</code> is the current number of health checks that you have created using the current account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the requested limit. </p>\"\
    },\
    \"GetChangeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the change batch request. The value that you specify here is the value that <code>ChangeResourceRecordSets</code> returned in the <code>Id</code> element when you submitted the request.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        }\
      },\
      \"documentation\":\"<p>The input for a GetChange request.</p>\"\
    },\
    \"GetChangeResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ChangeInfo\"],\
      \"members\":{\
        \"ChangeInfo\":{\
          \"shape\":\"ChangeInfo\",\
          \"documentation\":\"<p>A complex type that contains information about the specified change batch.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the <code>ChangeInfo</code> element.</p>\"\
    },\
    \"GetCheckerIpRangesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Empty request.</p>\"\
    },\
    \"GetCheckerIpRangesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"CheckerIpRanges\"],\
      \"members\":{\
        \"CheckerIpRanges\":{\
          \"shape\":\"CheckerIpRanges\",\
          \"documentation\":\"<p>A complex type that contains sorted list of IP ranges in CIDR format for Amazon Route 53 health checkers.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the <code>CheckerIpRanges</code> element.</p>\"\
    },\
    \"GetGeoLocationRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContinentCode\":{\
          \"shape\":\"GeoLocationContinentCode\",\
          \"documentation\":\"<p>For geolocation resource record sets, a two-letter abbreviation that identifies a continent. Amazon Route 53 supports the following continent codes:</p> <ul> <li> <p> <b>AF</b>: Africa</p> </li> <li> <p> <b>AN</b>: Antarctica</p> </li> <li> <p> <b>AS</b>: Asia</p> </li> <li> <p> <b>EU</b>: Europe</p> </li> <li> <p> <b>OC</b>: Oceania</p> </li> <li> <p> <b>NA</b>: North America</p> </li> <li> <p> <b>SA</b>: South America</p> </li> </ul>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"continentcode\"\
        },\
        \"CountryCode\":{\
          \"shape\":\"GeoLocationCountryCode\",\
          \"documentation\":\"<p>Amazon Route 53 uses the two-letter country codes that are specified in <a href=\\\"https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2\\\">ISO standard 3166-1 alpha-2</a>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"countrycode\"\
        },\
        \"SubdivisionCode\":{\
          \"shape\":\"GeoLocationSubdivisionCode\",\
          \"documentation\":\"<p>For <code>SubdivisionCode</code>, Amazon Route 53 supports only states of the United States. For a list of state abbreviations, see <a href=\\\"https://pe.usps.com/text/pub28/28apb.htm\\\">Appendix B: TwoâLetter State and Possession Abbreviations</a> on the United States Postal Service website. </p> <p>If you specify <code>subdivisioncode</code>, you must also specify <code>US</code> for <code>CountryCode</code>. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"subdivisioncode\"\
        }\
      },\
      \"documentation\":\"<p>A request for information about whether a specified geographic location is supported for Amazon Route 53 geolocation resource record sets.</p>\"\
    },\
    \"GetGeoLocationResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"GeoLocationDetails\"],\
      \"members\":{\
        \"GeoLocationDetails\":{\
          \"shape\":\"GeoLocationDetails\",\
          \"documentation\":\"<p>A complex type that contains the codes and full continent, country, and subdivision names for the specified geolocation code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response information for the specified geolocation code.</p>\"\
    },\
    \"GetHealthCheckCountRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A request for the number of health checks that are associated with the current AWS account.</p>\"\
    },\
    \"GetHealthCheckCountResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"HealthCheckCount\"],\
      \"members\":{\
        \"HealthCheckCount\":{\
          \"shape\":\"HealthCheckCount\",\
          \"documentation\":\"<p>The number of health checks associated with the current AWS account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response to a <code>GetHealthCheckCount</code> request.</p>\"\
    },\
    \"GetHealthCheckLastFailureReasonRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"HealthCheckId\"],\
      \"members\":{\
        \"HealthCheckId\":{\
          \"shape\":\"HealthCheckId\",\
          \"documentation\":\"<p>The ID for the health check for which you want the last failure reason. When you created the health check, <code>CreateHealthCheck</code> returned the ID in the response, in the <code>HealthCheckId</code> element.</p> <note> <p>If you want to get the last failure reason for a calculated health check, you must use the Amazon Route 53 console or the CloudWatch console. You can't use <code>GetHealthCheckLastFailureReason</code> for a calculated health check.</p> </note>\",\
          \"location\":\"uri\",\
          \"locationName\":\"HealthCheckId\"\
        }\
      },\
      \"documentation\":\"<p>A request for the reason that a health check failed most recently.</p>\"\
    },\
    \"GetHealthCheckLastFailureReasonResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"HealthCheckObservations\"],\
      \"members\":{\
        \"HealthCheckObservations\":{\
          \"shape\":\"HealthCheckObservations\",\
          \"documentation\":\"<p>A list that contains one <code>Observation</code> element for each Amazon Route 53 health checker that is reporting a last failure reason. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response to a <code>GetHealthCheckLastFailureReason</code> request.</p>\"\
    },\
    \"GetHealthCheckRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"HealthCheckId\"],\
      \"members\":{\
        \"HealthCheckId\":{\
          \"shape\":\"HealthCheckId\",\
          \"documentation\":\"<p>The identifier that Amazon Route 53 assigned to the health check when you created it. When you add or update a resource record set, you use this value to specify which health check to use. The value can be up to 64 characters long.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"HealthCheckId\"\
        }\
      },\
      \"documentation\":\"<p>A request to get information about a specified health check. </p>\"\
    },\
    \"GetHealthCheckResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"HealthCheck\"],\
      \"members\":{\
        \"HealthCheck\":{\
          \"shape\":\"HealthCheck\",\
          \"documentation\":\"<p>A complex type that contains information about one health check that is associated with the current AWS account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response to a <code>GetHealthCheck</code> request.</p>\"\
    },\
    \"GetHealthCheckStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"HealthCheckId\"],\
      \"members\":{\
        \"HealthCheckId\":{\
          \"shape\":\"HealthCheckId\",\
          \"documentation\":\"<p>The ID for the health check that you want the current status for. When you created the health check, <code>CreateHealthCheck</code> returned the ID in the response, in the <code>HealthCheckId</code> element.</p> <note> <p>If you want to check the status of a calculated health check, you must use the Amazon Route 53 console or the CloudWatch console. You can't use <code>GetHealthCheckStatus</code> to get the status of a calculated health check.</p> </note>\",\
          \"location\":\"uri\",\
          \"locationName\":\"HealthCheckId\"\
        }\
      },\
      \"documentation\":\"<p>A request to get the status for a health check.</p>\"\
    },\
    \"GetHealthCheckStatusResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"HealthCheckObservations\"],\
      \"members\":{\
        \"HealthCheckObservations\":{\
          \"shape\":\"HealthCheckObservations\",\
          \"documentation\":\"<p>A list that contains one <code>HealthCheckObservation</code> element for each Amazon Route 53 health checker that is reporting a status about the health check endpoint.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response to a <code>GetHealthCheck</code> request.</p>\"\
    },\
    \"GetHostedZoneCountRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A request to retrieve a count of all the hosted zones that are associated with the current AWS account.</p>\"\
    },\
    \"GetHostedZoneCountResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"HostedZoneCount\"],\
      \"members\":{\
        \"HostedZoneCount\":{\
          \"shape\":\"HostedZoneCount\",\
          \"documentation\":\"<p>The total number of public and private hosted zones that are associated with the current AWS account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response to a <code>GetHostedZoneCount</code> request.</p>\"\
    },\
    \"GetHostedZoneLimitRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Type\",\
        \"HostedZoneId\"\
      ],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"HostedZoneLimitType\",\
          \"documentation\":\"<p>The limit that you want to get. Valid values include the following:</p> <ul> <li> <p> <b>MAX_RRSETS_BY_ZONE</b>: The maximum number of records that you can create in the specified hosted zone.</p> </li> <li> <p> <b>MAX_VPCS_ASSOCIATED_BY_ZONE</b>: The maximum number of Amazon VPCs that you can associate with the specified private hosted zone.</p> </li> </ul>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Type\"\
        },\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the hosted zone that you want to get a limit for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the request to create a hosted zone.</p>\"\
    },\
    \"GetHostedZoneLimitResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Limit\",\
        \"Count\"\
      ],\
      \"members\":{\
        \"Limit\":{\
          \"shape\":\"HostedZoneLimit\",\
          \"documentation\":\"<p>The current setting for the specified limit. For example, if you specified <code>MAX_RRSETS_BY_ZONE</code> for the value of <code>Type</code> in the request, the value of <code>Limit</code> is the maximum number of records that you can create in the specified hosted zone.</p>\"\
        },\
        \"Count\":{\
          \"shape\":\"UsageCount\",\
          \"documentation\":\"<p>The current number of entities that you have created of the specified type. For example, if you specified <code>MAX_RRSETS_BY_ZONE</code> for the value of <code>Type</code> in the request, the value of <code>Count</code> is the current number of records that you have created in the specified hosted zone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the requested limit. </p>\"\
    },\
    \"GetHostedZoneRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the hosted zone that you want to get information about.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        }\
      },\
      \"documentation\":\"<p>A request to get information about a specified hosted zone. </p>\"\
    },\
    \"GetHostedZoneResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"HostedZone\"],\
      \"members\":{\
        \"HostedZone\":{\
          \"shape\":\"HostedZone\",\
          \"documentation\":\"<p>A complex type that contains general information about the specified hosted zone.</p>\"\
        },\
        \"DelegationSet\":{\
          \"shape\":\"DelegationSet\",\
          \"documentation\":\"<p>A complex type that lists the Amazon Route 53 name servers for the specified hosted zone.</p>\"\
        },\
        \"VPCs\":{\
          \"shape\":\"VPCs\",\
          \"documentation\":\"<p>A complex type that contains information about the VPCs that are associated with the specified hosted zone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contain the response to a <code>GetHostedZone</code> request.</p>\"\
    },\
    \"GetQueryLoggingConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"QueryLoggingConfigId\",\
          \"documentation\":\"<p>The ID of the configuration for DNS query logging that you want to get information about.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        }\
      }\
    },\
    \"GetQueryLoggingConfigResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"QueryLoggingConfig\"],\
      \"members\":{\
        \"QueryLoggingConfig\":{\
          \"shape\":\"QueryLoggingConfig\",\
          \"documentation\":\"<p>A complex type that contains information about the query logging configuration that you specified in a <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetQueryLoggingConfig.html\\\">GetQueryLoggingConfig</a> request.</p>\"\
        }\
      }\
    },\
    \"GetReusableDelegationSetLimitRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Type\",\
        \"DelegationSetId\"\
      ],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"ReusableDelegationSetLimitType\",\
          \"documentation\":\"<p>Specify <code>MAX_ZONES_BY_REUSABLE_DELEGATION_SET</code> to get the maximum number of hosted zones that you can associate with the specified reusable delegation set.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Type\"\
        },\
        \"DelegationSetId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the delegation set that you want to get the limit for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the request to create a hosted zone.</p>\"\
    },\
    \"GetReusableDelegationSetLimitResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Limit\",\
        \"Count\"\
      ],\
      \"members\":{\
        \"Limit\":{\
          \"shape\":\"ReusableDelegationSetLimit\",\
          \"documentation\":\"<p>The current setting for the limit on hosted zones that you can associate with the specified reusable delegation set.</p>\"\
        },\
        \"Count\":{\
          \"shape\":\"UsageCount\",\
          \"documentation\":\"<p>The current number of hosted zones that you can associate with the specified reusable delegation set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the requested limit. </p>\"\
    },\
    \"GetReusableDelegationSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the reusable delegation set that you want to get a list of name servers for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        }\
      },\
      \"documentation\":\"<p>A request to get information about a specified reusable delegation set.</p>\"\
    },\
    \"GetReusableDelegationSetResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"DelegationSet\"],\
      \"members\":{\
        \"DelegationSet\":{\
          \"shape\":\"DelegationSet\",\
          \"documentation\":\"<p>A complex type that contains information about the reusable delegation set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response to the <code>GetReusableDelegationSet</code> request.</p>\"\
    },\
    \"GetTrafficPolicyInstanceCountRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Request to get the number of traffic policy instances that are associated with the current AWS account.</p>\"\
    },\
    \"GetTrafficPolicyInstanceCountResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrafficPolicyInstanceCount\"],\
      \"members\":{\
        \"TrafficPolicyInstanceCount\":{\
          \"shape\":\"TrafficPolicyInstanceCount\",\
          \"documentation\":\"<p>The number of traffic policy instances that are associated with the current AWS account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the resource record sets that Amazon Route 53 created based on a specified traffic policy.</p>\"\
    },\
    \"GetTrafficPolicyInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TrafficPolicyInstanceId\",\
          \"documentation\":\"<p>The ID of the traffic policy instance that you want to get information about.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        }\
      },\
      \"documentation\":\"<p>Gets information about a specified traffic policy instance.</p>\"\
    },\
    \"GetTrafficPolicyInstanceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrafficPolicyInstance\"],\
      \"members\":{\
        \"TrafficPolicyInstance\":{\
          \"shape\":\"TrafficPolicyInstance\",\
          \"documentation\":\"<p>A complex type that contains settings for the traffic policy instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the resource record sets that Amazon Route 53 created based on a specified traffic policy.</p>\"\
    },\
    \"GetTrafficPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Id\",\
        \"Version\"\
      ],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TrafficPolicyId\",\
          \"documentation\":\"<p>The ID of the traffic policy that you want to get information about.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        },\
        \"Version\":{\
          \"shape\":\"TrafficPolicyVersion\",\
          \"documentation\":\"<p>The version number of the traffic policy that you want to get information about.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Version\"\
        }\
      },\
      \"documentation\":\"<p>Gets information about a specific traffic policy version.</p>\"\
    },\
    \"GetTrafficPolicyResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrafficPolicy\"],\
      \"members\":{\
        \"TrafficPolicy\":{\
          \"shape\":\"TrafficPolicy\",\
          \"documentation\":\"<p>A complex type that contains settings for the specified traffic policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response information for the request.</p>\"\
    },\
    \"HealthCheck\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Id\",\
        \"CallerReference\",\
        \"HealthCheckConfig\",\
        \"HealthCheckVersion\"\
      ],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"HealthCheckId\",\
          \"documentation\":\"<p>The identifier that Amazon Route 53assigned to the health check when you created it. When you add or update a resource record set, you use this value to specify which health check to use. The value can be up to 64 characters long. </p>\"\
        },\
        \"CallerReference\":{\
          \"shape\":\"HealthCheckNonce\",\
          \"documentation\":\"<p>A unique string that you specified when you created the health check.</p>\"\
        },\
        \"LinkedService\":{\
          \"shape\":\"LinkedService\",\
          \"documentation\":\"<p>If the health check was created by another service, the service that created the health check. When a health check is created by another service, you can't edit or delete it using Amazon Route 53. </p>\"\
        },\
        \"HealthCheckConfig\":{\
          \"shape\":\"HealthCheckConfig\",\
          \"documentation\":\"<p>A complex type that contains detailed information about one health check.</p>\"\
        },\
        \"HealthCheckVersion\":{\
          \"shape\":\"HealthCheckVersion\",\
          \"documentation\":\"<p>The version of the health check. You can optionally pass this value in a call to <code>UpdateHealthCheck</code> to prevent overwriting another change to the health check.</p>\"\
        },\
        \"CloudWatchAlarmConfiguration\":{\
          \"shape\":\"CloudWatchAlarmConfiguration\",\
          \"documentation\":\"<p>A complex type that contains information about the CloudWatch alarm that Amazon Route 53 is monitoring for this health check.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about one health check that is associated with the current AWS account.</p>\"\
    },\
    \"HealthCheckAlreadyExists\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p> The health check you're attempting to create already exists. Amazon Route 53 returns this error when you submit a request that has the following values:</p> <ul> <li> <p>The same value for <code>CallerReference</code> as an existing health check, and one or more values that differ from the existing health check that has the same caller reference.</p> </li> <li> <p>The same value for <code>CallerReference</code> as a health check that you created and later deleted, regardless of the other settings in the request.</p> </li> </ul>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"HealthCheckConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"Type\"],\
      \"members\":{\
        \"IPAddress\":{\
          \"shape\":\"IPAddress\",\
          \"documentation\":\"<p>The IPv4 or IPv6 IP address of the endpoint that you want Amazon Route 53 to perform health checks on. If you don't specify a value for <code>IPAddress</code>, Route 53 sends a DNS request to resolve the domain name that you specify in <code>FullyQualifiedDomainName</code> at the interval that you specify in <code>RequestInterval</code>. Using an IP address returned by DNS, Route 53 then checks the health of the endpoint.</p> <p>Use one of the following formats for the value of <code>IPAddress</code>: </p> <ul> <li> <p> <b>IPv4 address</b>: four values between 0 and 255, separated by periods (.), for example, <code>192.0.2.44</code>.</p> </li> <li> <p> <b>IPv6 address</b>: eight groups of four hexadecimal values, separated by colons (:), for example, <code>2001:0db8:85a3:0000:0000:abcd:0001:2345</code>. You can also shorten IPv6 addresses as described in RFC 5952, for example, <code>2001:db8:85a3::abcd:1:2345</code>.</p> </li> </ul> <p>If the endpoint is an EC2 instance, we recommend that you create an Elastic IP address, associate it with your EC2 instance, and specify the Elastic IP address for <code>IPAddress</code>. This ensures that the IP address of your instance will never change.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-FullyQualifiedDomainName\\\">FullyQualifiedDomainName</a>. </p> <p>Constraints: Route 53 can't check the health of endpoints for which the IP address is in local, private, non-routable, or multicast ranges. For more information about IP addresses for which you can't create health checks, see the following documents:</p> <ul> <li> <p> <a href=\\\"https://tools.ietf.org/html/rfc5735\\\">RFC 5735, Special Use IPv4 Addresses</a> </p> </li> <li> <p> <a href=\\\"https://tools.ietf.org/html/rfc6598\\\">RFC 6598, IANA-Reserved IPv4 Prefix for Shared Address Space</a> </p> </li> <li> <p> <a href=\\\"https://tools.ietf.org/html/rfc5156\\\">RFC 5156, Special-Use IPv6 Addresses</a> </p> </li> </ul> <p>When the value of <code>Type</code> is <code>CALCULATED</code> or <code>CLOUDWATCH_METRIC</code>, omit <code>IPAddress</code>.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>The port on the endpoint that you want Amazon Route 53 to perform health checks on.</p> <note> <p>Don't specify a value for <code>Port</code> when you specify a value for <code>Type</code> of <code>CLOUDWATCH_METRIC</code> or <code>CALCULATED</code>.</p> </note>\"\
        },\
        \"Type\":{\
          \"shape\":\"HealthCheckType\",\
          \"documentation\":\"<p>The type of health check that you want to create, which indicates how Amazon Route 53 determines whether an endpoint is healthy.</p> <important> <p>You can't change the value of <code>Type</code> after you create a health check.</p> </important> <p>You can create the following types of health checks:</p> <ul> <li> <p> <b>HTTP</b>: Route 53 tries to establish a TCP connection. If successful, Route 53 submits an HTTP request and waits for an HTTP status code of 200 or greater and less than 400.</p> </li> <li> <p> <b>HTTPS</b>: Route 53 tries to establish a TCP connection. If successful, Route 53 submits an HTTPS request and waits for an HTTP status code of 200 or greater and less than 400.</p> <important> <p>If you specify <code>HTTPS</code> for the value of <code>Type</code>, the endpoint must support TLS v1.0 or later.</p> </important> </li> <li> <p> <b>HTTP_STR_MATCH</b>: Route 53 tries to establish a TCP connection. If successful, Route 53 submits an HTTP request and searches the first 5,120 bytes of the response body for the string that you specify in <code>SearchString</code>.</p> </li> <li> <p> <b>HTTPS_STR_MATCH</b>: Route 53 tries to establish a TCP connection. If successful, Route 53 submits an <code>HTTPS</code> request and searches the first 5,120 bytes of the response body for the string that you specify in <code>SearchString</code>.</p> </li> <li> <p> <b>TCP</b>: Route 53 tries to establish a TCP connection.</p> </li> <li> <p> <b>CLOUDWATCH_METRIC</b>: The health check is associated with a CloudWatch alarm. If the state of the alarm is <code>OK</code>, the health check is considered healthy. If the state is <code>ALARM</code>, the health check is considered unhealthy. If CloudWatch doesn't have sufficient data to determine whether the state is <code>OK</code> or <code>ALARM</code>, the health check status depends on the setting for <code>InsufficientDataHealthStatus</code>: <code>Healthy</code>, <code>Unhealthy</code>, or <code>LastKnownStatus</code>. </p> </li> <li> <p> <b>CALCULATED</b>: For health checks that monitor the status of other health checks, Route 53 adds up the number of health checks that Route 53 health checkers consider to be healthy and compares that number with the value of <code>HealthThreshold</code>. </p> </li> </ul> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html\\\">How Route 53 Determines Whether an Endpoint Is Healthy</a> in the <i>Amazon Route 53 Developer Guide</i>.</p>\"\
        },\
        \"ResourcePath\":{\
          \"shape\":\"ResourcePath\",\
          \"documentation\":\"<p>The path, if any, that you want Amazon Route 53 to request when performing health checks. The path can be any value for which your endpoint will return an HTTP status code of 2xx or 3xx when the endpoint is healthy, for example, the file /docs/route53-health-check.html. You can also include query string parameters, for example, <code>/welcome.html?language=jp&amp;login=y</code>. </p>\"\
        },\
        \"FullyQualifiedDomainName\":{\
          \"shape\":\"FullyQualifiedDomainName\",\
          \"documentation\":\"<p>Amazon Route 53 behavior depends on whether you specify a value for <code>IPAddress</code>.</p> <p> <b>If you specify a value for</b> <code>IPAddress</code>:</p> <p>Amazon Route 53 sends health check requests to the specified IPv4 or IPv6 address and passes the value of <code>FullyQualifiedDomainName</code> in the <code>Host</code> header for all health checks except TCP health checks. This is typically the fully qualified DNS name of the endpoint on which you want Route 53 to perform health checks.</p> <p>When Route 53 checks the health of an endpoint, here is how it constructs the <code>Host</code> header:</p> <ul> <li> <p>If you specify a value of <code>80</code> for <code>Port</code> and <code>HTTP</code> or <code>HTTP_STR_MATCH</code> for <code>Type</code>, Route 53 passes the value of <code>FullyQualifiedDomainName</code> to the endpoint in the Host header. </p> </li> <li> <p>If you specify a value of <code>443</code> for <code>Port</code> and <code>HTTPS</code> or <code>HTTPS_STR_MATCH</code> for <code>Type</code>, Route 53 passes the value of <code>FullyQualifiedDomainName</code> to the endpoint in the <code>Host</code> header.</p> </li> <li> <p>If you specify another value for <code>Port</code> and any value except <code>TCP</code> for <code>Type</code>, Route 53 passes <code>FullyQualifiedDomainName:Port</code> to the endpoint in the <code>Host</code> header.</p> </li> </ul> <p>If you don't specify a value for <code>FullyQualifiedDomainName</code>, Route 53 substitutes the value of <code>IPAddress</code> in the <code>Host</code> header in each of the preceding cases.</p> <p> <b>If you don't specify a value for <code>IPAddress</code> </b>:</p> <p>Route 53 sends a DNS request to the domain that you specify for <code>FullyQualifiedDomainName</code> at the interval that you specify for <code>RequestInterval</code>. Using an IPv4 address that DNS returns, Route 53 then checks the health of the endpoint.</p> <note> <p>If you don't specify a value for <code>IPAddress</code>, Route 53 uses only IPv4 to send health checks to the endpoint. If there's no resource record set with a type of A for the name that you specify for <code>FullyQualifiedDomainName</code>, the health check fails with a \\\"DNS resolution failed\\\" error.</p> </note> <p>If you want to check the health of weighted, latency, or failover resource record sets and you choose to specify the endpoint only by <code>FullyQualifiedDomainName</code>, we recommend that you create a separate health check for each endpoint. For example, create a health check for each HTTP server that is serving content for www.example.com. For the value of <code>FullyQualifiedDomainName</code>, specify the domain name of the server (such as us-east-2-www.example.com), not the name of the resource record sets (www.example.com).</p> <important> <p>In this configuration, if you create a health check for which the value of <code>FullyQualifiedDomainName</code> matches the name of the resource record sets and you then associate the health check with those resource record sets, health check results will be unpredictable.</p> </important> <p>In addition, if the value that you specify for <code>Type</code> is <code>HTTP</code>, <code>HTTPS</code>, <code>HTTP_STR_MATCH</code>, or <code>HTTPS_STR_MATCH</code>, Route 53 passes the value of <code>FullyQualifiedDomainName</code> in the <code>Host</code> header, as it does when you specify a value for <code>IPAddress</code>. If the value of <code>Type</code> is <code>TCP</code>, Route 53 doesn't pass a <code>Host</code> header.</p>\"\
        },\
        \"SearchString\":{\
          \"shape\":\"SearchString\",\
          \"documentation\":\"<p>If the value of Type is <code>HTTP_STR_MATCH</code> or <code>HTTPS_STR_MATCH</code>, the string that you want Amazon Route 53 to search for in the response body from the specified resource. If the string appears in the response body, Route 53 considers the resource healthy.</p> <p>Route 53 considers case when searching for <code>SearchString</code> in the response body. </p>\"\
        },\
        \"RequestInterval\":{\
          \"shape\":\"RequestInterval\",\
          \"documentation\":\"<p>The number of seconds between the time that Amazon Route 53 gets a response from your endpoint and the time that it sends the next health check request. Each Route 53 health checker makes requests at this interval.</p> <important> <p>You can't change the value of <code>RequestInterval</code> after you create a health check.</p> </important> <p>If you don't specify a value for <code>RequestInterval</code>, the default value is <code>30</code> seconds.</p>\"\
        },\
        \"FailureThreshold\":{\
          \"shape\":\"FailureThreshold\",\
          \"documentation\":\"<p>The number of consecutive health checks that an endpoint must pass or fail for Amazon Route 53 to change the current status of the endpoint from unhealthy to healthy or vice versa. For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html\\\">How Amazon Route 53 Determines Whether an Endpoint Is Healthy</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>If you don't specify a value for <code>FailureThreshold</code>, the default value is three health checks.</p>\"\
        },\
        \"MeasureLatency\":{\
          \"shape\":\"MeasureLatency\",\
          \"documentation\":\"<p>Specify whether you want Amazon Route 53 to measure the latency between health checkers in multiple AWS regions and your endpoint, and to display CloudWatch latency graphs on the <b>Health Checks</b> page in the Route 53 console.</p> <important> <p>You can't change the value of <code>MeasureLatency</code> after you create a health check.</p> </important>\"\
        },\
        \"Inverted\":{\
          \"shape\":\"Inverted\",\
          \"documentation\":\"<p>Specify whether you want Amazon Route 53 to invert the status of a health check, for example, to consider a health check unhealthy when it otherwise would be considered healthy.</p>\"\
        },\
        \"Disabled\":{\
          \"shape\":\"Disabled\",\
          \"documentation\":\"<p>Stops Route 53 from performing health checks. When you disable a health check, here's what happens:</p> <ul> <li> <p> <b>Health checks that check the health of endpoints:</b> Route 53 stops submitting requests to your application, server, or other resource.</p> </li> <li> <p> <b>Calculated health checks:</b> Route 53 stops aggregating the status of the referenced health checks.</p> </li> <li> <p> <b>Health checks that monitor CloudWatch alarms:</b> Route 53 stops monitoring the corresponding CloudWatch metrics.</p> </li> </ul> <p>After you disable a health check, Route 53 considers the status of the health check to always be healthy. If you configured DNS failover, Route 53 continues to route traffic to the corresponding resources. If you want to stop routing traffic to a resource, change the value of <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-Inverted\\\">Inverted</a>. </p> <p>Charges for a health check still apply when the health check is disabled. For more information, see <a href=\\\"http://aws.amazon.com/route53/pricing/\\\">Amazon Route 53 Pricing</a>.</p>\"\
        },\
        \"HealthThreshold\":{\
          \"shape\":\"HealthThreshold\",\
          \"documentation\":\"<p>The number of child health checks that are associated with a <code>CALCULATED</code> health check that Amazon Route 53 must consider healthy for the <code>CALCULATED</code> health check to be considered healthy. To specify the child health checks that you want to associate with a <code>CALCULATED</code> health check, use the <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-ChildHealthChecks\\\">ChildHealthChecks</a> element.</p> <p>Note the following:</p> <ul> <li> <p>If you specify a number greater than the number of child health checks, Route 53 always considers this health check to be unhealthy.</p> </li> <li> <p>If you specify <code>0</code>, Route 53 always considers this health check to be healthy.</p> </li> </ul>\"\
        },\
        \"ChildHealthChecks\":{\
          \"shape\":\"ChildHealthCheckList\",\
          \"documentation\":\"<p>(CALCULATED Health Checks Only) A complex type that contains one <code>ChildHealthCheck</code> element for each health check that you want to associate with a <code>CALCULATED</code> health check.</p>\"\
        },\
        \"EnableSNI\":{\
          \"shape\":\"EnableSNI\",\
          \"documentation\":\"<p>Specify whether you want Amazon Route 53 to send the value of <code>FullyQualifiedDomainName</code> to the endpoint in the <code>client_hello</code> message during TLS negotiation. This allows the endpoint to respond to <code>HTTPS</code> health check requests with the applicable SSL/TLS certificate.</p> <p>Some endpoints require that <code>HTTPS</code> requests include the host name in the <code>client_hello</code> message. If you don't enable SNI, the status of the health check will be <code>SSL alert handshake_failure</code>. A health check can also have that status for other reasons. If SNI is enabled and you're still getting the error, check the SSL/TLS configuration on your endpoint and confirm that your certificate is valid.</p> <p>The SSL/TLS certificate on your endpoint includes a domain name in the <code>Common Name</code> field and possibly several more in the <code>Subject Alternative Names</code> field. One of the domain names in the certificate should match the value that you specify for <code>FullyQualifiedDomainName</code>. If the endpoint responds to the <code>client_hello</code> message with a certificate that does not include the domain name that you specified in <code>FullyQualifiedDomainName</code>, a health checker will retry the handshake. In the second attempt, the health checker will omit <code>FullyQualifiedDomainName</code> from the <code>client_hello</code> message.</p>\"\
        },\
        \"Regions\":{\
          \"shape\":\"HealthCheckRegionList\",\
          \"documentation\":\"<p>A complex type that contains one <code>Region</code> element for each region from which you want Amazon Route 53 health checkers to check the specified endpoint.</p> <p>If you don't specify any regions, Route 53 health checkers automatically performs checks from all of the regions that are listed under <b>Valid Values</b>.</p> <p>If you update a health check to remove a region that has been performing health checks, Route 53 will briefly continue to perform checks from that region to ensure that some health checkers are always checking the endpoint (for example, if you replace three regions with four different regions). </p>\"\
        },\
        \"AlarmIdentifier\":{\
          \"shape\":\"AlarmIdentifier\",\
          \"documentation\":\"<p>A complex type that identifies the CloudWatch alarm that you want Amazon Route 53 health checkers to use to determine whether the specified health check is healthy.</p>\"\
        },\
        \"InsufficientDataHealthStatus\":{\
          \"shape\":\"InsufficientDataHealthStatus\",\
          \"documentation\":\"<p>When CloudWatch has insufficient data about the metric to determine the alarm state, the status that you want Amazon Route 53 to assign to the health check:</p> <ul> <li> <p> <code>Healthy</code>: Route 53 considers the health check to be healthy.</p> </li> <li> <p> <code>Unhealthy</code>: Route 53 considers the health check to be unhealthy.</p> </li> <li> <p> <code>LastKnownStatus</code>: Route 53 uses the status of the health check from the last time that CloudWatch had sufficient data to determine the alarm state. For new health checks that have no last known status, the default status for the health check is healthy.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the health check.</p>\"\
    },\
    \"HealthCheckCount\":{\"type\":\"long\"},\
    \"HealthCheckId\":{\
      \"type\":\"string\",\
      \"max\":64\
    },\
    \"HealthCheckInUse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This error code is not in use.</p>\",\
      \"deprecated\":true,\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"HealthCheckNonce\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"HealthCheckObservation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Region\":{\
          \"shape\":\"HealthCheckRegion\",\
          \"documentation\":\"<p>The region of the Amazon Route 53 health checker that provided the status in <code>StatusReport</code>.</p>\"\
        },\
        \"IPAddress\":{\
          \"shape\":\"IPAddress\",\
          \"documentation\":\"<p>The IP address of the Amazon Route 53 health checker that provided the failure reason in <code>StatusReport</code>.</p>\"\
        },\
        \"StatusReport\":{\
          \"shape\":\"StatusReport\",\
          \"documentation\":\"<p>A complex type that contains the last failure reason as reported by one Amazon Route 53 health checker and the time of the failed health check.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the last failure reason as reported by one Amazon Route 53 health checker.</p>\"\
    },\
    \"HealthCheckObservations\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"HealthCheckObservation\",\
        \"locationName\":\"HealthCheckObservation\"\
      }\
    },\
    \"HealthCheckRegion\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"us-east-1\",\
        \"us-west-1\",\
        \"us-west-2\",\
        \"eu-west-1\",\
        \"ap-southeast-1\",\
        \"ap-southeast-2\",\
        \"ap-northeast-1\",\
        \"sa-east-1\"\
      ],\
      \"max\":64,\
      \"min\":1\
    },\
    \"HealthCheckRegionList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"HealthCheckRegion\",\
        \"locationName\":\"Region\"\
      },\
      \"max\":64,\
      \"min\":3\
    },\
    \"HealthCheckType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"HTTP\",\
        \"HTTPS\",\
        \"HTTP_STR_MATCH\",\
        \"HTTPS_STR_MATCH\",\
        \"TCP\",\
        \"CALCULATED\",\
        \"CLOUDWATCH_METRIC\"\
      ]\
    },\
    \"HealthCheckVersion\":{\
      \"type\":\"long\",\
      \"min\":1\
    },\
    \"HealthCheckVersionMismatch\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The value of <code>HealthCheckVersion</code> in the request doesn't match the value of <code>HealthCheckVersion</code> in the health check.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"HealthChecks\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"HealthCheck\",\
        \"locationName\":\"HealthCheck\"\
      }\
    },\
    \"HealthThreshold\":{\
      \"type\":\"integer\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"HostedZone\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Id\",\
        \"Name\",\
        \"CallerReference\"\
      ],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID that Amazon Route 53 assigned to the hosted zone when you created it.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>The name of the domain. For public hosted zones, this is the name that you have registered with your DNS registrar.</p> <p>For information about how to specify characters other than <code>a-z</code>, <code>0-9</code>, and <code>-</code> (hyphen) and how to specify internationalized domain names, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateHostedZone.html\\\">CreateHostedZone</a>.</p>\"\
        },\
        \"CallerReference\":{\
          \"shape\":\"Nonce\",\
          \"documentation\":\"<p>The value that you specified for <code>CallerReference</code> when you created the hosted zone.</p>\"\
        },\
        \"Config\":{\
          \"shape\":\"HostedZoneConfig\",\
          \"documentation\":\"<p>A complex type that includes the <code>Comment</code> and <code>PrivateZone</code> elements. If you omitted the <code>HostedZoneConfig</code> and <code>Comment</code> elements from the request, the <code>Config</code> and <code>Comment</code> elements don't appear in the response.</p>\"\
        },\
        \"ResourceRecordSetCount\":{\
          \"shape\":\"HostedZoneRRSetCount\",\
          \"documentation\":\"<p>The number of resource record sets in the hosted zone.</p>\"\
        },\
        \"LinkedService\":{\
          \"shape\":\"LinkedService\",\
          \"documentation\":\"<p>If the hosted zone was created by another service, the service that created the hosted zone. When a hosted zone is created by another service, you can't edit or delete it using Route 53. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains general information about the hosted zone.</p>\"\
    },\
    \"HostedZoneAlreadyExists\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The hosted zone you're trying to create already exists. Amazon Route 53 returns this error when a hosted zone has already been created with the specified <code>CallerReference</code>.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"HostedZoneConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Comment\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>Any comments that you want to include about the hosted zone.</p>\"\
        },\
        \"PrivateZone\":{\
          \"shape\":\"IsPrivateZone\",\
          \"documentation\":\"<p>A value that indicates whether this is a private hosted zone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains an optional comment about your hosted zone. If you don't want to specify a comment, omit both the <code>HostedZoneConfig</code> and <code>Comment</code> elements.</p>\"\
    },\
    \"HostedZoneCount\":{\"type\":\"long\"},\
    \"HostedZoneLimit\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Type\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"HostedZoneLimitType\",\
          \"documentation\":\"<p>The limit that you requested. Valid values include the following:</p> <ul> <li> <p> <b>MAX_RRSETS_BY_ZONE</b>: The maximum number of records that you can create in the specified hosted zone.</p> </li> <li> <p> <b>MAX_VPCS_ASSOCIATED_BY_ZONE</b>: The maximum number of Amazon VPCs that you can associate with the specified private hosted zone.</p> </li> </ul>\"\
        },\
        \"Value\":{\
          \"shape\":\"LimitValue\",\
          \"documentation\":\"<p>The current value for the limit that is specified by <code>Type</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the type of limit that you specified in the request and the current value for that limit.</p>\"\
    },\
    \"HostedZoneLimitType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"MAX_RRSETS_BY_ZONE\",\
        \"MAX_VPCS_ASSOCIATED_BY_ZONE\"\
      ]\
    },\
    \"HostedZoneNotEmpty\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The hosted zone contains resource records that are not SOA or NS records.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"HostedZoneNotFound\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified HostedZone can't be found.</p>\",\
      \"exception\":true\
    },\
    \"HostedZoneNotPrivate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified hosted zone is a public hosted zone, not a private hosted zone.</p>\",\
      \"exception\":true\
    },\
    \"HostedZoneOwner\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OwningAccount\":{\
          \"shape\":\"AWSAccountID\",\
          \"documentation\":\"<p>If the hosted zone was created by an AWS account, or was created by an AWS service that creates hosted zones using the current account, <code>OwningAccount</code> contains the account ID of that account. For example, when you use AWS Cloud Map to create a hosted zone, Cloud Map creates the hosted zone using the current AWS account. </p>\"\
        },\
        \"OwningService\":{\
          \"shape\":\"HostedZoneOwningService\",\
          \"documentation\":\"<p>If an AWS service uses its own account to create a hosted zone and associate the specified VPC with that hosted zone, <code>OwningService</code> contains an abbreviation that identifies the service. For example, if Amazon Elastic File System (Amazon EFS) created a hosted zone and associated a VPC with the hosted zone, the value of <code>OwningService</code> is <code>efs.amazonaws.com</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that identifies a hosted zone that a specified Amazon VPC is associated with and the owner of the hosted zone. If there is a value for <code>OwningAccount</code>, there is no value for <code>OwningService</code>, and vice versa. </p>\"\
    },\
    \"HostedZoneOwningService\":{\
      \"type\":\"string\",\
      \"max\":128\
    },\
    \"HostedZoneRRSetCount\":{\"type\":\"long\"},\
    \"HostedZoneSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"HostedZoneSummary\",\
        \"locationName\":\"HostedZoneSummary\"\
      }\
    },\
    \"HostedZoneSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HostedZoneId\",\
        \"Name\",\
        \"Owner\"\
      ],\
      \"members\":{\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The Route 53 hosted zone ID of a private hosted zone that the specified VPC is associated with.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>The name of the private hosted zone, such as <code>example.com</code>.</p>\"\
        },\
        \"Owner\":{\
          \"shape\":\"HostedZoneOwner\",\
          \"documentation\":\"<p>The owner of a private hosted zone that the specified VPC is associated with. The owner can be either an AWS account or an AWS service.</p>\"\
        }\
      },\
      \"documentation\":\"<p>In the response to a <code>ListHostedZonesByVPC</code> request, the <code>HostedZoneSummaries</code> element contains one <code>HostedZoneSummary</code> element for each hosted zone that the specified Amazon VPC is associated with. Each <code>HostedZoneSummary</code> element contains the hosted zone name and ID, and information about who owns the hosted zone.</p>\"\
    },\
    \"HostedZones\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"HostedZone\",\
        \"locationName\":\"HostedZone\"\
      }\
    },\
    \"IPAddress\":{\
      \"type\":\"string\",\
      \"max\":45,\
      \"pattern\":\"(^((([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))$|^(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\\\\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\\\\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))$)\"\
    },\
    \"IPAddressCidr\":{\"type\":\"string\"},\
    \"IncompatibleVersion\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The resource you're trying to access is unsupported on this Amazon Route 53 endpoint.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InsufficientCloudWatchLogsResourcePolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Amazon Route 53 doesn't have the permissions required to create log streams and send query logs to log streams. Possible causes include the following:</p> <ul> <li> <p>There is no resource policy that specifies the log group ARN in the value for <code>Resource</code>.</p> </li> <li> <p>The resource policy that includes the log group ARN in the value for <code>Resource</code> doesn't have the necessary permissions.</p> </li> <li> <p>The resource policy hasn't finished propagating yet.</p> </li> </ul>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InsufficientDataHealthStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Healthy\",\
        \"Unhealthy\",\
        \"LastKnownStatus\"\
      ]\
    },\
    \"InvalidArgument\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Parameter name is invalid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidChangeBatch\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"messages\":{\
          \"shape\":\"ErrorMessages\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        },\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>This exception contains a list of messages that might contain one or more error messages. Each error message indicates one error in the change batch.</p>\",\
      \"exception\":true\
    },\
    \"InvalidDomainName\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified domain name is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidPaginationToken\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The value that you specified to get the second or subsequent page of results is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidTrafficPolicyDocument\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The format of the traffic policy document that you specified in the <code>Document</code> element is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidVPCId\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The VPC ID that you specified either isn't a valid ID or the current account is not authorized to access this VPC.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"Inverted\":{\"type\":\"boolean\"},\
    \"IsPrivateZone\":{\"type\":\"boolean\"},\
    \"LastVPCAssociation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The VPC that you're trying to disassociate from the private hosted zone is the last VPC that is associated with the hosted zone. Amazon Route 53 doesn't support disassociating the last VPC from a hosted zone.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"LimitValue\":{\
      \"type\":\"long\",\
      \"min\":1\
    },\
    \"LimitsExceeded\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This operation can't be completed either because the current account has reached the limit on reusable delegation sets that it can create or because you've reached the limit on the number of Amazon VPCs that you can associate with a private hosted zone. To get the current limit on the number of reusable delegation sets, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetAccountLimit.html\\\">GetAccountLimit</a>. To get the current limit on the number of Amazon VPCs that you can associate with a private hosted zone, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetHostedZoneLimit.html\\\">GetHostedZoneLimit</a>. To request a higher limit, <a href=\\\"http://aws.amazon.com/route53-request\\\">create a case</a> with the AWS Support Center.</p>\",\
      \"exception\":true\
    },\
    \"LinkedService\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ServicePrincipal\":{\
          \"shape\":\"ServicePrincipal\",\
          \"documentation\":\"<p>If the health check or hosted zone was created by another service, the service that created the resource. When a resource is created by another service, you can't edit or delete it using Amazon Route 53. </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>If the health check or hosted zone was created by another service, an optional description that can be provided by the other service. When a resource is created by another service, you can't edit or delete it using Amazon Route 53. </p>\"\
        }\
      },\
      \"documentation\":\"<p>If a health check or hosted zone was created by another service, <code>LinkedService</code> is a complex type that describes the service that created the resource. When a resource is created by another service, you can't edit or delete it using Amazon Route 53. </p>\"\
    },\
    \"ListGeoLocationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StartContinentCode\":{\
          \"shape\":\"GeoLocationContinentCode\",\
          \"documentation\":\"<p>The code for the continent with which you want to start listing locations that Amazon Route 53 supports for geolocation. If Route 53 has already returned a page or more of results, if <code>IsTruncated</code> is true, and if <code>NextContinentCode</code> from the previous response has a value, enter that value in <code>startcontinentcode</code> to return the next page of results.</p> <p>Include <code>startcontinentcode</code> only if you want to list continents. Don't include <code>startcontinentcode</code> when you're listing countries or countries with their subdivisions.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"startcontinentcode\"\
        },\
        \"StartCountryCode\":{\
          \"shape\":\"GeoLocationCountryCode\",\
          \"documentation\":\"<p>The code for the country with which you want to start listing locations that Amazon Route 53 supports for geolocation. If Route 53 has already returned a page or more of results, if <code>IsTruncated</code> is <code>true</code>, and if <code>NextCountryCode</code> from the previous response has a value, enter that value in <code>startcountrycode</code> to return the next page of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"startcountrycode\"\
        },\
        \"StartSubdivisionCode\":{\
          \"shape\":\"GeoLocationSubdivisionCode\",\
          \"documentation\":\"<p>The code for the state of the United States with which you want to start listing locations that Amazon Route 53 supports for geolocation. If Route 53 has already returned a page or more of results, if <code>IsTruncated</code> is <code>true</code>, and if <code>NextSubdivisionCode</code> from the previous response has a value, enter that value in <code>startsubdivisioncode</code> to return the next page of results.</p> <p>To list subdivisions (U.S. states), you must include both <code>startcountrycode</code> and <code>startsubdivisioncode</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"startsubdivisioncode\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>(Optional) The maximum number of geolocations to be included in the response body for this request. If more than <code>maxitems</code> geolocations remain to be listed, then the value of the <code>IsTruncated</code> element in the response is <code>true</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxitems\"\
        }\
      },\
      \"documentation\":\"<p>A request to get a list of geographic locations that Amazon Route 53 supports for geolocation resource record sets. </p>\"\
    },\
    \"ListGeoLocationsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GeoLocationDetailsList\",\
        \"IsTruncated\",\
        \"MaxItems\"\
      ],\
      \"members\":{\
        \"GeoLocationDetailsList\":{\
          \"shape\":\"GeoLocationDetailsList\",\
          \"documentation\":\"<p>A complex type that contains one <code>GeoLocationDetails</code> element for each location that Amazon Route 53 supports for geolocation.</p>\"\
        },\
        \"IsTruncated\":{\
          \"shape\":\"PageTruncated\",\
          \"documentation\":\"<p>A value that indicates whether more locations remain to be listed after the last location in this response. If so, the value of <code>IsTruncated</code> is <code>true</code>. To get more values, submit another request and include the values of <code>NextContinentCode</code>, <code>NextCountryCode</code>, and <code>NextSubdivisionCode</code> in the <code>startcontinentcode</code>, <code>startcountrycode</code>, and <code>startsubdivisioncode</code>, as applicable.</p>\"\
        },\
        \"NextContinentCode\":{\
          \"shape\":\"GeoLocationContinentCode\",\
          \"documentation\":\"<p>If <code>IsTruncated</code> is <code>true</code>, you can make a follow-up request to display more locations. Enter the value of <code>NextContinentCode</code> in the <code>startcontinentcode</code> parameter in another <code>ListGeoLocations</code> request.</p>\"\
        },\
        \"NextCountryCode\":{\
          \"shape\":\"GeoLocationCountryCode\",\
          \"documentation\":\"<p>If <code>IsTruncated</code> is <code>true</code>, you can make a follow-up request to display more locations. Enter the value of <code>NextCountryCode</code> in the <code>startcountrycode</code> parameter in another <code>ListGeoLocations</code> request.</p>\"\
        },\
        \"NextSubdivisionCode\":{\
          \"shape\":\"GeoLocationSubdivisionCode\",\
          \"documentation\":\"<p>If <code>IsTruncated</code> is <code>true</code>, you can make a follow-up request to display more locations. Enter the value of <code>NextSubdivisionCode</code> in the <code>startsubdivisioncode</code> parameter in another <code>ListGeoLocations</code> request.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The value that you specified for <code>MaxItems</code> in the request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type containing the response information for the request.</p>\"\
    },\
    \"ListHealthChecksRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"PageMarker\",\
          \"documentation\":\"<p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more health checks. To get another group, submit another <code>ListHealthChecks</code> request. </p> <p>For the value of <code>marker</code>, specify the value of <code>NextMarker</code> from the previous response, which is the ID of the first health check that Amazon Route 53 will return if you submit another request.</p> <p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more health checks to get.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The maximum number of health checks that you want <code>ListHealthChecks</code> to return in response to the current request. Amazon Route 53 returns a maximum of 100 items. If you set <code>MaxItems</code> to a value greater than 100, Route 53 returns only the first 100 health checks. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxitems\"\
        }\
      },\
      \"documentation\":\"<p>A request to retrieve a list of the health checks that are associated with the current AWS account.</p>\"\
    },\
    \"ListHealthChecksResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HealthChecks\",\
        \"Marker\",\
        \"IsTruncated\",\
        \"MaxItems\"\
      ],\
      \"members\":{\
        \"HealthChecks\":{\
          \"shape\":\"HealthChecks\",\
          \"documentation\":\"<p>A complex type that contains one <code>HealthCheck</code> element for each health check that is associated with the current AWS account.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"PageMarker\",\
          \"documentation\":\"<p>For the second and subsequent calls to <code>ListHealthChecks</code>, <code>Marker</code> is the value that you specified for the <code>marker</code> parameter in the previous request.</p>\"\
        },\
        \"IsTruncated\":{\
          \"shape\":\"PageTruncated\",\
          \"documentation\":\"<p>A flag that indicates whether there are more health checks to be listed. If the response was truncated, you can get the next group of health checks by submitting another <code>ListHealthChecks</code> request and specifying the value of <code>NextMarker</code> in the <code>marker</code> parameter.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"PageMarker\",\
          \"documentation\":\"<p>If <code>IsTruncated</code> is <code>true</code>, the value of <code>NextMarker</code> identifies the first health check that Amazon Route 53 returns if you submit another <code>ListHealthChecks</code> request and specify the value of <code>NextMarker</code> in the <code>marker</code> parameter.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The value that you specified for the <code>maxitems</code> parameter in the call to <code>ListHealthChecks</code> that produced the current response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response to a <code>ListHealthChecks</code> request.</p>\"\
    },\
    \"ListHostedZonesByNameRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DNSName\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>(Optional) For your first request to <code>ListHostedZonesByName</code>, include the <code>dnsname</code> parameter only if you want to specify the name of the first hosted zone in the response. If you don't include the <code>dnsname</code> parameter, Amazon Route 53 returns all of the hosted zones that were created by the current AWS account, in ASCII order. For subsequent requests, include both <code>dnsname</code> and <code>hostedzoneid</code> parameters. For <code>dnsname</code>, specify the value of <code>NextDNSName</code> from the previous response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"dnsname\"\
        },\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>(Optional) For your first request to <code>ListHostedZonesByName</code>, do not include the <code>hostedzoneid</code> parameter.</p> <p>If you have more hosted zones than the value of <code>maxitems</code>, <code>ListHostedZonesByName</code> returns only the first <code>maxitems</code> hosted zones. To get the next group of <code>maxitems</code> hosted zones, submit another request to <code>ListHostedZonesByName</code> and include both <code>dnsname</code> and <code>hostedzoneid</code> parameters. For the value of <code>hostedzoneid</code>, specify the value of the <code>NextHostedZoneId</code> element from the previous response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"hostedzoneid\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The maximum number of hosted zones to be included in the response body for this request. If you have more than <code>maxitems</code> hosted zones, then the value of the <code>IsTruncated</code> element in the response is true, and the values of <code>NextDNSName</code> and <code>NextHostedZoneId</code> specify the first hosted zone in the next group of <code>maxitems</code> hosted zones. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxitems\"\
        }\
      },\
      \"documentation\":\"<p>Retrieves a list of the public and private hosted zones that are associated with the current AWS account in ASCII order by domain name. </p>\"\
    },\
    \"ListHostedZonesByNameResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HostedZones\",\
        \"IsTruncated\",\
        \"MaxItems\"\
      ],\
      \"members\":{\
        \"HostedZones\":{\
          \"shape\":\"HostedZones\",\
          \"documentation\":\"<p>A complex type that contains general information about the hosted zone.</p>\"\
        },\
        \"DNSName\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>For the second and subsequent calls to <code>ListHostedZonesByName</code>, <code>DNSName</code> is the value that you specified for the <code>dnsname</code> parameter in the request that produced the current response.</p>\"\
        },\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID that Amazon Route 53 assigned to the hosted zone when you created it.</p>\"\
        },\
        \"IsTruncated\":{\
          \"shape\":\"PageTruncated\",\
          \"documentation\":\"<p>A flag that indicates whether there are more hosted zones to be listed. If the response was truncated, you can get the next group of <code>maxitems</code> hosted zones by calling <code>ListHostedZonesByName</code> again and specifying the values of <code>NextDNSName</code> and <code>NextHostedZoneId</code> elements in the <code>dnsname</code> and <code>hostedzoneid</code> parameters.</p>\"\
        },\
        \"NextDNSName\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>If <code>IsTruncated</code> is true, the value of <code>NextDNSName</code> is the name of the first hosted zone in the next group of <code>maxitems</code> hosted zones. Call <code>ListHostedZonesByName</code> again and specify the value of <code>NextDNSName</code> and <code>NextHostedZoneId</code> in the <code>dnsname</code> and <code>hostedzoneid</code> parameters, respectively.</p> <p>This element is present only if <code>IsTruncated</code> is <code>true</code>.</p>\"\
        },\
        \"NextHostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>If <code>IsTruncated</code> is <code>true</code>, the value of <code>NextHostedZoneId</code> identifies the first hosted zone in the next group of <code>maxitems</code> hosted zones. Call <code>ListHostedZonesByName</code> again and specify the value of <code>NextDNSName</code> and <code>NextHostedZoneId</code> in the <code>dnsname</code> and <code>hostedzoneid</code> parameters, respectively.</p> <p>This element is present only if <code>IsTruncated</code> is <code>true</code>.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The value that you specified for the <code>maxitems</code> parameter in the call to <code>ListHostedZonesByName</code> that produced the current response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response information for the request.</p>\"\
    },\
    \"ListHostedZonesByVPCRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VPCId\",\
        \"VPCRegion\"\
      ],\
      \"members\":{\
        \"VPCId\":{\
          \"shape\":\"VPCId\",\
          \"documentation\":\"<p>The ID of the Amazon VPC that you want to list hosted zones for.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"vpcid\"\
        },\
        \"VPCRegion\":{\
          \"shape\":\"VPCRegion\",\
          \"documentation\":\"<p>For the Amazon VPC that you specified for <code>VPCId</code>, the AWS Region that you created the VPC in. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"vpcregion\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>(Optional) The maximum number of hosted zones that you want Amazon Route 53 to return. If the specified VPC is associated with more than <code>MaxItems</code> hosted zones, the response includes a <code>NextToken</code> element. <code>NextToken</code> contains the hosted zone ID of the first hosted zone that Route 53 will return if you submit another request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxitems\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response included a <code>NextToken</code> element, the specified VPC is associated with more hosted zones. To get more hosted zones, submit another <code>ListHostedZonesByVPC</code> request. </p> <p>For the value of <code>NextToken</code>, specify the value of <code>NextToken</code> from the previous response.</p> <p>If the previous response didn't include a <code>NextToken</code> element, there are no more hosted zones to get.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nexttoken\"\
        }\
      },\
      \"documentation\":\"<p>Lists all the private hosted zones that a specified VPC is associated with, regardless of which AWS account created the hosted zones.</p>\"\
    },\
    \"ListHostedZonesByVPCResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HostedZoneSummaries\",\
        \"MaxItems\"\
      ],\
      \"members\":{\
        \"HostedZoneSummaries\":{\
          \"shape\":\"HostedZoneSummaries\",\
          \"documentation\":\"<p>A list that contains one <code>HostedZoneSummary</code> element for each hosted zone that the specified Amazon VPC is associated with. Each <code>HostedZoneSummary</code> element contains the hosted zone name and ID, and information about who owns the hosted zone.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The value that you specified for <code>MaxItems</code> in the most recent <code>ListHostedZonesByVPC</code> request.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>The value that you specified for <code>NextToken</code> in the most recent <code>ListHostedZonesByVPC</code> request.</p>\"\
        }\
      }\
    },\
    \"ListHostedZonesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"PageMarker\",\
          \"documentation\":\"<p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more hosted zones. To get more hosted zones, submit another <code>ListHostedZones</code> request. </p> <p>For the value of <code>marker</code>, specify the value of <code>NextMarker</code> from the previous response, which is the ID of the first hosted zone that Amazon Route 53 will return if you submit another request.</p> <p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more hosted zones to get.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>(Optional) The maximum number of hosted zones that you want Amazon Route 53 to return. If you have more than <code>maxitems</code> hosted zones, the value of <code>IsTruncated</code> in the response is <code>true</code>, and the value of <code>NextMarker</code> is the hosted zone ID of the first hosted zone that Route 53 will return if you submit another request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxitems\"\
        },\
        \"DelegationSetId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>If you're using reusable delegation sets and you want to list all of the hosted zones that are associated with a reusable delegation set, specify the ID of that reusable delegation set. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"delegationsetid\"\
        }\
      },\
      \"documentation\":\"<p>A request to retrieve a list of the public and private hosted zones that are associated with the current AWS account.</p>\"\
    },\
    \"ListHostedZonesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HostedZones\",\
        \"Marker\",\
        \"IsTruncated\",\
        \"MaxItems\"\
      ],\
      \"members\":{\
        \"HostedZones\":{\
          \"shape\":\"HostedZones\",\
          \"documentation\":\"<p>A complex type that contains general information about the hosted zone.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"PageMarker\",\
          \"documentation\":\"<p>For the second and subsequent calls to <code>ListHostedZones</code>, <code>Marker</code> is the value that you specified for the <code>marker</code> parameter in the request that produced the current response.</p>\"\
        },\
        \"IsTruncated\":{\
          \"shape\":\"PageTruncated\",\
          \"documentation\":\"<p>A flag indicating whether there are more hosted zones to be listed. If the response was truncated, you can get more hosted zones by submitting another <code>ListHostedZones</code> request and specifying the value of <code>NextMarker</code> in the <code>marker</code> parameter.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"PageMarker\",\
          \"documentation\":\"<p>If <code>IsTruncated</code> is <code>true</code>, the value of <code>NextMarker</code> identifies the first hosted zone in the next group of hosted zones. Submit another <code>ListHostedZones</code> request, and specify the value of <code>NextMarker</code> from the response in the <code>marker</code> parameter.</p> <p>This element is present only if <code>IsTruncated</code> is <code>true</code>.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The value that you specified for the <code>maxitems</code> parameter in the call to <code>ListHostedZones</code> that produced the current response.</p>\"\
        }\
      }\
    },\
    \"ListQueryLoggingConfigsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>(Optional) If you want to list the query logging configuration that is associated with a hosted zone, specify the ID in <code>HostedZoneId</code>. </p> <p>If you don't specify a hosted zone ID, <code>ListQueryLoggingConfigs</code> returns all of the configurations that are associated with the current AWS account.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"hostedzoneid\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>(Optional) If the current AWS account has more than <code>MaxResults</code> query logging configurations, use <code>NextToken</code> to get the second and subsequent pages of results.</p> <p>For the first <code>ListQueryLoggingConfigs</code> request, omit this value.</p> <p>For the second and subsequent requests, get the value of <code>NextToken</code> from the previous response and specify that value for <code>NextToken</code> in the request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nexttoken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>(Optional) The maximum number of query logging configurations that you want Amazon Route 53 to return in response to the current request. If the current AWS account has more than <code>MaxResults</code> configurations, use the value of <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_ListQueryLoggingConfigs.html#API_ListQueryLoggingConfigs_RequestSyntax\\\">NextToken</a> in the response to get the next page of results.</p> <p>If you don't specify a value for <code>MaxResults</code>, Route 53 returns up to 100 configurations.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxresults\"\
        }\
      }\
    },\
    \"ListQueryLoggingConfigsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"QueryLoggingConfigs\"],\
      \"members\":{\
        \"QueryLoggingConfigs\":{\
          \"shape\":\"QueryLoggingConfigs\",\
          \"documentation\":\"<p>An array that contains one <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_QueryLoggingConfig.html\\\">QueryLoggingConfig</a> element for each configuration for DNS query logging that is associated with the current AWS account.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If a response includes the last of the query logging configurations that are associated with the current AWS account, <code>NextToken</code> doesn't appear in the response.</p> <p>If a response doesn't include the last of the configurations, you can get more configurations by submitting another <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_ListQueryLoggingConfigs.html\\\">ListQueryLoggingConfigs</a> request. Get the value of <code>NextToken</code> that Amazon Route 53 returned in the previous response and include it in <code>NextToken</code> in the next request.</p>\"\
        }\
      }\
    },\
    \"ListResourceRecordSetsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"HostedZoneId\"],\
      \"members\":{\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the hosted zone that contains the resource record sets that you want to list.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        },\
        \"StartRecordName\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>The first name in the lexicographic ordering of resource record sets that you want to list. If the specified record name doesn't exist, the results begin with the first resource record set that has a name greater than the value of <code>name</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"name\"\
        },\
        \"StartRecordType\":{\
          \"shape\":\"RRType\",\
          \"documentation\":\"<p>The type of resource record set to begin the record listing from.</p> <p>Valid values for basic resource record sets: <code>A</code> | <code>AAAA</code> | <code>CAA</code> | <code>CNAME</code> | <code>MX</code> | <code>NAPTR</code> | <code>NS</code> | <code>PTR</code> | <code>SOA</code> | <code>SPF</code> | <code>SRV</code> | <code>TXT</code> </p> <p>Values for weighted, latency, geolocation, and failover resource record sets: <code>A</code> | <code>AAAA</code> | <code>CAA</code> | <code>CNAME</code> | <code>MX</code> | <code>NAPTR</code> | <code>PTR</code> | <code>SPF</code> | <code>SRV</code> | <code>TXT</code> </p> <p>Values for alias resource record sets: </p> <ul> <li> <p> <b>API Gateway custom regional API or edge-optimized API</b>: A</p> </li> <li> <p> <b>CloudFront distribution</b>: A or AAAA</p> </li> <li> <p> <b>Elastic Beanstalk environment that has a regionalized subdomain</b>: A</p> </li> <li> <p> <b>Elastic Load Balancing load balancer</b>: A | AAAA</p> </li> <li> <p> <b>S3 bucket</b>: A</p> </li> <li> <p> <b>VPC interface VPC endpoint</b>: A</p> </li> <li> <p> <b>Another resource record set in this hosted zone:</b> The type of the resource record set that the alias references.</p> </li> </ul> <p>Constraint: Specifying <code>type</code> without specifying <code>name</code> returns an <code>InvalidInput</code> error.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"type\"\
        },\
        \"StartRecordIdentifier\":{\
          \"shape\":\"ResourceRecordSetIdentifier\",\
          \"documentation\":\"<p> <i>Resource record sets that have a routing policy other than simple:</i> If results were truncated for a given DNS name and type, specify the value of <code>NextRecordIdentifier</code> from the previous response to get the next resource record set that has the current DNS name and type.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"identifier\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>(Optional) The maximum number of resource records sets to include in the response body for this request. If the response includes more than <code>maxitems</code> resource record sets, the value of the <code>IsTruncated</code> element in the response is <code>true</code>, and the values of the <code>NextRecordName</code> and <code>NextRecordType</code> elements in the response identify the first resource record set in the next group of <code>maxitems</code> resource record sets.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxitems\"\
        }\
      },\
      \"documentation\":\"<p>A request for the resource record sets that are associated with a specified hosted zone.</p>\"\
    },\
    \"ListResourceRecordSetsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceRecordSets\",\
        \"IsTruncated\",\
        \"MaxItems\"\
      ],\
      \"members\":{\
        \"ResourceRecordSets\":{\
          \"shape\":\"ResourceRecordSets\",\
          \"documentation\":\"<p>Information about multiple resource record sets.</p>\"\
        },\
        \"IsTruncated\":{\
          \"shape\":\"PageTruncated\",\
          \"documentation\":\"<p>A flag that indicates whether more resource record sets remain to be listed. If your results were truncated, you can make a follow-up pagination request by using the <code>NextRecordName</code> element.</p>\"\
        },\
        \"NextRecordName\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>If the results were truncated, the name of the next record in the list.</p> <p>This element is present only if <code>IsTruncated</code> is true. </p>\"\
        },\
        \"NextRecordType\":{\
          \"shape\":\"RRType\",\
          \"documentation\":\"<p>If the results were truncated, the type of the next record in the list.</p> <p>This element is present only if <code>IsTruncated</code> is true. </p>\"\
        },\
        \"NextRecordIdentifier\":{\
          \"shape\":\"ResourceRecordSetIdentifier\",\
          \"documentation\":\"<p> <i>Resource record sets that have a routing policy other than simple:</i> If results were truncated for a given DNS name and type, the value of <code>SetIdentifier</code> for the next resource record set that has the current DNS name and type.</p> <p>For information about routing policies, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html\\\">Choosing a Routing Policy</a> in the <i>Amazon Route 53 Developer Guide</i>.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The maximum number of records you requested.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains list information for the resource record set.</p>\"\
    },\
    \"ListReusableDelegationSetsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"PageMarker\",\
          \"documentation\":\"<p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more reusable delegation sets. To get another group, submit another <code>ListReusableDelegationSets</code> request. </p> <p>For the value of <code>marker</code>, specify the value of <code>NextMarker</code> from the previous response, which is the ID of the first reusable delegation set that Amazon Route 53 will return if you submit another request.</p> <p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more reusable delegation sets to get.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The number of reusable delegation sets that you want Amazon Route 53 to return in the response to this request. If you specify a value greater than 100, Route 53 returns only the first 100 reusable delegation sets.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxitems\"\
        }\
      },\
      \"documentation\":\"<p>A request to get a list of the reusable delegation sets that are associated with the current AWS account.</p>\"\
    },\
    \"ListReusableDelegationSetsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DelegationSets\",\
        \"Marker\",\
        \"IsTruncated\",\
        \"MaxItems\"\
      ],\
      \"members\":{\
        \"DelegationSets\":{\
          \"shape\":\"DelegationSets\",\
          \"documentation\":\"<p>A complex type that contains one <code>DelegationSet</code> element for each reusable delegation set that was created by the current AWS account.</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"PageMarker\",\
          \"documentation\":\"<p>For the second and subsequent calls to <code>ListReusableDelegationSets</code>, <code>Marker</code> is the value that you specified for the <code>marker</code> parameter in the request that produced the current response.</p>\"\
        },\
        \"IsTruncated\":{\
          \"shape\":\"PageTruncated\",\
          \"documentation\":\"<p>A flag that indicates whether there are more reusable delegation sets to be listed.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"PageMarker\",\
          \"documentation\":\"<p>If <code>IsTruncated</code> is <code>true</code>, the value of <code>NextMarker</code> identifies the next reusable delegation set that Amazon Route 53 will return if you submit another <code>ListReusableDelegationSets</code> request and specify the value of <code>NextMarker</code> in the <code>marker</code> parameter.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The value that you specified for the <code>maxitems</code> parameter in the call to <code>ListReusableDelegationSets</code> that produced the current response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the reusable delegation sets that are associated with the current AWS account.</p>\"\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceType\",\
        \"ResourceId\"\
      ],\
      \"members\":{\
        \"ResourceType\":{\
          \"shape\":\"TagResourceType\",\
          \"documentation\":\"<p>The type of the resource.</p> <ul> <li> <p>The resource type for health checks is <code>healthcheck</code>.</p> </li> <li> <p>The resource type for hosted zones is <code>hostedzone</code>.</p> </li> </ul>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ResourceType\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"TagResourceId\",\
          \"documentation\":\"<p>The ID of the resource for which you want to retrieve tags.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ResourceId\"\
        }\
      },\
      \"documentation\":\"<p>A complex type containing information about a request for a list of the tags that are associated with an individual resource.</p>\"\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceTagSet\"],\
      \"members\":{\
        \"ResourceTagSet\":{\
          \"shape\":\"ResourceTagSet\",\
          \"documentation\":\"<p>A <code>ResourceTagSet</code> containing tags associated with the specified resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the health checks or hosted zones for which you want to list tags.</p>\"\
    },\
    \"ListTagsForResourcesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceType\",\
        \"ResourceIds\"\
      ],\
      \"members\":{\
        \"ResourceType\":{\
          \"shape\":\"TagResourceType\",\
          \"documentation\":\"<p>The type of the resources.</p> <ul> <li> <p>The resource type for health checks is <code>healthcheck</code>.</p> </li> <li> <p>The resource type for hosted zones is <code>hostedzone</code>.</p> </li> </ul>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ResourceType\"\
        },\
        \"ResourceIds\":{\
          \"shape\":\"TagResourceIdList\",\
          \"documentation\":\"<p>A complex type that contains the ResourceId element for each resource for which you want to get a list of tags.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the health checks or hosted zones for which you want to list tags.</p>\"\
    },\
    \"ListTagsForResourcesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceTagSets\"],\
      \"members\":{\
        \"ResourceTagSets\":{\
          \"shape\":\"ResourceTagSetList\",\
          \"documentation\":\"<p>A list of <code>ResourceTagSet</code>s containing tags associated with the specified resources.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type containing tags for the specified resources.</p>\"\
    },\
    \"ListTrafficPoliciesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrafficPolicyIdMarker\":{\
          \"shape\":\"TrafficPolicyId\",\
          \"documentation\":\"<p>(Conditional) For your first request to <code>ListTrafficPolicies</code>, don't include the <code>TrafficPolicyIdMarker</code> parameter.</p> <p>If you have more traffic policies than the value of <code>MaxItems</code>, <code>ListTrafficPolicies</code> returns only the first <code>MaxItems</code> traffic policies. To get the next group of policies, submit another request to <code>ListTrafficPolicies</code>. For the value of <code>TrafficPolicyIdMarker</code>, specify the value of <code>TrafficPolicyIdMarker</code> that was returned in the previous response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"trafficpolicyid\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>(Optional) The maximum number of traffic policies that you want Amazon Route 53 to return in response to this request. If you have more than <code>MaxItems</code> traffic policies, the value of <code>IsTruncated</code> in the response is <code>true</code>, and the value of <code>TrafficPolicyIdMarker</code> is the ID of the first traffic policy that Route 53 will return if you submit another request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxitems\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the information about the request to list the traffic policies that are associated with the current AWS account.</p>\"\
    },\
    \"ListTrafficPoliciesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrafficPolicySummaries\",\
        \"IsTruncated\",\
        \"TrafficPolicyIdMarker\",\
        \"MaxItems\"\
      ],\
      \"members\":{\
        \"TrafficPolicySummaries\":{\
          \"shape\":\"TrafficPolicySummaries\",\
          \"documentation\":\"<p>A list that contains one <code>TrafficPolicySummary</code> element for each traffic policy that was created by the current AWS account.</p>\"\
        },\
        \"IsTruncated\":{\
          \"shape\":\"PageTruncated\",\
          \"documentation\":\"<p>A flag that indicates whether there are more traffic policies to be listed. If the response was truncated, you can get the next group of traffic policies by submitting another <code>ListTrafficPolicies</code> request and specifying the value of <code>TrafficPolicyIdMarker</code> in the <code>TrafficPolicyIdMarker</code> request parameter.</p>\"\
        },\
        \"TrafficPolicyIdMarker\":{\
          \"shape\":\"TrafficPolicyId\",\
          \"documentation\":\"<p>If the value of <code>IsTruncated</code> is <code>true</code>, <code>TrafficPolicyIdMarker</code> is the ID of the first traffic policy in the next group of <code>MaxItems</code> traffic policies.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The value that you specified for the <code>MaxItems</code> parameter in the <code>ListTrafficPolicies</code> request that produced the current response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response information for the request.</p>\"\
    },\
    \"ListTrafficPolicyInstancesByHostedZoneRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"HostedZoneId\"],\
      \"members\":{\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the hosted zone that you want to list traffic policy instances for.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"id\"\
        },\
        \"TrafficPolicyInstanceNameMarker\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>If the value of <code>IsTruncated</code> in the previous response is true, you have more traffic policy instances. To get more traffic policy instances, submit another <code>ListTrafficPolicyInstances</code> request. For the value of <code>trafficpolicyinstancename</code>, specify the value of <code>TrafficPolicyInstanceNameMarker</code> from the previous response, which is the name of the first traffic policy instance in the next group of traffic policy instances.</p> <p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more traffic policy instances to get.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"trafficpolicyinstancename\"\
        },\
        \"TrafficPolicyInstanceTypeMarker\":{\
          \"shape\":\"RRType\",\
          \"documentation\":\"<p>If the value of <code>IsTruncated</code> in the previous response is true, you have more traffic policy instances. To get more traffic policy instances, submit another <code>ListTrafficPolicyInstances</code> request. For the value of <code>trafficpolicyinstancetype</code>, specify the value of <code>TrafficPolicyInstanceTypeMarker</code> from the previous response, which is the type of the first traffic policy instance in the next group of traffic policy instances.</p> <p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more traffic policy instances to get.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"trafficpolicyinstancetype\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The maximum number of traffic policy instances to be included in the response body for this request. If you have more than <code>MaxItems</code> traffic policy instances, the value of the <code>IsTruncated</code> element in the response is <code>true</code>, and the values of <code>HostedZoneIdMarker</code>, <code>TrafficPolicyInstanceNameMarker</code>, and <code>TrafficPolicyInstanceTypeMarker</code> represent the first traffic policy instance that Amazon Route 53 will return if you submit another request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxitems\"\
        }\
      },\
      \"documentation\":\"<p>A request for the traffic policy instances that you created in a specified hosted zone.</p>\"\
    },\
    \"ListTrafficPolicyInstancesByHostedZoneResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrafficPolicyInstances\",\
        \"IsTruncated\",\
        \"MaxItems\"\
      ],\
      \"members\":{\
        \"TrafficPolicyInstances\":{\
          \"shape\":\"TrafficPolicyInstances\",\
          \"documentation\":\"<p>A list that contains one <code>TrafficPolicyInstance</code> element for each traffic policy instance that matches the elements in the request. </p>\"\
        },\
        \"TrafficPolicyInstanceNameMarker\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>If <code>IsTruncated</code> is <code>true</code>, <code>TrafficPolicyInstanceNameMarker</code> is the name of the first traffic policy instance in the next group of traffic policy instances.</p>\"\
        },\
        \"TrafficPolicyInstanceTypeMarker\":{\
          \"shape\":\"RRType\",\
          \"documentation\":\"<p>If <code>IsTruncated</code> is true, <code>TrafficPolicyInstanceTypeMarker</code> is the DNS type of the resource record sets that are associated with the first traffic policy instance in the next group of traffic policy instances.</p>\"\
        },\
        \"IsTruncated\":{\
          \"shape\":\"PageTruncated\",\
          \"documentation\":\"<p>A flag that indicates whether there are more traffic policy instances to be listed. If the response was truncated, you can get the next group of traffic policy instances by submitting another <code>ListTrafficPolicyInstancesByHostedZone</code> request and specifying the values of <code>HostedZoneIdMarker</code>, <code>TrafficPolicyInstanceNameMarker</code>, and <code>TrafficPolicyInstanceTypeMarker</code> in the corresponding request parameters.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The value that you specified for the <code>MaxItems</code> parameter in the <code>ListTrafficPolicyInstancesByHostedZone</code> request that produced the current response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response information for the request.</p>\"\
    },\
    \"ListTrafficPolicyInstancesByPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrafficPolicyId\",\
        \"TrafficPolicyVersion\"\
      ],\
      \"members\":{\
        \"TrafficPolicyId\":{\
          \"shape\":\"TrafficPolicyId\",\
          \"documentation\":\"<p>The ID of the traffic policy for which you want to list traffic policy instances.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"id\"\
        },\
        \"TrafficPolicyVersion\":{\
          \"shape\":\"TrafficPolicyVersion\",\
          \"documentation\":\"<p>The version of the traffic policy for which you want to list traffic policy instances. The version must be associated with the traffic policy that is specified by <code>TrafficPolicyId</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"version\"\
        },\
        \"HostedZoneIdMarker\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more traffic policy instances. To get more traffic policy instances, submit another <code>ListTrafficPolicyInstancesByPolicy</code> request. </p> <p>For the value of <code>hostedzoneid</code>, specify the value of <code>HostedZoneIdMarker</code> from the previous response, which is the hosted zone ID of the first traffic policy instance that Amazon Route 53 will return if you submit another request.</p> <p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more traffic policy instances to get.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"hostedzoneid\"\
        },\
        \"TrafficPolicyInstanceNameMarker\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more traffic policy instances. To get more traffic policy instances, submit another <code>ListTrafficPolicyInstancesByPolicy</code> request.</p> <p>For the value of <code>trafficpolicyinstancename</code>, specify the value of <code>TrafficPolicyInstanceNameMarker</code> from the previous response, which is the name of the first traffic policy instance that Amazon Route 53 will return if you submit another request.</p> <p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more traffic policy instances to get.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"trafficpolicyinstancename\"\
        },\
        \"TrafficPolicyInstanceTypeMarker\":{\
          \"shape\":\"RRType\",\
          \"documentation\":\"<p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more traffic policy instances. To get more traffic policy instances, submit another <code>ListTrafficPolicyInstancesByPolicy</code> request.</p> <p>For the value of <code>trafficpolicyinstancetype</code>, specify the value of <code>TrafficPolicyInstanceTypeMarker</code> from the previous response, which is the name of the first traffic policy instance that Amazon Route 53 will return if you submit another request.</p> <p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more traffic policy instances to get.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"trafficpolicyinstancetype\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The maximum number of traffic policy instances to be included in the response body for this request. If you have more than <code>MaxItems</code> traffic policy instances, the value of the <code>IsTruncated</code> element in the response is <code>true</code>, and the values of <code>HostedZoneIdMarker</code>, <code>TrafficPolicyInstanceNameMarker</code>, and <code>TrafficPolicyInstanceTypeMarker</code> represent the first traffic policy instance that Amazon Route 53 will return if you submit another request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxitems\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the information about the request to list your traffic policy instances.</p>\"\
    },\
    \"ListTrafficPolicyInstancesByPolicyResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrafficPolicyInstances\",\
        \"IsTruncated\",\
        \"MaxItems\"\
      ],\
      \"members\":{\
        \"TrafficPolicyInstances\":{\
          \"shape\":\"TrafficPolicyInstances\",\
          \"documentation\":\"<p>A list that contains one <code>TrafficPolicyInstance</code> element for each traffic policy instance that matches the elements in the request.</p>\"\
        },\
        \"HostedZoneIdMarker\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>If <code>IsTruncated</code> is <code>true</code>, <code>HostedZoneIdMarker</code> is the ID of the hosted zone of the first traffic policy instance in the next group of traffic policy instances.</p>\"\
        },\
        \"TrafficPolicyInstanceNameMarker\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>If <code>IsTruncated</code> is <code>true</code>, <code>TrafficPolicyInstanceNameMarker</code> is the name of the first traffic policy instance in the next group of <code>MaxItems</code> traffic policy instances.</p>\"\
        },\
        \"TrafficPolicyInstanceTypeMarker\":{\
          \"shape\":\"RRType\",\
          \"documentation\":\"<p>If <code>IsTruncated</code> is <code>true</code>, <code>TrafficPolicyInstanceTypeMarker</code> is the DNS type of the resource record sets that are associated with the first traffic policy instance in the next group of <code>MaxItems</code> traffic policy instances.</p>\"\
        },\
        \"IsTruncated\":{\
          \"shape\":\"PageTruncated\",\
          \"documentation\":\"<p>A flag that indicates whether there are more traffic policy instances to be listed. If the response was truncated, you can get the next group of traffic policy instances by calling <code>ListTrafficPolicyInstancesByPolicy</code> again and specifying the values of the <code>HostedZoneIdMarker</code>, <code>TrafficPolicyInstanceNameMarker</code>, and <code>TrafficPolicyInstanceTypeMarker</code> elements in the corresponding request parameters.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The value that you specified for the <code>MaxItems</code> parameter in the call to <code>ListTrafficPolicyInstancesByPolicy</code> that produced the current response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response information for the request.</p>\"\
    },\
    \"ListTrafficPolicyInstancesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HostedZoneIdMarker\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more traffic policy instances. To get more traffic policy instances, submit another <code>ListTrafficPolicyInstances</code> request. For the value of <code>HostedZoneId</code>, specify the value of <code>HostedZoneIdMarker</code> from the previous response, which is the hosted zone ID of the first traffic policy instance in the next group of traffic policy instances.</p> <p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more traffic policy instances to get.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"hostedzoneid\"\
        },\
        \"TrafficPolicyInstanceNameMarker\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more traffic policy instances. To get more traffic policy instances, submit another <code>ListTrafficPolicyInstances</code> request. For the value of <code>trafficpolicyinstancename</code>, specify the value of <code>TrafficPolicyInstanceNameMarker</code> from the previous response, which is the name of the first traffic policy instance in the next group of traffic policy instances.</p> <p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more traffic policy instances to get.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"trafficpolicyinstancename\"\
        },\
        \"TrafficPolicyInstanceTypeMarker\":{\
          \"shape\":\"RRType\",\
          \"documentation\":\"<p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more traffic policy instances. To get more traffic policy instances, submit another <code>ListTrafficPolicyInstances</code> request. For the value of <code>trafficpolicyinstancetype</code>, specify the value of <code>TrafficPolicyInstanceTypeMarker</code> from the previous response, which is the type of the first traffic policy instance in the next group of traffic policy instances.</p> <p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more traffic policy instances to get.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"trafficpolicyinstancetype\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The maximum number of traffic policy instances that you want Amazon Route 53 to return in response to a <code>ListTrafficPolicyInstances</code> request. If you have more than <code>MaxItems</code> traffic policy instances, the value of the <code>IsTruncated</code> element in the response is <code>true</code>, and the values of <code>HostedZoneIdMarker</code>, <code>TrafficPolicyInstanceNameMarker</code>, and <code>TrafficPolicyInstanceTypeMarker</code> represent the first traffic policy instance in the next group of <code>MaxItems</code> traffic policy instances.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxitems\"\
        }\
      },\
      \"documentation\":\"<p>A request to get information about the traffic policy instances that you created by using the current AWS account.</p>\"\
    },\
    \"ListTrafficPolicyInstancesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrafficPolicyInstances\",\
        \"IsTruncated\",\
        \"MaxItems\"\
      ],\
      \"members\":{\
        \"TrafficPolicyInstances\":{\
          \"shape\":\"TrafficPolicyInstances\",\
          \"documentation\":\"<p>A list that contains one <code>TrafficPolicyInstance</code> element for each traffic policy instance that matches the elements in the request.</p>\"\
        },\
        \"HostedZoneIdMarker\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>If <code>IsTruncated</code> is <code>true</code>, <code>HostedZoneIdMarker</code> is the ID of the hosted zone of the first traffic policy instance that Route 53 will return if you submit another <code>ListTrafficPolicyInstances</code> request. </p>\"\
        },\
        \"TrafficPolicyInstanceNameMarker\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>If <code>IsTruncated</code> is <code>true</code>, <code>TrafficPolicyInstanceNameMarker</code> is the name of the first traffic policy instance that Route 53 will return if you submit another <code>ListTrafficPolicyInstances</code> request. </p>\"\
        },\
        \"TrafficPolicyInstanceTypeMarker\":{\
          \"shape\":\"RRType\",\
          \"documentation\":\"<p>If <code>IsTruncated</code> is <code>true</code>, <code>TrafficPolicyInstanceTypeMarker</code> is the DNS type of the resource record sets that are associated with the first traffic policy instance that Amazon Route 53 will return if you submit another <code>ListTrafficPolicyInstances</code> request. </p>\"\
        },\
        \"IsTruncated\":{\
          \"shape\":\"PageTruncated\",\
          \"documentation\":\"<p>A flag that indicates whether there are more traffic policy instances to be listed. If the response was truncated, you can get more traffic policy instances by calling <code>ListTrafficPolicyInstances</code> again and specifying the values of the <code>HostedZoneIdMarker</code>, <code>TrafficPolicyInstanceNameMarker</code>, and <code>TrafficPolicyInstanceTypeMarker</code> in the corresponding request parameters.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The value that you specified for the <code>MaxItems</code> parameter in the call to <code>ListTrafficPolicyInstances</code> that produced the current response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response information for the request.</p>\"\
    },\
    \"ListTrafficPolicyVersionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TrafficPolicyId\",\
          \"documentation\":\"<p>Specify the value of <code>Id</code> of the traffic policy for which you want to list all versions.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        },\
        \"TrafficPolicyVersionMarker\":{\
          \"shape\":\"TrafficPolicyVersionMarker\",\
          \"documentation\":\"<p>For your first request to <code>ListTrafficPolicyVersions</code>, don't include the <code>TrafficPolicyVersionMarker</code> parameter.</p> <p>If you have more traffic policy versions than the value of <code>MaxItems</code>, <code>ListTrafficPolicyVersions</code> returns only the first group of <code>MaxItems</code> versions. To get more traffic policy versions, submit another <code>ListTrafficPolicyVersions</code> request. For the value of <code>TrafficPolicyVersionMarker</code>, specify the value of <code>TrafficPolicyVersionMarker</code> in the previous response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"trafficpolicyversion\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The maximum number of traffic policy versions that you want Amazon Route 53 to include in the response body for this request. If the specified traffic policy has more than <code>MaxItems</code> versions, the value of <code>IsTruncated</code> in the response is <code>true</code>, and the value of the <code>TrafficPolicyVersionMarker</code> element is the ID of the first version that Route 53 will return if you submit another request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxitems\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the information about the request to list your traffic policies.</p>\"\
    },\
    \"ListTrafficPolicyVersionsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrafficPolicies\",\
        \"IsTruncated\",\
        \"TrafficPolicyVersionMarker\",\
        \"MaxItems\"\
      ],\
      \"members\":{\
        \"TrafficPolicies\":{\
          \"shape\":\"TrafficPolicies\",\
          \"documentation\":\"<p>A list that contains one <code>TrafficPolicy</code> element for each traffic policy version that is associated with the specified traffic policy.</p>\"\
        },\
        \"IsTruncated\":{\
          \"shape\":\"PageTruncated\",\
          \"documentation\":\"<p>A flag that indicates whether there are more traffic policies to be listed. If the response was truncated, you can get the next group of traffic policies by submitting another <code>ListTrafficPolicyVersions</code> request and specifying the value of <code>NextMarker</code> in the <code>marker</code> parameter.</p>\"\
        },\
        \"TrafficPolicyVersionMarker\":{\
          \"shape\":\"TrafficPolicyVersionMarker\",\
          \"documentation\":\"<p>If <code>IsTruncated</code> is <code>true</code>, the value of <code>TrafficPolicyVersionMarker</code> identifies the first traffic policy that Amazon Route 53 will return if you submit another request. Call <code>ListTrafficPolicyVersions</code> again and specify the value of <code>TrafficPolicyVersionMarker</code> in the <code>TrafficPolicyVersionMarker</code> request parameter.</p> <p>This element is present only if <code>IsTruncated</code> is <code>true</code>.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The value that you specified for the <code>maxitems</code> parameter in the <code>ListTrafficPolicyVersions</code> request that produced the current response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response information for the request.</p>\"\
    },\
    \"ListVPCAssociationAuthorizationsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"HostedZoneId\"],\
      \"members\":{\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the hosted zone for which you want a list of VPCs that can be associated with the hosted zone.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p> <i>Optional</i>: If a response includes a <code>NextToken</code> element, there are more VPCs that can be associated with the specified hosted zone. To get the next page of results, submit another request, and include the value of <code>NextToken</code> from the response in the <code>nexttoken</code> parameter in another <code>ListVPCAssociationAuthorizations</code> request.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nexttoken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p> <i>Optional</i>: An integer that specifies the maximum number of VPCs that you want Amazon Route 53 to return. If you don't specify a value for <code>MaxResults</code>, Route 53 returns up to 50 VPCs per page.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxresults\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about that can be associated with your hosted zone.</p>\"\
    },\
    \"ListVPCAssociationAuthorizationsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HostedZoneId\",\
        \"VPCs\"\
      ],\
      \"members\":{\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the hosted zone that you can associate the listed VPCs with.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>When the response includes a <code>NextToken</code> element, there are more VPCs that can be associated with the specified hosted zone. To get the next page of VPCs, submit another <code>ListVPCAssociationAuthorizations</code> request, and include the value of the <code>NextToken</code> element from the response in the <code>nexttoken</code> request parameter.</p>\"\
        },\
        \"VPCs\":{\
          \"shape\":\"VPCs\",\
          \"documentation\":\"<p>The list of VPCs that are authorized to be associated with the specified hosted zone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response information for the request.</p>\"\
    },\
    \"MaxResults\":{\"type\":\"string\"},\
    \"MeasureLatency\":{\"type\":\"boolean\"},\
    \"Message\":{\
      \"type\":\"string\",\
      \"max\":1024\
    },\
    \"MetricName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"Nameserver\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":0\
    },\
    \"Namespace\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"NoSuchChange\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>A change with the specified change ID does not exist.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"NoSuchCloudWatchLogsLogGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>There is no CloudWatch Logs log group with the specified ARN.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"NoSuchDelegationSet\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A reusable delegation set with the specified ID does not exist.</p>\",\
      \"exception\":true\
    },\
    \"NoSuchGeoLocation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Amazon Route 53 doesn't support the specified geographic location. For a list of supported geolocation codes, see the <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_GeoLocation.html\\\">GeoLocation</a> data type.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"NoSuchHealthCheck\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>No health check exists with the specified ID.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"NoSuchHostedZone\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>No hosted zone exists with the ID that you specified.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"NoSuchQueryLoggingConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>There is no DNS query logging configuration with the specified ID.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"NoSuchTrafficPolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>No traffic policy exists with the specified ID.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"NoSuchTrafficPolicyInstance\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>No traffic policy instance exists with the specified ID.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"Nonce\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"NotAuthorizedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Associating the specified VPC with the specified hosted zone has not been authorized.</p>\",\
      \"error\":{\"httpStatusCode\":401},\
      \"exception\":true\
    },\
    \"PageMarker\":{\
      \"type\":\"string\",\
      \"max\":64\
    },\
    \"PageMaxItems\":{\"type\":\"string\"},\
    \"PageTruncated\":{\"type\":\"boolean\"},\
    \"PaginationToken\":{\
      \"type\":\"string\",\
      \"max\":1024\
    },\
    \"Period\":{\
      \"type\":\"integer\",\
      \"min\":60\
    },\
    \"Port\":{\
      \"type\":\"integer\",\
      \"max\":65535,\
      \"min\":1\
    },\
    \"PriorRequestNotComplete\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>If Amazon Route 53 can't process a request before the next request arrives, it will reject subsequent requests for the same hosted zone and return an <code>HTTP 400 error</code> (<code>Bad request</code>). If Route 53 returns this error repeatedly for the same request, we recommend that you wait, in intervals of increasing duration, before you try the request again.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"PublicZoneVPCAssociation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>You're trying to associate a VPC with a public hosted zone. Amazon Route 53 doesn't support associating a VPC with a public hosted zone.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"QueryLoggingConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Id\",\
        \"HostedZoneId\",\
        \"CloudWatchLogsLogGroupArn\"\
      ],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"QueryLoggingConfigId\",\
          \"documentation\":\"<p>The ID for a configuration for DNS query logging.</p>\"\
        },\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the hosted zone that CloudWatch Logs is logging queries for. </p>\"\
        },\
        \"CloudWatchLogsLogGroupArn\":{\
          \"shape\":\"CloudWatchLogsLogGroupArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the CloudWatch Logs log group that Amazon Route 53 is publishing logs to.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about a configuration for DNS query logging.</p>\"\
    },\
    \"QueryLoggingConfigAlreadyExists\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>You can create only one query logging configuration for a hosted zone, and a query logging configuration already exists for this hosted zone.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"QueryLoggingConfigId\":{\
      \"type\":\"string\",\
      \"max\":36,\
      \"min\":1\
    },\
    \"QueryLoggingConfigs\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"QueryLoggingConfig\",\
        \"locationName\":\"QueryLoggingConfig\"\
      }\
    },\
    \"RData\":{\
      \"type\":\"string\",\
      \"max\":4000\
    },\
    \"RRType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SOA\",\
        \"A\",\
        \"TXT\",\
        \"NS\",\
        \"CNAME\",\
        \"MX\",\
        \"NAPTR\",\
        \"PTR\",\
        \"SRV\",\
        \"SPF\",\
        \"AAAA\",\
        \"CAA\"\
      ]\
    },\
    \"RecordData\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"RecordDataEntry\",\
        \"locationName\":\"RecordDataEntry\"\
      }\
    },\
    \"RecordDataEntry\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>A value that Amazon Route 53 returned for this resource record set. A <code>RecordDataEntry</code> element is one of the following:</p> <ul> <li> <p>For non-alias resource record sets, a <code>RecordDataEntry</code> element contains one value in the resource record set. If the resource record set contains multiple values, the response includes one <code>RecordDataEntry</code> element for each value.</p> </li> <li> <p>For multiple resource record sets that have the same name and type, which includes weighted, latency, geolocation, and failover, a <code>RecordDataEntry</code> element contains the value from the appropriate resource record set based on the request.</p> </li> <li> <p>For alias resource record sets that refer to AWS resources other than another resource record set, the <code>RecordDataEntry</code> element contains an IP address or a domain name for the AWS resource, depending on the type of resource.</p> </li> <li> <p>For alias resource record sets that refer to other resource record sets, a <code>RecordDataEntry</code> element contains one value from the referenced resource record set. If the referenced resource record set contains multiple values, the response includes one <code>RecordDataEntry</code> element for each value.</p> </li> </ul>\",\
      \"max\":512,\
      \"min\":0\
    },\
    \"RequestInterval\":{\
      \"type\":\"integer\",\
      \"max\":30,\
      \"min\":10\
    },\
    \"ResettableElementName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FullyQualifiedDomainName\",\
        \"Regions\",\
        \"ResourcePath\",\
        \"ChildHealthChecks\"\
      ],\
      \"max\":64,\
      \"min\":1\
    },\
    \"ResettableElementNameList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ResettableElementName\",\
        \"locationName\":\"ResettableElementName\"\
      },\
      \"max\":64\
    },\
    \"ResourceDescription\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"ResourceId\":{\
      \"type\":\"string\",\
      \"max\":32\
    },\
    \"ResourcePath\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"ResourceRecord\":{\
      \"type\":\"structure\",\
      \"required\":[\"Value\"],\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"RData\",\
          \"documentation\":\"<p>The current or new DNS record value, not to exceed 4,000 characters. In the case of a <code>DELETE</code> action, if the current value does not match the actual value, an error is returned. For descriptions about how to format <code>Value</code> for different record types, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/ResourceRecordTypes.html\\\">Supported DNS Resource Record Types</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>You can specify more than one value for all record types except <code>CNAME</code> and <code>SOA</code>. </p> <note> <p>If you're creating an alias resource record set, omit <code>Value</code>.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Information specific to the resource record.</p> <note> <p>If you're creating an alias resource record set, omit <code>ResourceRecord</code>.</p> </note>\"\
    },\
    \"ResourceRecordSet\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Type\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>For <code>ChangeResourceRecordSets</code> requests, the name of the record that you want to create, update, or delete. For <code>ListResourceRecordSets</code> responses, the name of a record in the specified hosted zone.</p> <p> <b>ChangeResourceRecordSets Only</b> </p> <p>Enter a fully qualified domain name, for example, <code>www.example.com</code>. You can optionally include a trailing dot. If you omit the trailing dot, Amazon Route 53 assumes that the domain name that you specify is fully qualified. This means that Route 53 treats <code>www.example.com</code> (without a trailing dot) and <code>www.example.com.</code> (with a trailing dot) as identical.</p> <p>For information about how to specify characters other than <code>a-z</code>, <code>0-9</code>, and <code>-</code> (hyphen) and how to specify internationalized domain names, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html\\\">DNS Domain Name Format</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>You can use the asterisk (*) wildcard to replace the leftmost label in a domain name, for example, <code>*.example.com</code>. Note the following:</p> <ul> <li> <p>The * must replace the entire label. For example, you can't specify <code>*prod.example.com</code> or <code>prod*.example.com</code>.</p> </li> <li> <p>The * can't replace any of the middle labels, for example, marketing.*.example.com.</p> </li> <li> <p>If you include * in any position other than the leftmost label in a domain name, DNS treats it as an * character (ASCII 42), not as a wildcard.</p> <important> <p>You can't use the * wildcard for resource records sets that have a type of NS.</p> </important> </li> </ul> <p>You can use the * wildcard as the leftmost label in a domain name, for example, <code>*.example.com</code>. You can't use an * for one of the middle labels, for example, <code>marketing.*.example.com</code>. In addition, the * must replace the entire label; for example, you can't specify <code>prod*.example.com</code>.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"RRType\",\
          \"documentation\":\"<p>The DNS record type. For information about different record types and how data is encoded for them, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/ResourceRecordTypes.html\\\">Supported DNS Resource Record Types</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>Valid values for basic resource record sets: <code>A</code> | <code>AAAA</code> | <code>CAA</code> | <code>CNAME</code> | <code>MX</code> | <code>NAPTR</code> | <code>NS</code> | <code>PTR</code> | <code>SOA</code> | <code>SPF</code> | <code>SRV</code> | <code>TXT</code> </p> <p>Values for weighted, latency, geolocation, and failover resource record sets: <code>A</code> | <code>AAAA</code> | <code>CAA</code> | <code>CNAME</code> | <code>MX</code> | <code>NAPTR</code> | <code>PTR</code> | <code>SPF</code> | <code>SRV</code> | <code>TXT</code>. When creating a group of weighted, latency, geolocation, or failover resource record sets, specify the same value for all of the resource record sets in the group.</p> <p>Valid values for multivalue answer resource record sets: <code>A</code> | <code>AAAA</code> | <code>MX</code> | <code>NAPTR</code> | <code>PTR</code> | <code>SPF</code> | <code>SRV</code> | <code>TXT</code> </p> <note> <p>SPF records were formerly used to verify the identity of the sender of email messages. However, we no longer recommend that you create resource record sets for which the value of <code>Type</code> is <code>SPF</code>. RFC 7208, <i>Sender Policy Framework (SPF) for Authorizing Use of Domains in Email, Version 1</i>, has been updated to say, \\\"...[I]ts existence and mechanism defined in [RFC4408] have led to some interoperability issues. Accordingly, its use is no longer appropriate for SPF version 1; implementations are not to use it.\\\" In RFC 7208, see section 14.1, <a href=\\\"http://tools.ietf.org/html/rfc7208#section-14.1\\\">The SPF DNS Record Type</a>.</p> </note> <p>Values for alias resource record sets:</p> <ul> <li> <p> <b>Amazon API Gateway custom regional APIs and edge-optimized APIs:</b> <code>A</code> </p> </li> <li> <p> <b>CloudFront distributions:</b> <code>A</code> </p> <p>If IPv6 is enabled for the distribution, create two resource record sets to route traffic to your distribution, one with a value of <code>A</code> and one with a value of <code>AAAA</code>. </p> </li> <li> <p> <b>Amazon API Gateway environment that has a regionalized subdomain</b>: <code>A</code> </p> </li> <li> <p> <b>ELB load balancers:</b> <code>A</code> | <code>AAAA</code> </p> </li> <li> <p> <b>Amazon S3 buckets:</b> <code>A</code> </p> </li> <li> <p> <b>Amazon Virtual Private Cloud interface VPC endpoints</b> <code>A</code> </p> </li> <li> <p> <b>Another resource record set in this hosted zone:</b> Specify the type of the resource record set that you're creating the alias for. All values are supported except <code>NS</code> and <code>SOA</code>.</p> <note> <p>If you're creating an alias record that has the same name as the hosted zone (known as the zone apex), you can't route traffic to a record for which the value of <code>Type</code> is <code>CNAME</code>. This is because the alias record must have the same type as the record you're routing traffic to, and creating a CNAME record for the zone apex isn't supported even for an alias record.</p> </note> </li> </ul>\"\
        },\
        \"SetIdentifier\":{\
          \"shape\":\"ResourceRecordSetIdentifier\",\
          \"documentation\":\"<p> <i>Resource record sets that have a routing policy other than simple:</i> An identifier that differentiates among multiple resource record sets that have the same combination of name and type, such as multiple weighted resource record sets named acme.example.com that have a type of A. In a group of resource record sets that have the same name and type, the value of <code>SetIdentifier</code> must be unique for each resource record set. </p> <p>For information about routing policies, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html\\\">Choosing a Routing Policy</a> in the <i>Amazon Route 53 Developer Guide</i>.</p>\"\
        },\
        \"Weight\":{\
          \"shape\":\"ResourceRecordSetWeight\",\
          \"documentation\":\"<p> <i>Weighted resource record sets only:</i> Among resource record sets that have the same combination of DNS name and type, a value that determines the proportion of DNS queries that Amazon Route 53 responds to using the current resource record set. Route 53 calculates the sum of the weights for the resource record sets that have the same combination of DNS name and type. Route 53 then responds to queries based on the ratio of a resource's weight to the total. Note the following:</p> <ul> <li> <p>You must specify a value for the <code>Weight</code> element for every weighted resource record set.</p> </li> <li> <p>You can only specify one <code>ResourceRecord</code> per weighted resource record set.</p> </li> <li> <p>You can't create latency, failover, or geolocation resource record sets that have the same values for the <code>Name</code> and <code>Type</code> elements as weighted resource record sets.</p> </li> <li> <p>You can create a maximum of 100 weighted resource record sets that have the same values for the <code>Name</code> and <code>Type</code> elements.</p> </li> <li> <p>For weighted (but not weighted alias) resource record sets, if you set <code>Weight</code> to <code>0</code> for a resource record set, Route 53 never responds to queries with the applicable value for that resource record set. However, if you set <code>Weight</code> to <code>0</code> for all resource record sets that have the same combination of DNS name and type, traffic is routed to all resources with equal probability.</p> <p>The effect of setting <code>Weight</code> to <code>0</code> is different when you associate health checks with weighted resource record sets. For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-configuring-options.html\\\">Options for Configuring Route 53 Active-Active and Active-Passive Failover</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> </li> </ul>\"\
        },\
        \"Region\":{\
          \"shape\":\"ResourceRecordSetRegion\",\
          \"documentation\":\"<p> <i>Latency-based resource record sets only:</i> The Amazon EC2 Region where you created the resource that this resource record set refers to. The resource typically is an AWS resource, such as an EC2 instance or an ELB load balancer, and is referred to by an IP address or a DNS domain name, depending on the record type.</p> <note> <p>Although creating latency and latency alias resource record sets in a private hosted zone is allowed, it's not supported.</p> </note> <p>When Amazon Route 53 receives a DNS query for a domain name and type for which you have created latency resource record sets, Route 53 selects the latency resource record set that has the lowest latency between the end user and the associated Amazon EC2 Region. Route 53 then returns the value that is associated with the selected resource record set.</p> <p>Note the following:</p> <ul> <li> <p>You can only specify one <code>ResourceRecord</code> per latency resource record set.</p> </li> <li> <p>You can only create one latency resource record set for each Amazon EC2 Region.</p> </li> <li> <p>You aren't required to create latency resource record sets for all Amazon EC2 Regions. Route 53 will choose the region with the best latency from among the regions that you create latency resource record sets for.</p> </li> <li> <p>You can't create non-latency resource record sets that have the same values for the <code>Name</code> and <code>Type</code> elements as latency resource record sets.</p> </li> </ul>\"\
        },\
        \"GeoLocation\":{\
          \"shape\":\"GeoLocation\",\
          \"documentation\":\"<p> <i>Geolocation resource record sets only:</i> A complex type that lets you control how Amazon Route 53 responds to DNS queries based on the geographic origin of the query. For example, if you want all queries from Africa to be routed to a web server with an IP address of <code>192.0.2.111</code>, create a resource record set with a <code>Type</code> of <code>A</code> and a <code>ContinentCode</code> of <code>AF</code>.</p> <note> <p>Although creating geolocation and geolocation alias resource record sets in a private hosted zone is allowed, it's not supported.</p> </note> <p>If you create separate resource record sets for overlapping geographic regions (for example, one resource record set for a continent and one for a country on the same continent), priority goes to the smallest geographic region. This allows you to route most queries for a continent to one resource and to route queries for a country on that continent to a different resource.</p> <p>You can't create two geolocation resource record sets that specify the same geographic location.</p> <p>The value <code>*</code> in the <code>CountryCode</code> element matches all geographic locations that aren't specified in other geolocation resource record sets that have the same values for the <code>Name</code> and <code>Type</code> elements.</p> <important> <p>Geolocation works by mapping IP addresses to locations. However, some IP addresses aren't mapped to geographic locations, so even if you create geolocation resource record sets that cover all seven continents, Route 53 will receive some DNS queries from locations that it can't identify. We recommend that you create a resource record set for which the value of <code>CountryCode</code> is <code>*</code>. Two groups of queries are routed to the resource that you specify in this record: queries that come from locations for which you haven't created geolocation resource record sets and queries from IP addresses that aren't mapped to a location. If you don't create a <code>*</code> resource record set, Route 53 returns a \\\"no answer\\\" response for queries from those locations.</p> </important> <p>You can't create non-geolocation resource record sets that have the same values for the <code>Name</code> and <code>Type</code> elements as geolocation resource record sets.</p>\"\
        },\
        \"Failover\":{\
          \"shape\":\"ResourceRecordSetFailover\",\
          \"documentation\":\"<p> <i>Failover resource record sets only:</i> To configure failover, you add the <code>Failover</code> element to two resource record sets. For one resource record set, you specify <code>PRIMARY</code> as the value for <code>Failover</code>; for the other resource record set, you specify <code>SECONDARY</code>. In addition, you include the <code>HealthCheckId</code> element and specify the health check that you want Amazon Route 53 to perform for each resource record set.</p> <p>Except where noted, the following failover behaviors assume that you have included the <code>HealthCheckId</code> element in both resource record sets:</p> <ul> <li> <p>When the primary resource record set is healthy, Route 53 responds to DNS queries with the applicable value from the primary resource record set regardless of the health of the secondary resource record set.</p> </li> <li> <p>When the primary resource record set is unhealthy and the secondary resource record set is healthy, Route 53 responds to DNS queries with the applicable value from the secondary resource record set.</p> </li> <li> <p>When the secondary resource record set is unhealthy, Route 53 responds to DNS queries with the applicable value from the primary resource record set regardless of the health of the primary resource record set.</p> </li> <li> <p>If you omit the <code>HealthCheckId</code> element for the secondary resource record set, and if the primary resource record set is unhealthy, Route 53 always responds to DNS queries with the applicable value from the secondary resource record set. This is true regardless of the health of the associated endpoint.</p> </li> </ul> <p>You can't create non-failover resource record sets that have the same values for the <code>Name</code> and <code>Type</code> elements as failover resource record sets.</p> <p>For failover alias resource record sets, you must also include the <code>EvaluateTargetHealth</code> element and set the value to true.</p> <p>For more information about configuring failover for Route 53, see the following topics in the <i>Amazon Route 53 Developer Guide</i>: </p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover.html\\\">Route 53 Health Checks and DNS Failover</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-private-hosted-zones.html\\\">Configuring Failover in a Private Hosted Zone</a> </p> </li> </ul>\"\
        },\
        \"MultiValueAnswer\":{\
          \"shape\":\"ResourceRecordSetMultiValueAnswer\",\
          \"documentation\":\"<p> <i>Multivalue answer resource record sets only</i>: To route traffic approximately randomly to multiple resources, such as web servers, create one multivalue answer record for each resource and specify <code>true</code> for <code>MultiValueAnswer</code>. Note the following:</p> <ul> <li> <p>If you associate a health check with a multivalue answer resource record set, Amazon Route 53 responds to DNS queries with the corresponding IP address only when the health check is healthy.</p> </li> <li> <p>If you don't associate a health check with a multivalue answer record, Route 53 always considers the record to be healthy.</p> </li> <li> <p>Route 53 responds to DNS queries with up to eight healthy records; if you have eight or fewer healthy records, Route 53 responds to all DNS queries with all the healthy records.</p> </li> <li> <p>If you have more than eight healthy records, Route 53 responds to different DNS resolvers with different combinations of healthy records.</p> </li> <li> <p>When all records are unhealthy, Route 53 responds to DNS queries with up to eight unhealthy records.</p> </li> <li> <p>If a resource becomes unavailable after a resolver caches a response, client software typically tries another of the IP addresses in the response.</p> </li> </ul> <p>You can't create multivalue answer alias records.</p>\"\
        },\
        \"TTL\":{\
          \"shape\":\"TTL\",\
          \"documentation\":\"<p>The resource record cache time to live (TTL), in seconds. Note the following:</p> <ul> <li> <p>If you're creating or updating an alias resource record set, omit <code>TTL</code>. Amazon Route 53 uses the value of <code>TTL</code> for the alias target. </p> </li> <li> <p>If you're associating this resource record set with a health check (if you're adding a <code>HealthCheckId</code> element), we recommend that you specify a <code>TTL</code> of 60 seconds or less so clients respond quickly to changes in health status.</p> </li> <li> <p>All of the resource record sets in a group of weighted resource record sets must have the same value for <code>TTL</code>.</p> </li> <li> <p>If a group of weighted resource record sets includes one or more weighted alias resource record sets for which the alias target is an ELB load balancer, we recommend that you specify a <code>TTL</code> of 60 seconds for all of the non-alias weighted resource record sets that have the same name and type. Values other than 60 seconds (the TTL for load balancers) will change the effect of the values that you specify for <code>Weight</code>.</p> </li> </ul>\"\
        },\
        \"ResourceRecords\":{\
          \"shape\":\"ResourceRecords\",\
          \"documentation\":\"<p>Information about the resource records to act upon.</p> <note> <p>If you're creating an alias resource record set, omit <code>ResourceRecords</code>.</p> </note>\"\
        },\
        \"AliasTarget\":{\
          \"shape\":\"AliasTarget\",\
          \"documentation\":\"<p> <i>Alias resource record sets only:</i> Information about the AWS resource, such as a CloudFront distribution or an Amazon S3 bucket, that you want to route traffic to. </p> <p>If you're creating resource records sets for a private hosted zone, note the following:</p> <ul> <li> <p>You can't create an alias resource record set in a private hosted zone to route traffic to a CloudFront distribution.</p> </li> <li> <p>Creating geolocation alias resource record sets or latency alias resource record sets in a private hosted zone is unsupported.</p> </li> <li> <p>For information about creating failover resource record sets in a private hosted zone, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-private-hosted-zones.html\\\">Configuring Failover in a Private Hosted Zone</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> </li> </ul>\"\
        },\
        \"HealthCheckId\":{\
          \"shape\":\"HealthCheckId\",\
          \"documentation\":\"<p>If you want Amazon Route 53 to return this resource record set in response to a DNS query only when the status of a health check is healthy, include the <code>HealthCheckId</code> element and specify the ID of the applicable health check.</p> <p>Route 53 determines whether a resource record set is healthy based on one of the following:</p> <ul> <li> <p>By periodically sending a request to the endpoint that is specified in the health check</p> </li> <li> <p>By aggregating the status of a specified group of health checks (calculated health checks)</p> </li> <li> <p>By determining the current state of a CloudWatch alarm (CloudWatch metric health checks)</p> </li> </ul> <important> <p>Route 53 doesn't check the health of the endpoint that is specified in the resource record set, for example, the endpoint specified by the IP address in the <code>Value</code> element. When you add a <code>HealthCheckId</code> element to a resource record set, Route 53 checks the health of the endpoint that you specified in the health check. </p> </important> <p>For more information, see the following topics in the <i>Amazon Route 53 Developer Guide</i>:</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html\\\">How Amazon Route 53 Determines Whether an Endpoint Is Healthy</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover.html\\\">Route 53 Health Checks and DNS Failover</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-private-hosted-zones.html\\\">Configuring Failover in a Private Hosted Zone</a> </p> </li> </ul> <p> <b>When to Specify HealthCheckId</b> </p> <p>Specifying a value for <code>HealthCheckId</code> is useful only when Route 53 is choosing between two or more resource record sets to respond to a DNS query, and you want Route 53 to base the choice in part on the status of a health check. Configuring health checks makes sense only in the following configurations:</p> <ul> <li> <p> <b>Non-alias resource record sets</b>: You're checking the health of a group of non-alias resource record sets that have the same routing policy, name, and type (such as multiple weighted records named www.example.com with a type of A) and you specify health check IDs for all the resource record sets. </p> <p>If the health check status for a resource record set is healthy, Route 53 includes the record among the records that it responds to DNS queries with.</p> <p>If the health check status for a resource record set is unhealthy, Route 53 stops responding to DNS queries using the value for that resource record set.</p> <p>If the health check status for all resource record sets in the group is unhealthy, Route 53 considers all resource record sets in the group healthy and responds to DNS queries accordingly. </p> </li> <li> <p> <b>Alias resource record sets</b>: You specify the following settings:</p> <ul> <li> <p>You set <code>EvaluateTargetHealth</code> to true for an alias resource record set in a group of resource record sets that have the same routing policy, name, and type (such as multiple weighted records named www.example.com with a type of A). </p> </li> <li> <p>You configure the alias resource record set to route traffic to a non-alias resource record set in the same hosted zone.</p> </li> <li> <p>You specify a health check ID for the non-alias resource record set. </p> </li> </ul> <p>If the health check status is healthy, Route 53 considers the alias resource record set to be healthy and includes the alias record among the records that it responds to DNS queries with.</p> <p>If the health check status is unhealthy, Route 53 stops responding to DNS queries using the alias resource record set.</p> <note> <p>The alias resource record set can also route traffic to a <i>group</i> of non-alias resource record sets that have the same routing policy, name, and type. In that configuration, associate health checks with all of the resource record sets in the group of non-alias resource record sets.</p> </note> </li> </ul> <p> <b>Geolocation Routing</b> </p> <p>For geolocation resource record sets, if an endpoint is unhealthy, Route 53 looks for a resource record set for the larger, associated geographic region. For example, suppose you have resource record sets for a state in the United States, for the entire United States, for North America, and a resource record set that has <code>*</code> for <code>CountryCode</code> is <code>*</code>, which applies to all locations. If the endpoint for the state resource record set is unhealthy, Route 53 checks for healthy resource record sets in the following order until it finds a resource record set for which the endpoint is healthy:</p> <ul> <li> <p>The United States</p> </li> <li> <p>North America</p> </li> <li> <p>The default resource record set</p> </li> </ul> <p> <b>Specifying the Health Check Endpoint by Domain Name</b> </p> <p>If your health checks specify the endpoint only by domain name, we recommend that you create a separate health check for each endpoint. For example, create a health check for each <code>HTTP</code> server that is serving content for <code>www.example.com</code>. For the value of <code>FullyQualifiedDomainName</code>, specify the domain name of the server (such as <code>us-east-2-www.example.com</code>), not the name of the resource record sets (<code>www.example.com</code>).</p> <important> <p>Health check results will be unpredictable if you do the following:</p> <ul> <li> <p>Create a health check that has the same value for <code>FullyQualifiedDomainName</code> as the name of a resource record set.</p> </li> <li> <p>Associate that health check with the resource record set.</p> </li> </ul> </important>\"\
        },\
        \"TrafficPolicyInstanceId\":{\
          \"shape\":\"TrafficPolicyInstanceId\",\
          \"documentation\":\"<p>When you create a traffic policy instance, Amazon Route 53 automatically creates a resource record set. <code>TrafficPolicyInstanceId</code> is the ID of the traffic policy instance that Route 53 created this resource record set for.</p> <important> <p>To delete the resource record set that is associated with a traffic policy instance, use <code>DeleteTrafficPolicyInstance</code>. Route 53 will delete the resource record set automatically. If you delete the resource record set by using <code>ChangeResourceRecordSets</code>, Route 53 doesn't automatically delete the traffic policy instance, and you'll continue to be charged for it even though it's no longer in use. </p> </important>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the resource record set to create or delete.</p>\"\
    },\
    \"ResourceRecordSetFailover\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PRIMARY\",\
        \"SECONDARY\"\
      ]\
    },\
    \"ResourceRecordSetIdentifier\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"ResourceRecordSetMultiValueAnswer\":{\"type\":\"boolean\"},\
    \"ResourceRecordSetRegion\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"us-east-1\",\
        \"us-east-2\",\
        \"us-west-1\",\
        \"us-west-2\",\
        \"ca-central-1\",\
        \"eu-west-1\",\
        \"eu-west-2\",\
        \"eu-west-3\",\
        \"eu-central-1\",\
        \"ap-southeast-1\",\
        \"ap-southeast-2\",\
        \"ap-northeast-1\",\
        \"ap-northeast-2\",\
        \"ap-northeast-3\",\
        \"eu-north-1\",\
        \"sa-east-1\",\
        \"cn-north-1\",\
        \"cn-northwest-1\",\
        \"ap-east-1\",\
        \"me-south-1\",\
        \"ap-south-1\",\
        \"af-south-1\",\
        \"eu-south-1\"\
      ],\
      \"max\":64,\
      \"min\":1\
    },\
    \"ResourceRecordSetWeight\":{\
      \"type\":\"long\",\
      \"max\":255,\
      \"min\":0\
    },\
    \"ResourceRecordSets\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ResourceRecordSet\",\
        \"locationName\":\"ResourceRecordSet\"\
      }\
    },\
    \"ResourceRecords\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ResourceRecord\",\
        \"locationName\":\"ResourceRecord\"\
      },\
      \"min\":1\
    },\
    \"ResourceTagSet\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceType\":{\
          \"shape\":\"TagResourceType\",\
          \"documentation\":\"<p>The type of the resource.</p> <ul> <li> <p>The resource type for health checks is <code>healthcheck</code>.</p> </li> <li> <p>The resource type for hosted zones is <code>hostedzone</code>.</p> </li> </ul>\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"TagResourceId\",\
          \"documentation\":\"<p>The ID for the specified resource.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags associated with the specified resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type containing a resource and its associated tags.</p>\"\
    },\
    \"ResourceTagSetList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ResourceTagSet\",\
        \"locationName\":\"ResourceTagSet\"\
      }\
    },\
    \"ResourceURI\":{\
      \"type\":\"string\",\
      \"max\":1024\
    },\
    \"ReusableDelegationSetLimit\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Type\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"ReusableDelegationSetLimitType\",\
          \"documentation\":\"<p>The limit that you requested: <code>MAX_ZONES_BY_REUSABLE_DELEGATION_SET</code>, the maximum number of hosted zones that you can associate with the specified reusable delegation set.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"LimitValue\",\
          \"documentation\":\"<p>The current value for the <code>MAX_ZONES_BY_REUSABLE_DELEGATION_SET</code> limit.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the type of limit that you specified in the request and the current value for that limit.</p>\"\
    },\
    \"ReusableDelegationSetLimitType\":{\
      \"type\":\"string\",\
      \"enum\":[\"MAX_ZONES_BY_REUSABLE_DELEGATION_SET\"]\
    },\
    \"SearchString\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"ServicePrincipal\":{\
      \"type\":\"string\",\
      \"max\":128\
    },\
    \"Statistic\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Average\",\
        \"Sum\",\
        \"SampleCount\",\
        \"Maximum\",\
        \"Minimum\"\
      ]\
    },\
    \"Status\":{\"type\":\"string\"},\
    \"StatusReport\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"Status\",\
          \"documentation\":\"<p>A description of the status of the health check endpoint as reported by one of the Amazon Route 53 health checkers.</p>\"\
        },\
        \"CheckedTime\":{\
          \"shape\":\"TimeStamp\",\
          \"documentation\":\"<p>The date and time that the health checker performed the health check in <a href=\\\"https://en.wikipedia.org/wiki/ISO_8601\\\">ISO 8601 format</a> and Coordinated Universal Time (UTC). For example, the value <code>2017-03-27T17:48:16.751Z</code> represents March 27, 2017 at 17:48:16.751 UTC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the status that one Amazon Route 53 health checker reports and the time of the health check.</p>\"\
    },\
    \"SubnetMask\":{\
      \"type\":\"string\",\
      \"max\":3,\
      \"min\":0\
    },\
    \"TTL\":{\
      \"type\":\"long\",\
      \"max\":2147483647,\
      \"min\":0\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The value of <code>Key</code> depends on the operation that you want to perform:</p> <ul> <li> <p> <b>Add a tag to a health check or hosted zone</b>: <code>Key</code> is the name that you want to give the new tag.</p> </li> <li> <p> <b>Edit a tag</b>: <code>Key</code> is the name of the tag that you want to change the <code>Value</code> for.</p> </li> <li> <p> <b> Delete a key</b>: <code>Key</code> is the name of the tag you want to remove.</p> </li> <li> <p> <b>Give a name to a health check</b>: Edit the default <code>Name</code> tag. In the Amazon Route 53 console, the list of your health checks includes a <b>Name</b> column that lets you see the name that you've given to each health check.</p> </li> </ul>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The value of <code>Value</code> depends on the operation that you want to perform:</p> <ul> <li> <p> <b>Add a tag to a health check or hosted zone</b>: <code>Value</code> is the value that you want to give the new tag.</p> </li> <li> <p> <b>Edit a tag</b>: <code>Value</code> is the new value that you want to assign the tag.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about a tag that you want to add or edit for the specified health check or hosted zone.</p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"TagKey\",\
        \"locationName\":\"Key\"\
      },\
      \"max\":10,\
      \"min\":1\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Tag\",\
        \"locationName\":\"Tag\"\
      },\
      \"max\":10,\
      \"min\":1\
    },\
    \"TagResourceId\":{\
      \"type\":\"string\",\
      \"max\":64\
    },\
    \"TagResourceIdList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"TagResourceId\",\
        \"locationName\":\"ResourceId\"\
      },\
      \"max\":10,\
      \"min\":1\
    },\
    \"TagResourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"healthcheck\",\
        \"hostedzone\"\
      ]\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"TestDNSAnswerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HostedZoneId\",\
        \"RecordName\",\
        \"RecordType\"\
      ],\
      \"members\":{\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the hosted zone that you want Amazon Route 53 to simulate a query for.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"hostedzoneid\"\
        },\
        \"RecordName\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>The name of the resource record set that you want Amazon Route 53 to simulate a query for.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"recordname\"\
        },\
        \"RecordType\":{\
          \"shape\":\"RRType\",\
          \"documentation\":\"<p>The type of the resource record set.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"recordtype\"\
        },\
        \"ResolverIP\":{\
          \"shape\":\"IPAddress\",\
          \"documentation\":\"<p>If you want to simulate a request from a specific DNS resolver, specify the IP address for that resolver. If you omit this value, <code>TestDnsAnswer</code> uses the IP address of a DNS resolver in the AWS US East (N. Virginia) Region (<code>us-east-1</code>).</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resolverip\"\
        },\
        \"EDNS0ClientSubnetIP\":{\
          \"shape\":\"IPAddress\",\
          \"documentation\":\"<p>If the resolver that you specified for resolverip supports EDNS0, specify the IPv4 or IPv6 address of a client in the applicable location, for example, <code>192.0.2.44</code> or <code>2001:db8:85a3::8a2e:370:7334</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"edns0clientsubnetip\"\
        },\
        \"EDNS0ClientSubnetMask\":{\
          \"shape\":\"SubnetMask\",\
          \"documentation\":\"<p>If you specify an IP address for <code>edns0clientsubnetip</code>, you can optionally specify the number of bits of the IP address that you want the checking tool to include in the DNS query. For example, if you specify <code>192.0.2.44</code> for <code>edns0clientsubnetip</code> and <code>24</code> for <code>edns0clientsubnetmask</code>, the checking tool will simulate a request from 192.0.2.0/24. The default value is 24 bits for IPv4 addresses and 64 bits for IPv6 addresses.</p> <p>The range of valid values depends on whether <code>edns0clientsubnetip</code> is an IPv4 or an IPv6 address:</p> <ul> <li> <p> <b>IPv4</b>: Specify a value between 0 and 32</p> </li> <li> <p> <b>IPv6</b>: Specify a value between 0 and 128</p> </li> </ul>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"edns0clientsubnetmask\"\
        }\
      },\
      \"documentation\":\"<p>Gets the value that Amazon Route 53 returns in response to a DNS request for a specified record name and type. You can optionally specify the IP address of a DNS resolver, an EDNS0 client subnet IP address, and a subnet mask. </p>\"\
    },\
    \"TestDNSAnswerResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Nameserver\",\
        \"RecordName\",\
        \"RecordType\",\
        \"RecordData\",\
        \"ResponseCode\",\
        \"Protocol\"\
      ],\
      \"members\":{\
        \"Nameserver\":{\
          \"shape\":\"Nameserver\",\
          \"documentation\":\"<p>The Amazon Route 53 name server used to respond to the request.</p>\"\
        },\
        \"RecordName\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>The name of the resource record set that you submitted a request for.</p>\"\
        },\
        \"RecordType\":{\
          \"shape\":\"RRType\",\
          \"documentation\":\"<p>The type of the resource record set that you submitted a request for.</p>\"\
        },\
        \"RecordData\":{\
          \"shape\":\"RecordData\",\
          \"documentation\":\"<p>A list that contains values that Amazon Route 53 returned for this resource record set.</p>\"\
        },\
        \"ResponseCode\":{\
          \"shape\":\"DNSRCode\",\
          \"documentation\":\"<p>A code that indicates whether the request is valid or not. The most common response code is <code>NOERROR</code>, meaning that the request is valid. If the response is not valid, Amazon Route 53 returns a response code that describes the error. For a list of possible response codes, see <a href=\\\"http://www.iana.org/assignments/dns-parameters/dns-parameters.xhtml#dns-parameters-6\\\">DNS RCODES</a> on the IANA website. </p>\"\
        },\
        \"Protocol\":{\
          \"shape\":\"TransportProtocol\",\
          \"documentation\":\"<p>The protocol that Amazon Route 53 used to respond to the request, either <code>UDP</code> or <code>TCP</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response to a <code>TestDNSAnswer</code> request. </p>\"\
    },\
    \"Threshold\":{\"type\":\"double\"},\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The limit on the number of requests per second was exceeded.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"TimeStamp\":{\"type\":\"timestamp\"},\
    \"TooManyHealthChecks\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>This health check can't be created because the current account has reached the limit on the number of active health checks.</p> <p>For information about default limits, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html\\\">Limits</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>For information about how to get the current limit for an account, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetAccountLimit.html\\\">GetAccountLimit</a>. To request a higher limit, <a href=\\\"http://aws.amazon.com/route53-request\\\">create a case</a> with the AWS Support Center.</p> <p>You have reached the maximum number of active health checks for an AWS account. To request a higher limit, <a href=\\\"http://aws.amazon.com/route53-request\\\">create a case</a> with the AWS Support Center.</p>\",\
      \"exception\":true\
    },\
    \"TooManyHostedZones\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This operation can't be completed either because the current account has reached the limit on the number of hosted zones or because you've reached the limit on the number of hosted zones that can be associated with a reusable delegation set.</p> <p>For information about default limits, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html\\\">Limits</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>To get the current limit on hosted zones that can be created by an account, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetAccountLimit.html\\\">GetAccountLimit</a>.</p> <p>To get the current limit on hosted zones that can be associated with a reusable delegation set, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetReusableDelegationSetLimit.html\\\">GetReusableDelegationSetLimit</a>.</p> <p>To request a higher limit, <a href=\\\"http://aws.amazon.com/route53-request\\\">create a case</a> with the AWS Support Center.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"TooManyTrafficPolicies\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This traffic policy can't be created because the current account has reached the limit on the number of traffic policies.</p> <p>For information about default limits, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html\\\">Limits</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>To get the current limit for an account, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetAccountLimit.html\\\">GetAccountLimit</a>. </p> <p>To request a higher limit, <a href=\\\"http://aws.amazon.com/route53-request\\\">create a case</a> with the AWS Support Center.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"TooManyTrafficPolicyInstances\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This traffic policy instance can't be created because the current account has reached the limit on the number of traffic policy instances.</p> <p>For information about default limits, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html\\\">Limits</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>For information about how to get the current limit for an account, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetAccountLimit.html\\\">GetAccountLimit</a>.</p> <p>To request a higher limit, <a href=\\\"http://aws.amazon.com/route53-request\\\">create a case</a> with the AWS Support Center.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"TooManyTrafficPolicyVersionsForCurrentPolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This traffic policy version can't be created because you've reached the limit of 1000 on the number of versions that you can create for the current traffic policy.</p> <p>To create more traffic policy versions, you can use <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetTrafficPolicy.html\\\">GetTrafficPolicy</a> to get the traffic policy document for a specified traffic policy version, and then use <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateTrafficPolicy.html\\\">CreateTrafficPolicy</a> to create a new traffic policy using the traffic policy document.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"TooManyVPCAssociationAuthorizations\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>You've created the maximum number of authorizations that can be created for the specified hosted zone. To authorize another VPC to be associated with the hosted zone, submit a <code>DeleteVPCAssociationAuthorization</code> request to remove an existing authorization. To get a list of existing authorizations, submit a <code>ListVPCAssociationAuthorizations</code> request.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"TrafficPolicies\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"TrafficPolicy\",\
        \"locationName\":\"TrafficPolicy\"\
      }\
    },\
    \"TrafficPolicy\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Id\",\
        \"Version\",\
        \"Name\",\
        \"Type\",\
        \"Document\"\
      ],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TrafficPolicyId\",\
          \"documentation\":\"<p>The ID that Amazon Route 53 assigned to a traffic policy when you created it.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"TrafficPolicyVersion\",\
          \"documentation\":\"<p>The version number that Amazon Route 53 assigns to a traffic policy. For a new traffic policy, the value of <code>Version</code> is always 1.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"TrafficPolicyName\",\
          \"documentation\":\"<p>The name that you specified when you created the traffic policy.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"RRType\",\
          \"documentation\":\"<p>The DNS type of the resource record sets that Amazon Route 53 creates when you use a traffic policy to create a traffic policy instance.</p>\"\
        },\
        \"Document\":{\
          \"shape\":\"TrafficPolicyDocument\",\
          \"documentation\":\"<p>The definition of a traffic policy in JSON format. You specify the JSON document to use for a new traffic policy in the <code>CreateTrafficPolicy</code> request. For more information about the JSON format, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/api-policies-traffic-policy-document-format.html\\\">Traffic Policy Document Format</a>.</p>\"\
        },\
        \"Comment\":{\
          \"shape\":\"TrafficPolicyComment\",\
          \"documentation\":\"<p>The comment that you specify in the <code>CreateTrafficPolicy</code> request, if any.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains settings for a traffic policy.</p>\"\
    },\
    \"TrafficPolicyAlreadyExists\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A traffic policy that has the same value for <code>Name</code> already exists.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"TrafficPolicyComment\":{\
      \"type\":\"string\",\
      \"max\":1024\
    },\
    \"TrafficPolicyDocument\":{\
      \"type\":\"string\",\
      \"max\":102400\
    },\
    \"TrafficPolicyId\":{\
      \"type\":\"string\",\
      \"max\":36,\
      \"min\":1\
    },\
    \"TrafficPolicyInUse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>One or more traffic policy instances were created by using the specified traffic policy.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"TrafficPolicyInstance\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Id\",\
        \"HostedZoneId\",\
        \"Name\",\
        \"TTL\",\
        \"State\",\
        \"Message\",\
        \"TrafficPolicyId\",\
        \"TrafficPolicyVersion\",\
        \"TrafficPolicyType\"\
      ],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TrafficPolicyInstanceId\",\
          \"documentation\":\"<p>The ID that Amazon Route 53 assigned to the new traffic policy instance.</p>\"\
        },\
        \"HostedZoneId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the hosted zone that Amazon Route 53 created resource record sets in.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"DNSName\",\
          \"documentation\":\"<p>The DNS name, such as www.example.com, for which Amazon Route 53 responds to queries by using the resource record sets that are associated with this traffic policy instance. </p>\"\
        },\
        \"TTL\":{\
          \"shape\":\"TTL\",\
          \"documentation\":\"<p>The TTL that Amazon Route 53 assigned to all of the resource record sets that it created in the specified hosted zone.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"TrafficPolicyInstanceState\",\
          \"documentation\":\"<p>The value of <code>State</code> is one of the following values:</p> <dl> <dt>Applied</dt> <dd> <p>Amazon Route 53 has finished creating resource record sets, and changes have propagated to all Route 53 edge locations.</p> </dd> <dt>Creating</dt> <dd> <p>Route 53 is creating the resource record sets. Use <code>GetTrafficPolicyInstance</code> to confirm that the <code>CreateTrafficPolicyInstance</code> request completed successfully.</p> </dd> <dt>Failed</dt> <dd> <p>Route 53 wasn't able to create or update the resource record sets. When the value of <code>State</code> is <code>Failed</code>, see <code>Message</code> for an explanation of what caused the request to fail.</p> </dd> </dl>\"\
        },\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>If <code>State</code> is <code>Failed</code>, an explanation of the reason for the failure. If <code>State</code> is another value, <code>Message</code> is empty.</p>\"\
        },\
        \"TrafficPolicyId\":{\
          \"shape\":\"TrafficPolicyId\",\
          \"documentation\":\"<p>The ID of the traffic policy that Amazon Route 53 used to create resource record sets in the specified hosted zone.</p>\"\
        },\
        \"TrafficPolicyVersion\":{\
          \"shape\":\"TrafficPolicyVersion\",\
          \"documentation\":\"<p>The version of the traffic policy that Amazon Route 53 used to create resource record sets in the specified hosted zone.</p>\"\
        },\
        \"TrafficPolicyType\":{\
          \"shape\":\"RRType\",\
          \"documentation\":\"<p>The DNS type that Amazon Route 53 assigned to all of the resource record sets that it created for this traffic policy instance. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains settings for the new traffic policy instance.</p>\"\
    },\
    \"TrafficPolicyInstanceAlreadyExists\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>There is already a traffic policy instance with the specified ID.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"TrafficPolicyInstanceCount\":{\"type\":\"integer\"},\
    \"TrafficPolicyInstanceId\":{\
      \"type\":\"string\",\
      \"max\":36,\
      \"min\":1\
    },\
    \"TrafficPolicyInstanceState\":{\"type\":\"string\"},\
    \"TrafficPolicyInstances\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"TrafficPolicyInstance\",\
        \"locationName\":\"TrafficPolicyInstance\"\
      }\
    },\
    \"TrafficPolicyName\":{\
      \"type\":\"string\",\
      \"max\":512\
    },\
    \"TrafficPolicySummaries\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"TrafficPolicySummary\",\
        \"locationName\":\"TrafficPolicySummary\"\
      }\
    },\
    \"TrafficPolicySummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Id\",\
        \"Name\",\
        \"Type\",\
        \"LatestVersion\",\
        \"TrafficPolicyCount\"\
      ],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TrafficPolicyId\",\
          \"documentation\":\"<p>The ID that Amazon Route 53 assigned to the traffic policy when you created it.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"TrafficPolicyName\",\
          \"documentation\":\"<p>The name that you specified for the traffic policy when you created it.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"RRType\",\
          \"documentation\":\"<p>The DNS type of the resource record sets that Amazon Route 53 creates when you use a traffic policy to create a traffic policy instance.</p>\"\
        },\
        \"LatestVersion\":{\
          \"shape\":\"TrafficPolicyVersion\",\
          \"documentation\":\"<p>The version number of the latest version of the traffic policy.</p>\"\
        },\
        \"TrafficPolicyCount\":{\
          \"shape\":\"TrafficPolicyVersion\",\
          \"documentation\":\"<p>The number of traffic policies that are associated with the current AWS account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the latest version of one traffic policy that is associated with the current AWS account.</p>\"\
    },\
    \"TrafficPolicyVersion\":{\
      \"type\":\"integer\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"TrafficPolicyVersionMarker\":{\
      \"type\":\"string\",\
      \"max\":4\
    },\
    \"TransportProtocol\":{\"type\":\"string\"},\
    \"UpdateHealthCheckRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"HealthCheckId\"],\
      \"members\":{\
        \"HealthCheckId\":{\
          \"shape\":\"HealthCheckId\",\
          \"documentation\":\"<p>The ID for the health check for which you want detailed information. When you created the health check, <code>CreateHealthCheck</code> returned the ID in the response, in the <code>HealthCheckId</code> element.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"HealthCheckId\"\
        },\
        \"HealthCheckVersion\":{\
          \"shape\":\"HealthCheckVersion\",\
          \"documentation\":\"<p>A sequential counter that Amazon Route 53 sets to <code>1</code> when you create a health check and increments by 1 each time you update settings for the health check.</p> <p>We recommend that you use <code>GetHealthCheck</code> or <code>ListHealthChecks</code> to get the current value of <code>HealthCheckVersion</code> for the health check that you want to update, and that you include that value in your <code>UpdateHealthCheck</code> request. This prevents Route 53 from overwriting an intervening update:</p> <ul> <li> <p>If the value in the <code>UpdateHealthCheck</code> request matches the value of <code>HealthCheckVersion</code> in the health check, Route 53 updates the health check with the new settings.</p> </li> <li> <p>If the value of <code>HealthCheckVersion</code> in the health check is greater, the health check was changed after you got the version number. Route 53 does not update the health check, and it returns a <code>HealthCheckVersionMismatch</code> error.</p> </li> </ul>\"\
        },\
        \"IPAddress\":{\
          \"shape\":\"IPAddress\",\
          \"documentation\":\"<p>The IPv4 or IPv6 IP address for the endpoint that you want Amazon Route 53 to perform health checks on. If you don't specify a value for <code>IPAddress</code>, Route 53 sends a DNS request to resolve the domain name that you specify in <code>FullyQualifiedDomainName</code> at the interval that you specify in <code>RequestInterval</code>. Using an IP address that is returned by DNS, Route 53 then checks the health of the endpoint.</p> <p>Use one of the following formats for the value of <code>IPAddress</code>: </p> <ul> <li> <p> <b>IPv4 address</b>: four values between 0 and 255, separated by periods (.), for example, <code>192.0.2.44</code>.</p> </li> <li> <p> <b>IPv6 address</b>: eight groups of four hexadecimal values, separated by colons (:), for example, <code>2001:0db8:85a3:0000:0000:abcd:0001:2345</code>. You can also shorten IPv6 addresses as described in RFC 5952, for example, <code>2001:db8:85a3::abcd:1:2345</code>.</p> </li> </ul> <p>If the endpoint is an EC2 instance, we recommend that you create an Elastic IP address, associate it with your EC2 instance, and specify the Elastic IP address for <code>IPAddress</code>. This ensures that the IP address of your instance never changes. For more information, see the applicable documentation:</p> <ul> <li> <p>Linux: <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html\\\">Elastic IP Addresses (EIP)</a> in the <i>Amazon EC2 User Guide for Linux Instances</i> </p> </li> <li> <p>Windows: <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/elastic-ip-addresses-eip.html\\\">Elastic IP Addresses (EIP)</a> in the <i>Amazon EC2 User Guide for Windows Instances</i> </p> </li> </ul> <note> <p>If a health check already has a value for <code>IPAddress</code>, you can change the value. However, you can't update an existing health check to add or remove the value of <code>IPAddress</code>. </p> </note> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-FullyQualifiedDomainName\\\">FullyQualifiedDomainName</a>. </p> <p>Constraints: Route 53 can't check the health of endpoints for which the IP address is in local, private, non-routable, or multicast ranges. For more information about IP addresses for which you can't create health checks, see the following documents:</p> <ul> <li> <p> <a href=\\\"https://tools.ietf.org/html/rfc5735\\\">RFC 5735, Special Use IPv4 Addresses</a> </p> </li> <li> <p> <a href=\\\"https://tools.ietf.org/html/rfc6598\\\">RFC 6598, IANA-Reserved IPv4 Prefix for Shared Address Space</a> </p> </li> <li> <p> <a href=\\\"https://tools.ietf.org/html/rfc5156\\\">RFC 5156, Special-Use IPv6 Addresses</a> </p> </li> </ul>\"\
        },\
        \"Port\":{\
          \"shape\":\"Port\",\
          \"documentation\":\"<p>The port on the endpoint that you want Amazon Route 53 to perform health checks on.</p> <note> <p>Don't specify a value for <code>Port</code> when you specify a value for <code>Type</code> of <code>CLOUDWATCH_METRIC</code> or <code>CALCULATED</code>.</p> </note>\"\
        },\
        \"ResourcePath\":{\
          \"shape\":\"ResourcePath\",\
          \"documentation\":\"<p>The path that you want Amazon Route 53 to request when performing health checks. The path can be any value for which your endpoint will return an HTTP status code of 2xx or 3xx when the endpoint is healthy, for example the file /docs/route53-health-check.html. You can also include query string parameters, for example, <code>/welcome.html?language=jp&amp;login=y</code>. </p> <p>Specify this value only if you want to change it.</p>\"\
        },\
        \"FullyQualifiedDomainName\":{\
          \"shape\":\"FullyQualifiedDomainName\",\
          \"documentation\":\"<p>Amazon Route 53 behavior depends on whether you specify a value for <code>IPAddress</code>.</p> <note> <p>If a health check already has a value for <code>IPAddress</code>, you can change the value. However, you can't update an existing health check to add or remove the value of <code>IPAddress</code>. </p> </note> <p> <b>If you specify a value for</b> <code>IPAddress</code>:</p> <p>Route 53 sends health check requests to the specified IPv4 or IPv6 address and passes the value of <code>FullyQualifiedDomainName</code> in the <code>Host</code> header for all health checks except TCP health checks. This is typically the fully qualified DNS name of the endpoint on which you want Route 53 to perform health checks.</p> <p>When Route 53 checks the health of an endpoint, here is how it constructs the <code>Host</code> header:</p> <ul> <li> <p>If you specify a value of <code>80</code> for <code>Port</code> and <code>HTTP</code> or <code>HTTP_STR_MATCH</code> for <code>Type</code>, Route 53 passes the value of <code>FullyQualifiedDomainName</code> to the endpoint in the <code>Host</code> header.</p> </li> <li> <p>If you specify a value of <code>443</code> for <code>Port</code> and <code>HTTPS</code> or <code>HTTPS_STR_MATCH</code> for <code>Type</code>, Route 53 passes the value of <code>FullyQualifiedDomainName</code> to the endpoint in the <code>Host</code> header.</p> </li> <li> <p>If you specify another value for <code>Port</code> and any value except <code>TCP</code> for <code>Type</code>, Route 53 passes <i> <code>FullyQualifiedDomainName</code>:<code>Port</code> </i> to the endpoint in the <code>Host</code> header.</p> </li> </ul> <p>If you don't specify a value for <code>FullyQualifiedDomainName</code>, Route 53 substitutes the value of <code>IPAddress</code> in the <code>Host</code> header in each of the above cases.</p> <p> <b>If you don't specify a value for</b> <code>IPAddress</code>:</p> <p>If you don't specify a value for <code>IPAddress</code>, Route 53 sends a DNS request to the domain that you specify in <code>FullyQualifiedDomainName</code> at the interval you specify in <code>RequestInterval</code>. Using an IPv4 address that is returned by DNS, Route 53 then checks the health of the endpoint.</p> <note> <p>If you don't specify a value for <code>IPAddress</code>, Route 53 uses only IPv4 to send health checks to the endpoint. If there's no resource record set with a type of A for the name that you specify for <code>FullyQualifiedDomainName</code>, the health check fails with a \\\"DNS resolution failed\\\" error.</p> </note> <p>If you want to check the health of weighted, latency, or failover resource record sets and you choose to specify the endpoint only by <code>FullyQualifiedDomainName</code>, we recommend that you create a separate health check for each endpoint. For example, create a health check for each HTTP server that is serving content for www.example.com. For the value of <code>FullyQualifiedDomainName</code>, specify the domain name of the server (such as <code>us-east-2-www.example.com</code>), not the name of the resource record sets (www.example.com).</p> <important> <p>In this configuration, if the value of <code>FullyQualifiedDomainName</code> matches the name of the resource record sets and you then associate the health check with those resource record sets, health check results will be unpredictable.</p> </important> <p>In addition, if the value of <code>Type</code> is <code>HTTP</code>, <code>HTTPS</code>, <code>HTTP_STR_MATCH</code>, or <code>HTTPS_STR_MATCH</code>, Route 53 passes the value of <code>FullyQualifiedDomainName</code> in the <code>Host</code> header, as it does when you specify a value for <code>IPAddress</code>. If the value of <code>Type</code> is <code>TCP</code>, Route 53 doesn't pass a <code>Host</code> header.</p>\"\
        },\
        \"SearchString\":{\
          \"shape\":\"SearchString\",\
          \"documentation\":\"<p>If the value of <code>Type</code> is <code>HTTP_STR_MATCH</code> or <code>HTTPS_STR_MATCH</code>, the string that you want Amazon Route 53 to search for in the response body from the specified resource. If the string appears in the response body, Route 53 considers the resource healthy. (You can't change the value of <code>Type</code> when you update a health check.)</p>\"\
        },\
        \"FailureThreshold\":{\
          \"shape\":\"FailureThreshold\",\
          \"documentation\":\"<p>The number of consecutive health checks that an endpoint must pass or fail for Amazon Route 53 to change the current status of the endpoint from unhealthy to healthy or vice versa. For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html\\\">How Amazon Route 53 Determines Whether an Endpoint Is Healthy</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>If you don't specify a value for <code>FailureThreshold</code>, the default value is three health checks.</p>\"\
        },\
        \"Inverted\":{\
          \"shape\":\"Inverted\",\
          \"documentation\":\"<p>Specify whether you want Amazon Route 53 to invert the status of a health check, for example, to consider a health check unhealthy when it otherwise would be considered healthy.</p>\"\
        },\
        \"Disabled\":{\
          \"shape\":\"Disabled\",\
          \"documentation\":\"<p>Stops Route 53 from performing health checks. When you disable a health check, here's what happens:</p> <ul> <li> <p> <b>Health checks that check the health of endpoints:</b> Route 53 stops submitting requests to your application, server, or other resource.</p> </li> <li> <p> <b>Calculated health checks:</b> Route 53 stops aggregating the status of the referenced health checks.</p> </li> <li> <p> <b>Health checks that monitor CloudWatch alarms:</b> Route 53 stops monitoring the corresponding CloudWatch metrics.</p> </li> </ul> <p>After you disable a health check, Route 53 considers the status of the health check to always be healthy. If you configured DNS failover, Route 53 continues to route traffic to the corresponding resources. If you want to stop routing traffic to a resource, change the value of <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-Inverted\\\">Inverted</a>. </p> <p>Charges for a health check still apply when the health check is disabled. For more information, see <a href=\\\"http://aws.amazon.com/route53/pricing/\\\">Amazon Route 53 Pricing</a>.</p>\"\
        },\
        \"HealthThreshold\":{\
          \"shape\":\"HealthThreshold\",\
          \"documentation\":\"<p>The number of child health checks that are associated with a <code>CALCULATED</code> health that Amazon Route 53 must consider healthy for the <code>CALCULATED</code> health check to be considered healthy. To specify the child health checks that you want to associate with a <code>CALCULATED</code> health check, use the <code>ChildHealthChecks</code> and <code>ChildHealthCheck</code> elements.</p> <p>Note the following:</p> <ul> <li> <p>If you specify a number greater than the number of child health checks, Route 53 always considers this health check to be unhealthy.</p> </li> <li> <p>If you specify <code>0</code>, Route 53 always considers this health check to be healthy.</p> </li> </ul>\"\
        },\
        \"ChildHealthChecks\":{\
          \"shape\":\"ChildHealthCheckList\",\
          \"documentation\":\"<p>A complex type that contains one <code>ChildHealthCheck</code> element for each health check that you want to associate with a <code>CALCULATED</code> health check.</p>\"\
        },\
        \"EnableSNI\":{\
          \"shape\":\"EnableSNI\",\
          \"documentation\":\"<p>Specify whether you want Amazon Route 53 to send the value of <code>FullyQualifiedDomainName</code> to the endpoint in the <code>client_hello</code> message during <code>TLS</code> negotiation. This allows the endpoint to respond to <code>HTTPS</code> health check requests with the applicable SSL/TLS certificate.</p> <p>Some endpoints require that HTTPS requests include the host name in the <code>client_hello</code> message. If you don't enable SNI, the status of the health check will be SSL alert <code>handshake_failure</code>. A health check can also have that status for other reasons. If SNI is enabled and you're still getting the error, check the SSL/TLS configuration on your endpoint and confirm that your certificate is valid.</p> <p>The SSL/TLS certificate on your endpoint includes a domain name in the <code>Common Name</code> field and possibly several more in the <code>Subject Alternative Names</code> field. One of the domain names in the certificate should match the value that you specify for <code>FullyQualifiedDomainName</code>. If the endpoint responds to the <code>client_hello</code> message with a certificate that does not include the domain name that you specified in <code>FullyQualifiedDomainName</code>, a health checker will retry the handshake. In the second attempt, the health checker will omit <code>FullyQualifiedDomainName</code> from the <code>client_hello</code> message.</p>\"\
        },\
        \"Regions\":{\
          \"shape\":\"HealthCheckRegionList\",\
          \"documentation\":\"<p>A complex type that contains one <code>Region</code> element for each region that you want Amazon Route 53 health checkers to check the specified endpoint from.</p>\"\
        },\
        \"AlarmIdentifier\":{\
          \"shape\":\"AlarmIdentifier\",\
          \"documentation\":\"<p>A complex type that identifies the CloudWatch alarm that you want Amazon Route 53 health checkers to use to determine whether the specified health check is healthy.</p>\"\
        },\
        \"InsufficientDataHealthStatus\":{\
          \"shape\":\"InsufficientDataHealthStatus\",\
          \"documentation\":\"<p>When CloudWatch has insufficient data about the metric to determine the alarm state, the status that you want Amazon Route 53 to assign to the health check:</p> <ul> <li> <p> <code>Healthy</code>: Route 53 considers the health check to be healthy.</p> </li> <li> <p> <code>Unhealthy</code>: Route 53 considers the health check to be unhealthy.</p> </li> <li> <p> <code>LastKnownStatus</code>: Route 53 uses the status of the health check from the last time CloudWatch had sufficient data to determine the alarm state. For new health checks that have no last known status, the default status for the health check is healthy.</p> </li> </ul>\"\
        },\
        \"ResetElements\":{\
          \"shape\":\"ResettableElementNameList\",\
          \"documentation\":\"<p>A complex type that contains one <code>ResettableElementName</code> element for each element that you want to reset to the default value. Valid values for <code>ResettableElementName</code> include the following:</p> <ul> <li> <p> <code>ChildHealthChecks</code>: Amazon Route 53 resets <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_HealthCheckConfig.html#Route53-Type-HealthCheckConfig-ChildHealthChecks\\\">ChildHealthChecks</a> to null.</p> </li> <li> <p> <code>FullyQualifiedDomainName</code>: Route 53 resets <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-FullyQualifiedDomainName\\\">FullyQualifiedDomainName</a>. to null.</p> </li> <li> <p> <code>Regions</code>: Route 53 resets the <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_HealthCheckConfig.html#Route53-Type-HealthCheckConfig-Regions\\\">Regions</a> list to the default set of regions. </p> </li> <li> <p> <code>ResourcePath</code>: Route 53 resets <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_HealthCheckConfig.html#Route53-Type-HealthCheckConfig-ResourcePath\\\">ResourcePath</a> to null.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about a request to update a health check.</p>\"\
    },\
    \"UpdateHealthCheckResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"HealthCheck\"],\
      \"members\":{\
        \"HealthCheck\":{\
          \"shape\":\"HealthCheck\",\
          \"documentation\":\"<p>A complex type that contains the response to an <code>UpdateHealthCheck</code> request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response to the <code>UpdateHealthCheck</code> request.</p>\"\
    },\
    \"UpdateHostedZoneCommentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID for the hosted zone that you want to update the comment for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        },\
        \"Comment\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The new comment for the hosted zone. If you don't specify a value for <code>Comment</code>, Amazon Route 53 deletes the existing value of the <code>Comment</code> element, if any.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to update the comment for a hosted zone.</p>\"\
    },\
    \"UpdateHostedZoneCommentResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"HostedZone\"],\
      \"members\":{\
        \"HostedZone\":{\
          \"shape\":\"HostedZone\",\
          \"documentation\":\"<p>A complex type that contains the response to the <code>UpdateHostedZoneComment</code> request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response to the <code>UpdateHostedZoneComment</code> request.</p>\"\
    },\
    \"UpdateTrafficPolicyCommentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Id\",\
        \"Version\",\
        \"Comment\"\
      ],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TrafficPolicyId\",\
          \"documentation\":\"<p>The value of <code>Id</code> for the traffic policy that you want to update the comment for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        },\
        \"Version\":{\
          \"shape\":\"TrafficPolicyVersion\",\
          \"documentation\":\"<p>The value of <code>Version</code> for the traffic policy that you want to update the comment for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Version\"\
        },\
        \"Comment\":{\
          \"shape\":\"TrafficPolicyComment\",\
          \"documentation\":\"<p>The new comment for the specified traffic policy and version.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the traffic policy that you want to update the comment for.</p>\"\
    },\
    \"UpdateTrafficPolicyCommentResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrafficPolicy\"],\
      \"members\":{\
        \"TrafficPolicy\":{\
          \"shape\":\"TrafficPolicy\",\
          \"documentation\":\"<p>A complex type that contains settings for the specified traffic policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains the response information for the traffic policy.</p>\"\
    },\
    \"UpdateTrafficPolicyInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Id\",\
        \"TTL\",\
        \"TrafficPolicyId\",\
        \"TrafficPolicyVersion\"\
      ],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TrafficPolicyInstanceId\",\
          \"documentation\":\"<p>The ID of the traffic policy instance that you want to update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        },\
        \"TTL\":{\
          \"shape\":\"TTL\",\
          \"documentation\":\"<p>The TTL that you want Amazon Route 53 to assign to all of the updated resource record sets.</p>\"\
        },\
        \"TrafficPolicyId\":{\
          \"shape\":\"TrafficPolicyId\",\
          \"documentation\":\"<p>The ID of the traffic policy that you want Amazon Route 53 to use to update resource record sets for the specified traffic policy instance.</p>\"\
        },\
        \"TrafficPolicyVersion\":{\
          \"shape\":\"TrafficPolicyVersion\",\
          \"documentation\":\"<p>The version of the traffic policy that you want Amazon Route 53 to use to update resource record sets for the specified traffic policy instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the resource record sets that you want to update based on a specified traffic policy instance.</p>\"\
    },\
    \"UpdateTrafficPolicyInstanceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrafficPolicyInstance\"],\
      \"members\":{\
        \"TrafficPolicyInstance\":{\
          \"shape\":\"TrafficPolicyInstance\",\
          \"documentation\":\"<p>A complex type that contains settings for the updated traffic policy instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about the resource record sets that Amazon Route 53 created based on a specified traffic policy.</p>\"\
    },\
    \"UsageCount\":{\
      \"type\":\"long\",\
      \"min\":0\
    },\
    \"VPC\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VPCRegion\":{\
          \"shape\":\"VPCRegion\",\
          \"documentation\":\"<p>(Private hosted zones only) The region that an Amazon VPC was created in.</p>\"\
        },\
        \"VPCId\":{\"shape\":\"VPCId\"}\
      },\
      \"documentation\":\"<p>(Private hosted zones only) A complex type that contains information about an Amazon VPC.</p>\"\
    },\
    \"VPCAssociationAuthorizationNotFound\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The VPC that you specified is not authorized to be associated with the hosted zone.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"VPCAssociationNotFound\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Descriptive message for the error response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified VPC and hosted zone are not currently associated.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"VPCId\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>(Private hosted zones only) The ID of an Amazon VPC. </p>\",\
      \"max\":1024\
    },\
    \"VPCRegion\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"us-east-1\",\
        \"us-east-2\",\
        \"us-west-1\",\
        \"us-west-2\",\
        \"eu-west-1\",\
        \"eu-west-2\",\
        \"eu-west-3\",\
        \"eu-central-1\",\
        \"ap-east-1\",\
        \"me-south-1\",\
        \"us-gov-west-1\",\
        \"us-gov-east-1\",\
        \"us-iso-east-1\",\
        \"us-isob-east-1\",\
        \"ap-southeast-1\",\
        \"ap-southeast-2\",\
        \"ap-south-1\",\
        \"ap-northeast-1\",\
        \"ap-northeast-2\",\
        \"ap-northeast-3\",\
        \"eu-north-1\",\
        \"sa-east-1\",\
        \"ca-central-1\",\
        \"cn-north-1\",\
        \"af-south-1\",\
        \"eu-south-1\"\
      ],\
      \"max\":64,\
      \"min\":1\
    },\
    \"VPCs\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"VPC\",\
        \"locationName\":\"VPC\"\
      },\
      \"documentation\":\"<p>(Private hosted zones only) A list of <code>VPC</code> elements.</p>\",\
      \"min\":1\
    }\
  },\
  \"documentation\":\"<p>Amazon Route 53 is a highly available and scalable Domain Name System (DNS) web service.</p>\"\
}\
";
}

@end
