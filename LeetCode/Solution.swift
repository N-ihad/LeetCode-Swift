//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count - k + 1
        var result: [Int] = []

        for i in 0..<n {
            var max = nums[i]
            for j in i+1..<i+k {
                if nums[j] > max {
                    max = nums[j]
                }
            }
            result.append(max)
        }

        return result
    }
}
