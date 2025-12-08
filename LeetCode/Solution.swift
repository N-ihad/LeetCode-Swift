//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/count-square-sum-triples/solutions/7401152/swift-solution-with-explanation-by-nihad-ns9p

    Solution counts all valid square triples `(a, b, c)` such that `a² + b² = c²` and `1 ≤ a, b, c ≤ n` by 
    iterating over all possible values of `c` and `b`. For each pair `(b, c)`, it computes `a²` as `c² - b²` and 
    takes its square root to find `a`: 

    $a^2+b^2=c^2$ 
    $a^2=c^2 - b^2$
    $a=\pm\sqrt{c^2 - b^2}$
    $a=\sqrt{c^2 - b^2}$ (we omit negative `a`, since we are constrained for `a`, `b` and `c` to be positive)

    So, if the square root is a positive integer, then `(a, b, c)` forms a valid square triple and is counted. 
    Since `b` and `c` are both iterated within the allowed range and both `(a, b, c)` and `(b, a, c)` are 
    considered naturally through iteration, the solution correctly counts all valid ordered triples
*/

class Solution {
    func countTriples(_ n: Int) -> Int {
        var result = 0
        for c in 1...n {
            for b in 1...c {
                let cb = Double(c*c - b*b)
                let a = sqrt(cb)
                if a == Double(Int(a)), a > 0 {
                    result += 1
                }
            }
        }
        return result
    }
}
