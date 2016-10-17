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
            if days == 1 {
                daysLabel.text = "DAY"
            } else {
                daysLabel.text = "DAYS"
            }
            daysCount.text = "\(days)"
        }
    }
    var hours = 0 {
        didSet {
            if hours == 1 {
                hoursLabel.text = "HOUR"
            } else {
                hoursLabel.text = "HOURS"
            }
            hoursCount.text = "\(hours)"
        }
    }
    var minutes = 0 {
        didSet {
            if minutes == 1 {
                minutesLabel.text = "MINUTE"
            } else {
                minutesLabel.text = "MINUTES"
            }
            minutesCount.text = "\(minutes)"
        }
    }
    var seconds = 0 {
        didSet {
            if seconds == 1 {
                secondsLabel.text = "SECOND"
            } else {
                secondsLabel.text = "SECONDS"
            }
            secondsCount.text = "\(seconds)"
        }
    }
    
    // Amount Sold
    private var amountSoldCount:UILabel!
    
    var amountSold = 0 {
        didSet {
            amountSoldCount.text = "\(amountSold)"
        }
    }
    
    // Author Image
    private var authorImageView:UIImageView!
    
    var authorImage:UIImage! {
        didSet {
            authorImageView.image = authorImage
        }
    }
    
    // Author Name and Share
    private var authorLabel:UILabel!
    private var locationLabel:UILabel!
    
    var authorName = "" {
        didSet {
            authorLabel.text = "\(authorName)"
        }
    }
    var shareTypes:[String] = []
    var location = "" {
        didSet {
            locationLabel.text = "\(location)"
        }
    }
    
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
        
        daysLabel = smallTimeLabel()
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
        
        hoursLabel = smallTimeLabel()
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
        
        minutesLabel = smallTimeLabel()
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
        
        secondsLabel = smallTimeLabel()
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
        
        amountSoldCount = UILabel()
        amountSoldCount.font = UIFont(name: "Helvetica Light", size: 55)
        amountSoldCount.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        amountSoldCount.textAlignment = .center
        addSubview(amountSoldCount)
        amountSoldCount.snp.makeConstraints { make in
            make.left.right.equalTo(soldLabel)
            make.top.equalTo(container)
            make.bottom.equalTo(soldLabel.snp.top)
        }
        
    }
    
    private func buildAuthorImage() {
        
        authorImageView = UIImageView()
        addSubview(authorImageView)
        authorImageView.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.top.bottom.equalTo(self)
        }
        
    }
    
    private func buildAuthorNameAndShare() {
        
        backgroundColor = #colorLiteral(red: 0.1335069537, green: 0.133641988, blue: 0.1335278749, alpha: 1)
        
        let textContainer = UIView()
        addSubview(textContainer)
        textContainer.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.center.equalTo(self)
        }
        
        authorLabel = UILabel()
        authorLabel.textColor = #colorLiteral(red: 0.9587576985, green: 0.3891591132, blue: 0.3241627216, alpha: 1)
        authorLabel.font = UIFont(name: "Helvetica", size: 20)
        authorLabel.textAlignment = .center
        authorLabel.numberOfLines = 2
        authorLabel.adjustsFontSizeToFitWidth = true
        textContainer.addSubview(authorLabel)
        authorLabel.snp.makeConstraints { make in
            make.left.equalTo(textContainer).offset(10)
            make.right.equalTo(textContainer).offset(-10)
            make.top.equalTo(textContainer)
        }
        
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.2683390379, green: 0.2685706615, blue: 0.2683749199, alpha: 1)
        textContainer.addSubview(line)
        line.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottom).offset(10)
            make.centerX.equalTo(authorLabel)
            make.height.equalTo(1)
            make.width.equalTo(30)
        }
        
        let socialMedia = UIImageView()
        socialMedia.image = UIImage(named: "subShareLogo")
        textContainer.addSubview(socialMedia)
        socialMedia.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(10)
            make.centerX.equalTo(line)
        }
        
        locationLabel = UILabel()
        locationLabel.font = UIFont(name: "Helvetica Light", size: 10)
        locationLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        locationLabel.textAlignment = .center
        locationLabel.adjustsFontSizeToFitWidth = true
        textContainer.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.left.equalTo(textContainer).offset(10)
            make.right.equalTo(textContainer).offset(-10)
            make.top.equalTo(socialMedia.snp.bottom).offset(10)
            make.bottom.equalTo(textContainer)
        }
        
    }
    
    // MARK: - Helpers
    
    private func smallTimeLabel() -> UILabel {
        
        let label = UILabel()
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
