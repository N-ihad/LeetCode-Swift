//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/check-if-a-string-contains-all-binary-codes-of-size-k/solutions/7601177/swift-solution-with-explanation-by-nihad-a2ca
*/

class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        let s = Array(s)

        if s.count < k { 
            return false
        }

        let target = 1 << k
        var seen: Set<String> = []
        for i in 0...s.count-k {
            let substr = String(s[i..<i+k])
            seen.insert(substr)

            if seen.count == target {
                return true
            }
        }

        return seen.count == target
    }
}
