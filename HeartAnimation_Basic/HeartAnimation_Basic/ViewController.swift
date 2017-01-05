//
//  ViewController.swift
//  HeartAnimation_Basic
//
//  Created by ShrawanKumar Sharma on 05/01/17.
//  Copyright © 2017 com.Additive_HeartAnimation. All rights reserved.
//

import UIKit
import CoreGraphics
class ViewController: UIViewController {

    var heartMovement:CAAnimation!
    var circleMovement:CAAnimation!
    
    var seperateLayer:CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAdditiveAnimation()
        initiateAnimation()
        
        
     }
    
    func heartPath() -> UIBezierPath {
        let path =  UIBezierPath(ovalIn: CGRect(x: 120  , y: 120, width: 100, height: 100))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 1.0
        self.view.layer.addSublayer(shapeLayer)
        return path
    }

    func circlePath() -> UIBezierPath {
        
        let path = UIBezierPath(ovalIn: CGRect(x: 0 , y: 0, width: 5, height: 5))
        return path
    }

    
    
    func addAdditiveAnimation() {
        
        let heartMovement = CAKeyframeAnimation(keyPath: "position")
//        heartMovement.isAdditive = true
        heartMovement.path = heartPath().cgPath
        heartMovement.duration = 5
        heartMovement.repeatCount = HUGE
        heartMovement.calculationMode = kCAAnimationPaced
        heartMovement.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        self.heartMovement = heartMovement
        
        let circleMovement = CAKeyframeAnimation(keyPath: "position")
        circleMovement.isAdditive = true
        circleMovement.path     = circlePath().cgPath
        circleMovement.duration = 0.275
        circleMovement.repeatCount     = HUGE
        circleMovement.calculationMode = kCAAnimationPaced
        self.circleMovement = circleMovement
        
    }
    
    func initiateAnimation() {
        
        let layer = createLayer()
        layer.add(heartMovement, forKey: "heartPathTrace")
        //layer.add(circleMovement, forKey: "circleMovement")
        
     }
    
    func createLayer() -> CALayer {
        let layer = CALayer()
        let image = UIImage(named: "launch.png")

        layer.frame = CGRect(x: 0 , y: 0, width: (image?.size.width)!/5, height: (image?.size.height)!/5)
        layer.position = CGPoint(x: 5, y: 5)
        layer.contents = image?.cgImage
        layer.anchorPoint =  .zero
        layer.backgroundColor =  UIColor.red.cgColor
        //layer.cornerRadius =  5
        self.view.layer.addSublayer(layer)
        return layer
    }
    
}

