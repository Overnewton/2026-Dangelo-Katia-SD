//
//  CreatingTasksViewController.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 23/6/2026.
//

import UIKit


//MARK: GLOBAL VARIBALES

// a varible that stores that current date.
let currentDate = Date()




class CreatingTasksViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*
         The following code was created from following a tutorial on youtube. Was used as i was undersure how to use/code a picker on my interfcae
         
         Link to video:
         */
        
        print(" Task view Contorle see: \(TaskManager.shared.categories)" )
        
        pvCategory.dataSource = self
        pvCategory.delegate = self
        
        NotificationCenter.default.addObserver(
                self,
                selector: #selector(categoriesChanged),
                name: Notification.Name("categoriesChanged"),
                object: nil
            )
        
    }
    @objc func categoriesChanged() {
        print("Notification received")
        print("Categories now: \(TaskManager.shared.categories)")

        pvCategory.reloadAllComponents()

        if !TaskManager.shared.categories.isEmpty {
            pvCategory.selectRow(0, inComponent: 0, animated: false)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func refreshCategoryPicker() {
        print("Refreshing picker: \(TaskManager.shared.categories)")

        pvCategory.reloadAllComponents()

        if !TaskManager.shared.categories.isEmpty {
            pvCategory.selectRow(0, inComponent: 0, animated: false)
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        print("Reloaded picker with categories: \(TaskManager.shared.categories)")
//        print("viewWillAppear called")
//        print("Categories: \(TaskManager.shared.categories)")
//
//        
//        pvCategory.reloadAllComponents()
//        
//    }
//
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

       
        print("viewWillAppear")
        print("Categories in Tasks VC: \(TaskManager.shared.categories)")
        print("Categories: \(TaskManager.shared.categories)")

        pvCategory.reloadAllComponents()
    }
    
    //MARK: INTERFACE CONTROLS
    
    
    //Inputs
    
    @IBOutlet weak var txtName: UITextField!
    
    
    @IBOutlet weak var pvCategory: UIPickerView!
    
    
    @IBOutlet weak var txtNotes: UITextField!
    
    
    
    @IBOutlet weak var dteDueDate: UIDatePicker!
    
    //Output
    
    @IBOutlet weak var lblValidationMessage: UILabel!
    
    //funtion
    
    /*
     button function: add task to array
     
     Purpose: When button is pressed, the task is validatyed, then added to array, then message appears to let user know.
     */
    @IBAction func btnAddTask(_ sender: Any) {
        
        
        
        func taskValidation() -> Bool {
            
            // Title existence check
            if txtName.text != "" {
                
                print("Txtname is valid")
                
//                var taskName:String = txtName.text
                
                //date range check. Checks if the date inputted is greater than or equal to current date.
                if dteDueDate.date  >= Date() {
                    
                    print("dteDueDate is valid")
                    
//                    var dueDate:Date = dteDueDate.text
//                    
//                    var taskNote:String = txtNotes.text
//                    
//                    var Category:String = pvCategory.text
//                    
                    
                    lblValidationMessage.text = "All input is good"
                    lblValidationMessage.textColor = .systemGreen
                    
                    return true
                                     
                }
                
                else {
                    lblValidationMessage.textColor = .systemRed
                    lblValidationMessage.text = "Please enter a valid due date"
                    return false
                }
            }
                else {
                    lblValidationMessage.textColor = .systemRed
                    lblValidationMessage.text = "Please enter a task name"
                    return false
                }
            
        }
        
        // calling the above funtion to run
        if taskValidation() == true {
            
            //search function called to see if input already exist with rego and date in array or not
          //                    var searchResponse = linearSearch(array: tasks, searchFor: Task )
          //
          //                    // if the search returned false, then category is to array
          //                    if searchResponse == false {
          //
          //
          //                        //append to the array
          //                        tasks.append(Task)
          //
          //                        print("New task added to array")
          //
          //                        lblValidationMessage.text = ""
          //
          //                    }
          //                    // if the search returned true, then an not added to array and message appears
          //                    else {
          //                        lblValidationMessage.text = "The task already exists with the same title, due date and category."
                              
                              //TODO: Maybe add alert to see if they want to proceed
            
        }
        
    }
}

// TODO: SOUCrE YUOUTUBE USe for picker
/*
 The following code was created from following a tutorial on youtube. Was used as i was undersure how to use/code a picker on my interfcae
 
 Link to video:
 
 However, while the coide base came from youtuve, the change to line 133, 137, 144 was changed and done wihout any externals sources so I can use my varaible array that keeps getting values added or removed to it rather than just have a set constant array like the video. I had to add the count and array name myself.
 */

extension CreatingTasksViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        let count = TaskManager.shared.categories.count
                print("Picker count = \(count)")
                return count
        
//        print("Rows requested")
//
//        return TaskManager.shared.categories.count
    }
}

extension CreatingTasksViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        guard row < TaskManager.shared.categories.count else {
                    return nil
                }

                return TaskManager.shared.categories[row]
            
    }

}
