//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/minimum-falling-path-sum/solutions/4592055/swift-solution-with-explanation-dfs-memoization/

    DFS the matrix for each cell in first row inspecting left, mid and right elements,
    once we inspect all paths below cell we calculate min(left, mid, right) and
    sum it with the above element matrix[i][j]. We also record the optimal result for
    each cell while going up in our memoization variable cache so as to not repeat same 
    calculations for other cells. We work our way up storing the results and in the end 
    of the iteration we compare it with the existing minimum, if it's less than we store current path.
*/

class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        var result = Int.max
        var cache: [String: Int] = [:]
        cache.reserveCapacity(matrix.count * matrix[0].count)

        for j in 0..<matrix[0].count {
            result = min(dfs(matrix, 0, j, &cache), result)
        }

        return result
    }

    private func dfs(_ matrix: [[Int]], _ i: Int, _ j: Int, _ cache: inout [String: Int]) -> Int {
        if i < 0 || i >= matrix.count || j < 0 || j >= matrix[0].count {
            return Int.max
        }

        if let minPath = cache["\(i),\(j)"] {
            return minPath
        }

        if i == matrix.count - 1 {
            return matrix[i][j]
        }

        let left = dfs(matrix, i + 1, j - 1, &cache)
        let mid = dfs(matrix, i + 1, j, &cache)
        let right = dfs(matrix, i + 1, j + 1, &cache)

        let minimum = min(left, mid, right) + matrix[i][j]
        cache["\(i),\(j)"] = minimum

        return minimum
    }
}
