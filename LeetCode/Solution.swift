//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    // MARK: - Recursive with memoization
    func climbStairs(_ n: Int) -> Int {
        var cache = Array<Int?>(repeating: nil, count: n+2)
        func climb(_ nn: Int) -> Int {
            if let val = cache[nn] { return val }
            if nn > n { return 0 }
            if nn == n { return 1 }
            cache[nn+1] = climb(nn + 1)
            cache[nn+2] = climb(nn + 2)
            return cache[nn+1]! + cache[nn+2]!
        }
        return climb(0)
    }

    // MARK: - Recursive without memoization
//    func climbStairs(_ n: Int) -> Int {
//        func climb(_ nn: Int) -> Int {
//            if nn > n { return 0 }
//            if nn == n { return 1 }
//            return climb(nn + 1) + climb(nn + 2)
//        }
//        return climb(0)
//    }
}
