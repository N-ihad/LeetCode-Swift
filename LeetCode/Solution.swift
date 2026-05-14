//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/check-if-array-is-good/solutions/8229318/swift-solution-without-hash-table-and-so-vyt1
*/

class Solution {
    func isGood(_ nums: [Int]) -> Bool {
        let n = nums.max()!
        if n != nums.count - 1 {
            return false
        }

        var freq = Array(repeating: 0, count: n + 1)
        for num in nums {
            freq[num] += 1
        }

        if freq[n] != 2 {
            return false
        }

        for num in nums {
            if num != n && freq[num] != 1 {
                return false
            }
        }

        return true
    }
}
