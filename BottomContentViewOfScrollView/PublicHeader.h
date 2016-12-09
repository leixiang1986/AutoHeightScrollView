//
//  PublicHeader.h
//  PublicFrameworks
//
//  Created by Mac on 16/9/1.
//  Copyright © 2016年 Mac. All rights reserved.
//

#ifndef PublicHeader_h
#define PublicHeader_h

#define kStatusBarHeight            ([UIApplication sharedApplication].statusBarFrame.size.height)    // 状态栏高度
#define kFullScreenWidth           ([UIScreen mainScreen].bounds.size.width)                          // 全屏的宽度
#define kFullScreenHeight          ( [UIScreen mainScreen].bounds.size.height)                        // 全屏的高度
#define kExceptStatusBarHeight     (kFullScreenHeight - kStatusBarHeight)                             // 除了状态栏的高度
#define kNavigationBarHeight        44.00f                                                            // 导航栏的高度
#define kTabbarHeight               49.00f                                                            // 状态栏高度
#define kStatusBarAndNavigationBarHeight   (kNavigationBarHeight + kStatusBarHeight)          /**< 导航栏和状态栏的高度*/

/**
 *  判断版本是否大于等于7/8的布尔变量
 */
#define iOS7UP  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define iOS8UP  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define iOS9UP  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define iOS10UP ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)

/**
 * 判断机器型号
 */
#define isPhone4 (([UIScreen mainScreen ].bounds.size.height == 480.0)?YES:NO)
#define isPhone5 (([UIScreen mainScreen ].bounds.size.height == 568.0)?YES:NO)
#define isPhone6 (([UIScreen mainScreen ].bounds.size.height == 667.0)?YES:NO)
#define isPhone6P (([UIScreen mainScreen ].bounds.size.height == 736.0)?YES:NO)


/**
 *  定义弱引用
 *
 *  @param weakSelf
 *
 *  @return
 */
#define WEAKSELF(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define STRONGSELF(strongSelf)  __strong __typeof(&*weakSelf)strongSelf = weakSelf;






/**
 *  自定义打印，在debug时打印，发布时不打印
 */
#ifdef DEBUG
#define CCLog(fmt, ...) NSLog((@"[函数名:%s] " " [行号:%d] " fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define CCLog(fmt, ...)
#endif







#define kCode                                   @"code"
#define kData                                   @"data"
#define kMessage                                @"message"
#define kString                                 @"NSString"                // 字符串
#define kArray                                  @"NSArray"                 // 数组
#define kDictionary                             @"NSDictionary"            // 字典
#define kAttributedString                       @"NSAttributedString"
#define kNumber                                 @"NSNumber"             
#define kQuestionMark                           @"?"                        // ？
#define kJoiner                                 @"&"                        // &

#define kScreenGridViewHeight    (1/[UIScreen mainScreen].scale)




#endif /* PublicHeader_h */
