//
//  CPAPIManager.h
//  Catchpoint
//
//  Created by Matias on 6/17/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPAPIManager : NSObject

+ (id)requestToken;

+ (id)GET:(NSString *)uri;
+ (id)apiGET:(NSString *)request;

+ (NSString *)apiVersion;
+ (NSString *)apiURL;

@end
