//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/lexicographically-minimum-string-after-removing-stars/solutions/6821530/swift-solution-with-explanation-by-nihad-20o5

    The function clearStars processes a string s that may contain asterisks '*'. The task is to remove all '*' characters, along with 
    the smallest non-asterisk character to the left of each '*'. Among multiple smallest characters, any can be chosen. 
    The goal is to return the lexicographically smallest string possible after all removals.

    The function begins by converting the string s into an array for easier manipulation. 
    It initializes a dictionary characterOccurenceIndices that maps each character to a list of its positions in s, 
    which are used to efficiently track and remove the correct character when a '*' is encountered.

    As it iterates through s:
        - When it finds a regular character, it appends its index to the corresponding list in characterOccurenceIndices.
        - When it encounters a '*', it loops through the alphabet from 'a' to 'z' to find the lexicographically smallest character with at least 
        one recorded position. It removes the most recent occurrence (rightmost index) of that character by marking it as '*' in the array and 
        popping its index from the tracking dictionary. This mimics the rule of removing the smallest valid character to the left of the asterisk.

    After the loop, the function constructs the result by iterating through the modified array s and concatenating all characters that are not '*'. 
    This ensures all asterisks and their associated characters are effectively removed.

    Time Complexity: The time complexity is approximately O(n*26)=O(n), where n is the length of the string. 
    For each '*', we may scan up to 26 alphabet letters to find the smallest valid removal candidate.
*/

class Solution {
    func clearStars(_ s: String) -> String {
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        var s = Array(s)
        var characterOccurenceIndices: [Character: [Int]] = [:]
        var result = ""

        for i in 0..<s.count {
            if s[i] == "*" {
                for c in alphabet {
                    if let rightmostIndex = characterOccurenceIndices[c]?.last {
                        s[rightmostIndex] = "*"
                        characterOccurenceIndices[c]?.removeLast()
                        break
                    }
                }
            } else {
                characterOccurenceIndices[s[i], default: []].append(i)
            }
        }

        for i in 0..<s.count {
            if s[i] != "*" {
                result += String(s[i])
            }
        }

        return result
    }
}
