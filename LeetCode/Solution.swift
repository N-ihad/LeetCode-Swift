//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var (maxArea, L, R) = (0, 0, height.count-1)

        while L != R {
            let area = min(height[L], height[R]) * (R - L)

            if area > maxArea {
                maxArea = area
            }

            if height[L] < height[R] {
                L += 1
            } else {
                R -= 1
            }
        }

        return maxArea
    }
}
