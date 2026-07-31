//
//  CreatingCategory.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 14/7/2026.
//


// TODO: SOUCE YUOUTUBE and chat gdp USING FOR SEGUES

import UIKit


class CreatingCategoryViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    
    }
    
    
    
    //MARK: INTERFACE CONTROLS
    
    //Input
    
    @IBOutlet weak var txtCategory: UITextField!
    
    //Output
    
    @IBOutlet weak var lblCeatingCategoryMessage: UILabel!
    
    //Functions
    
    //alert to pop up
    func alertPopUp(message:String) {
        let alert = UIAlertController(title: "Title goes here", message: "Message goes here", preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "Yes", style: .default) { action in
            //code goes here
        }
        let noButton = UIAlertAction(title: "No", style: .default)
        alert.addAction(yesButton)
        alert.addAction(noButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
     button function: add category to array
     
     Returns:
     - When button is pressed, the category is validated, then added to array, then message appears to let user know. Also update the creatingtaskViewController
     */

    
    @IBAction func btnAddCategory(_ sender: Any) {
        
        
        
        /*
         categoryValidation func: validates all values inputted in the new category text filed
         Returns:
         - The category is added to the categories array
         */
        
        func categoryValidation() -> Bool {
            
            // category existence check
            if txtCategory.text != "" {
                
                
                print("Validation of cateogry is good")
                
                return true
                
                
            }
            
            else {
                lblCeatingCategoryMessage.textColor = .systemRed
                lblCeatingCategoryMessage.text = "Please enter a category"
                return false
            }
            
            
        }
        
        
        if categoryValidation() == true {
            
            //search function called to see if input already exist of category inside category array
            let searchResponse = linearSearch(array: TaskManager.shared.categories, searchFor: txtCategory.text!)
            
            // if the search returned false, then category is to array
            if searchResponse <= 0 {
                
                //creating variable
                let newCategory: String = txtCategory.text!
                
                //TODO: SORT IN ALBETICAL ORDER for categories
                
                
                /*
                  SOURCE: https://chatgpt.com/share/6a6beb4c-35a4-83ec-8724-ba3a71809efd

                  WHY: Needed help to get my picker UI working when a category array is updated on another interface, for the task interfcae tio update and the dispay the updated category array as options.

                  MODIFIED:Used the AI class code and juts moved the creation of the array from the creating task categoruies to the class
                 */
                
                //append to the array
                TaskManager.shared.categories.append(newCategory)
                
                print("AFTER APPEND: \(TaskManager.shared.categories)")
                
                // Notify the Tasks screen to update its picker/
                NotificationCenter.default.post(
                    name: Notification.Name("categoriesChanged"),
                    object: nil
                )
                
                // Wait 5 seconds before closing the screen
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        self.dismiss(animated: true)
                    }
                
                lblCeatingCategoryMessage.text = "You have the following categories: \(TaskManager.shared.categories)"
                
            }
            else {
                
                print("No category added to array. Found duplicate")
                
                lblCeatingCategoryMessage.text = "The category you entered already exists. These are all the categories you currently have: \(TaskManager.shared.categories)"
                
            }
            
        }
        
        
    }
            
@IBAction func btnDeleteCategory(_ sender: Any) {
    
    var category = txtCategory.text!
    
    //retunr undex for search to know which to delete
    


    
    lblCeatingCategoryMessage.text = "\(txtCategory.text!) has been deleted as a category. Here is your updated category list: \(TaskManager.shared.categories)"
    

   
    
    
    
    
}
            
    /*
     button function: deletes all categories in array
     
     Returns:
     - emty array
     -
     */
            
            @IBAction func btnDeleteAll(_ sender: Any) {
                
                alertPopUp(message:"Are you sure you want to delete all your categories?")
                
                txtCategory.text = ""
                lblCeatingCategoryMessage.text = "All categories have been deleted. Please enter new categories"
                
                /*
                  SOURCE: https://chatgpt.com/share/6a6beb4c-35a4-83ec-8724-ba3a71809efd

                  WHY: Needed help to get my picker UI working when a category array is updated on another interface, for the task interfcae tio update and the dispay the updated category array as options.

                  MODIFIED:Used the AI class code and juts moved the creation of the array from the creating task categoruies to the class
                 */
                
                //emtey array
                TaskManager.shared.categories = []
                
                // Notify the Tasks screen to update its picker
                   NotificationCenter.default.post(
                       name: Notification.Name("categoriesChanged"),
                       object: nil
                   )
                
                // Wait 5 seconds before closing the screen
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        self.dismiss(animated: true)
                    }
                
            }
        
   
}
