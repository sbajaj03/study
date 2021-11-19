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


struct Node {
    var data:Int
    var left:Any?
    var right:Any?
}

// ------------------------100------------------------
// -----------------90----------110-------------------
//--------------80-----95----105----120---------------

func isBST(node:Node) -> Bool {
    
    func isBST(node:Node, min:Int = Int.min, max: Int = Int.max) -> Bool {
      
        if node.data < min || node.data > max {
            return false
        }
        
        var result = true
        
        if let left = node.left as? Node {
            result = isBST(node: left, min: min, max: node.data)
        }
        
        if result, let right = node.right as? Node {
            result = isBST(node: right, min: node.data, max: max)
        }
        
        return result
    }
    
    return isBST(node: node)
}

let n2_h2_r = Node(data: 120, left: nil, right: nil)
let n2_h2_l = Node(data: 105, left: nil, right: nil)
let n1_h2_r = Node(data: 95, left: nil, right: nil)
let n1_h2_l = Node(data: 80, left: nil, right: nil)
let n1_h1_l = Node(data: 90, left: n1_h2_l, right: n1_h2_r)
let n1_h1_r = Node(data: 110, left: n2_h2_l, right: n2_h2_r)
let head = Node(data: 100, left: n1_h1_l, right: n1_h1_r)

public func testISBST() {
    print(isBST(node: head))
}
