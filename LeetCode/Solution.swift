//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        let wordDict = Set<[Character]>(wordDict.map { Array($0) })
        let s = Array(s)
        var partialResult: [String] = []
        var result: [String] = []
        _wordBreak(s, wordDict, &partialResult, &result)
        return result
    }

    private func _wordBreak(_ word: [Character], _ wordDict: Set<[Character]>, _ partialResult: inout [String], _ result: inout [String]) {
        if word.count == 0 {
            result.append(partialResult.joined(separator: " "))
            return
        }

        var match: [Character] = []
        for (i, c) in word.enumerated() {
            match.append(c)
            if wordDict.contains(match) {
                partialResult.append(String(match))
                _wordBreak(Array(word[i+1..<word.count]), wordDict, &partialResult, &result)
                partialResult.removeLast()
            }
        }
    }
}
