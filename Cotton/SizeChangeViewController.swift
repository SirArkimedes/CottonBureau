//
//  SizeChangeViewController.swift
//  Cotton
//
//  Created by Andrew Robinson on 12/18/16.
//  Copyright © 2016 Masamune. All rights reserved.
//

// MARK: This was committed on Andrew Robinson's birthday.
// MARK: Happy Birthday to him! 🎂 (He also committed this part too. 😱)

import UIKit

enum Sizes {
    case ExtraSmall
    case Small
    case Medium
    case Large
    case ExtraLarge
    case DoubleLarge
    case TripleLarge
    case QuadrupleLarge
}

class SizeChangeViewController: UIViewController {
    
    private let cellSize:CGFloat = 120.0
    private let cellColors:[UIColor] = [#colorLiteral(red: 0.9587576985, green: 0.3891591132, blue: 0.3241627216, alpha: 1), #colorLiteral(red: 0.8435037923, green: 0.3385226438, blue: 0.2836847006, alpha: 1), #colorLiteral(red: 0.7191483235, green: 0.2886151716, blue: 0.2418618371, alpha: 1), #colorLiteral(red: 0.6488553547, green: 0.2604045555, blue: 0.2182211138, alpha: 1), #colorLiteral(red: 0.5980741048, green: 0.2400245606, blue: 0.201142514, alpha: 1), #colorLiteral(red: 0.5472537922, green: 0.2196288887, blue: 0.1840507768, alpha: 1), #colorLiteral(red: 0.467312386, green: 0.1875460737, blue: 0.1571651195, alpha: 1), #colorLiteral(red: 0.3977616047, green: 0.1596333191, blue: 0.1337740064, alpha: 1)]
    
    // This should be controlled by the shirt.
    var shirtSizes:[Sizes] = [.Small, .Medium, .Large, .ExtraLarge, .DoubleLarge]

    private var container:UIView!
    private var sizeLabel:UILabel!
    
    // MARK: - Awake event
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.clear
                
        container = UIView()
        container.isHidden = true
        container.layer.cornerRadius = 10.0
        container.layer.masksToBounds = true
        container.backgroundColor = UIColor.white
        view.addSubview(container)
        if shirtSizes.count % 2 == 0 {
            container.snp.makeConstraints { make in
                make.center.equalTo(view)
                make.width.equalTo(2 * cellSize)
                make.height.equalTo(CGFloat(shirtSizes.count / 2) * cellSize)
            }
        } else {
            container.snp.makeConstraints { make in
                make.center.equalTo(view)
                make.width.equalTo(2 * cellSize)
                make.height.equalTo(CGFloat(shirtSizes.count / 2 + 1) * cellSize)
            }
        }
        
        sizeLabel = UILabel()
        sizeLabel.isHidden = true
        sizeLabel.text = "Size"
        sizeLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(sizeLabel)
        sizeLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(container).offset(-30)
        }
        
        let evenCell = UIButton()
        evenCell.addTarget(self, action: #selector(sizeSeleted(sender:)), for: .touchUpInside)
        evenCell.backgroundColor = cellColors[0]
        container.addSubview(evenCell)
        evenCell.snp.makeConstraints { make in
            make.left.equalTo(container)
            make.height.width.equalTo(cellSize)
            make.top.equalTo(container)
        }
        
        let evenLabel = UILabel()
        evenLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        evenLabel.text = evaluateTextForSize(size: shirtSizes[0])
        evenLabel.font = UIFont(name: "Helvetica-Light", size: 20)
        evenCell.addSubview(evenLabel)
        evenLabel.snp.makeConstraints { make in
            make.center.equalTo(evenCell)
        }
        
        let oddCell = UIButton()
        oddCell.addTarget(self, action: #selector(sizeSeleted(sender:)), for: .touchUpInside)
        oddCell.backgroundColor = cellColors[1]
        container.addSubview(oddCell)
        oddCell.snp.makeConstraints { make in
            make.right.equalTo(container)
            make.height.width.equalTo(cellSize)
            make.top.equalTo(container)
        }
        
        let oddLabel = UILabel()
        oddLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        oddLabel.text = evaluateTextForSize(size: shirtSizes[1])
        oddLabel.font = UIFont(name: "Helvetica-Light", size: 20)
        oddCell.addSubview(oddLabel)
        oddLabel.snp.makeConstraints { make in
            make.center.equalTo(oddCell)
        }
        
        var previousEvenCellTop = evenCell
        var previousOddCellTop = oddCell
        
        for value in 2...shirtSizes.count - 1 {
            let cell = UIButton()
            cell.addTarget(self, action: #selector(sizeSeleted(sender:)), for: .touchUpInside)
            cell.backgroundColor = cellColors[value]
            container.addSubview(cell)
            if value == shirtSizes.count - 1 && shirtSizes.count % 2 != 0 {
                cell.snp.makeConstraints { make in
                    make.left.right.equalTo(container)
                    make.height.equalTo(cellSize)
                    make.top.equalTo(previousEvenCellTop.snp.bottom)
                }
            } else if value % 2 == 0 {
                cell.snp.makeConstraints { make in
                    make.left.equalTo(container)
                    make.height.width.equalTo(cellSize)
                    make.top.equalTo(previousEvenCellTop.snp.bottom)
                }
                previousEvenCellTop = cell
            } else if value % 2 != 0 {
                cell.snp.makeConstraints { make in
                    make.right.equalTo(container)
                    make.height.width.equalTo(cellSize)
                    make.top.equalTo(previousOddCellTop.snp.bottom)
                }
                previousOddCellTop = cell
            }
            
            let label = UILabel()
            label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            label.text = evaluateTextForSize(size: shirtSizes[value])
            label.font = UIFont(name: "Helvetica-Light", size: 20)
            cell.addSubview(label)
            label.snp.makeConstraints { make in
                make.center.equalTo(cell)
            }
            
        }
        
        let touch = UITapGestureRecognizer(target: self, action: #selector(touched))
        view.addGestureRecognizer(touch)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let previousFrame = container.frame
        let previousLabel = sizeLabel.frame
        container.frame = CGRect(x: -5 * container.frame.origin.x, y: container.frame.origin.y, width: container.frame.size.width, height: container.frame.size.height)
        sizeLabel.frame = CGRect(x: -5 * sizeLabel.frame.origin.x, y: sizeLabel.frame.origin.y, width: sizeLabel.frame.size.width, height: sizeLabel.frame.size.height)
        container.isHidden = false
        sizeLabel.isHidden = false
        
        UIView.animate(withDuration: 0.25, animations: {
            self.view.backgroundColor = #colorLiteral(red: 0.1229882813, green: 0.1229882813, blue: 0.1229882813, alpha: 0.707503146)
            self.container.frame = previousFrame
            self.sizeLabel.frame = previousLabel
        })
    }
    
    // MARK: - Button presses
    
    @objc private func sizeSeleted(sender: UIButton) {
        touched()
    }
    
    // MARK: - Gestures
    
    @objc private func touched() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.backgroundColor = #colorLiteral(red: 0.1229882813, green: 0.1229882813, blue: 0.1229882813, alpha: 0)
            self.container.frame = CGRect(x: -5 * self.container.frame.origin.x, y: self.container.frame.origin.y, width: self.container.frame.size.width, height: self.container.frame.size.height)
            self.sizeLabel.frame = CGRect(x: -5 * self.sizeLabel.frame.origin.x, y: self.sizeLabel.frame.origin.y, width: self.sizeLabel.frame.size.width, height: self.sizeLabel.frame.size.height)
            }, completion: { done in
                self.dismiss(animated: false, completion: nil)
        })
    }
    
    // MARK: - Helpers
    
    private func evaluateTextForSize(size: Sizes) -> String {
        
        var string = ""
        if size == .ExtraSmall {
            string = "XS"
        } else if size == .Small {
            string = "S"
        } else if size == .Medium {
            string = "M"
        } else if size == .Large {
            string = "L"
        } else if size == .ExtraLarge {
            string = "XL"
        } else if size == .DoubleLarge {
            string = "2XL"
        } else if size == .TripleLarge {
            string = "3XL"
        } else if size == .QuadrupleLarge {
            string = "4XL"
        }
        
        return string
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
