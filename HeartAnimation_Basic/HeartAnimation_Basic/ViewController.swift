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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAdditiveAnimation()
        initiateAnimation()
    }

   
    func heartPath() -> UIBezierPath {
        
        let path =  UIBezierPath(ovalIn: CGRect(x: 120  , y: 120, width: 100, height: 100))
        path.stroke()
        path.fill()
        return path
    }

    func circlePath() -> UIBezierPath {
        
        let path = UIBezierPath(ovalIn: CGRect(x: 10, y: 10, width: 5, height: 5))
        path.stroke()
        path.fill()
        return path
    }

    
    
    func addAdditiveAnimation() {
        
        let heartMovement = CAKeyframeAnimation(keyPath: "position")
        heartMovement.isAdditive = true
        heartMovement.path = heartPath().cgPath
        heartMovement.duration = 5
        heartMovement.repeatCount = HUGE
        heartMovement.calculationMode = "paced"
        self.heartMovement = heartMovement
        
        let circleMovement = CAKeyframeAnimation(keyPath: "position")
        circleMovement.isAdditive = true
        circleMovement.path     = circlePath().cgPath
        circleMovement.duration = 0.275
        circleMovement.repeatCount     = HUGE
        circleMovement.calculationMode = "paced"
        
        self.circleMovement = circleMovement
        
    }
    
    func initiateAnimation() {
        
        let layer = createLayer()
        layer.add(heartMovement, forKey: "heartPathTrace")
        layer.add(circleMovement, forKey: "circleMovement")
        
    }
    
    func createLayer() -> CALayer {
        let layer = CALayer()
        layer.frame = CGRect(x: 10, y: 10, width: 10, height: 10)
        layer.backgroundColor =  UIColor.red.cgColor
        layer.cornerRadius =  5
        self.view.layer.addSublayer(layer)
        
        return layer
    }
    
}

