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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "whiteLogoSmall"))

        tableData = [
            Product(mainImage: UIImage(named: "Code")!, shirtName: "Code", authorName: "Cat Noone"),
            Product(mainImage: UIImage(named: "Cubic")!, shirtName: "Cubic", authorName: "Daniel Sutton"),
            Product(mainImage: UIImage(named: "MacDaddy")!, shirtName: "MacDaddy", authorName: "Lance Jones"),
            Product(mainImage: UIImage(named: "Phoenix")!, shirtName: "Phoenix", authorName: "Ben Stafford"),
            Product(mainImage: UIImage(named: "SanFran")!, shirtName: "SanFran", authorName: "The Man and the Mouse"),
            Product(mainImage: UIImage(named: "Solar")!, shirtName: "Solar", authorName: "Marian Mraz"),
            Product(mainImage: UIImage(named: "Code")!, shirtName: "Code", authorName: "Cat Noone"),
            Product(mainImage: UIImage(named: "Cubic")!, shirtName: "Cubic", authorName: "Daniel Sutton"),
            Product(mainImage: UIImage(named: "MacDaddy")!, shirtName: "MacDaddy", authorName: "Lance Jones"),
            Product(mainImage: UIImage(named: "Phoenix")!, shirtName: "Phoenix", authorName: "Ben Stafford"),
            Product(mainImage: UIImage(named: "SanFran")!, shirtName: "SanFran", authorName: "The Man and the Mouse"),
            Product(mainImage: UIImage(named: "Solar")!, shirtName: "Solar", authorName: "Marian Mraz")
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! DetailCollectionViewCell
        // Set's the labels texts
        cell.mainImageView.image = tableData[indexPath.row].mainImage
        cell.mainImageView.layer.masksToBounds = true
        cell.mainImageView.layer.cornerRadius = 10
        cell.shirtName.text = tableData[indexPath.row].shirtName
        cell.authorName.text = "By: " + tableData[indexPath.row].authorName
        // Return our new cell for display
        return cell
    }

}
