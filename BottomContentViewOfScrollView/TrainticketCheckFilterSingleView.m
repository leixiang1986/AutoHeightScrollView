//
//  TrainticketCheckFilterSingleView.m
//  OkdeerUser
//
//  Created by 雷祥 on 16/11/15.
//  Copyright © 2016年 okdeer. All rights reserved.
//

#import "TrainticketCheckFilterSingleView.h"
#import "TrainticketCheckFilterChooseView.h"
#import "masonry.h"
#import "PublicHeader.h"

#define kTitleLeftSpace         12
#define kTitleTopSpace          3
#define kSapceBetween           20

#define kBaseTag                100

@interface TrainticketCheckFilterSingleView ()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) NSMutableArray *chooseViews;   //可点击的view
@property (nonatomic,strong) UIView *selectItemBaseView;

@end

@implementation TrainticketCheckFilterSingleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
        WEAKSELF(weakSelf)
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            STRONGSELF(strongSelf)
            make.left.mas_equalTo(strongSelf).offset(kTitleLeftSpace);
            make.top.mas_equalTo(strongSelf).offset(kTitleTopSpace);
            make.height.mas_equalTo(20);
        }];
        _singleSelection = YES;

        [self.selectItemBaseView mas_makeConstraints:^(MASConstraintMaker *make) {
            STRONGSELF(strongSelf)
            make.bottom.left.right.equalTo(strongSelf);
            make.top.mas_equalTo(strongSelf.titleLabel.mas_bottom);
            make.bottom.mas_equalTo(strongSelf.mas_bottom);
        }];
    }

    return self;
}

//可选择item的底部view
- (UIView *)selectItemBaseView {
    if (!_selectItemBaseView) {
        _selectItemBaseView = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:_selectItemBaseView];
    }

    return _selectItemBaseView;
}


- (void)setContentArr:(NSArray *)contentArr {
    _contentArr = contentArr;
    if (_contentArr.count > 0) {
         [self setupContentData];
    }
}

- (void)setTitle:(NSString *)title {
    _title = title;
    [self setupTitleData];
}

- (void)setupTitleData {
    _titleLabel.text = _title;
}

//根据数据显示内容
- (void)setupContentData {
    TrainticketCheckFilterChooseView *lastChooseView = nil;
    CGFloat chooseViewWidth = (kFullScreenWidth - 2 * kTitleLeftSpace - kSapceBetween) / 2;
    CGSize chooseViewSize = CGSizeMake(chooseViewWidth, 40);
    [self.chooseViews removeAllObjects];
    [self.chooseViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.selectItemBaseView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (NSInteger i = 0; i < _contentArr.count; i++) {
        TrainticketCheckFilterChooseView *chooseView = [[TrainticketCheckFilterChooseView alloc] initWithFrame:CGRectZero];
        chooseView.tag = kBaseTag + i;
        chooseView.content = _contentArr[i];
        WEAKSELF(weakSelf)
        chooseView.filterChooseViewClickBlock = ^(TrainticketCheckFilterChooseView *chooseView,BOOL selected) {
            CCLog(@"选中");
            STRONGSELF(strongSelf)
            if (_singleSelection) { //单选
                for (NSInteger i = 0; i < self.selectItemBaseView.subviews.count; i++) {
                    TrainticketCheckFilterChooseView *view = self.chooseViews[i];
                    if (chooseView.tag != view.tag) {
                        view.selected = NO;

                    }
                }
            }

            if (strongSelf.filterSingleViewSelectBlock) {
                NSMutableArray *selectedIndexs = [[NSMutableArray alloc] init];
                for (NSInteger i = 0; i < self.selectItemBaseView.subviews.count; i++) {
                    TrainticketCheckFilterChooseView *view = self.selectItemBaseView.subviews[i];
                    if (view.selected) {
                        NSString *index = [NSString stringWithFormat:@"%ld",(long)(view.tag - kBaseTag)];
                        [selectedIndexs addObject:index];
                        CCLog(@"选中了＝＝＝%ld---%@",chooseView.tag,selectedIndexs);
                    }
                }

                strongSelf.filterSingleViewSelectBlock(self,selectedIndexs,chooseView.content);
            }
        };
        [self.selectItemBaseView addSubview:chooseView];



        [chooseView mas_makeConstraints:^(MASConstraintMaker *make) {
            STRONGSELF(strongSelf)
            if (!lastChooseView) {  //第一个
                make.left.mas_equalTo(strongSelf.selectItemBaseView).offset(kTitleLeftSpace);;
                make.top.mas_equalTo(strongSelf.selectItemBaseView.mas_top).offset(kTitleTopSpace);
                make.size.mas_equalTo(chooseViewSize);
            }
            else {  //不是第一个
                if (i % 2 == 0) {   //每行的第一个
                    make.left.mas_equalTo(strongSelf.selectItemBaseView).offset(kTitleLeftSpace);;
                    make.top.mas_equalTo(lastChooseView.mas_bottom).offset(kTitleTopSpace);
                    make.size.mas_equalTo(chooseViewSize);
                }
                else {
                    make.left.mas_equalTo(lastChooseView.mas_right).offset(kSapceBetween);
                    make.top.mas_equalTo(lastChooseView.mas_top);
                    make.size.mas_equalTo(chooseViewSize);
                }
            }

            if (i == _contentArr.count - 1) { //最后一个
                make.bottom.mas_equalTo(strongSelf.selectItemBaseView.mas_bottom);
            }
        }];
        [self.chooseViews addObject:chooseView];

        lastChooseView = chooseView;
    }
}

//- (void)setSingleSelection:(BOOL)singleSelection {
//    _singleSelection = singleSelection;
//}


-(NSMutableArray *)chooseViews {
    if (!_chooseViews) {
        _chooseViews = [[NSMutableArray alloc] init];
    }
    return _chooseViews;
}

//取消选中
- (void)unselectAll {
    for (NSInteger i = 0; i < self.chooseViews.count; i++) {
        TrainticketCheckFilterChooseView *view = self.chooseViews[i];
        view.selected = NO;
    }
}


@end
