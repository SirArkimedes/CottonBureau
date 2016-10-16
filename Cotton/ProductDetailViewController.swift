//
//  ProductDetailViewController.swift
//  Cotton
//
//  Created by Andrew Robinson on 9/23/16.
//  Copyright © 2016 Masamune. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    var product:Product!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var shirtImageView: UIImageView!
    @IBOutlet weak var colorSwitcherContainer: UIView!
    @IBOutlet weak var shirtNameLabel: UILabel!
    @IBOutlet weak var progressViewContainer: UIView!
    
    @IBOutlet weak var amountSoldCount: UILabel!
    @IBOutlet weak var amountSoldLabel: UILabel!
    @IBOutlet weak var amountToGoCount: UILabel!
    @IBOutlet weak var amountToGoLabel: UILabel!
    @IBOutlet weak var daysLeftCount: UILabel!
    @IBOutlet weak var daysLeftLabel: UILabel!
    
    @IBOutlet weak var daysLeftLeftConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var amountSoldTile: TileView!
    
    private var progressBar:FatRoundProgressView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "whiteLogoSmall"))
        
        shirtImageView.image = product.fullImage
        
        // Setup type switcher
        createTypeSelector()
        
        shirtNameLabel.text = product.shirtName
        
        // Progress Bar
        progressBar = FatRoundProgressView()
        progressViewContainer.addSubview(progressBar)
        progressBar.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(progressViewContainer)
        }
        
        // Amount sold - Amount to go - Days Left
        amountSoldCount.text = "\(Int(product.amountPurchased))"
        if product.amountPurchased >= 12.0 {
            amountToGoCount.isHidden = true
            amountToGoLabel.isHidden = true
            
            // Redo the constraints to move the label over to the amount sold label.
            let constraintConstant = daysLeftLeftConstraint.constant
            daysLeftLeftConstraint.isActive = false
            daysLeftCount.snp.makeConstraints { make in
                make.left.equalTo(amountSoldLabel.snp.right).offset(constraintConstant)
            }
        } else {
            amountToGoCount.text = "\(12 - Int(product.amountPurchased))"
        }
        daysLeftCount.text = "5"
        
        amountSoldTile.amountSold = Int(product.amountPurchased)
        amountSoldTile.type = .AmountSold
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        progressBar.progress = product.amountPurchased / product.amountTillPrint
    }
    
    // MARK: - Creation
    
    private func createTypeSelector() {
        let buttonSpacing = 15.0
        let typeBoxSize = 35.0
        if product.hasTypes.count % 2 == 0 {
            // Setup the middle two buttons then build the rest
            let leftMidButton = UIButton()
            leftMidButton.contentMode = .scaleAspectFit
            leftMidButton.addTarget(self, action: #selector(typeButtonPressed(sender:)), for: .touchUpInside)
            leftMidButton.tag = product.hasTypes.count / 2 - 1
            determineImage(index: leftMidButton.tag, button: leftMidButton)
            colorSwitcherContainer.addSubview(leftMidButton)
            leftMidButton.snp.makeConstraints { make in
                make.height.width.equalTo(typeBoxSize)
                make.centerY.equalTo(colorSwitcherContainer)
                make.right.equalTo(colorSwitcherContainer.snp.centerX).offset(-buttonSpacing/2.0)
            }
            
            let rightMidButton = UIButton()
            rightMidButton.contentMode = .scaleAspectFit
            rightMidButton.addTarget(self, action: #selector(typeButtonPressed(sender:)), for: .touchUpInside)
            rightMidButton.tag = product.hasTypes.count / 2
            determineImage(index: rightMidButton.tag, button: rightMidButton)
            colorSwitcherContainer.addSubview(rightMidButton)
            rightMidButton.snp.makeConstraints { make in
                make.height.width.equalTo(typeBoxSize)
                make.centerY.equalTo(leftMidButton)
                make.left.equalTo(colorSwitcherContainer.snp.centerX).offset(buttonSpacing/2.0)
            }
            
            // Left side
            var previousButton:UIView?
            var i = product.hasTypes.count / 2 - 2
            while i >= 0 {
                
                let button = UIButton()
                button.contentMode = .scaleAspectFit
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
                button.contentMode = .scaleAspectFit
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
            midButton.contentMode = .scaleAspectFit
            midButton.addTarget(self, action: #selector(typeButtonPressed(sender:)), for: .touchUpInside)
            midButton.tag = product.hasTypes.count / 2
            determineImage(index: midButton.tag, button: midButton)
            colorSwitcherContainer.addSubview(midButton)
            midButton.snp.makeConstraints { make in
                make.height.width.equalTo(typeBoxSize)
                make.center.equalTo(colorSwitcherContainer)
            }
            
            // Left side
            var previousButton:UIView?
            var i = product.hasTypes.count / 2 - 1
            while i >= 0 {
                
                let button = UIButton()
                button.contentMode = .scaleAspectFit
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
                button.contentMode = .scaleAspectFit
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
        if sender.tag == product.hasTypes.count - 1 {
            UIView.transition(with: shirtImageView, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.shirtImageView.image = self.product.detailImage
                }, completion: nil)
        } else {
            UIView.transition(with: shirtImageView, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.shirtImageView.image = UIImage(named: "SanFranFull")!
                }, completion: nil)
        }
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
        default:
            button.setImage(UIImage(named: "Detail"), for: .normal)
        }
    }

}
