//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result: [[Int]] = []
        var subArray: [Int] = []
        combine(&result, &subArray, n, k, 1)
        return result
    }

    private func combine(_ result: inout [[Int]], _ subArray: inout [Int], _ n: Int, _ k: Int, _ j: Int) {
        if subArray.count == k {
            result.append(subArray)
            return
        }

        if j > n {
            return
        }

        for i in j...n {
            subArray.append(i)
            combine(&result, &subArray, n, k, i + 1)
            subArray.removeLast()
        }
    }
}
