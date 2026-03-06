//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/check-if-binary-string-has-at-most-one-segment-of-ones/solutions/7630341/swift-solution-with-explanation-by-nihad-dag8
*/

class Solution {
    func checkOnesSegment(_ s: String) -> Bool {
        let s = Array(s)
        for i in 1..<s.count {
            if s[i-1] == "0" && s[i] == "1" {
                return false
            }
        }
        return true
    }
}
