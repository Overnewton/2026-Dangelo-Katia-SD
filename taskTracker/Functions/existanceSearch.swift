



// search funtions
    

/*
 function to search using linear search to see if input is unquie or not.
 
 Will search values when called through ...
 */

func linearSearch(array: [String], searchFor: String) -> Bool {
   for currentValue in array {
      if searchFor == currentValue {
         return true
      }
   }
   return false
}

/*
 function to search using binary search to see if input is unquie or not.
 
 Will search values when called through ...
 
 // will return index value where category was found
 */


//func binarySearch(array: [Int], searchFor: Int) ->  Int {
//    var firstIndex = 0
//    var lastIndex = array.count - 1
//    
//    while firstIndex <= lastIndex {
//        let middleIndex = (firstIndex + lastIndex) / 2
//        if array[middleIndex] == searchFor {
//            return middleIndex
//        }
//        if searchFor < array[middleIndex] {
//            lastIndex = middleIndex - 1
//        }
//        if searchFor > array[middleIndex] {
//            firstIndex = middleIndex + 1
//        }
//    }
//    return 0
//}

 
