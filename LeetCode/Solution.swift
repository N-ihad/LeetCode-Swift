//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/count-subarrays-with-majority-element-i/solutions/8358392/swift-solution-with-explanation-by-nihad-jw51
*/

class Solution {
    func countMajoritySubarrays(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        var result = 0
        var prefix = [0] // prefix[i] = number of target occurrences in nums[0..<i]

        for num in nums {
            prefix.append(prefix.last! + (num == target ? 1 : 0))
        }

        for left in 0..<n {
            for right in left..<n {
                let targetCount = prefix[right + 1] - prefix[left]
                let count = right - left + 1

                if targetCount > count / 2 {
                    result += 1
                }
            }
        }

        return result
    }
}
