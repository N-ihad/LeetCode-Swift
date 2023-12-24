//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/minimum-changes-to-make-alternating-binary-string/solutions/4449063/swift-short-solution-with-explanation/

    For n = 5, we have 2 possible "right" alternating binary strings starting from zero and from one: 01010 and 10101.
    So while iterating through an array we can check whether current character s[i] is equal to i%2. 
    Result of i%2 can be either 0 or 1, so we increment either min1 or min2 to catch 2 possible 
    variations of alternating binary strings (as was mentioned above). 
    At the end we calculate the minimum between those two mininimums.
*/

class Solution {
    func minOperations(_ s: String) -> Int {
        let s = Array(s)

        var (min1, min2) = (0, 0)
        for i in 0..<s.count {
            if s[i] != Character(String(i%2)) {
                min1 += 1
            } else {
                min2 += 1
            }
        }

        return min(min1, min2)
    }
}
