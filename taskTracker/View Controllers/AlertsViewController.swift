//
//  AlertsViewController.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 23/6/2026.
//

import UIKit

class AlertsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblAlerts.delegate = self
        tblAlerts.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tblAlerts.reloadData()
    }
    

    //MARK: INTERFACE CONTROLS
    
    //output
    
    
    @IBOutlet weak var tblAlerts: UITableView!
    
    
    @IBOutlet weak var lblMessage: UILabel!
    
    
    /*
    funtion to count hoe mnay cells is need for tableview
     
     Parameters:
     - _ tableView: UITableView is getting used
     - numberOfRowsInSection section: Int of number of rows from preivous func
     
     Returns:
     - Int of how many reminder due alerts
     */

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dueAlerts.count
        
    }
    
    
    /*
      SOURCE:   https://chatgpt.com/s/t_6a6f36d7813c8191b40a55c83336945b

      WHY: Needed chats help to edit my tableview code as i tried myslef but it kept getting errors. i NEEDED MY tableview to display an alert made in another view controller and din't know how to do that.

      MODIFIED:Used the AI code of 'let cell' and lines 56-59
     */
    
    // used other exmaples in this design/app to base this one off
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let task = dueAlerts[indexPath.row]

        // Format date in Australian format
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_AU")
        dateFormatter.dateFormat = "dd MMMM yyyy"

        let formattedDate = dateFormatter.string(from: task.dueDate)

        // Display everything on one line
        cell.textLabel?.text = "\(task.taskName) due on \(formattedDate)"

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
       
            
        if editingStyle == .delete {
               
               dueAlerts.remove(at: indexPath.row)
               
               tableView.reloadData()
           }
       }
            

}
