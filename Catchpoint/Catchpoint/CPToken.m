//
//  CPToken.m
//  Catchpoint
//
//  Created by Matias on 6/17/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import <AFNetworking.h>

#import "CPToken.h"
#import "CPAPIManager.h"

@interface CPToken ()

@property (nonatomic, strong) NSString *privateToken;
@property (nonatomic) int privateExpiration;

@property (nonatomic, strong) NSDate *generatedAt;

@end


@implementation CPToken

+ (instancetype)sharedToken
{
    static CPToken *sharedToken = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedToken = [[self alloc] initPrivate];
    });
    
    return sharedToken;
}

- (instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use +[CPToken sharedToken]"];
    
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        [self generateToken];
    }
    
    return self;
}

- (NSString *)token {
    NSLog(@"Accessing token...");

    BOOL isExpired = [self isTokenExpired];
    
    if (isExpired == YES) {
        [self generateToken];
        return self.privateToken;
    }
    
    return self.privateToken;
}

- (void)generateToken {
    NSLog(@"Generating Token...");
    
    self.generatedAt = [NSDate new];
    
    NSDictionary *request = [CPAPIManager requestToken];
    NSString *tokenResponse = request[@"access_token"];
    int tokenExpiration = (int)request[@"expires_in"];
    
    NSLog(@"Token Response: %@", tokenResponse);
    NSLog(@"Token Expireation: %i", tokenExpiration);
    
    NSString *token = [self encodeStringTo64:tokenResponse];
    
    NSLog(@"Generated Token: %@", token);
    
    self.privateExpiration = tokenExpiration;
    self.privateToken = [NSString stringWithFormat:@"Bearer %@", token];
}

- (NSString *)encodeStringTo64:(NSString *)fromString
{
    NSData *plainData = [fromString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String;
    
    base64String = [plainData base64EncodedStringWithOptions:kNilOptions];
    
    return base64String;
}

- (BOOL)isTokenExpired {
    NSDate *now = [NSDate new];
    
    NSTimeInterval timeDifference = [now timeIntervalSinceDate:self.generatedAt];
    int intTimeDifference = (int)timeDifference;
    
    NSLog(@"Time difference = %i", intTimeDifference);
    
    if (intTimeDifference < self.privateExpiration) {
        NSLog(@"Token not expired");
        return NO;
    }
    
    NSLog(@"Token EXPIRED!");
    return YES;
}

@end
