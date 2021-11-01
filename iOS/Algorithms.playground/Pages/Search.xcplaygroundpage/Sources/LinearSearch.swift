import Foundation

// Linear Search
public func linearSearch(arr:[Int], number:Int) -> Bool {
   
    for item in arr {
        if item == number {
            return true
        }
    }
    
    return false
}

public func improvedLinearSearch(arr:[Int], number:Int) -> Bool {

    var start = 0
    var end = arr.count - 1
    
    while start <= end {
        
        if arr[start] == number {
            return true
        }
        else if start != end, arr[end] == number {
            return true
        }
        
        start += 1
        end -= 1
    }
    
    return false
}
