
//class of tasks

import Foundation
import UIKit

//TODO: JASON FILE


// An array that holds the tasks
// an array was choosen as the data type as many all the new objects will be stored there
var tasks: [NewTask] = []

//String was choosen as data type as declaring the typoe of sort by is a word
var sortBy: String = "date"

/*
Task:
  A task that is created for the task list for a user.
  All tasks are associated with its added features are saved/loaded from a json file from `taskList` array.

Properties/Parameters:

taskName: String - Holds the namde of the task
dueDate: Date - Holds the date of the task
taskNote: Sting - Holds the note of the task
category: Category class - Holds the category of the task
 isCompleted: Bool -
 completedDate: Date? -
 
 
 Methods:
 - mainDetails() -> String    -retunrs the main details of
 - otherDetails() -> String - retuns the other details of the
 
*/

public class NewTask {
    //public access modifers choosen for data members as they need to be able to be accessed and modified from anywhere in the app
    public var taskName: String
    public var dueDate: Date
    public var taskNote: String
    public var category: Category
    
    
    /*
      SOURCE:

      WHY: Needed help to make the the compleded task per week and day varaibles to display on homepage. I could only get it caluations/number from tasks that day not the week.
     
      MODIFIED:copied line 55-56 code from chat
     */
    
    //public access modifers choosen for data members as they need to be able to be accessed and modified from anywhere in the app
    public var isCompleted: Bool
    public var completedDate: Date?

    
    /*
     Initialiser for a Task object
     
     Parameters:
     - taskName: The name of the task. Given as a string
     - dueDate: The due date of the task to be completed. Is given in the format of ... from given by a date picker selection
     - taskNote: Notes of task. Given as a string
     - category: The category of the given task. Is given by a picker selection; values from categories array
     */
    
    init(taskName: String, dueDate: Date, taskNote: String, category: Category, isCompleted: Bool, completedDate: Date?) {
        self.taskName = taskName
        self.dueDate = dueDate
        self.taskNote = taskNote
        self.category = category
        
        /*
          SOURCE: https://chatgpt.com/share/6a6beb4c-35a4-83ec-8724-ba3a71809efd

          WHY: Needed help to get my picker UI working when a category array is updated on another interface, for the task interfcae tio update and the dispay the updated category array as options.

          MODIFIED:Used the AI class code and juts moved the creation of the array from the creating task categoruies to the class
         */
        
        self.isCompleted = false
        self.completedDate = nil
    }
    
    
    
    //Method: prints all values to a string that is displayed in the tableview cell
    
    
    //code created using previous code done in class and talk with teacher to help create
    func mainDetails() -> String {
        return taskName
    }
    
    /*
      SOURCE: https://chatgpt.com/s/t_6a6f4529d1388191b02b7c3dd2330c04

      WHY: Needed to know how to make do this method as refernce code only was for one value 

      MODIFIED:Used the Ai to know to put the • between them
     */
    
    
    func otherDetails() -> String {
        "\(dueDate) • \(category)• \(taskName)"
    }
}

