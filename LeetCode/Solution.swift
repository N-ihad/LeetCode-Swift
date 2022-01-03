//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var candidate = nums[0]
        var counter = 1

        for i in 1..<nums.count {
            counter = nums[i] == candidate ? counter + 1 : counter - 1

            if counter == 0 {
                candidate = nums[i]
                counter = 1
            }
        }

        return candidate
    }
}
