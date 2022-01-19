//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var res: [Int] = []
        var buff = 1
        res.append(buff)

        for i in 0..<nums.count-1 {
            buff *= nums[i]
            res.append(buff)
        }

        buff = 1
        for i in 1..<res.count {
            buff *= nums[nums.count-i]
            res[res.count-1-i] *= buff
        }

        return res
    }
}
