//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/rotated-digits/solutions/8130209/swift-solution-with-explanation-by-nihad-qwji
*/

class Solution {
    func rotatedDigits(_ n: Int) -> Int {
        var count = 0

        for num in 1...n {
            if isGood(num) {
                count += 1
            }
        }

        return count
    }

    private func isGood(_ num: Int) -> Bool {
        var num = num
        var result = false

        while num > 0 {
            let digit = num % 10
            num /= 10

            switch digit {
            case 2, 5, 6, 9:
                result = true
            case 0, 1, 8:
                continue
            default:
                return false
            }
        }

        return result
    }
}
