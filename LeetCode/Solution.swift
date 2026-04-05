//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/robot-return-to-origin/solutions/7782076/swift-solution-with-explanation-by-nihad-iks2
*/

class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        var (x, y) = (0, 0)
        for move in moves {
            switch move {
            case "U": y += 1
            case "D": y -= 1
            case "L": x -= 1
            case "R": x += 1
            default: break
            }
        }
        return x == 0 && y == 0
    }
}
