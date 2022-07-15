//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        let allSum = nums.reduce(0) { $0 + $1 }
        var currentSum = 0

        for i in 0..<nums.count {
            currentSum += nums[i]

            if (allSum - currentSum) == (currentSum - nums[i]) {
                return i
            }
        }

        return -1
    }
}
