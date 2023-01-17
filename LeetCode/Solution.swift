//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var newIntervals: [[Int]] = intervals

        for i in 0..<intervals.count {
            if newInterval[0] <= intervals[i][0] {
                newIntervals.insert(newInterval, at: i)
                break
            }
        }

        if newIntervals.count == intervals.count {
            newIntervals.append(newInterval)
        }

        var result = [newIntervals.first!]
        for interval in newIntervals {
            let n = result.count
            if result[n-1][1] >= interval[0] {
                result[n-1][1] = max(result[n-1][1], interval[1])
            } else {
                result.append(interval)
            }
        }

        return result
    }
}
