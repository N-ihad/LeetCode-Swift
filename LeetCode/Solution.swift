//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/count-subarrays-of-length-three-with-a-condition/solutions/6691924/swift-solution-by-nihad_s-mtx5

    This solution counts the number of subarrays of length 3 in the given integer array nums such that the sum of the first and 
    third numbers equals exactly half of the second number. We check in while condition i+ 2 < nums.count i. e. while we are not 
    going out of bounds for the 3rd element starting from i (since we compare arrays by count of 3 elements) we continue our loop. 
    We iterate through the array starting from the first index and check each subarray of length 3 by evaluating the condition: if 
    the sum of the first nums[i] and third nums[i+2] elements equals half of the second element nums[i+1]. If this condition is met, 
    the count is incremented. The loop continues until it reaches the end of the array, ensuring that only valid subarrays of length 3 
    are considered.
*/

class Solution {
    func countSubarrays(_ nums: [Int]) -> Int {
        var (count, i) = (0, 0)
        while i + 2 < nums.count {
            if Double(nums[i] + nums[i+2]) == Double(nums[i+1]) / 2 {
                count += 1
            }
            i += 1
        }
        return count
    }
}
