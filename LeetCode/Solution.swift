//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/minimum-number-of-flips-to-make-the-binary-string-alternating/solutions/7635847/swift-solution-with-explanation-by-nihad-btw9
*/

class Solution {
    func minFlips(_ s: String) -> Int {
        let s = Array(s+s)
        let n = s.count / 2

        var pattern0101Cost = 0
        var pattern1010Cost: Int { n - pattern0101Cost }

        for i in 0..<n {
            let expected: Character = i % 2 == 0 ? "0" : "1"
            if s[i] != expected {
                pattern0101Cost += 1
            }
        }

        var result = min(pattern0101Cost, pattern1010Cost)

        for i in 0..<n {
            let expectedOut: Character = i % 2 == 0 ? "0" : "1"
            if s[i] != expectedOut { pattern0101Cost -= 1 }

            let expectedIn: Character = (i + n) % 2 == 0 ? "0" : "1"
            if s[i+n] != expectedIn { pattern0101Cost += 1 }

            result = min(result, pattern0101Cost, pattern1010Cost)
        }

        return result
    }
}
