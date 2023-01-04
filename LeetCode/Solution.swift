//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {

        if cost.reduce(0, +) > gas.reduce(0, +) { return -1 }

        var total = 0
        var index = 0

        for i in 0..<gas.count {
            total += gas[i] - cost[i]
            if total < 0 {
                total = 0
                index = i + 1
            }
        }

        return index
    }
}
