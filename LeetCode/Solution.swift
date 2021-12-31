//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(0) { $0 ^ $1 }
    }
}
