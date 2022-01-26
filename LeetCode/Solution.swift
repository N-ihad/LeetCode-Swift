//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0] }

        var totals: [Int] = [nums[0], max(nums[0], nums[1])]

        for i in 2..<nums.count {
            totals.append(max(totals[i-1], totals[i-2] + nums[i]))
        }

        return totals[totals.count-1]
    }
}
