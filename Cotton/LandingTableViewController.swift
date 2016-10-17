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
        self.selectedCellFrame = tableView.convert(tableView.cellForRow(at: indexPath)!.frame, to: tableView.superview)
        
        self.performSegue(withIdentifier: SegueIdentifier.DetailVC.rawValue , sender: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        switch segue.identifier {
//        case SegueIdentifier.DetailVC?.rawValue:
//            let vc = segue.destination as! MainMenuViewController
//            vc.= self.selectedBrand
//            
//            self.navigationController?.delegate = self
//    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
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
        
        return nil
    }


}
