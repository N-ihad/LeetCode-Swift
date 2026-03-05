//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/minimum-changes-to-make-alternating-binary-string/solutions/7628141/swift-solution-with-explanation-by-nihad-k3n2
*/

class Solution {
    func minOperations(_ s: String) -> Int {
        let s = Array(s)
        var countMismatch0101 = 0

        for i in 0..<s.count {
            let expected: Character = i % 2 == 0 ? "0" : "1"
            if s[i] != expected {
                countMismatch0101 += 1
            }
        }

        let countMismatch1010 = s.count - countMismatch0101
        return min(countMismatch0101, countMismatch1010)
    }
}
