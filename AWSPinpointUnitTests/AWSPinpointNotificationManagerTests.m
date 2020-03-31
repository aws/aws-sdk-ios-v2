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

#import <XCTest/XCTest.h>
#import "AWSPinpoint.h"
#import "AWSPinpointNotificationManager.h"

static NSString *const UserDefaultSuiteNameAWSPinpointNotificationManagerTests = @"AWSPinpointNotificationManagerTests";
static NSString *const AWSAttributeApplicationStateKey = @"applicationState";
static NSString *const AWSAttributeApplicationStateActive = @"UIApplicationStateActive";
static NSString *const AWSAttributeApplicationStateInactive = @"UIApplicationStateInactive";
static NSString *const AWSAttributeApplicationStateBackground = @"UIApplicationStateBackground";
static NSString *const CampaignAttributeKey = @"campaign_id";
static NSString *const JourneyAttributeKey = @"journey_id";
static NSString *const CampaignAttributeValue = @"testCampaignId";
static NSString *const JourneyAttributeValue = @"testJourneyId";
static NSDictionary *CampaignMetadata;
static NSDictionary *JourneyMetadata;
static NSDictionary *CampaignPushPayload;
static NSDictionary *JourneyPushPayload;
static NSDictionary *InvalidPushPayload;

@interface AWSPinpointAnalyticsClient()
@property (nonatomic, strong) NSDictionary* globalFeatureAttributes;
- (void) setFeatureAttributes:(NSDictionary*) attributes;
- (void) removeAllGlobalFeatureAttributes;
@end

@interface AWSPinpointNotificationManager()
- (void)addPinpointMetadataForEvent:(AWSPinpointEvent *) event
                       withMetadata:(NSDictionary *) metadata;
- (void)addGlobalPinpointMetadata:(NSDictionary *) metadata;
- (AWSPinpointEvent*)buildEventFromUserInfo:(NSDictionary *) userInfo
                         withPushActionType:(AWSPinpointPushActionType) pushActionType;
- (AWSPinpointPushActionType) pushActionTypeOfApplicationState:(UIApplicationState) state;
- (NSDictionary*)getMetadataFromUserInfo:(NSDictionary*) userInfo;
@end

@interface AWSPinpointConfiguration()
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end

@interface AWSPinpointNotificationManagerTests : XCTestCase
@property (nonatomic, strong) AWSPinpoint *pinpoint;
@end

@implementation AWSPinpointNotificationManagerTests

- (void)setUp {
    [super setUp];
    // Set up fake AWS service configuration to initialize Pinpoint
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                    identityPoolId:@"fakeIdentityPoolId"
                                                                                                     unauthRoleArn:@"fakeUnauthRoleArn"
                                                                                                       authRoleArn:@"fakeAuthRoleArn"
                                                                                           identityProviderManager:nil];
    AWSServiceConfiguration *awsConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                            credentialsProvider:credentialsProvider];
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = awsConfiguration;

    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:UserDefaultSuiteNameAWSPinpointNotificationManagerTests];

    AWSPinpointConfiguration *configuration = [[AWSPinpointConfiguration alloc] initWithAppId:@"fakeAppId" launchOptions:@{}];
    configuration.userDefaults = [[NSUserDefaults alloc] initWithSuiteName:UserDefaultSuiteNameAWSPinpointNotificationManagerTests];
    configuration.enableAutoSessionRecording = NO;
    self.pinpoint = [AWSPinpoint pinpointWithConfiguration:configuration];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CampaignMetadata = @{
            CampaignAttributeKey: CampaignAttributeValue
        };
        
        JourneyMetadata = @{
            JourneyAttributeKey: JourneyAttributeValue
        };
        
        CampaignPushPayload = @{
            @"data": @{
                @"pinpoint": @{
                    @"campaign": CampaignMetadata
                }
            }
        };

        JourneyPushPayload = @{
            @"data": @{
                @"pinpoint": @{
                    @"journey": JourneyMetadata
                }
            }
        };
        
        InvalidPushPayload = @{
            @"data": @{
                @"pinpoint": @{
                    @"randomKey": @{
                        @"randomAttribute": @"randomValue"
                    }
                }
            }
        };
    });
}

- (void)tearDown {
    [self.pinpoint.analyticsClient.eventRecorder removeAllEvents];
    [self.pinpoint.analyticsClient removeAllGlobalFeatureAttributes];
    [super tearDown];
}

- (void)testAddPinpointMetadataForEventCampaign {
    AWSPinpointEvent *event = [self.pinpoint.notificationManager buildEventFromUserInfo:CampaignPushPayload
                                                                     withPushActionType:AWSPinpointPushActionTypeReceivedForeground];
    [self.pinpoint.notificationManager addPinpointMetadataForEvent:event withMetadata:CampaignMetadata];
    XCTAssertTrue([event.allAttributes[CampaignAttributeKey] isEqualToString:CampaignAttributeValue]);
}

- (void)testAddPinpointMetadataForEventJourney {
    AWSPinpointEvent *event = [self.pinpoint.notificationManager buildEventFromUserInfo:JourneyPushPayload
                                                                     withPushActionType:AWSPinpointPushActionTypeReceivedBackground];
    [self.pinpoint.notificationManager addPinpointMetadataForEvent:event withMetadata:JourneyMetadata];
    XCTAssertTrue([event.allAttributes[JourneyAttributeKey] isEqualToString:JourneyAttributeValue]);
}

- (void)testAddGlobalPinpointMetadataCampaign {
    [self.pinpoint.notificationManager addGlobalPinpointMetadata:CampaignMetadata];
    XCTAssertEqual([self.pinpoint.analyticsClient.globalFeatureAttributes count], 1);
    XCTAssertEqual(self.pinpoint.analyticsClient.globalFeatureAttributes[CampaignAttributeKey], CampaignAttributeValue);
}

- (void)testAddGlobalPinpointMetadataJourney {
    [self.pinpoint.notificationManager addGlobalPinpointMetadata:JourneyMetadata];
    XCTAssertEqual([self.pinpoint.analyticsClient.globalFeatureAttributes count], 1);
    XCTAssertEqual(self.pinpoint.analyticsClient.globalFeatureAttributes[JourneyAttributeKey], JourneyAttributeValue);
}

- (void)testBuildEventCampaignNotificationOpened {
    AWSPinpointEvent *event = [self.pinpoint.notificationManager buildEventFromUserInfo:CampaignPushPayload
                                                                     withPushActionType:AWSPinpointPushActionTypeOpened];
    
    XCTAssertTrue([event.eventType isEqualToString:@"_campaign.opened_notification"]);
}

- (void)testBuildEventCampaignReceivedBackground {
    AWSPinpointEvent *event = [self.pinpoint.notificationManager buildEventFromUserInfo:CampaignPushPayload
                                                                     withPushActionType:AWSPinpointPushActionTypeReceivedBackground];
    
    XCTAssertTrue([event.eventType isEqualToString:@"_campaign.received_background"]);
}

- (void)testBuildEventCampaignReceivedForeground {
    AWSPinpointEvent *event = [self.pinpoint.notificationManager buildEventFromUserInfo:CampaignPushPayload
                                                                     withPushActionType:AWSPinpointPushActionTypeReceivedForeground];
    
    XCTAssertNotNil(event);
    XCTAssertTrue([event.eventType isEqualToString:@"_campaign.received_foreground"]);
    XCTAssertEqual([event.allAttributes count], 1);
    XCTAssertTrue([event.allAttributes[AWSAttributeApplicationStateKey] isEqualToString:AWSAttributeApplicationStateActive]);
}

- (void)testBuildEventJourneyNotificationOpened {
    AWSPinpointEvent *event = [self.pinpoint.notificationManager buildEventFromUserInfo:JourneyPushPayload
                                                                     withPushActionType:AWSPinpointPushActionTypeOpened];
    
    XCTAssertNotNil(event);
    XCTAssertTrue([event.eventType isEqualToString:@"_journey.opened_notification"]);
}

- (void)testBuildEventJourneyReceivedBackground {
    AWSPinpointEvent *event = [self.pinpoint.notificationManager buildEventFromUserInfo:JourneyPushPayload
                                                                     withPushActionType:AWSPinpointPushActionTypeReceivedBackground];
    
    XCTAssertNotNil(event);
    XCTAssertTrue([event.eventType isEqualToString:@"_journey.received_background"]);
}

- (void)testBuildEventJourneyReceivedForeground {
    AWSPinpointEvent *event = [self.pinpoint.notificationManager buildEventFromUserInfo:JourneyPushPayload
                                                                     withPushActionType:AWSPinpointPushActionTypeReceivedForeground];
    
    XCTAssertNotNil(event);
    XCTAssertTrue([event.eventType isEqualToString:@"_journey.received_foreground"]);
    XCTAssertEqual([event.allAttributes count], 1);
    XCTAssertTrue([event.allAttributes[AWSAttributeApplicationStateKey] isEqualToString:AWSAttributeApplicationStateActive]);
}

- (void)testBuildEventInvalidPush {
    AWSPinpointEvent *event = [self.pinpoint.notificationManager buildEventFromUserInfo:InvalidPushPayload
                                                                     withPushActionType:AWSPinpointPushActionTypeReceivedForeground];
    
    XCTAssertNil(event);
}

- (void)testPushActionTypeOfApplicationStateActive {
    AWSPinpointPushActionType pushactionType = [self.pinpoint.notificationManager pushActionTypeOfApplicationState:UIApplicationStateActive];
    XCTAssertEqual(pushactionType, AWSPinpointPushActionTypeReceivedForeground);
}

- (void)testPushActionTypeOfApplicationStateBackground {
    AWSPinpointPushActionType pushactionType = [self.pinpoint.notificationManager pushActionTypeOfApplicationState:UIApplicationStateBackground];
    XCTAssertEqual(pushactionType, AWSPinpointPushActionTypeReceivedBackground);
}

- (void)testPushActionTypeOfApplicationStateInactive {
    AWSPinpointPushActionType pushactionType = [self.pinpoint.notificationManager pushActionTypeOfApplicationState:UIApplicationStateInactive];
    XCTAssertEqual(pushactionType, AWSPinpointPushActionTypeOpened);
}

- (void)testGetMetadataFromUserInfoCampaign {
    NSDictionary *metadata = [self.pinpoint.notificationManager getMetadataFromUserInfo:CampaignPushPayload];
    XCTAssertNotNil(metadata);
    XCTAssertEqual([metadata count], 1);
    XCTAssertTrue([metadata[CampaignAttributeKey] isEqualToString:CampaignAttributeValue]);
}

- (void)testGetMetadataFromUserInfoJourney {
    NSDictionary *metadata = [self.pinpoint.notificationManager getMetadataFromUserInfo:JourneyPushPayload];
    XCTAssertNotNil(metadata);
    XCTAssertEqual([metadata count], 1);
    XCTAssertTrue([metadata[JourneyAttributeKey] isEqualToString:JourneyAttributeValue]);
}

- (void)testGetMetadataFromUserInfoInvalid {
    NSDictionary *metadata = [self.pinpoint.notificationManager getMetadataFromUserInfo:InvalidPushPayload];
    XCTAssertNil(metadata);
}

@end
