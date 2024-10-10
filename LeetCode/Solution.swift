//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/search-insert-position/solutions/5895056/swift-solution/

    Just a simple binary search
*/

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var a = 0
        var b = nums.count - 1

        while a <= b {
            let mid = (a + b) / 2

            if nums[mid] == target {
                return mid
            }

            if target > nums[mid] {
                a = mid + 1
            } else {
                b = mid - 1
            }
        }

        return a
    }
}
