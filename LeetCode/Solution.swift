//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let hashMap: [Character: [Character]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"],
        ]
        let digits = Array(digits)
        var result: [String] = []

        func backtrack(_ i: Int, _ res: String) {
            if res.count == digits.count {
                if !res.isEmpty { result.append(res) }
                return
            }

            for letter in hashMap[digits[i]]! {
                backtrack(i + 1, res + String(letter))
            }
        }

        backtrack(0, "")

        return result
    }
}
