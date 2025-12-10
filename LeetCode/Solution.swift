//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/count-special-triplets/solutions/7405585/swift-solution-with-explanation-by-nihad-imt6

    Solution fixes each index j as the middle of the triplet and counts how many valid i values exist to its left and k values exist to 
    its right that satisfy the condition nums[i] = nums[j] * 2 and nums[k] = nums[j] * 2. We maintain two frequency maps: leftFreq tracks how 
    many numbers have appeared before j (to the left of it), and rightFreq tracks how many numbers still appear after j (to the right of it). 
    Initially, all elements except the first are stored in rightFreq, and as j moves forward, the current value is removed from rightFreq and added to 
    leftFreq. For each position j, the number of special triplets centered at j is simply the product of how many times nums[j] * 2 appears on the 
    left and on the right, since any such pair can form a valid (i, j, k) triplet. We return result modulo 10⁹ + 7 at the end (since there's no exception with 
    overflowing Integer up until end, so I assumed we are safe to do it at the end lol).
*/

class Solution {
    func specialTriplets(_ nums: [Int]) -> Int {
        var leftFreq: [Int: Int] = [:]; leftFreq.reserveCapacity(nums.count)
        var rightFreq: [Int: Int] = [:]; rightFreq.reserveCapacity(nums.count)
        var result = 0

        leftFreq[nums[0], default: 0] += 1
        for i in 1..<nums.count {
            rightFreq[nums[i], default: 0] += 1
        }

        for j in 1..<nums.count-1 {
            rightFreq[nums[j]]! -= 1
            result += (leftFreq[nums[j]*2] ?? 0) * (rightFreq[nums[j]*2] ?? 0)
            leftFreq[nums[j], default: 0] += 1
        }

        return result % 1000000007
    }
}
