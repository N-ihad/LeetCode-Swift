//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var matrix = Array(repeating: Array(repeating: false, count: p.count + 1), count: s.count + 1)
        matrix[0][0] = true
        let s = Array(s), p = Array(p)

        for i in 0..<s.count {
            matrix[i+1][0] = false
        }

        for j in 0..<p.count {
            matrix[0][j+1] = p[j] == "*" ? matrix[0][j] : false
        }

        for i in 1..<matrix.count {
            for j in 1..<matrix[0].count {
                if p[j-1] == "?" || p[j-1] == s[i-1] {
                    matrix[i][j] = matrix[i-1][j-1]
                } else if p[j-1] == "*" {
                    matrix[i][j] = matrix[i-1][j] || matrix[i][j-1]
                } else {
                    matrix[i][j] = false
                }
            }
        }

        return matrix[s.count][p.count]
    }
}
