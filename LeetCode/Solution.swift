//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var hashSet = Set<Int>(minimumCapacity: nums.count)

        for i in 0..<nums.count {
            if !hashSet.insert(nums[i]).inserted {
                return true
            }

            if i >= k {
                hashSet.remove(nums[i-k])
            }
        }

        return false
    }
}
