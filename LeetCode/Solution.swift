//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/longest-increasing-subsequence/solutions/4514081/swift-solution-dp-top-down-approach-with-explanation/

    Iterating through an array from the end till the beginning, populating our `dp` variable with optimal values.
    If we are on `i` index we iterate through `i+1` till `nums.count-1` to find the longest increasing subsequence. 
    So if we have an array [10,9,2,5,3,7,101,18] and we were on element 3 (i = 4th index), 
    then we would find our max in `dp` array of indices 5, 6, 7, so element 7 (j = 5th index) has
    the most increasing subsequence which is 2, 101 has 1 and 18 has 1 as well, so we take 2 as our max.
    Same logic applies for each iteration. At the end we get the max of `dp` to find the element from 
    which we can form the longest subsequence out of all.
*/

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 1, count: nums.count)
        let n = nums.count
        for i in 1..<n {
            for j in n-i..<nums.count {
                if nums[n-1-i] < nums[j] {
                    dp[n-1-i] = max(dp[n-1-i], 1, 1 + dp[j])
                }
            }
        }
        return dp.max()!
    }
}
