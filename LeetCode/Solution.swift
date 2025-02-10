//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/clear-digits/solutions/6403577/swift-solution-by-nihad_s-y1pj/

    Function `clearDigits` processes a given string `s` by iterating through each character. If the character is a digit (`char.isNumber`), 
    it removes the last character from the `result` string using `result.removeLast()`. If the character is not a digit, 
    it appends the character to `result` using `result.append(char)`. This ensures that all digits are removed from the string, 
    along with the character immediately preceding each digit. Finally, the function returns the modified `result` string, 
    which contains the cleaned-up version of the input string without digits or their preceding characters.
*/

class Solution {
    func clearDigits(_ s: String) -> String {
        var result = ""

        for char in s {
            if char.isNumber {
                result.removeLast()
            } else {
                result.append(char)
            }
        }

        return result
    }
}
