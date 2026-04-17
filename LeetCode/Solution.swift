//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/minimum-absolute-distance-between-mirror-pairs/solutions/7970040/swift-solution-short-with-explanation-by-o9a2
*/

class Solution {
    func minMirrorPairDistance(_ nums: [Int]) -> Int {
        var result = Int.max
        var map: [Int: Int] = [:] // reversedNum -> lastSeenIndex

        for j in 0..<nums.count {
            let reversed = Int(String(String(nums[j]).reversed()))!

            if let i = map[nums[j]] {
                result = min(result, j - i)
            }

            map[reversed] = j
        }

        return result == Int.max ? -1 : result
    }
}
