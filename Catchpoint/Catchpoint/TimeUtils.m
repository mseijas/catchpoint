//
//  TimeUtils.m
//  Catchpoint
//
//  Created by Matias on 6/18/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "TimeUtils.h"

@implementation TimeUtils

+ (NSString *)formatFullDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //[formatter setDateFormat:@"yyyy-MM-dd HH:MM:SS"];
    
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterShortStyle;
    
    NSString *formattedDate = [formatter stringFromDate:date];
    
    return formattedDate;
    
}

+ (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //[formatter setDateFormat:@"yyyy-MM-dd HH:MM:SS"];
    
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    
    NSString *formattedDate = [formatter stringFromDate:date];
    
    return formattedDate;
    
}

+ (NSString *)formatTime:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //[formatter setDateFormat:@"yyyy-MM-dd HH:MM:SS"];
    
    formatter.dateStyle = NSDateFormatterNoStyle;
    formatter.timeStyle = NSDateFormatterShortStyle;
    
    NSString *formattedDate = [formatter stringFromDate:date];
    
    return formattedDate;
    
}

+ (NSDate *)utcStringToDate:(NSString *)utcString {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate* date = [dateFormatter dateFromString:[utcString stringByReplacingOccurrencesOfString:@"Z" withString:@"-0000"]];
    
    return date;
}

@end
