//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        var result = Array(repeating: [Int](), count: matrix[0].count)
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                result[j].append(matrix[i][j])
            }
        }
        return result
    }
}
