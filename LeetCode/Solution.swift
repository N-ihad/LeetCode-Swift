//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        var low = prices[0]
        var potentialProfit = 0

        for i in 0..<prices.count-1 {
            if prices[i] < prices[i+1] { // upward trend, bullish
                potentialProfit = prices[i+1] - low
            } else if prices[i] > prices[i+1] { // downward trend, bearish
                profit += potentialProfit
                low = prices[i+1]
                potentialProfit = 0
            }
        }

        return profit + potentialProfit
    }
}
