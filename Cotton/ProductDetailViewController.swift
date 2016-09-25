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
        
        product.hasTypes.append(.Detail)
        
        // Setup type switcher
        let buttonSpacing = 15.0
        if product.hasTypes.count % 2 == 0 {
            // Setup thw middle two buttons then build the rest
            let leftMidButton = UIButton()
            leftMidButton.addTarget(self, action: #selector(typeButtonPressed(sender:)), for: .touchUpInside)
            leftMidButton.tag = product.hasTypes.count / 2 - 1
            determineImage(index: leftMidButton.tag, button: leftMidButton)
            colorSwitcherContainer.addSubview(leftMidButton)
            leftMidButton.snp.makeConstraints { make in
                make.height.equalTo(50)
                make.width.equalTo(45)
                make.centerY.equalTo(colorSwitcherContainer)
                make.right.equalTo(colorSwitcherContainer.snp.centerX).offset(-buttonSpacing/2.0)
            }
            
            let rightMidButton = UIButton()
            rightMidButton.addTarget(self, action: #selector(typeButtonPressed(sender:)), for: .touchUpInside)
            rightMidButton.tag = product.hasTypes.count / 2
            determineImage(index: rightMidButton.tag, button: rightMidButton)
            colorSwitcherContainer.addSubview(rightMidButton)
            rightMidButton.snp.makeConstraints { make in
                make.height.equalTo(50)
                make.width.equalTo(45)
                make.centerY.equalTo(leftMidButton)
                make.left.equalTo(colorSwitcherContainer.snp.centerX).offset(buttonSpacing/2.0)
            }
            
            // Left side
            var previousButton:UIView?
            var i = product.hasTypes.count / 2 - 2
            while i >= 0 {
                
                let button = UIButton()
                button.addTarget(self, action: #selector(typeButtonPressed(sender:)), for: .touchUpInside)
                button.tag = i
                determineImage(index: button.tag, button: button)
                colorSwitcherContainer.addSubview(button)
                
                if let prev = previousButton {
                    button.snp.makeConstraints { make in
                        make.top.bottom.equalTo(leftMidButton)
                        make.right.equalTo(prev.snp.left).offset(-buttonSpacing)
                        make.width.equalTo(leftMidButton)
                    }
                } else {
                    button.snp.makeConstraints { make in
                        make.top.bottom.equalTo(leftMidButton)
                        make.right.equalTo(leftMidButton.snp.left).offset(-buttonSpacing)
                        make.width.equalTo(leftMidButton)
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
                button.addTarget(self, action: #selector(typeButtonPressed(sender:)), for: .touchUpInside)
                button.tag = i
                determineImage(index: button.tag, button: button)
                colorSwitcherContainer.addSubview(button)
                
                if let prev = previousButton {
                    button.snp.makeConstraints { make in
                        make.top.bottom.equalTo(rightMidButton)
                        make.left.equalTo(prev.snp.right).offset(buttonSpacing)
                        make.width.equalTo(rightMidButton)
                    }
                } else {
                    button.snp.makeConstraints { make in
                        make.top.bottom.equalTo(rightMidButton)
                        make.left.equalTo(rightMidButton.snp.right).offset(buttonSpacing)
                        make.width.equalTo(rightMidButton)
                    }
                }
                previousButton = button
                i += 1
            }
            
        } else {
            // Setup the middle button then build the rest behind that
            let midButton = UIButton()
            midButton.addTarget(self, action: #selector(typeButtonPressed(sender:)), for: .touchUpInside)
            midButton.tag = product.hasTypes.count / 2
            determineImage(index: midButton.tag, button: midButton)
            colorSwitcherContainer.addSubview(midButton)
            midButton.snp.makeConstraints { make in
                make.height.equalTo(50)
                make.width.equalTo(45)
                make.center.equalTo(colorSwitcherContainer)
            }
            
            // Left side
            var previousButton:UIView?
            var i = product.hasTypes.count / 2 - 1
            while i >= 0 {
                
                let button = UIButton()
                button.addTarget(self, action: #selector(typeButtonPressed(sender:)), for: .touchUpInside)
                button.tag = i
                determineImage(index: button.tag, button: button)
                colorSwitcherContainer.addSubview(button)
                
                if let prev = previousButton {
                    button.snp.makeConstraints { make in
                        make.top.bottom.equalTo(midButton)
                        make.right.equalTo(prev.snp.left).offset(-buttonSpacing)
                        make.width.equalTo(midButton)
                    }
                } else {
                    button.snp.makeConstraints { make in
                        make.top.bottom.equalTo(midButton)
                        make.right.equalTo(midButton.snp.left).offset(-buttonSpacing)
                        make.width.equalTo(midButton)
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
                button.addTarget(self, action: #selector(typeButtonPressed(sender:)), for: .touchUpInside)
                button.tag = i
                determineImage(index: button.tag, button: button)
                colorSwitcherContainer.addSubview(button)
                
                if let prev = previousButton {
                    button.snp.makeConstraints { make in
                        make.top.bottom.equalTo(midButton)
                        make.left.equalTo(prev.snp.right).offset(buttonSpacing)
                        make.width.equalTo(midButton)
                    }
                } else {
                    button.snp.makeConstraints { make in
                        make.top.bottom.equalTo(midButton)
                        make.left.equalTo(midButton.snp.right).offset(buttonSpacing)
                        make.width.equalTo(midButton)
                    }
                }
                previousButton = button
                i += 1
            }

        }
    }
    
    // MARK: - Actions
    
    @objc private func typeButtonPressed(sender: UIButton) {
        
    }

    // MARK: - Helpers
    
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
        case .Detail:
            button.setImage(UIImage(named: "Detail"), for: .normal)
        }
    }

}
