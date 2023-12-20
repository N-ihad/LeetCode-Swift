//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/buy-two-chocolates/solutions/4429930/swift-solution/

    Iterate through an array keeping track of 2 minimum values: min1 and min2 in it. 
    At the end just calculate the result.
*/

class Solution {
    func buyChoco(_ prices: [Int], _ money: Int) -> Int {
        var (min1, min2) = (Int.max, Int.max)
        for i in 0..<prices.count {
            if prices[i] < min1 {
                min2 = min1
                min1 = prices[i]
            } else if prices[i] < min2 {
                min2 = prices[i]
            }
        }
        return money - min1 - min2 >= 0 ? money - min1 - min2 : money
    }
}
