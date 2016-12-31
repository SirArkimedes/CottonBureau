//
//  FAQViewController.swift
//  Cotton
//
//  Created by Michael Blades on 12/28/16.
//  Copyright © 2016 Masamune. All rights reserved.
//

import UIKit

class FAQViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct FAQ {
        let question: String
        let answer: String
    }
    
    @IBOutlet weak var FAQTableView: UITableView!
    
    var types = [FAQ]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        types = [FAQ(question: "Q: I'm new here. What is Cotton Bureau?", answer: "A: Cotton Bureau is a curated online community for high-quality graphic design tees, hoodies, and more. You submit the artwork, and we do the selling, printing, shipping, and customer service...so you don’t have to."),
            FAQ(question: "Q: How do I submit my designs to Cotton Bureau?", answer: "A: Head over to our website, partner. But make sure you read our guidelines before you fire off your artwork (we’re doing all the dirty work, it’s the least you could do)."),
            FAQ(question: "Q: What happens if a design doesn’t make it?", answer: "A: Well, first we get a little sad. But nothing happens. No one gets charged any money, and we don’t print or ship the shirt. Maybe the designer can try again later? You know what they say about “if at first you don’t succeed…”")
        
        
        ]
        
        
        FAQTableView.delegate = self
        FAQTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! FAQTableViewCell
        cell.questionLabel.textColor = #colorLiteral(red: 0.9568627451, green: 0.3882352941, blue: 0.3215686275, alpha: 1)
        cell.questionLabel.font = cell.questionLabel.font.withSize(25)
        cell.questionLabel.text = types[indexPath.row].question
        cell.answerLabel.text = types[indexPath.row].answer	
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
