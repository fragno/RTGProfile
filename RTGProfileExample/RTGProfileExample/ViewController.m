//
//  ViewController.m
//  RTGProfileExample
//
//  Created by fragno on 2017/8/25.
//  Copyright © 2017年 rookie2geek. All rights reserved.
//

#import "ViewController.h"
#import "RTGProfile.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)dealloc {
    RTGProfileEnd();
}

- (void)viewDidLoad {
    RTGProfileInit();
    RTGProfileEventBegin(@"viewdidload");
    [super viewDidLoad];
    RTGProfileEventEnd(@"viewdidload");
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
