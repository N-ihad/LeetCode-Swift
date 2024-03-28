//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/length-of-longest-subarray-with-at-most-k-frequency/solutions/4939205/swift-solution-sliding-window-hash-table-counting-with-explanation/

    We initialize our sliding window which is represented with left edge `l` and right edge `r`. 
    Iterating through an array and counting frequency of each `num`, 
    if frequency is more than allowed `k` we start moving our left edge of 
    sliding window `l` by 1 each iteration (we shouldn't also be greater than right edge `r`). 
    Otherwise we just calculate our maximum `result = max(result, r - l + 1)`.
*/

class Solution {
    func maxSubarrayLength(_ nums: [Int], _ k: Int) -> Int {
        var freqs: [Int: Int] = [:]
        var (l, r, result) = (0, 0, 0)

        while r < nums.count {
            freqs[nums[r], default: 0] += 1

            while freqs[nums[r]]! > k && l <= r {
                freqs[nums[l]]! -= 1
                l += 1
            }

            result = max(result, r - l + 1)
            r += 1
        }

        return result
    }
}
