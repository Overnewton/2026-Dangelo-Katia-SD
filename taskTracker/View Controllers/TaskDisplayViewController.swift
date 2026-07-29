//
//  TaskDisplayViewController.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 23/6/2026.
//

import UIKit

//class TaskDisplayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
//    
//    //MARK: Tableview Functions
//    
//    /**
//     Function: Create number of tableview rows
//     */
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return tasks.count
//    }
//    
//    
//    /**
//     Function: Create tableview cells to populate data
//     */
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        //ensure the cell identifier has been labelled "cell"
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        //display main details from mainDetails() method
//        cell.textLabel?.text = String(
//            tasks[indexPath.row].mainDetails()
//        )
//
//        //display detail text from otherDetails() method
//        cell.detailTextLabel?.text = String(
//            tasks[indexPath.row].otherDetails()
//        )
//
//        return cell
//        
//    }
//    
//    /**
//     Function: Swipe to delete for tableview cells
//     */
//    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        
//        if editingStyle == .delete {
//            tasks.remove(at: indexPath.row)
//        }
//        
//        tblDisplay.reloadData()
//        
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        
//        //Tableview set up
//        tblDisplay.delegate = self
//        tblDisplay.dataSource = self
//        
//    }
//    // MARK: INTERFACE Controls
//    
//    //input
//    
//    
//    @IBOutlet weak var segSortBy: UISegmentedControl!
//    
//    //Output
//    
//    @IBOutlet weak var tblDisplay: UITableView!
//    
//    
//    //functions
//    
//    
//    
//    
//    
//    @IBAction func btnClearAll(_ sender: Any) {
//    }
//    
//    
//    @IBAction func btnSort(_ sender: Any) {
//        
////        var sortBy:String = ""
////        
////        if segSortBy.selectedSegmentIndex == 0 {
////            sortBy = "Category"
////        }
////        
////        // else if input of sorting by due date was slected, then the is will be sorted by due date
////        else {
////            sortBy = "Due Date"
////
////            
////        }
////    
//  }
//
//}
