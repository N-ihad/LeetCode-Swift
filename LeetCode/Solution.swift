//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func reverseVowels(_ s: String) -> String {
        var s = Array(s)
        let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]

        var (L, R) = (0, s.count-1)
        while L < R {
            if vowels.contains(s[L]) && vowels.contains(s[R]) {
                s.swapAt(L, R)
                L += 1
                R -= 1
            } else if vowels.contains(s[L]) {
                R -= 1
            } else if vowels.contains(s[R]) {
                L += 1
            } else {
                L += 1
                R -= 1
            }
        }

        return String(s)
    }
}
