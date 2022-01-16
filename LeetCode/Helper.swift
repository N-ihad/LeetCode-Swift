//
//  Helper.swift
//  LeetCode
//
//  Created by Nihad on 1/16/22.
//

import Foundation

struct Helper {
    static func printMatrix(_ matrix: inout [[Int]]) {
        guard !matrix.isEmpty else {
            return
        }

        var spaces: [Int: Int] = [:]

        for j in 0..<matrix[0].count {
            spaces[j] = 1
        }

        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                spaces[j] = String(matrix[i][j]).count > spaces[j]! ? String(matrix[i][j]).count + 1 : spaces[j]
            }
        }

        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                let spacesCount = String(matrix[i][j]).count < spaces[j]! ? spaces[j]! - String(matrix[i][j]).count : 1
                print(matrix[i][j], terminator: String(repeating: " ", count: spacesCount))
            }
            print()
        }
    }
}
