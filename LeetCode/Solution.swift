//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/find-the-lexicographically-largest-string-from-the-box-i/solutions/6811976/swift-solution-sliding-window-beats-100-yp24b

    This function answerString takes a string word and an integer numFriends, and returns the lexicographically largest substring that 
    can appear in any valid split of word into numFriends non-empty parts. If numFriends == 1, the only valid split is the whole string itself, 
    so the function returns word.

    When numFriends > 1, the largest possible length for the first split segment is word.count - (numFriends - 1), because we must leave at least 
    one character for each of the remaining friends. This value is stored in maxWindowLen. The function uses a sliding window of length up to 
    maxWindowLen to iterate over all possible substrings of that length (or shorter as the window shrinks).

    It initializes two pointers, L and R, marking the current window in the string. For each window, it extracts the substring and compares it to the 
    best (largest) one found so far, stored in lexicographicallyMaxSubstring. If the new substring is greater, it replaces the previous best.

    The window is adjusted dynamically: if the window length has reached its max or we’re at the end of the word, the left pointer L is advanced to 
    explore new windows; otherwise, the right pointer R is moved to extend the window. This mechanism ensures that all valid unique prefix 
    splits (corresponding to the first chunk in any valid division) are considered.

    The loop terminates when all possible windows are checked. Finally, the function returns the best substring found, which is the 
    lexicographically largest string that could appear in any valid division.

    Time Complexity: The time complexity is O(n), where n is the length of the input string word. This is because each character is visited at most 
    twice as the sliding window expands and contracts, and each substring comparison is bounded by the maximum substring length, which is at most n.
*/

class Solution {
    func answerString(_ word: String, _ numFriends: Int) -> String {
        if numFriends == 1 {
            return word
        }

        let maxWindowLen = word.count - (numFriends - 1)
        var (L, R) = (word.startIndex, word.index(word.startIndex, offsetBy: maxWindowLen - 1))
        var lexicographicallyMaxSubstring: Substring = ""; lexicographicallyMaxSubstring.reserveCapacity(maxWindowLen)
        var currentWindowLen = maxWindowLen

        while L < word.endIndex {
            let substring = R == word.endIndex ? word[L..<R] : word[L...R]

            if substring > lexicographicallyMaxSubstring {
                lexicographicallyMaxSubstring = substring
            }

            if currentWindowLen == maxWindowLen || R == word.endIndex {
                L = word.index(after: L)
                currentWindowLen -= 1
            } else {
                R = word.index(after: R)
                currentWindowLen += 1
            }

            if currentWindowLen == 0 {
                currentWindowLen = 1
                R = L
            }
        }

        return String(lexicographicallyMaxSubstring)
    }
}
