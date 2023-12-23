//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/path-crossing/solutions/4443619/swift-solution-with-explanation/

    Simulate 2d x, y plane and moves in 4 directions: N: (0, 1), E: (1, 0), S: (0, -1), W: (-1, 0). 
    Starting from 0, 0 we move according to the current direction c we have in our path, we then 
    check if our new point (x + direction.x, y + direction.y) exists in our visitedPoints set, 
    if it does than it means we've came back where we were and we should return true, 
    if not we just insert that new point into visitedPoints. At the end we just return false,
    meaning we haven't found any crossing point.
*/

class Solution {
    func isPathCrossing(_ path: String) -> Bool {
        let direction: [Character: (x: Int, y: Int)] = ["N": (0, 1), "E": (1, 0), "S": (0, -1), "W": (-1, 0)]
        var visitedPoints: Set<[Int]> = [[0, 0]]
        var (x, y) = (0, 0)

        for c in path {
            (x, y) = (x + direction[c]!.x, y + direction[c]!.y)

            if visitedPoints.contains([x, y]) {
                return true
            }

            visitedPoints.insert([x, y])
        }

        return false
    }
}
