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
        var middleLabel:String
    }
    
    var tableData: [MyData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableData = [
            MyData(mainImage: UIImage(named: "Code")!, middleLabel: "Code"),
            MyData(mainImage: UIImage(named: "Cubic")!, middleLabel: "Cubic"),
            MyData(mainImage: UIImage(named: "Code")!, middleLabel: "Code"),
            MyData(mainImage: UIImage(named: "Cubic")!, middleLabel: "Cubic"),
            MyData(mainImage: UIImage(named: "Code")!, middleLabel: "Code"),
            MyData(mainImage: UIImage(named: "Cubic")!, middleLabel: "Cubic"),
            MyData(mainImage: UIImage(named: "Code")!, middleLabel: "Code"),
            MyData(mainImage: UIImage(named: "Cubic")!, middleLabel: "Cubic"),
            MyData(mainImage: UIImage(named: "Cubic")!, middleLabel: "Cubic"),
            MyData(mainImage: UIImage(named: "Code")!, middleLabel: "Code"),
            MyData(mainImage: UIImage(named: "Cubic")!, middleLabel: "Cubic"),
            MyData(mainImage: UIImage(named: "Code")!, middleLabel: "Code")
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
        cell.middleLabel.text = tableData[indexPath.row].middleLabel
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
