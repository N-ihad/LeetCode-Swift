//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/minimum-distance-between-three-equal-elements-i/solutions/7861663/swift-solution-with-explanation-by-nihad-c9sw
*/

class Solution {
    func minimumDistance(_ nums: [Int]) -> Int {
        var freq: [Int: [Int]] = [:]
        for i in 0..<nums.count {
            freq[nums[i], default: []].append(i)
        }

        var result: Int?
        for indices in freq.values where indices.count >= 3 {
            for i in 1..<indices.count-1 {
                let dist = (indices[i+1] - indices[i-1]) * 2
                result = min(result ?? 200, dist)
            }
        }

        return result ?? -1
    }
}
