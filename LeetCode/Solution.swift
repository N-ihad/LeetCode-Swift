//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let s = Array(s)
        var set = Set<Character>([])
        var maxVal = 0
        var L = 0

        for i in 0..<s.count {
            if set.contains(s[i]) {
                maxVal = max(i - L, maxVal)
                while L != i && set.contains(s[i]) {
                    set.remove(s[L])
                    L += 1
                }
            }

            maxVal = max(i - L + 1, maxVal)
            set.insert(s[i])
        }

        return maxVal
    }

    /// A little slower
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        let s = Array(s)
//        var maxVal = 0
//        var i = 0
//        var hashTable: [Character: Int] = [:]
//
//        while i < s.count {
//            if hashTable[s[i]] != nil {
//                maxVal = max(hashTable.count, maxVal)
//                i = hashTable[s[i]]!
//                hashTable = [:]
//                continue
//            }
//
//            hashTable[s[i]] = i + 1
//            i += 1
//        }
//
//        maxVal = max(hashTable.count, maxVal)
//
//        return maxVal
//    }
}
