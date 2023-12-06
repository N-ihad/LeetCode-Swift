//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func totalMoney(_ n: Int) -> Int {
        let (k, a, d) = (n / 7, 28, 7)
        let arithmeticSum = k * (2 * a + (k - 1) * d) / 2
        let remainingSum = n % 7 * (n / 7 + n / 7 + n % 7 + 1) / 2
        return arithmeticSum + remainingSum
    }
}

/*
// MARK: - Iterative solution
class Solution {
    func totalMoney(_ n: Int) -> Int {
        var sum = 0
        var fullWeeks = n / 7

        for week in 0..<fullWeeks {
            for weekday in 1...7 {
              sum += weekday + week
            }
        }

        for remainingDay in 0..<n%7 {
            sum += fullWeeks + remainingDay + 1 
        }

        return sum
    }
}
*/
