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

        for i in 0..<prices.count-1 {
            if prices[i] < prices[i+1] { // upward trend
                profit += prices[i+1] - prices[i]
            }
        }

        return profit
    }
}
