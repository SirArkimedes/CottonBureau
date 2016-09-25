//
//  FatRoundProgressView.swift
//  Cotton
//
//  Created by Andrew Robinson on 9/24/16.
//  Copyright © 2016 Masamune. All rights reserved.
//

import UIKit

class FatRoundProgressView: UIView {
    
    var progressView:UIView!
    
    var progress:CGFloat = 0.0 {
        didSet {
            
            if progress > 1.0 {
                progress = 1.0
            } else if progress < 0.0 {
                progress = 0.0
            }
            
            progressView.frame = CGRect(x: 0, y: 0, width: 0, height: frame.size.height)
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                self.progressView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width * self.progress, height: self.frame.size.height)
                }, completion: nil)
        }
    }
    var trackColor = #colorLiteral(red: 0.9372156262, green: 0.9371131063, blue: 0.9289977551, alpha: 1) {
        didSet {
            backgroundColor = trackColor
        }
    }
    var progressColor = #colorLiteral(red: 0.9535269141, green: 0.3873531818, blue: 0.3249000311, alpha: 1) {
        didSet {
            UIView.animate(withDuration: 0.25, animations: {
                self.progressView.backgroundColor = self.progressColor
            })
        }
    }
    
    init() {
        super.init(frame: .zero)
        build()
    }
    
    init(trackColor: UIColor, progressColor: UIColor) {
        super.init(frame: .zero)
        
        build()
        self.trackColor = trackColor
        self.progressColor = progressColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func build() {
        
        layer.cornerRadius = 5.0
        layer.masksToBounds = true
        backgroundColor = trackColor
        
        progressView = UIView()
        progressView.backgroundColor = self.progressColor
        addSubview(progressView)
    }

}
