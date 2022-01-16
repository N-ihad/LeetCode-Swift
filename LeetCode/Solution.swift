//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let trueSum = (nums.count*(nums.count + 1))/2
        var sum = 0
        for i in 0..<nums.count {
            sum += nums[i]
        }
        return trueSum - sum
    }
}
