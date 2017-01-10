//
//  CustomRefreshControl.swift
//  RefreshViewController
//
//  Created by ShrawanKumar Sharma on 10/01/17.
//  Copyright © 2017 com.RefreshViewController. All rights reserved.
//

import UIKit

class CustomRefreshControl: UIRefreshControl {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame:frame)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
