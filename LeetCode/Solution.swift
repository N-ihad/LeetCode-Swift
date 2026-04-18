//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/mirror-distance-of-an-integer/solutions/7980150/swift-solution-short-1-line-with-explana-bhel
*/

class Solution {
    func mirrorDistance(_ n: Int) -> Int {
        abs(n - Int(String(String(n).reversed()))!)
    }
}
