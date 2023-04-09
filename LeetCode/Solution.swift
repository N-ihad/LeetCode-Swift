//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func leftRigthDifference(_ nums: [Int]) -> [Int] {
        var sum = 0
        var result: [Int] = []
        result.reserveCapacity(nums.count)

        for i in 0..<nums.count {
            result.append(sum)
            sum += nums[i]
        }

        sum = 0
        for i in 0..<nums.count {
            result[nums.count-1-i] = abs(result[nums.count-1-i] - sum)
            sum += nums[nums.count-1-i]
        }

        return result
    }
}
