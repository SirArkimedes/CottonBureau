//
//  KidsViewController.swift
//  Cotton
//
//  Created by Michael Blades on 1/11/17.
//  Copyright © 2017 Masamune. All rights reserved.
//

import UIKit

class KidsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
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
            Product(detailImage: "Cat", shirtName: "Cat Face", kidsTee: true, authorName: "Amy Mullen", authorImage: "CatAuthor", authorLocation: "ARLINGTON, VA", amountPurchased: 10, hasTypes: types),
            Product(detailImage: "Cuttle", shirtName: "Wanna Cuttle", kidsTee: true, authorName: "Jay Bryant", authorImage: "CuttleAuthor", authorLocation: "SEATTLE, WA", amountPurchased: 4, hasTypes: types),
            Product(detailImage: "Fox", shirtName: "Sleeping Fox", kidsTee: true, authorName: "Eric", authorImage: "FoxAuthor", authorLocation: "HAWAII", amountPurchased: 6, hasTypes: types),
            Product(detailImage: "LetterA", shirtName: "Letter A", kidsTee: true, authorName: "Katarina Fegraeus", authorImage: "LetterAAuthor", authorLocation: "STOCKHOLM, SWEDEN", amountPurchased: 12, hasTypes: types),
            Product(detailImage: "Skull", shirtName: "Sugar Skull", kidsTee: true, authorName: "Travis Cain", authorImage: "SkullAuthor", authorLocation: "MAPLEWOOD, NJ", amountPurchased: 19, hasTypes: types),
            Product(detailImage: "Webb", shirtName: "Webb Space Telescope", kidsTee: true, authorName: "Brandon Brown", authorImage: "WebbAuthor", authorLocation: "ORLANDO FLORIDA", amountPurchased: 20, hasTypes: types),
            Product(detailImage: "Cat", shirtName: "Cat Face", kidsTee: true, authorName: "Amy Mullen", authorImage: "CatAuthor", authorLocation: "ARLINGTON, VA", amountPurchased: 10, hasTypes: types),
            Product(detailImage: "Cuttle", shirtName: "Wanna Cuttle", kidsTee: true, authorName: "Jay Bryant", authorImage: "CuttleAuthor", authorLocation: "SEATTLE, WA", amountPurchased: 4, hasTypes: types),
            Product(detailImage: "Fox", shirtName: "Sleeping Fox", kidsTee: true, authorName: "Eric", authorImage: "FoxAuthor", authorLocation: "HAWAII", amountPurchased: 6, hasTypes: types),
            Product(detailImage: "LetterA", shirtName: "Letter A", kidsTee: true, authorName: "Katarina Fegraeus", authorImage: "LetterAAuthor", authorLocation: "STOCKHOLM, SWEDEN", amountPurchased: 12, hasTypes: types),
            Product(detailImage: "Skull", shirtName: "Sugar Skull", kidsTee: true, authorName: "Travis Cain", authorImage: "SkullAuthor", authorLocation: "MAPLEWOOD, NJ", amountPurchased: 19, hasTypes: types),
            Product(detailImage: "Webb", shirtName: "Webb Space Telescope", kidsTee: true, authorName: "Brandon Brown", authorImage: "WebbAuthor", authorLocation: "ORLANDO FLORIDA", amountPurchased: 20, hasTypes: types)
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
