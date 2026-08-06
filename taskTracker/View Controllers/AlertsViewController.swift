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
        tblAlerts.reloadData()
    
        // Do any additional setup after loading the view.
    }
    

    //MARK: INTERFACE CONTROLS
    
    //output
    
    
    @IBOutlet weak var tblAlerts: UITableView!
    
    
    @IBOutlet weak var lblMessage: UILabel!
    
    
    /*
    funtion to count how mnay cells is need for tableview
     
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

        cell.textLabel?.text = task.taskName
        cell.detailTextLabel?.text = "\(task.dueDate)"

        return cell
    }
    
}
