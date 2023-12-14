//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/difference-between-ones-and-zeros-in-row-and-column/solutions/4405609/swift-solution-with-explanation/

    Iterate through the grid matrix, keeping track of number of 1s and 0s in each row and 
    column in following variables: onesRow, onesCol, zerosRow, zerosCol.
    By the end of it, we should have number of counts of 1s and 0s for each row and column respectfully. 
    At the end we just compute the difference matrix with a given
    formula using populated above variables: result[i][j] = onesRow[i] + onesCol[j] - zerosRow[i] - zerosCol[j].
*/

class Solution {
    func onesMinusZeros(_ grid: [[Int]]) -> [[Int]] {
        var onesRow = Array(repeating: 0, count: grid.count)
        var onesCol = Array(repeating: 0, count: grid[0].count)
        var zerosRow = Array(repeating: 0, count: grid.count)
        var zerosCol = Array(repeating: 0, count: grid[0].count)

        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 {
                    onesRow[i] += 1
                    onesCol[j] += 1
                } else {
                    zerosRow[i] += 1
                    zerosCol[j] += 1
                }
            }
        }

        var result = grid
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                result[i][j] = onesRow[i] + onesCol[j] - zerosRow[i] - zerosCol[j]
            }
        }

        return result
    }
}
