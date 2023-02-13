//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var maximum = -11

        @inline(__always)
        func findMax(goingLeftToRight: Bool) {
            var runningProduct: Int?
            var runningPositiveProduct: Int?

            for i in 0..<nums.count {
                let i = goingLeftToRight ? i : nums.count - 1 - i

                if nums[i] == 0 {
                    maximum = max(runningProduct ?? -11, runningProduct ?? -11, 0, maximum)
                    runningProduct = nil
                    runningPositiveProduct = nil
                } else if nums[i] < 0 {
                    runningProduct = (runningProduct ?? 1) * nums[i]
                    maximum = max(runningProduct ?? -11, runningPositiveProduct ?? -11, maximum)
                    runningPositiveProduct = nil
                } else {
                    runningProduct = (runningProduct ?? 1) * nums[i]
                    runningPositiveProduct = (runningPositiveProduct ?? 1) * nums[i]
                    maximum = max(runningProduct ?? -11, runningPositiveProduct ?? -11, maximum)
                }
            }
        }

        findMax(goingLeftToRight: true)
        findMax(goingLeftToRight: false)

        return maximum
    }
}
