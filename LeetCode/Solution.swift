//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = [Int: Character]()
        var cols = [Int: Character]()
        var squares = [String: Character]()

        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] == "." {
                    continue
                }

                if board[i][j] == rows[i] ||
                   board[i][j] == cols[j] ||
                   board[i][j] == squares["\(i/3),\(j/3)"] {
                    return false
                }

                rows[i] = board[i][j]
                cols[j] = board[i][j]
                squares["\(i/3),\(j/3)"] = board[i][j]
            }
        }

        return true
    }
}
