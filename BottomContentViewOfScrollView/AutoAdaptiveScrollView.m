//
//  AutoAdaptiveScrollView.m
//  BottomContentViewOfScrollView
//
//  Created by 雷祥 on 16/12/8.
//  Copyright © 2016年 leixiang. All rights reserved.
//

#import "AutoAdaptiveScrollView.h"

@implementation AutoAdaptiveScrollView

-(void)updateConstraints {
    [super updateConstraints];
    if (self.updateContentSizeBlock) {
        self.updateContentSizeBlock(self,self.contentSize);
    }
    NSLog(@"11111");
}


-(void)layoutSubviews {
    [super layoutSubviews];

    if (self.updateContentSizeBlock) {
        self.updateContentSizeBlock(self,self.contentSize);
    }
}

- (void)drawRect:(CGRect)rect {

}

@end
