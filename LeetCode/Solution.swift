//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/words-within-two-edits-of-dictionary/solutions/8054899/swift-solution-with-explanation-by-nihad-n83c
*/

class Solution {
    func twoEditWords(_ queries: [String], _ dictionary: [String]) -> [String] {
        var result: [String] = []

        for query in queries {
            for word in dictionary {

                var i = query.startIndex
                var editsCount = 0

                while i != query.endIndex && editsCount <= 2 {
                    if query[i] != word[i] {
                        editsCount += 1
                    }

                    i = query.index(after: i)
                }

                if editsCount <= 2 {
                    result.append(query)
                    break
                }
            }
        }

        return result
    }
}
