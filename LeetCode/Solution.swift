//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/count-binary-substrings/solutions/7593025/swift-solution-with-explanation-by-nihad-pplm
*/

class Solution {
    func countBinarySubstrings(_ s: String) -> Int {
        var s = Array(s)
        var groups: [Int] = []
        var currentLength = 1
        for i in 1..<s.count {
            if s[i] == s[i-1] {
                currentLength += 1
            } else {
                groups.append(currentLength)
                currentLength = 1
            }
        }
        groups.append(currentLength)

        var result = 0
        for i in 0..<groups.count - 1 {
            result += min(groups[i], groups[i+1])
        }

        return result
    }
}
