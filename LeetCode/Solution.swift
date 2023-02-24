//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var L = 0
        var R = nums.count - 1

        while L != R {
            let mid = L + (R - L) / 2
            if nums[mid] < nums[mid + 1] {
                L = mid + 1
            } else {
                R = mid
            }
        }

        return L
    }
}
