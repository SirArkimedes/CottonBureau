//
//  LandingTableViewController.swift
//  Cotton
//
//  Created by Michael Blades on 16/10/2016.
//  Copyright © 2016 Masamune. All rights reserved.
//

import UIKit

enum SegueIdentifier: String {
    case DetailVC = "DetailVC"
}

class LandingTableViewController: UITableViewController, UINavigationControllerDelegate {

    @IBOutlet var landingTableView: UITableView!
    var selectedIndexPath: NSIndexPath?
    
    let transition = ExpandingCellTransition()
     var selectedCellFrame = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCellFrame = tableView.cellForRow(at: indexPath)!.frame
        
        self.performSegue(withIdentifier: SegueIdentifier.DetailVC.rawValue , sender: nil)
        
    }


    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if fromVC == self || toVC == self {
            
            if operation == UINavigationControllerOperation.push {
                transition.operation = UINavigationControllerOperation.push
                transition.duration = 0.40
                transition.selectedCellFrame = self.selectedCellFrame
                
                return transition
            }
            
            if operation == UINavigationControllerOperation.pop {
                transition.operation = UINavigationControllerOperation.pop
                transition.duration = 0.20
                
                return transition
            }
        }
        
        return nil
    }


}
