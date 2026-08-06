//
//  TaskManager.swift
//  taskTracker
//
//  Created by Katia D'Angelo on 29/7/2026.
//

/*
  SOURCE: https://chatgpt.com/share/6a6beb4c-35a4-83ec-8724-ba3a71809efd

  WHY: Needed help to get my picker UI working when a category array is updated on another interface, for the task interfcae tio update and the dispay the updated category array as options.

  MODIFIED:Used the AI class code and juts moved the creation of the array from the creating task categoruies to the class
 */


/*
 TaskManager Class: A class storing the catergoires array allowing it to be used over mutiple interfaces
 
 Properties:
 - TaskManager(): static - shared over the interfaces
 - categories: array - stores the caterogy of a task based on the Category object

*/


class TaskManager {

    static let shared = TaskManager()

    //array of the Category object
    //array choosen as data type as needs to store lots of data
    //public access modifers choosen for data members as they need to be able to be accessed and modified from anywhere in the app
    public var categories: [Category] = []

}
