//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        let n = arr.count
        var result = arr
        var maximum = Int.min

        result.reserveCapacity(arr.count)

        for i in 0..<n {
            result[n-1-i] = maximum
            maximum = max(maximum, arr[n-1-i])
        }

        result[n-1] = -1
        return result
    }
}
