//
//  CPSyntheticMetrics.m
//  Catchpoint
//
//  Created by Matias on 6/19/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPSyntheticMetrics.h"

#define metricColorBlack        [UIColor colorWithRed:0.0/255.0   green:0.0/255.0  blue:0.0/255.0    alpha:1.0]
#define metricColorBlue         [UIColor colorWithRed:3.0/255.0   green:83.0/255.0  blue:163.0/255.0 alpha:1.0]
#define metricColorGreen        [UIColor colorWithRed:6.0/255.0   green:159.0/255.0 blue:9.0/255.0   alpha:1.0]
#define metricColorRed          [UIColor colorWithRed:218.0/255.0 green:23.0/255.0  blue:13.0/255.0  alpha:1.0]
#define metricColorViolet       [UIColor colorWithRed:157.0/255.0 green:1.0/255.0   blue:157.0/255.0 alpha:1.0]
#define metricColorOrange       [UIColor colorWithRed:240.0/255.0 green:131.0/255.0 blue:2.0/255.0   alpha:1.0]
#define metricColorYellow       [UIColor colorWithRed:241.0/255.0 green:209.0/255.0 blue:0.0/255.0   alpha:1.0]
#define metricColorBrown        [UIColor colorWithRed:165.0/255.0 green:81.0/255.0  blue:3.0/255.0   alpha:1.0]
#define metricColorPink         [UIColor colorWithRed:231.0/255.0 green:11.0/255.0  blue:121.0/255.0 alpha:1.0]
#define metricColorTeal         [UIColor colorWithRed:1.0/255.0   green:157.0/255.0 blue:157.0/255.0 alpha:1.0]
#define metricColorOlive        [UIColor colorWithRed:135.0/255.0 green:136.0/255.0 blue:3.0/255.0   alpha:1.0]
#define metricColorPurpleBlue   [UIColor colorWithRed:135.0/255.0 green:76.0/255.0  blue:129.0/255.0 alpha:1.0]
#define metricColorDarkTealBlue [UIColor colorWithRed:52.0/255.0  green:99.0/255.0  blue:115.0/255.0 alpha:1.0]
#define metricColorGrayBrown    [UIColor colorWithRed:80.0/255.0  green:57.0/255.0  blue:46.0/255.0  alpha:1.0]
#define metricColorDarkGreen    [UIColor colorWithRed:56.0/255.0  green:121.0/255.0 blue:94.0/255.0  alpha:1.0]
#define metricColorRedBrown     [UIColor colorWithRed:161.0/255.0 green:54.0/255.0  blue:54.0/255.0  alpha:1.0]
#define metricColorSaphireBlue  [UIColor colorWithRed:39.0/255.0  green:168.0/255.0 blue:211.0/255.0 alpha:1.0]
#define metricColorRuby         [UIColor colorWithRed:136.0/255.0 green:3.0/255.0   blue:84.0/255.0  alpha:1.0]
#define metricColorDecafe       [UIColor colorWithRed:135.0/255.0 green:93.0/255.0  blue:89.0/255.0  alpha:1.0]
#define metricColorPurpleVelvet [UIColor colorWithRed:63.0/255.0  green:15.0/255.0  blue:218.0/255.0 alpha:1.0]
#define metricColorApple        [UIColor colorWithRed:186.0/255.0 green:237.0/255.0 blue:50.0/255.0  alpha:1.0]




@implementation CPSyntheticMetrics

+ (NSString *)metricNameForType:(SyntheticMetricType)metricType {
    NSString *result = nil;
    
    switch(metricType) {
        case SyntheticMetricDNS:
            result = @"DNS (ms)";
            break;
        case SyntheticMetricConnect:
            result = @"Connect (ms)";
            break;
        case SyntheticMetricSSL:
            result = @"SSL (ms)";
            break;
        case SyntheticMetricSend:
            result = @"Send (ms)";
            break;
        case SyntheticMetricWait:
            result = @"Wait (ms)";
            break;
        case SyntheticMetricTimeToFirstByte:
            result = @"Time To First Byte (ms)";
            break;
        case SyntheticMetricLoad:
            result = @"Load (ms)";
            break;
        case SyntheticMetricResponse:
            result = @"Response (ms)";
            break;
        case SyntheticMetricRedirect:
            result = @"Redirect (ms)";
            break;
        case SyntheticMetricServerResponse:
            result = @"Server Response (ms)";
            break;
        case SyntheticMetricFileSize:
            result = @"File Size";
            break;
        case SyntheticMetricDownloadedBytes:
            result = @"Downloaded Bytes";
            break;
        case SyntheticMetricTotalDownloadedBytes:
            result = @"Total Downloaded Bytes";
            break;
        case SyntheticMetricThroughput:
            result = @"Throughput";
            break;
        case SyntheticMetricDOMLoad:
            result = @"DOM Load (ms)";
            break;
        case SyntheticMetricContentLoad:
            result = @"Content Load (ms)";
            break;
        case SyntheticMetricDocumentComplete:
            result = @"Document Complete (ms)";
            break;
        case SyntheticMetricWebpageResponse:
            result = @"Webpage Response (ms)";
            break;
        case SyntheticMetricWireTime:
            result = @"Wire Time (ms)";
            break;
        case SyntheticMetricClientTime:
            result = @"Client Time (ms)";
            break;
        case SyntheticMetricRenderStart:
            result = @"Render Start (ms)";
            break;
        case SyntheticMetricTimeToTitle:
            result = @"Time to Title (ms)";
            break;
        case SyntheticMetricWebpageThroughput:
            result = @"Webpage Throughput";
            break;
        case SyntheticMetricNumConnections:
            result = @"# Connections";
            break;
        case SyntheticMetricNumHosts:
            result = @"# Hosts";
            break;
        case SyntheticMetricNumZones:
            result = @"# Zones";
            break;
        case SyntheticMetricNumItemsTotal:
            result = @"# Items (Total)";
            break;
        case SyntheticMetricNumRedirect:
            result = @"# Redirect";
            break;
        case SyntheticMetricNumHtml:
            result = @"# Html";
            break;
        case SyntheticMetricHtmlBytes:
            result = @"Html Bytes";
            break;
        case SyntheticMetricNumImages:
            result = @"# Images";
            break;
        case SyntheticMetricImageBytes:
            result = @"Image Bytes";
            break;
        case SyntheticMetricNumScripts:
            result = @"# Scripts";
            break;
        case SyntheticMetricScriptBytes:
            result = @"Script Bytes";
            break;
        case SyntheticMetricNumCss:
            result = @"# Css";
            break;
        case SyntheticMetricCssBytes:
            result = @"Css Bytes";
            break;
        case SyntheticMetricNumFlash:
            result = @"# Flash";
            break;
        case SyntheticMetricFlashBytes:
            result = @"Flash Bytes";
            break;
        case SyntheticMetricNumXml:
            result = @"# Xml";
            break;
        case SyntheticMetricXmlBytes:
            result = @"Xml Bytes";
            break;
        case SyntheticMetricNumMedia:
            result = @"# Media";
            break;
        case SyntheticMetricMediaBytes:
            result = @"Media Bytes";
            break;
        case SyntheticMetricNumFonts:
            result = @"# Fonts";
            break;
        case SyntheticMetricFontBytes:
            result = @"Font Bytes";
            break;
        case SyntheticMetricNumOther:
            result = @"# Other";
            break;
        case SyntheticMetricOtherBytes:
            result = @"Other Bytes";
            break;
        case SyntheticMetricPctPingPacketLoss:
            result = @"% Ping Packet Loss";
            break;
        case SyntheticMetricPingRoundTrip:
            result = @"Ping Round Trip (ms)";
            break;
        case SyntheticMetricPctAvailability:
            result = @"% Availability";
            break;
        case SyntheticMetricPctContentAvailability:
            result = @"% Content Availability";
            break;
        case SyntheticMetricApdex:
            result = @"Apdex";
            break;
        case SyntheticMetricNumRuns:
            result = @"# Runs";
            break;
        case SyntheticMetricPageSpeedScore:
            result = @"Page Speed Score";
            break;
        case SyntheticMetricNumJSErrorsPerPage:
            result = @"# JS Errors per Page";
            break;
        case SyntheticMetricNumContentLoadErrors:
            result = @"# Content Load Errors";
            break;
        case SyntheticMetricNumTestsWithJSErrors:
            result = @"# Tests with JS Errors";
            break;
        case SyntheticMetricNumDNSFailures:
            result = @"# DNS Failures";
            break;
        case SyntheticMetricNumConnectionFailures:
            result = @"# Connection Failures";
            break;
        case SyntheticMetricNumSSLFailures:
            result = @"# SSL Failures";
            break;
        case SyntheticMetricNumResponseFailures:
            result = @"# Response Failures";
            break;
        case SyntheticMetricNumTimeoutFailures:
            result = @"# Timeout Failures";
            break;
        case SyntheticMetricNumTestErrors:
            result = @"# Test Errors";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected SyntheticMetricType"];
    }
    
    return result;
}


+ (UIColor *)metricColorForType:(SyntheticMetricType)metricType {
    UIColor *color = nil;
    
    switch(metricType) {
//        case SyntheticMetricDNS:
//            result = @"DNS (ms)";
//            break;
//        case SyntheticMetricConnect:
//            result = @"Connect (ms)";
//            break;
//        case SyntheticMetricSSL:
//            result = @"SSL (ms)";
//            break;
//        case SyntheticMetricSend:
//            result = @"Send (ms)";
//            break;
//        case SyntheticMetricWait:
//            result = @"Wait (ms)";
//            break;
//        case SyntheticMetricTimeToFirstByte:
//            result = @"Time To First Byte (ms)";
//            break;
//        case SyntheticMetricLoad:
//            result = @"Load (ms)";
//            break;
//        case SyntheticMetricResponse:
//            result = @"Response (ms)";
//            break;
//        case SyntheticMetricRedirect:
//            result = @"Redirect (ms)";
//            break;
//        case SyntheticMetricServerResponse:
//            result = @"Server Response (ms)";
//            break;
//        case SyntheticMetricFileSize:
//            result = @"File Size";
//            break;
//        case SyntheticMetricDownloadedBytes:
//            result = @"Downloaded Bytes";
//            break;
//        case SyntheticMetricTotalDownloadedBytes:
//            result = @"Total Downloaded Bytes";
//            break;
//        case SyntheticMetricThroughput:
//            result = @"Throughput";
//            break;
//        case SyntheticMetricDOMLoad:
//            result = @"DOM Load (ms)";
//            break;
//        case SyntheticMetricContentLoad:
//            result = @"Content Load (ms)";
//            break;
//        case SyntheticMetricDocumentComplete:
//            result = @"Document Complete (ms)";
//            break;
        case SyntheticMetricWebpageResponse:
            color = [UIColor colorWithRed:116.0/255.0 green:123.0/255.0 blue:204.0/255.0 alpha:1.0];
            break;
//        case SyntheticMetricWireTime:
//            result = @"Wire Time (ms)";
//            break;
//        case SyntheticMetricClientTime:
//            result = @"Client Time (ms)";
//            break;
//        case SyntheticMetricRenderStart:
//            result = @"Render Start (ms)";
//            break;
//        case SyntheticMetricTimeToTitle:
//            result = @"Time to Title (ms)";
//            break;
//        case SyntheticMetricWebpageThroughput:
//            result = @"Webpage Throughput";
//            break;
//        case SyntheticMetricNumConnections:
//            result = @"# Connections";
//            break;
//        case SyntheticMetricNumHosts:
//            result = @"# Hosts";
//            break;
//        case SyntheticMetricNumZones:
//            result = @"# Zones";
//            break;
//        case SyntheticMetricNumItemsTotal:
//            result = @"# Items (Total)";
//            break;
//        case SyntheticMetricNumRedirect:
//            result = @"# Redirect";
//            break;
//        case SyntheticMetricNumHtml:
//            result = @"# Html";
//            break;
//        case SyntheticMetricHtmlBytes:
//            result = @"Html Bytes";
//            break;
//        case SyntheticMetricNumImages:
//            result = @"# Images";
//            break;
//        case SyntheticMetricImageBytes:
//            result = @"Image Bytes";
//            break;
//        case SyntheticMetricNumScripts:
//            result = @"# Scripts";
//            break;
//        case SyntheticMetricScriptBytes:
//            result = @"Script Bytes";
//            break;
//        case SyntheticMetricNumCss:
//            result = @"# Css";
//            break;
//        case SyntheticMetricCssBytes:
//            result = @"Css Bytes";
//            break;
//        case SyntheticMetricNumFlash:
//            result = @"# Flash";
//            break;
//        case SyntheticMetricFlashBytes:
//            result = @"Flash Bytes";
//            break;
//        case SyntheticMetricNumXml:
//            result = @"# Xml";
//            break;
//        case SyntheticMetricXmlBytes:
//            result = @"Xml Bytes";
//            break;
//        case SyntheticMetricNumMedia:
//            result = @"# Media";
//            break;
//        case SyntheticMetricMediaBytes:
//            result = @"Media Bytes";
//            break;
//        case SyntheticMetricNumFonts:
//            result = @"# Fonts";
//            break;
//        case SyntheticMetricFontBytes:
//            result = @"Font Bytes";
//            break;
//        case SyntheticMetricNumOther:
//            result = @"# Other";
//            break;
//        case SyntheticMetricOtherBytes:
//            result = @"Other Bytes";
//            break;
//        case SyntheticMetricPctPingPacketLoss:
//            result = @"% Ping Packet Loss";
//            break;
//        case SyntheticMetricPingRoundTrip:
//            result = @"Ping Round Trip (ms)";
//            break;
//        case SyntheticMetricPctAvailability:
//            result = @"% Availability";
//            break;
//        case SyntheticMetricPctContentAvailability:
//            result = @"% Content Availability";
//            break;
//        case SyntheticMetricApdex:
//            result = @"Apdex";
//            break;
//        case SyntheticMetricNumRuns:
//            result = @"# Runs";
//            break;
//        case SyntheticMetricPageSpeedScore:
//            result = @"Page Speed Score";
//            break;
//        case SyntheticMetricNumJSErrorsPerPage:
//            result = @"# JS Errors per Page";
//            break;
//        case SyntheticMetricNumContentLoadErrors:
//            result = @"# Content Load Errors";
//            break;
//        case SyntheticMetricNumTestsWithJSErrors:
//            result = @"# Tests with JS Errors";
//            break;
//        case SyntheticMetricNumDNSFailures:
//            result = @"# DNS Failures";
//            break;
//        case SyntheticMetricNumConnectionFailures:
//            result = @"# Connection Failures";
//            break;
//        case SyntheticMetricNumSSLFailures:
//            result = @"# SSL Failures";
//            break;
//        case SyntheticMetricNumResponseFailures:
//            result = @"# Response Failures";
//            break;
//        case SyntheticMetricNumTimeoutFailures:
//            result = @"# Timeout Failures";
//            break;
//        case SyntheticMetricNumTestErrors:
//            result = @"# Test Errors";
//            break;
        default:
            color = [UIColor blueColor];
//            [NSException raise:NSGenericException format:@"Unexpected SyntheticMetricType"];
    }
    
    return color;
}

@end
