//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/rotate-function/solutions/8124574/swift-solution-constant-space-with-expla-uyuy
*/

class Solution {
    func maxRotateFunction(_ nums: [Int]) -> Int {
        let n = nums.count
        let sum = nums.reduce(0, +)

        var f = 0
        for i in 0..<n {
            f += i * nums[i]
        }

        var result = f

        for k in 1..<n {
            f += sum - n * nums[n - k]
            result = max(result, f)
        }

        return result
    }
}
