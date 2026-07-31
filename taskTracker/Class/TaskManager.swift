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
 following code came from chat gdp. need to source
 */
class TaskManager {

    static let shared = TaskManager()

    var categories: [String] = []

}
