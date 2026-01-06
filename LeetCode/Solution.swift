//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/maximum-gap/solutions/7470459/swift-solution-with-explanation-by-nihad-986q

    # Approach
    In our solution, we achieve linear time sorting by using radix sort instead of a comparison-based sort. We repeatedly group numbers into buckets based on the 
    current digit (starting from the least significant digit), using base 10 buckets, and then rebuild the array from these buckets. 
    This process is repeated for as many digits as the maximum number contains, ensuring the array becomes fully sorted. Once the array is sorted, 
    we scan through it once and compute the difference between every pair of adjacent elements, keeping track of the maximum gap found. 
    If the array contains fewer than two elements, we immediately return 0.

    **Key ideas:**
    - Use radix sort to sort numbers in linear time.
    - Sort numbers digit by digit using buckets (base 10).
    - Reconstruct the array after each digit pass.
    - Compute the maximum difference between consecutive elements in the sorted array.
    - Return 0 early if the array has fewer than two elements.

    # Complexity
    - Time complexity: $O(nd)$, $d$ is the number of digits in the maximum number, because radix sort processes all `n` elements once per digit.
    - Space complexity: $O(n)$, since the buckets collectively store all elements during each digit pass and the extra space grows linearly with the input size.
*/

class Solution {
    func maximumGap(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return 0
        }

        var (nums, m) = (nums , 1)
        for _ in 0..<String(nums.max()!).count {
            var buckets = Array(repeating: [Int](), count: 10)
            for i in 0..<nums.count {
                let digit = nums[i] % (m*10) / m
                buckets[digit].append(nums[i])
            }
            m *= 10
            nums = buckets.flatMap { $0 }
        }

        var max = 0
        for i in 1..<nums.count {
            if nums[i]-nums[i-1] > max {
                max = nums[i]-nums[i-1]
            }
        }

        return max
    }
}
