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
#import "CPToken.h"


NSString * const clientID = @"RY-b-jQ9lcHWSsq";
NSString * const clientSecret = @"6156945d-25b1-44be-9f0b-8208db62fc45";

@implementation CPAPIManager

+ (id)requestToken {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = @{@"grant_type": @"client_credentialst",
                                 @"client_id": clientID,
                                 @"client_secret": clientSecret};
    
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

+ (id)GET:(NSString *)uri {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = nil;
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:[[CPToken sharedToken] token] forHTTPHeaderField:@"Authorization"];
    
    NSError *error;
    
    NSData *data = [manager syncGET:uri parameters:nil operation:NULL error:&error];
    
    
    if (error) {
        return error;
    }
    if (data) {
        return data;
    }
    
    return nil;
}

@end
