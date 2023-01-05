//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        let points = points.sorted(by: { $0[1] < $1[1] })
        var end = points[0][1]
        var arrows = 1

        for point in points {
            if point[0] > end {
                arrows += 1
                end = point[1]
            }
        }

        return arrows
    }
}
