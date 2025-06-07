//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/using-a-robot-to-print-the-lexicographically-smallest-string/solutions/6821394/swift-solution-with-explanation-by-nihad-sgu2

    This function robotWithString generates the lexicographically smallest string that can be written using a simulated robot that performs 
    two operations: 1) moving the first character of s to a stack t, and 2) popping the last character from t and appending it to the final result. 
    The function builds the result string lexicographicallySmallestString step by step using a greedy approach that always tries to write 
    the smallest possible character available.

    To implement this, the string s is first converted to an array for easier indexing. Then, the function iterates through the alphabet from 
    'a' to 'z', attempting to write as many occurrences of the current character char as possible. Before processing new characters from s, 
    it checks if the top of the stack (t) contains characters that are less than or equal to the current char—if so, these are popped and added to the 
    result early, because delaying them would produce a lexicographically larger string.

    The helper function findIndexOfCharacter finds the next index of the current target character in the remaining part of s. When it finds such an 
    index, it appends the character directly to the result and pushes all characters in between (that come before it) onto the stack. 
    This ensures the characters are available for future popping in the correct order. 
    The startIndex pointer is then updated to continue scanning from the next position.

    After iterating through all characters, the remaining characters in the stack are handled by the earlier popping logic. 
    Basically, a greedy approach.

    Time Complexity: The overall time complexity is O(n*26) in the worst case (due to scanning each letter of the alphabet and 
    potentially traversing the remainder of the array s to find each character), which simplifies to O(26n)=O(n) since 26 is constant.
*/

class Solution {
    func robotWithString(_ s: String) -> String {
        let s = Array(s)
        let alphabet = "abcdefghijklmnopqrstuvwxyz"

        var lexicographicallySmallestString = ""; lexicographicallySmallestString.reserveCapacity(s.count)
        var stack: [Character] = []
        var startIndex = 0

        for char in alphabet {
            while let last = stack.last, last <= char {
                lexicographicallySmallestString += String(stack.removeLast())
            }

            while let index = findIndexOfCharacter(char, chars: s, startingFromIndex: startIndex) {
                lexicographicallySmallestString += String(s[index])

                for i in startIndex..<index {
                    stack.append(s[i])
                }

                startIndex = index + 1
            }
        }

        return lexicographicallySmallestString
    }

    private func findIndexOfCharacter(_ char: Character, chars: [Character], startingFromIndex startIndex: Int) -> Int? {
        for i in startIndex..<chars.count {
            if chars[i] == char {
                return i
            }
        }
        return nil
    }
}
