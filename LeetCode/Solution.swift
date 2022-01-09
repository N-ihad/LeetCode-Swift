//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.isEmpty { return 0 }

        var L = 0
        for i in 0..<nums.count {
            if nums[i] == val { continue }
            nums[L] = nums[i]
            L += 1
        }

        return L
    }
}
