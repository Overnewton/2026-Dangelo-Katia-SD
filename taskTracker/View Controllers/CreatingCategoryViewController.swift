//
//  CreatingCategory.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 14/7/2026.
//


// TODO: SOUCE YUOUTUBE and chat gdp USING FOR SEGUES

import UIKit

/*
  SOURCE: https://youtu.be/EsheQe6U_WE?si=s7YdURteHmBZj5Sa

  WHY: Used youtube to knwo how to use a UIPciker as never learnt in class.

  MODIFIED: Modified their example of their own arrays for the Picker to adapt it for my code's purpose.
 */

//Array is used to store all of the colours the tableview indexField row can do. Used to support UIPICKER code
let colours: [UIColor] = [
    .systemBlue,
    .systemRed,
    .systemGreen,
    .systemOrange,
    .systemPurple,
    .systemCyan,
    .systemPink,
    .systemTeal,
    .systemBrown,
    .systemIndigo,
    .systemYellow
]

//Araay is used to list all the colour options. It it used to support UIPICKER code
let colourNames = [
    "Blue",
    "Red",
    "Green",
    "Orange",
    "Purple",
    "Cyan",
    "Pink",
    "Teal",
    "Brown",
    "Indigo",
    "Yellow"
]


class CreatingCategoryViewController: UIViewController {
    
    
    var selectedColour = UIColor.systemBlue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         SOURCE: https://youtu.be/EsheQe6U_WE?si=s7YdURteHmBZj5Sa
         
         WHY: Used youtube to know how to use a UIPciker as never learnt in class.
         
         MODIFIED: Copided the pvColour self codes from video
         */
        
        pvColour.delegate = self
        pvColour.dataSource = self
        
        
    }
    
    
    
    //MARK: INTERFACE CONTROLS
    
    //Input
    
    @IBOutlet weak var pvColour: UIPickerView!
    @IBOutlet weak var txtCategory: UITextField!
    
    //Output
    
    @IBOutlet weak var lblCeatingCategoryMessage: UILabel!
    
    //MARK: Functions
    
    /*
     alert to pop up on screen. When called, the alert will have a title and message and allow user to either press yes or no to that message
     
     Parameters:
     - title: String of the title requested for alert
     - message: String of the message requested for alert
     
     Returns:
     - When either the yes or no button is pressed, the addAction function is called
     */
    
    
    func alertPopup(title: String, message: String) {
        
            let alert = UIAlertController(
                title: title,
                message: message,
                preferredStyle: .alert
            )
            
            let yesButton = UIAlertAction(
                title: "Yes",
                style: .destructive
            ) { _ in
                
                self.txtCategory.text = ""
                
                self.lblCeatingCategoryMessage.text =
                    "All categories have been deleted. Please enter new categories"
                
                TaskManager.shared.categories.removeAll()
                
                NotificationCenter.default.post(
                    name: Notification.Name("categoriesChanged"),
                    object: nil
                )
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.dismiss(animated: true)
                }
            }
            
            let noButton = UIAlertAction(
                title: "No",
                style: .cancel
            )
            
            alert.addAction(yesButton)
            alert.addAction(noButton)
            
            present(alert, animated: true)
        }
            
        
    
    /*
     Button add function: When add category is presse, the category is validated, then added to array if passes, then creates message to appears to let user know. Also update the creatingtaskViewController
     */
    
    
    @IBAction func btnAddCategory(_ sender: Any) {
        
        /*
         categoryValidation func: validates all values inputted in the new category text filed
         
         Returns:
         - Bool: True or false on if validation was passed.
         */
        
        func categoryValidation() -> Bool {
            
            // category existence check
            if txtCategory.text != "" {
                
                //test message
                print("Validation of cateogry is good")
                
                //if input is not emtpy, then it passes validation
                return true
                
                
            }
            
            else {
                //message is displayed to user letting them know the issue on why validation failed
                lblCeatingCategoryMessage.textColor = .systemRed
                lblCeatingCategoryMessage.text = "Please enter a category"
                return false
            }
            
            
        }
        
        // if statement to search if category already exists, if it passed the validation
        if categoryValidation() == true {
            
            
            // had to edit this line after changing array name/type
            //search function called to see if input already exist of category inside category array
            let searchResponse = linearSearch(array: TaskManager.shared.categories, searchFor: txtCategory.text!)
            
            // if the search returned false, then new object is created in the Category class with both the colour and name the user inputted
            if searchResponse == false {
                
                let newCategory = Category(
                    name: txtCategory.text!,
                    colour: selectedColour
                )
                
                //TODO: SORT IN ALBETICAL ORDER for categories
                //ran out of time
                
                
                /*
                 SOURCE: https://chatgpt.com/share/6a6beb4c-35a4-83ec-8724-ba3a71809efd
                 
                 WHY: Needed help to get my picker UI working when a category array is updated on another interface, for the task interfcae tio update and the dispay the updated category array as options.
                 
                 MODIFIED:Used the AI class code and juts moved the creation of the array from the creating task categoruies to the class. Then I used the new name to replace/update all code calling/using array
                 */
                
                //appending the newly created object to the categories array
                TaskManager.shared.categories.append(newCategory)
                
                
                //testing statemnt to test if the correct thing was being added to array and to also see if the TaskManager.shared.categories was making/being what i wanted.
                print("After adding task to array: \(TaskManager.shared.categories)")
                
                /*
                 SOURCE: https://chatgpt.com/share/6a6beb4c-35a4-83ec-8724-ba3a71809efd
                 
                 WHY: Needed help to get my picker UI working when a category array is updated on another interface, for the task interfcae tio update and the dispay the updated category array as options.
                 
                 MODIFIED:Copied the next lines of code from AI (line 168-177)
                 */
                
                // Notify the creating Tasks view controller screen to update its picker
                NotificationCenter.default.post(
                    name: Notification.Name("categoriesChanged"),
                    object: nil
                )
                
                // code to close view controller after adding new tasks to enusre that the user is going back into the orginal creating tasks view controller and not another one to ensure that the picker updates
                
//                                // Wait 3 seconds before closing the screen
//                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                                        self.dismiss(animated: true)
//                                    }
                
                // Ask user if they want to create another category
                let alert = UIAlertController(
                    title: "Category Added",
                    message: "Would you like to add another category?",
                    preferredStyle: .alert
                )
                
                // YES - stay on this interface
                let yesButton = UIAlertAction(
                    title: "Yes",
                    style: .default
                ) { _ in
                    
                    // Clear text field ready for another category
                    self.txtCategory.text = ""
                }
                
                // NO - close interface after 3 seconds
                let noButton = UIAlertAction(
                    title: "No",
                    style: .cancel
                ) { _ in
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.dismiss(animated: true)
                    }
                }
                
                alert.addAction(yesButton)
                alert.addAction(noButton)
                
                present(alert, animated: true)
                
                let categoryNames = TaskManager.shared.categories.map { $0.name }
                
                //message to be displayed to user letting them know of outcome
                lblCeatingCategoryMessage.text =
                "The category you entered already exists. These are all the categories you currently have: \(categoryNames)"
                
                
            }
            else {
                //testing
                print("No category added to array. Found duplicate")
                
                //message to be displayed to user letting them know of outcome
                lblCeatingCategoryMessage.text = "The category you entered already exists. These are all the categories you currently have: \(TaskManager.shared.categories)"
                
            }
            
        }
        
        
    }
    
    /*
     Function: Button for delete one category. The vcategory that the user types in the textfiled, will be deleted from array and  display a message to user.
     */
    
    
    @IBAction func btnDeleteCategory(_ sender: Any) {
        
        
        // existance check to see if a category was entered in the text feild
        if txtCategory.text != "" {
            
            //data type check
            if String(txtCategory.text!) != nil {
                
                let categoryToDelete = txtCategory.text!
                
                
                /*
                 SOURCE: https://chatgpt.com/s/t_6a6f433a4fd08191bafbb34891b065b8
                 
                 WHY: Needed help with deleting the category thr user has typed. Tried getting help from teacher and creating own method bsed on his advice but didn;t work. So in asked chat gdp to adapt my code i wrote to correctly work.
                 
                 MODIFIED:Copied line 228 and 229 and then added/ adpated my own code
                 */
                
                
                // Find the the inputted category's index in the array so we now what index to delete
                if let categoryIndex = TaskManager.shared.categories.firstIndex(
                    where: { $0.name.lowercased() == categoryToDelete.lowercased() }
                ) {
                    
                    // Delete the category at that index found
                    TaskManager.shared.categories.remove(at: categoryIndex)
                    
                    let categoryNames = TaskManager.shared.categories.map { $0.name }
                    
                    //messages displayed to user letting them know of progress
                    lblCeatingCategoryMessage.textColor = .systemGreen
                    lblCeatingCategoryMessage.text =
                    "\(categoryToDelete) has been deleted. Here is your updated categories: \(categoryNames)"
                    
                    
                    //clearing input feild
                    txtCategory.text = ""
                    
                    /*
                     SOURCE: https://chatgpt.com/s/t_6a6f433a4fd08191bafbb34891b065b8
                     
                     WHY: Needed help with deleting the category thr user has typed. Tried getting help from teacher and creating own method bsed on his advice but didn;t work. So in asked chat gdp to adapt my code i wrote to correctly work.
                     
                     MODIFIED:Copied line 251 to 254 and then added/ adpated my own code
                     */
                    
                    
                    // Tell the picker to reload
                    NotificationCenter.default.post(
                        name: Notification.Name("categoriesChanged"),
                        object: nil
                    )
                    
                    
                } else {
                    
                    lblCeatingCategoryMessage.textColor = .systemRed
                    lblCeatingCategoryMessage.text =
                    "\(categoryToDelete) was not found. Here are your current categories: \(TaskManager.shared.categories)"
                }
                
            }
            
            else {
                lblCeatingCategoryMessage.textColor = .systemRed
                lblCeatingCategoryMessage.text = "Please enter a category to delete."
            }
        }
        
        else {
            lblCeatingCategoryMessage.textColor = .systemRed
            lblCeatingCategoryMessage.text = "Please enter a category to delete."
        }
        
    }
    
    /*
     button function: check to see if user actually meant to press the button and is so, it then deletes all categories in array
     
     Returns:
     - empty array
     */
    
    @IBAction func btnDeleteAll(_ sender: Any) {
        
       
        /*
         SOURCE: https://chatgpt.com/share/6a6beb4c-35a4-83ec-8724-ba3a71809efd
         
         WHY: Needed help to get my picker UI working when a category array is updated on another interface, for the task interfcae tio update and the dispay the updated category array as options.
         
         MODIFIED:Used the AI class code and juts moved the creation of the array from the creating task categoruies to the class
         */
        
        alertPopup(
             title: "Request to delete all categories",
             message: "Are you sure you want to delete all your categories?"
         )
    }
    
}


/*
  SOURCE: https://chatgpt.com/share/6a6beb4c-35a4-83ec-8724-ba3a71809efd

  WHY: Needed help to get my picker UI working when a category array is updated on another interface, for the task interfcae tio update and the dispay the updated category array as options.

  MODIFIED:Used the AI class code and juts moved the creation of the array from the creating task categoruies to the class
 */

/*
  SOURCE: https://youtu.be/EsheQe6U_WE?si=s7YdURteHmBZj5Sa

  WHY: Used youtube to knwo how to use a UIPciker as never learnt in class.

  MODIFIED: Modified their example of their own arrays for the Picker to adapt it for my code's purpose.
 */


//MARK: UIPicker CODE

//extension becuase it is out of class and not defined in class

extension CreatingCategoryViewController: UIPickerViewDataSource {
    
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
    
    //code to increase hieght
    func pickerView(
        _ pickerView: UIPickerView,
        rowHeightForComponent component: Int
    ) -> CGFloat {
        
        return 50
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
        
        let count = colours.count
                return count
        
    }
}

//extension becuase it is out of class and not defined in class

extension CreatingCategoryViewController: UIPickerViewDelegate {
    
    //code to state what will display in picker
    
    func pickerView(_ pickerView: UIPickerView,didSelectRow row: Int, inComponent component: Int) {
        
        /*
          SOURCE:

          WHY: needed chat gdps help make the picker connect to the colour choosen for category.
          MODIFIED: Used line 346
         */
        
        selectedColour = colours[row]
    }
    
    /*
     code to say what text/data actually goes in picker
     
     Parameters:
     - pickerView: seeing which pickerView to check/search
     -numberOfRowsInComponent: the retuned int of components
     - titleForRow: The retunred Int of the Number of coloums needed
     
     Returns:
     - String: What text goes in the actual picker for user to choose
     */
    func pickerView(
        _ pickerView: UIPickerView,
        viewForRow row: Int,
        forComponent component: Int,
        reusing view: UIView?
    ) -> UIView {

        let rowView = UIView()

        // coloured circle
        let colourCircle = UIView()
        colourCircle.backgroundColor = colours[row]

        colourCircle.frame = CGRect(
            x: 20,
            y: 8,
            width: 25,
            height: 25
        )

        colourCircle.layer.cornerRadius = 12.5

        // colour name
        let colourLabel = UILabel()

        colourLabel.frame = CGRect(
            x: 60,
            y: 0,
            width: 150,
            height: 40
        )

        colourLabel.text = colourNames[row]

        rowView.addSubview(colourCircle)
        rowView.addSubview(colourLabel)

        return rowView
    }
}
