//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.isEmpty { return 0 }

        var L = 0
        var seen = nums[0]

        for i in 0..<nums.count {
            if nums[i] == seen { continue }
            L += 1
            seen = nums[i]
            nums[L] = nums[i]
        }

        return L + 1
    }
}
