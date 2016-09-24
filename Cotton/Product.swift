//
//  Product.swift
//  Cotton
//
//  Created by Michael Blades on 24/09/2016.
//  Copyright © 2016 Masamune. All rights reserved.
//

import UIKit

public enum TypeAndColor {
    case TNavy
    case TBlack
    case TankIndigo
    case TankBlack
    case HoodieBlue
}

class Product: NSObject {
    
    var fullImage:UIImage
    var detailImage:UIImage
    var shirtName:String
    var authorName:String
    
    var hasTypes:[TypeAndColor] = []
    
    init(detailImage:String,
         shirtName:String,
         authorName:String,
         hasTypes:[TypeAndColor]) {
        
        self.fullImage = UIImage(named: detailImage + "Full")!
        self.detailImage = UIImage(named: detailImage)!
        self.shirtName = shirtName
        self.authorName = authorName
        self.hasTypes = hasTypes
    }

}
