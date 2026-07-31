//
//  TaskDisplayViewController.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 23/6/2026.
//

import UIKit

class TaskDisplayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    //MARK: Tableview Functions
    
    var sortby: String = "date"
    
    

    // MARK: INTERFACE Controls
    
    //input
    
    
    @IBOutlet weak var segSortBy: UISegmentedControl!
    
    //Output
    
    @IBOutlet weak var tblDisplay: UITableView!
    
    
    //functions
    
    func alert(message: String, position: Int? = -1) {
        // Alert code
        let alert = UIAlertController(title: "Title goes here", message: "Message goes here", preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "Yes", style: .default) { action in
            //code goes here
        }
        let noButton = UIAlertAction(title: "No", style: .default)
        alert.addAction(yesButton)
        alert.addAction(noButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: TABLEVIEW FUNCTIONS
    /**
     Function: Create number of tableview rows
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
        
    /**
     Function: Create tableview cells to populate data
     */

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //ensure the cell identifier has been labelled "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let taskName: String = tasks[indexPath.row].taskName
        let dueDate: Date = tasks[indexPath.row].dueDate
        let category: String = tasks[indexPath.row].category
        let taskNotes: String = tasks[indexPath.row].taskNote
        
        //display main details from mainDetails() method
        cell.textLabel?.text = String(tasks[indexPath.row].mainDetails())
        
        //display detail text from otherDetails() method
        cell.detailTextLabel?.text = String(tasks[indexPath.row].otherDetails())
        
        return cell
        
    }

    
    /**
     Function: Swipe to delete for tableview cells
     */
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        
//        if editingStyle == .delete {
//        
//            alert(Message: "Are you sure you want to delete this task?", indexPath: IndexPath.row)
//            tasks.remove(at: indexPath.row)
//        
//            //TODO: Remove task fromm class/array
        }
//        
//        tblDisplay.reloadData()
//        
//    }
//    
//    
//    
//    
    
    @IBAction func btnClearAll(_ sender: Any) {
    }
    
    
    @IBAction func btnSort(_ sender: Any) {
        
        var sortBy:String = ""
        
        if segSortBy.selectedSegmentIndex == 0 {
            sortBy = "Category"
        }
        
        // else if input of sorting by due date was slected, then the is will be sorted by due date
        else {
            sortBy = "Due Date"

//            sortValues()
            
        }
    
  }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Tableview set up
        tblDisplay.delegate = self
        tblDisplay.dataSource = self
        
    }
}
