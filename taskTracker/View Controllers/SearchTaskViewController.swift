//
//  SearchTaskViewController.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 23/6/2026.
//

import UIKit


class SearchTaskViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
 
    //MARK: INTERFACE CONTROLS
    
    //Input
    
    @IBOutlet weak var srhTask: UISearchBar!
    
    //Outputs
    
    @IBOutlet weak var lblResults: SearchTaskViewController!
    
    //Funtions
    
    
    @IBAction func btnSearch(_ sender: Any) {
    }
}
