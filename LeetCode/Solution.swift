//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/champagne-tower/solutions/7603165/swift-solution-with-explanation-by-nihad-fcnd
*/

class Solution {
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        if query_row == 0 {
            return min(1.0, Double(poured))
        }

        var prev = [Double(poured)]

        for row in 1...query_row {
            var current = Array(repeating: 0.0, count: row + 1)

            for j in 0...row {
                // From left parent
                if j - 1 >= 0 {
                    current[j] += max(0.0, prev[j - 1] - 1.0) / 2.0
                }
                // From right parent
                if j <= prev.count - 1 {
                    current[j] += max(0.0, prev[j] - 1.0) / 2.0
                }
            }
            prev = current
        }

        return min(1.0, prev[query_glass])
    }
}
