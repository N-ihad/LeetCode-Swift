//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        solve(&board)
    }

    @discardableResult
    private func solve(_ board: inout [[Character]]) -> Bool {
        let sudokuChars: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] == "." {
                    for k in sudokuChars {
                        if isValid(&board, i, j, k) {
                            board[i][j] = k
                            if solve(&board) {
                                return true
                            } else {
                                board[i][j] = "."
                            }
                        }
                    }
                    return false
                }
            }
        }
        return true
    }

    func isValid(_ board: inout [[Character]], _ i: Int, _ j: Int, _ char: Character) -> Bool {
        for q in 0..<9 where board[i][q] == char {
            return false
        }

        for q in 0..<9 where board[q][j] == char {
            return false
        }

        let y = (i / 3) * 3
        let x = (j / 3) * 3
        for w in y..<y+3 {
            for e in x..<x+3 where board[w][e] == char {
                return false
            }
        }

        return true
    }
}
