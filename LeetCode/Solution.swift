//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let intersection = Set(nums1).intersection(Set(nums2))
        return Array(intersection)
    }
}
