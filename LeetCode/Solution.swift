//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/summary-ranges/solutions/4420942/swift-solution-with-explanation/

    Iterating through nums keeping track of start and end ranges.
    If the difference between neighboring elements is more than 1, 
    then it means we have abruption in our continuous range and we should record current range, 
    if we have end then our record should be "start->end", otherwise just "start", 
    the we add that record to our result array. If the difference is less than 2, 
    then it means we still have continuous range and should keep track of end.
    At the end we should add last record as well.
*/

class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        if nums.count == 0 {
            return []
        }

        var result: [String] = []
        var (start, end): (Int, Int?) = (nums[0], nil)

        for i in 0..<nums.count-1 {
            if abs(nums[i] - nums[i+1]) > 1 {
                result.append(end == nil ? "\(start)" : "\(start)->\(end!)")
                (start, end) = (nums[i+1], nil)
            } else {
                end = nums[i+1]
            }
        }

        result.append(end == nil ? "\(start)" : "\(start)->\(end!)")
        return result
    }
}
