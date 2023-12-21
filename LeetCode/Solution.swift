//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/widest-vertical-area-between-two-points-containing-no-points/solutions/4436668/swift-solution-with-explanation/

    Sort points array by x (y part is irrelevant to us) in non-decreasing order.
    Then just compute the difference by x-axis between 2 neighboring points and
    update widestArea variable which keeps track of the max difference: widestArea = max(widestArea, points[i+1][0] - points[i][0]),
    it is ensured that between those points there are no other points because we sorted points array, 
    all elements there are closest to each other.
*/

class Solution {
    func maxWidthOfVerticalArea(_ points: [[Int]]) -> Int {
        let points = points.sorted { $0[0] < $1[0] }
        var widestArea = 0
        for i in 0..<points.count-1 {
            widestArea = max(widestArea, points[i+1][0] - points[i][0])
        }
        return widestArea
    }
}
