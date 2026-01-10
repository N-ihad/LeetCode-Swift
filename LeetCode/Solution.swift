//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/minimum-ascii-delete-sum-for-two-strings/solutions/7484516/swift-solution-with-explanation-by-nihad-sbiw

    # Approach
    We reduce the problem to finding the **maximum ASCII sum of a common subsequence** between `s1` and `s2`, because keeping characters with the 
    highest total ASCII value minimizes the cost of deleting the rest. Using dynamic programming, we compute this maximum kept sum and subtract twice its 
    value from the total ASCII sum of both strings.

    ## Main Key Ideas
    - The final equal string must be a **common subsequence** of both strings.
    - To minimize deletion cost, we want to **keep** the common subsequence with the **maximum ASCII sum**.
    - Use a 2D DP table where `dp[i][j]` stores the maximum ASCII sum of a common subsequence between `s1[0..<i]` and `s2[0..<j]`.
    - If characters match, extend the subsequence and add their ASCII value.
    - If they don’t match, carry forward the best result seen so far.
    - Subtract twice the kept ASCII sum from the total ASCII sum to get the minimum deletion cost.

    # Complexity
    - Time complexity: $O(n \times m)$, where \(n\) and \(m\) are the lengths of `s1` and `s2`, since we fill a DP table of that size.
    - Space complexity: $O(n \times m)$, due to the 2D DP table.
*/

class Solution {
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        let (s1, s2) = (Array(s1), Array(s2))
        let sum = s1.reduce(0) { $0 + Int($1.asciiValue!) } + s2.reduce(0) { $0 + Int($1.asciiValue!) }
        var dp = Array(repeating: Array(repeating: 0, count: s2.count + 1), count: s1.count + 1)
        for i in 1..<dp.count {
            for j in 1..<dp[0].count {
                if s1[i-1] == s2[j-1] {
                    dp[i][j] = dp[i-1][j-1] + Int(s1[i-1].asciiValue!)
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return sum - Int(dp[s1.count][s2.count]) * 2
    }
}
