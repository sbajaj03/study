import Foundation

/*
Insertion sort is a simple sorting algorithm that works similar to the way you sort playing cards in your hands. The array is virtually split into a sorted and an unsorted part. Values from the unsorted part are picked and placed at the correct position in the sorted part.
*/

public func insertionSort(arr:[Int]) -> [Int] {
    
    var sortedArr = arr
    
    for i in 1..<arr.count {
    
        let val = sortedArr[i]
        var j = i - 1
        
        while j >= 0 && sortedArr[j] > val  {
            sortedArr[j + 1] = sortedArr[j]
            j -= 1
        }
        
        sortedArr[j+1] = val
    }
    
    return sortedArr
}
