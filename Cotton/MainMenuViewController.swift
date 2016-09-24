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

        tableData = [
            Product(mainImage: "Code", shirtName: "Code", authorName: "Cat Noone"),
            Product(mainImage: "Cubic", shirtName: "Cubic", authorName: "Daniel Sutton"),
            Product(mainImage: "MacDaddy", shirtName: "MacDaddy", authorName: "Lance Jones"),
            Product(mainImage: "Phoenix", shirtName: "Phoenix", authorName: "Ben Stafford"),
            Product(mainImage: "SanFran", shirtName: "SanFran", authorName: "The Man and the Mouse"),
            Product(mainImage: "Solar", shirtName: "Solar", authorName: "Marian Mraz"),
            Product(mainImage: "Code", shirtName: "Code", authorName: "Cat Noone"),
            Product(mainImage: "Cubic", shirtName: "Cubic", authorName: "Daniel Sutton"),
            Product(mainImage: "MacDaddy", shirtName: "MacDaddy", authorName: "Lance Jones"),
            Product(mainImage: "Phoenix", shirtName: "Phoenix", authorName: "Ben Stafford"),
            Product(mainImage: "SanFran", shirtName: "SanFran", authorName: "The Man and the Mouse"),
            Product(mainImage: "Solar", shirtName: "Solar", authorName: "Marian Mraz")
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "productDetailSegue", sender: nil)
    }

    @IBAction func fullSizedButtonPressed(_ sender: AnyObject) {
        if toggleFullSize {
            toggleFullSize = false
        } else {
            toggleFullSize = true
        }

        tableData = [
            Product(mainImage: "Code", shirtName: "Code", authorName: "Cat Noone", fullSize: toggleFullSize),
            Product(mainImage: "Cubic", shirtName: "Cubic", authorName: "Daniel Sutton", fullSize: toggleFullSize),
            Product(mainImage: "MacDaddy", shirtName: "MacDaddy", authorName: "Lance Jones", fullSize: toggleFullSize),
            Product(mainImage: "Phoenix", shirtName: "Phoenix", authorName: "Ben Stafford", fullSize: toggleFullSize),
            Product(mainImage: "SanFran", shirtName: "SanFran", authorName: "The Man and the Mouse", fullSize: toggleFullSize),
            Product(mainImage: "Solar", shirtName: "Solar", authorName: "Marian Mraz", fullSize: toggleFullSize),
            Product(mainImage: "Code", shirtName: "Code", authorName: "Cat Noone", fullSize: toggleFullSize),
            Product(mainImage: "Cubic", shirtName: "Cubic", authorName: "Daniel Sutton", fullSize: toggleFullSize),
            Product(mainImage: "MacDaddy", shirtName: "MacDaddy", authorName: "Lance Jones", fullSize: toggleFullSize),
            Product(mainImage: "Phoenix", shirtName: "Phoenix", authorName: "Ben Stafford", fullSize: toggleFullSize),
            Product(mainImage: "SanFran", shirtName: "SanFran", authorName: "The Man and the Mouse", fullSize: toggleFullSize),
            Product(mainImage: "Solar", shirtName: "Solar", authorName: "Marian Mraz", fullSize: toggleFullSize)
        ]
        
        shirtCollectionView.reloadData()
    }
    
}
