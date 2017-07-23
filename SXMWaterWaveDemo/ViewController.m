//
//  ViewController.m
//  SXMWaterWaveDemo
//
//  Created by 申铭 on 2017/7/22.
//  Copyright © 2017年 shenming. All rights reserved.
//

#import "ViewController.h"

#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)goWaterWave:(id)sender {
    [self.navigationController pushViewController:[[TestViewController alloc] init] animated:YES];
}


@end
