//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/find-lucky-integer-in-an-array/solutions/6922817/swift-solution-by-nihad_s-lvk0

    This function findLucky identifies the largest "lucky" integer in a given array arr. A "lucky" integer is defined as an integer whose value is equal to 
    its frequency in the array (i.e., it appears exactly n times, and its value is also n). If no such number exists, the function returns -1.

    Step-by-step Explanation:
        Initialize Frequency Map:
            A dictionary frequency is used to count how many times each integer appears in the array. 
            The capacity is reserved based on arr.count for better performance (no reallocation-expansion will be needed when new elements is added).

        Count Occurrences:
            The function iterates over each number in arr, incrementing the count in the frequency dictionary.

        Check for Lucky Integers:
            It initializes maxLuckyNum to -1 (the fallback if no lucky integer is found). Then it iterates through the array again:
                For each number num, it checks if frequency[num] == num (i.e., it's a lucky number).
                If it's a lucky number and greater than the current maxLuckyNum, it updates maxLuckyNum.
        Return Result:
            After processing, the function returns the largest lucky number found, or -1 if none exist.

    Time Complexity:
        O(n), where n is the length of the array. One pass builds the frequency map, and a second pass checks for max lucky number.
    Space Complexity:
        O(n) in the worst case for the frequency dictionary, though in practice it's bounded by the value range (1–500), making it effectively O(1).
*/

class Solution {
    func findLucky(_ arr: [Int]) -> Int {
        var frequency: [Int: Int] = [:]
        frequency.reserveCapacity(arr.count)

        for num in arr {
            frequency[num, default: 0] += 1
        }

        var maxLuckyNum = -1
        for num in arr {
            if frequency[num] == num && num > maxLuckyNum {
                maxLuckyNum = num
            }
        }

        return maxLuckyNum
    }
}
