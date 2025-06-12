//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/lexicographical-numbers/solutions/6837222/swift-solution-recursive-dfs-with-explan-8iqe

    The function lexicalOrder generates all numbers from 1 to n in lexicographical (dictionary) order. 
    It does so via depth-first traversal of the number space.

    The main function initializes the result array and starts the DFS from numbers 1 to 9, which 
    are valid starting digits for any number (since numbers can't start with 0). 
    It calls the helper function f for each digit.

    The helper function f performs a recursive DFS:
        - It first checks if the current number exceeds n; if so, it stops the recursion.
        - If the number is within bounds, it adds it to the result array.
        - It then attempts to build the next lexicographical numbers by appending digits 0 through 9 to the current number (i.e., num * 10 + i) and recursively calling itself.

    This traversal mimics the structure of a lexicographical tree, where each node branches into ten children by adding one more digit. 
    For example, starting from 1, the recursion explores 10, 100, ... before backtracking to explore 11, 12, etc., naturally visiting numbers in 
    lexicographic order without needing to sort.

    Time Complexity: O(n) — each number from 1 to n is visited exactly once.
    Space Complexity: O(1), because maximum depth of a recursion stack is 5, because it is the maximum number of digits which can be generated, 
    judging by our constraints it's 10^4 which is 10000 (5 digits).
*/

class Solution {
    func lexicalOrder(_ n: Int) -> [Int] {
        var result: [Int] = []
        for i in 1..<10 {
            f(i, n, &result)
        }
        return result
    }

    private func f(_ num: Int, _ n: Int, _ result: inout [Int]) {
        if num > n {
            return
        }

        result.append(num)
        for i in 0..<10 {
            f(num * 10 + i, n, &result)
        }
    }
}
