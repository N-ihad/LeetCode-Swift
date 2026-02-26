//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/sort-integers-by-the-number-of-1-bits/solutions/7610906/swift-solution-with-explanation-by-nihad-1zr2
*/

class Solution {
    func sortByBits(_ arr: [Int]) -> [Int] {
        let arr = arr.sorted {
            if $0.nonzeroBitCount == $1.nonzeroBitCount {
                return $0 < $1
            }
            return $0.nonzeroBitCount < $1.nonzeroBitCount
        }
        return arr
    }
}
