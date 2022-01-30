//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {

        var S1 = 0
        var F = 0

        repeat {
            S1 = nums[S1]
            F = nums[nums[F]]
        } while S1 != F

        var S2 = 0
        repeat {
            S1 = nums[S1]
            S2 = nums[S2]
        } while S1 != S2

        return S1
    }
}
