//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/find-the-punishment-number-of-an-integer/solutions/6427219/swift-solution-partitioning-backtracking-ojyf

    Provided solution computes the **punishment number** of `n` by iterating through numbers `1` to `n`, 
    squaring each number, and checking if the square can be partitioned into contiguous substrings summing to the original number. 
    The function `canPartitionNumToTargetSum(_:_:)` handles this check using a **backtracking approach**. 
    It recursively partitions the number by taking different possible suffixes, adding them to the current sum, 
    and verifying if the remaining digits can still form a valid partition. The helper function `backtrack(_:_:)` 
    iterates over possible partitions by progressively increasing a divisor to extract suffixes. If a valid partition is found, 
    the function returns `true`. The main function sums up all valid squared numbers and returns the final result.

    For time and space complexity analysis check the LeetCode solution link above with a detailed explanation.
*/

class Solution {
    func punishmentNumber(_ n: Int) -> Int {
        var result = 0

        for i in 1...n {
            let num = i * i

            if canPartitionNumToTargetSum(num, i) {
                result += num
            }
        }

        return result
    }

    private func canPartitionNumToTargetSum(_ num: Int, _ targetSum: Int) -> Bool {
        func backtrack(_ remaining: Int, _ currentSum: Int) -> Bool {
            if remaining <= 0 {
                return currentSum == targetSum
            }

            var divisor = 10
            while divisor <= remaining * 10 {
                let part = remaining % divisor
                let nextRemaining = remaining / divisor

                if backtrack(nextRemaining, currentSum + part) {
                    return true
                }

                divisor *= 10
            }

            return false
        }

        return backtrack(num, 0)
    }
}
