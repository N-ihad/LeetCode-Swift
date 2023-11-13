//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func numSquares(_ n: Int) -> Int {
        var dp = Array(repeating: n + 1, count: n + 1)
        dp[0] = 0
        dp[1] = 1

        for i in 1..<n+1 {
            for j in 1..<i {
                let square = j * j

                if square > i {
                    break
                }

                dp[i] = min(dp[i], 1 + dp[i - square])
            }
        }

        return dp[n]
    }
}
