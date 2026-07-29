
//sort functions



//TODO: Sort Function

/*
 Funtion to choose which sort funtion to use depenig on the number of values in array
 */

//func sortValues () {
//    if driveRecords.count <  10 {
//        driveRecords = selectionSort(array: driveRecords, by: sortBy)
//    }
//    else {
//        driveRecords = quickSort(array: driveRecords, by: sortBy)
//    }
//}


////TODO: quickSort Function
//
//// funciton sorting array based on sortby slection
//func quickSort(array: [DriveRecord], by: String) -> [DriveRecord] {
//
//    var less: [DriveRecord] = []
//
//    var equal: [DriveRecord] = []
//
//    var greater: [DriveRecord] = []
//
//    if array.count > 1 {
//
//        let pivot = array[array.count - 1]
//
//        for x in array {
//            
//            //sort by date
//            if by == "date" {
//                if x.date < pivot.date {
//                    
//                    less.append(x)
//                }
//                
//                if x.date == pivot.date {
//                    
//                    equal.append(x)
//                    
//                }
//                
//                if x.date > pivot.date {
//                    
//                    greater.append(x)
//                    
//                }
//                
//            }
//            //sort by rego
//            else {
//                if x.registration < pivot.registration {
//                    
//                    less.append(x)
//                }
//                
//                if x.registration == pivot.registration {
//                    
//                    equal.append(x)
//                    
//                }
//                
//                if x.registration > pivot.registration {
//                    
//                    greater.append(x)
//                    
//                }
//            }
//        }
//        if by == "date" {
//            return (quickSort(array: less, by: "date") + equal + quickSort(array: greater, by: "date"))
//            
//    }
//        else {
//            return (quickSort(array: less, by: "registration") + equal + quickSort(array: greater, by: "registration"))
//        }
//        
//    }
//    else {
//
//        return array
//
//    }}
//
//
//
////TODO: selectionSort Function
//
////MARK: search func
////function to sort vale by rego or date depending on want is choosen
//
//func selectionSort(array: [DriveRecord], by: String) -> [DriveRecord] {
//    
//    if array.count > 1 {
//
//        var arr = array
//
//        for x in 0 ..< arr.count - 1 {
//
//            var lowest = x
//
//            for y in x + 1 ..< arr.count {
//                
//                //sort by date
//                if by == "date" {
//                    
//                    if arr[y].date < arr[lowest].date {
//                        
//                        lowest = y
//                    }
//                    
//                    else {
//                        if arr[y].date < arr[lowest].date {
//                            
//                            lowest = y
//                        }
//                    }
//                }
//                
//                
//                
//                
//                if x != lowest {
//                    
//                    arr.swapAt(x, lowest)
//                    
//                }
//            }
//    }
//
//        return arr
//
//    } else {
//
//    return array
//
//    }}
//
//
