//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/difference-between-ones-and-zeros-in-row-and-column/solutions/4405609/swift-solution-with-explanation/

    Iterate through the grid matrix, keeping track of number of 1s in each row and 
    column in following variables: onesRow, onesCol. By the end of it, 
    we should have number of counts of 1s and 0s (we can calculate it based on the number of 1s we got) 
    for each row and column respectfully.
    At the end we just compute the difference matrix with a given formula:
    result[i][j] = onesRow[i] + onesCol[j] - zerosRow[i] - zerosCol[j]
    =>
    result[i][j] = onesRow[i] + onesCol[j] - (grid[0].count - onesRow[i]) - (grid.count - onesCol[j])
    =>
    result[i][j] = onesRow[i] + onesCol[j] - grid[0].count + onesRow[i] - grid.count + onesCol[j]
    =>
    result[i][j] = 2 * onesRow[i] + 2 * onesCol[j] - grid[0].count - grid.count
*/

class Solution {
    func onesMinusZeros(_ grid: [[Int]]) -> [[Int]] {
        var onesRow = Array(repeating: 0, count: grid.count)
        var onesCol = Array(repeating: 0, count: grid[0].count)

        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 {
                    onesRow[i] += 1
                    onesCol[j] += 1
                }
            }
        }

        var result = grid
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                result[i][j] = 2 * onesRow[i] + 2 * onesCol[j] - grid[0].count - grid.count
            }
        }

        return result
    }
}
