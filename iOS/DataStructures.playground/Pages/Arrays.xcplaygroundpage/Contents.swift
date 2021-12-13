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

func check(str1:String, str2:String) -> Int {

    var _sum = 0
    var arr = Array(str1)
    var dict = [Character:Int]()
    
    func saveInDic(c:Character, dict:inout [Character:Int]) {
        if let count = dict[c] {
            dict[c] = count + 1
        }
        else {
            dict[c] = 1
        }
    }
    
    var i = 0, j = str1.count - 1
    while i <= j {

        saveInDic(c: arr[i], dict: &dict)

        if i != j {
            saveInDic(c: arr[j], dict: &dict)
        }

        i += 1
        j -= 1
    }
    
//    for c in str1 {
//        print("-->")
//        if let count = dict[c] {
//            dict[c] = count + 1
//        }
//        else {
//            dict[c] = 1
//        }
//    }
    print(dict)
    i = 0
    j = str2.count - 1
    arr = Array(str2)
    
    while i <= j {
        _sum += dict[arr[i]] ?? 0
        
        if i != j {
            _sum += dict[arr[j]] ?? 0
        }
        i += 1
        j -= 1
    }
//    for c in str2 {
//        _sum += dict[c] ?? 0
//    }

//    var i = 0, j = str1.count - 1
//    let strArr = Array(str1)
//    while i <= j {
//
//        let c1 = strArr[i]
//        let c2 = strArr[j]
//
////        let _a = str2.filter({$0 == c1 || $0 == c2})
//        print(c1,c2)
////        print(_a)
////        _sum += _a.count
//
//        for (index, s2) in str2.enumerated() {
//            if c1 == s2 {
//                _sum += 1
//                print("(\(i), \(i)) (\(index), \(index))")
//            }
//            if i != j, c2 == s2 {
//                _sum += 1
//                print("(\(j), \(j)) (\(index), \(index))")
//            }
//        }
////
//        i += 1
//        j -= 1
//    }
    
//    _sum = 0
//
//    for s1 in str1 {
//        for s2 in str2 {
//            if s1 == s2 {
//                _sum += 1
//            }
//        }
//    }

    return _sum
}

print(check(str1: "jdtydtydftyftyyyffvgfgdrtseragcdghfcvhgbkknhikl", str2: "bseryteftdtrrstdtydgtfdtfdty"))

// solution 1
func checkCommonSubString(str1:String, str2:String) -> Int {

 
    let smallStr = str1.count < str2.count ? str1 : str2
    let bigStr = smallStr == str2 ? str1 : str2
    var minLength = Int.max
    var sum = 0
    
    for l in 0...smallStr.count {
        
        var i = 0, j = l
        
        while j < smallStr.count {
            
            let diff = j - i + 1
            let startIndex = smallStr.index(smallStr.startIndex, offsetBy: i)
            let endIndex = smallStr.index(smallStr.startIndex, offsetBy: j)
            let subStr = smallStr[startIndex...endIndex]

            if diff > minLength {
            
            }
            else {
                let count = bigStr.replacingOccurrences(of: subStr, with: "_").filter({$0 == "_"}).count

                if minLength > diff {
                    sum = count
                    minLength = diff
                }
                else if minLength == diff {
                    sum += count
                }
            }
        
            i += 1
            j = i + l
        }
    }
    print(sum)
    return sum
}

checkCommonSubString(str1: "jdtydtydftyftyyyffvgfgdrtseragcdghfcvhgbkknhikl", str2: "bseryteftdtrrstdtydgtfdtfdty")
