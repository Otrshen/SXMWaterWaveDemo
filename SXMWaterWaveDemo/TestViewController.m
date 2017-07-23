//
//  TestViewController.m
//  SXMWaterWaveDemo
//
//  Created by 申铭 on 2017/7/23.
//  Copyright © 2017年 shenming. All rights reserved.
//

#import "TestViewController.h"
#import "SXMWaterWaveView.h"

#import "SXMWaterWaveDemo-Swift.h"
//#import "ASongWaterWaveView.swift"

@interface TestViewController ()
@property (nonatomic, strong) SXMWaterWaveView *waterWave;
@property (nonatomic, strong) SXMWaterWaveView_swift *waterWaveSwift;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"水波";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // OC
    self.waterWave = [[SXMWaterWaveView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.waterWave.backgroundColor = [UIColor blackColor];
    self.waterWave.waveColor = [UIColor colorWithRed:20 / 255 green:255 / 255 blue:255 / 255 alpha:0.5];
//    self.waterWave.waveHeight = self.view.frame.size.height - 20;
//    waterWave.waveSpeed = 1;
//    waterWave.waveAmplitude = 15;
    [self.view addSubview:self.waterWave];
    
    // Swift
//    self.waterWaveSwift = [[SXMWaterWaveView_swift alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
////    s.waveHeight = 100;
////    s.waveSpeed = 0.2;
//    self.waterWaveSwift.waveColor = [UIColor colorWithRed:20 / 255 green:255 / 255 blue:255 / 255 alpha:0.5];
//    [self.view addSubview:self.waterWaveSwift];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
//    [self.waterWave destroy];
//    [self.waterWaveSwift destroyView];
}


@end
