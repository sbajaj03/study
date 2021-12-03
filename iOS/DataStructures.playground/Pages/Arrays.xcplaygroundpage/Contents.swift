import UIKit

var arr = (1...5).map( {_ in Int.random(in: 1...10)} )

// fib
//
//func fibonacci(_ number:UInt) -> UInt {
//
//    guard number > 1 else { return number }
//
//    var a:UInt = 0, b:UInt = 1
//
//    for _ in 2...number {
//
//        let temp = a + b
//        a = b
//        b = temp
//    }
//
//    return b
//}
//
//print(fibonacci(20))

//leftRotate(arr: &arr, d: 4)

struct User {
    var name:String?
    
    mutating func updateName(name:String) {
        self.name = name
    }
}


