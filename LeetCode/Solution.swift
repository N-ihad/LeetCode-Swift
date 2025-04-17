//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/reverse-vowels-of-a-string/solutions/6661627/swift-solution-2-pointers-by-nihad_s-6n9b

    Solution utilizes the two-pointer technique to reverse only the vowels in the given string. We initialize two pointers, 
    L at the beginning of the string and R at the end, and use a set to identify the vowels. The string is first converted into 
    an array to facilitate in-place modifications and also easy indexing (since it's Swift duh). The algorithm proceeds by moving the 
    left pointer L to the right and the right pointer R to the left, skipping over non-vowel characters. 
    When both L and R point to vowels, we swap the characters at those positions. This process continues until the two pointers meet or cross. 
    After reversing the vowels, we convert the array back into a string and return the result.
*/

class Solution {
    func reverseVowels(_ s: String) -> String {
        let vowels: Set<Character> = ["A", "a", "E", "e", "I", "i", "O", "o", "U", "u"]
        var (L, R) = (0, s.count - 1)
        var s = Array(s)
        
        while L < R {
            if !vowels.contains(s[L]) {
                L += 1
                continue
            }

            if !vowels.contains(s[R]) {
                R -= 1
                continue
            }

            s.swapAt(L, R)

            L += 1
            R -= 1
        }

        return String(s)
    }
}
