//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/mirror-distance-of-an-integer/solutions/7980150/swift-solution-short-1-line-with-explana-bhel

    Math only solution without String and String.reversed():
    https://leetcode.com/problems/mirror-distance-of-an-integer/solutions/7985689/swift-solution-using-math-only-with-expl-ul4s
*/

class Solution {
    func mirrorDistance(_ n: Int) -> Int {
        abs(n - Int(String(String(n).reversed()))!)
    }
}
