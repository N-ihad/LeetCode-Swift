//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        if r * c != mat.count * mat[0].count ||
           r == mat.count && c == mat[0].count { 
            return mat   
        }

        var result = Array(repeating: Array(repeating: 0, count: c), count: r)
        var (row, column) = (0, 0)
        
        for i in 0..<mat.count {
            for j in 0..<mat[0].count {
                result[row][column] = mat[i][j]

                if column + 1 > c - 1 {
                    column = 0
                    row += 1
                } else {
                    column += 1
                }
            }
        }

        return result
    }
}
