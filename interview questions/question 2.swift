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

 
 //MARK: -
 Check palindrome recursively
 Input: "level" → Output: true

 
 //MARK: -
 Find frequency of characters (dict logic only)
 Input: "apple" → Output: ["a":1,"p":2,"l":1,"e":1]

 //MARK: -
 Compute factorial of a number
 Input: 5 → Output: 120

 //MARK: -
 Print first N Fibonacci numbers recursively
 Input: N = 5 → Output: 0 1 1 2 3

 //MARK: -
 Find index of target in sorted array (binary search recursive)
 Input: [1,3,5,7,9], target 7 → Output: 3

 //MARK: -
 Count digits in an integer recursively
 Input: 12345 → Output: 5

 ⚙️ MEDIUM LEVEL (10)

 Generate all permutations of a string
 Input: "abc"

 Generate all subsets of a string
 Input: "abc" → Output: ["", "a", "b", "c", "ab", "ac", "bc", "abc"]

 Find all unique pairs that sum to target (no sets, manual loops)
 Input: [1,2,3,4,5], target 5 → Output: (2,3), (1,4)

 Rotate array left by k positions (manually)
 Input: [1,2,3,4,5], k=2 → Output: [3,4,5,1,2]

 Remove duplicates from sorted array manually
 Input: [1,1,2,2,3,3,4] → Output: [1,2,3,4]

 Merge two sorted arrays manually
 Input: [1,3,5] and [2,4,6] → Output: [1,2,3,4,5,6]

 Find second largest element
 Input: [5,2,9,1,5,6] → Output: 6

 Move all zeros to end of array manually
 Input: [0,1,0,3,12] → Output: [1,3,12,0,0]

 Check if array is sorted (recursive)
 Input: [1,2,3,4] → Output: true

 Count paths in grid (recursion)
 Input: 2x2 grid → Output: 6 (paths to bottom-right)
 
 
*/
