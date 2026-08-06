//
//  SearchTaskViewController.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 23/6/2026.
//

import UIKit


class SearchTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    //array is choosen as data type as all the searched tasks needs to be stored seperstly from NewTask to be displayed on tabelview
    var filteredTasks: [NewTask] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        tblSearch.delegate = self
        tblSearch.dataSource = self
        srhTask.delegate = self
        filteredTasks = tasks.self
    }
    
    //MARK: INTERFACE CONTROLS
    
    //Input
    
    @IBOutlet weak var srhTask: UISearchBar!
    
    //Output
    
    @IBOutlet weak var tblSearch: UITableView!
    
    //funtions

    /*
      SOURCE:https://youtu.be/8rjt1KZuGiM?si=pue_Q7h9GRnxDLJE
     https://youtu.be/0RZfIdNnX4s?si=5_z0nGOaP1rcRipu

      WHY: Didn't know how to use UIsearch
     
      MODIFIED: copied some code and some i used as refernce to adoat to simlaur ocde i had already
     
     */
    
    /*
      SOURCE:https://chatgpt.com/s/t_6a6f413ca0148191888734267ae1373c
     
      WHY: Video still had me confused and i could fiugure out how to fix the issues the video tutorial cuased me
     
      MODIFIED: copied some code and some i used as refernce to adoat to simlaur ocde i had already
     
     */
    
    /*
     Tablview funtions 
     */
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath
    ) {
        // Runs when a row is selected
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return filteredTasks.count
    }
    
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell",for: indexPath
        )
        
        cell.textLabel?.text = filteredTasks[indexPath.row].taskName
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        https://chatgpt.com/s/t_6a6f4117d46881918b7921878d59b3b0
        
        /*
          SOURCE:https://chatgpt.com/s/t_6a6f413ca0148191888734267ae1373c
         
          WHY: I used chat privouse source as refernce to help me but i couldnt figure iut hoe t adpat it to my code and since i never used what they had before  ask for clirty to help fix it.
         
          MODIFIED: copied some code to replace some old lines
         
         */
        
        if searchText.isEmpty {
            filteredTasks = tasks
        } else {
            filteredTasks = tasks.filter {
                $0.taskName.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        tblSearch.reloadData()
    }
    
    /*
     funtion: alert to pop up
     
     permetrs:
     - message: string
     - position: int
     
     */
    
    func alert(message: String, position: Int? = nil) {
        
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        
        let yesButton = UIAlertAction(title: "Yes", style: .destructive) { _ in
            
            // If a position was supplied, delete one task
            if let position = position {
                
                guard tasks.indices.contains(position) else {
                    return
                }
                
                tasks.remove(at: position)
                self.tblSearch.reloadData()
                self.alertPopup(message: "Task deleted successfully")
                
            }
            else {
                
                // No position means clear all tasks
                tasks.removeAll()
                self.tblSearch.reloadData()
                self.alertPopup(message: "All tasks cleared successfully")
            }
        }
            let noButton = UIAlertAction(title: "No", style: .cancel)
            
            alert.addAction(yesButton)
            alert.addAction(noButton)
            
            self.present(alert, animated: true)
        
    }
        /**
         Displays a temporary success message.
         */
        func alertPopup(message: String) {
            
            let alert = UIAlertController(title: nil,message: message,preferredStyle: .alert
            )
            
            present(alert, animated: true)
            
            Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { _ in
                alert.dismiss(animated: true)
            }
        }

    
    /**
     Function: Swipe to delete for tableview cells
     */
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
              
            alert(message: "Are you sure you want to delete this task?", position: indexPath.row)
          }
      }
    
}
