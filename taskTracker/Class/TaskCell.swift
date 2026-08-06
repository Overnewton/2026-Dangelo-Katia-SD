//
//  TaskCell.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 2/8/2026.
//

/*
 SOURCE: https://chatgpt.com/share/6a6f1104-60d4-83ec-b397-b8a315e9d7ce

  WHY: Wanted my tableview of task to display the task name, note, due date and category as a title coloum. 

  MODIFIED: Used chat guidence to make muitple mini colum in my cell and then created this class to link to them.
 */

/*
 TaskCell Class: A class of a labels inside the task display tabelview cell
 
 Properties:
 - lblTaskName: UILabel! - connected to label in cell
 - lblDueDate: UILabel! - connected to label in cell
 - lblCategory: UILabel! - connected to label in cell
 - lblNotes: UILabel! - connected to label in cell

*/

import UIKit
import Foundation

class TaskCell: UITableViewCell {

    @IBOutlet weak var lblTaskName: UILabel!
    @IBOutlet weak var lblDueDate: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblNotes: UILabel!

}
