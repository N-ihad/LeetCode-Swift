//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var result: [Int] = []
        var binomialCoefficient = 1

        for i in 0...rowIndex {
            result.append(binomialCoefficient)
            binomialCoefficient = binomialCoefficient * (rowIndex - i) / (i + 1)
        }

        return result
    }
}
