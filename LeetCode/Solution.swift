//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/interleaving-string/solutions/7449475/swift-solution-with-explanation-by-nihad-3avn

    I treat the problem as a recursive path-search where I try to build `s3` step by step by choosing characters from either `s1` or `s2` in order. 
    First, I convert all strings into character arrays for easy indexing and immediately return `false` if the combined lengths of `s1` and 
    `s2` do not match `s3`, since interleaving would be impossible. 

    The core logic is in the `check(i, j)` function, where `i` and `j` represent how many characters have already been taken from 
    `s1` and `s2` (basically indices we are currently on for `s1` and `s2` strings accordingly), and `k = i + j` points to the current position in `s3`. 

    At each step, I try to match `s3[k]` with the next character in `s1` or `s2`, recursively exploring both possibilities. 
    To keep the solution efficient, I store failed `(i, j)` states in a `wrongPaths` set so the same dead-end is never recomputed again (kinda memoization). 

    If either recursive path successfully consumes all characters of `s3`, the function returns `true`; otherwise, the state is memoized as invalid and 
    returns `false`. This makes the approach intuitive while reducing exponential recursion to a manageable dynamic programming solution.

    The time complexity is $O(nm)$ since each state defined by the pair of indices (i, j)—representing positions in `s1` and 
    `s2`—is evaluated at most once due to memoization, and there are n * m such possible states.

    And space complexity is $O(nm)$ because the `wrongPaths` set can store up to one entry for every (i, j) state.

    So,

    Time complexity: $O(nm)$
    Space complexity: $O(nm)$
*/

class Solution {
    private var s1: [Character] = []
    private var s2: [Character] = []
    private var s3: [Character] = []
    private var wrongPaths: Set<String> = []

    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        self.s1 = Array(s1)
        self.s2 = Array(s2)
        self.s3 = Array(s3)

        if s1.count + s2.count != s3.count {
            return false
        }

        return check(0, 0)
    }

    private func check(_ i: Int, _ j: Int) -> Bool {
        let k = i + j

        if k == s3.count {
            return true
        }

        let path = "\(i),\(j)"

        if wrongPaths.contains(path) {
            return false
        }

        if i < s1.count, s1[i] == s3[k], check(i + 1, j) {
            return true
        }

        if j < s2.count, s2[j] == s3[k], check(i, j + 1) {
            return true
        }

        wrongPaths.insert(path)

        return false
    }
}

