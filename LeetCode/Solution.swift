//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/xor-after-range-multiplication-queries-i/solutions/7830631/swift-solution-with-explanation-by-nihad-dk5b
*/

class Solution {
    func xorAfterQueries(_ nums: [Int], _ queries: [[Int]]) -> Int {
        var nums = nums
        for query in queries {
            var idx = query[0]
            while idx <= query[1] {
                nums[idx] = (nums[idx] * query[3]) % (1_000_000_000 + 7)
                idx += query[2]
            }
        }
        return nums.reduce(0, ^)
    }
}
