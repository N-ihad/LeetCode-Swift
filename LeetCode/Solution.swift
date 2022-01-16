//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        for i in 0..<Int(floor(Double(matrix.count)/2)) {
            for j in i..<matrix.count-1-i {
                let temp1 = matrix[j][matrix.count-1-i]
                let temp2 = matrix[matrix.count-1-j][i]
                matrix[j][matrix.count-1-i] = matrix[i][j]
                matrix[matrix.count-1-j][i] = matrix[matrix.count-1-i][matrix.count-1-j]
                matrix[matrix.count-1-i][matrix.count-1-j] = temp1
                matrix[i][j] = temp2
            }
        }
    }
}
