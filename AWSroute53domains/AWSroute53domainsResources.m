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

#import "AWSroute53domainsResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSroute53domainsResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSroute53domainsResources

+ (instancetype)sharedInstance {
    static AWSroute53domainsResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSroute53domainsResources new];
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
    \"apiVersion\":\"2014-05-15\",\
    \"endpointPrefix\":\"route53domains\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Route 53 Domains\",\
    \"serviceId\":\"Route 53 Domains\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"Route53Domains_v20140515\",\
    \"uid\":\"route53domains-2014-05-15\"\
  },\
  \"operations\":{\
    \"AcceptDomainTransferFromAnotherAwsAccount\":{\
      \"name\":\"AcceptDomainTransferFromAnotherAwsAccount\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AcceptDomainTransferFromAnotherAwsAccountRequest\"},\
      \"output\":{\"shape\":\"AcceptDomainTransferFromAnotherAwsAccountResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"OperationLimitExceeded\"},\
        {\"shape\":\"DomainLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Accepts the transfer of a domain from another AWS account to the current AWS account. You initiate a transfer between AWS accounts using <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html\\\">TransferDomainToAnotherAwsAccount</a>. </p> <p>Use either <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html\\\">ListOperations</a> or <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a> to determine whether the operation succeeded. <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a> provides additional information, for example, <code>Domain Transfer from Aws Account 111122223333 has been cancelled</code>. </p>\"\
    },\
    \"CancelDomainTransferToAnotherAwsAccount\":{\
      \"name\":\"CancelDomainTransferToAnotherAwsAccount\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelDomainTransferToAnotherAwsAccountRequest\"},\
      \"output\":{\"shape\":\"CancelDomainTransferToAnotherAwsAccountResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"OperationLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Cancels the transfer of a domain from the current AWS account to another AWS account. You initiate a transfer between AWS accounts using <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html\\\">TransferDomainToAnotherAwsAccount</a>. </p> <important> <p>You must cancel the transfer before the other AWS account accepts the transfer using <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AcceptDomainTransferFromAnotherAwsAccount.html\\\">AcceptDomainTransferFromAnotherAwsAccount</a>.</p> </important> <p>Use either <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html\\\">ListOperations</a> or <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a> to determine whether the operation succeeded. <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a> provides additional information, for example, <code>Domain Transfer from Aws Account 111122223333 has been cancelled</code>. </p>\"\
    },\
    \"CheckDomainAvailability\":{\
      \"name\":\"CheckDomainAvailability\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CheckDomainAvailabilityRequest\"},\
      \"output\":{\"shape\":\"CheckDomainAvailabilityResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"UnsupportedTLD\"}\
      ],\
      \"documentation\":\"<p>This operation checks the availability of one domain name. Note that if the availability status of a domain is pending, you must submit another request to determine the availability of the domain name.</p>\"\
    },\
    \"CheckDomainTransferability\":{\
      \"name\":\"CheckDomainTransferability\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CheckDomainTransferabilityRequest\"},\
      \"output\":{\"shape\":\"CheckDomainTransferabilityResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"UnsupportedTLD\"}\
      ],\
      \"documentation\":\"<p>Checks whether a domain name can be transferred to Amazon Route 53. </p>\"\
    },\
    \"DeleteTagsForDomain\":{\
      \"name\":\"DeleteTagsForDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteTagsForDomainRequest\"},\
      \"output\":{\"shape\":\"DeleteTagsForDomainResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"OperationLimitExceeded\"},\
        {\"shape\":\"UnsupportedTLD\"}\
      ],\
      \"documentation\":\"<p>This operation deletes the specified tags for a domain.</p> <p>All tag operations are eventually consistent; subsequent operations might not immediately represent all issued operations.</p>\"\
    },\
    \"DisableDomainAutoRenew\":{\
      \"name\":\"DisableDomainAutoRenew\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisableDomainAutoRenewRequest\"},\
      \"output\":{\"shape\":\"DisableDomainAutoRenewResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"UnsupportedTLD\"}\
      ],\
      \"documentation\":\"<p>This operation disables automatic renewal of domain registration for the specified domain.</p>\"\
    },\
    \"DisableDomainTransferLock\":{\
      \"name\":\"DisableDomainTransferLock\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisableDomainTransferLockRequest\"},\
      \"output\":{\"shape\":\"DisableDomainTransferLockResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"DuplicateRequest\"},\
        {\"shape\":\"TLDRulesViolation\"},\
        {\"shape\":\"OperationLimitExceeded\"},\
        {\"shape\":\"UnsupportedTLD\"}\
      ],\
      \"documentation\":\"<p>This operation removes the transfer lock on the domain (specifically the <code>clientTransferProhibited</code> status) to allow domain transfers. We recommend you refrain from performing this action unless you intend to transfer the domain to a different registrar. Successful submission returns an operation ID that you can use to track the progress and completion of the action. If the request is not completed successfully, the domain registrant will be notified by email.</p>\"\
    },\
    \"EnableDomainAutoRenew\":{\
      \"name\":\"EnableDomainAutoRenew\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"EnableDomainAutoRenewRequest\"},\
      \"output\":{\"shape\":\"EnableDomainAutoRenewResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"UnsupportedTLD\"},\
        {\"shape\":\"TLDRulesViolation\"}\
      ],\
      \"documentation\":\"<p>This operation configures Amazon Route 53 to automatically renew the specified domain before the domain registration expires. The cost of renewing your domain registration is billed to your AWS account.</p> <p>The period during which you can renew a domain name varies by TLD. For a list of TLDs and their renewal policies, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html\\\">Domains That You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>. Route 53 requires that you renew before the end of the renewal period so we can complete processing before the deadline.</p>\"\
    },\
    \"EnableDomainTransferLock\":{\
      \"name\":\"EnableDomainTransferLock\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"EnableDomainTransferLockRequest\"},\
      \"output\":{\"shape\":\"EnableDomainTransferLockResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"DuplicateRequest\"},\
        {\"shape\":\"TLDRulesViolation\"},\
        {\"shape\":\"OperationLimitExceeded\"},\
        {\"shape\":\"UnsupportedTLD\"}\
      ],\
      \"documentation\":\"<p>This operation sets the transfer lock on the domain (specifically the <code>clientTransferProhibited</code> status) to prevent domain transfers. Successful submission returns an operation ID that you can use to track the progress and completion of the action. If the request is not completed successfully, the domain registrant will be notified by email.</p>\"\
    },\
    \"GetContactReachabilityStatus\":{\
      \"name\":\"GetContactReachabilityStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetContactReachabilityStatusRequest\"},\
      \"output\":{\"shape\":\"GetContactReachabilityStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"OperationLimitExceeded\"},\
        {\"shape\":\"UnsupportedTLD\"}\
      ],\
      \"documentation\":\"<p>For operations that require confirmation that the email address for the registrant contact is valid, such as registering a new domain, this operation returns information about whether the registrant contact has responded.</p> <p>If you want us to resend the email, use the <code>ResendContactReachabilityEmail</code> operation.</p>\"\
    },\
    \"GetDomainDetail\":{\
      \"name\":\"GetDomainDetail\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDomainDetailRequest\"},\
      \"output\":{\"shape\":\"GetDomainDetailResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"UnsupportedTLD\"}\
      ],\
      \"documentation\":\"<p>This operation returns detailed information about a specified domain that is associated with the current AWS account. Contact information for the domain is also returned as part of the output.</p>\"\
    },\
    \"GetDomainSuggestions\":{\
      \"name\":\"GetDomainSuggestions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDomainSuggestionsRequest\"},\
      \"output\":{\"shape\":\"GetDomainSuggestionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"UnsupportedTLD\"}\
      ],\
      \"documentation\":\"<p>The GetDomainSuggestions operation returns a list of suggested domain names.</p>\"\
    },\
    \"GetOperationDetail\":{\
      \"name\":\"GetOperationDetail\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetOperationDetailRequest\"},\
      \"output\":{\"shape\":\"GetOperationDetailResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>This operation returns the current status of an operation that is not completed.</p>\"\
    },\
    \"ListDomains\":{\
      \"name\":\"ListDomains\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListDomainsRequest\"},\
      \"output\":{\"shape\":\"ListDomainsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>This operation returns all the domain names registered with Amazon Route 53 for the current AWS account.</p>\"\
    },\
    \"ListOperations\":{\
      \"name\":\"ListOperations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListOperationsRequest\"},\
      \"output\":{\"shape\":\"ListOperationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Returns information about all of the operations that return an operation ID and that have ever been performed on domains that were registered by the current account. </p>\"\
    },\
    \"ListTagsForDomain\":{\
      \"name\":\"ListTagsForDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTagsForDomainRequest\"},\
      \"output\":{\"shape\":\"ListTagsForDomainResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"OperationLimitExceeded\"},\
        {\"shape\":\"UnsupportedTLD\"}\
      ],\
      \"documentation\":\"<p>This operation returns all of the tags that are associated with the specified domain.</p> <p>All tag operations are eventually consistent; subsequent operations might not immediately represent all issued operations.</p>\"\
    },\
    \"RegisterDomain\":{\
      \"name\":\"RegisterDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RegisterDomainRequest\"},\
      \"output\":{\"shape\":\"RegisterDomainResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"UnsupportedTLD\"},\
        {\"shape\":\"DuplicateRequest\"},\
        {\"shape\":\"TLDRulesViolation\"},\
        {\"shape\":\"DomainLimitExceeded\"},\
        {\"shape\":\"OperationLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>This operation registers a domain. Domains are registered either by Amazon Registrar (for .com, .net, and .org domains) or by our registrar associate, Gandi (for all other domains). For some top-level domains (TLDs), this operation requires extra parameters.</p> <p>When you register a domain, Amazon Route 53 does the following:</p> <ul> <li> <p>Creates a Route 53 hosted zone that has the same name as the domain. Route 53 assigns four name servers to your hosted zone and automatically updates your domain registration with the names of these name servers.</p> </li> <li> <p>Enables autorenew, so your domain registration will renew automatically each year. We'll notify you in advance of the renewal date so you can choose whether to renew the registration.</p> </li> <li> <p>Optionally enables privacy protection, so WHOIS queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you don't enable privacy protection, WHOIS queries return the information that you entered for the registrant, admin, and tech contacts.</p> </li> <li> <p>If registration is successful, returns an operation ID that you can use to track the progress and completion of the action. If the request is not completed successfully, the domain registrant is notified by email.</p> </li> <li> <p>Charges your AWS account an amount based on the top-level domain. For more information, see <a href=\\\"http://aws.amazon.com/route53/pricing/\\\">Amazon Route 53 Pricing</a>.</p> </li> </ul>\"\
    },\
    \"RejectDomainTransferFromAnotherAwsAccount\":{\
      \"name\":\"RejectDomainTransferFromAnotherAwsAccount\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RejectDomainTransferFromAnotherAwsAccountRequest\"},\
      \"output\":{\"shape\":\"RejectDomainTransferFromAnotherAwsAccountResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"OperationLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Rejects the transfer of a domain from another AWS account to the current AWS account. You initiate a transfer between AWS accounts using <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html\\\">TransferDomainToAnotherAwsAccount</a>. </p> <p>Use either <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html\\\">ListOperations</a> or <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a> to determine whether the operation succeeded. <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a> provides additional information, for example, <code>Domain Transfer from Aws Account 111122223333 has been cancelled</code>. </p>\"\
    },\
    \"RenewDomain\":{\
      \"name\":\"RenewDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RenewDomainRequest\"},\
      \"output\":{\"shape\":\"RenewDomainResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"UnsupportedTLD\"},\
        {\"shape\":\"DuplicateRequest\"},\
        {\"shape\":\"TLDRulesViolation\"},\
        {\"shape\":\"OperationLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>This operation renews a domain for the specified number of years. The cost of renewing your domain is billed to your AWS account.</p> <p>We recommend that you renew your domain several weeks before the expiration date. Some TLD registries delete domains before the expiration date if you haven't renewed far enough in advance. For more information about renewing domain registration, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-renew.html\\\">Renewing Registration for a Domain</a> in the <i>Amazon Route 53 Developer Guide</i>.</p>\"\
    },\
    \"ResendContactReachabilityEmail\":{\
      \"name\":\"ResendContactReachabilityEmail\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ResendContactReachabilityEmailRequest\"},\
      \"output\":{\"shape\":\"ResendContactReachabilityEmailResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"OperationLimitExceeded\"},\
        {\"shape\":\"UnsupportedTLD\"}\
      ],\
      \"documentation\":\"<p>For operations that require confirmation that the email address for the registrant contact is valid, such as registering a new domain, this operation resends the confirmation email to the current email address for the registrant contact.</p>\"\
    },\
    \"RetrieveDomainAuthCode\":{\
      \"name\":\"RetrieveDomainAuthCode\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RetrieveDomainAuthCodeRequest\"},\
      \"output\":{\"shape\":\"RetrieveDomainAuthCodeResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"UnsupportedTLD\"}\
      ],\
      \"documentation\":\"<p>This operation returns the AuthCode for the domain. To transfer a domain to another registrar, you provide this value to the new registrar.</p>\"\
    },\
    \"TransferDomain\":{\
      \"name\":\"TransferDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TransferDomainRequest\"},\
      \"output\":{\"shape\":\"TransferDomainResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"UnsupportedTLD\"},\
        {\"shape\":\"DuplicateRequest\"},\
        {\"shape\":\"TLDRulesViolation\"},\
        {\"shape\":\"DomainLimitExceeded\"},\
        {\"shape\":\"OperationLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Transfers a domain from another registrar to Amazon Route 53. When the transfer is complete, the domain is registered either with Amazon Registrar (for .com, .net, and .org domains) or with our registrar associate, Gandi (for all other TLDs).</p> <p>For more information about transferring domains, see the following topics:</p> <ul> <li> <p>For transfer requirements, a detailed procedure, and information about viewing the status of a domain that you're transferring to Route 53, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-transfer-to-route-53.html\\\">Transferring Registration for a Domain to Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> </li> <li> <p>For information about how to transfer a domain from one AWS account to another, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html\\\">TransferDomainToAnotherAwsAccount</a>. </p> </li> <li> <p>For information about how to transfer a domain to another domain registrar, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-transfer-from-route-53.html\\\">Transferring a Domain from Amazon Route 53 to Another Registrar</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> </li> </ul> <p>If the registrar for your domain is also the DNS service provider for the domain, we highly recommend that you transfer your DNS service to Route 53 or to another DNS service provider before you transfer your registration. Some registrars provide free DNS service when you purchase a domain registration. When you transfer the registration, the previous registrar will not renew your domain registration and could end your DNS service at any time.</p> <important> <p>If the registrar for your domain is also the DNS service provider for the domain and you don't transfer DNS service to another provider, your website, email, and the web applications associated with the domain might become unavailable.</p> </important> <p>If the transfer is successful, this method returns an operation ID that you can use to track the progress and completion of the action. If the transfer doesn't complete successfully, the domain registrant will be notified by email.</p>\"\
    },\
    \"TransferDomainToAnotherAwsAccount\":{\
      \"name\":\"TransferDomainToAnotherAwsAccount\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TransferDomainToAnotherAwsAccountRequest\"},\
      \"output\":{\"shape\":\"TransferDomainToAnotherAwsAccountResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"OperationLimitExceeded\"},\
        {\"shape\":\"DuplicateRequest\"}\
      ],\
      \"documentation\":\"<p>Transfers a domain from the current AWS account to another AWS account. Note the following:</p> <ul> <li> <p>The AWS account that you're transferring the domain to must accept the transfer. If the other account doesn't accept the transfer within 3 days, we cancel the transfer. See <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AcceptDomainTransferFromAnotherAwsAccount.html\\\">AcceptDomainTransferFromAnotherAwsAccount</a>. </p> </li> <li> <p>You can cancel the transfer before the other account accepts it. See <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_CancelDomainTransferToAnotherAwsAccount.html\\\">CancelDomainTransferToAnotherAwsAccount</a>. </p> </li> <li> <p>The other account can reject the transfer. See <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_RejectDomainTransferFromAnotherAwsAccount.html\\\">RejectDomainTransferFromAnotherAwsAccount</a>. </p> </li> </ul> <important> <p>When you transfer a domain from one AWS account to another, Route 53 doesn't transfer the hosted zone that is associated with the domain. DNS resolution isn't affected if the domain and the hosted zone are owned by separate accounts, so transferring the hosted zone is optional. For information about transferring the hosted zone to another AWS account, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/hosted-zones-migrating.html\\\">Migrating a Hosted Zone to a Different AWS Account</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> </important> <p>Use either <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html\\\">ListOperations</a> or <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a> to determine whether the operation succeeded. <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a> provides additional information, for example, <code>Domain Transfer from Aws Account 111122223333 has been cancelled</code>. </p>\"\
    },\
    \"UpdateDomainContact\":{\
      \"name\":\"UpdateDomainContact\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateDomainContactRequest\"},\
      \"output\":{\"shape\":\"UpdateDomainContactResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"DuplicateRequest\"},\
        {\"shape\":\"TLDRulesViolation\"},\
        {\"shape\":\"OperationLimitExceeded\"},\
        {\"shape\":\"UnsupportedTLD\"}\
      ],\
      \"documentation\":\"<p>This operation updates the contact information for a particular domain. You must specify information for at least one contact: registrant, administrator, or technical.</p> <p>If the update is successful, this method returns an operation ID that you can use to track the progress and completion of the action. If the request is not completed successfully, the domain registrant will be notified by email.</p>\"\
    },\
    \"UpdateDomainContactPrivacy\":{\
      \"name\":\"UpdateDomainContactPrivacy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateDomainContactPrivacyRequest\"},\
      \"output\":{\"shape\":\"UpdateDomainContactPrivacyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"DuplicateRequest\"},\
        {\"shape\":\"TLDRulesViolation\"},\
        {\"shape\":\"OperationLimitExceeded\"},\
        {\"shape\":\"UnsupportedTLD\"}\
      ],\
      \"documentation\":\"<p>This operation updates the specified domain contact's privacy setting. When privacy protection is enabled, contact information such as email address is replaced either with contact information for Amazon Registrar (for .com, .net, and .org domains) or with contact information for our registrar associate, Gandi.</p> <p>This operation affects only the contact information for the specified contact type (registrant, administrator, or tech). If the request succeeds, Amazon Route 53 returns an operation ID that you can use with <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a> to track the progress and completion of the action. If the request doesn't complete successfully, the domain registrant will be notified by email.</p> <important> <p>By disabling the privacy service via API, you consent to the publication of the contact information provided for this domain via the public WHOIS database. You certify that you are the registrant of this domain name and have the authority to make this decision. You may withdraw your consent at any time by enabling privacy protection using either <code>UpdateDomainContactPrivacy</code> or the Route 53 console. Enabling privacy protection removes the contact information provided for this domain from the WHOIS database. For more information on our privacy practices, see <a href=\\\"https://aws.amazon.com/privacy/\\\">https://aws.amazon.com/privacy/</a>.</p> </important>\"\
    },\
    \"UpdateDomainNameservers\":{\
      \"name\":\"UpdateDomainNameservers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateDomainNameserversRequest\"},\
      \"output\":{\"shape\":\"UpdateDomainNameserversResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"DuplicateRequest\"},\
        {\"shape\":\"TLDRulesViolation\"},\
        {\"shape\":\"OperationLimitExceeded\"},\
        {\"shape\":\"UnsupportedTLD\"}\
      ],\
      \"documentation\":\"<p>This operation replaces the current set of name servers for the domain with the specified set of name servers. If you use Amazon Route 53 as your DNS service, specify the four name servers in the delegation set for the hosted zone for the domain.</p> <p>If successful, this operation returns an operation ID that you can use to track the progress and completion of the action. If the request is not completed successfully, the domain registrant will be notified by email.</p>\"\
    },\
    \"UpdateTagsForDomain\":{\
      \"name\":\"UpdateTagsForDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateTagsForDomainRequest\"},\
      \"output\":{\"shape\":\"UpdateTagsForDomainResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"},\
        {\"shape\":\"OperationLimitExceeded\"},\
        {\"shape\":\"UnsupportedTLD\"}\
      ],\
      \"documentation\":\"<p>This operation adds or updates tags for a specified domain.</p> <p>All tag operations are eventually consistent; subsequent operations might not immediately represent all issued operations.</p>\"\
    },\
    \"ViewBilling\":{\
      \"name\":\"ViewBilling\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ViewBillingRequest\"},\
      \"output\":{\"shape\":\"ViewBillingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidInput\"}\
      ],\
      \"documentation\":\"<p>Returns all the domain-related billing records for the current AWS account for a specified period</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AcceptDomainTransferFromAnotherAwsAccountRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainName\",\
        \"Password\"\
      ],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that was specified when another AWS account submitted a <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html\\\">TransferDomainToAnotherAwsAccount</a> request. </p>\"\
        },\
        \"Password\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The password that was returned by the <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html\\\">TransferDomainToAnotherAwsAccount</a> request. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The AcceptDomainTransferFromAnotherAwsAccount request includes the following elements.</p>\"\
    },\
    \"AcceptDomainTransferFromAnotherAwsAccountResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"OperationId\",\
          \"documentation\":\"<p>Identifier for tracking the progress of the request. To query the operation status, use <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The AcceptDomainTransferFromAnotherAwsAccount response includes the following element.</p>\"\
    },\
    \"AccountId\":{\
      \"type\":\"string\",\
      \"pattern\":\"^(\\\\d{12})$\"\
    },\
    \"AddressLine\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"BillingRecord\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that the billing record applies to. If the domain name contains characters other than a-z, 0-9, and - (hyphen), such as an internationalized domain name, then this value is in Punycode. For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html\\\">DNS Domain Name Format</a> in the <i>Amazon Route 53 Developer Guide</i>.</p>\"\
        },\
        \"Operation\":{\
          \"shape\":\"OperationType\",\
          \"documentation\":\"<p>The operation that you were charged for.</p>\"\
        },\
        \"InvoiceId\":{\
          \"shape\":\"InvoiceId\",\
          \"documentation\":\"<p>The ID of the invoice that is associated with the billing record.</p>\"\
        },\
        \"BillDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date that the operation was billed, in Unix format.</p>\"\
        },\
        \"Price\":{\
          \"shape\":\"Price\",\
          \"documentation\":\"<p>The price that you were charged for the operation, in US dollars.</p> <p>Example value: 12.0</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information for one billing record.</p>\"\
    },\
    \"BillingRecords\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BillingRecord\"}\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"CancelDomainTransferToAnotherAwsAccountRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainName\"],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain for which you want to cancel the transfer to another AWS account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The CancelDomainTransferToAnotherAwsAccount request includes the following element.</p>\"\
    },\
    \"CancelDomainTransferToAnotherAwsAccountResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"OperationId\",\
          \"documentation\":\"<p>The identifier that <code>TransferDomainToAnotherAwsAccount</code> returned to track the progress of the request. Because the transfer request was canceled, the value is no longer valid, and you can't use <code>GetOperationDetail</code> to query the operation status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The <code>CancelDomainTransferToAnotherAwsAccount</code> response includes the following element.</p>\"\
    },\
    \"CheckDomainAvailabilityRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainName\"],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that you want to get availability for. The top-level domain (TLD), such as .com, must be a TLD that Route 53 supports. For a list of supported TLDs, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html\\\">Domains that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>The domain name can contain only the following characters:</p> <ul> <li> <p>Letters a through z. Domain names are not case sensitive.</p> </li> <li> <p>Numbers 0 through 9.</p> </li> <li> <p>Hyphen (-). You can't specify a hyphen at the beginning or end of a label. </p> </li> <li> <p>Period (.) to separate the labels in the name, such as the <code>.</code> in <code>example.com</code>.</p> </li> </ul> <p>Internationalized domain names are not supported for some top-level domains. To determine whether the TLD that you want to use supports internationalized domain names, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html\\\">Domains that You Can Register with Amazon Route 53</a>. For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html#domain-name-format-idns\\\">Formatting Internationalized Domain Names</a>. </p>\"\
        },\
        \"IdnLangCode\":{\
          \"shape\":\"LangCode\",\
          \"documentation\":\"<p>Reserved for future use.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The CheckDomainAvailability request contains the following elements.</p>\"\
    },\
    \"CheckDomainAvailabilityResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Availability\"],\
      \"members\":{\
        \"Availability\":{\
          \"shape\":\"DomainAvailability\",\
          \"documentation\":\"<p>Whether the domain name is available for registering.</p> <note> <p>You can register only domains designated as <code>AVAILABLE</code>.</p> </note> <p>Valid values:</p> <dl> <dt>AVAILABLE</dt> <dd> <p>The domain name is available.</p> </dd> <dt>AVAILABLE_RESERVED</dt> <dd> <p>The domain name is reserved under specific conditions.</p> </dd> <dt>AVAILABLE_PREORDER</dt> <dd> <p>The domain name is available and can be preordered.</p> </dd> <dt>DONT_KNOW</dt> <dd> <p>The TLD registry didn't reply with a definitive answer about whether the domain name is available. Route 53 can return this response for a variety of reasons, for example, the registry is performing maintenance. Try again later.</p> </dd> <dt>PENDING</dt> <dd> <p>The TLD registry didn't return a response in the expected amount of time. When the response is delayed, it usually takes just a few extra seconds. You can resubmit the request immediately.</p> </dd> <dt>RESERVED</dt> <dd> <p>The domain name has been reserved for another person or organization.</p> </dd> <dt>UNAVAILABLE</dt> <dd> <p>The domain name is not available.</p> </dd> <dt>UNAVAILABLE_PREMIUM</dt> <dd> <p>The domain name is not available.</p> </dd> <dt>UNAVAILABLE_RESTRICTED</dt> <dd> <p>The domain name is forbidden.</p> </dd> </dl>\"\
        }\
      },\
      \"documentation\":\"<p>The CheckDomainAvailability response includes the following elements.</p>\"\
    },\
    \"CheckDomainTransferabilityRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainName\"],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that you want to transfer to Route 53. The top-level domain (TLD), such as .com, must be a TLD that Route 53 supports. For a list of supported TLDs, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html\\\">Domains that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>The domain name can contain only the following characters:</p> <ul> <li> <p>Letters a through z. Domain names are not case sensitive.</p> </li> <li> <p>Numbers 0 through 9.</p> </li> <li> <p>Hyphen (-). You can't specify a hyphen at the beginning or end of a label. </p> </li> <li> <p>Period (.) to separate the labels in the name, such as the <code>.</code> in <code>example.com</code>.</p> </li> </ul>\"\
        },\
        \"AuthCode\":{\
          \"shape\":\"DomainAuthCode\",\
          \"documentation\":\"<p>If the registrar for the top-level domain (TLD) requires an authorization code to transfer the domain, the code that you got from the current registrar for the domain.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The CheckDomainTransferability request contains the following elements.</p>\"\
    },\
    \"CheckDomainTransferabilityResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Transferability\"],\
      \"members\":{\
        \"Transferability\":{\
          \"shape\":\"DomainTransferability\",\
          \"documentation\":\"<p>A complex type that contains information about whether the specified domain can be transferred to Route 53.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The CheckDomainTransferability response includes the following elements.</p>\"\
    },\
    \"City\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"ContactDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FirstName\":{\
          \"shape\":\"ContactName\",\
          \"documentation\":\"<p>First name of contact.</p>\"\
        },\
        \"LastName\":{\
          \"shape\":\"ContactName\",\
          \"documentation\":\"<p>Last name of contact.</p>\"\
        },\
        \"ContactType\":{\
          \"shape\":\"ContactType\",\
          \"documentation\":\"<p>Indicates whether the contact is a person, company, association, or public organization. Note the following:</p> <ul> <li> <p>If you specify a value other than <code>PERSON</code>, you must also specify a value for <code>OrganizationName</code>.</p> </li> <li> <p>For some TLDs, the privacy protection available depends on the value that you specify for <code>Contact Type</code>. For the privacy protection settings for your TLD, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html\\\">Domains that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i> </p> </li> <li> <p>For .es domains, if you specify <code>PERSON</code>, you must specify <code>INDIVIDUAL</code> for the value of <code>ES_LEGAL_FORM</code>.</p> </li> </ul>\"\
        },\
        \"OrganizationName\":{\
          \"shape\":\"ContactName\",\
          \"documentation\":\"<p>Name of the organization for contact types other than <code>PERSON</code>.</p>\"\
        },\
        \"AddressLine1\":{\
          \"shape\":\"AddressLine\",\
          \"documentation\":\"<p>First line of the contact's address.</p>\"\
        },\
        \"AddressLine2\":{\
          \"shape\":\"AddressLine\",\
          \"documentation\":\"<p>Second line of contact's address, if any.</p>\"\
        },\
        \"City\":{\
          \"shape\":\"City\",\
          \"documentation\":\"<p>The city of the contact's address.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"State\",\
          \"documentation\":\"<p>The state or province of the contact's city.</p>\"\
        },\
        \"CountryCode\":{\
          \"shape\":\"CountryCode\",\
          \"documentation\":\"<p>Code for the country of the contact's address.</p>\"\
        },\
        \"ZipCode\":{\
          \"shape\":\"ZipCode\",\
          \"documentation\":\"<p>The zip or postal code of the contact's address.</p>\"\
        },\
        \"PhoneNumber\":{\
          \"shape\":\"ContactNumber\",\
          \"documentation\":\"<p>The phone number of the contact.</p> <p>Constraints: Phone number must be specified in the format \\\"+[country dialing code].[number including any area code&gt;]\\\". For example, a US phone number might appear as <code>\\\"+1.1234567890\\\"</code>.</p>\"\
        },\
        \"Email\":{\
          \"shape\":\"Email\",\
          \"documentation\":\"<p>Email address of the contact.</p>\"\
        },\
        \"Fax\":{\
          \"shape\":\"ContactNumber\",\
          \"documentation\":\"<p>Fax number of the contact.</p> <p>Constraints: Phone number must be specified in the format \\\"+[country dialing code].[number including any area code]\\\". For example, a US phone number might appear as <code>\\\"+1.1234567890\\\"</code>.</p>\"\
        },\
        \"ExtraParams\":{\
          \"shape\":\"ExtraParamList\",\
          \"documentation\":\"<p>A list of name-value pairs for parameters required by certain top-level domains.</p>\"\
        }\
      },\
      \"documentation\":\"<p>ContactDetail includes the following elements.</p>\",\
      \"sensitive\":true\
    },\
    \"ContactName\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"ContactNumber\":{\
      \"type\":\"string\",\
      \"max\":30\
    },\
    \"ContactType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PERSON\",\
        \"COMPANY\",\
        \"ASSOCIATION\",\
        \"PUBLIC_BODY\",\
        \"RESELLER\"\
      ]\
    },\
    \"CountryCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AD\",\
        \"AE\",\
        \"AF\",\
        \"AG\",\
        \"AI\",\
        \"AL\",\
        \"AM\",\
        \"AN\",\
        \"AO\",\
        \"AQ\",\
        \"AR\",\
        \"AS\",\
        \"AT\",\
        \"AU\",\
        \"AW\",\
        \"AZ\",\
        \"BA\",\
        \"BB\",\
        \"BD\",\
        \"BE\",\
        \"BF\",\
        \"BG\",\
        \"BH\",\
        \"BI\",\
        \"BJ\",\
        \"BL\",\
        \"BM\",\
        \"BN\",\
        \"BO\",\
        \"BR\",\
        \"BS\",\
        \"BT\",\
        \"BW\",\
        \"BY\",\
        \"BZ\",\
        \"CA\",\
        \"CC\",\
        \"CD\",\
        \"CF\",\
        \"CG\",\
        \"CH\",\
        \"CI\",\
        \"CK\",\
        \"CL\",\
        \"CM\",\
        \"CN\",\
        \"CO\",\
        \"CR\",\
        \"CU\",\
        \"CV\",\
        \"CX\",\
        \"CY\",\
        \"CZ\",\
        \"DE\",\
        \"DJ\",\
        \"DK\",\
        \"DM\",\
        \"DO\",\
        \"DZ\",\
        \"EC\",\
        \"EE\",\
        \"EG\",\
        \"ER\",\
        \"ES\",\
        \"ET\",\
        \"FI\",\
        \"FJ\",\
        \"FK\",\
        \"FM\",\
        \"FO\",\
        \"FR\",\
        \"GA\",\
        \"GB\",\
        \"GD\",\
        \"GE\",\
        \"GH\",\
        \"GI\",\
        \"GL\",\
        \"GM\",\
        \"GN\",\
        \"GQ\",\
        \"GR\",\
        \"GT\",\
        \"GU\",\
        \"GW\",\
        \"GY\",\
        \"HK\",\
        \"HN\",\
        \"HR\",\
        \"HT\",\
        \"HU\",\
        \"ID\",\
        \"IE\",\
        \"IL\",\
        \"IM\",\
        \"IN\",\
        \"IQ\",\
        \"IR\",\
        \"IS\",\
        \"IT\",\
        \"JM\",\
        \"JO\",\
        \"JP\",\
        \"KE\",\
        \"KG\",\
        \"KH\",\
        \"KI\",\
        \"KM\",\
        \"KN\",\
        \"KP\",\
        \"KR\",\
        \"KW\",\
        \"KY\",\
        \"KZ\",\
        \"LA\",\
        \"LB\",\
        \"LC\",\
        \"LI\",\
        \"LK\",\
        \"LR\",\
        \"LS\",\
        \"LT\",\
        \"LU\",\
        \"LV\",\
        \"LY\",\
        \"MA\",\
        \"MC\",\
        \"MD\",\
        \"ME\",\
        \"MF\",\
        \"MG\",\
        \"MH\",\
        \"MK\",\
        \"ML\",\
        \"MM\",\
        \"MN\",\
        \"MO\",\
        \"MP\",\
        \"MR\",\
        \"MS\",\
        \"MT\",\
        \"MU\",\
        \"MV\",\
        \"MW\",\
        \"MX\",\
        \"MY\",\
        \"MZ\",\
        \"NA\",\
        \"NC\",\
        \"NE\",\
        \"NG\",\
        \"NI\",\
        \"NL\",\
        \"NO\",\
        \"NP\",\
        \"NR\",\
        \"NU\",\
        \"NZ\",\
        \"OM\",\
        \"PA\",\
        \"PE\",\
        \"PF\",\
        \"PG\",\
        \"PH\",\
        \"PK\",\
        \"PL\",\
        \"PM\",\
        \"PN\",\
        \"PR\",\
        \"PT\",\
        \"PW\",\
        \"PY\",\
        \"QA\",\
        \"RO\",\
        \"RS\",\
        \"RU\",\
        \"RW\",\
        \"SA\",\
        \"SB\",\
        \"SC\",\
        \"SD\",\
        \"SE\",\
        \"SG\",\
        \"SH\",\
        \"SI\",\
        \"SK\",\
        \"SL\",\
        \"SM\",\
        \"SN\",\
        \"SO\",\
        \"SR\",\
        \"ST\",\
        \"SV\",\
        \"SY\",\
        \"SZ\",\
        \"TC\",\
        \"TD\",\
        \"TG\",\
        \"TH\",\
        \"TJ\",\
        \"TK\",\
        \"TL\",\
        \"TM\",\
        \"TN\",\
        \"TO\",\
        \"TR\",\
        \"TT\",\
        \"TV\",\
        \"TW\",\
        \"TZ\",\
        \"UA\",\
        \"UG\",\
        \"US\",\
        \"UY\",\
        \"UZ\",\
        \"VA\",\
        \"VC\",\
        \"VE\",\
        \"VG\",\
        \"VI\",\
        \"VN\",\
        \"VU\",\
        \"WF\",\
        \"WS\",\
        \"YE\",\
        \"YT\",\
        \"ZA\",\
        \"ZM\",\
        \"ZW\"\
      ]\
    },\
    \"CurrentExpiryYear\":{\"type\":\"integer\"},\
    \"DNSSec\":{\"type\":\"string\"},\
    \"DeleteTagsForDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainName\",\
        \"TagsToDelete\"\
      ],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The domain for which you want to delete one or more tags.</p>\"\
        },\
        \"TagsToDelete\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>A list of tag keys to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The DeleteTagsForDomainRequest includes the following elements.</p>\"\
    },\
    \"DeleteTagsForDomainResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DisableDomainAutoRenewRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainName\"],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that you want to disable automatic renewal for.</p>\"\
        }\
      }\
    },\
    \"DisableDomainAutoRenewResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DisableDomainTransferLockRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainName\"],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that you want to remove the transfer lock for.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The DisableDomainTransferLock request includes the following element.</p>\"\
    },\
    \"DisableDomainTransferLockResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"OperationId\"],\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"OperationId\",\
          \"documentation\":\"<p>Identifier for tracking the progress of the request. To query the operation status, use <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The DisableDomainTransferLock response includes the following element.</p>\"\
    },\
    \"DomainAuthCode\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"sensitive\":true\
    },\
    \"DomainAvailability\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AVAILABLE\",\
        \"AVAILABLE_RESERVED\",\
        \"AVAILABLE_PREORDER\",\
        \"UNAVAILABLE\",\
        \"UNAVAILABLE_PREMIUM\",\
        \"UNAVAILABLE_RESTRICTED\",\
        \"RESERVED\",\
        \"DONT_KNOW\"\
      ]\
    },\
    \"DomainLimitExceeded\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>The number of domains has exceeded the allowed threshold for the account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The number of domains has exceeded the allowed threshold for the account.</p>\",\
      \"exception\":true\
    },\
    \"DomainName\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"DomainStatus\":{\"type\":\"string\"},\
    \"DomainStatusList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DomainStatus\"}\
    },\
    \"DomainSuggestion\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>A suggested domain name.</p>\"\
        },\
        \"Availability\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Whether the domain name is available for registering.</p> <note> <p>You can register only the domains that are designated as <code>AVAILABLE</code>.</p> </note> <p>Valid values:</p> <dl> <dt>AVAILABLE</dt> <dd> <p>The domain name is available.</p> </dd> <dt>AVAILABLE_RESERVED</dt> <dd> <p>The domain name is reserved under specific conditions.</p> </dd> <dt>AVAILABLE_PREORDER</dt> <dd> <p>The domain name is available and can be preordered.</p> </dd> <dt>DONT_KNOW</dt> <dd> <p>The TLD registry didn't reply with a definitive answer about whether the domain name is available. Route 53 can return this response for a variety of reasons, for example, the registry is performing maintenance. Try again later.</p> </dd> <dt>PENDING</dt> <dd> <p>The TLD registry didn't return a response in the expected amount of time. When the response is delayed, it usually takes just a few extra seconds. You can resubmit the request immediately.</p> </dd> <dt>RESERVED</dt> <dd> <p>The domain name has been reserved for another person or organization.</p> </dd> <dt>UNAVAILABLE</dt> <dd> <p>The domain name is not available.</p> </dd> <dt>UNAVAILABLE_PREMIUM</dt> <dd> <p>The domain name is not available.</p> </dd> <dt>UNAVAILABLE_RESTRICTED</dt> <dd> <p>The domain name is forbidden.</p> </dd> </dl>\"\
        }\
      },\
      \"documentation\":\"<p>Information about one suggested domain name.</p>\"\
    },\
    \"DomainSuggestionsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DomainSuggestion\"}\
    },\
    \"DomainSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainName\"],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that the summary information applies to.</p>\"\
        },\
        \"AutoRenew\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the domain is automatically renewed upon expiration.</p>\"\
        },\
        \"TransferLock\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether a domain is locked from unauthorized transfer to another party.</p>\"\
        },\
        \"Expiry\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Expiration date of the domain in Unix time format and Coordinated Universal Time (UTC).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary information about one domain.</p>\"\
    },\
    \"DomainSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DomainSummary\"}\
    },\
    \"DomainTransferability\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Transferable\":{\"shape\":\"Transferable\"}\
      },\
      \"documentation\":\"<p>A complex type that contains information about whether the specified domain can be transferred to Route 53.</p>\"\
    },\
    \"DuplicateRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>The request is already in progress for the domain.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request is already in progress for the domain.</p>\",\
      \"exception\":true\
    },\
    \"DurationInYears\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":1\
    },\
    \"Email\":{\
      \"type\":\"string\",\
      \"max\":254\
    },\
    \"EnableDomainAutoRenewRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainName\"],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that you want to enable automatic renewal for.</p>\"\
        }\
      }\
    },\
    \"EnableDomainAutoRenewResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"EnableDomainTransferLockRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainName\"],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that you want to set the transfer lock for.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to set the transfer lock for the specified domain.</p>\"\
    },\
    \"EnableDomainTransferLockResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"OperationId\"],\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"OperationId\",\
          \"documentation\":\"<p>Identifier for tracking the progress of the request. To use this ID to query the operation status, use GetOperationDetail.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The EnableDomainTransferLock response includes the following elements.</p>\"\
    },\
    \"ErrorMessage\":{\"type\":\"string\"},\
    \"ExtraParam\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ExtraParamName\",\
          \"documentation\":\"<p>The name of an additional parameter that is required by a top-level domain. Here are the top-level domains that require additional parameters and the names of the parameters that they require:</p> <dl> <dt>.com.au and .net.au</dt> <dd> <ul> <li> <p> <code>AU_ID_NUMBER</code> </p> </li> <li> <p> <code>AU_ID_TYPE</code> </p> <p>Valid values include the following:</p> <ul> <li> <p> <code>ABN</code> (Australian business number)</p> </li> <li> <p> <code>ACN</code> (Australian company number)</p> </li> <li> <p> <code>TM</code> (Trademark number)</p> </li> </ul> </li> </ul> </dd> <dt>.ca</dt> <dd> <ul> <li> <p> <code>BRAND_NUMBER</code> </p> </li> <li> <p> <code>CA_BUSINESS_ENTITY_TYPE</code> </p> <p>Valid values include the following:</p> <ul> <li> <p> <code>BANK</code> (Bank)</p> </li> <li> <p> <code>COMMERCIAL_COMPANY</code> (Commercial company)</p> </li> <li> <p> <code>COMPANY</code> (Company)</p> </li> <li> <p> <code>COOPERATION</code> (Cooperation)</p> </li> <li> <p> <code>COOPERATIVE</code> (Cooperative)</p> </li> <li> <p> <code>COOPRIX</code> (Cooprix)</p> </li> <li> <p> <code>CORP</code> (Corporation)</p> </li> <li> <p> <code>CREDIT_UNION</code> (Credit union)</p> </li> <li> <p> <code>FOMIA</code> (Federation of mutual insurance associations)</p> </li> <li> <p> <code>INC</code> (Incorporated)</p> </li> <li> <p> <code>LTD</code> (Limited)</p> </li> <li> <p> <code>LTEE</code> (LimitÃ©e)</p> </li> <li> <p> <code>LLC</code> (Limited liability corporation)</p> </li> <li> <p> <code>LLP</code> (Limited liability partnership)</p> </li> <li> <p> <code>LTE</code> (Lte.)</p> </li> <li> <p> <code>MBA</code> (Mutual benefit association)</p> </li> <li> <p> <code>MIC</code> (Mutual insurance company)</p> </li> <li> <p> <code>NFP</code> (Not-for-profit corporation)</p> </li> <li> <p> <code>SA</code> (S.A.)</p> </li> <li> <p> <code>SAVINGS_COMPANY</code> (Savings company)</p> </li> <li> <p> <code>SAVINGS_UNION</code> (Savings union)</p> </li> <li> <p> <code>SARL</code> (SociÃ©tÃ© Ã  responsabilitÃ© limitÃ©e)</p> </li> <li> <p> <code>TRUST</code> (Trust)</p> </li> <li> <p> <code>ULC</code> (Unlimited liability corporation)</p> </li> </ul> </li> <li> <p> <code>CA_LEGAL_TYPE</code> </p> <p>When <code>ContactType</code> is <code>PERSON</code>, valid values include the following:</p> <ul> <li> <p> <code>ABO</code> (Aboriginal Peoples indigenous to Canada)</p> </li> <li> <p> <code>CCT</code> (Canadian citizen)</p> </li> <li> <p> <code>LGR</code> (Legal Representative of a Canadian Citizen or Permanent Resident)</p> </li> <li> <p> <code>RES</code> (Permanent resident of Canada)</p> </li> </ul> <p>When <code>ContactType</code> is a value other than <code>PERSON</code>, valid values include the following:</p> <ul> <li> <p> <code>ASS</code> (Canadian unincorporated association)</p> </li> <li> <p> <code>CCO</code> (Canadian corporation)</p> </li> <li> <p> <code>EDU</code> (Canadian educational institution)</p> </li> <li> <p> <code>GOV</code> (Government or government entity in Canada)</p> </li> <li> <p> <code>HOP</code> (Canadian Hospital)</p> </li> <li> <p> <code>INB</code> (Indian Band recognized by the Indian Act of Canada)</p> </li> <li> <p> <code>LAM</code> (Canadian Library, Archive, or Museum)</p> </li> <li> <p> <code>MAJ</code> (Her/His Majesty the Queen/King)</p> </li> <li> <p> <code>OMK</code> (Official mark registered in Canada)</p> </li> <li> <p> <code>PLT</code> (Canadian Political Party)</p> </li> <li> <p> <code>PRT</code> (Partnership Registered in Canada)</p> </li> <li> <p> <code>TDM</code> (Trademark registered in Canada)</p> </li> <li> <p> <code>TRD</code> (Canadian Trade Union)</p> </li> <li> <p> <code>TRS</code> (Trust established in Canada)</p> </li> </ul> </li> </ul> </dd> <dt>.es</dt> <dd> <ul> <li> <p> <code>ES_IDENTIFICATION</code> </p> <p>Specify the applicable value:</p> <ul> <li> <p> <b>For contacts inside Spain:</b> Enter your passport ID.</p> </li> <li> <p> <b>For contacts outside of Spain:</b> Enter the VAT identification number for the company.</p> <note> <p>For .es domains, the value of <code>ContactType</code> must be <code>PERSON</code>.</p> </note> </li> </ul> </li> <li> <p> <code>ES_IDENTIFICATION_TYPE</code> </p> <p>Valid values include the following:</p> <ul> <li> <p> <code>DNI_AND_NIF</code> (For Spanish contacts)</p> </li> <li> <p> <code>NIE</code> (For foreigners with legal residence)</p> </li> <li> <p> <code>OTHER</code> (For contacts outside of Spain)</p> </li> </ul> </li> <li> <p> <code>ES_LEGAL_FORM</code> </p> <p>Valid values include the following:</p> <ul> <li> <p> <code>ASSOCIATION</code> </p> </li> <li> <p> <code>CENTRAL_GOVERNMENT_BODY</code> </p> </li> <li> <p> <code>CIVIL_SOCIETY</code> </p> </li> <li> <p> <code>COMMUNITY_OF_OWNERS</code> </p> </li> <li> <p> <code>COMMUNITY_PROPERTY</code> </p> </li> <li> <p> <code>CONSULATE</code> </p> </li> <li> <p> <code>COOPERATIVE</code> </p> </li> <li> <p> <code>DESIGNATION_OF_ORIGIN_SUPERVISORY_COUNCIL</code> </p> </li> <li> <p> <code>ECONOMIC_INTEREST_GROUP</code> </p> </li> <li> <p> <code>EMBASSY</code> </p> </li> <li> <p> <code>ENTITY_MANAGING_NATURAL_AREAS</code> </p> </li> <li> <p> <code>FARM_PARTNERSHIP</code> </p> </li> <li> <p> <code>FOUNDATION</code> </p> </li> <li> <p> <code>GENERAL_AND_LIMITED_PARTNERSHIP</code> </p> </li> <li> <p> <code>GENERAL_PARTNERSHIP</code> </p> </li> <li> <p> <code>INDIVIDUAL</code> </p> </li> <li> <p> <code>LIMITED_COMPANY</code> </p> </li> <li> <p> <code>LOCAL_AUTHORITY</code> </p> </li> <li> <p> <code>LOCAL_PUBLIC_ENTITY</code> </p> </li> <li> <p> <code>MUTUAL_INSURANCE_COMPANY</code> </p> </li> <li> <p> <code>NATIONAL_PUBLIC_ENTITY</code> </p> </li> <li> <p> <code>ORDER_OR_RELIGIOUS_INSTITUTION</code> </p> </li> <li> <p> <code>OTHERS (Only for contacts outside of Spain)</code> </p> </li> <li> <p> <code>POLITICAL_PARTY</code> </p> </li> <li> <p> <code>PROFESSIONAL_ASSOCIATION</code> </p> </li> <li> <p> <code>PUBLIC_LAW_ASSOCIATION</code> </p> </li> <li> <p> <code>PUBLIC_LIMITED_COMPANY</code> </p> </li> <li> <p> <code>REGIONAL_GOVERNMENT_BODY</code> </p> </li> <li> <p> <code>REGIONAL_PUBLIC_ENTITY</code> </p> </li> <li> <p> <code>SAVINGS_BANK</code> </p> </li> <li> <p> <code>SPANISH_OFFICE</code> </p> </li> <li> <p> <code>SPORTS_ASSOCIATION</code> </p> </li> <li> <p> <code>SPORTS_FEDERATION</code> </p> </li> <li> <p> <code>SPORTS_LIMITED_COMPANY</code> </p> </li> <li> <p> <code>TEMPORARY_ALLIANCE_OF_ENTERPRISES</code> </p> </li> <li> <p> <code>TRADE_UNION</code> </p> </li> <li> <p> <code>WORKER_OWNED_COMPANY</code> </p> </li> <li> <p> <code>WORKER_OWNED_LIMITED_COMPANY</code> </p> </li> </ul> </li> </ul> </dd> <dt>.fi</dt> <dd> <ul> <li> <p> <code>BIRTH_DATE_IN_YYYY_MM_DD</code> </p> </li> <li> <p> <code>FI_BUSINESS_NUMBER</code> </p> </li> <li> <p> <code>FI_ID_NUMBER</code> </p> </li> <li> <p> <code>FI_NATIONALITY</code> </p> <p>Valid values include the following:</p> <ul> <li> <p> <code>FINNISH</code> </p> </li> <li> <p> <code>NOT_FINNISH</code> </p> </li> </ul> </li> <li> <p> <code>FI_ORGANIZATION_TYPE</code> </p> <p>Valid values include the following:</p> <ul> <li> <p> <code>COMPANY</code> </p> </li> <li> <p> <code>CORPORATION</code> </p> </li> <li> <p> <code>GOVERNMENT</code> </p> </li> <li> <p> <code>INSTITUTION</code> </p> </li> <li> <p> <code>POLITICAL_PARTY</code> </p> </li> <li> <p> <code>PUBLIC_COMMUNITY</code> </p> </li> <li> <p> <code>TOWNSHIP</code> </p> </li> </ul> </li> </ul> </dd> <dt>.fr</dt> <dd> <ul> <li> <p> <code>BIRTH_CITY</code> </p> </li> <li> <p> <code>BIRTH_COUNTRY</code> </p> </li> <li> <p> <code>BIRTH_DATE_IN_YYYY_MM_DD</code> </p> </li> <li> <p> <code>BIRTH_DEPARTMENT</code>: Specify the INSEE code that corresponds with the department where the contact was born. If the contact was born somewhere other than France or its overseas departments, specify <code>99</code>. For more information, including a list of departments and the corresponding INSEE numbers, see the Wikipedia entry <a href=\\\"https://en.wikipedia.org/wiki/Departments_of_France\\\">Departments of France</a>.</p> </li> <li> <p> <code>BRAND_NUMBER</code> </p> </li> </ul> </dd> <dt>.it</dt> <dd> <ul> <li> <p> <code>IT_NATIONALITY</code> </p> </li> <li> <p> <code>IT_PIN</code> </p> </li> <li> <p> <code>IT_REGISTRANT_ENTITY_TYPE</code> </p> <p>Valid values include the following:</p> <ul> <li> <p> <code>FOREIGNERS</code> </p> </li> <li> <p> <code>FREELANCE_WORKERS</code> (Freelance workers and professionals)</p> </li> <li> <p> <code>ITALIAN_COMPANIES</code> (Italian companies and one-person companies)</p> </li> <li> <p> <code>NON_PROFIT_ORGANIZATIONS</code> </p> </li> <li> <p> <code>OTHER_SUBJECTS</code> </p> </li> <li> <p> <code>PUBLIC_ORGANIZATIONS</code> </p> </li> </ul> </li> </ul> </dd> <dt>.ru</dt> <dd> <ul> <li> <p> <code>BIRTH_DATE_IN_YYYY_MM_DD</code> </p> </li> <li> <p> <code>RU_PASSPORT_DATA</code> </p> </li> </ul> </dd> <dt>.se</dt> <dd> <ul> <li> <p> <code>BIRTH_COUNTRY</code> </p> </li> <li> <p> <code>SE_ID_NUMBER</code> </p> </li> </ul> </dd> <dt>.sg</dt> <dd> <ul> <li> <p> <code>SG_ID_NUMBER</code> </p> </li> </ul> </dd> <dt>.co.uk, .me.uk, and .org.uk</dt> <dd> <ul> <li> <p> <code>UK_CONTACT_TYPE</code> </p> <p>Valid values include the following:</p> <ul> <li> <p> <code>CRC</code> (UK Corporation by Royal Charter)</p> </li> <li> <p> <code>FCORP</code> (Non-UK Corporation)</p> </li> <li> <p> <code>FIND</code> (Non-UK Individual, representing self)</p> </li> <li> <p> <code>FOTHER</code> (Non-UK Entity that does not fit into any other category)</p> </li> <li> <p> <code>GOV</code> (UK Government Body)</p> </li> <li> <p> <code>IND</code> (UK Individual (representing self))</p> </li> <li> <p> <code>IP</code> (UK Industrial/Provident Registered Company)</p> </li> <li> <p> <code>LLP</code> (UK Limited Liability Partnership)</p> </li> <li> <p> <code>LTD</code> (UK Limited Company)</p> </li> <li> <p> <code>OTHER</code> (UK Entity that does not fit into any other category)</p> </li> <li> <p> <code>PLC</code> (UK Public Limited Company)</p> </li> <li> <p> <code>PTNR</code> (UK Partnership)</p> </li> <li> <p> <code>RCHAR</code> (UK Registered Charity)</p> </li> <li> <p> <code>SCH</code> (UK School)</p> </li> <li> <p> <code>STAT</code> (UK Statutory Body)</p> </li> <li> <p> <code>STRA</code> (UK Sole Trader)</p> </li> </ul> </li> <li> <p> <code>UK_COMPANY_NUMBER</code> </p> </li> </ul> </dd> </dl> <p>In addition, many TLDs require a <code>VAT_NUMBER</code>.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"ExtraParamValue\",\
          \"documentation\":\"<p>The value that corresponds with the name of an extra parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>ExtraParam includes the following elements.</p>\"\
    },\
    \"ExtraParamList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ExtraParam\"}\
    },\
    \"ExtraParamName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DUNS_NUMBER\",\
        \"BRAND_NUMBER\",\
        \"BIRTH_DEPARTMENT\",\
        \"BIRTH_DATE_IN_YYYY_MM_DD\",\
        \"BIRTH_COUNTRY\",\
        \"BIRTH_CITY\",\
        \"DOCUMENT_NUMBER\",\
        \"AU_ID_NUMBER\",\
        \"AU_ID_TYPE\",\
        \"CA_LEGAL_TYPE\",\
        \"CA_BUSINESS_ENTITY_TYPE\",\
        \"CA_LEGAL_REPRESENTATIVE\",\
        \"CA_LEGAL_REPRESENTATIVE_CAPACITY\",\
        \"ES_IDENTIFICATION\",\
        \"ES_IDENTIFICATION_TYPE\",\
        \"ES_LEGAL_FORM\",\
        \"FI_BUSINESS_NUMBER\",\
        \"FI_ID_NUMBER\",\
        \"FI_NATIONALITY\",\
        \"FI_ORGANIZATION_TYPE\",\
        \"IT_NATIONALITY\",\
        \"IT_PIN\",\
        \"IT_REGISTRANT_ENTITY_TYPE\",\
        \"RU_PASSPORT_DATA\",\
        \"SE_ID_NUMBER\",\
        \"SG_ID_NUMBER\",\
        \"VAT_NUMBER\",\
        \"UK_CONTACT_TYPE\",\
        \"UK_COMPANY_NUMBER\"\
      ]\
    },\
    \"ExtraParamValue\":{\
      \"type\":\"string\",\
      \"max\":2048\
    },\
    \"FIAuthKey\":{\"type\":\"string\"},\
    \"GetContactReachabilityStatusRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain for which you want to know whether the registrant contact has confirmed that the email address is valid.</p>\"\
        }\
      }\
    },\
    \"GetContactReachabilityStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The domain name for which you requested the reachability status.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"ReachabilityStatus\",\
          \"documentation\":\"<p>Whether the registrant contact has responded. Values include the following:</p> <dl> <dt>PENDING</dt> <dd> <p>We sent the confirmation email and haven't received a response yet.</p> </dd> <dt>DONE</dt> <dd> <p>We sent the email and got confirmation from the registrant contact.</p> </dd> <dt>EXPIRED</dt> <dd> <p>The time limit expired before the registrant contact responded.</p> </dd> </dl>\"\
        }\
      }\
    },\
    \"GetDomainDetailRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainName\"],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that you want to get detailed information about.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The GetDomainDetail request includes the following element.</p>\"\
    },\
    \"GetDomainDetailResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainName\",\
        \"Nameservers\",\
        \"AdminContact\",\
        \"RegistrantContact\",\
        \"TechContact\"\
      ],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of a domain.</p>\"\
        },\
        \"Nameservers\":{\
          \"shape\":\"NameserverList\",\
          \"documentation\":\"<p>The name of the domain.</p>\"\
        },\
        \"AutoRenew\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether the domain registration is set to renew automatically.</p>\"\
        },\
        \"AdminContact\":{\
          \"shape\":\"ContactDetail\",\
          \"documentation\":\"<p>Provides details about the domain administrative contact.</p>\"\
        },\
        \"RegistrantContact\":{\
          \"shape\":\"ContactDetail\",\
          \"documentation\":\"<p>Provides details about the domain registrant.</p>\"\
        },\
        \"TechContact\":{\
          \"shape\":\"ContactDetail\",\
          \"documentation\":\"<p>Provides details about the domain technical contact.</p>\"\
        },\
        \"AdminPrivacy\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether contact information is concealed from WHOIS queries. If the value is <code>true</code>, WHOIS (\\\"who is\\\") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If the value is <code>false</code>, WHOIS queries return the information that you entered for the admin contact.</p>\"\
        },\
        \"RegistrantPrivacy\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether contact information is concealed from WHOIS queries. If the value is <code>true</code>, WHOIS (\\\"who is\\\") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If the value is <code>false</code>, WHOIS queries return the information that you entered for the registrant contact (domain owner).</p>\"\
        },\
        \"TechPrivacy\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether contact information is concealed from WHOIS queries. If the value is <code>true</code>, WHOIS (\\\"who is\\\") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If the value is <code>false</code>, WHOIS queries return the information that you entered for the technical contact.</p>\"\
        },\
        \"RegistrarName\":{\
          \"shape\":\"RegistrarName\",\
          \"documentation\":\"<p>Name of the registrar of the domain as identified in the registry. Domains with a .com, .net, or .org TLD are registered by Amazon Registrar. All other domains are registered by our registrar associate, Gandi. The value for domains that are registered by Gandi is <code>\\\"GANDI SAS\\\"</code>. </p>\"\
        },\
        \"WhoIsServer\":{\
          \"shape\":\"RegistrarWhoIsServer\",\
          \"documentation\":\"<p>The fully qualified name of the WHOIS server that can answer the WHOIS query for the domain.</p>\"\
        },\
        \"RegistrarUrl\":{\
          \"shape\":\"RegistrarUrl\",\
          \"documentation\":\"<p>Web address of the registrar.</p>\"\
        },\
        \"AbuseContactEmail\":{\
          \"shape\":\"Email\",\
          \"documentation\":\"<p>Email address to contact to report incorrect contact information for a domain, to report that the domain is being used to send spam, to report that someone is cybersquatting on a domain name, or report some other type of abuse.</p>\"\
        },\
        \"AbuseContactPhone\":{\
          \"shape\":\"ContactNumber\",\
          \"documentation\":\"<p>Phone number for reporting abuse.</p>\"\
        },\
        \"RegistryDomainId\":{\
          \"shape\":\"RegistryDomainId\",\
          \"documentation\":\"<p>Reserved for future use.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date when the domain was created as found in the response to a WHOIS query. The date and time is in Unix time format and Coordinated Universal time (UTC).</p>\"\
        },\
        \"UpdatedDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The last updated date of the domain as found in the response to a WHOIS query. The date and time is in Unix time format and Coordinated Universal time (UTC).</p>\"\
        },\
        \"ExpirationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date when the registration for the domain is set to expire. The date and time is in Unix time format and Coordinated Universal time (UTC).</p>\"\
        },\
        \"Reseller\":{\
          \"shape\":\"Reseller\",\
          \"documentation\":\"<p>Reseller of the domain. Domains registered or transferred using Route 53 domains will have <code>\\\"Amazon\\\"</code> as the reseller. </p>\"\
        },\
        \"DnsSec\":{\
          \"shape\":\"DNSSec\",\
          \"documentation\":\"<p>Reserved for future use.</p>\"\
        },\
        \"StatusList\":{\
          \"shape\":\"DomainStatusList\",\
          \"documentation\":\"<p>An array of domain name status codes, also known as Extensible Provisioning Protocol (EPP) status codes.</p> <p>ICANN, the organization that maintains a central database of domain names, has developed a set of domain name status codes that tell you the status of a variety of operations on a domain name, for example, registering a domain name, transferring a domain name to another registrar, renewing the registration for a domain name, and so on. All registrars use this same set of status codes.</p> <p>For a current list of domain name status codes and an explanation of what each code means, go to the <a href=\\\"https://www.icann.org/\\\">ICANN website</a> and search for <code>epp status codes</code>. (Search on the ICANN website; web searches sometimes return an old version of the document.)</p>\"\
        }\
      },\
      \"documentation\":\"<p>The GetDomainDetail response includes the following elements.</p>\"\
    },\
    \"GetDomainSuggestionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainName\",\
        \"SuggestionCount\",\
        \"OnlyAvailable\"\
      ],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>A domain name that you want to use as the basis for a list of possible domain names. The top-level domain (TLD), such as .com, must be a TLD that Route 53 supports. For a list of supported TLDs, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html\\\">Domains that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>The domain name can contain only the following characters:</p> <ul> <li> <p>Letters a through z. Domain names are not case sensitive.</p> </li> <li> <p>Numbers 0 through 9.</p> </li> <li> <p>Hyphen (-). You can't specify a hyphen at the beginning or end of a label. </p> </li> <li> <p>Period (.) to separate the labels in the name, such as the <code>.</code> in <code>example.com</code>.</p> </li> </ul> <p>Internationalized domain names are not supported for some top-level domains. To determine whether the TLD that you want to use supports internationalized domain names, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html\\\">Domains that You Can Register with Amazon Route 53</a>. </p>\"\
        },\
        \"SuggestionCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of suggested domain names that you want Route 53 to return. Specify a value between 1 and 50.</p>\"\
        },\
        \"OnlyAvailable\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If <code>OnlyAvailable</code> is <code>true</code>, Route 53 returns only domain names that are available. If <code>OnlyAvailable</code> is <code>false</code>, Route 53 returns domain names without checking whether they're available to be registered. To determine whether the domain is available, you can call <code>checkDomainAvailability</code> for each suggestion.</p>\"\
        }\
      }\
    },\
    \"GetDomainSuggestionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SuggestionsList\":{\
          \"shape\":\"DomainSuggestionsList\",\
          \"documentation\":\"<p>A list of possible domain names. If you specified <code>true</code> for <code>OnlyAvailable</code> in the request, the list contains only domains that are available for registration.</p>\"\
        }\
      }\
    },\
    \"GetOperationDetailRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"OperationId\"],\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"OperationId\",\
          \"documentation\":\"<p>The identifier for the operation for which you want to get the status. Route 53 returned the identifier in the response to the original request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a> request includes the following element.</p>\"\
    },\
    \"GetOperationDetailResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"OperationId\",\
          \"documentation\":\"<p>The identifier for the operation.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"OperationStatus\",\
          \"documentation\":\"<p>The current status of the requested operation in the system.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Detailed information on the status including possible errors.</p>\"\
        },\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of a domain.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"OperationType\",\
          \"documentation\":\"<p>The type of operation that was requested.</p>\"\
        },\
        \"SubmittedDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date when the request was submitted.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The GetOperationDetail response includes the following elements.</p>\"\
    },\
    \"GlueIp\":{\
      \"type\":\"string\",\
      \"max\":45\
    },\
    \"GlueIpList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"GlueIp\"}\
    },\
    \"HostName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"pattern\":\"[a-zA-Z0-9_\\\\-.]*\"\
    },\
    \"Integer\":{\"type\":\"integer\"},\
    \"InvalidInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>The requested item is not acceptable. For example, for an OperationId it might refer to the ID of an operation that is already completed. For a domain name, it might not be a valid domain name or belong to the requester account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The requested item is not acceptable. For example, for APIs that accept a domain name, the request might specify a domain name that doesn't belong to the account that submitted the request. For <code>AcceptDomainTransferFromAnotherAwsAccount</code>, the password might be invalid.</p>\",\
      \"exception\":true\
    },\
    \"InvoiceId\":{\"type\":\"string\"},\
    \"LangCode\":{\
      \"type\":\"string\",\
      \"max\":3\
    },\
    \"ListDomainsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"PageMarker\",\
          \"documentation\":\"<p>For an initial request for a list of domains, omit this element. If the number of domains that are associated with the current AWS account is greater than the value that you specified for <code>MaxItems</code>, you can use <code>Marker</code> to return additional domains. Get the value of <code>NextPageMarker</code> from the previous response, and submit another request that includes the value of <code>NextPageMarker</code> in the <code>Marker</code> element.</p> <p>Constraints: The marker must match the value specified in the previous request.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>Number of domains to be returned.</p> <p>Default: 20</p>\"\
        }\
      },\
      \"documentation\":\"<p>The ListDomains request includes the following elements.</p>\"\
    },\
    \"ListDomainsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Domains\"],\
      \"members\":{\
        \"Domains\":{\
          \"shape\":\"DomainSummaryList\",\
          \"documentation\":\"<p>A summary of domains.</p>\"\
        },\
        \"NextPageMarker\":{\
          \"shape\":\"PageMarker\",\
          \"documentation\":\"<p>If there are more domains than you specified for <code>MaxItems</code> in the request, submit another request and include the value of <code>NextPageMarker</code> in the value of <code>Marker</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The ListDomains response includes the following elements.</p>\"\
    },\
    \"ListOperationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SubmittedSince\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>An optional parameter that lets you get information about all the operations that you submitted after a specified date and time. Specify the date and time in Unix time format and Coordinated Universal time (UTC).</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"PageMarker\",\
          \"documentation\":\"<p>For an initial request for a list of operations, omit this element. If the number of operations that are not yet complete is greater than the value that you specified for <code>MaxItems</code>, you can use <code>Marker</code> to return additional operations. Get the value of <code>NextPageMarker</code> from the previous response, and submit another request that includes the value of <code>NextPageMarker</code> in the <code>Marker</code> element.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>Number of domains to be returned.</p> <p>Default: 20</p>\"\
        }\
      },\
      \"documentation\":\"<p>The ListOperations request includes the following elements.</p>\"\
    },\
    \"ListOperationsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Operations\"],\
      \"members\":{\
        \"Operations\":{\
          \"shape\":\"OperationSummaryList\",\
          \"documentation\":\"<p>Lists summaries of the operations.</p>\"\
        },\
        \"NextPageMarker\":{\
          \"shape\":\"PageMarker\",\
          \"documentation\":\"<p>If there are more operations than you specified for <code>MaxItems</code> in the request, submit another request and include the value of <code>NextPageMarker</code> in the value of <code>Marker</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The ListOperations response includes the following elements.</p>\"\
    },\
    \"ListTagsForDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainName\"],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The domain for which you want to get a list of tags.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The ListTagsForDomainRequest includes the following elements.</p>\"\
    },\
    \"ListTagsForDomainResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"TagList\"],\
      \"members\":{\
        \"TagList\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of the tags that are associated with the specified domain.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The ListTagsForDomain response includes the following elements.</p>\"\
    },\
    \"Nameserver\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"HostName\",\
          \"documentation\":\"<p>The fully qualified host name of the name server.</p> <p>Constraint: Maximum 255 characters</p>\"\
        },\
        \"GlueIps\":{\
          \"shape\":\"GlueIpList\",\
          \"documentation\":\"<p>Glue IP address of a name server entry. Glue IP addresses are required only when the name of the name server is a subdomain of the domain. For example, if your domain is example.com and the name server for the domain is ns.example.com, you need to specify the IP address for ns.example.com.</p> <p>Constraints: The list can contain only one IPv4 and one IPv6 address.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Nameserver includes the following elements.</p>\"\
    },\
    \"NameserverList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Nameserver\"}\
    },\
    \"OperationId\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"OperationLimitExceeded\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>The number of operations or jobs running exceeded the allowed threshold for the account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The number of operations or jobs running exceeded the allowed threshold for the account.</p>\",\
      \"exception\":true\
    },\
    \"OperationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SUBMITTED\",\
        \"IN_PROGRESS\",\
        \"ERROR\",\
        \"SUCCESSFUL\",\
        \"FAILED\"\
      ]\
    },\
    \"OperationSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"OperationId\",\
        \"Status\",\
        \"Type\",\
        \"SubmittedDate\"\
      ],\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"OperationId\",\
          \"documentation\":\"<p>Identifier returned to track the requested action.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"OperationStatus\",\
          \"documentation\":\"<p>The current status of the requested operation in the system.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"OperationType\",\
          \"documentation\":\"<p>Type of the action requested.</p>\"\
        },\
        \"SubmittedDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date when the request was submitted.</p>\"\
        }\
      },\
      \"documentation\":\"<p>OperationSummary includes the following elements.</p>\"\
    },\
    \"OperationSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"OperationSummary\"}\
    },\
    \"OperationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"REGISTER_DOMAIN\",\
        \"DELETE_DOMAIN\",\
        \"TRANSFER_IN_DOMAIN\",\
        \"UPDATE_DOMAIN_CONTACT\",\
        \"UPDATE_NAMESERVER\",\
        \"CHANGE_PRIVACY_PROTECTION\",\
        \"DOMAIN_LOCK\",\
        \"ENABLE_AUTORENEW\",\
        \"DISABLE_AUTORENEW\",\
        \"ADD_DNSSEC\",\
        \"REMOVE_DNSSEC\",\
        \"EXPIRE_DOMAIN\",\
        \"TRANSFER_OUT_DOMAIN\",\
        \"CHANGE_DOMAIN_OWNER\",\
        \"RENEW_DOMAIN\",\
        \"PUSH_DOMAIN\",\
        \"INTERNAL_TRANSFER_OUT_DOMAIN\",\
        \"INTERNAL_TRANSFER_IN_DOMAIN\"\
      ]\
    },\
    \"PageMarker\":{\
      \"type\":\"string\",\
      \"max\":4096\
    },\
    \"PageMaxItems\":{\
      \"type\":\"integer\",\
      \"max\":100\
    },\
    \"Price\":{\"type\":\"double\"},\
    \"ReachabilityStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"DONE\",\
        \"EXPIRED\"\
      ]\
    },\
    \"RegisterDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainName\",\
        \"DurationInYears\",\
        \"AdminContact\",\
        \"RegistrantContact\",\
        \"TechContact\"\
      ],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The domain name that you want to register. The top-level domain (TLD), such as .com, must be a TLD that Route 53 supports. For a list of supported TLDs, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html\\\">Domains that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>The domain name can contain only the following characters:</p> <ul> <li> <p>Letters a through z. Domain names are not case sensitive.</p> </li> <li> <p>Numbers 0 through 9.</p> </li> <li> <p>Hyphen (-). You can't specify a hyphen at the beginning or end of a label. </p> </li> <li> <p>Period (.) to separate the labels in the name, such as the <code>.</code> in <code>example.com</code>.</p> </li> </ul> <p>Internationalized domain names are not supported for some top-level domains. To determine whether the TLD that you want to use supports internationalized domain names, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html\\\">Domains that You Can Register with Amazon Route 53</a>. For more information, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html#domain-name-format-idns\\\">Formatting Internationalized Domain Names</a>. </p>\"\
        },\
        \"IdnLangCode\":{\
          \"shape\":\"LangCode\",\
          \"documentation\":\"<p>Reserved for future use.</p>\"\
        },\
        \"DurationInYears\":{\
          \"shape\":\"DurationInYears\",\
          \"documentation\":\"<p>The number of years that you want to register the domain for. Domains are registered for a minimum of one year. The maximum period depends on the top-level domain. For the range of valid values for your domain, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html\\\">Domains that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>Default: 1</p>\"\
        },\
        \"AutoRenew\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the domain will be automatically renewed (<code>true</code>) or not (<code>false</code>). Autorenewal only takes effect after the account is charged.</p> <p>Default: <code>true</code> </p>\"\
        },\
        \"AdminContact\":{\
          \"shape\":\"ContactDetail\",\
          \"documentation\":\"<p>Provides detailed contact information. For information about the values that you specify for each element, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ContactDetail.html\\\">ContactDetail</a>.</p>\"\
        },\
        \"RegistrantContact\":{\
          \"shape\":\"ContactDetail\",\
          \"documentation\":\"<p>Provides detailed contact information. For information about the values that you specify for each element, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ContactDetail.html\\\">ContactDetail</a>.</p>\"\
        },\
        \"TechContact\":{\
          \"shape\":\"ContactDetail\",\
          \"documentation\":\"<p>Provides detailed contact information. For information about the values that you specify for each element, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ContactDetail.html\\\">ContactDetail</a>.</p>\"\
        },\
        \"PrivacyProtectAdminContact\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS (\\\"who is\\\") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the admin contact.</p> <p>Default: <code>true</code> </p>\"\
        },\
        \"PrivacyProtectRegistrantContact\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS (\\\"who is\\\") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the registrant contact (the domain owner).</p> <p>Default: <code>true</code> </p>\"\
        },\
        \"PrivacyProtectTechContact\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS (\\\"who is\\\") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the technical contact.</p> <p>Default: <code>true</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>The RegisterDomain request includes the following elements.</p>\"\
    },\
    \"RegisterDomainResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"OperationId\"],\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"OperationId\",\
          \"documentation\":\"<p>Identifier for tracking the progress of the request. To query the operation status, use <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The RegisterDomain response includes the following element.</p>\"\
    },\
    \"RegistrarName\":{\"type\":\"string\"},\
    \"RegistrarUrl\":{\"type\":\"string\"},\
    \"RegistrarWhoIsServer\":{\"type\":\"string\"},\
    \"RegistryDomainId\":{\"type\":\"string\"},\
    \"RejectDomainTransferFromAnotherAwsAccountRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainName\"],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that was specified when another AWS account submitted a <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html\\\">TransferDomainToAnotherAwsAccount</a> request. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The RejectDomainTransferFromAnotherAwsAccount request includes the following element.</p>\"\
    },\
    \"RejectDomainTransferFromAnotherAwsAccountResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"OperationId\",\
          \"documentation\":\"<p>The identifier that <code>TransferDomainToAnotherAwsAccount</code> returned to track the progress of the request. Because the transfer request was rejected, the value is no longer valid, and you can't use <code>GetOperationDetail</code> to query the operation status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The RejectDomainTransferFromAnotherAwsAccount response includes the following element.</p>\"\
    },\
    \"RenewDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainName\",\
        \"CurrentExpiryYear\"\
      ],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that you want to renew.</p>\"\
        },\
        \"DurationInYears\":{\
          \"shape\":\"DurationInYears\",\
          \"documentation\":\"<p>The number of years that you want to renew the domain for. The maximum number of years depends on the top-level domain. For the range of valid values for your domain, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html\\\">Domains that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>Default: 1</p>\"\
        },\
        \"CurrentExpiryYear\":{\
          \"shape\":\"CurrentExpiryYear\",\
          \"documentation\":\"<p>The year when the registration for the domain is set to expire. This value must match the current expiration date for the domain.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A <code>RenewDomain</code> request includes the number of years that you want to renew for and the current expiration year.</p>\"\
    },\
    \"RenewDomainResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"OperationId\"],\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"OperationId\",\
          \"documentation\":\"<p>Identifier for tracking the progress of the request. To query the operation status, use <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a>.</p>\"\
        }\
      }\
    },\
    \"Reseller\":{\"type\":\"string\"},\
    \"ResendContactReachabilityEmailRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain for which you want Route 53 to resend a confirmation email to the registrant contact.</p>\"\
        }\
      }\
    },\
    \"ResendContactReachabilityEmailResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"domainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The domain name for which you requested a confirmation email.</p>\"\
        },\
        \"emailAddress\":{\
          \"shape\":\"Email\",\
          \"documentation\":\"<p>The email address for the registrant contact at the time that we sent the verification email.</p>\"\
        },\
        \"isAlreadyVerified\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p> <code>True</code> if the email address for the registrant contact has already been verified, and <code>false</code> otherwise. If the email address has already been verified, we don't send another confirmation email.</p>\"\
        }\
      }\
    },\
    \"RetrieveDomainAuthCodeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainName\"],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that you want to get an authorization code for.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request for the authorization code for the specified domain. To transfer a domain to another registrar, you provide this value to the new registrar.</p>\"\
    },\
    \"RetrieveDomainAuthCodeResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"AuthCode\"],\
      \"members\":{\
        \"AuthCode\":{\
          \"shape\":\"DomainAuthCode\",\
          \"documentation\":\"<p>The authorization code for the domain.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The RetrieveDomainAuthCode response includes the following element.</p>\"\
    },\
    \"State\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"String\":{\"type\":\"string\"},\
    \"TLDRulesViolation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>The top-level domain does not support this operation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The top-level domain does not support this operation.</p>\",\
      \"exception\":true\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The key (name) of a tag.</p> <p>Valid values: A-Z, a-z, 0-9, space, \\\".:/=+\\\\-@\\\"</p> <p>Constraints: Each key can be 1-128 characters long.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The value of a tag.</p> <p>Valid values: A-Z, a-z, 0-9, space, \\\".:/=+\\\\-@\\\"</p> <p>Constraints: Each value can be 0-256 characters long.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Each tag includes the following elements.</p>\"\
    },\
    \"TagKey\":{\"type\":\"string\"},\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"}\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"}\
    },\
    \"TagValue\":{\"type\":\"string\"},\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"TransferDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainName\",\
        \"DurationInYears\",\
        \"AdminContact\",\
        \"RegistrantContact\",\
        \"TechContact\"\
      ],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that you want to transfer to Route 53. The top-level domain (TLD), such as .com, must be a TLD that Route 53 supports. For a list of supported TLDs, see <a href=\\\"https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html\\\">Domains that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>.</p> <p>The domain name can contain only the following characters:</p> <ul> <li> <p>Letters a through z. Domain names are not case sensitive.</p> </li> <li> <p>Numbers 0 through 9.</p> </li> <li> <p>Hyphen (-). You can't specify a hyphen at the beginning or end of a label. </p> </li> <li> <p>Period (.) to separate the labels in the name, such as the <code>.</code> in <code>example.com</code>.</p> </li> </ul>\"\
        },\
        \"IdnLangCode\":{\
          \"shape\":\"LangCode\",\
          \"documentation\":\"<p>Reserved for future use.</p>\"\
        },\
        \"DurationInYears\":{\
          \"shape\":\"DurationInYears\",\
          \"documentation\":\"<p>The number of years that you want to register the domain for. Domains are registered for a minimum of one year. The maximum period depends on the top-level domain.</p> <p>Default: 1</p>\"\
        },\
        \"Nameservers\":{\
          \"shape\":\"NameserverList\",\
          \"documentation\":\"<p>Contains details for the host and glue IP addresses.</p>\"\
        },\
        \"AuthCode\":{\
          \"shape\":\"DomainAuthCode\",\
          \"documentation\":\"<p>The authorization code for the domain. You get this value from the current registrar.</p>\"\
        },\
        \"AutoRenew\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the domain will be automatically renewed (true) or not (false). Autorenewal only takes effect after the account is charged.</p> <p>Default: true</p>\"\
        },\
        \"AdminContact\":{\
          \"shape\":\"ContactDetail\",\
          \"documentation\":\"<p>Provides detailed contact information.</p>\"\
        },\
        \"RegistrantContact\":{\
          \"shape\":\"ContactDetail\",\
          \"documentation\":\"<p>Provides detailed contact information.</p>\"\
        },\
        \"TechContact\":{\
          \"shape\":\"ContactDetail\",\
          \"documentation\":\"<p>Provides detailed contact information.</p>\"\
        },\
        \"PrivacyProtectAdminContact\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS (\\\"who is\\\") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the admin contact.</p> <p>Default: <code>true</code> </p>\"\
        },\
        \"PrivacyProtectRegistrantContact\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS (\\\"who is\\\") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the registrant contact (domain owner).</p> <p>Default: <code>true</code> </p>\"\
        },\
        \"PrivacyProtectTechContact\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS (\\\"who is\\\") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the technical contact.</p> <p>Default: <code>true</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>The TransferDomain request includes the following elements.</p>\"\
    },\
    \"TransferDomainResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"OperationId\"],\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"OperationId\",\
          \"documentation\":\"<p>Identifier for tracking the progress of the request. To query the operation status, use <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The TransferDomain response includes the following element.</p>\"\
    },\
    \"TransferDomainToAnotherAwsAccountRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainName\",\
        \"AccountId\"\
      ],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that you want to transfer from the current AWS account to another account.</p>\"\
        },\
        \"AccountId\":{\
          \"shape\":\"AccountId\",\
          \"documentation\":\"<p>The account ID of the AWS account that you want to transfer the domain to, for example, <code>111122223333</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The TransferDomainToAnotherAwsAccount request includes the following elements.</p>\"\
    },\
    \"TransferDomainToAnotherAwsAccountResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"OperationId\",\
          \"documentation\":\"<p>Identifier for tracking the progress of the request. To query the operation status, use <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a>.</p>\"\
        },\
        \"Password\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>To finish transferring a domain to another AWS account, the account that the domain is being transferred to must submit an <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AcceptDomainTransferFromAnotherAwsAccount.html\\\">AcceptDomainTransferFromAnotherAwsAccount</a> request. The request must include the value of the <code>Password</code> element that was returned in the <code>TransferDomainToAnotherAwsAccount</code> response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The <code>TransferDomainToAnotherAwsAccount</code> response includes the following elements.</p>\"\
    },\
    \"Transferable\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>Whether the domain name can be transferred to Route 53.</p> <note> <p>You can transfer only domains that have a value of <code>TRANSFERABLE</code> for <code>Transferable</code>.</p> </note> <p>Valid values:</p> <dl> <dt>TRANSFERABLE</dt> <dd> <p>The domain name can be transferred to Route 53.</p> </dd> <dt>UNTRANSFERRABLE</dt> <dd> <p>The domain name can't be transferred to Route 53.</p> </dd> <dt>DONT_KNOW</dt> <dd> <p>Reserved for future use.</p> </dd> </dl>\",\
      \"enum\":[\
        \"TRANSFERABLE\",\
        \"UNTRANSFERABLE\",\
        \"DONT_KNOW\"\
      ]\
    },\
    \"UnsupportedTLD\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p>Amazon Route 53 does not support this top-level domain (TLD).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Amazon Route 53 does not support this top-level domain (TLD).</p>\",\
      \"exception\":true\
    },\
    \"UpdateDomainContactPrivacyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainName\"],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that you want to update the privacy setting for.</p>\"\
        },\
        \"AdminPrivacy\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS (\\\"who is\\\") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the admin contact.</p>\"\
        },\
        \"RegistrantPrivacy\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS (\\\"who is\\\") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the registrant contact (domain owner).</p>\"\
        },\
        \"TechPrivacy\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS (\\\"who is\\\") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the technical contact.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The UpdateDomainContactPrivacy request includes the following elements.</p>\"\
    },\
    \"UpdateDomainContactPrivacyResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"OperationId\"],\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"OperationId\",\
          \"documentation\":\"<p>Identifier for tracking the progress of the request. To use this ID to query the operation status, use GetOperationDetail.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The UpdateDomainContactPrivacy response includes the following element.</p>\"\
    },\
    \"UpdateDomainContactRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainName\"],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that you want to update contact information for.</p>\"\
        },\
        \"AdminContact\":{\
          \"shape\":\"ContactDetail\",\
          \"documentation\":\"<p>Provides detailed contact information.</p>\"\
        },\
        \"RegistrantContact\":{\
          \"shape\":\"ContactDetail\",\
          \"documentation\":\"<p>Provides detailed contact information.</p>\"\
        },\
        \"TechContact\":{\
          \"shape\":\"ContactDetail\",\
          \"documentation\":\"<p>Provides detailed contact information.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The UpdateDomainContact request includes the following elements.</p>\"\
    },\
    \"UpdateDomainContactResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"OperationId\"],\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"OperationId\",\
          \"documentation\":\"<p>Identifier for tracking the progress of the request. To query the operation status, use <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The UpdateDomainContact response includes the following element.</p>\"\
    },\
    \"UpdateDomainNameserversRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainName\",\
        \"Nameservers\"\
      ],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The name of the domain that you want to change name servers for.</p>\"\
        },\
        \"FIAuthKey\":{\
          \"shape\":\"FIAuthKey\",\
          \"documentation\":\"<p>The authorization key for .fi domains</p>\",\
          \"deprecated\":true\
        },\
        \"Nameservers\":{\
          \"shape\":\"NameserverList\",\
          \"documentation\":\"<p>A list of new name servers for the domain.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Replaces the current set of name servers for the domain with the specified set of name servers. If you use Amazon Route 53 as your DNS service, specify the four name servers in the delegation set for the hosted zone for the domain.</p> <p>If successful, this operation returns an operation ID that you can use to track the progress and completion of the action. If the request is not completed successfully, the domain registrant will be notified by email. </p>\"\
    },\
    \"UpdateDomainNameserversResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"OperationId\"],\
      \"members\":{\
        \"OperationId\":{\
          \"shape\":\"OperationId\",\
          \"documentation\":\"<p>Identifier for tracking the progress of the request. To query the operation status, use <a href=\\\"https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html\\\">GetOperationDetail</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The UpdateDomainNameservers response includes the following element.</p>\"\
    },\
    \"UpdateTagsForDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainName\"],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The domain for which you want to add or update tags.</p>\"\
        },\
        \"TagsToUpdate\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of the tag keys and values that you want to add or update. If you specify a key that already exists, the corresponding value will be replaced.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The UpdateTagsForDomainRequest includes the following elements.</p>\"\
    },\
    \"UpdateTagsForDomainResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"ViewBillingRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Start\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The beginning date and time for the time period for which you want a list of billing records. Specify the date and time in Unix time format and Coordinated Universal time (UTC).</p>\"\
        },\
        \"End\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end date and time for the time period for which you want a list of billing records. Specify the date and time in Unix time format and Coordinated Universal time (UTC).</p>\"\
        },\
        \"Marker\":{\
          \"shape\":\"PageMarker\",\
          \"documentation\":\"<p>For an initial request for a list of billing records, omit this element. If the number of billing records that are associated with the current AWS account during the specified period is greater than the value that you specified for <code>MaxItems</code>, you can use <code>Marker</code> to return additional billing records. Get the value of <code>NextPageMarker</code> from the previous response, and submit another request that includes the value of <code>NextPageMarker</code> in the <code>Marker</code> element. </p> <p>Constraints: The marker must match the value of <code>NextPageMarker</code> that was returned in the previous response.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"PageMaxItems\",\
          \"documentation\":\"<p>The number of billing records to be returned.</p> <p>Default: 20</p>\"\
        }\
      },\
      \"documentation\":\"<p>The ViewBilling request includes the following elements.</p>\"\
    },\
    \"ViewBillingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextPageMarker\":{\
          \"shape\":\"PageMarker\",\
          \"documentation\":\"<p>If there are more billing records than you specified for <code>MaxItems</code> in the request, submit another request and include the value of <code>NextPageMarker</code> in the value of <code>Marker</code>.</p>\"\
        },\
        \"BillingRecords\":{\
          \"shape\":\"BillingRecords\",\
          \"documentation\":\"<p>A summary of billing records.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The ViewBilling response includes the following elements.</p>\"\
    },\
    \"ZipCode\":{\
      \"type\":\"string\",\
      \"max\":255\
    }\
  },\
  \"documentation\":\"<p>Amazon Route 53 API actions let you register domain names and perform related operations.</p>\"\
}\
";
}

@end
