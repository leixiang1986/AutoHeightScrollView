//
//  TrainticketCheckFilterChooseView.m
//  OkdeerUser
//
//  Created by 雷祥 on 16/11/15.
//  Copyright © 2016年 okdeer. All rights reserved.
//

#import "TrainticketCheckFilterChooseView.h"
#import "masonry.h"
#import "PublicHeader.h"

#define kBtnSize            28
#define kSpace              10  //按钮与label间的间距
#define kEdgeInsetWidth     7
#define kLabelTextFontSize  14

@interface TrainticketCheckFilterChooseView ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *btn;
@end

@implementation TrainticketCheckFilterChooseView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.font = [UIFont systemFontOfSize:kLabelTextFontSize];
        _label.textColor = [UIColor blackColor];
        _label.numberOfLines = 0;
        _label.adjustsFontSizeToFitWidth = YES;


        _btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _btn.frame = CGRectMake(0, 0, kBtnSize, kBtnSize);
        [_btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [_btn setImage:[UIImage imageNamed:@"train_filter_unselected"] forState:(UIControlStateNormal)];
        [_btn setImage:[UIImage imageNamed:@"train_filter_selected"] forState:(UIControlStateSelected)];
        [_btn setImageEdgeInsets:(UIEdgeInsetsMake(kEdgeInsetWidth, kEdgeInsetWidth, kEdgeInsetWidth, kEdgeInsetWidth))];
        

        [self addSubview:_label];
        [self addSubview:_btn];
        WEAKSELF(weakSelf)
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            STRONGSELF(strongSelf)
            make.left.equalTo(strongSelf);
            make.centerY.mas_equalTo(strongSelf);
            make.size.mas_equalTo(CGSizeMake(kBtnSize, kBtnSize));
        }];

        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            STRONGSELF(strongSelf)
            make.left.mas_equalTo(strongSelf.btn.mas_right).offset(kSpace);
            make.centerY.mas_equalTo(strongSelf);
            make.right.equalTo(strongSelf);
        }];

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
        [self addGestureRecognizer:tap];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame withContent:(NSString *)content {
    self = [self initWithFrame:frame];
    if (self) {
        [self setupData];
    }

    return self;
}

- (void)setContent:(NSString *)content {
    _content = content;
    [self setupData];
}

- (void)setupData {
    _label.text = _content;
}

//点击事件
- (void)btnClick:(id)sender {
    if (_btn.selected) {
        _btn.selected = NO;
        _selected = NO;
    }
    else {
        _btn.selected = YES;
        _selected = YES;
    }
    if (self.filterChooseViewClickBlock) {
        self.filterChooseViewClickBlock(self,_btn.selected);
    }
}

//tap事件
- (void)tapClick {
    [self btnClick:nil];
}

//设置选中
- (void)setSelected:(BOOL)selected {
    if (selected) {
        _selected = YES;
        _btn.selected = YES;
    }
    else {
        _selected = NO;
        _btn.selected = NO;
    }
}


@end
