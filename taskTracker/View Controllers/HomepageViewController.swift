//
//  ViewController.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 18/6/2026.
//

import UIKit

// MARK: GLOBAL variables

var numtasks: Int = 0

class HomepageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //MARK: GLOBAL VARIBALES
        
        var tasksDueDay: Int = 0
        
        var tasksDueWeek: Int = 0
        
        var tasksDoneDay: Int = 0
        
        var tasksDoneWeek: Int = 0
        
        
    }
    
    //MARK: INTERFACE CONTROLS
    
    //Outputs
    
    @IBOutlet weak var lblMessage1: UILabel!
    
    
    @IBOutlet weak var lblMessage2: UILabel!
    
    
    
    @IBOutlet weak var lblMessage3: UILabel!
    
    
    @IBOutlet weak var lblMessage4: UILabel!
    

    
}
