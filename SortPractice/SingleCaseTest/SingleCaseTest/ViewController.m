//
//  ViewController.m
//  SingleCaseTest
//
//  Created by tangyunchuan on 2019/4/8.
//  Copyright © 2019 yqs. All rights reserved.
//

#import "ViewController.h"
#import "SingleModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(submmitInfo:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];
    button.tag = 1;
    button.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:button];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 addTarget:self action:@selector(submmitInfo:) forControlEvents:UIControlEventTouchUpInside];
    button1.backgroundColor = [UIColor greenColor];
    button1.tag = 2;
    button1.frame = CGRectMake(0, 100, 100, 100);
    [self.view addSubview:button1];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 addTarget:self action:@selector(submmitInfo:) forControlEvents:UIControlEventTouchUpInside];
    button2.backgroundColor = [UIColor blueColor];
    button2.tag = 3;
    button2.frame = CGRectMake(0, 200, 100, 100);
    [self.view addSubview:button2];
}
- (void)submmitInfo:(UIButton *)sender{

    if (sender.tag == 1) {
        SingleModel *model = [SingleModel shareModel];
        model.myName = @"1231312312312";
        NSLog(@"%p",model);
        NSLog(@"%@",model.myName);
    }else if (sender.tag == 2) {
        SingleModel *model = [SingleModel shareModel];
        NSLog(@"%p",model);
        ///model只是一个指向内存地址的指针,把model置为空只是该指针置为nil,但是当前对象由于有static指针修饰,而static指针即使是修饰局部变量其作用域也会一直持续到程序结束,所以对象不会被置nil,所以model.myName依然有值
        model = nil;
        NSLog(@"%p",model);
        NSLog(@"%@",model.myName);
    }else if (sender.tag == 3) {
        SingleModel *model = [SingleModel shareModel];
        NSLog(@"%p",model);
        NSLog(@"%@",model.myName);
    }
}

@end
