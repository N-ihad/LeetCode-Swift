//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/closest-equal-element-queries/solutions/7946758/swift-solution-short-with-explanation-by-lnss
*/

class Solution {
    func solveQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        let n = nums.count
        var minDist = Array(repeating: n, count: n)
        var lastSeen: [Int: Int] = [:]

        for i in 0..<(n * 2) {
            let idx = i % n
            let val = nums[idx]

            if let prev = lastSeen[val] {
                let dist = i - prev
                minDist[idx] = min(minDist[idx], dist)
                minDist[prev % n] = min(minDist[prev % n], dist)
            }
            lastSeen[val] = i
        }

        return queries.map { minDist[$0] == n ? -1 : minDist[$0] }
    }
}
