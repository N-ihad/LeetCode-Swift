//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        var containsOne = false

        for i in 0..<nums.count {
            if nums[i] == 1 { containsOne = true }
            nums[i] = nums[i] > nums.count || nums[i] <= 0 ? 1 : nums[i]
        }

        if !containsOne { return 1 }

        for i in 0..<nums.count {
            nums[abs(nums[i])-1] = nums[abs(nums[i])-1] < 0 ? nums[abs(nums[i])-1] : -nums[abs(nums[i])-1]
        }

        for i in 0..<nums.count {
            if nums[i] > 0 { return i + 1 }
        }

        return nums.count + 1
    }
}
