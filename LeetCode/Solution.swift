//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func dfs(_ board: inout [[Character]], _ i: Int, _ j: Int, _ count: Int, _ word: [Character]) -> Bool {
        if count == word.count {
            return true
        }

        if i < 0 || i >= board.count || j < 0 || j >= board[0].count || board[i][j] != word[count] {
            return false
        }

        let temp = board[i][j]
        board[i][j] = " "

        let found = dfs(&board, i, j + 1, count + 1, word) ||
                    dfs(&board, i, j - 1, count + 1, word) ||
                    dfs(&board, i + 1, j, count + 1, word) ||
                    dfs(&board, i - 1, j, count + 1, word)
        board[i][j] = temp

        return found
    }

    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        let word = Array<Character>(word)

        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if board[i][j] == word[0] && dfs(&board, i, j, 0, word) {
                    return true
                }
            }
        }
        return false
    }
}
