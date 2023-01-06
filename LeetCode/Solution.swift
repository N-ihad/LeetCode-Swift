//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        let costs = costs.sorted()
        var coins = coins

        for i in 0..<costs.count {
            if costs[i] > coins {
                return i
            }

            if i == costs.count - 1 { return i + 1 }

            coins -= costs[i]
        }

        return 0
    }
}
