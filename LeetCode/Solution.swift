//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/unique-paths-ii/solutions/7427358/swift-solution-dfs-memoization-with-expl-96pm

    Solution uses depth-first search (DFS) with memoization to count the number of unique paths from the top-left to the 
    bottom-right cell while avoiding obstacles. Starting at position `(0, 0)`, the recursive `dfs` function explores both 
    possible moves—down and right—until it either goes out of bounds, hits an obstacle (returning 0 paths), or 
    reaches the destination cell (returning 1 valid path). To avoid recomputing the number of paths from the same cell multiple times, 
    a cache stores previously calculated results keyed by the cell’s coordinates. Each cell’s total paths are the sum of the paths from 
    the cell below and the cell to the right, modelling the robot’s possible and legal movement choices.

    Time complexity: O(m*n)
    Space complexity: O(m*n)
*/

class Solution {
    private var cache: [String: Int] = [:]

    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        dfs(obstacleGrid, 0, 0)
    }

    private func dfs(_ obstacleGrid: [[Int]], _ i: Int, _ j: Int) -> Int {
        if i >= obstacleGrid.count || i < 0 || j >= obstacleGrid[i].count || j < 0 || obstacleGrid[i][j] == 1 {
            return 0
        }

        if i == obstacleGrid.count - 1 && j == obstacleGrid[i].count - 1 {
            return 1
        }

        if let counter = cache["\(i),\(j)"] {
            return counter
        }

        let pathsCount = dfs(obstacleGrid, i + 1, j) + dfs(obstacleGrid, i, j + 1)
        cache["\(i),\(j)"] = pathsCount
        return pathsCount
    }
}
