//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result: [[Int]] = []
        for i in 0..<numRows {
            if i > 1 {
                var localResult: [Int] = [1, 1]
                for j in 1..<i {
                    localResult.insert(result[i-1][j-1] + result[i-1][j], at: j)
                }
                result.append(localResult)
            } else {
                result.append(i == 0 ? [1] : [1, 1])
            }
        }
        return result
    }
}
