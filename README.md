SDTrackTool可以减少统计上报代码，实现较简单的无痕埋点。

## 特性

- [√] Runtime
- [√] AOP思想
- [√] 界面、事件统计可配置化
- [√] 减少垃圾代码
- [√] 可拓展性，方便切换任意统计SDK

## 哪些app在用
- Hi维修
- Hi工程师

## 安装

两种方式安装 SDTrackTool :

-  CocoaPods
-  手动拖拽文件

### 通过CocoaPods安装

#### Podfile
```
platform :ios, '8.0'
pod 'SDTrackTool'
```

## How To Use

```objective-c
AppDelegate.m

#import "SDTrackTool.h"
...
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [SDTrackTool configure];
}
```

```objective-c
SDTrackTool.m

#import "SDTrackTool.h"
...
+ (void)configure {
//第三方统计sdk配置
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
```

```objective-c
在要统计的界面 #import "SDTrackTool.h"
```

```objective-c
按照示例，填写配置SDTrackEvents.plist
```
## Author
- [lisidi](https://github.com/CoderLISIDI)


## Licenses

All source code is licensed under the [MIT License](https://raw.github.com/CoderLISIDI/SDTrackTool/master/LICENSE).


