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

            coins -= costs[i]
        }

        return costs.count
    }
}
