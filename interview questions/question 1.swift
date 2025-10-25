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
 

Check if a string is a palindrome (loop and recursion).

Find sum of all even numbers in an array.

Merge two sorted arrays into one sorted array.

Find first non-repeating character in a string.

Implement a function to remove duplicates from an array while maintaining order.

Medium

Implement a function to rotate an array by k positions.

Implement binary search (iterative and recursive).

Generate all permutations of a string (recursion).

Compute factorial recursively and iteratively.

Given an array of integers, find the two numbers that sum to a target.

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
