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
#import "CPAPIToken.h"

NSString * const apiVersion = @"1";
NSString * const baseURL = @"https://io.catchpoint.com/ui/api";
NSString * const clientID = @"RY-b-jQ9lcHWSsq";
NSString * const clientSecret = @"6156945d-25b1-44be-9f0b-8208db62fc45";

@implementation CPAPIManager

+ (id)requestToken {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = @{@"grant_type": @"client_credentialst",
                                 @"client_id": clientID,
                                 @"client_secret": clientSecret};
    
    NSError *error;
    
    NSString *requestURI = [NSString stringWithFormat:@"%@/token", baseURL];
    NSData *data = [manager syncPOST:requestURI parameters:parameters operation:NULL error:&error];
    
    
    if (error) {
        return error;
    }
    if (data) {
        return data;
    }
    
    return nil;
}

+ (id)GET:(NSString *)uri {
    
    NSLog(@"Processing GET: %@", uri);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = nil;
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:[CPAPIToken token] forHTTPHeaderField:@"Authorization"];
    
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

+ (id)apiGET:(NSString *)request {
    NSString *requestURI = [NSString stringWithFormat:@"%@%@", [self apiURL], request];
    return [self GET:requestURI];
}

+ (NSString *)apiVersion {
    return apiVersion;
}

+ (NSString *)apiURL {
    NSString *apiURL = [NSString stringWithFormat:@"%@/v%@", baseURL, apiVersion];
    return apiURL;
}

@end
