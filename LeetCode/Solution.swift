//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/count-the-number-of-special-characters-i/solutions/8294943/swift-solution-with-explanation-by-nihad-xclz
*/

class Solution {
    func numberOfSpecialChars(_ word: String) -> Int {
        var seen: Set<Character> = []
        for letter in word {
            seen.insert(letter)
        }

        var result = 0
        for letter in seen {
            if letter.isLowercase,
                seen.contains(Character(letter.uppercased())) {
                result += 1
            }
        }

        return result
    }
}
