//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        var (i, j) = (0, word2[0].startIndex) // word2 current array and char indices correspondingly

        for word in word1 {
            for char in word {
                
                if i >= word2.count || char != word2[i][j] {
                    return false
                }

                if j == word2[i].index(before: word2[i].endIndex) {
                    i += 1
                    
                    if i < word2.count {
                        j = word2[i].startIndex
                    }
                } else {
                    j = word2[i].index(after: j)
                }
            }
        }

        return i >= word2.count
    }
}

/*
// MARK: - Solution using normal indices like in literally any normal other programming language
class Solution {
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        let word1: [[Character]] = word1.map { Array($0) }
        let word2: [[Character]] = word2.map { Array($0) }

        var (i, j) = (0, 0) // word2 current array and char indices correspondingly

        for word in word1 {
            for char in word {

                if i >= word2.count || char != word2[i][j] {
                    return false
                }

                if j == word2[i].count - 1 {
                    i += 1
                    j = 0
                } else {
                    j += 1
                }
            }
        }

        return i >= word2.count
    }
}
*/
