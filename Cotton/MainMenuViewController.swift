//
//  MainMenuViewController.swift
//  Cotton
//
//  Created by Andrew Robinson on 9/23/16.
//  Copyright © 2016 Masamune. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    struct MyData {
        var mainImage:UIImage
        var shirtName:String
        var authorName:String
    }
    
    var tableData: [MyData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "whiteLogoSmall"))

        tableData = [
            MyData(mainImage: UIImage(named: "Code")!, shirtName: "Code", authorName: "Cat Noone"),
            MyData(mainImage: UIImage(named: "Cubic")!, shirtName: "Cubic", authorName: "Daniel Sutton"),
            MyData(mainImage: UIImage(named: "MacDaddy")!, shirtName: "MacDaddy", authorName: "Lance Jones"),
            MyData(mainImage: UIImage(named: "Phoenix")!, shirtName: "Phoenix", authorName: "Ben Stafford"),
            MyData(mainImage: UIImage(named: "SanFran")!, shirtName: "SanFran", authorName: "The Man and the Mouse"),
            MyData(mainImage: UIImage(named: "Solar")!, shirtName: "Solar", authorName: "Marian Mraz"),
            MyData(mainImage: UIImage(named: "Code")!, shirtName: "Code", authorName: "Cat Noone"),
            MyData(mainImage: UIImage(named: "Cubic")!, shirtName: "Cubic", authorName: "Daniel Sutton"),
            MyData(mainImage: UIImage(named: "MacDaddy")!, shirtName: "MacDaddy", authorName: "Lance Jones"),
            MyData(mainImage: UIImage(named: "Phoenix")!, shirtName: "Phoenix", authorName: "Ben Stafford"),
            MyData(mainImage: UIImage(named: "SanFran")!, shirtName: "SanFran", authorName: "The Man and the Mouse"),
            MyData(mainImage: UIImage(named: "Solar")!, shirtName: "Solar", authorName: "Marian Mraz"),
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! MainCollectionViewCell
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
