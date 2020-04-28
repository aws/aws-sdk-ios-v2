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

#import <Foundation/Foundation.h>

/*!
 Project version number for the AWSkinesisvideo framework.

 @warning This value is deprecated and will be removed in an upcoming minor
 version of the SDK. It conflicts with the umbrella header generated by
 CocoaPods, and is not implemented at all in cases where this SDK is imported
 as a CocoaPod static library. As this numeric value does not support
 patch-level versioning, you should use AWSkinesisvideoSDKVersion instead.
 @deprecated Use AWSkinesisvideoSDKVersion instead.
 */
FOUNDATION_EXPORT double AWSkinesisvideoVersionNumber DEPRECATED_MSG_ATTRIBUTE("Use AWSkinesisvideoSDKVersion instead.");

/*!
 Project version string for the AWSkinesisvideo framework.

 @warning This value is deprecated and will be removed in an upcoming minor
 version of the SDK. It conflicts with the umbrella header generated by
 CocoaPods, and is not implemented at all in cases where this SDK is imported
 as a CocoaPod static library.
 @deprecated Use AWSkinesisvideoSDKVersion instead.
 */
FOUNDATION_EXPORT const unsigned char AWSkinesisvideoVersionString[] DEPRECATED_MSG_ATTRIBUTE("Use AWSkinesisvideoSDKVersion instead.");

#import <AWSCore/AWSCore.h>
#import "AWSkinesisvideoService.h"
