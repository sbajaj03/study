//import Foundation
//
//
//let arrA = [7,5,6,3,1,4,2]
//
//
//func merge(arr:inout [Int], l:[Int], r:[Int]) {
//
//    var i = 0
//    var j = 0
//    var k = 0
//    while i < l.count && j < r.count {
//
//        if arr[i] < arr[j] {
//            arr[k] = l[i]
//            i += 1
//        }
//        else {
//            arr[k] = r[j]
//            j += 1
//        }
//
//        k += 1
//    }
//
//    while i < l.count {
//
//        i += 1
//        k += 1
//    }
//
//    while j < l.count {
//
//        j += 1
//        k += 1
//    }
//}
//
//func mergeSort(arr:inout [Int], l: Int, r:Int) -> [Int] {
//
//    let m = l + (r - l) / 2
//
//    let leftArray = mergeSort(arr: &arr, l: l, r: m)
//
//    let rightArray = mergeSort(arr: &arr, l: m + 1, r: r)
//
//    return merge(arr: &arr, l: leftArray, r: rightArray)
//}
//
//func mergeSort(arr: inout [Int]) {
//
//    mergeSort(arr: &arr, l: 0, r: arr.count - 1)
//}
