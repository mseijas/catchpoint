//
//  CPToken.m
//  Catchpoint
//
//  Created by Matias on 6/17/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import <AFNetworking.h>

#import "CPToken.h"

@interface CPToken ()

@property (nonatomic, strong, readonly) NSString *token;
@property (nonatomic, readonly) NSUInteger *expiration;

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
        [self generateTokenWithKey:@"" secret:@""];
    }
    
    return self;
}

- (NSString *)generateTokenWithKey:(NSString *)key secret:(NSString *)secret {
    
    self.generatedAt = [NSDate new];
    
    return @"generatedNewTorrent";
}

@end
