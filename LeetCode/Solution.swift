//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var matrix = Array(repeating: Array(repeating: 1, count: n), count: m)

        for i in 1..<matrix.count {
            for j in 1..<matrix[0].count {
                matrix[i][j] = matrix[i-1][j] + matrix[i][j-1]
            }
        }

        return matrix[m-1][n-1]
    }
}
