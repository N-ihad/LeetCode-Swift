//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var L = 0
        var R = nums.count - 1
        var i = 0
        while i <= R {
            if nums[i] == 0 {
                nums.swapAt(i, L)
                L += 1
                i += 1
            } else if nums[i] == 2 {
                nums.swapAt(i, R)
                R -= 1
            } else {
                i += 1
            }
        }
    }
}
