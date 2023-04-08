//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var counts: [Int: Int] = [:]

        for i in 0..<nums.count {
            counts[nums[i], default: -1] += 1
        }

        var counter = 0
        for count in counts.values {
            if count > 0 {
                counter += count * (count + 1) / 2
            }
        }
        
        return counter
    }
}
