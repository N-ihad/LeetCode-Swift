//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func diagonalSort(_ mat: [[Int]]) -> [[Int]] {
        var result: [[Int]] = mat
        for i in 0..<mat.count {
            if (mat.count - 1 - i) + 1 >= mat.count {
                continue
            }

            var _i = mat.count - 1 - i
            var j = 0
            var arr: [Int] = []
            while _i < mat.count && _i >= 0 && j < mat[0].count && j >= 0 {
                arr.append(mat[_i][j])
                _i += 1
                j += 1
            }

            _i = mat.count - 1 - i
            j = 0
            arr.sort()
            for i in 0..<arr.count {
                result[_i][j] = arr[i]
                _i += 1
                j += 1
            }
        }

        for j in 1..<mat[0].count {
            if j + 1 >= mat[0].count {
                continue
            }

            var i = 0
            var _j = j
            var arr: [Int] = []
            while i < mat.count && i >= 0 && _j < mat[0].count && _j >= 0 {
                arr.append(mat[i][_j])
                i += 1
                _j += 1
            }

            i = 0
            _j = j
            arr.sort()
            for j in 0..<arr.count {
                result[i][_j] = arr[j]
                i += 1
                _j += 1
            }
        }

        return result
    }
}
