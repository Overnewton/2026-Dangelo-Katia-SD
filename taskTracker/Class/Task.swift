
//class of tasks

import Foundation

//TODO: JASON FILE


// An array that holds the tasks
var tasks: [Task] = []


/*
Task:
  A task that is created for the task list for a user.
  All tasks are associated with its added features are saved/loaded from a json file from `taskList` array.

Properties/Parameters:

taskName: String - Holds the namde of the task
dueDate: Date - Holds the date of the task
taskNote: Sting - Holds the note of the task
category: Sting - Holds the category of the task
*/

class Task {
    var taskName: String
    var dueDate: Date
    var taskNote: String
    var category: String
    
    /*
     Initialiser for a Task object
     
     Parameters:
     - taskName: The name of the task. Given as a string
     - dueDate: The due date of the task to be completed. Is given in the format of ... from given by a date picker selection
     - taskNote: Notes of task. Given as a string
     - category: The category of the given task. Is given by a picker selection; values from categories array
     */
    
    init(taskName: String, dueDate: Date, taskNote: String, category: String) {
        self.taskName = taskName
        self.dueDate = dueDate
        self.taskNote = taskNote
        self.category = category
    }
    
    
    
    //Method: prints all values to a string that is displayed in the tableview cell
    
    /*
     ToString Method: prints all values to a string that is displayed in the tableview cell
     
     - Returns: A string that gives task name, due date, estimated time and priority as a string for hte user to read.
     
     The completion time is converted to hours and minutes
     */
    
    func mainDetails() -> String {
        return taskName
    }
    
    func otherDetails() -> String {
        "\(dueDate) • \(category)• \(taskName)"
    }
}
