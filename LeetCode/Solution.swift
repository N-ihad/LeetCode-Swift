//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/minimum-operations-to-make-a-uni-value-grid/solutions/8114799/swift-solution-with-explanation-by-nihad-5vce
*/

class Solution {
    func minOperations(_ grid: [[Int]], _ x: Int) -> Int {
        let nums = grid.flatMap { $0 }.sorted()
        let median = nums[nums.count / 2]
        let commonRemainder = median % x

        var result = 0

        for num in nums {
            if num % x != commonRemainder {
                return -1
            }
            result += abs(num - median) / x
        }

        return result
    }
}
