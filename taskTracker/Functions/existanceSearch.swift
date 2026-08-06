



// search funtions
    


//will only work for categories
/*
 code to search for a selected string in the categories array
 
 Parameters:
 - array: searching the categories class which stores the Cateogry class
 -searchFor: the requested string of category
 
 Returns:
 - Bool: True or false depending on if search found the searchFor item in the array
 */

//used other search as reffence to make this one
func linearSearch(array: [Category], searchFor: String) -> Bool {
   for currentValue in array {
       if searchFor.lowercased() == currentValue.name.lowercased() {
         return true
      }
   }
   return false
}

/*
 code to search for a selected string in the tasks array
 
 Parameters:
 - array: searching the tasks class which stores the NewTask class
 -searchFor: the requested NewTask object
 
 Returns:
 - Bool: True or false depending on if search found the searchFor item in the array
 */

/*
 Source: https://chatgpt.com/s/t_6a6f428b25448191810fad4e83555b13
 https://chatgpt.com/s/t_6a6f428b25448191810fad4e83555b13
 
 Why: Couln't fugure out how to edit this code now i had to use a new shared categories Tssk manger to ensure it works over all interfcaes
 
 MODIFIED: copied the code below to make a new linear search. However, had to edit the chat code to match the updates I made to seacrh code as well
 */
func linearSearch(array: [NewTask], searchFor: NewTask) -> Bool {
    for currentValue in array {

            if currentValue.taskName == searchFor.taskName &&
                currentValue.category.name.lowercased() == searchFor.category.name.lowercased() &&
               currentValue.dueDate == searchFor.dueDate {

                return true
            }
        }

        return false
    }

/*
 code to search for a selected integar in the selected array
 
 Parameters:
 - array: The intergar array t be searched
 -searchFor: the requested intergar to be seacrhed for
 
 Returns:
 - Int: retuns the number where searchFor was found
 */

//code created/adapted from preivous code learnt
func binarySearch(array: [Int], searchFor: Int) ->  Int {
    var firstIndex = 0
    var lastIndex = array.count - 1
    
    while firstIndex <= lastIndex {
        let middleIndex = (firstIndex + lastIndex) / 2
        if array[middleIndex] == searchFor {
            return middleIndex
        }
        if searchFor < array[middleIndex] {
            lastIndex = middleIndex - 1
        }
        if searchFor > array[middleIndex] {
            firstIndex = middleIndex + 1
        }
    }
    return 0
}
