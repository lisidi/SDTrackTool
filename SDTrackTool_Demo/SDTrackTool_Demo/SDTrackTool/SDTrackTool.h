//
//  SDTrackTool.h
//  sdtrack
//
//  Created by lisd on 2017/4/26.
//  Copyright © 2017年 kingnet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDTrackTool : NSObject

+ (void)configure;
+(void)beginLogPageID:(NSString *)pageID;
+(void)endLogPageID:(NSString *)pageID;
+(void)logEvent:(NSString*)eventId;

@end

