//
//  SXMWaterWaveView.h
//  SXMWaterWaveDemo
//
//  Created by 申铭 on 2017/7/22.
//  Copyright © 2017年 shenming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SXMWaterWaveView : UIView

/** 波动速度 */
@property (nonatomic, assign) CGFloat waveSpeed;
/** 水波振幅 */
@property (nonatomic, assign) CGFloat waveAmplitude;
/** 水波颜色 */
@property (nonatomic, strong) UIColor *waveColor;
/** 水波的高度 */
@property (nonatomic, assign) CGFloat waveHeight;

- (void)destroy;
@end
