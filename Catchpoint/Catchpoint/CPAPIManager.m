//
//  CPAPIManager.m
//  Catchpoint
//
//  Created by Matias on 6/17/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import <AFNetworking.h>
#import <AFHTTPRequestOperationManager+Synchronous.h>

#import "CPAPIManager.h"

@interface CPAPIManager()

//@property (nonatomic, strong) NSDictionary *authResponse;

@end

@implementation CPAPIManager

+ (id)requestToken {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = @{@"grant_type": @"client_credentialst",
                                 @"client_id": @"RY-b-jQ9lcHWSsq",
                                 @"client_secret": @"6156945d-25b1-44be-9f0b-8208db62fc45"};
    
    NSError *error;
    NSData *data = [manager syncPOST:@"https://io.catchpoint.com/ui/api/token" parameters:parameters operation:NULL error:&error];
    
    if (error) {
        return error;
    }
    if (data) {
        return data;
    }
    
    return nil;
}


@end
