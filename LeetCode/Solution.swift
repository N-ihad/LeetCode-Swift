//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/count-number-of-bad-pairs/solutions/6399893/swift-solution-frequency-hashmap-by-niha-o70n/

    The function countBadPairs efficiently calculates the number of bad pairs in the array by first counting the number of good pairs. 
    A pair (i,j) is good if i<j and j−i==nums[j]−nums[i], which can be rewritten as nums[i]−i==nums[j]−j, so the function uses 
    a hash map (freq) to track occurrences of each transformed value nums[i]−i. As it iterates through the array, it 
    counts the number of good pairs using the frequency of previously seen values. 
    The total number of pairs in the array is given by n(n-1)/2, so the number of bad pairs is computed as
    the total pairs minus the good pairs: badPairs = n(n-1)/2 - goodPairs.
*/

class Solution {
    func countBadPairs(_ nums: [Int]) -> Int {
        var freq: [Int: Int] = [:]
        freq.reserveCapacity(nums.count)

        var count = 0

        for i in 0..<nums.count {
            freq[nums[i] - i, default: 0] += 1
            count += freq[nums[i] - i]! - 1
        }

        return (nums.count * (nums.count - 1) / 2) - count
    }
}
