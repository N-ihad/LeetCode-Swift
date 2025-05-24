//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/find-words-containing-character/solutions/6776729/swift-solution

    We initialize an empty array indicesOfWordsContaingXCharacter to store the result and reserve capacity equal to the 
    number of words to optimize performance (to avoid reallocation of memory for newly added elements). 
    We then iterate through each word in the array and check if the word contains the character x using the 
    contains method (which is O(n), where n is the length of a word). If it does, the index is appended to the result array. 
    Finally, we return the array of matching indices.
*/

class Solution {
    func findWordsContaining(_ words: [String], _ x: Character) -> [Int] {
        var indicesOfWordsContaingXCharacter: [Int] = []
        indicesOfWordsContaingXCharacter.reserveCapacity(words.count)
        for i in 0..<words.count {
            if words[i].contains(x) {
                indicesOfWordsContaingXCharacter.append(i)
            }
        }
        return indicesOfWordsContaingXCharacter
    }
}
