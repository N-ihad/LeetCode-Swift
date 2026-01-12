//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/minimum-time-visiting-all-points/solutions/7490366/swift-solution-with-explanation-by-nihad-ovzv

    Minimum distance (time travelling) between any 2 points on a 2D grid is always the maximum of either X axis distance or Y axis distance between 2 points, either 
    blue line (X axis distance) or green line (Y axis distance) (whichever is maximum), here's the illustration (if link not available go on the leetcode solution link above):
    https://assets.leetcode.com/users/images/9ef88ab8-38f6-457b-94f8-01d27b8cbc6d_1768261748.0218391.png
*/

class Solution {
    func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
        var result = 0
        for i in 0..<points.count-1 {
            result += max(abs(points[i][0] - points[i+1][0]), abs(points[i][1] - points[i+1][1]))
        }
        return result
    }
}
