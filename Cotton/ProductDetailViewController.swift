//
//  ProductDetailViewController.swift
//  Cotton
//
//  Created by Andrew Robinson on 9/23/16.
//  Copyright © 2016 Masamune. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var shirtImageView: UIImageView!
    @IBOutlet weak var colorSwitcherContainer: UIView!
    
    var product:Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "whiteLogoSmall"))
        
        shirtImageView.image = product.fullImage
        
        // Setup Color switcher
        if product.hasTypes.count % 2 == 0 {
            // even
        } else {
            // Setup the middle button then build the rest behind that
            let midButton = UIButton()
            determineImage(index: product.hasTypes.count / 2, button: midButton)
            colorSwitcherContainer.addSubview(midButton)
            midButton.snp.makeConstraints { make in
                make.height.equalTo(50)
                make.center.equalTo(colorSwitcherContainer)
            }
            
            // Left side
            var previousButton:UIView?
            var i = product.hasTypes.count / 2 - 1
            while i >= 0 {
                
                let button = UIButton()
                determineImage(index: i, button: button)
                colorSwitcherContainer.addSubview(button)
                
                if let prev = previousButton {
                    button.snp.makeConstraints { make in
                        make.top.bottom.equalTo(midButton)
                        make.right.equalTo(prev.snp.left).offset(-15)
                    }
                } else {
                    button.snp.makeConstraints { make in
                        make.top.bottom.equalTo(midButton)
                        make.right.equalTo(midButton.snp.left).offset(-15)
                    }
                }
                previousButton = button
                i -= 1
            }
            previousButton = nil
            
            // Right side
            i = product.hasTypes.count / 2 + 1
            while i <= product.hasTypes.count - 1 {
                
                let button = UIButton()
                determineImage(index: i, button: button)
                
                colorSwitcherContainer.addSubview(button)
                if let prev = previousButton {
                    button.snp.makeConstraints { make in
                        make.top.bottom.equalTo(midButton)
                        make.left.equalTo(prev.snp.right).offset(15)
                    }
                } else {
                    button.snp.makeConstraints { make in
                        make.top.bottom.equalTo(midButton)
                        make.left.equalTo(midButton.snp.right).offset(15)
                    }
                }
                previousButton = button
                i += 1
            }

        }
    }

    // MARK: Helpers
    
    private func determineImage(index value: Int, button: UIButton) {
        switch product.hasTypes[value] {
        case .TNavy:
            button.setImage(UIImage(named: "FullNavy")!, for: .normal)
        case .TBlack:
            button.setImage(UIImage(named: "FullDark")!, for: .normal)
        case .TankIndigo:
            button.setImage(UIImage(named: "TankBlue")!, for: .normal)
        case .TankBlack:
            button.setImage(UIImage(named: "TankBlack")!, for: .normal)
        case .HoodieBlue:
            button.setImage(UIImage(named: "Hoodie")!, for: .normal)
        }
    }

}
