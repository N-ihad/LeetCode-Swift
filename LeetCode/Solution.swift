//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/subsets/solutions/7476457/swift-solution-with-explanation-by-nihad-mx4u

    # Approach
    We use backtracking to generate all possible subsets by iterating through the array and deciding for each element whether to include it in the current subset, 
    adding every intermediate subset to the result as we explore the recursion tree.

    ## Main Key Ideas
    - Use backtracking to explore all subset combinations.
    - Start recursion from a given index to avoid reusing elements.
    - Add the current subset to the result at every recursion step.
    - Incrementally build subsets by including one element at a time.
    - Backtrack by removing the last element before moving to the next choice.

    # Complexity
    - **Time complexity:** $O(2^n)$, because all possible subsets of the array are generated.
    - **Space complexity:** $O(n)$, due to the recursion stack and the temporary subset array (excluding the output array).
*/

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var subset: [Int] = []

        backtrack(nums, 0, &subset, &result)
        return result
    }

    private func backtrack(_ nums: [Int], _ start: Int, _ subset: inout [Int], _ result: inout [[Int]]) {
        result.append(subset)

        for i in start..<nums.count {
            subset.append(nums[i])
            backtrack(nums, i + 1, &subset, &result)
            subset.removeLast()
        }
    }
}
