//
//  TaskDisplayViewController.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 23/6/2026.
//

import UIKit

class TaskDisplayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // MARK: INTERFACE Controls
    
    //input
    
    
    @IBOutlet weak var segSortBy: UISegmentedControl!
    
    //Output
    
    @IBOutlet weak var tblDisplay: UITableView!
    
    
    //functions
    
    
    @IBAction func btnClearAll(_ sender: Any) {
    }
    
    
    @IBAction func btnSort(_ sender: Any) {
        
//        var sortBy:String = ""
//        
//        if segSortBy.selectedSegmentIndex == 0 {
//            sortBy = "Category"
//        }
//        
//        // else if input of sorting by rego was slected, then the is will be sorted by rego
//        else {
//            sortBy = "Due Date"
//
//            
//        }
//    
  }

}
