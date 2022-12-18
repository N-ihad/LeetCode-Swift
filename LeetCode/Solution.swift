//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var goal = nums.count - 1
        var i = nums.count - 2

        while i >= 0 {
            if i + nums[i] >= goal {
                goal = i
            }
            i -= 1
        }

        return goal == 0
    }
}
