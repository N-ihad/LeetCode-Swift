//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/binary-gap/solutions/7600426/swift-solution-with-explanation-by-nihad-1ttk
*/

class Solution {
    func binaryGap(_ n: Int) -> Int {
        let binaryString = Array(String(n, radix: 2))
        var result = 0
        var startIndex: Int?
        for i in 0..<binaryString.count {
            if binaryString[i] == "1" {
                if startIndex == nil {
                    startIndex = i
                } else {
                    result = max(result, i - startIndex!)
                    startIndex = i
                }
            }
        }
        return result
    }
}
