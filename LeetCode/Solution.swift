//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let s = Array(s)
        var (L, R) = (0, s.count-1)
        
        while L <= R {
            if !s[L].isLetter && !s[L].isNumber {
                L += 1
            } else if !s[R].isLetter && !s[R].isNumber {
                R -= 1
            } else {
                if s[L].lowercased() != s[R].lowercased() { return false }
                (L, R) = (L+1, R-1)
            }
        }

        return true
    }
}
