//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func maxScoreWords(_ words: [String], _ letters: [Character], _ score: [Int]) -> Int {
        var maxWordsScore = 0
        var scoreAndFreq: [Character: (score: Int, freq: Int)] = [:]
        scoreAndFreq.reserveCapacity(26)

        for i in 0..<26 {
            scoreAndFreq[Character(UnicodeScalar(97+i)!)] = (score[i], 0)
        }

        for letter in letters {
            scoreAndFreq[letter]?.freq += 1
        }

        maxScoreWords(words, &maxWordsScore, 0, 0, scoreAndFreq)

        return maxWordsScore
    }

    private func maxScoreWords(
        _ words: [String], 
        _ maxWordsScore: inout Int,
        _ j: Int,
        _ score: Int,
        _ scoreAndFreq: [Character: (score: Int, freq: Int)]
    ) {
        for i in j..<words.count {
            if let (wordScore, newScoreAndFreq) = computeWordScoreAndUpdateFrequencies(words[i], scoreAndFreq) {
                maxWordsScore = max(maxWordsScore, score + wordScore)
                maxScoreWords(words, &maxWordsScore, i + 1, score + wordScore, newScoreAndFreq)
            }
        }
    }

    private func computeWordScoreAndUpdateFrequencies(
        _ word: String,
        _ scoreAndFreq: [Character: (score: Int, freq: Int)]
    ) -> (wordScore: Int, newScoreAndFreq: [Character: (score: Int, freq: Int)])? {
        var wordScore = 0
        var newScoreAndFreq = scoreAndFreq
        newScoreAndFreq.reserveCapacity(26)

        for char in word {
            if newScoreAndFreq[char]!.freq == 0 {
                return nil
            }
            newScoreAndFreq[char]!.freq -= 1
            wordScore += newScoreAndFreq[char]!.score
        }

        return (wordScore, newScoreAndFreq)
    }
}
