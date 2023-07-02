//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let left = search(nums, target, isLeftDirected: true)
        let right = search(nums, target, isLeftDirected: false)
        return [left, right]
    }

    private func search(_ nums: [Int], _ target: Int, isLeftDirected: Bool) -> Int {
        var (l, r) = (0, nums.count-1)
        var result = -1
        
        while l <= r {
            let m = l + (r - l) / 2
            
            if nums[m] > target {
                r = m - 1
            } else if nums[m] < target {
                l = m + 1
            } else {
                result = m

                if isLeftDirected {
                    r = m - 1
                } else {
                    l = m + 1
                }
            }
        }

        return result
    }
}
