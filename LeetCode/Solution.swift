//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var buff = -1

        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                if i == 0 && matrix[i][j] == 0 { buff = 0 }
                if i != 0 && matrix[i][j] == 0 {
                    matrix[0][j] = 0
                    matrix[i][0] = 0
                }
            }
        }

        for i in 1..<matrix.count {
            for j in 1..<matrix[0].count {
                if matrix[0][j] == 0 || matrix[i][0] == 0 { matrix[i][j] = 0 }
            }
        }

        for i in 0..<matrix.count {
            if matrix[0][0] == 0 { matrix[i][0] = 0 }
        }

        for j in 0..<matrix[0].count {
            if buff == 0 { matrix[0][j] = 0 }
        }
    }

    func printMatrix(_ m: [[Int]]) {
        print("[")
        for i in 0..<m.count {
            print("[", terminator: "")
            for j in 0..<m[0].count {
                print(m[i][j], terminator: " ")
            }
            print("]")
        }
        print("]")
    }
}
