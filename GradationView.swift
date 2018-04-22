//
//  GradationView.swift
//  MyApp
//
//  Created by zumi on 2018/04/22.
//  Copyright © 2018年 zumi. All rights reserved.
//

import UIKit

@IBDesignable
class GradationView: UIView {
    var gradationLayer: CAGradientLayer?
    
    @IBInspectable var topColor: UIColor = UIColor.white {
        didSet {
            setGradation()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = UIColor.black {
        didSet {
            setGradation()
        }
    }
    
    func setGradation() {
        gradationLayer?.removeFromSuperlayer()
        gradationLayer = CAGradientLayer()
        gradationLayer!.colors = [topColor.cgColor, bottomColor.cgColor]
        gradationLayer!.frame.size = frame.size
        layer.addSublayer(gradationLayer!)
        layer.masksToBounds = true
    }
}
