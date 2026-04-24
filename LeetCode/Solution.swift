//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/furthest-point-from-origin/solutions/8094380/swift-solution-with-explanation-by-nihad-eiej
*/

class Solution {
    func furthestDistanceFromOrigin(_ moves: String) -> Int {
        var balance = 0
        var wildcards = 0

        for move in moves {
            if move == "L" {
                balance -= 1
            } else if move == "R" {
                balance += 1
            } else {
                wildcards += 1
            }
        }

        return abs(balance) + wildcards
    }
}
