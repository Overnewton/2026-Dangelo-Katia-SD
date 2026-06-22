//
//  CreatingTasksViewController.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 23/6/2026.
//

import UIKit

class CreatingTasksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: INTERFACE CONTROLS
    
    
    //Inputs
    
    @IBOutlet weak var txtName: UITextField!
    
    
    @IBOutlet weak var txtCategory: UITextField!
    
    
    @IBOutlet weak var txtNotes: UITextField!
    
    
   
    @IBOutlet weak var dteDueDate: UIDatePicker!
    
    //Output
    
    @IBOutlet weak var lblValidationMessage: UILabel!
    
    //funtion
    
    
    @IBAction func btnAddTask(_ sender: Any) {
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
