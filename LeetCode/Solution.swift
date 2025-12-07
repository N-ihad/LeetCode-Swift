//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/count-odd-numbers-in-an-interval-range/solutions/7399037/swift-solution-1-liner-by-nihad_s-ej8v

    Solution computes the number of odd integers between `low` and `high` inclusively using a simple O(1) formula without iteration. 
    The term `(high - low) / 2` gives the baseline number of odds in the range assuming both endpoints are even. 
    Then, the expression checks if either `low` or `high` is odd; if at least one of them is odd, the interval contains one extra odd number, so we add 1. 
    This logic correctly handles all cases—whether the endpoints are even, odd, or mixed—resulting in an efficient and concise computation.
*/

class Solution {
    func countOdds(_ low: Int, _ high: Int) -> Int {
        (high - low) / 2 + (high % 2 == 1 || low % 2 == 1 ? 1 : 0)
    }
}
