//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var res: [Int] = []
        var remainder = 1
        for i in 0..<digits.count {
            if digits[digits.count-1-i] + remainder == 10 {
                res.insert(0, at: 0)
            } else {
                res.insert(digits[digits.count-1-i] + remainder, at: 0)
                remainder = 0
            }
        }
        if remainder == 1 {
            res.insert(1, at: 0)
        }
        return res
    }
}
