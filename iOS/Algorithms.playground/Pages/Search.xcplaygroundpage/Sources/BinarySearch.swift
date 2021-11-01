import Foundation


// MARK :- Binary Search
/*
 Search a sorted array by repeatedly dividing the search interval in half. Begin with an interval covering the whole array. If the value of
 the search key is less than the item in the middle of the interval, narrow the interval to the lower half. Otherwise, narrow it to the upper
 half. Repeatedly check until the value is found or the interval is empty.
*/

public func binarySearch_r(arr:[Int], number:Int) -> Bool {
    
    func binarySearch(arr:[Int], l:Int, r:Int, number:Int) -> Bool {
        //  check if r is not less than l
        guard l <= r else { return false }
        // calculate mid
        let mid = l + (r - l) / 2
        // check if arr of mid is equal to number and return true
        if arr[mid] == number  {
            return true
        }
        // check if number is greater than arr of mid and
        else if arr[mid] < number {
            return binarySearch(arr: arr, l: mid + 1, r: r, number: number)
        }
        else {
            return binarySearch(arr: arr, l: l, r: mid - 1, number: number)
        }
    }
    
    return binarySearch(arr: arr, l: 0, r: arr.count - 1, number: number)
}

public func binarySearch(arr:[Int], number:Int) -> Bool {
    
    var l = 0
    var r = arr.count - 1
      
    while l <= r {
        // calculate mid
        let mid = l + (r - l) / 2
        // check if arr of mid is equal to number and return true
        if arr[mid] == number  {
            return true
        }
        // check if number is greater than arr of mid and
        else if arr[mid] < number {
            l = mid + 1
        }
        else {
             r = mid - 1
        }
    }
    return false
}
