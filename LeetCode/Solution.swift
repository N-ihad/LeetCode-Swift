//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/maximum-difference-between-adjacent-elements-in-a-circular-array/solutions/6837094/swift-solution-with-explanation-by-nihad-y9x5

    The function maxAdjacentDistance computes the maximum absolute difference between any two adjacent elements in a circular array nums. 
    In a circular array, the last and first elements are also considered adjacent. The goal is to find the largest value of |nums[i] - nums[j]| where 
    i and j are adjacent positions, including the wrap-around case between the last and first elements.

    The function starts by initializing maxDiff with the absolute difference between the last and first elements (abs(nums[0] - nums[nums.count - 1])) to 
    account for the circular nature of the array.

    It then iterates through the array from index 0 to nums.count - 2, comparing each pair of adjacent elements (nums[i] and nums[i+1]). 
    For each pair, it calculates the absolute difference and updates maxDiff if the current difference is larger than the previously recorded maximum.

    After checking all adjacent pairs (including the wrap-around case), the function returns maxDiff as the result.

    Time Complexity: The time complexity is O(n), where n is the number of elements in the input array nums.
*/

class Solution {
    func maxAdjacentDistance(_ nums: [Int]) -> Int {
        var maxDiff = abs(nums[0] - nums[nums.count-1])
        for i in 0..<nums.count - 1 {
            let diff = abs(nums[i] - nums[i+1])
            if diff > maxDiff {
                maxDiff = diff
            }
        }
        return maxDiff
    }
}
