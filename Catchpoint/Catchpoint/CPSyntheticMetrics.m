//
//  CPSyntheticMetrics.m
//  Catchpoint
//
//  Created by Matias on 6/19/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPSyntheticMetrics.h"

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

@end
