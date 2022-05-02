//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }

        var hashTable: [Character: Int] = [:]
        for c in s {
            if hashTable[c] != nil {
                hashTable[c]! += 1
            } else {
                hashTable[c] = 1
            }
        }

        for c in t {
            if hashTable[c] == nil {
                return false
            } else {
                if hashTable[c]! == 0 { return false }
                hashTable[c]! -= 1
            }
        }

        return true
    }
}
