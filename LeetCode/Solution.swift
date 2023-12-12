//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    Iterate through an array and increment sum by 111, check if we are out of bounds of an array for next 
    element i+1 OR next element is not equal to the current element arr[i] ≠ arr[i+1], these 2 conditions mean 
    following: either we are on the last element and we should compute the result or we reached the end of the repeating element. 
    So, we check if our so far sum divided by arr.count is greater than 0.25 (25%), 
    if so then we found the result, if not we are nullifying sum and going to the next iteration (if there's).
*/

class Solution {
    func findSpecialInteger(_ arr: [Int]) -> Int {
        var sum = 0

        for i in 0..<arr.count {
            sum += 1
            if i+1 >= arr.count || arr[i] != arr[i+1] {
                if Double(sum) / Double(arr.count) > 0.25 {
                    return arr[i]
                }
                sum = 0
            }
        }

        return arr[0]
    }
}
