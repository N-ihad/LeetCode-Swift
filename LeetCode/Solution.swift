//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/trionic-array-i/solutions/7550398/swift-solution-with-explanation-by-nihad-7yie

    # Intuition
    The key observation is that for an array to be trionic, its structure must strictly follow this exact pattern: **an increasing segment, followed by 
    a decreasing segment, followed by another increasing segment** — in that order. These three phases must appear consecutively and cover the 
    entire array (with no extra transitions). And that behavious is exactly simulated in code.

    # Approach
    We simulate these three phases using a pointer `i` that walks through the array. 
    First, we move forward while the sequence is strictly increasing. 
    Then we continue while it is strictly decreasing. 
    Finally, we move forward again while it is strictly increasing. 
    We count how many valid phases we successfully complete. 
    The array is trionic only if we complete all three phases in order and reach the end of the array exactly.

    # Complexity
    - Time complexity: $O(n)$, since we traverse the array at most once.
    - Space complexity: $O(1)$
*/

class Solution {
    func isTrionic(_ nums: [Int]) -> Bool {
        var (trionicCount, i, n) = (0, 0, nums.count)
        while i < n - 1 && nums[i] < nums[i+1] {
            i += 1
            if trionicCount == 0 { trionicCount += 1 }
        }

        while i < n - 1 && nums[i] > nums[i+1] {
            i += 1
            if trionicCount == 1 { trionicCount += 1 }
        }

        while i < n - 1 && nums[i] < nums[i+1] {
            i += 1
            if trionicCount == 2 { trionicCount += 1 }
        }

        return trionicCount == 3 && i == n - 1
    }
}
