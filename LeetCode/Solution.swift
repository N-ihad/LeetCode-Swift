//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var hashMap: [Int: Int] = [:]
        var newHashMap: [Int: [Int]] = [:]
        var res: [Int] = []

        for i in 0..<nums.count {
            hashMap[nums[i]] = hashMap[nums[i]] != nil ? hashMap[nums[i]]! + 1 : 1
            newHashMap[i+1] = []
        }

        for (key, value) in hashMap {
            newHashMap[value]!.append(key)
        }

        var counter = 0
        for i in 0..<nums.count {
            if counter == k { return res }
            for j in 0..<newHashMap[nums.count-i]!.count {
                if counter == k { return res }
                res.append(newHashMap[nums.count-i]![j])
                counter += 1
            }
        }

        return res
    }
}
