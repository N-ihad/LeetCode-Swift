//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/four-divisors/solutions/7463721/swift-solution-with-explanation-by-nihad-a0z7

    In our solution, we iterate through each number in the array and explicitly count its divisors while also summing them. For every number, we 
    try all possible divisor candidates from 1 up to the number itself, and whenever a candidate divides the number evenly, we 
    increment a divisor counter and add it to the running sum. To keep the logic efficient and intuitive, we 
    immediately stop checking further if the divisor count exceeds four, since such a number can no longer qualify. 
    After finishing the checks for a number, we only add its divisor sum to the final result if it has exactly four divisors.

    Time complexity: O(nm), m – is the maximum number in nums array
    Space complexity: O(1)
*/

class Solution {
    func sumFourDivisors(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            var count = 0
            var sum = 0
            for divisorCandidate in 1...num {
                if num % divisorCandidate == 0 {
                    sum += divisorCandidate
                    count += 1
                }

                if count > 4 {
                    sum = 0
                    break
                }
            }

            if count == 4 {
                result += sum
            }
        }

        return result
    }
}
