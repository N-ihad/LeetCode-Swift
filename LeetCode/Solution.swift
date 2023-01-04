//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let pattern = Array(pattern)
        let s = s.split(separator: " ")
        var hashMap: [Character: String.SubSequence] = [:]

        if pattern.count != s.count { return false }

        for i in 0..<pattern.count {
            if hashMap[pattern[i]] == nil {
                hashMap[pattern[i]] = s[i]
            } else if hashMap[pattern[i]] != s[i] {
                return false
            }
        }

        return hashMap.keys.count == s.count
    }
}
