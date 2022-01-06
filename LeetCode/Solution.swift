//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func reverseWords(_ s: String) -> String {
        let s = Array(s)
        var result = ""

        var i = 0
        while i < s.count {
            while i < s.count && s[i] == " " { i += 1 }
            if i == s.count { break }
            var j = i + 1
            while j < s.count && s[j] != " " { j += 1 }

            let word = String(s[i..<j])
            result = word + (result.isEmpty ? "" : " " + result)
            i = j + 1
        }

        return result
    }
}
