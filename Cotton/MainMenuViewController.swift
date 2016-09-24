//
//  MainMenuViewController.swift
//  Cotton
//
//  Created by Andrew Robinson on 9/23/16.
//  Copyright © 2016 Masamune. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var tableData: [Product] = []

    @IBOutlet weak var categorySwitcherView: CategorySwitcher!
    @IBOutlet weak var shirtCollectionView: UICollectionView!
    
    fileprivate var toggleFullSize:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "whiteLogoSmall"))
        
        categorySwitcherView.teeButton = {
            self.teeButtonPressed()
        }
        categorySwitcherView.detailButton = {
            self.detailButtonPressed()
        }

        let types:[TypeAndColor] = [.TNavy, .TBlack, .TankIndigo, .TankBlack, .HoodieBlue]
        tableData = [
            Product(detailImage: "Code", shirtName: "Code", authorName: "Cat Noone", hasTypes: types),
            Product(detailImage: "Cubic", shirtName: "Cubic", authorName: "Daniel Sutton", hasTypes: types),
            Product(detailImage: "MacDaddy", shirtName: "MacDaddy", authorName: "Lance Jones", hasTypes: types),
            Product(detailImage: "Phoenix", shirtName: "Phoenix", authorName: "Ben Stafford", hasTypes: types),
            Product(detailImage: "SanFran", shirtName: "SanFran", authorName: "The Man and the Mouse", hasTypes: types),
            Product(detailImage: "Solar", shirtName: "Solar", authorName: "Marian Mraz", hasTypes: types),
            Product(detailImage: "Code", shirtName: "Code", authorName: "Cat Noone", hasTypes: types),
            Product(detailImage: "Cubic", shirtName: "Cubic", authorName: "Daniel Sutton", hasTypes: types),
            Product(detailImage: "MacDaddy", shirtName: "MacDaddy", authorName: "Lance Jones", hasTypes: types),
            Product(detailImage: "Phoenix", shirtName: "Phoenix", authorName: "Ben Stafford", hasTypes: types),
            Product(detailImage: "SanFran", shirtName: "SanFran", authorName: "The Man and the Mouse", hasTypes: types),
            Product(detailImage: "Solar", shirtName: "Solar", authorName: "Marian Mraz", hasTypes: types)
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Collection View Datasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! DetailCollectionViewCell
        // Set's the labels texts
        if toggleFullSize {
            cell.mainImageView.image = tableData[indexPath.row].fullImage
        } else {
            cell.mainImageView.image = tableData[indexPath.row].detailImage
        }
        
        cell.mainImageView.layer.masksToBounds = true
        cell.mainImageView.layer.cornerRadius = 10
        cell.shirtName.text = tableData[indexPath.row].shirtName
        cell.authorName.text = "By: " + tableData[indexPath.row].authorName
        // Return our new cell for display
        return cell
    }
    
    // MARK: - Button Actions
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
        vc.product = tableData[indexPath.row]
        navigationController!.pushViewController(vc, animated: true)
    }

    func teeButtonPressed() {
        if !toggleFullSize {
            toggleFullSize = true
            shirtCollectionView.reloadData()
        }
        
    }
    
    func detailButtonPressed() {
        if toggleFullSize {
            toggleFullSize = false
            shirtCollectionView.reloadData()
        }
        
    }
    
}
