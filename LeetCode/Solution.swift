//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/rotate-string/solutions/8131753/swift-solution-1-line-with-explanation-b-8ohx
*/

class Solution {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        return s.count == goal.count && (s + s).contains(goal)
    }
}
