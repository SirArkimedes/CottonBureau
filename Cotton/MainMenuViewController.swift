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

    @IBOutlet weak var shirtCollectionView: UICollectionView!
    
    fileprivate var toggleFullSize:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "whiteLogoSmall"))

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
        cell.mainImageView.image = tableData[indexPath.row].detailImage
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

    @IBAction func fullSizedButtonPressed(_ sender: AnyObject) {
        if toggleFullSize {
            toggleFullSize = false
        } else {
            toggleFullSize = true
        }

        let types:[TypeAndColor] = [.TNavy, .TBlack, .TankIndigo, .TankBlack, .HoodieBlue]
        tableData = [
            Product(detailImage: "Code", shirtName: "Code", authorName: "Cat Noone", fullSize: toggleFullSize, hasTypes: types),
            Product(detailImage: "Cubic", shirtName: "Cubic", authorName: "Daniel Sutton", fullSize: toggleFullSize, hasTypes: types),
            Product(detailImage: "MacDaddy", shirtName: "MacDaddy", authorName: "Lance Jones", fullSize: toggleFullSize, hasTypes: types),
            Product(detailImage: "Phoenix", shirtName: "Phoenix", authorName: "Ben Stafford", fullSize: toggleFullSize, hasTypes: types),
            Product(detailImage: "SanFran", shirtName: "SanFran", authorName: "The Man and the Mouse", fullSize: toggleFullSize, hasTypes: types),
            Product(detailImage: "Solar", shirtName: "Solar", authorName: "Marian Mraz", fullSize: toggleFullSize, hasTypes: types),
            Product(detailImage: "Code", shirtName: "Code", authorName: "Cat Noone", fullSize: toggleFullSize, hasTypes: types),
            Product(detailImage: "Cubic", shirtName: "Cubic", authorName: "Daniel Sutton", fullSize: toggleFullSize, hasTypes: types),
            Product(detailImage: "MacDaddy", shirtName: "MacDaddy", authorName: "Lance Jones", fullSize: toggleFullSize, hasTypes: types),
            Product(detailImage: "Phoenix", shirtName: "Phoenix", authorName: "Ben Stafford", fullSize: toggleFullSize, hasTypes: types),
            Product(detailImage: "SanFran", shirtName: "SanFran", authorName: "The Man and the Mouse", fullSize: toggleFullSize, hasTypes: types),
            Product(detailImage: "Solar", shirtName: "Solar", authorName: "Marian Mraz", fullSize: toggleFullSize, hasTypes: types)
        ]
        
        shirtCollectionView.reloadData()
    }
    
}
