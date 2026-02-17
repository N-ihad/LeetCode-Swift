//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/binary-watch/solutions/7587050/swift-solution-constant-o1-time-with-exp-xk41
*/

class Solution {
    func readBinaryWatch(_ turnedOn: Int) -> [String] {
        var result: [String] = []

        for h in 0...11 {
            for m in 0...59 {
                let total = h.nonzeroBitCount + m.nonzeroBitCount
                if total == turnedOn {
                    let m = m < 10 ? "0\(m)" : "\(m)"
                    result.append("\(h):\(m)")
                }
            }
        }

        return result
    }
}
