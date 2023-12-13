//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/special-positions-in-a-binary-matrix/solutions/4401333/swift-solution-with-explanation/

    Iterate through the matrix keeping track of 1s count in each row and column
    in variables rowOnesCount and columnOnesCount. 
    Once this done and we have count of 1s for each row and for each column, 
    we iterate through the matrix again and check if element on current row and column is 1,
    if it is then we check if current row and column have exactly one count of 1s. 
    If it's true then we increment our result variable by 1. 
    At the end we just return the result.
*/

class Solution {
    func numSpecial(_ mat: [[Int]]) -> Int {
        var rowOnesCount = Array(repeating: 0, count: mat.count)
        var columnOnesCount = Array(repeating: 0, count: mat[0].count)

        for i in 0..<mat.count {
            for j in 0..<mat[0].count {
                if mat[i][j] == 1 {
                    rowOnesCount[i] += 1
                    columnOnesCount[j] += 1
                }
            }
        }

        var result = 0
        for i in 0..<mat.count {
            for j in 0..<mat[0].count {
                if mat[i][j] == 1 && rowOnesCount[i] == 1 && columnOnesCount[j] == 1 {
                    result += 1
                }
            }
        }

        return result
    }
}
