//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/check-if-strings-can-be-made-equal-with-operations-i/solutions/7713525/swift-solution-with-explanation-by-nihad-12p6
*/

class Solution {
    func canBeEqual(_ s1: String, _ s2: String) -> Bool {
        let s1 = Array(s1)
        let s2 = Array(s2)

        let even1 = [s1[0], s1[2]].sorted()
        let even2 = [s2[0], s2[2]].sorted()

        let odd1 = [s1[1], s1[3]].sorted()
        let odd2 = [s2[1], s2[3]].sorted()

        return even1 == even2 && odd1 == odd2
    }
}
