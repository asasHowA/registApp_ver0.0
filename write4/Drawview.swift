//
//  Drawview.swift
//  write4
//
//  Created by doi-macbook on 2023/01/25.
//

import UIKit

class DrawView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.backgroundColor = UIColor.clear;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // ここにUIBezierPathを記述する
        // 円
        print("jikkou0")
        let circle = UIBezierPath(arcCenter: CGPoint(x: tap_x, y: tap_y), radius: 36.4, startAngle: 0, endAngle: CGFloat(Double.pi)*2, clockwise: true)
        // 内側の色
        UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).setFill()
        // 内側を塗りつぶす
        circle.fill()
        // 線の色
        UIColor(red: 0, green: 0, blue: 1, alpha: 1.0).setStroke()
        // 線の太さ
        circle.lineWidth = 2.0
        // 線を塗りつぶす
        circle.stroke()
        print("jikkou")
        
    }
 
}
