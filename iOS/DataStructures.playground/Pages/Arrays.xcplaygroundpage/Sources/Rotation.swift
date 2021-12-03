import Foundation

// Left Rotate by one
public func leftRotateByOne(arr:inout [Int]) {

    guard arr.count > 1 else { return }
    
    // hold first value in temp
    let temp = arr[0]
    for index in 1..<arr.count {
        arr[index - 1] = arr[index]
    }
    
    arr[arr.count - 1] = temp
}

public func leftRotateByOne_Swift(arr:inout [Int]) {
    
    guard arr.count > 1 else { return }
    
    let tempArray = [arr[0]]
    arr = Array(arr[1..<arr.count])
    arr += tempArray
}

public func leftRotate(arr:inout [Int], d:Int) {
    print("Input array -> \(arr)")
    for _ in 1...d {
        leftRotateByOne_Swift(arr: &arr)
    }
    print("Result array -> \(arr)")
}

// juggling method

