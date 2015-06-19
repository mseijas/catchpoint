//
//  CPParser.h
//  Catchpoint
//
//  Created by Matias on 6/19/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SyntheticMetricType) {
    SyntheticMetricDNS = 0,
    SyntheticMetricConnect = 1,
    SyntheticMetricSSL = 2,
    SyntheticMetricSend = 3,
    SyntheticMetricWait = 4,
    SyntheticMetricTimeToFirstByte = 5,
    SyntheticMetricLoad = 6,
    SyntheticMetricResponse = 7,
    SyntheticMetricRedirect = 8,
    SyntheticMetricServerResponse = 9,
    SyntheticMetricFileSize = 10,
    SyntheticMetricDownloadedBytes = 11,
    SyntheticMetricTotalDownloadedBytes = 12,
    SyntheticMetricThroughput = 13,
    SyntheticMetricDOMLoad = 14,
    SyntheticMetricContentLoad = 15,
    SyntheticMetricDocumentComplete = 16,
    SyntheticMetricWebpageResponse = 17,
    SyntheticMetricWireTime = 18,
    SyntheticMetricClientTime = 19,
    SyntheticMetricRenderStart = 20,
    SyntheticMetricTimeToTitle = 21,
    SyntheticMetricWebpageThroughput = 22,
    SyntheticMetricNumConnections = 23,
    SyntheticMetricNumHosts = 24,
    SyntheticMetricNumZones = 25,
    SyntheticMetricNumItemsTotal = 26,
    SyntheticMetricNumRedirect = 27,
    SyntheticMetricNumHtml = 28,
    SyntheticMetricHtmlBytes = 29,
    SyntheticMetricNumImages = 30,
    SyntheticMetricImageBytes = 31,
    SyntheticMetricNumScripts = 32,
    SyntheticMetricScriptBytes = 33,
    SyntheticMetricNumCss = 34,
    SyntheticMetricCssBytes = 35,
    SyntheticMetricNumFlash = 36,
    SyntheticMetricFlashBytes = 37,
    SyntheticMetricNumXml = 38,
    SyntheticMetricXmlBytes = 39,
    SyntheticMetricNumMedia = 40,
    SyntheticMetricMediaBytes = 41,
    SyntheticMetricNumFonts = 42,
    SyntheticMetricFontBytes = 43,
    SyntheticMetricNumOther = 44,
    SyntheticMetricNumOtherBytes = 45,
    SyntheticMetricPctPingPacketLoss = 46,
    SyntheticMetricPingRoundTrip = 47,
    SyntheticMetricPctAvailability = 48,
    SyntheticMetricPctContentAvailability = 49,
    SyntheticMetricApdex = 50,
    SyntheticMetricNumRuns = 51,
    SyntheticMetricPageSpeedScore = 52,
    SyntheticMetricNumJSErrorsPerPage = 53,
    SyntheticMetricNumContentLoadErrors = 54,
    SyntheticMetricNumTestsWithJSErrors = 55,
    SyntheticMetricNumDNSFailures = 56,
    SyntheticMetricNumConnectionFailures = 57,
    SyntheticMetricNumSSLFailures = 58,
    SyntheticMetricNumResponseFailures = 59,
    SyntheticMetricNumTimeoutFailures = 60,
    SyntheticMetricNumTestErrors = 61
};

@interface CPParser : NSObject

+ (NSString *)getTestNameFromSyntheticData:(NSArray *)data;

+ (NSArray *)getMetric:(SyntheticMetricType)metricType fromSyntheticData:(NSArray *)data;
+ (NSArray *)getTimeStampFromSyntheticData:(NSArray *)data;

@end
