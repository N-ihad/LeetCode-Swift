//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*


*/

class Solution {
    func maxFreqSum(_ s: String) -> Int {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        var letterFrequency: [Character: Int] = [:]
        var (maxVowelsFrequencyCount, maxConsonantsFrequencyCount) = (0, 0)
        for c in s {
            letterFrequency[c, default: 0] += 1
            if vowels.contains(c) {
                maxVowelsFrequencyCount = max(letterFrequency[c]!, maxVowelsFrequencyCount)
            } else {
                maxConsonantsFrequencyCount = max(letterFrequency[c]!, maxConsonantsFrequencyCount)
            }
        }
        return maxVowelsFrequencyCount + maxConsonantsFrequencyCount
    }
}
