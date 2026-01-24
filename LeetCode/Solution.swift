//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/minimize-maximum-pair-sum-in-array/solutions/7520319/swift-solution-with-explanation-by-nihad-xf1b

    # Intuition
    ![Screenshot 2026-01-24 at 4.01.33 PM.png](https://assets.leetcode.com/users/images/a3dade57-56b1-4090-8297-569c6dfa8e79_1769259698.2460127.png)

    # Approach
    We minimize the maximum pair sum by pairing the smallest numbers with the largest numbers. 
    After sorting the array, this strategy balances each pair so that no pair becomes unnecessarily large, 
    ensuring the overall maximum pair sum is as small as possible.

    ## Main Key Ideas
    - Sort the array in ascending order.
    - Pair the smallest element with the largest element, the second smallest with the second largest, and so on.
    - This greedy pairing minimizes the worst (maximum) pair sum by balancing extremes.
    - While iterating through these pairs, we track the maximum pair sum encountered.
    - The final answer is the largest pair sum among these optimal pairs.

    # Complexity
    - Time complexity: $O(n \log n)$, due to sorting the array.
    - Space complexity: $O(1)$, since the sorting can be done in-place and only constant extra space is used (excluding input/output).
*/

class Solution {
    func minPairSum(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var result = 0
        for i in 0..<nums.count/2 {
            result = max(result, nums[i] + nums[nums.count - i - 1])
        }
        return result
    }
}
