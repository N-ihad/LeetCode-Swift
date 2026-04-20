//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/two-furthest-houses-with-different-colors/solutions/8007892/swift-solution-optimal-on-with-explanati-7tsb
*/

class Solution {
    func maxDistance(_ colors: [Int]) -> Int {
        let n = colors.count

        // If the first and last houses have different colors, the maximum distance is n-1
        if colors[0] != colors[n - 1] {
            return n - 1
        }

        var maxDist = 0
        // Find the rightmost house that has a different color from the first house
        for i in 1..<n {
            if colors[i] != colors[0] {
                maxDist = max(maxDist, i)
            }
        }

        // Find the leftmost house (from the right side) that has a different color from the last house
        for i in 0..<n-1 {
            if colors[i] != colors[n - 1] {
                maxDist = max(maxDist, n - 1 - i)
            }
        }

        return maxDist
    }
}
