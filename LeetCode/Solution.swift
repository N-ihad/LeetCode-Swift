//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/count-the-number-of-fair-pairs/solutions/6668005/swift-solution-binary-search-lower-and-u-65dd/

    Solution solves the problem by leveraging binary search. The algorithm starts by sorting the input array nums to allow
    efficient searching for valid pairs. For each element nums[i], it calculates the valid range for the sum nums[i] + nums[j] by 
    subtracting nums[i] from the lower and upper bounds, respectively, using formula:
    x+y=target
    x=target−y

    if our target is lower bound and we are on i-th iteration then we need to find lower bound in nums by using formula:
    x=lower−nums[i]

    Same way with upper bound. If our target is upper bound and we are on i-th iteration then we need to find upper bound in nums by using formula:
    x=upper−nums[i].

    We use two binary search methods binarySearchLowerBoundIndex and binarySearchUpperBoundIndex to find the indices of lower and upper bound elements.
*/

class Solution {
    func countFairPairs(_ nums: [Int], _ lower: Int, _ upper: Int) -> Int {
        var fairPairsCounter = 0
        let nums = nums.sorted()
        for i in 0..<nums.count {
            let lowerBoundIndex = binarySearchLowerBoundIndex(nums, i + 1, lower - nums[i])
            let upperBoundIndex = binarySearchUpperBoundIndex(nums, i + 1, upper - nums[i])
            fairPairsCounter += upperBoundIndex - lowerBoundIndex
        }
        return fairPairsCounter
    }

    @inline(__always)
    private func binarySearchLowerBoundIndex(_ nums: [Int], _ startIndex: Int, _ target: Int) -> Int {
        var (L, R) = (startIndex, nums.count)
        while L < R {
            let mid = (L + R) / 2
            if target <= nums[mid] {
                R = mid
            } else {
                L = mid + 1
            }
        }
        return L
    }

    @inline(__always)
    private func binarySearchUpperBoundIndex(_ nums: [Int], _ startIndex: Int, _ target: Int) -> Int {
        var (L, R) = (startIndex, nums.count)
        while L < R {
            let mid = (L + R) / 2
            if target < nums[mid] {
                R = mid
            } else {
                L = mid + 1
            }
        }
        return L
    }
}
