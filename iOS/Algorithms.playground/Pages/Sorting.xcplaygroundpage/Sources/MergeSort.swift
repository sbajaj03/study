import Foundation

public func mergeSort(arr: inout [Int]) {
    
    guard arr.count > 1 else { return }

    let m = (arr.count - 1) / 2
    
    var leftArray = Array(arr[...m])
    var rightArray = Array(arr[(m+1)...])
    
    mergeSort(arr: &leftArray)
    mergeSort(arr: &rightArray)

    var i = 0, j = 0, k = 0
    
    while i < leftArray.count && j < rightArray.count {
        
        if arr[i] < arr[j] {
            arr[k] = leftArray[i]
            i += 1
        }
        else {
            arr[k] = rightArray[j]
            j += 1
        }
        
        k += 1
    }
    
    while i < leftArray.count {
        arr[k] = leftArray[i]
        i += 1
        k += 1
    }
    
    while j < rightArray.count {
        arr[k] = rightArray[j]
        j += 1
        k += 1
    }
}
