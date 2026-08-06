//
//  ViewController.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 18/6/2026.
//

import UIKit

// MARK: GLOBAL variables

//Integar was choosen as Number of tasks created/stored will always be a whole num
var numtasks: Int = 0

//Integar was choosen as Number of tasks due in one week will always be a whole num
var tasksDueWeek: Int = 0

//Integar was choosen as Number of tasks complted/deleted from tableview in one day will always be a whole num
var tasksDoneDay: Int = 0

//Integar was choosen as Number of tasks complted/deleted from tableview in one week will always be a whole num
var tasksDoneWeek: Int = 0


class HomepageViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //call funtion
        taskStatistics()
    }
    
    //MARK: INTERFACE CONTROLS
    
    //Outputs
    
    @IBOutlet weak var lblCompletedDay: UILabel!
    
    
    @IBOutlet weak var lblCompletedWeek: UILabel!
    
    
    @IBOutlet weak var lblTaskDueWeek: UILabel!
    
    
    @IBOutlet weak var lblTaskDue: UILabel!
    
    //Funtion: Will calualte the integars requried to be presented on the homepage
    
    func taskStatistics() {
        
    /*
      SOURCE: https://chatgpt.com/share/6a6f3f4d-e988-83ec-baf6-953a355ed006

       WHY: Tried to make a loop for idenifying taks due in a week based on daysAmount but relaised that each week it changs.
     
       MODIFIED: Copied some. Also used it as refernce to then help me reach the code also using other examples.
     */
        
        for newTask in tasks {
            let daysAmount = Calendar.current.dateComponents(
                [.day],
                from: Date(),
                to: newTask.dueDate
            ).day ?? 0

            if daysAmount >= 0 && daysAmount <= 7 {
                tasksDueWeek += 1
            }
        }
        
        /*
          SOURCE: https://chatgpt.com/share/6a6f3f4d-e988-83ec-baf6-953a355ed006

           WHY: Tried to made a for loop for idenifying taks due today based on daysAmount but had and error and couldn't figure out why

           MODIFIED: Used chat code to helpo me adpat the code in to simular code i used
         */
        
        for NewTask in tasks {
            if let date = NewTask.completedDate,
               Calendar.current.isDateInToday(date) {
                
                // varaible increases by one integar as a task is complted that day
                tasksDoneDay += 1
            }
        }
        
        /*
          SOURCE: https://chatgpt.com/share/6a6f3f4d-e988-83ec-baf6-953a355ed006

           WHY: Tried to make a loop for idenifying taks due in a week based on daysAmount but relaised that each week it changs.
         
           MODIFIED: Used chat code to help me play alonhg with some other refences i had from orvious codes to create this
         */
        
        let calendar = Calendar.current

        guard let startOfWeek = calendar.dateInterval(
            of: .weekOfYear,
            for: Date()
        )?.start else {
            return
        }

        guard let endOfWeek = calendar.date(
            byAdding: .day,
            value: 7,
            to: startOfWeek
        ) else {
            return
        }

        for newTask in tasks {

            if let completedDate = newTask.completedDate {

                if completedDate >= startOfWeek &&
                   completedDate < endOfWeek {

                    // varaible increases in one integar as another task is complted that week
                    tasksDoneWeek += 1
                }
            }
        }

        //messages to be showed to users based on claution of task staitsics
        lblCompletedDay.text = "Task completed today: \(tasksDoneDay)"
        lblCompletedWeek.text = "Task completed this week: \(tasksDoneWeek)"
        lblTaskDueWeek.text = "Tasks due this week: \(tasksDueWeek)"
        lblTaskDue.text = "Task due this week: \(numtasks)"
        
        
    }
}
