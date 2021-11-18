import Foundation

/*
 The selection sort algorithm sorts an array by repeatedly finding the minimum element (considering ascending order) from unsorted part and putting it at the beginning.
 */
public func selectionSort(arr:[Int]) -> [Int] {
    
    var sortedArray = arr
    
    for i in 0..<sortedArray.count {
        
        var min_Index = i
        
        for j in i..<sortedArray.count {
         
            if sortedArray[min_Index] > sortedArray[j] {
                min_Index = j
            }
        }
        
        sortedArray.swapAt(i, min_Index)
    }
    
    return sortedArray
}


