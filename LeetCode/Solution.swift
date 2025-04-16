//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/count-the-number-of-good-subarrays/solutions/6658159/swift-solution-on-sliding-window-by-niha-ifmi

    Solution uses the sliding window technique to efficiently count the number of good subarrays. We use two pointers, L and R, 
    to represent the current subarray under consideration. The pointer L marks the left boundary of the subarray, while R marks the right boundary. 
    As we expand the subarray by moving R to the right, we maintain a frequency map to track how many times each element appears within the window.

    For each new increment of frequencies hash map for given num[x] we can calculate number of new pairs by using simple formula: frequencies[nums[x]]−1 and 
    we add it to our pairs counter. Same thing if we decrement frequencies we just subtract frequencies[nums[x]] without − 1 part since we already decremented it.

    If condition pairs >= k is valid, then it means that all right subarrays are gonna be by default valid as well (since we are just adding new elements, 
    not removing anything), hence we can calculate the number of such subarrays left by: nums.count - R + 1

    For each new element added to the window, we calculate how many pairs (i, j) such that arr[i] == arr[j] can be formed, and keep track of the number of such pairs. 
    If the number of pairs exceeds or equals k, we add the number of valid subarrays (from L to the end) to the result. 
    The window is then contracted by incrementing L, and we adjust the frequency map and pair count accordingly.
*/

class Solution {
    func countGood(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        var frequencies: [Int: Int] = [:]
        var (L, R) = (0, 0)
        var pairs = 0

        while L < nums.count {
            while R < nums.count && pairs < k {
                frequencies[nums[R], default: 0] += 1
                pairs += frequencies[nums[R]]! - 1
                R += 1
            }

            if pairs >= k {
                result += nums.count - R + 1
            }

            frequencies[nums[L]]! -= 1
            pairs -= frequencies[nums[L]]!
            L += 1
        }

        return result
    }
}
