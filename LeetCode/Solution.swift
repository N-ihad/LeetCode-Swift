//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dict: [Character: Int] = [:]
        let s = Array(s)

        for i in 0..<s.count {
            dict[s[i]] = dict[s[i]] == nil ? i : -1
        }

        for i in 0..<s.count {
            if dict[s[i]] != -1 {
                return dict[s[i]]!
            }
        }

        return -1
    }
}
