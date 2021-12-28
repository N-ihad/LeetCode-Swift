//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    class Node {
        let value: Character
        var visited: Bool

        init(value: Character) {
            self.value = value
            visited = false
        }
    }

    func numIslands(_ grid: [[Character]]) -> Int {
        let grid = makeNodesGrid(grid)
        var numberOfIslands = 0

        for i in 0..<grid.count {
            for j in 0..<grid[0].count where !grid[i][j].visited {
                bfs(i, j, grid)
                if grid[i][j].value != "0" {
                    numberOfIslands += 1
                }
            }
        }

        return numberOfIslands
    }

    func bfs(_ i: Int, _ j: Int, _ grid: [[Node]]) {
        guard i >= 0,
              i < grid.count,
              j >= 0,
              j < grid[0].count,
              !grid[i][j].visited else {
            return
        }

        grid[i][j].visited = true

        guard grid[i][j].value != "0" else {
            return
        }

        bfs(i + 1, j, grid)
        bfs(i - 1, j, grid)
        bfs(i, j + 1, grid)
        bfs(i, j - 1, grid)
    }

    func makeNodesGrid(_ grid: [[Character]]) -> [[Node]] {
        var result = Array(repeating: Array(repeating: Node(value: "0"), count: grid[0].count), count: grid.count)
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                result[i][j] = Node(value: grid[i][j])
            }
        }
        return result
    }
}
