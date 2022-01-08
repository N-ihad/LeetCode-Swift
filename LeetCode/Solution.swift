//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var stack: [String] = []
        var result: [String] = []

        func backtrack(_ o: Int, _ c: Int) {
            defer { print("backtrack(\(o), \(c)) EXIT") }
            if o == c && c == n {
                result.append(stack.reduce("") { $0 + $1})
                print(stack.reduce("") { $0 + $1 })
                return
            }

            if o < n {
                stack.append("(")
                print("backtrack(\(o + 1), \(c)) ENTER")
                backtrack(o + 1, c)
                stack.removeLast()
            }

            if c < o {
                stack.append(")")
                print("backtrack(\(o), \(c + 1)) ENTER")
                backtrack(o, c + 1)
                stack.removeLast()
            }
        }

        backtrack(0, 0)
        return result
    }
}
