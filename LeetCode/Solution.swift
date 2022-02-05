//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var hashMap: [Int: Bool] = [:]
        var res = n

        repeat {
            var m = 1
            var sum = 0
            while m <= res {
                sum += ((res/m)%10) * ((res/m)%10)
                m *= 10
            }
            if hashMap[sum] != nil { return false }
            res = sum
            hashMap[sum] = true
        } while res != 1

        return true
    }
}
