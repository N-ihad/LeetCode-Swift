//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func minimumDifference(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        var min = 100000
        for i in 0...nums.count - k {
            let difference = nums[i + k - 1] - nums[i]
            if difference < min {
                min = difference
            }
        }
        return min
    }
}
