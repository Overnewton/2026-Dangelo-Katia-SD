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
          SOURCE: https://chatgpt.com/share/6a6beb4c-35a4-83ec-8724-ba3a71809efd

          WHY: Needed help to get my picker UI working when a category array is updated on another interface, for the task interfcae tio update and the dispay the updated category array as options.

          MODIFIED:Used the AI class code and juts moved the creation of the array from the creating task categoruies to the class
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
    
    /*
      SOURCE: https://chatgpt.com/share/6a6beb4c-35a4-83ec-8724-ba3a71809efd

      WHY: Needed help to get my picker UI working when a category array is updated on another interface, for the task interfcae tio update and the dispay the updated category array as options.

      MODIFIED:Used the AI class code and juts moved the creation of the array from the creating task categoruies to the class
     */
    
    @objc func categoriesChanged() {
        print("Categories now: \(TaskManager.shared.categories)")

        pvCategory.reloadAllComponents()

        if !TaskManager.shared.categories.isEmpty {
            pvCategory.selectRow(0, inComponent: 0, animated: false)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    /*
      SOURCE: https://chatgpt.com/share/6a6beb4c-35a4-83ec-8724-ba3a71809efd

      WHY: Needed help to get my picker UI working when a category array is updated on another interface, for the task interfcae tio update and the dispay the updated category array as options.

      MODIFIED:Used the AI class code and juts moved the creation of the array from the creating task categoruies to the class
     */
    
    func refreshCategoryPicker() {
        print("Refreshing picker: \(TaskManager.shared.categories)")

        pvCategory.reloadAllComponents()

        if !TaskManager.shared.categories.isEmpty {
            pvCategory.selectRow(0, inComponent: 0, animated: false)
        }
    }
    
    /*
      SOURCE: https://chatgpt.com/share/6a6beb4c-35a4-83ec-8724-ba3a71809efd

      WHY: Needed help to get my picker UI working when a category array is updated on another interface, for the task interfcae tio update and the dispay the updated category array as options.

      MODIFIED:Used the AI class code and juts moved the creation of the array from the creating task categoruies to the class
     */

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

       
        print("viewWillAppear")
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
                
                
                //date range check. Checks if the date inputted is greater than or equal to current date.
                if dteDueDate.date  >= Date() {
                    
                    print("dteDueDate is valid")
                                       
                    
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
        
        //TODO: SOURCE CODE
        
        //Save the date from date picker as a Date type object
        let selectedDate : Date = dteDueDate.date
    
        
        //Stores a number that counts the amount of time between 2 dates as seconds; converts it to an Int for easier calculations
        //This can be used to calculate the amount of days/hours etc later on
        let timeDifference = selectedDate.timeIntervalSince(currentDate)
        
        let timeDiffInt = Int(timeDifference)
        
        
        //OPTION 1: Manually calculate the difference in time by dividing the amount of seconds by 86400 for days
        
        let daysAmount = timeDiffInt / 86400
      
        
       print("Debug for manual time conversion")
        print("The difference in time is:\n \(daysAmount)")
        
    }
}

// TODO: SOUCrE YUOUTUBE USe for picker

/*
  SOURCE:

  WHY: Needed to know how to create a UI picker

  MODIFIED: copyied the instruion to cerate the basic of this code
 */


/*
  SOURCE: https://chatgpt.com/share/6a6beb4c-35a4-83ec-8724-ba3a71809efd

  WHY: Needed help to create mget my picker UI working when a category array is updated on another interface, for the task interfcae tio update and the dispay the updated category array as options.

  MODIFIED:Used the AI class code and juts moved the creation of the array from the creating task categoruies to the class
 */


extension CreatingTasksViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        let count = TaskManager.shared.categories.count
                return count
        
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
