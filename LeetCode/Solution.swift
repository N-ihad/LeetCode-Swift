//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/shortest-distance-to-target-string-in-a-circular-array/solutions/7921062/swift-solution-with-explanation-by-nihad-0588
*/

class Solution {
    func closestTarget(_ words: [String], _ target: String, _ startIndex: Int) -> Int {
        var (backwardIndex, forwardIndex, dist) = (startIndex, startIndex, 0)
        repeat {
            if words[backwardIndex] == target || words[forwardIndex] == target {
                return dist
            }
            dist += 1
            forwardIndex = (forwardIndex + 1) % words.count
            backwardIndex = (backwardIndex - 1 + words.count) % words.count
        } while backwardIndex != startIndex && forwardIndex != startIndex
        return -1
    }
}
