//
//  SXMWaterWaveView.swift
//  SXMWaterWaveDemo
//
//  Created by 申铭 on 2017/7/23.
//  Copyright © 2017年 shenming. All rights reserved.
//

import UIKit

class SXMWaterWaveView_swift: UIView {

    lazy private var firstShapeLayer = CAShapeLayer();
    lazy private var sencondShapeLayer = CAShapeLayer();
    lazy private var waveDisplayLink = CADisplayLink();
    
    /** 波动速度 */
    var waveSpeed : CGFloat = 0
    /** 水波振幅 */
    var waveAmplitude: CGFloat = 0
    /** 水波的高度 */
    var waveHeight : CGFloat = 0
    /** 水波颜色 */
    var waveColor : UIColor? {
        didSet {
            firstShapeLayer.fillColor = waveColor?.cgColor;
            sencondShapeLayer.fillColor = waveColor?.cgColor;
        }
    }
    
    private var waveWidth: CGFloat = 0
    private var offsetX: CGFloat = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        // 初始化值
        self.waveSpeed = 0.1;
        self.waveAmplitude = 8;
        self.waveWidth =  2.5 * CGFloat(M_PI) / self.bounds.size.width;
        self.waveHeight = self.frame.size.height / 2;
        
        firstShapeLayer.fillColor = UIColor.init(colorLiteralRed: 255 / 255.0, green: 255 / 255.0, blue: 255 / 255.0, alpha: 0.5).cgColor
        sencondShapeLayer.fillColor = UIColor.init(colorLiteralRed: 255 / 255.0, green: 255 / 255.0, blue: 255 / 255.0, alpha: 0.5).cgColor
        layer.addSublayer(firstShapeLayer)
        layer.addSublayer(sencondShapeLayer)
        
        waveDisplayLink = CADisplayLink(target: self, selector: #selector(getCurrentWave))
        waveDisplayLink.add(to: RunLoop.current, forMode: .commonModes)
    }
    
    @objc private func getCurrentWave() {
        offsetX += waveSpeed
    
        // 第一条线
        let firstPath = CGMutablePath()
        var firstY = bounds.size.width / 2
        firstPath.move(to: CGPoint(x: 0, y: firstY))
        for i in 0...Int(bounds.size.width) {
            firstY = waveAmplitude * sin(waveWidth * CGFloat(i) + offsetX) + waveHeight
            firstPath.addLine(to: CGPoint(x: CGFloat(i), y: firstY))
        }
        
        firstPath.addLine(to: CGPoint(x: bounds.size.width, y: bounds.size.height))
        firstPath.addLine(to: CGPoint(x: 0, y: bounds.size.height))
        firstPath.closeSubpath()
        firstShapeLayer.path = firstPath
        
        // 第二条线
        let secondPath = CGMutablePath()
        var secondY = bounds.size.width / 2
        secondPath.move(to: CGPoint(x: 0, y: secondY))
        
        for i in 0...Int(bounds.size.width) {
        secondY = waveAmplitude * sin(waveWidth * CGFloat(i) + offsetX - bounds.size.width / 2 ) + waveHeight
        secondPath.addLine(to: CGPoint(x: CGFloat(i), y: secondY))
        }
        secondPath.addLine(to: CGPoint(x: bounds.size.width, y: bounds.size.height))
        secondPath.addLine(to: CGPoint(x: 0, y: bounds.size.height))
        secondPath.closeSubpath()
        sencondShapeLayer.path = secondPath
    }
    
    public func destroyView() {
        waveDisplayLink.invalidate()
    }

    deinit {
        print("SXMWaterWaveView_deinit")
    }
}
