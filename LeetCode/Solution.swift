//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var newGrid: [[Int]] = grid

        for i in 1..<grid.count {
            newGrid[i][0] = grid[i][0] + newGrid[i-1][0]
        }

        for j in 1..<grid[0].count {
            newGrid[0][j] = grid[0][j] + newGrid[0][j-1]
        }

        for i in 1..<grid.count {
            for j in 1..<grid[i].count {
                newGrid[i][j] = grid[i][j] + min(newGrid[i-1][j], newGrid[i][j-1])
            }
        }

        return newGrid[grid.count-1][grid[0].count-1]
    }
}
