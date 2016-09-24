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
        tableData = [
            MyData(mainImage: UIImage(named: "Code")!, shirtName: "Code", authorName: "Daniel Sutton"),
            MyData(mainImage: UIImage(named: "Cubic")!, shirtName: "Cubic", authorName: "Daniel Sutton"),
            MyData(mainImage: UIImage(named: "MacDaddy")!, shirtName: "MacDaddy", authorName: "Daniel Sutton"),
            MyData(mainImage: UIImage(named: "Phoenix")!, shirtName: "Phoenix", authorName: "Daniel Sutton"),
            MyData(mainImage: UIImage(named: "SanFran")!, shirtName: "SanFran", authorName: "Daniel Sutton"),
            MyData(mainImage: UIImage(named: "Solar")!, shirtName: "Solar", authorName: "Daniel Sutton"),
            MyData(mainImage: UIImage(named: "Code")!, shirtName: "Code", authorName: "Daniel Sutton"),
            MyData(mainImage: UIImage(named: "Cubic")!, shirtName: "Cubic", authorName: "Daniel Sutton"),
            MyData(mainImage: UIImage(named: "MacDaddy")!, shirtName: "MacDaddy", authorName: "Daniel Sutton"),
            MyData(mainImage: UIImage(named: "Phoenix")!, shirtName: "Phoenix", authorName: "Daniel Sutton"),
            MyData(mainImage: UIImage(named: "SanFran")!, shirtName: "SanFran", authorName: "Daniel Sutton"),
            MyData(mainImage: UIImage(named: "Solar")!, shirtName: "Solar", authorName: "Daniel Sutton"),
        ]
        // Do any additional setup after loading the view.
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
        cell.shirtName.text = tableData[indexPath.row].shirtName
        cell.authorName.text = "By: " + tableData[indexPath.row].authorName
        // Return our new cell for display
        return cell
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
