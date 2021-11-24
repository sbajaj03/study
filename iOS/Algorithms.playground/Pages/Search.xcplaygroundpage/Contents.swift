
import Foundation


let arr = (1...5).map( {_ in Int.random(in: 1...10)} )

let sortedArr = arr.sorted()

enum SearchAlgoType:String, CaseIterable {
    case linear = "Linear"
    case binary = "Binary"
}

func search(arr:[Int], number:Int, algo:SearchAlgoType = .linear) -> Bool {
    
    print("\(algo.rawValue) Search Number:-> \(number) in Array:-> \(arr)")

    switch algo {
    case .linear: return improvedLinearSearch(arr: arr, number: number)
    case .binary: return binarySearch(arr: arr, number: number)
    }
}

testISBST()
