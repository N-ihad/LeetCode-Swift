//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/minimum-number-of-operations-to-make-elements-in-array-distinct/solutions/6654663/swift-solution-o-n-hashmap

    Solution finds the minimum number of operations required to make all elements in the array nums distinct by simulating the
    removal of 3 elements at a time from the front. It iterates from the end of the array toward the front, maintaining a 
    set uniqueNums to track elements already seen. If a duplicate is found during this reverse iteration, it calculates how 
    many full chunks of 3 elements would need to be removed from the start to eliminate the duplicate (i.e., (nums.count - i - 1) / 3 + 1) 
    and returns that as the answer. If no duplicates are found, it returns 0, meaning no operations are needed. 
    This approach avoids simulating actual removals (which takes O(n)) and instead uses set (hash map) tracking and index math for efficiency.
*/

class Solution {
    func minimumOperations(_ nums: [Int]) -> Int {
        var uniqueNums: Set<Int> = []

        for i in 0..<nums.count {
            if uniqueNums.contains(nums[nums.count - i - 1]) {
                return (nums.count - i - 1) / 3 + 1
            } else {
                uniqueNums.insert(nums[nums.count - i - 1])
            }
        }

        return 0
    }
}
