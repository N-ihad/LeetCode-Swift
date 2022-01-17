//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var (i, j) = (matrix.count-1, 0)
        while i >= 0 && j < matrix[0].count {
            if matrix[i][j] == target { return true }
            if target > matrix[i][j] {
                j += 1
            } else {
                i -= 1
            }
        }
        return false
    }
}
