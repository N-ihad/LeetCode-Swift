//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let (s, t) = (Array(s), Array(t))
        var (i, j) = (0, 0)

        while i != s.count && j != t.count {
            if s[i] == t[j] {
                i += 1
            }
            
            j += 1
        }

        return i == s.count
    }
}
