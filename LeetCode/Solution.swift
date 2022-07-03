//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var partialResult: [Int] = []
        var isVisited: [Bool] = Array<Bool>(repeating: false, count: nums.count)
        permuteUnique(nums, &result, &partialResult, &isVisited)
        return result
    }

    private func permuteUnique(_ nums: [Int], _ result: inout [[Int]], _ partialResult: inout [Int], _ isVisited: inout [Bool]) {
        if partialResult.count == nums.count {
            result.append(partialResult)
            return
        }

        for i in 0..<nums.count {
            if !isVisited[i] && i > 0 && partialResult.isEmpty && nums[i] != nums[i-1] {
                partialResult.append(nums[i])
                isVisited[i] = true
                permuteUnique(nums, &result, &partialResult, &isVisited)
                isVisited[i] = false
                partialResult.removeLast()
            }
        }
    }
}
