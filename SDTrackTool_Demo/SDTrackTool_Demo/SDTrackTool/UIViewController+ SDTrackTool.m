//
//  UIViewController+SDTrack.m
//  XYMaintenance
//
//  Created by lisd on 2017/4/26.
//  Copyright © 2017年 Kingnet. All rights reserved.
//

#import "UIViewController+SDTrackTool.h"
#import "SDTrackTool.h"
#import <objc/runtime.h>

@implementation UIViewController (SDTrackTool)
/*
 核心技术：面向AOP, runtime，分类
 
 load中交换方法，拿到方法选择器，
 根据方法选择器和self类，拿到方法
 给originalSelector添加swizzledMethod
 给swizzledSelector换成originalMethod
 此时交换完成
 swizzledMethod中 1.注入埋点代码 2.调用系统方法
 埋点代码细节：
 1.提前配置plist文件，
 XYSettingViewController
    PageEventIDs
        Enter PAGE_EVENT_XYSettingViewController_ENTER
    ControlEventIDs
        exitCurrentAccount CTRL_EVENT_XYSettingViewController_LOGOUT
 2.根据当前class name 查找 是否存在事件ID
 如果有上报
 
 */
+(void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(sd_viewWillAppear:);
        [self swizzlingInClass:[self class] originalSelector:originalSelector swizzledSelector:swizzledSelector];
        
        SEL originalSelector2 = @selector(viewWillDisappear:);
        SEL swizzledSelector2 = @selector(sd_viewWillDisappear:);
        [self swizzlingInClass:[self class] originalSelector:originalSelector2 swizzledSelector:swizzledSelector2];
    });
}

+ (void)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector
{
    Class class = cls;
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

-(void)sd_viewWillAppear:(BOOL)animated {
    [self trackViewWillAppear];//插入埋点代码
    [self sd_viewWillAppear:animated];//调用系统方法
}

-(void)sd_viewWillDisappear:(BOOL)animated {
    [self trackViewWillDisAppear];//插入埋点代码
    [self sd_viewWillDisappear:animated];//调用系统方法
}

- (void)trackViewWillAppear{
    NSString *pageID = [self getPageEventID:YES];
    if (pageID.length) {
        [SDTrackTool beginLogPageID:pageID];
        [SDTrackTool logEvent:pageID];
    }
}

- (void)trackViewWillDisAppear{
    NSString *pageID = [self getPageEventID:NO];
    if (pageID.length) {
        [SDTrackTool endLogPageID:pageID]; 
    }
}

- (NSString *)getPageEventID:(BOOL)bEnterPage
{
    NSDictionary *configDict = [self getConfigDict];
    NSString *selfClassName = NSStringFromClass([self class]);
    return configDict[selfClassName][@"PageEventIDs"][bEnterPage ? @"Enter" : @"Leave"];
}

- (NSDictionary *)getConfigDict
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"SDTrackEvents" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dic;
}

@end
