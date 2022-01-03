//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var L = 0
        var R = 0

        while R != nums.count {
            if nums[R] != 0 {
                let temp = nums[L]
                nums[L] = nums[R]
                nums[R] = temp
                L += 1
            }
            R += 1
        }
    }
}
