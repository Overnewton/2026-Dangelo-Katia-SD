//
//  Category.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 2/8/2026.
//

import Foundation
import UIKit

/*
 SOURCE: https://chatgpt.com/share/6a6f3102-bda8-83ec-a258-8c47e075f346

  WHY: needed chat gdps help to make the index row of category on my tasks display tableview shown based on the colour selected. Needed this is fit client's requriemnt

  MODIFIED:  used what chat gdp told me to make a new class with the properties it told me to do
 */

/*
 Category Class: A record of a categories that stores the name and colour addisgned to that category
 
 Properties:
 - name: string - name of category choosen
 - colour: UICOLOUR - colour choosen in picker from the array of listed UIColors
*/

public class Category {

    //public access modifers choosen for data members as they need to be able to be accessed and modified from anywhere in the app
    public var name: String
    public var colour: UIColor

    init(name: String, colour: UIColor) {
        self.name = name
        self.colour = colour
    }
}
