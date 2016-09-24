//
//  Product.swift
//  Cotton
//
//  Created by Michael Blades on 24/09/2016.
//  Copyright © 2016 Masamune. All rights reserved.
//

import UIKit

class Product: NSObject {
    
    var mainImage:UIImage
    
    var shirtName:String
    
    var authorName:String
    
    init(mainImage:String, shirtName:String, authorName:String, fullSize: Bool = false) {
        if fullSize {
           self.mainImage = UIImage(named: mainImage + "Full")!
        } else {
            self.mainImage = UIImage(named: mainImage)!
        }
        self.shirtName = shirtName
        self.authorName = authorName
    }

}
