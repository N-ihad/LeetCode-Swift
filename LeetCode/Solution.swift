//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var hashMap: [Int: Int] = [:]

        for i in 0..<nums.count {
            hashMap[i] = 1
        }

        var i = nums.count - 2
        while i >= 0 {
            var R = i + 1
            while R < nums.count {
                if nums[i] < nums[R] {
                    hashMap[i] = max(hashMap[i]!, hashMap[R]! + 1)
                }
                R += 1
            }
            i -= 1
        }

        return hashMap.values.max()!
    }
}
