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
    
    init(mainImage:UIImage, shirtName:String, authorName:String) {
        self.mainImage = mainImage
        self.shirtName = shirtName
        self.authorName = authorName
    }

}
