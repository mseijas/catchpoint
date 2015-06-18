//
//  TimeUtils.h
//  Catchpoint
//
//  Created by Matias on 6/18/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeUtils : NSObject

+ (NSString *)formatFullDate:(NSDate *)date;
+ (NSString *)formatDate:(NSDate *)date;
+ (NSString *)formatTime:(NSDate *)date;

+ (NSDate *)utcStringToDate:(NSString *)utcString;
@end
