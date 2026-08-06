//
//  TaskDisplayViewController.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 23/6/2026.
//

import UIKit

//Gloabl variables

var dueAlerts: [NewTask] = []

class TaskDisplayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    // MARK: INTERFACE Controls
    
    //input
    
    
    @IBOutlet weak var segSortBy: UISegmentedControl!
    
    //Output
    
    @IBOutlet weak var tblDisplay: UITableView!
    
    
    //functions

    //MARK: TABLEVIEW FUNCTIONS
    /*
     Function: Create number of tableview rows
     
     parametrs:
     - _tableView: what UITableView needs searching
     -numberOfRowsInSection: The int of how mnay rows in section found through another func
     
     returns:
     - Int; the number of how mnay tasks are in array
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
        

    /*
       SOURCE: https://chatgpt.com/share/6a6f3102-bda8-83ec-a258-8c47e075f346

       WHY: Wanted my tableview of task to display the task name, note, due date and category as a title coloum. Tried to do it with my own code that i had used with refernce to an exmaple from chat rpeviously, but when tested, it didn;t work

       MODIFIED: copied most code except line 68
     
     */
    
    /*
     Function: Create tableview cells to populate data
     
     parametrs:
     - _tableView: what UITableView needs searching
     -cellForRowAt: the indexPath row to populate
     
     returns:
     - UITableViewCell; trtuns a cell for the tableview
     */

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

           let task = tasks[indexPath.row]

           cell.textLabel?.text = task.mainDetails()

        /*
           SOURCE: https://chatgpt.com/share/6a6f3102-bda8-83ec-a258-8c47e075f346

           WHY: The code it gave me above needed adpatimg for the bit below to work with my classes. I tried a few differnt options relating to both my NewTask and Category but i counl't get it working

           MODIFIED: used code from chat gdp
         
         */
        
           cell.imageView?.image = UIImage(systemName: "circle.fill")?.withTintColor(
            task.category.colour,
               renderingMode: .alwaysOriginal
           )

           return cell

    }
    
    
    /*
     Function:  Swipe to delete for tableview cells
     
     parametrs:
     - _tableView: what UITableView needs searching
     -commit editingStyle: swiping action
     - forRowAt: the index row of tableview that got action happened
     
     */
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //if indexPath row was swiped then delete the indexPath row
        if editingStyle == .delete {
              
            /*
             function: alert to double check
             
             parametrs:
             - message: what the alert says
             - position: where the alert goes
             
             */
            
            alert(message: "Are you sure you want to delete this task?", position: indexPath.row)
            numtasks -= 1
            
            //adapted from other alerts codes i had. If said yes, the posiiton of the tasked swiped to deleted is recorded in which it's indexPath.row is marked as completed and on wht date
            alertCompleted(message: "Have you completed this task?", position: indexPath.row)
            tasks[indexPath.row].isCompleted = true
            tasks[indexPath.row].completedDate = Date()
          }
      }
    
    // funtion: button to clear all tasks displayed and in array
    @IBAction func btnClearAll(_ sender: Any) {
        if tasks.isEmpty {
               alertPopup(message: "There are no tasks to clear")
           } else {
               alert(message: "Are you sure you want to clear all tasks?")
           }
       }
    
    //funtion: button to sort the tableview vased on selcted selectedSegmentIndex
    @IBAction func btnSort(_ sender: Any) {
        
        // ifinput of sorting by due date was slected, then the is will be sorted by due date
        if segSortBy.selectedSegmentIndex == 0 {
            sortBy = "date"
            sortValues()
            tblDisplay.reloadData()
        }
        
        // else if input of sorting by cateogry was slected, then the is will be sorted by cateogry
        else {
            sortBy = "category"
            sortValues()
            tblDisplay.reloadData()
            
        }
    
  }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Tableview set up
        tblDisplay.delegate = self
        tblDisplay.dataSource = self
        
    }
    
    //MARK: ALERTS
    
    /*
     funtion: alert to notify users
     
     peremetres:
     - message: String
     -position: Int
     */
    
    // used other alerts as refernce
    func alert(message: String, position: Int? = nil) {
        
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        
        let yesButton = UIAlertAction(title: "Yes", style: .destructive) { _ in
            
            // If a position was supplied, delete one task
            if let position = position {
                
                guard tasks.indices.contains(position) else {
                    return
                }
                
                tasks.remove(at: position)
                self.tblDisplay.reloadData()
                self.alertPopup(message: "Task deleted successfully")
                
            } else {
                
                // No position means clear all tasks
                tasks.removeAll()
                self.tblDisplay.reloadData()
                self.alertPopup(message: "All tasks cleared successfully")
            }
        }
        
        let noButton = UIAlertAction(title: "No", style: .cancel)
        
        alert.addAction(yesButton)
        alert.addAction(noButton)
        
        present(alert, animated: true)
    }

    /*
     funtion: alert to ask if delted task is complted
     
     peremetres:
     - message: String
     -position: Int
     */
    
    func alertCompleted(message: String, position: Int? = nil) {
        
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        
        //MARK: SOURCE CHAT GDP
        
            let yesAction = UIAlertAction(title: "Yes", style: .default) { _ in

                if let position = position {

                    tasks[position].isCompleted = true
                    tasks[position].completedDate = Date()

                    self.tblDisplay.reloadData()

                    self.alertPopup(
                        message: "Task completed successfully"
                    )
                }
            }

            let noButton = UIAlertAction(
                title: "No",
                style: .cancel
            )

            alert.addAction(yesAction)
            alert.addAction(noButton)

            present(alert, animated: true)
        }

    /**
     Displays a temporary success message.
     */
    func alertPopup(message: String) {
        
        let alert = UIAlertController(
            title: nil,
            message: message,
            preferredStyle: .alert
        )
        
        present(alert, animated: true)
        
        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { _ in
            alert.dismiss(animated: true)
        }
    }
    
    /*
     SOURCE:     https://chatgpt.com/s/t_6a6f45f5c0308191b32360e065d349dc

      WHY: needed help making an alert when using the properiy duedate is close to the cuurent date. Didn;t know how to do. Tried but could get it to work. So asked chat to help fix errors

      MODIFIED: copy the code it said and made some adaptions to my own code for it to work
     */
 
    func alertDue(title: String, message: String) {
        
        let alert = UIAlertController(
            title: "DUE SOON!",
            message: message,
            preferredStyle: .alert
        )
        
        let okayButton = UIAlertAction(
            title: "OK",
            style: .default
        )
        
        alert.addAction(okayButton)
        
        present(alert, animated: true)
    }
    
    func dueSoon() {

        dueAlerts.removeAll()

        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())

        for newTask in tasks {

            let dueDate = calendar.startOfDay(for: newTask.dueDate)

            let daysAmount = calendar.dateComponents(
                [.day],
                from: today,
                to: dueDate
            ).day ?? 0

            if daysAmount == 2 {

                dueAlerts.append(newTask)

                alertDue(
                    title: "Due soon!",
                    message: "You have \(newTask.taskName) due on \(newTask.dueDate)."
                )
            }
        }
    }
}
