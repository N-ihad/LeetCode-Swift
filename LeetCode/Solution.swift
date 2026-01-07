//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/subsets-ii/solutions/7476407/swift-solution-with-explanation-by-nihad-mjoc

    # Approach
    We first sort the input array so that duplicate numbers are adjacent, then use backtracking to generate all possible subsets by deciding at 
    each index whether to include the current element; during recursion, we skip elements that are the same as the previous one at the same recursion depth to 
    avoid generating duplicate subsets.

    ## Main Key Ideas
    - Sort the array so duplicates are next to each other.
    - Use backtracking to explore all subset combinations.
    - Always add the current subset to the result before expanding it.
    - Skip duplicate elements when they appear at the same recursion level.
    - Build subsets incrementally and backtrack after each recursive call.

    # Complexity
    - **Time complexity:** $O(2^n)$, because we potentially generate all subsets of the array.
    - **Space complexity:** $O(n)$, due to the recursion stack and the temporary subset being built (excluding the output array).
*/

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var subset: [Int] = []
        let sortedNums = nums.sorted()

        backtrack(sortedNums, 0, &subset, &result)
        return result
    }

    private func backtrack(_ nums: [Int], _ start: Int, _ subset: inout [Int], _ result: inout [[Int]]) {
        result.append(subset)

        for i in start..<nums.count {
            if i > start && nums[i] == nums[i - 1] {
                continue
            }

            subset.append(nums[i])
            backtrack(nums, i + 1, &subset, &result)
            subset.removeLast()
        }
    }
}
