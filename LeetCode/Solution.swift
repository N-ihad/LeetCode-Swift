//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/check-if-strings-can-be-made-equal-with-operations-ii/solutions/7734527/swift-solution-optimal-with-explanation-bplid
*/

class Solution {
    func checkStrings(_ s1: String, _ s2: String) -> Bool {
        let s1 = Array(s1)
        let s2 = Array(s2)

        var count = Array(repeating: Array(repeating: 0, count: 26), count: 2)
        for i in 0..<s1.count {
            let parity = i % 2
            count[parity][Int(s1[i].asciiValue! - 97)] += 1
            count[parity][Int(s2[i].asciiValue! - 97)] -= 1
        }

        for i in 0..<26 {
            if count[0][i] != 0 || count[1][i] != 0 {
                return false
            }
        }

        return true
    }
}
