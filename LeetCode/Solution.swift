//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/count-partitions-with-even-sum-difference/solutions/7394772/swift-solution-by-nihad_s-si60

    Solution counts how many split positions create an even difference between the sums of the left and right subarrays. 
    We first compute the total sum of the array, then iterate through each valid partition index while updating a running `rightSum`
    by subtracting the current element. The left sum is derived as `totalSum - rightSum`, allowing us to avoid recalculating sums. 
    For every split, we check whether `(leftSum - rightSum) % 2 == 0`, meaning the difference is even, and increment the result when true. 
    The loop stops before the final index to ensure both sides are non-empty.
*/

class Solution {
    func countPartitions(_ nums: [Int]) -> Int {
        var result = 0
        let totalSum = nums.reduce(0, +)
        var rightSum = totalSum
        for i in 0..<nums.count {
            if i == nums.count - 1 {
                break
            }

            rightSum -= nums[i]
            let leftSum = totalSum - rightSum
            if (leftSum - rightSum) % 2 == 0 {
                result += 1
            }
        }
        return result
    }
}
