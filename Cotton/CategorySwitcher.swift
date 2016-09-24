//
//  categorySwitcher.swift
//  Cotton
//
//  Created by Michael Blades on 24/09/2016.
//  Copyright © 2016 Masamune. All rights reserved.
//

import UIKit
import SnapKit

class CategorySwitcher: UIButton {

    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        let teeMaskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: ([.topLeft, .bottomRight]), cornerRadii: CGSize(width: 5, height: 5))
        let teemaskLayer = CAShapeLayer()
        teemaskLayer.frame = self.bounds
        teemaskLayer.path = teeMaskPath.cgPath
        
        let teeButton = UIButton()
        teeButton.titleLabel?.text = "TEE"
        teeButton.titleLabel?.adjustsFontSizeToFitWidth = true
        teeButton.layer.mask = teemaskLayer
        teeButton.layer.borderWidth = 3
        teeButton.layer.masksToBounds = true
        teeButton.layer.borderColor = #colorLiteral(red: 0.9568627451, green: 0.3882352941, blue: 0.3254901961, alpha: 1).cgColor
        addSubview(teeButton)
        teeButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(self.snp.left)
            ConstraintMaker.right.equalTo(self.bounds.width / 2)
            ConstraintMaker.top.bottom.equalTo(self.snp.top)
        }
        
        let detailMaskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: ([.topLeft, .bottomRight]), cornerRadii: CGSize(width: 5, height: 5))
        let detailmaskLayer = CAShapeLayer()
        detailmaskLayer.frame = self.bounds
        detailmaskLayer.path = detailMaskPath.cgPath
        
        let detailButton = UIButton()
        detailButton.titleLabel?.text = "DETAIL"
        detailButton.titleLabel?.adjustsFontSizeToFitWidth = true
        detailButton.layer.mask = detailmaskLayer
        detailButton.layer.borderWidth = 3
        detailButton.layer.masksToBounds = true
        detailButton.layer.borderColor = #colorLiteral(red: 0.9568627451, green: 0.3882352941, blue: 0.3254901961, alpha: 1).cgColor
        addSubview(detailButton)
        detailButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(self.snp.right)
            ConstraintMaker.top.bottom.equalTo(self)
            ConstraintMaker.left.equalTo(self.bounds.width / 2)
        }
        
    }

}
