//
//  TrainticketCheckFilterSingleView.h
//  OkdeerUser
//
//  Created by 雷祥 on 16/11/15.
//  Copyright © 2016年 okdeer. All rights reserved.
//

#import <UIKit/UIKit.h>

//火车票查询筛选的单个view,如车次，或出发时段
@interface TrainticketCheckFilterSingleView : UIView
@property (nonatomic,assign,getter=isSingleSelection) BOOL singleSelection;  //是否单选
@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) NSArray *contentArr;

@property (nonatomic,copy) void(^filterSingleViewSelectBlock)(TrainticketCheckFilterSingleView *view,NSArray *indexs,NSString *title);

//取消选中
- (void)unselectAll;

@end
