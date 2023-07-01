//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        var nums = nums.map { String($0) }
        nums.sort { $0 + $1 > $1 + $0 }
        let result = nums.reduce("") { $0 + $1 }
        return result.first == "0" ? "0" : result
    }
}
