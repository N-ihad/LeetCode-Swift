//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/minimize-the-maximum-difference-of-pairs/solutions/6840551/swift-solution-with-explanation-sorting-jstwm

    The function minimizeMax solves the problem of forming p pairs from the input array nums such that no index is reused and 
    the maximum absolute difference among all selected pairs is minimized. We use binary search with a greedy pairing strategy to 
    find the minimum possible value of that maximum difference.

    Step-by-step Explanation:
        Edge Case - No Pairs Needed:
            If p == 0, we return 0 immediately because no pairs are needed and thus the maximum difference is defined as 0.

        Sort the Array:
            The array nums is sorted in ascending order. This ensures that the smallest differences between elements are adjacent, 
            allowing us to greedily form the smallest possible pairs.

        Binary Search Setup:
            We define the search range for the maximum allowed difference:
                L = 0 (smallest possible difference)
                R = nums.last! (in the worst case, the largest value in the array).
                ans tracks the smallest possible maximum difference that satisfies the constraints.

        Binary Search Loop:
            For each midpoint mid between L and R, we try to form as many pairs as possible where the absolute difference between elements is ≤ mid.
            We iterate through the sorted array using a greedy approach:
                If the difference between nums[i-1] and nums[i] is ≤ mid, we count it as a valid pair and skip both elements (i += 2) to avoid index reuse.
                Otherwise, we move to the next element (i += 1).

        Check Pair Count:
            If the number of valid pairs formed (currPairsCount) is greater than or equal to p, then mid is a valid candidate for our answer. We update ans = mid and search the left half (R = mid - 1) to try to minimize further.
            If not enough pairs can be formed, we need to allow a larger difference and search the right half (L = mid + 1).

        Return the Minimum Maximum Difference:
            After the binary search completes, ans holds the smallest possible maximum difference that allows p valid, non-overlapping pairs.

        Time Complexity:
            O(nlogn+nlogM), where n is the length of the array and M is the range of differences (approximately nums.max - nums.min). 
            Sorting takes O(nlogn), binary search and diff calculations take O(nlogM), thus O(nlogn+nlogM)
        Space Complexity:
            O(1) extra space (excluding the space used to sort the input).
*/

class Solution {
    func minimizeMax(_ nums: [Int], _ p: Int) -> Int {
        if p == 0 {
            return 0
        }

        let nums = nums.sorted()
        var ans = Int.max
        var (L, R) = (0, nums[nums.count-1])
        while L <= R {
            let mid = (R + L) / 2
            var currPairsCount = 0
            var i = 1
            while i < nums.count {
                let diff = abs(nums[i-1] - nums[i])
                if diff <= mid {
                    currPairsCount += 1
                    i += 2
                } else {
                    i += 1
                }
            }

            if currPairsCount >= p {
                ans = mid
                R = mid - 1
            } else {
                L = mid + 1
            }
        }

        return ans
    }
}
