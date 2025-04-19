//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/count-and-say/solutions/6668191/swift-solution-recursive-by-nihad_s-kxeh

    Solution generates the nth element of the "Count and Say" sequence using recursion and string manipulation. 
    The base case is when n == 1, where it directly returns "1". For any other value of n, the function recursively calls countAndSay(n - 1) to
    obtain the previous RLE of the sequence. After that, it iterates through the previous result RLE (prevRLE), keeping track of consecutive 
    identical characters using a counter. Whenever a different character is encountered, the current count and the previous character are appended to 
    the result string RLE. Once the loop is completed, if any character was counted but not written to RLE final result (such is the case for the last
    character basically), it appends the count and character for that last remaining group. The function finally returns the generated RLE string, which
    represents the nth element in the sequence.
*/

class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }

        let prevRLE = countAndSay(n - 1)

        var RLE = ""
        var counter = 0
        var prevChar: Character?

        for char in prevRLE {
            if prevChar == nil {
                counter += 1
                prevChar = char
            } else if prevChar == char {
                counter += 1
            } else {
                RLE += "\(counter)\(prevChar!)"
                prevChar = char
                counter = 1
            }
        }

        if counter > 0 {
            RLE += "\(counter)\(prevChar!)"
        }

        return RLE
    }
}

/*

// ITERATIVE SOLUTION

/*
    https://leetcode.com/problems/count-and-say/solutions/6668209/swift-solution-iterative-by-nihad_s-lijx

    Solution generates the nth element of the "Count and Say" sequence iteratively by building each term from the previous one. 
    The base case starts with RLE = "1". For each subsequent term, the function iterates through the previous term (RLE) while 
    keeping track of consecutive identical characters using a counter. If a new character is encountered, the current count and 
    the previous character are appended to the result string nextRLE, and the counter is reset for the new character. 
    After iterating through all characters in the current sequence, the count and character of the last group are appended to nextRLE. 
    The function updates RLE to nextRLE at the end of each iteration, repeating this process until the nth term is generated. 
    Finally, the function returns the generated string representing the nth element in the sequence.
*/

class Solution {
    func countAndSay(_ n: Int) -> String {
        var RLE = "1" // base case

        for _ in 1..<n {
            var nextRLE = ""
            var counter = 0
            var prevChar: Character?

            for char in RLE {
                if prevChar == nil {
                    counter += 1
                    prevChar = char
                } else if prevChar == char {
                    counter += 1
                } else {
                    nextRLE += "\(counter)\(prevChar!)"
                    prevChar = char
                    counter = 1
                }
            }

            if counter > 0 {
                nextRLE += "\(counter)\(prevChar!)"
            }

            RLE = nextRLE
        }

        return RLE
    }
}
*/
