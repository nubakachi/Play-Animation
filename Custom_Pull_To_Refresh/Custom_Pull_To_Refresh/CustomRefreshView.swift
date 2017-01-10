//
//  CustomRefreshView.swift
//  Custom_Pull_To_Refresh
//
//  Created by ShrawanKumar Sharma on 09/01/17.
//  Copyright © 2017 com.Custom_Pull_To_Refresh. All rights reserved.
//

import UIKit

protocol PassDataDelegateData: class {
    func tracScrollContent(location: UIScrollView)
}



class CustomRefreshView: UIControl {

    
    weak var delegate: PassDataDelegateData?
    
    func containingScrollViewDidEndDragging(scrollView:UIScrollView) {
        print(scrollView.contentOffset.y)
        
        delegate?.tracScrollContent(location: scrollView)
       
        if scrollView.contentOffset.y <= 50 {
            self.sendActions(for: .valueChanged)
        }
    }
    


    override init(frame: CGRect) {
        super.init(frame: frame)

        drawTheDroplet()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func drawTheDroplet() {
        let imageView = UIImageView(image: UIImage(named: "Go.png"))
        addSubview(imageView)
    }
}
