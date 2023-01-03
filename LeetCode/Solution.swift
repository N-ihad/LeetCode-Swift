//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func minDeletionSize(_ strs: [String]) -> Int {
        let strs = strs.map { Array($0) }
        var counter = 0

        for column in 0..<strs[0].count {
            for row in 0..<strs.count - 1 {
                if strs[row][column] > strs[row + 1][column] {
                    counter += 1
                    break
                }
            }
        }

        return counter
    }
}
