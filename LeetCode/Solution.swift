//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0

        for i in 1..<dp.count {
            for j in 0..<coins.count where i - coins[j] >= 0 {
                let leftover = i - coins[j]
                dp[i] = min(dp[i], 1 + dp[leftover])
            }
        }

        return dp[amount] == amount + 1 ? -1 : dp[amount]
    }
}
