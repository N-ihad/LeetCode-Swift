//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        enum Direction {
            case right
            case down
            case left
            case up
        }

        var direction: Direction = .right
        var result: [Int] = []
        let (m, n) = (matrix.count, matrix[0].count)
        let count = m * n
        var (i, j) = (0, 0) // (row, column)
        var hashTable: [Int: Bool] = [:]

        while result.count != count {
            switch direction {
            case .right:
                if j < n && hashTable[matrix[i][j]] == nil {
                    hashTable[matrix[i][j]] = true
                    result.append(matrix[i][j])
                    j += 1
                } else {
                    direction = .down
                    j -= 1
                    i += 1
                }
            case .down:
                if i < m && hashTable[matrix[i][j]] == nil {
                    hashTable[matrix[i][j]] = true
                    result.append(matrix[i][j])
                    i += 1
                } else {
                    direction = .left
                    i -= 1
                    j -= 1
                }
            case .left:
                if j >= 0 && hashTable[matrix[i][j]] == nil {
                    hashTable[matrix[i][j]] = true
                    result.append(matrix[i][j])
                    j -= 1
                } else {
                    direction = .up
                    j += 1
                    i -= 1
                }
            case .up:
                if i >= 0 && hashTable[matrix[i][j]] == nil {
                    hashTable[matrix[i][j]] = true
                    result.append(matrix[i][j])
                    i -= 1
                } else {
                    direction = .right
                    i += 1
                    j += 1
                }
            }
        }

        return result
    }
}
