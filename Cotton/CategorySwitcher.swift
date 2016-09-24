//
//  categorySwitcher.swift
//  Cotton
//
//  Created by Michael Blades on 24/09/2016.
//  Copyright © 2016 Masamune. All rights reserved.
//

import UIKit

class CategorySwitcher: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: ([.topLeft, .bottomRight]), cornerRadii: CGSize(width: 5, height: 5))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
   
        self.layer.borderWidth = 3
        self.layer.masksToBounds = true
        self.layer.borderColor =  #colorLiteral(red: 0.9568627451, green: 0.3882352941, blue: 0.3254901961, alpha: 1).cgColor
        
    }

}
