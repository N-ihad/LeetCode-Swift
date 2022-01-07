//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var hashMap: [String: Int] = [:]
        var result: [[String]] = []
        var bucketIndex = 0

        for str in strs {
            let newStr = String(str.sorted())
            if hashMap[newStr] == nil {
                hashMap[newStr] = bucketIndex
                result.append([str])
                bucketIndex += 1
            } else {
                result[hashMap[newStr]!].append(str)
            }
        }

        return result
    }
}
