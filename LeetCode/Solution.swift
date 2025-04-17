//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/count-equal-and-divisible-pairs-in-an-array/solutions/6661618/swift-solution-brute-force-on2-by-nihad_-rzbq

    Solution uses a straightforward brute-force approach to count the number of pairs (i, j) where 
    nums[i] == nums[j] and (i * j) is divisible by k. We iterate through all possible pairs of indices i and j (where i < j) using
    two nested loops. For each pair, we check if the elements at the indices i and j are equal, and whether the product of the 
    indices i * j is divisible by k. If both conditions are satisfied, we increment the pairs counter.
*/

class Solution {
    func countPairs(_ nums: [Int], _ k: Int) -> Int {
        var pairs = 0

        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] == nums[j] && (i * j) % k == 0 {
                    pairs += 1
                }
            }
        }

        return pairs
    }
}
