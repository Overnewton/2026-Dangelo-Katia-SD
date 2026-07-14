//
//  CreatingTasksViewController.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 23/6/2026.
//

import UIKit

class CreatingTasksViewController: UIViewController {
    
    
    @IBOutlet var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: GLOBAL VARIBALES
    
    let currentDate = Date()
    
    //MARK: INTERFACE CONTROLS
    
    
    //Inputs
    
    @IBOutlet weak var txtName: UITextField!
    
    
    @IBOutlet weak var pvCategory: UIPickerView!
    
    
    @IBOutlet weak var txtNotes: UITextField!
    
    
    
    @IBOutlet weak var dteDueDate: UIDatePicker!
    
    //Output
    
    @IBOutlet weak var lblValidationMessage: UILabel!
    
    //funtion
    
    
    @IBAction func btnAddTask(_ sender: Any) {
        
        
        
        
        //        func validation() -> Bool {
        //
        //        // Title existence check
        //        if txtName.text != "" {
        //
        //            //Category existence check
        //            if txtCategory.text !=  "" {
        //
        //                //date range check. Checks if the date inputted is greater than or equal to current date.
        //                if dteDueDate.date  >= Date() {
        //
        //
        //
        //                    lblValidationMessage.text = "All input is good"
        //                    return true
        //
        //                    //search function called to see if input already exist with rego and date in array or not
        //
        //
        //                }
        //
        //                else {
        //                    lblValidationMessage.textColor = .systemRed
        //                    lblValidationMessage.text = "Please enter a valid due date"
        //                    return false
        //                }
        //            }
        //            else {
        //                lblValidationMessage.textColor = .systemRed
        //                lblValidationMessage.text = "Please enter a category"
        //                return false
        //            }
        //        }
        //        else {
        //            lblValidationMessage.textColor = .systemRed
        //            lblValidationMessage.text = "Please enter a task name"
        //            return false
        //        }
        //    }
        //
        //
        //    if existanceSearch() == true &&   validation() == true {
        //            let name = txtName.text!
        //            let category = txtCategory.text!
        //            let dueDate = dteDueDate.date
        //
        //            let task = Task(name: name, category: category, dueDate: dueDate)
        //
        //            print("new task to be appeneded: \(task)")
        //
        //            //append the new task to the array
        //            tasks.append(task)
        //        }
    }
}
    
    extension CreatingTasksViewController: UIPickerViewDataSource {
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return 10
        }
    }
    
    extension CreatingTasksViewController: UIPickerViewDelegate {
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return "test"
        }
        
    }

