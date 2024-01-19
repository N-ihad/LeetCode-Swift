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

/*
    https://leetcode.com/problems/minimum-falling-path-sum/solutions/4592196/swift-solution-iterative-space-optimized/

    Start from the rows.count-1 and compute for each cell its below left, mid and right, 
    then take minimum of these 3 values and save it into temporary row temp, so as to
    have original row not modified, after we done calculating minimums for the row, we save 
    temp row into row and work our way up the same manner. We only need 1 array to keep track
    of previous values. We could've avoided even that 1 array as additional memory if we could
    modify the original matrix, then we would just write matrix[matrix.count - 1 - i][j] += min(left, mid, right),
    no additional array would've been needed and space complexity would've been O(1)O(1)O(1), 
    since we don't need to store any row or column.

// MARK: - Iterative, space optimized solution

class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        var row = matrix[matrix.count-1]

        for i in 1..<matrix.count {
            var temp = row
            for j in 0..<matrix[0].count {
                let left = j == 0 ? Int.max : row[j-1]
                let mid = row[j]
                let right = j == matrix[0].count-1 ? Int.max : row[j+1]
                temp[j] = min(left, mid, right) + matrix[matrix.count-1-i][j]
            }
            row = temp
        }

        return row.min()!
    }
}
*/
