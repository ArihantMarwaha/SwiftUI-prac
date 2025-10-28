//
//  question 2.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 27/10/25.
//

import Foundation


/*

 //MARK: -
 Reverse a string recursively
 Input: "swift" → Output: "tfiws"
 
 func revstring(_ str : String)->String{
 
 if str.isEmpty {return}
 let char = Array(str)
 return string(char.last!)+revstring(String(char.droplast()))
 }

 //MARK: -
 Sum of array elements recursively
 Input: [1,2,3,4] → Output: 10
 
 func sumOfNum(_ num : [Int],index : Int)->Int{
 if index == num.count {return 0 }
 
 return arr[index]+sumOfNum(num,index+1)
 }
 
 //MARK: -
 Find max in array (no built-in)
 Input: [3,1,9,2] → Output: 9
 
 func maxnum(arr: [Int] ,index: Int,max: Int)->Int{
 var maxy = max
 if index >= arr.count{return max}
 if arr[index]>max {maxy=arr[index]}
 return maxnum(arr,index+1,maxy)
 }
 
 
 //MARK: -
 Count vowels in a string
 Input: "developer" → Output: 4
 
 func countVowels(_ str: String) -> Int {
     let vowels: [Character] = ["a","e","i","o","u"]
     var count = 0
     for ch in str.lowercased() {
         if vowels.contains(ch) {
             count += 1
         }
     }
     return count
 }

 print(countVowels("developer")) // 4

 
 //MARK: -
 Check palindrome recursively
 Input: "level" → Output: true
 func isPalindrome(_ str: String) -> Bool {
     if str.count <= 1 { return true }
     let chars = Array(str)
     if chars.first! != chars.last! { return false }
     return isPalindrome(String(chars[1..<chars.count - 1]))
 }

 print(isPalindrome("level")) // true

 
 //MARK: -
 Find frequency of characters (dict logic only)
 Input: "apple" → Output: ["a":1,"p":2,"l":1,"e":1]
 func charFrequency(_ str: String) -> [Character: Int] {
     var dict: [Character: Int] = [:]
     for ch in str {
         if dict[ch] != nil {
             dict[ch]! += 1
         } else {
             dict[ch] = 1
         }
     }
     return dict
 }

 print(charFrequency("apple")) // ["a":1,"p":2,"l":1,"e":1]


 //MARK: -
 Compute factorial of a number
 Input: 5 → Output: 120
 func factorial(_ n: Int) -> Int {
     if n <= 1 { return 1 }
     return n * factorial(n - 1)
 }

 print(factorial(5)) // 120


 //MARK: -
 Print first N Fibonacci numbers recursively
 Input: N = 5 → Output: 0 1 1 2 3
 func fibonacci(_ n: Int) -> Int {
     if n <= 1 { return n }
     return fibonacci(n - 1) + fibonacci(n - 2)
 }

 for i in 0..<5 {
     print(fibonacci(i), terminator: " ")
 }
 // Output: 0 1 1 2 3


 //MARK: -
 Find index of target in sorted array (binary search recursive)
 Input: [1,3,5,7,9], target 7 → Output: 3
 func binarySearch(_ arr: [Int], _ target: Int, _ low: Int, _ high: Int) -> Int {
     if low > high { return -1 }
     let mid = (low + high) / 2
     if arr[mid] == target {
         return mid
     } else if arr[mid] > target {
         return binarySearch(arr, target, low, mid - 1)
     } else {
         return binarySearch(arr, target, mid + 1, high)
     }
 }

 print(binarySearch([1,3,5,7,9], 7, 0, 4)) // 3


 //MARK: -
 Count digits in an integer recursively
 Input: 12345 → Output: 5
 func countDigits(_ n: Int) -> Int {
     if n == 0 { return 0 }
     return 1 + countDigits(n / 10)
 }

 print(countDigits(12345)) // 5


 ⚙️ MEDIUM LEVEL (10)

 Generate all permutations of a string
 Input: "abc"
 
 func permute(_ str: String, _ prefix: String = "") {
     if str.count == 0 {
         print(prefix)
         return
     }
     var chars = Array(str)
     for i in 0..<chars.count {
         var remaining = chars
         remaining.remove(at: i)
         permute(String(remaining), prefix + String(chars[i]))
     }
 }

 permute("abc")
 // Outputs all 6 permutations


 Generate all subsets of a string
 Input: "abc" → Output: ["", "a", "b", "c", "ab", "ac", "bc", "abc"]
 func subsets(_ str: String, _ index: Int = 0, _ current: String = "") {
     if index == str.count {
         print(current)
         return
     }
     let chars = Array(str)
     subsets(str, index + 1, current + String(chars[index])) // include
     subsets(str, index + 1, current) // exclude
 }

 subsets("abc")
 // Outputs: "", "c", "b", "bc", "a", "ac", "ab", "abc"


 Find all unique pairs that sum to target (no sets, manual loops)
 Input: [1,2,3,4,5], target 5 → Output: (2,3), (1,4)
 func findPairs(_ arr: [Int], _ target: Int) {
     for i in 0..<arr.count {
         for j in i+1..<arr.count {
             if arr[i] + arr[j] == target {
                 print("(\(arr[i]), \(arr[j]))")
             }
         }
     }
 }

 findPairs([1,2,3,4,5], 5)
 // (1,4), (2,3)


 Rotate array left by k positions (manually)
 Input: [1,2,3,4,5], k=2 → Output: [3,4,5,1,2]
 func rotateLeft(_ arr: [Int], _ k: Int) -> [Int] {
     var result = [Int](repeating: 0, count: arr.count)
     for i in 0..<arr.count {
         let newIndex = (i + arr.count - (k % arr.count)) % arr.count
         result[newIndex] = arr[i]
     }
     return result
 }

 print(rotateLeft([1,2,3,4,5], 2)) // [3,4,5,1,2]


 Remove duplicates from sorted array manually
 Input: [1,1,2,2,3,3,4] → Output: [1,2,3,4]
 
 func removeDuplicates(_ arr: [Int]) -> [Int] {
     if arr.isEmpty { return [] }
     var result: [Int] = [arr[0]]
     for i in 1..<arr.count {
         if arr[i] != arr[i - 1] {
             result.append(arr[i])
         }
     }
     return result
 }

 print(removeDuplicates([1,1,2,2,3,3,4])) // [1,2,3,4]


 Merge two sorted arrays manually
 Input: [1,3,5] and [2,4,6] → Output: [1,2,3,4,5,6]
 func mergeSorted(_ a: [Int], _ b: [Int]) -> [Int] {
     var i = 0, j = 0
     var merged: [Int] = []
     while i < a.count && j < b.count {
         if a[i] < b[j] {
             merged.append(a[i])
             i += 1
         } else {
             merged.append(b[j])
             j += 1
         }
     }
     while i < a.count { merged.append(a[i]); i += 1 }
     while j < b.count { merged.append(b[j]); j += 1 }
     return merged
 }

 print(mergeSorted([1,3,5], [2,4,6])) // [1,2,3,4,5,6]


 Find second largest element
 Input: [5,2,9,1,5,6] → Output: 6
 
 func secondLargest(_ arr: [Int]) -> Int {
     var first = Int.min
     var second = Int.min
     for num in arr {
         if num > first {
             second = first
             first = num
         } else if num > second && num != first {
             second = num
         }
     }
     return second
 }

 print(secondLargest([5,2,9,1,5,6])) // 6


 Move all zeros to end of array manually
 Input: [0,1,0,3,12] → Output: [1,3,12,0,0]
 func moveZeros(_ arr: [Int]) -> [Int] {
     var result = arr
     var index = 0
     for num in arr {
         if num != 0 {
             result[index] = num
             index += 1
         }
     }
     while index < arr.count {
         result[index] = 0
         index += 1
     }
     return result
 }

 print(moveZeros([0,1,0,3,12])) // [1,3,12,0,0]


 Check if array is sorted (recursive)
 Input: [1,2,3,4] → Output: true
 func isSorted(_ arr: [Int], _ index: Int = 0) -> Bool {
     if index >= arr.count - 1 { return true }
     if arr[index] > arr[index + 1] { return false }
     return isSorted(arr, index + 1)
 }

 print(isSorted([1,2,3,4])) // true


 Count paths in grid (recursion)
 Input: 2x2 grid → Output: 6 (paths to bottom-right)
 func countPaths(_ m: Int, _ n: Int) -> Int {
     if m == 1 || n == 1 { return 1 }
     return countPaths(m - 1, n) + countPaths(m, n - 1)
 }

 print(countPaths(3, 3)) // 6

 
*/
