//
//  DataUtils.m
//  Catchpoint
//
//  Created by Matias on 6/18/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "DataUtils.h"

@implementation DataUtils

+ (NSString *)dataToJSON:(NSDictionary *)data {
    
    NSError *error;
    NSData *JSONData = [NSJSONSerialization dataWithJSONObject:data
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if (!JSONData) {
        NSLog(@"Error parsing Dictionary to JSON: %@", error);
    } else {
        NSString *JSONString = [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
        return JSONString;
    }
    
    return nil;
}

@end
