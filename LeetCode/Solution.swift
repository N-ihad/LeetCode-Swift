//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var hashMap: [Int: Bool] = [:]
        for i in 0..<nums.count {
            if hashMap[nums[i]] != nil {
                return true
            } else {
                hashMap[nums[i]] = true
            }
        }
        return false
    }
}
