//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/minimum-distance-to-the-target-element/solutions/7897422/swift-solution-with-explanation-by-nihad-qo42
*/

class Solution {
    func getMinDistance(_ nums: [Int], _ target: Int, _ start: Int) -> Int {
        var result = 1000
        for i in 0..<nums.count {
            if nums[i] == target {
                result = min(result, abs(i - start))
            }
        }
        return result
    }
}
