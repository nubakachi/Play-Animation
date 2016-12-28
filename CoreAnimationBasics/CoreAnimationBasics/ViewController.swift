//
//  ViewController.swift
//  CoreAnimationBasics
//
//  Created by ShrawanKumar Sharma on 28/12/16.
//  Copyright © 2016 com. CoreAnimationBasics. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var secondRocket: UIImageView!
    
    @IBOutlet weak var groupAnimation: UIImageView!
    var newView:UIView!
//    var newView:UIView  {
//        let newView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        newView.backgroundColor = .yellow
//        return newView
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // addImageToView()
//        animateRocket1()
       // manyRocket()
        
         newView = UIView(frame: CGRect(x: 30, y: 50, width: 50, height: 50))
         newView.backgroundColor = .yellow
         self.view.addSubview(newView)
        timingFunctions()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func addImageToView() {
        rocketImage.image = UIImage(named: "launch.png")
        secondRocket.image = UIImage(named: "launch.png")
    }
    
    
    func animateRocket1() {
       
        //directly attached to model layer
        let basicAnimation = CABasicAnimation(keyPath: "position.y")
       
        basicAnimation.fromValue = self.rocketImage.layer.presentation()?.position
        basicAnimation.toValue = view.frame.size.height
        basicAnimation.duration = 1
        rocketImage.layer.add(basicAnimation, forKey: "basic")
        rocketImage.layer.position = CGPoint(x:rocketImage.frame.origin.x, y:view.frame.size.height)

    }
    
    func animateRocket2() {
        
        let basicAnimation = CABasicAnimation(keyPath: "position.y")
        basicAnimation.fromValue = rocketImage.frame.origin.y
        basicAnimation.duration = 1
        basicAnimation.toValue = self.view.frame.size.height
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        rocketImage.layer.add(basicAnimation, forKey: "basic") //"basic"

    }
    
    func manyRocket() {
        
        let basicAnimation = CABasicAnimation(keyPath: "position.y")
        basicAnimation.byValue = 455
        
        basicAnimation.duration = 5
        
        rocketImage.layer.add(basicAnimation, forKey: "basic")
        rocketImage.layer.position  = CGPoint(x:rocketImage.frame.origin.x, y:view.frame.size.height)
        basicAnimation.beginTime = CACurrentMediaTime() + 0.5
        
        secondRocket.layer.add(basicAnimation, forKey: "basic")
        secondRocket.layer.position =  CGPoint(x:rocketImage.frame.origin.x, y:view.frame.size.height)
    }
    
    
    func animateAroundPath() {
        
        let boudingRect = CGRect(x: self.view.frame.size.width/2 , y: self.view.frame.size.height/2 , width: 100, height: 100)
        
        let path = UIBezierPath(ovalIn: CGRect(x: self.view.frame.size.width/2 , y:  self.view.frame.size.height/2, width: self.view.frame.size.width, height: self.view.frame.size.height) )
        
        
        let path2 = CGPath(ellipseIn: boudingRect, transform: nil)
        
        let orbit = CAKeyframeAnimation(keyPath: "position")
        orbit.path = path2
        
        
        //calculationMode is used for the timing of the plane
        orbit.calculationMode = kCAAnimationPaced
        orbit.duration = 4
        
        orbit.isAdditive = true
        
        orbit.repeatCount = HUGE
        
        //It will in rotation of the image
        orbit.rotationMode =  kCAAnimationRotateAuto
        
        rocketImage.layer.add(orbit, forKey: "orbit")
        
    }
    
    
    //        let rectangle = UIBezierPath(rect: CGRect(x: 20, y: 20, width: 50, height: 50) )
    //        let shapeLayer = CAShapeLayer()
    //        shapeLayer.path = rectangle.cgPath
    //        shapeLayer.strokeColor = UIColor.red.cgColor
    //        shapeLayer.fillColor = UIColor.darkGray.cgColor
    //  self.view.layer.addSublayer(shapeLayer)

    
    func timingFunctions() {
        
        let basicAnimation = CABasicAnimation(keyPath: "position.y")
        basicAnimation.fromValue = 50
        basicAnimation.toValue =  150
        basicAnimation.duration = 1
        basicAnimation.repeatCount = 5
        
        //Timing function in ios
        basicAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

        newView.layer.add(basicAnimation, forKey: nil)
        newView.layer.position = CGPoint(x: self.newView.frame.origin.x  , y: 150)
       
    }
    
    
    
    func GroupAnimation() {
        
        
        
        
        
    }
    
    
    
    
    
    
    
    

}

