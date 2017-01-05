//
//  ViewController.swift
//  Additive_CABasicAnimation
//
//  Created by ShrawanKumar Sharma on 04/01/17.
//  Copyright © 2017 com.Additive_CABasicAnimation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    func addAdditiveAnimation() {
        
        let basicAnimation  = CABasicAnimation(keyPath: "position.y")
        basicAnimation.fromValue = 200
        basicAnimation.toValue = 0
        basicAnimation.duration = 2.0
        basicAnimation.isAdditive = true
        //basicAnimation.timingFunction =  CAMediaTimingFunction(controlPoints: 05, 0, 05, 1)
        
        
        
    }
    
    func addViewLayer() -> CALayer {
        let layer = CALayer()
        layer.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        layer.backgroundColor = UIColor.red.cgColor
        layer.bounds = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        return layer
        
    }
    
    
    

}

//9546558933
