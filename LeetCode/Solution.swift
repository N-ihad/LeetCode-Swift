//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution { // dvdg
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let str = Array(s)
        if s.isEmpty { return 0 }

        var i = 0
        var j = 0
        var max = 0
        var hashMap: [Character: Int] = [:]
        while i < s.count {
            while j != s.count && hashMap[str[j]] == nil {
                hashMap[str[j]] = j
                j += 1
            }
            max = j - i > max ? j - i : max
            var dsdsd = Set([1, 2, 3,3 ])
            dsdsd.remove(1)
            let ii = i
            i = (j < s.count && hashMap[str[j]] != nil) ? hashMap[str[j]]! + 1 : i + 1
            for k in ii...j where k < s.count { hashMap[str[k]] = nil }
        }

        return max
    }
}
