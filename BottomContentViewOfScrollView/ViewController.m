//
//  ViewController.m
//  BottomContentViewOfScrollView
//
//  Created by 雷祥 on 16/12/8.
//  Copyright © 2016年 leixiang. All rights reserved.
//

#import "ViewController.h"
#import "AutoAdaptiveScrollView.h"
#import "sdfViewController.h"

//内容跟随内容变大，设置最大内容后scrollView滚动
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewHeightConstraint;
@property (weak, nonatomic) IBOutlet AutoAdaptiveScrollView *baseScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = CGRectMake(20, 50, 160, 40);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"跟随内容变大" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];

    self.baseScrollView.updateContentSizeBlock = ^(AutoAdaptiveScrollView *scrollView,CGSize contentSize){
        NSLog(@"%f",contentSize.height);
        if (contentSize.height < 450) {
            self.scrollViewHeightConstraint.constant = contentSize.height;
        }
        else {
            self.scrollViewHeightConstraint.constant = 450;
        }
    };


    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn1.frame = CGRectMake(200, 50, 80, 40);
    btn1.backgroundColor = [UIColor redColor];
    [btn1 addTarget:self action:@selector(btnClick1:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn1];
}

-(void)btnClick1:(id)sender{
    
}

-(void)btnClick:(id)sender{
    self.firstViewHeightConstraint.constant =  self.firstViewHeightConstraint.constant + 30;
#warning 以下方法会掉用scrollView的updateConstraints方法
//    [self.baseScrollView setNeedsUpdateConstraints];

}



-(void)updateViewConstraints {
    [super updateViewConstraints];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
