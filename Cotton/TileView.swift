//
//  TileView.swift
//  Cotton
//
//  Created by Andrew Robinson on 10/16/16.
//  Copyright © 2016 Masamune. All rights reserved.
//

import UIKit

enum TileType {
    case CountDownTimer
    case AmountSold
    case AuthorImage
    case AuthorNameAndShare
}

class TileView: UIView {
    
    var type:TileType = .AmountSold {
        didSet {
            if type == .CountDownTimer {
                buildCountDownTimer()
            } else if type == .AmountSold {
                buildAmountSold()
            } else if type == .AuthorImage {
                buildAuthorImage()
            } else if type == .AuthorNameAndShare {
                buildAuthorNameAndShare()
            }
        }
    }
    
    // Count Down Timer
    var days = 0
    var hours = 0
    var minutes = 0
    var seconds = 0
    
    // Amount Sold
    var amountSold = 0
    
    // Author Image
    var authorImage:UIImage!
    
    // Author Name and Share
    var authorName = ""
    var shareTypes:[String] = []
    var location = ""
    
    // MARK: - Build for type
    
    private func buildCountDownTimer() {
    }
    
    private func buildAmountSold() {
        
        backgroundColor = #colorLiteral(red: 0.9587576985, green: 0.3891591132, blue: 0.3241627216, alpha: 1)
        
        let container = UIView()
        addSubview(container)
        container.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.height.equalTo(80)
            make.center.equalTo(self)
        }
        
        let soldLabel = UILabel()
        soldLabel.text = "SOLD"
        soldLabel.font = UIFont(name: "Helvetica Bold", size: 17)
        soldLabel.textColor = #colorLiteral(red: 0.9792070985, green: 0.6960320473, blue: 0.6619004607, alpha: 1)
        soldLabel.textAlignment = .center
        addSubview(soldLabel)
        soldLabel.snp.makeConstraints { make in
            make.left.right.equalTo(container)
            make.bottom.equalTo(container)
        }
        
        let countLabel = UILabel()
        countLabel.text = "\(amountSold)"
        countLabel.font = UIFont(name: "Helvetica Light", size: 55)
        countLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        countLabel.textAlignment = .center
        addSubview(countLabel)
        countLabel.snp.makeConstraints { make in
            make.left.right.equalTo(soldLabel)
            make.top.equalTo(container)
            make.bottom.equalTo(soldLabel.snp.top)
        }
        
    }
    
    private func buildAuthorImage() {
    }
    
    private func buildAuthorNameAndShare() {
    }
    
}
