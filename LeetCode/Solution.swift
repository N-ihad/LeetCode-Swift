//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var absoluteMax = Int.min
        var max = 0
        for i in 0..<nums.count {
            max += nums[i]
            if nums[i] > max {
                max = nums[i]
            }
            if max > absoluteMax {
                absoluteMax = max
            }
        }
        return absoluteMax
    }
}
