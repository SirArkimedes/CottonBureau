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
    private var daysCount:UILabel!
    private var daysLabel:UILabel!
    private var hoursCount:UILabel!
    private var hoursLabel:UILabel!
    private var minutesCount:UILabel!
    private var minutesLabel:UILabel!
    private var secondsCount:UILabel!
    private var secondsLabel:UILabel!
    
    var days = 0 {
        didSet {
            daysCount.text = "\(days)"
        }
    }
    var hours = 0 {
        didSet {
            hoursCount.text = "\(hours)"
        }
    }
    var minutes = 0 {
        didSet {
            minutesCount.text = "\(minutes)"
        }
    }
    var seconds = 0 {
        didSet {
            secondsCount.text = "\(seconds)"
        }
    }
    
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
        
        backgroundColor = #colorLiteral(red: 0.2683390379, green: 0.2685706615, blue: 0.2683749199, alpha: 1)
        
        // Containers
        let daysContainer = UIView()
        daysContainer.backgroundColor = #colorLiteral(red: 0.1335069537, green: 0.133641988, blue: 0.1335278749, alpha: 1)
        addSubview(daysContainer)
        daysContainer.snp.makeConstraints { make in
            make.top.left.equalTo(self)
            make.right.equalTo(self.snp.centerX).offset(-1)
            make.bottom.equalTo(self.snp.centerY).offset(-1)
        }
        
        let hoursContainer = UIView()
        hoursContainer.backgroundColor = #colorLiteral(red: 0.1335069537, green: 0.133641988, blue: 0.1335278749, alpha: 1)
        addSubview(hoursContainer)
        hoursContainer.snp.makeConstraints { make in
            make.top.right.equalTo(self)
            make.left.equalTo(self.snp.centerX).offset(1)
            make.bottom.equalTo(self.snp.centerY).offset(-1)
        }
        
        let minutesContainer = UIView()
        minutesContainer.backgroundColor = #colorLiteral(red: 0.1335069537, green: 0.133641988, blue: 0.1335278749, alpha: 1)
        addSubview(minutesContainer)
        minutesContainer.snp.makeConstraints { make in
            make.left.bottom.equalTo(self)
            make.right.equalTo(self.snp.centerX).offset(-1)
            make.top.equalTo(self.snp.centerY).offset(1)
        }
        
        let secondsContainer = UIView()
        secondsContainer.backgroundColor = #colorLiteral(red: 0.1335069537, green: 0.133641988, blue: 0.1335278749, alpha: 1)
        addSubview(secondsContainer)
        secondsContainer.snp.makeConstraints { make in
            make.right.bottom.equalTo(self)
            make.left.equalTo(self.snp.centerX).offset(1)
            make.top.equalTo(self.snp.centerY).offset(1)
        }
        
        // Days Counter
        let daysSubContainer = UIView()
        addSubview(daysSubContainer)
        daysSubContainer.snp.makeConstraints { make in
            make.left.right.equalTo(daysContainer)
            make.height.equalTo(60)
            make.center.equalTo(daysContainer)
        }
        
        daysLabel = smallTimeLabel(withTime: "DAYS")
        daysLabel.snp.makeConstraints { make in
            make.left.right.equalTo(daysSubContainer)
            make.bottom.equalTo(daysSubContainer)
        }
        
        daysCount = countLabel()
        daysCount.snp.makeConstraints { make in
            make.left.right.equalTo(daysLabel)
            make.top.equalTo(daysSubContainer)
            make.bottom.equalTo(daysLabel.snp.top)
        }
        
        // Hours Counter
        let hoursSubContainer = UIView()
        addSubview(hoursSubContainer)
        hoursSubContainer.snp.makeConstraints { make in
            make.left.right.equalTo(hoursContainer)
            make.height.equalTo(60)
            make.center.equalTo(hoursContainer)
        }
        
        hoursLabel = smallTimeLabel(withTime: "HOURS")
        hoursLabel.snp.makeConstraints { make in
            make.left.right.equalTo(hoursSubContainer)
            make.bottom.equalTo(hoursSubContainer)
        }
        
        hoursCount = countLabel()
        hoursCount.snp.makeConstraints { make in
            make.left.right.equalTo(hoursLabel)
            make.top.equalTo(hoursSubContainer)
            make.bottom.equalTo(hoursLabel.snp.top)
        }
        
        // Minutes Counter
        let minutesSubContainer = UIView()
        addSubview(minutesSubContainer)
        minutesSubContainer.snp.makeConstraints { make in
            make.left.right.equalTo(minutesContainer)
            make.height.equalTo(60)
            make.center.equalTo(minutesContainer)
        }
        
        minutesLabel = smallTimeLabel(withTime: "MINUTES")
        minutesLabel.snp.makeConstraints { make in
            make.left.right.equalTo(minutesSubContainer)
            make.bottom.equalTo(minutesSubContainer)
        }
        
        minutesCount = countLabel()
        minutesCount.snp.makeConstraints { make in
            make.left.right.equalTo(minutesLabel)
            make.top.equalTo(minutesSubContainer)
            make.bottom.equalTo(minutesLabel.snp.top)
        }
        
        // Seconds Counter
        let secondsSubContainer = UIView()
        addSubview(secondsSubContainer)
        secondsSubContainer.snp.makeConstraints { make in
            make.left.right.equalTo(secondsContainer)
            make.height.equalTo(60)
            make.center.equalTo(secondsContainer)
        }
        
        secondsLabel = smallTimeLabel(withTime: "SECONDS")
        secondsLabel.snp.makeConstraints { make in
            make.left.right.equalTo(secondsSubContainer)
            make.bottom.equalTo(secondsSubContainer)
        }
        
        secondsCount = countLabel()
        secondsCount.snp.makeConstraints { make in
            make.left.right.equalTo(secondsLabel)
            make.top.equalTo(secondsSubContainer)
            make.bottom.equalTo(secondsLabel.snp.top)
        }
        
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
    
    // MARK: - Helpers
    
    private func smallTimeLabel(withTime time: String) -> UILabel {
        
        let label = UILabel()
        label.text = time
        label.font = UIFont(name: "Helvetica Bold", size: 8)
        label.textColor = #colorLiteral(red: 0.9587576985, green: 0.3891591132, blue: 0.3241627216, alpha: 1)
        label.textAlignment = .center
        addSubview(label)
        
        return label
    }
    
    private func countLabel() -> UILabel {
        
        let label = UILabel()
        label.font = UIFont(name: "Helvetica Light", size: 40)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.textAlignment = .center
        addSubview(label)
        
        return label
    }
    
}
