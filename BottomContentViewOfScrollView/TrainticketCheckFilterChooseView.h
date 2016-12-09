//
//  TrainticketCheckFilterChooseView.h
//  OkdeerUser
//
//  Created by 雷祥 on 16/11/15.
//  Copyright © 2016年 okdeer. All rights reserved.
//

#import <UIKit/UIKit.h>

//火车票查询筛选界面的每个选项的view，如动车，包含点击事件
@interface TrainticketCheckFilterChooseView : UIView

@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign, getter=isSelected) BOOL selected;
@property (nonatomic, copy) void(^filterChooseViewClickBlock)(TrainticketCheckFilterChooseView *view,BOOL selected);


- (instancetype)initWithFrame:(CGRect)frame withContent:(NSString *)content;

@end
