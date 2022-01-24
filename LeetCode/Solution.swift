//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let nums = Set(nums)
        var res = 0

        for num in nums {
            if !nums.contains(num-1) {
                var tempNum = num + 1
                while nums.contains(tempNum) { tempNum += 1 }
                res = tempNum - num > res ? tempNum - num : res
            }
        }

        return res
    }
}
