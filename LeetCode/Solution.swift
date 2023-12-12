//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    Iterate through an array keeping track of 2 maximum values (current max1 and previous max2):
    if current number num[i] is greater than current maximum max1, 
    then we put into previous maximum current maximum max2=max1 and
    update current maximum with current number max1=nums[i].
    If current number is not greater than first maximum, then we compare it with the previous maximum max2.
    If it's greater than previous maximum, then we just put into previous maximum current number max2=nums[i].
    At the end we just compute product of 2 max numbers (minus 1).
*/

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var (max1, max2) = (Int.min, Int.min)
        for i in 0..<nums.count {
            if nums[i] > max1 {
                max2 = max1
                max1 = nums[i]
            } else if nums[i] > max2 {
                max2 = nums[i]
            }
        }
        return (max1-1)*(max2-1)
    }
}
