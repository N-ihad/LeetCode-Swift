//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let n = triangle.count
        var dp = triangle[n-1]

        for row in 1..<n {
            for col in 0..<triangle[n-1-row].count {
                dp[col] = min(triangle[n-1-row][col] + dp[col], triangle[n-1-row][col] + dp[col+1])
            }
        }

        return dp[0]
    }
}
