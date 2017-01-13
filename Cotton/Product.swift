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
    case Detail
}

class Product: NSObject {
    
    let amountTillPrint:CGFloat = 12.0
    
    var fullImage:UIImage
    var detailImage:UIImage
    var onesieImage:UIImage
    var shirtName:String
    var authorName:String
    var authorImage:UIImage
    var authorLocation:String
    var amountPurchased:CGFloat = 0.0
    
    var hasTypes:[TypeAndColor] = []
    
    init(detailImage:String,
         shirtName:String,
         kidsTee:Bool? = false,
         authorName:String,
         authorImage:String,
         authorLocation:String,
         amountPurchased:CGFloat,
         hasTypes:[TypeAndColor]) {
        
        self.fullImage = UIImage(named: detailImage + "Full")!
        self.detailImage = UIImage(named: detailImage)!
        self.shirtName = shirtName
        if kidsTee! {
            self.onesieImage = UIImage(named: detailImage + "Onesie")!
        } else {
            self.onesieImage = UIImage(named: detailImage)!
        }
        self.authorName = authorName
        self.authorImage = UIImage(named: authorImage)!
        self.authorLocation = authorLocation
        self.amountPurchased = amountPurchased
        self.hasTypes = hasTypes
    }

}
