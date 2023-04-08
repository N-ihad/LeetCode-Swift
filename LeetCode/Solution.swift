//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        var result: [Int] = []
        result.reserveCapacity(n)

        for i in 0..<n {
            result.append(nums[i])
            result.append(nums[n + i])
        }

        return result
    }
}
