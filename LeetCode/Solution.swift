//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        let ransomNote = Array(ransomNote)
        let magazine = Array(magazine)

        var characterCounts: [Character: Int] = [:]

        characterCounts.reserveCapacity(magazine.count)

        for i in 0..<magazine.count {
            characterCounts[magazine[i], default: 0] += 1
        }

        for i in 0..<ransomNote.count {
            let char = ransomNote[i]
            if characterCounts[char] == nil || characterCounts[char]! == 0 {
                return false
            }
            characterCounts[char]! -= 1
        }

        return true
    }
}
