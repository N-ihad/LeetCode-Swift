//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    
    private let nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func reset() -> [Int] {
        nums
    }
    
    func shuffle() -> [Int] {
        nums.shuffled()
    }
}
