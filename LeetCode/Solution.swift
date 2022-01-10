//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var hashMap1: [Int: Int] = [:]
        var hashMap2: [Int: Int] = [:]
        nums1.forEach { hashMap1[$0] = hashMap1[$0] != nil ? hashMap1[$0]! + 1 : 1 }
        nums2.forEach { hashMap2[$0] = hashMap2[$0] != nil ? hashMap2[$0]! + 1 : 1 }

        let nums = nums1.count < nums2.count ? nums1 : nums2
        var result: [Int] = []
        nums.forEach { num in
            if let num1 = hashMap1[num],
               let num2 = hashMap2[num],
               num1 != 0 && num2 != 0 {
                result.append(num)
                hashMap1[num]! -= 1
                hashMap2[num]! -= 1
            }
        }

        return result
    }
}
