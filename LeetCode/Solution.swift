//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        var matrix = matrix
        var maxVal = 0
        var cache = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)

        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                maxVal = cache[i][j] != 0 ? max(maxVal, cache[i][j]) : max(maxVal, dfs(&matrix, i, j, &cache))
            }
        }

        return maxVal
    }

    private func dfs(_ matrix: inout [[Int]], _ i: Int, _ j: Int, _ cache: inout [[Int]]) -> Int {

        if cache[i][j] != 0 { return cache[i][j] }

        var maxVal = 1

        if (i - 1) >= 0 && matrix[i][j] < matrix[i-1][j] {
            maxVal = max(maxVal, 1 + dfs(&matrix, i - 1, j, &cache))
        }

        if (j + 1) < matrix[0].count && matrix[i][j] < matrix[i][j+1] {
            maxVal = max(maxVal, 1 + dfs(&matrix, i, j + 1, &cache))
        }

        if (i + 1) < matrix.count && matrix[i][j] < matrix[i+1][j] {
            maxVal = max(maxVal, 1 + dfs(&matrix, i + 1, j, &cache))
        }

        if (j - 1) >= 0 && matrix[i][j] < matrix[i][j-1] {
            maxVal = max(maxVal, 1 + dfs(&matrix, i, j - 1, &cache))
        }

        cache[i][j] = maxVal
        return maxVal
    }
}
