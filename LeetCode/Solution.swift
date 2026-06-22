//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/maximum-number-of-balloons/solutions/8351654/swift-solution-with-explanation-by-nihad-8tun
*/

class Solution {
    func maxNumberOfBalloons(_ text: String) -> Int {
        var freq: [Character: Int] = [
            "b": 0,
            "a": 0,
            "l": 0,
            "o": 0,
            "n": 0
        ]

        for c in text {
            if freq[c] != nil {
                freq[c]! += 1
            }
        }

        return min(
            freq["b"]!,
            freq["a"]!,
            freq["l"]! / 2,
            freq["o"]! / 2,
            freq["n"]!
        )
    }
}
