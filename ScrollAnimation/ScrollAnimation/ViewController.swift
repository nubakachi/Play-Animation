//
//  ViewController.swift
//  ScrollAnimation
//
//  Created by ShrawanKumar Sharma on 04/01/17.
//  Copyright © 2017 com.ScrollAnimation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //var scrollLayer:CAScrollLayer!
    var translation: CGFloat = 0.0

    var moveUp : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCloudLayerToView()
        
        addCarToView()
        
        displayLink.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)

    }


    lazy var scrollLayer:CAScrollLayer = {
        var scrollLayer = CAScrollLayer()
//        scrollLayer.bounds = CGRect(x: 0, y: 0, width: 150, height: 300)
        scrollLayer.bounds = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.size.width, height:self.view.bounds.size.height) // 9

        scrollLayer.position = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2)
        scrollLayer.borderColor = UIColor.brown.cgColor
        scrollLayer.borderWidth = 2.0
        scrollLayer.scrollMode = kCAScrollHorizontally
        return scrollLayer
    }()
    
    func addCloudLayerToView() {
        let skyImage = UIImage(named: "sky.png")
        let size = skyImage?.size
        let layer = CALayer()
        layer.bounds = CGRect(x: 0, y: 0, width:(size?.width)! , height:(size?.height)! )
        layer.position  = CGPoint(x: (size?.width)!/2, y: (size?.height)!/2)
        layer.contents = skyImage?.cgImage
        self.view.layer.addSublayer(scrollLayer)
        scrollLayer.addSublayer(layer)
    }


    lazy var displayLink: CADisplayLink = {
        let displayLink = CADisplayLink(target: self, selector: #selector(ViewController.scrollLayerScroll))
//        displayLink.frameInterval = 10
        displayLink.preferredFramesPerSecond = 10
        return displayLink
    }()
    
    
    func scrollLayerScroll() {
        let newPoint = CGPoint(x: translation, y: 0.0)
        scrollLayer.scroll(newPoint)
        translation += 10.0
        if translation > 1500 {
            stopDisplayLink()
        }
        
        if (moveUp != false) {
            scrollLayerTop.scroll(to: CGPoint(x: 0.0, y: 10))
            moveUp = false
        } else {
            scrollLayerTop.scroll(to: CGPoint(x: 0.0, y: -10.0))
            moveUp = true
        }
        
    }
    
    func stopDisplayLink() {
        displayLink.invalidate()
    }
    
    
    //MARK:- ADD THE CAR ANIMATION 
    
    func addCarToView() {
        
        let imageattTop = UIImage(named: "car.png")
        let size = imageattTop?.size
        let layer = CALayer()
        layer.bounds = CGRect(x:  0 , y:  0, width: (size?.width)!, height: (size?.height)!)
        layer.position = CGPoint(x: (size?.width)!/2, y: (size?.height)!/2)
        layer.contents = imageattTop?.cgImage
        self.view.layer.addSublayer(scrollLayerTop)
        scrollLayerTop.addSublayer(layer)
    }
    
    
    
    lazy var scrollLayerTop:CAScrollLayer = {
        var scrollLayer = CAScrollLayer()
        // scrollLayer.bounds = CGRect(x: 0, y: 0, width: 150, height: 300)
        scrollLayer.bounds = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.size.width, height:self.view.bounds.size.height) // 9
        scrollLayer.position = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2)
        scrollLayer.borderColor = UIColor.brown.cgColor
        scrollLayer.borderWidth = 2.0
        scrollLayer.scrollMode = kCAScrollVertically
        return scrollLayer
    }()

    

    
    
    
}

