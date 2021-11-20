//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func intToRoman(_ num: Int) -> String {
        let nums = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let romans = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        var answer = ""
        var num = num

        for i in 0..<nums.count {
            let integer = num / nums[i]

            if integer == 0 {
                continue
            }

            answer += String(repeating: romans[i], count: integer)
            num %= nums[i]
        }

        return answer
    }
}
