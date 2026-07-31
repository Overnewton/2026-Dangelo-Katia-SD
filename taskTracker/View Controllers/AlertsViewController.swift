//
//  AlertsViewController.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 23/6/2026.
//

import UIKit

class AlertsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: INTERFACE CONTROLS
    
    //output
    
    
    @IBOutlet weak var tblAlerts: UITableView!
    
    
    @IBOutlet weak var lblMessage: UILabel!
    
    
    //display alert when a task is deteced to be due soon
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
    

}
