#import "APFinancialData.h"
#import "NSDateFormatterExtensions.h"

@implementation NSDictionary(APFinancialData)

+(id)dictionaryWithCSVLine:(NSString *)csvLine
{
    NSArray *csvChunks = [csvLine componentsSeparatedByString:@","];

    NSMutableDictionary *csvDict = [NSMutableDictionary dictionaryWithCapacity:7];

    // Date,Open,High,Low,Close,Volume,Adj Close
    // 2009-06-08,143.82,144.23,139.43,143.85,33255400,143.85
    NSDate *theDate = [[NSDateFormatter csvDateFormatter] dateFromString:(NSString *)csvChunks[0]];

    csvDict[@"date"] = theDate;
    NSDecimalNumber *theOpen = [NSDecimalNumber decimalNumberWithString:(NSString *)csvChunks[1]];
    csvDict[@"open"] = theOpen;
    NSDecimalNumber *theHigh = [NSDecimalNumber decimalNumberWithString:(NSString *)csvChunks[2]];
    csvDict[@"high"] = theHigh;
    NSDecimalNumber *theLow = [NSDecimalNumber decimalNumberWithString:(NSString *)csvChunks[3]];
    csvDict[@"low"] = theLow;
    NSDecimalNumber *theClose = [NSDecimalNumber decimalNumberWithString:(NSString *)csvChunks[4]];
    csvDict[@"close"] = theClose;
    NSDecimalNumber *theVolume = [NSDecimalNumber decimalNumberWithString:(NSString *)csvChunks[5]];
    csvDict[@"volume"] = theVolume;
    NSDecimalNumber *theAdjClose = [NSDecimalNumber decimalNumberWithString:(NSString *)csvChunks[6]];
    csvDict[@"adjClose"] = theAdjClose;

    //non-mutable autoreleased dict
    return [NSDictionary dictionaryWithDictionary:csvDict];
}

@end
