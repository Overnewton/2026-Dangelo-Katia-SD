//
//  CreatingCategory.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 14/7/2026.
//


// TODO: SOUCE YUOUTUBE USING FOR SEGUES

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
            if searchResponse == false {
                
                //creating variable
                let newCategory: String = txtCategory.text!
                
                //TODO: SORT IN ALBETICAL ORDER for categories
                
                
                //append to the array
                TaskManager.shared.categories.append(newCategory)
                
                print("AFTER APPEND: \(TaskManager.shared.categories)")
                
                print("AFTER APPEND: \(TaskManager.shared.categories)")
                
                NotificationCenter.default.post(
                    name: Notification.Name("categoriesChanged"),
                    object: nil
                )
                
                dismiss(animated: true)
                //                    print("TaskManager address: \(ObjectIdentifier(TaskManager.shared))")
                //                    
                //                    dismiss(animated: true)
                //                    
                //                    print("new category added to array")
                //                    
                //                    print(TaskManager.shared.categories)
                //                    
                //                    print("All categories: \(TaskManager.shared.categories)")
                //                    
                
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
    
//    if binarySearch(array: Int(TaskManager.shared.categories), searchFor: txtCategory.text)
    
    lblCeatingCategoryMessage.text = "\(txtCategory.text!) has been deleted as a category. Here is your updated category list: \(TaskManager.shared.categories)"
    

   
    
    
    
    
}
            
    /*
     button function: deletes all categories in array
     
     Returns:
     - emty array
     -
     */
            
            @IBAction func btnDeleteAll(_ sender: Any) {
                
                txtCategory.text = ""
                lblCeatingCategoryMessage.text = "All categories have been deleted. Please enter new categories"
                
                TaskManager.shared.categories = []
                
                
                
            }
        
   
}
