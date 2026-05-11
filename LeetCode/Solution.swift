//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/separate-the-digits-in-an-array/solutions/8191002/swift-solution-with-explanation-by-nihad-2m89
*/

class Solution {
    func separateDigits(_ nums: [Int]) -> [Int] {
        var result: [Int] = []
        for var num in nums {
            var divisor = highestDigitPlace(num)
            while divisor != 0 {
                result.append(num / divisor)
                num %= divisor
                divisor /= 10
            }
        }
        return result
    }

    private func highestDigitPlace(_ num: Int) -> Int {
        switch num {
        case 1...9: return 1
        case 10...99: return 10
        case 100...999: return 100
        case 1_000...9_999: return 1_000
        case 10_000...99_999: return 10_000
        default: return 100_000
        }
    }
}
