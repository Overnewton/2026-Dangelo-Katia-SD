//
//  CreatingTasksViewController.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 23/6/2026.
//

import UIKit


//MARK: GLOBAL VARIBALES

// a varible that stores that current date.
//Made myselfy by coming up as sugguested from xcode
//data type of data is used as it relates to today's date
let currentDate = Date()

//Integar was choosen as data type because it is being used for mathamatics calulations and will needed to be a whole number as there are no decimal/float days
var daysAmount:Int = 0

class CreatingTasksViewController: UIViewController {
    
    //Varible being created with new possible object
    var newTaskToAdd: NewTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
          SOURCE: https://chatgpt.com/share/6a6beb4c-35a4-83ec-8724-ba3a71809efd

          WHY: Needed help to get my picker UI working when a category array is updated on another interface, for the task interfcae tio update and the dispay the updated category array as options.

          MODIFIED:Used the AI class code and juts moved the creation of the array from the creating task categoruies to the class
         */
        
        //test statement
        print(" Task view Controler see: \(TaskManager.shared.categories)" )
        
        /*
          SOURCE: https://youtu.be/EsheQe6U_WE?si=s7YdURteHmBZj5Sa

          WHY: Used youtube to know how to use a UIPciker as never learnt in class.

          MODIFIED: Copided the pvColour self codes from video
         */
        pvCategory.dataSource = self
        pvCategory.delegate = self
        
        /*
          SOURCE: https://chatgpt.com/share/6a6beb4c-35a4-83ec-8724-ba3a71809efd

          WHY: Needed help to get the the picker on the creating tasks interfcae to update the picker once the user goes back onto the creating tasks interfcae. Couldn't get the code that i had working

          MODIFIED:Copied the code beloew
         */
        
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
    
    
    //funtion to refresh picker when called
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
    
    //funtions
    
    /*
     button function: add task to array
     
     Purpose: When button is pressed, the task is validated, then added to array, then message appears to let user know.
     */
    @IBAction func btnAddTask(_ sender: Any) {
        
        /*
        Purpose: validates input
         
         Returns:
         - Bool: Either true or false depending if vaidation passed or not. Bool was choosen as data type as needed a simple return that can be used with other function to see if valifation passed or not.
         */
        
        func taskValidation() -> Bool {
            
            // Title existence check
            if txtName.text != "" {
                
                //test statement
                print("Txtname is valid")
                
                
                //date range check. Checks if the date inputted is greater than or equal to current date.
                let calendar = Calendar.current

                let today = calendar.startOfDay(for: Date())
                let selectedDate = calendar.startOfDay(for: dteDueDate.date)

                if selectedDate >= today {
                    
                    print("dteDueDate is valid")
                           
                    //message to users leting them know of outcome
                    lblValidationMessage.text = "All input is good"
                    lblValidationMessage.textColor = .systemGreen
                    
                    return true
                                     
                }
                
                else {
                    //message to users leting them know of outcome
                    lblValidationMessage.textColor = .systemRed
                    lblValidationMessage.text = "Please enter a valid due date"
                    return false
                }
            }
                else {
                    //message to users leting them know of outcome
                    lblValidationMessage.textColor = .systemRed
                    lblValidationMessage.text = "Please enter a task name"
                    return false
                }
            
        }
        
        // calling the above funtion to run
        
        // if validation passed by returning true, then new object is created using input, checked to see if already exists in array, then depening on outcome of exience check might be added to task array
        if taskValidation() == true {
            
            if TaskManager.shared.categories.isEmpty {
                
                lblValidationMessage.text = "Please create a category before creating a task."
                lblValidationMessage.textColor = .systemRed
                
                return
            }
            
            // Get the category selected in the picker
                let selectedRow = pvCategory.selectedRow(inComponent: 0)
                let selectedCategory = TaskManager.shared.categories[selectedRow]
            
           // creating new task object
            let newTaskToAdd = NewTask(
                taskName: txtName.text!,
                dueDate: dteDueDate.date,
                taskNote: txtNotes.text ?? "",
                category: selectedCategory,
                isCompleted: false,
                completedDate: nil
            )
            
            //search function called to see if input already exist with rego and date in array or not
            
            /*
             search function called to see if input already exist with rego and date in array or not
             
             parameters:
             - array: The tasks array will be searched
             - searchFor: the newlly created object newTaskToAdd will be searched for
             */
            let searchResponse = linearSearch(array: tasks,searchFor: newTaskToAdd)
          
                              // if the search returned false, then category is added to array
                              if searchResponse == false {
    
                                  //append to the array
                                  tasks.append(newTaskToAdd)
                                      
                                  //test message
                                  print("New task added to array")
          
                                  lblValidationMessage.text = "Task successfully added"
                                  lblValidationMessage.textColor = .systemGreen
          
                              }
            
            // if the search returned true, then newTaskToAdd is not added to array and message appears
            else {
                print("Task alreay exists")
                lblValidationMessage.text = "The task already exists with the same title, due date and category."
                lblValidationMessage.textColor = .systemRed
                
                //TODO: Maybe add alert to see if they want to proceed
            }
        }
        
        /*
          SOURCE: https://teams.microsoft.com/l/message/19:b2cfc417e04e44dc8a7283c6e9750255@thread.tacv2/1785113603815?tenantId=5247a0d7-2146-4f03-b99b-b5ea94415731&groupId=e7af47ec-ab05-49bc-8b03-e98d6089a697&parentMessageId=1785113603815&teamName=2026%20-%20SoftDev&channelName=Resources%2C%20tools%20and%20ideas&createdTime=1785113603815

          WHY: Needed help with using UIDATEpicker and date date type as never used it before

          MODIFIED: Used parts of teacher's code to help me however i adpated and refernced it to fit my own differnet project
         */
        
        //Save the date from date picker as a Date type object. Code was refernced from teachers example
        
        //Date is choosen as data type as the inputt is a date and it needs to stay as a date to do the required caluations
        let selectedDate : Date = dteDueDate.date
    
        
        //Stores a number that counts the amount of time between 2 dates as seconds; converts it to an Int for easier calculations
        //This can be used to calculate the amount of days/hours etc later on
        let timeDifference = selectedDate.timeIntervalSince(currentDate)
        
        //Integar is choosen as the time difference is a number that will be calulcated however, it can be a float as ther can't be a decilam time differnce between days
        let timeDiffInt = Int(timeDifference)
        
        //code divided by 86400 to find the days as the orginal value was in seconds
        // There are 86400 seconds in a day
        let daysAmount = timeDiffInt / 86400
      
        
        //testing statements
       print("Debug for manual time conversion")
        print("The difference in time is:\n \(daysAmount)")
        
    }
}

// TODO: SOUCrE YUOUTUBE USe for picker

/*
  SOURCE: https://youtu.be/EsheQe6U_WE?si=y1iPrlRs6OTmX3LI

  WHY: Needed to know how to create a UI picker

  MODIFIED: copyied the instruions to cerate the basic of this code. Then adapted to fix my need
 */


/*
  SOURCE: https://chatgpt.com/share/6a6beb4c-35a4-83ec-8724-ba3a71809efd

  WHY: Needed help to create mget my picker UI working when a category array is updated on another interface, for the task interfcae tio update and the dispay the updated category array as options.

  MODIFIED:Used the AI class code and juts moved the creation of the array from the creating task categoruies to the class
 */

//extension becuase it is out of class and not defined in class

extension CreatingTasksViewController: UIPickerViewDataSource {
    
    /*
     code to choose how many compoments/rows is needed for picker
     
     Parameters:
     - in pickerView: checking/searching the pickerView
     
     Returns:
     - Int: Number of compented needed
     */
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /*
     code to see how many rows of picker is needed based on number of data in array
     
     Parameters:
     - pickerView: seeing which pickerView to check/search
     -numberOfRowsInComponent: the retuned int of components
     
     Returns:
     - Int: Number of coloums needed for picker
     */
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        let count = TaskManager.shared.categories.count
        
                return count
        
    }
}

//extension becuase it is out of class and not defined in class
extension CreatingTasksViewController: UIPickerViewDelegate {
    
    /*
     code to say what text/data actually goes in picker
     
     Parameters:
     - pickerView: seeing which pickerView to check/search
     -numberOfRowsInComponent: the retuned int of components
     - titleForRow: The retunred Int of the Number of coloums needed
     
     Returns:
     - String: What text goes in the actual picker for user to choose
     */

    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return TaskManager.shared.categories[row].name
    }
}
