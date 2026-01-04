//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/magic-squares-in-grid/solutions/7463640/swift-solution-with-explanation-by-nihad-e7cs

    I scan the grid by sliding a 3×3 window over every possible position where a magic square could exist. I first handle the edge case where 
    the grid is smaller than 3×3, since no magic square is possible there. For each candidate subgrid, I validate it by checking two things: 
    all nine values must be distinct and strictly between 1 and 9, and the sums of all rows, columns, and both diagonals must be equal. 
    I use a set to quickly verify the uniqueness and valid range of the numbers, then compute the eight required sums and confirm they all match the same value. 
    If both conditions are satisfied, I count that subgrid as a valid magic square.

    Time complexity: O(n*m)
    Space complexity: O(1)
*/

class Solution {
    func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
        if grid.count < 3 || grid[0].count < 3 {
            return 0
        }

        var result = 0
        for row in 0..<grid.count - 2 {
            for col in 0..<grid[0].count - 2 where isValid(row, col, grid) {
                result += 1
            }
        }

        return result
    }

    private func isValid(_ row: Int, _ col: Int, _ grid: [[Int]]) -> Bool {
        let digits: Set<Int> = [
            grid[row][col], grid[row][col+1], grid[row][col+2],
            grid[row+1][col], grid[row+1][col+1], grid[row+1][col+2],
            grid[row+2][col], grid[row+2][col+1], grid[row+2][col+2]
        ]

        if digits.count != 9 || digits.contains(where: { $0 < 1 || $0 > 9 }) {
            return false
        }

        let row1 = grid[row][col] + grid[row][col+1] + grid[row][col+2]
        let row2 = grid[row+1][col] + grid[row+1][col+1] + grid[row+1][col+2]
        let row3 = grid[row+2][col] + grid[row+2][col+1] + grid[row+2][col+2]

        let col1 = grid[row][col] + grid[row+1][col] + grid[row+2][col]
        let col2 = grid[row][col+1] + grid[row+1][col+1] + grid[row+2][col+1]
        let col3 = grid[row][col+2] + grid[row+1][col+2] + grid[row+2][col+2]

        let leftDiag = grid[row][col] + grid[row+1][col+1] + grid[row+2][col+2]
        let rightDiag = grid[row][col+2] + grid[row+1][col+1] + grid[row+2][col]

        return [row1, row2, row3, col1, col2, col3, leftDiag, rightDiag].allSatisfy { $0 == row1 }
    }
}
