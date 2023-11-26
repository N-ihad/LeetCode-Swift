//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let n = triangle.count
        var dp = triangle[n-1]

        for row in 1..<n {
            for col in 0..<triangle[n-1-row].count {
                dp[col] = min(triangle[n-1-row][col] + dp[col], triangle[n-1-row][col] + dp[col+1])
            }
        }

        return dp[0]
    }
}

/*
// MARK: - DFS + Memoization
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        if triangle.count == 1 {
            return triangle[0][0]
        }

        var cache: [String: Int] = [:]
        return min(triangle[0][0] + dfs(1, 0, triangle, &cache), triangle[0][0] + dfs(1, 1, triangle, &cache))
    }

    private func dfs(_ i: Int, _ j: Int, _ triangle: [[Int]], _ cache: inout [String: Int]) -> Int {
        if i == triangle.count - 1 {
            return triangle[i][j]
        }

        if cache["\(i),\(j)"] != nil {
            return cache["\(i),\(j)"]!
        }

        let left = triangle[i][j] + dfs(i + 1, j, triangle, &cache)
        let right = triangle[i][j] + dfs(i + 1, j + 1, triangle, &cache)

        let minPath = min(left, right)
        cache["\(i),\(j)"] = minPath

        return minPath
    }
}
*/
