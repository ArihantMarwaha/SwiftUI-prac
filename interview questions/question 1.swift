//
//  question 1.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 23/10/25.
//

import Foundation
import SwiftUI
//Reverse an array without .reversed().
struct reverse : View {
    func reverseInPlace<T>(_ a: inout [T]) {
        var i = 0, j = a.count - 1
        while i < j {
            a.swapAt(i, j)
            i += 1
            j -= 1
        }
    }
    var arr = [1,2,3,4,5]
    var body: some View {
   //     reverseInPlace(arr)
    }
}

/*Find max and min elements in an array.
 /*
 
  var arr : [Int] = [1,4,9,2,6,9,32,9]
  var min = arr[0]
  var max = arr[0]
  
  for i in arr {
  if i >= max{
  max = i
  }
  if i <= min {
  min = i
  }
  }
  */

Count frequency of each element in an array using Dictionary.
 
 //method 1
 func frequencies<T: Hashable>(_ a: [T]) -> [T:Int] {
     var freq = [T:Int]()
     for v in a { freq[v, default: 0] += 1 }
     return freq
 }
 frequencies(["a","b","a","c"])
 
 //method 2
 func frequencyCount<T: Hashable>(_ array: [T]) -> [T: Int] {
     var dict: [T: Int] = [:]
     for element in array {
         if dict[element] != nil {
             dict[element]! += 1
         } else {
             dict[element] = 1
         }
     }
     return dict
 }

 let result = frequencyCount(["a","b","a","c","b","a"])
 print(result) // ["a": 3, "b": 2, "c": 1]

 
 
 

Check if a string is a palindrome (loop and recursion).
 // iterative (handles Unicode scalars via Array of Characters)
 func isPalindrome(_ s: String) -> Bool {
     let cs = Array(s)
     var i = 0, j = cs.count - 1
     while i < j {
         if cs[i] != cs[j] { return false }
         i += 1; j -= 1
     }
     return true
 }
 
 func isPalindromeRec(_ cs: [Character], _ i: Int, _ j: Int) -> Bool {
     if i >= j { return true }
     if cs[i] != cs[j] { return false }
     return isPalindromeRec(cs, i+1, j-1)
 }
 let s = "racecar"
 isPalindrome(s) // true
 isPalindromeRec(Array(s), 0, s.count-1)

Find sum of all even numbers in an array.
 func sumOfEvens(_ a: [Int]) -> Int {
     var sum = 0
     for v in a where v % 2 == 0 { sum += v }
     return sum
 }
 sumOfEvens([1,2,3,4])

Merge two sorted arrays into one sorted array.
 func mergeSorted(_ a: [Int], _ b: [Int]) -> [Int] {
     var i = 0, j = 0, res = [Int]()
     res.reserveCapacity(a.count + b.count)
     while i < a.count && j < b.count {
         if a[i] <= b[j] { res.append(a[i]); i += 1 }
         else { res.append(b[j]); j += 1 }
     }
     if i < a.count { res.append(contentsOf: a[i...]) }
     if j < b.count { res.append(contentsOf: b[j...]) }
     return res
 }
 mergeSorted([1,3,5], [2,4,6])

Find first non-repeating character in a string.
 func firstNonRepeating(_ s: String) -> Character? {
     var freq = [Character:Int]()
     let cs = Array(s)
     for c in cs { freq[c, default:0] += 1 }
     for c in cs where freq[c] == 1 { return c }
     return nil
 }
 firstNonRepeating("swiss") // "w"


Implement a function to remove duplicates from an array while maintaining order.
 func removeDuplicatesKeepOrder<T: Hashable>(_ a: [T]) -> [T] {
     var seen = Set<T>()
     var res = [T]()
     for v in a {
         if !seen.contains(v) {
             seen.insert(v)
             res.append(v)
         }
     }
     return res
 }
 removeDuplicatesKeepOrder([1,2,1,3,2]) // [1,2,3]


Medium

Implement a function to rotate an array by k positions.
 func rotateRightManual<T>(_ arr: [T], by k: Int) -> [T] {
     let n = arr.count
     if n == 0 { return [] }
     let shift = k % n
     var res = Array(repeating: arr[0], count: n)
     for i in 0..<n {
         var newIndex = i + shift
         if newIndex >= n { newIndex -= n }
         res[newIndex] = arr[i]
     }
     return res
 }
 rotateRightManual([1,2,3,4,5], by: 2) // [4,5,1,2,3]


Implement binary search (iterative and recursive).
//itterative
 func binarySearchManual(_ a: [Int], target: Int) -> Int? {
     var low = 0
     var high = a.count - 1
     while low <= high {
         let mid = (low + high) / 2
         if a[mid] == target { return mid }
         if a[mid] < target { low = mid + 1 }
         else { high = mid - 1 }
     }
     return nil
 }
 binarySearchManual([1,3,5,7,9], target: 5) // 2

 
 func binarySearch(_ arr: [Int], _ target: Int, _ low: Int, _ high: Int) -> Int {
     if low > high {
         return -1 // base case: not found
     }
     
     let mid = (low + high) / 2
     
     if arr[mid] == target {
         return mid
     } else if arr[mid] > target {
         return binarySearch(arr, target, low, mid - 1)
     } else {
         return binarySearch(arr, target, mid + 1, high)
     }
 }
 

Generate all permutations of a string (recursion).
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


Compute factorial recursively and iteratively.
 // recursive
 func factorialRec(_ n: Int) -> Int {
     if n <= 1 { return 1 }
     return n * factorialRec(n - 1)
 }

 // iterative
 func factorialIter(_ n: Int) -> Int {
     var res = 1
     for i in 2...n { res *= i }
     return res
 }
 factorialRec(5) // 120
 factorialIter(5) // 120


Given an array of integers, find the two numbers that sum to a target.
 func twoSum(_ nums: [Int], _ target: Int) -> (Int, Int)? {
     var dict = [Int: Int]() // value:index
     for (i, num) in nums.enumerated() {
         if let j = dict[target - num] {
             return (j, i)
         }
         dict[num] = i
     }
     return nil
 }
 twoSum([2,7,11,15], 9) // (0,1)

 
Write a function to flatten a nested array (recursion).

Implement a singly linked list in Swift with insert, delete, and print functions.

Find the intersection of two arrays.

Implement quicksort or mergesort.

Compute nth Fibonacci number recursively with memoization.

Hard

Detect a cycle in a linked list (Floyd’s algorithm).

Implement merge K sorted arrays using a min-heap.

Find all subsets (power set) of an array recursively.

Implement LRU Cache using Dictionary + linked list.

Given an array of intervals, merge overlapping ones.

Find longest common prefix among an array of strings.

Use recursion to solve the “Tower of Hanoi.”

Generate all valid parentheses combinations for n pairs.

Implement matrix rotation (90° clockwise).

Compute path count in a grid using recursion and memoization.
*/
