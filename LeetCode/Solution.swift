//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows: [Int: Set<Character>] = [:]
        var cols: [Int: Set<Character>] = [:]
        var squares: [String: Set<Character>] = [:]

        for i in 0..<9 {
            if rows[i] == nil { rows[i] = [] }
            for j in 0..<9 {
                if board[i][j] == "." { continue }
                if squares["\(i/3)\(j/3)"] == nil { squares["\(i/3)\(j/3)"] = [] }
                if cols[j] == nil { cols[j] = [] }

                if rows[i]!.contains(board[i][j]) ||
                   cols[j]!.contains(board[i][j]) ||
                   squares["\(i/3)\(j/3)"]!.contains(board[i][j]) {
                    return false
                }

                rows[i]!.insert(board[i][j])
                cols[j]!.insert(board[i][j])
                squares["\(i/3)\(j/3)"]!.insert(board[i][j])
            }
        }

        return true
    }
}
