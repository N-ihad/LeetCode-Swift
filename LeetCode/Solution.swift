//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/detect-cycles-in-2d-grid/solutions/8099328/swift-solution-with-explanation-by-nihad-fzof
*/

class Solution {
    func containsCycle(_ grid: [[Character]]) -> Bool {
        let (m, n) = (grid.count, grid[0].count)
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)

        for i in 0..<m {
            for j in 0..<n {
                if !visited[i][j] && dfs(grid, i, j, -1, -1, grid[i][j], &visited) {
                    return true
                }
            }
        }

        return false
    }

    private func dfs(_ grid: [[Character]], _ i: Int, _ j: Int, _ prevI: Int, _ prevJ: Int, _ char: Character, _ visited: inout [[Bool]]) -> Bool {
        let (m, n) = (grid.count, grid[0].count)

        if i < 0 || i >= m || j < 0 || j >= n || grid[i][j] != char {
            return false
        }

        if visited[i][j] {
            return true
        }

        visited[i][j] = true

        let directions = [(1,0), (-1,0), (0,1), (0,-1)]

        for (di, dj) in directions {
            let ni = i + di
            let nj = j + dj

            // skip the parent cell
            if ni == prevI && nj == prevJ {
                continue
            }

            if dfs(grid, ni, nj, i, j, char, &visited) {
                return true
            }
        }

        return false
    }
}
