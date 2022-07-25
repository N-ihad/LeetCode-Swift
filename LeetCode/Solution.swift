//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count

        if k == 0 { return }

        for i in 0..<nums.count/2 {
            nums.swapAt(i, nums.count-1-i)
        }

        for i in 0..<k/2 {
            nums.swapAt(i, k-1-i)
        }

        for i in k..<(nums.count+k)/2 {
            nums.swapAt(i, nums.count-1+k-i)
        }
    }
}
