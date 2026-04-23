//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/sum-of-distances/solutions/8084197/swift-solution-with-explanation-by-nihad-gzld
*/

class Solution {
    func distance(_ nums: [Int]) -> [Int] {
        var indexMap: [Int: [Int]] = [:]
        var result = Array(repeating: 0, count: nums.count)

        for i in 0..<nums.count {
            indexMap[nums[i], default: []].append(i)
        }

        for (_, indices) in indexMap {
            let n = indices.count
            var prefixSum = Array(repeating: 0, count: n)

            prefixSum[0] = indices[0]
            for i in 1..<n {
                prefixSum[i] = prefixSum[i - 1] + indices[i]
            }

            for i in 0..<n {
                let idx = indices[i]

                let leftCount = i
                let leftSum = i > 0 ? prefixSum[i - 1] : 0
                let leftDist = idx * leftCount - leftSum

                let rightCount = n - i - 1
                let rightSum = prefixSum[n - 1] - prefixSum[i]
                let rightDist = rightSum - idx * rightCount

                result[idx] = leftDist + rightDist
            }
        }

        return result
    }
}
