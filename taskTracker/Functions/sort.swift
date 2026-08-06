
//sort functions

import Foundation
import UIKit

//TODO: Sort Function

/*
 Funtion to choose which sort funtion to use depenig on the number of values in array
 */


//code created/adapted from preivous code learnt
func sortValues () {
    if tasks.count <  10 {
        tasks = selectionSort(array: tasks, by: sortBy)
    }
    else {
        tasks = quickSort(array: tasks, by: sortBy)
    }
}


//TODO: quickSort Function

//code created/adapted from preivous code learnt
//// funciton sorting array based on sortby slection
func quickSort(array: [NewTask], by: String) -> [NewTask] {
    
    var less: [NewTask] = []
    
    var equal: [NewTask] = []

    var greater: [NewTask] = []

    if array.count > 1 {

        let pivot = array[array.count - 1]

        for x in array {
            
            
            //sort by category
            if by == "category" {
                
                /*
                  SOURCE: https://chatgpt.com/s/t_6a6f433a4fd08191bafbb34891b065b8

                  WHY: cOULDN'T FIGURE OUT THE ISSUE SO Needed help to with the error as the code i had of 'x.category' no longer worked as i had to create a new shared category task manager to allow inertface uodate for UI picker

                  MODIFIED:Used the AI class code exmaple to know to add '.name' previous to my code
                 */
                
                if x.category.name < pivot.category.name {
                    
                    less.append(x)
                }
                
                if x.category.name == pivot.category.name {
                    
                    equal.append(x)
                    
                }
                
                if x.category.name > pivot.category.name {
                    
                    greater.append(x)
                    
                }
                
            }
            //sort by due date
            else {
                if x.dueDate < pivot.dueDate {
                    
                    less.append(x)
                }
                
                if x.dueDate == pivot.dueDate {
                    
                    equal.append(x)
                    
                }
                
                if x.dueDate > pivot.dueDate {
                    
                    greater.append(x)
                    
                }
            }
        }
        if by == "category" {
            return (quickSort(array: less, by: "category") + equal + quickSort(array: greater, by: "category"))
            
    }
        else {
            return (quickSort(array: less, by: "dueDateSort") + equal + quickSort(array: greater, by: "dueDateSort"))
        }
        
    }
    else {

        return array

    }}



////TODO: selectionSort Function
//
////MARK: search func
////function to sort vale by category or date depending on want is choosen


func selectionSort(array: [NewTask], by: String) -> [NewTask] {
    
    if array.count > 1 {

        var arr = array

        for x in 0 ..< arr.count - 1 {

            var lowest = x

            for y in x + 1 ..< arr.count {
                
                //sort by date
                if by == "date" {
                    
                    if arr[y].dueDate < arr[lowest].dueDate {
                        
                        lowest = y
                    }
                    
                    else {
                        if arr[y].dueDate < arr[lowest].dueDate {
                            
                            lowest = y
                        }
                    }
                }
                
                
                
                
                if x != lowest {
                    
                    arr.swapAt(x, lowest)
                    
                }
            }
    }

        return arr

    } else {

    return array

    }}


