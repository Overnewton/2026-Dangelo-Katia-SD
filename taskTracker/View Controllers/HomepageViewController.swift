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


var completedTasks: [NewTask] = []


class HomepageViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        taskStatistics()
    }
    
    //MARK: INTERFACE CONTROLS
    
    //Outputs
    
    @IBOutlet weak var lblCompletedDay: UILabel!
    
    
    @IBOutlet weak var lblCompletedWeek: UILabel!
    
    
    @IBOutlet weak var lblTaskDueWeek: UILabel!
    
    
    @IBOutlet weak var lblTaskDue: UILabel!
    
    //Function: Mkaes rainbow text likes client want
    
    func rainbowNumber(title: String, number: Int) -> NSAttributedString {
        
        let fullText = NSMutableAttributedString(
            string: "\(title)\n"
        )
        
        let numberText = String(number)
        
        let colours: [UIColor] = [
            .systemRed,
            .systemOrange,
            .systemYellow,
            .systemGreen,
            .systemCyan,
            .systemBlue,
            .systemPurple
        ]
        
        for (index, character) in numberText.enumerated() {
            
            let colouredNumber = NSAttributedString(
                string: String(character),
                attributes: [
                    .foregroundColor: colours[index % colours.count]
                ]
            )
            
            fullText.append(colouredNumber)
        }
        
        return fullText
    }
    
    //Funtion: Will calualte the integars requried to be presented on the homepage
    
    func taskStatistics() {
        
        /*
         SOURCE: https://chatgpt.com/share/6a6f3f4d-e988-83ec-baf6-953a355ed006
         
         WHY: Tried to make a loop for idenifying taks due in a week based on daysAmount but relaised that each week it changs.
         
         MODIFIED: Copied some. Also used it as refernce to then help me reach the code also using other examples.
         */
        
        // Function: Calculates task statistics
            
            // Reset statistics each time homepage opens
            numtasks = 0
            tasksDueWeek = 0
            tasksDoneDay = 0
            tasksDoneWeek = 0
            
            
            // --------------------------------
            // TOTAL NUMBER OF ACTIVE TASKS
            // --------------------------------
            
            numtasks = tasks.count
            
            
            // --------------------------------
            // TASKS DUE WITHIN ONE WEEK
            // --------------------------------
            
            let calendar = Calendar.current
            let today = calendar.startOfDay(for: Date())
            
            for newTask in tasks {
                
                let dueDate = calendar.startOfDay(
                    for: newTask.dueDate
                )
                
                let daysAmount = calendar.dateComponents(
                    [.day],
                    from: today,
                    to: dueDate
                ).day ?? 0
                
                
                // Due today through next 7 days
                if daysAmount >= 0 &&
                    daysAmount <= 7 {
                    
                    tasksDueWeek += 1
                }
            }
            
            
            // --------------------------------
            // TASKS COMPLETED TODAY
            // --------------------------------
            
            for newTask in completedTasks {
                
                if let date = newTask.completedDate,
                   calendar.isDateInToday(date) {
                    
                    tasksDoneDay += 1
                }
            }
            
            
            // --------------------------------
            // TASKS COMPLETED THIS WEEK
            // --------------------------------
            
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
            
            
            for newTask in completedTasks {
                
                if let completedDate =
                    newTask.completedDate {
                    
                    if completedDate >= startOfWeek &&
                        completedDate < endOfWeek {
                        
                        tasksDoneWeek += 1
                    }
                }
            }
            
            
            // --------------------------------
            // DISPLAY STATISTICS
            // --------------------------------
            
            lblCompletedDay.attributedText =
            rainbowNumber(
                title: "Task completed today:",
                number: tasksDoneDay
            )
            
            
            lblCompletedWeek.attributedText =
            rainbowNumber(
                title: "Task completed this week:",
                number: tasksDoneWeek
            )
            
            
            lblTaskDueWeek.attributedText =
            rainbowNumber(
                title: "Tasks due this week:",
                number: tasksDueWeek
            )
            
            
            lblTaskDue.attributedText =
            rainbowNumber(
                title: "Tasks due:",
                number: numtasks
            )
        }
    }

