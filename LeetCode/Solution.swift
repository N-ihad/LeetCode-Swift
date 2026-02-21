//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/prime-number-of-set-bits-in-binary-representation/solutions/7596811/swift-simple-solution-with-explanation-b-9awa
*/

class Solution {
    func countPrimeSetBits(_ left: Int, _ right: Int) -> Int {
        let possiblePrimeBitCounts: Set<Int> = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31]        
        var count = 0
        for num in left...right {
            if possiblePrimeBitCounts.contains(num.nonzeroBitCount) {
                count += 1
            }
        }
        return count
    }
}
