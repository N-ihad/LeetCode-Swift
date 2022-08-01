//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let wordDict = Set<[Character]>(wordDict.map { Array($0) })
        let s = Array(s)
        var cache: [[Character]: Bool] = [:]
        return _wordBreak(s, wordDict, &cache)
    }

    private func _wordBreak(_ word: [Character], _ wordDict: Set<[Character]>, _ cache: inout [[Character]: Bool]) -> Bool {
        if let cacheResult = cache[word] { return cacheResult }
        if word.count == 0 { return true }

        var match: [Character] = []
        for (i, c) in word.enumerated() {
            match.append(c)

            cache[match] = wordDict.contains(match)
            if wordDict.contains(match) && _wordBreak(Array(word[i+1..<word.count]), wordDict, &cache) {
                return true
            }
        }

        return false
    }
}
