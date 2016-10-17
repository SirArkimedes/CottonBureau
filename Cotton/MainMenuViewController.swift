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
        
        categorySwitcherView.tee = {
            self.teeButtonPressed()
        }
        categorySwitcherView.detail = {
            self.detailButtonPressed()
        }

        let types:[TypeAndColor] = [.TNavy, .TBlack, .TankIndigo, .TankBlack, .HoodieBlue, .Detail]
        tableData = [
            Product(detailImage: "Code", shirtName: "Design In Code", authorName: "Cat Noone", authorImage: "DesignInCodeAuthor", authorLocation: "NEW JERSEY", amountPurchased: 16, hasTypes: types),
            Product(detailImage: "Cubic", shirtName: "Cubical", authorName: "Daniel Sutton", authorImage: "CubicalAuthor", authorLocation: "CHARLOTTE, NC", amountPurchased: 10, hasTypes: types),
            Product(detailImage: "MacDaddy", shirtName: "Mac Daddy", authorName: "Lance Jones", authorImage: "MacDaddyAuthor", authorLocation: "DALLAS, TX", amountPurchased: 19, hasTypes: types),
            Product(detailImage: "Phoenix", shirtName: "Rise Again", authorName: "Ben Stafford", authorImage: "RiseAgainAuthor", authorLocation: "COLUMBUS, OH", amountPurchased: 1, hasTypes: types),
            Product(detailImage: "SanFran", shirtName: "San Fransokyo", authorName: "The Man and the Mouse", authorImage: "SanFransokyoAuthor", authorLocation: "CHICAGO, IL", amountPurchased: 166, hasTypes: types),
            Product(detailImage: "Solar", shirtName: "Pale Blue Dot", authorName: "Marian Mraz", authorImage: "PaleBlueDotAuthor", authorLocation: "ZURICH, SWITZERLAND", amountPurchased: 2, hasTypes: types),
            Product(detailImage: "Code", shirtName: "Design In Code", authorName: "Cat Noone", authorImage: "DesignInCodeAuthor", authorLocation: "NEW JERSEY", amountPurchased: 7, hasTypes: types),
            Product(detailImage: "Cubic", shirtName: "Cubical", authorName: "Daniel Sutton", authorImage: "CubicalAuthor", authorLocation: "CHARLOTTE, NC", amountPurchased: 11, hasTypes: types),
            Product(detailImage: "MacDaddy", shirtName: "Mac Daddy", authorName: "Lance Jones", authorImage: "MacDaddyAuthor", authorLocation: "DALLAS, TX", amountPurchased: 15, hasTypes: types),
            Product(detailImage: "Phoenix", shirtName: "Rise Again", authorName: "Ben Stafford", authorImage: "RiseAgainAuthor", authorLocation: "COLUMBUS, OH", amountPurchased: 6, hasTypes: types),
            Product(detailImage: "SanFran", shirtName: "San Fransokyo", authorName: "The Man and the Mouse", authorImage: "SanFransokyoAuthor", authorLocation: "CHICAGO, IL", amountPurchased: 0, hasTypes: types),
            Product(detailImage: "Solar", shirtName: "Pale Blue Dot", authorName: "Marian Mraz", authorImage: "PaleBlueDotAuthor", authorLocation: "ZURICH, SWITZERLAND", amountPurchased: 10, hasTypes: types)
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
