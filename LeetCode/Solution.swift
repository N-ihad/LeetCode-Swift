//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted(by: { $0[0] < $1[0] })
        var output: [[Int]] = [intervals[0]]

        var i = 1
        while i != intervals.count {
            if output[output.count-1][1] >= intervals[i][0] {
                output[output.count-1][1] = max(output[output.count-1][1], intervals[i][1])
            } else {
                output.append(intervals[i])
            }
            i += 1
        }

        return output
    }
}
