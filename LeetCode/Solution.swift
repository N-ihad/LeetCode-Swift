//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/check-if-there-is-a-valid-path-in-a-grid/solutions/8104121/swift-solution-with-explanation-by-nihad-7a9r
*/

class Solution {
    func hasValidPath(_ grid: [[Int]]) -> Bool {
        let (m, n) = (grid.count, grid[0].count)

        // Map each type to allowed directions
        let allowed: [Int: Set<[Int]>] = [
            1: [[0,-1], [0,1]],
            2: [[-1,0], [1,0]],
            3: [[0,-1], [1,0]],
            4: [[0,1], [1,0]],
            5: [[0,-1], [-1,0]],
            6: [[0,1], [-1,0]]
        ]

        var visited = Array(repeating: Array(repeating: false, count: n), count: m)

        func dfs(_ i: Int, _ j: Int) -> Bool {
            if i == m - 1 && j == n - 1 {
                return true
            }

            visited[i][j] = true

            for dir in allowed[grid[i][j]]! {
                let (dx, dy) = (dir[0], dir[1])
                let (ni, nj) = (i + dx, j + dy)

                if ni < 0 || nj < 0 || ni >= m || nj >= n || visited[ni][nj] {
                    continue
                }

                // Check if reverse connection road exists for new candidate cell (ni, nj), if exists we continue dfs
                if allowed[grid[ni][nj]]!.contains([-dx, -dy]) && dfs(ni, nj) {
                    return true
                }
            }

            return false
        }

        return dfs(0, 0)
    }
}
