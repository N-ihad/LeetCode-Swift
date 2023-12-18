//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func maxProductDifference(_ nums: [Int]) -> Int {
        var (min1, min2, max1, max2) = (Int.max, Int.max, Int.min, Int.min)

        for i in 0..<nums.count {
            if nums[i] < min1 {
                min2 = min1
                min1 = nums[i]
            } else if nums[i] < min2 {
                min2 = nums[i]
            }

            if nums[i] > max1 {
                max2 = max1
                max1 = nums[i]
            } else if nums[i] > max2 {
                max2 = nums[i]
            }
        }

        return max1 * max2 - min1 * min2
    }
}

