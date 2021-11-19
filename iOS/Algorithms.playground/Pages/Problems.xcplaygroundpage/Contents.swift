

import Foundation


/*
 Given a string S of valid parentheses “(“ and “)”, the task is to print the string obtained by removing the outermost parentheses of every primitive substring from S.
 Input: S = “(()())(())()”
 Output: ()()()
 Explanation: The input string is “(()())(())()” can be decomposed into primitive susbstrings “(()())” + “(())”+”()”. After removing outermost parentheses of each priiimitive substrings, the string obtained is “()()” + “()” = “()()()”

 Input: S = “((()())(())(()(())))”
 Output: ()()()()(())
*/

func removeOuterParentheses(s: String) -> String {
    
    var res = ""
    
    guard s.count > 0 else { return res }
    
    // keep track of open paranthesis count
    var count = 0
    
    for c in s {
        
        if c == "(" {
            if count > 0 {
                res += "\(c)"
            }
            count += 1
        }
        
        if c == ")" {
            
            if count > 1 {
                res += "\(c)"
            }
            
            count -= 1
        }
    }
    
    return res
}

//print(removeOuterParentheses(s: "(()())(())()"))

/*
 Given a binary string S of length N, the task is to check if the decimal representation of the binary string is divisible by 9 or not.
 
 Input: S = 1010011
 Output: No
 Explanation: The decimal representation of the binary string S is 83, which is not divisible by 9. Therefore, the required output is No.
 
 Input: S = 1010001
 Output: Yes
 Explanation: The decimal representation of the binary string S is 81, which is not divisible by 9. Therefore, the required output is Yes.
 */

//

extension String {
    func toDecimal() -> Int? {
        
        var result = 0
        
        for digit in self {
            switch digit {
            case "0": result = result * 2
            case "1": result = result * 2 + 1
            default: return nil
            }
        }
        
        return result
    }
}

func binString_div_9(s:String) -> Bool {
    
    guard let number = s.toDecimal() else { return false }
    
    return number % 9 == 0
}

//print(binString_div_9(s: "1010001"))

/*
Given a sorted array A (sorted in ascending order), having N integers, find if there exists any pair of elements (A[i], A[j]) such that their sum is equal to X.
*/

func isPairSum(array:[Int], sum:Int) -> Bool {
    
    guard array.count > 1 else { return false}
    
    var i = 0, j = array.count - 1
    
    while i < j {
        let _sum = array[i] + array[j]
        
        if _sum == sum {
            return true
        }
        else if _sum < sum {
            i += 1
        }
        else {
            j -= 1
        }
    }
    
    return false
}

//print(isPairSum(array: [3, 5, 9, 2, 8, 10, 11], sum: 15))
/*
Given two sorted arrays and a number x, find the pair whose sum is closest to x and the pair has an element from each array.
We are given two arrays ar1[0…m-1] and ar2[0..n-1] and a number x, we need to find the pair ar1[i] + ar2[j] such that absolute value of (ar1[i] + ar2[j] – x) is minimum.
*/

func printClosest(ar1:[Int], ar2:[Int], sum:Int) {
    
    var diff = Int.max
    
    var i = 0, j = ar2.count - 1
    var res_1:Int = 0
    var res_2:Int = 0
    
    while i < ar1.count && j >= 0 {
        
        let _sum = ar1[i] + ar2[j]
        let _diff = abs(_sum - sum)
        
        if _diff < diff {
            res_1 = ar1[i]
            res_2 = ar2[j]
            diff = _diff
        }

        if _sum > sum {
            j -= 1
        }
        else {
            i += 1
        }
    }
    
    print(res_1,res_2)
}

//printClosest(ar1:[10, 20, 30, 40], ar2: [1, 4, 5, 7], sum: 14)

/*
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.
 
 */
func isPalindrome(_ s: String) -> Bool {

    let lowerCasedStr = s.lowercased().components(separatedBy: CharacterSet.letters.inverted).joined()
    let arr = Array(lowerCasedStr)
    var i = 0, j = lowerCasedStr.count - 1

    while i < j {
        if arr[i] != arr[j] {
            return false
        }
        i += 1
        j -= 1
    }
    
    return true
}

//print(isPalindrome("A man, a plan, a canal: Panama"))
//print(isPalindrome("race a car"))

/*
 Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of the line i is at (i, ai) and (i, 0). Find two lines, which, together with the x-axis forms a container, such that the container contains the most water.
 */

func maxArea(_ height: [Int]) -> Int {
    
    var i = 0, j = height.count - 1 , res_area = Int.min
    
    while i <= j {
        
        let minH = min(height[i], height[j])
        
        let area = minH * (j - i)
        
        res_area = max(area, res_area)
        
        if height[i] < height[j] {
            i += 1
        }
        else {
            j -= 1
        }
    }
    
    return res_area
}

//print(maxArea([1,8,6,2,5,4,8,3,7]))
/*
Given an array of integers, and a number ‘sum’, find the number of pairs of integers in the array whose sum is equal to ‘sum’.
*/

func getPairsCount(arr:[Int], sum:Int) -> Int {
    var dic = [Int:Int]()
    var count = 0
    for item in arr {
        if let c = dic[sum - item]  {
            count += c
        }
        
        if let c = dic [item] {
            dic[item] = c + 1
        }
        else {
            dic[item] = 1
        }
    }
    
    return count
}

//print(getPairsCount(arr: [1, 5, 7, -1, 7], sum: 6))

func checkDefer() {
    
    defer {
        print("a")
    }
    defer {
        print("b")
    }
    
    print("c")
    
    defer {
        print("d")
    }
    
    DispatchQueue(label: "some").sync {
        print("e")
    }
    
    print("f")
}

//checkDefer()

func checkStrongRefrenceCount() {
    
    var object:NSObject? = NSObject()
    
    DispatchQueue(label: "some").sync {
    
        var a:NSObject? = object
        print(CFGetRetainCount(a))
        print("aasdas")
        a = nil
        DispatchQueue(label: "some").sync {
            let b = object
            object = nil
            print(CFGetRetainCount(b))
        }
    }
}

//checkStrongRefrenceCount()
