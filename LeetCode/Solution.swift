//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var nums = nums

        if nums.count == 1 {
            res.append(nums)
            return res
        }

        for _ in 0..<nums.count {
            let n = nums.removeFirst()
            var perms = permute(nums)
            perms.transform { $0.append(n) }
            perms.forEach { res.append($0) }
            nums.append(n)
        }

        return res
    }
}

extension Array where Element == [Int] {
    mutating func transform(_ block: (inout [Int]) -> Void) {
        for i in 0..<self.count {
            block(&self[i])
        }
    }
}
