//
//  ProductDetailViewController.swift
//  Cotton
//
//  Created by Andrew Robinson on 9/23/16.
//  Copyright © 2016 Masamune. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.titleView = UIImageView(image: UIImage(named: "whiteLogoSmall"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
