//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {

    private var cache: [Int: Int] = [0: 1, 1: 1]

    func numTrees(_ n: Int) -> Int {
        if cache[n] != nil {
            return cache[n]!
        }

        var sum = 0
        for i in 1...n {
            sum += numTrees(i - 1) * numTrees(n - i)
        }

        cache[n] = sum
        return sum
    }
}
