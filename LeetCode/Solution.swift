//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/minimum-deletions-to-make-string-balanced/solutions/7561236/swift-solution-with-explanation-by-nihad-5eoq


    # Intuition
    ![Screenshot 2026-02-07 at 9.15.27 PM.png](https://assets.leetcode.com/users/images/66c94bfc-511a-48f2-9786-53d15e0aec4b_1770488134.1628876.png)

    # Approach
    To make the string balanced, we must ensure that no 'b' appears before an 'a'.  
    This means the final string must look like: zero or more 'a's followed by zero or more 'b's.

    The key idea is to try every possible split point in the string:
    - Everything on the left of the split should ideally contain only 'a's.
    - Everything on the right of the split should ideally contain only 'b's.

    For each split position `i`, we:
    - Delete all `'b'` characters in the prefix `[0...i]`.
    - Delete all `'a'` characters in the suffix `[i+1...n-1]`.

    We precompute:
    - `prefixBs[i]` → number of `'b'` characters from index `0` to `i`.
    - `suffixAs[i]` → number of `'a'` characters from index `i` to `n-1`.

    For each split, the deletions needed are:
    `prefixBs[i] + suffixAs[i+1]`.

    We compute this for all possible split points and take the minimum.
    We also compare with deleting all `'a'`s or all `'b'`s entirely.

    ## Main Key Ideas
    - A balanced string must have all `'a'`s before all `'b'`s.
    - Try every possible split between prefix and suffix.
    - Use prefix sums to count `'b'`s on the left.
    - Use suffix sums to count `'a'`s on the right.
    - The answer is the minimum deletions across all split points.

    # Complexity
    - Time complexity: $O(n)$, since we iterate at max only `s.count` times.
    - Space complexity: $O(n)$, because we use additional arrays (`prefixBs` and `suffixAs`) of size $n$.
*/

class Solution {
    func minimumDeletions(_ s: String) -> Int {
        let s = Array(s)
        let n = s.count
        var result = n
        var (prefixBs, suffixAs) = (Array(repeating: 0, count: n), Array(repeating: 0, count: n))
        prefixBs[0] = s[0] == "b" ? 1 : 0
        suffixAs[n-1] = s[n-1] == "a" ? 1 : 0
        for i in 1..<n {
            prefixBs[i] = s[i] == "b" ? prefixBs[i-1] + 1 : prefixBs[i-1]
            suffixAs[n-i-1] = s[n-i-1] == "a" ? suffixAs[n-i] + 1 : suffixAs[n-i]
        }

        for i in 0..<n-1 {
            result = min(result, prefixBs[i] + suffixAs[i+1])
        }

        return min(result, prefixBs[n-1], suffixAs[0])
    }
}
