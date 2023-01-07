//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {

        if numRows == 1 { return s }

        let sections = Int(ceil(Double(s.count) / (2.0 * Double(numRows) - 2.0)))
        let columns = sections * (numRows - 1)

        var matrix = Array(repeating: Array(repeating: Character(" "), count: columns), count: numRows)

        var (i, j) = (0, 0)
        var isDirectionDown = true
        for c in s {
            if isDirectionDown {
                if i == numRows - 1 {
                    isDirectionDown = false
                    matrix[i][j] = c
                    i -= 1
                    j += 1
                } else {
                    matrix[i][j] = c
                    i += 1
                }
            } else {
                if i == 0 {
                    isDirectionDown = true
                    matrix[i][j] = c
                    i += 1
                } else {
                    matrix[i][j] = c
                    i -= 1
                    j += 1
                }
            }
        }

        var answer = ""
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                if matrix[i][j] != " " {
                    answer += String(matrix[i][j])
                }
            }
        }

        return answer
    }
}
