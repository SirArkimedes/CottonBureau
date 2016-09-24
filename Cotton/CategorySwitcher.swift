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

        let teeButton = UIButton()
        teeButton.titleLabel!.text = "TEE"
        teeButton.titleLabel!.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        teeButton.layer.borderWidth = 3
        teeButton.layer.masksToBounds = true
        teeButton.layer.borderColor = #colorLiteral(red: 0.9568627451, green: 0.3882352941, blue: 0.3254901961, alpha: 1).cgColor
        addSubview(teeButton)
        teeButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(self)
            ConstraintMaker.right.equalTo(self.snp.centerX)
            ConstraintMaker.top.bottom.equalTo(self)
        }
        
        let detailButton = UIButton()
        detailButton.titleLabel!.text = "DETAIL"
        teeButton.layer.borderWidth = 3
        teeButton.layer.masksToBounds = true
        teeButton.layer.borderColor = #colorLiteral(red: 0.9568627451, green: 0.3882352941, blue: 0.3254901961, alpha: 1).cgColor
        addSubview(detailButton)
        detailButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(self)
            ConstraintMaker.top.bottom.equalTo(self)
            ConstraintMaker.left.equalTo(teeButton.snp.right)
        }
        
        layer.borderWidth = 3
        layer.cornerRadius = 5
        layer.masksToBounds = true
        layer.borderColor = #colorLiteral(red: 0.9568627451, green: 0.3882352941, blue: 0.3254901961, alpha: 1).cgColor
        
    }

}
