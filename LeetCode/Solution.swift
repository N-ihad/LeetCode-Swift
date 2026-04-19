//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/maximum-distance-between-a-pair-of-values/solutions/7993584/swift-solution-optimal-linear-with-expla-iek5

    Binary search solution:
    https://leetcode.com/problems/maximum-distance-between-a-pair-of-values/solutions/7992734/swift-solution-using-binary-search-with-apu0l
*/

class Solution {
    func maxDistance(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var result = 0
        var i = 0

        for j in 0..<nums2.count {
            while i < nums1.count && i <= j && nums1[i] > nums2[j] {
                i += 1
            }

            if i < nums1.count && i <= j {
                result = max(result, j - i)
            }
        }

        return result
    }
}
