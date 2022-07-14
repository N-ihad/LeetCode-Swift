//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: word1.count + 1), count: word2.count + 1)
        let word1 = Array(word1)
        let word2 = Array(word2)

        for i in 0..<matrix.count {
            matrix[i][0] = i
        }

        for i in 0..<matrix[0].count {
            matrix[0][i] = i
        }

        for i in 1..<matrix.count {
            for j in 1..<matrix[0].count {
                if word1[j-1] != word2[i-1] {
                    matrix[i][j] = min(matrix[i][j-1], matrix[i-1][j], matrix[i-1][j-1]) + 1
                } else {
                    matrix[i][j] = matrix[i-1][j-1]
                }
            }
        }

        return matrix[word2.count][word1.count]
    }
}
