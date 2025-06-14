//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/maximum-difference-by-remapping-a-digit/solutions/6843293/swift-solution-by-nihad_s-oqtb

    The function minMaxDifference computes the difference between the maximum and minimum values that can be formed by 
    remapping exactly one digit in a given integer num. The key idea is to simulate Bob remapping one digit at a time — once to 
    get the maximum possible number and once to get the minimum — and then compute the difference between the two results.

    Step-by-step Explanation:
        Convert the Number to an Array of Characters:
            The input integer num is converted to a character array to facilitate digit-by-digit manipulation.

    Initialize Maximum and Minimum Representations:
        Two copies of the digit array, maxNum and minNum, are created to hold the transformed digits for the maximum and minimum versions respectively.

    Digit Selection for Remapping:
        For the maximum value, we look for the first digit that is not '9', and choose it as chosenDigitForMaxNum. All occurrences of this digit will be changed to '9'.
        For the minimum value, we choose the first digit, whatever it is, as chosenDigitForMinNum, and replace all its occurrences with '0'.

    This greedy approach works because:
        Replacing with '9' maximizes the value.
        Replacing with '0' minimizes the value.
        The first suitable digit ensures maximum impact (more significant digit positions).

    Construct the Final Integers:
        The transformed arrays are joined back into strings and then converted to integers to get the max and min values.

    Return the Difference:
        The function returns max - min, which represents the maximum difference Bob can produce through a single-digit remapping.

    Time Complexity:
        O(n), where n is the number of digits in the input number. The function traverses the digit list a constant number of times.
    Space Complexity:
        O(n) for the character arrays representing the digits.
*/

class Solution {
    func minMaxDifference(_ num: Int) -> Int {
        let num = Array(String(num))
        var (maxNum, minNum) = (num, num)
        var (chosenDigitForMaxNum, chosenDigitForMinNum): (Character?, Character?)
        for i in 0..<num.count {
            if chosenDigitForMaxNum == nil && num[i] != "9" {
                chosenDigitForMaxNum = num[i]
            }

            if chosenDigitForMinNum == nil {
                chosenDigitForMinNum = num[i]
            }

            if chosenDigitForMaxNum == num[i] {
                maxNum[i] = "9"
            }
            
            if chosenDigitForMinNum == num[i] {
                minNum[i] = "0"
            }
        }

        let max = Int(maxNum.reduce("", { $0 + String($1) }))!
        let min = Int(minNum.reduce("", { $0 + String($1) }))!

        return max - min
    }
}
