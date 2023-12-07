//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func largestOddNumber(_ num: String) -> String {
        var i = num.index(before: num.endIndex)

        while i >= num.startIndex {
            if num[i].wholeNumberValue! % 2 != 0 {
                return String(num[num.startIndex...i])
            }

            // needed so that when decrementing index it won't crash,
            // because we can't go more left than startIndex in Swift's String
            if i == num.startIndex {
                break
            }

            i = num.index(before: i)
        }

        return ""
    }
}

/*
// MARK: - Solution using normal indices like in literally any other normal programming language
class Solution {
    func largestOddNumber(_ num: String) -> String {
        let num = Array(num)
        var i = num.count - 1

        while i >= 0 {
            
            if num[i].wholeNumberValue! % 2 != 0 {
                return String(num[0...i])
            }

            i -= 1
        }

        return ""
    }
}
*/
