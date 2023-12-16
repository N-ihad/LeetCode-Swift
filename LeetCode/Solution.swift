//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/valid-anagram/solutions/4412466/swift-solution-with-explanation/

    Iterate through the first word s counting letter occurrences in our hash table letterCounts, 
    then iterate through the second word t: if we see a missing character from
    our table (meaning there's a character that was not present in the first word s) letterCounrs[c] == nil or 
    we run out of character occurrence letterCounts[c] == 0 we return false,
    otherwise we decrease occurence of character by 1 letterCounts[c] -= 1 and proceed further.
*/

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }

        var letterCounts: [Character: Int] = [:]

        for c in s {
            letterCounts[c, default: 0] += 1
        }

        for c in t {
            if letterCounts[c] == nil || letterCounts[c] == 0 {
                return false
            }

            letterCounts[c]! -= 1
        }

        return true
    }
}
