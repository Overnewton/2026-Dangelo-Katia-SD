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
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
