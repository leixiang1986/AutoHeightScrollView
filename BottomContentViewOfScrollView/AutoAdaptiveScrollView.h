//
//  AutoAdaptiveScrollView.h
//  BottomContentViewOfScrollView
//
//  Created by 雷祥 on 16/12/8.
//  Copyright © 2016年 leixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoAdaptiveScrollView : UIScrollView
@property (nonatomic,copy) void (^updateContentSizeBlock)(AutoAdaptiveScrollView *scrollView,CGSize contentSize);
@end
