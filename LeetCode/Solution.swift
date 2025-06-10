//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/maximum-difference-between-even-and-odd-frequency-i/solutions/6831039/swift-solution-hash-table-by-nihad_s-ra0q

    The function maxDifference calculates the maximum difference between the frequency of two characters in a given string s, where 
    one character (a1) must have an odd frequency and the other (a2) must have an even frequency. 
    The function returns freq(a1) - freq(a2) with the maximum possible result under these constraints.

    First, the function builds a frequency map frequencies that counts how many times each character appears in the string. 
    Then, it initializes two tracking variables: maxOdd to keep track of the largest odd frequency, and 
    minEven for the smallest even frequency, initialized to Int.max to ensure any even value found replaces it.

    The function then iterates through all the character frequencies:
        - If a frequency is even, it updates minEven to the minimum of the current minEven and this value.
        - If a frequency is odd, it updates maxOdd to the maximum of the current maxOdd and this value.

    Finally, it returns the difference maxOdd - minEven, which represents the largest possible difference between an odd and even frequency, as required.

    Time Complexity: The time complexity is O(n), where n is the length of the string s, since we count character frequencies in one pass and 
    then scan a maximum of 26 values (the alphabet) to find the min and max.
*/

class Solution {
    func maxDifference(_ s: String) -> Int {
        var frequencies: [Character: Int] = [:]
        var (minEven, maxOdd) = (Int.max, 0)

        for c in s {
            frequencies[c, default: 0] += 1
        }

        for value in frequencies.values {
            if value % 2 == 0 {
                minEven = min(minEven, value)
            } else {
                maxOdd = max(maxOdd, value)
            }
        }

        return maxOdd - minEven
    }
}
