import Foundation

/*
 Bubble Sort is the simplest sorting algorithm that works by repeatedly swapping the adjacent elements if they are in wrong order.
 */
public func bubbleSort(arr:[Int]) -> [Int] {
    
    var sortedArray = arr
    
    for i in 0..<sortedArray.count {
        
        var swapped = false
        
        for j in 0..<(sortedArray.count - i - 1) {
            
            if sortedArray[j] > sortedArray[j+1] {
                sortedArray.swapAt(j, j+1)
                swapped = true
            }
        }
        
        if !swapped {
            break
        }
    }
    
    return sortedArray
}
