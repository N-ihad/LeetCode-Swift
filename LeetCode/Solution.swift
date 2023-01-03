//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        let word = Array(word)
        var counter = 0

        for i in 0..<word.count {
            if word[i].asciiValue! >= 65 && word[i].asciiValue! <= 90 {
                counter += 1
            }
        }

        let isAllLettersCapital = counter == word.count
        let isAllLettersLowercase = counter == 0
        let isCapitalized = counter == 1 && word[0].asciiValue! >= 65 && word[0].asciiValue! <= 90

        return isAllLettersCapital || isAllLettersLowercase || isCapitalized
    }
}
