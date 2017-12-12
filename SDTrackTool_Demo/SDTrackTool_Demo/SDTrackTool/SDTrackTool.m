//
//  SDTrackTool.m
//  sdtrack
//
//  Created by lisd on 2017/4/26.
//  Copyright © 2017年 kingnet. All rights reserved.
//

#import "SDTrackTool.h"
//#import "UMMobClick/MobClick.h"

@implementation SDTrackTool

+ (void)configure {
//    UMConfigInstance.appKey = UMENG_KEY;
//    UMConfigInstance.eSType = E_UM_NORMAL;
////    UMConfigInstance.ePolicy = 0;
//    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
//    NSString *currentVersion = [infoDict objectForKey:@"CFBundleShortVersionString"];
//    [MobClick setAppVersion:currentVersion];
//    [MobClick startWithConfigure:UMConfigInstance];
//
//#ifdef DEBUG
//    [MobClick setLogEnabled:YES];
//    [MobClick setCrashReportEnabled:NO];
//#endif
}

+(void)beginLogPageID:(NSString *)pageID {
//    [MobClick beginLogPageView:pageID];
}

+(void)endLogPageID:(NSString *)pageID {
//    [MobClick endLogPageView:pageID];
}

+(void)logEvent:(NSString*)eventId {
//    [MobClick event:eventId];
}

@end
