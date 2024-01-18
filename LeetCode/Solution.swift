//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/climbing-stairs/solutions/4589680/swift-solution-dynamic-programming-bottom-up-approach/

    Using dynamic programming bottom up approach we can calculate the number of distinct ways to climb to the n
    
    n = 1 => 1
    n = 2 => 2
    n = 3 => 3
    n = 4 => 5
    n = 5 => 8
    
    We can clearly see that the next element is formed by adding previous 2:
    F(x) = F(x-1) + F(x-2)
    
    Our base is:
    F(0) = 1
    F(1) = 1
*/

class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }

        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1

        for i in 2...n {
            dp[i] = dp[i-1] + dp[i-2]
        }

        return dp[n]
    }
}
