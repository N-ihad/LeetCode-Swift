//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/maximum-number-of-jumps-to-reach-the-last-index/solutions/8182878/swift-solution-with-explanation-by-nihad-tbur
*/

class Solution {
    func maximumJumps(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        var dp = Array(repeating: -1, count: n); dp.reserveCapacity(n)
        dp[0] = 0

        for i in 0..<n-1 {
            for j in i+1..<n where dp[i] != -1 && abs(nums[j] - nums[i]) <= target {
                dp[j] = max(dp[j], dp[i] + 1)
            }
        }

        return dp[n-1]
    }
}
