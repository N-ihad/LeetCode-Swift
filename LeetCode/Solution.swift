//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var solutions = 0
        var board = Array(repeating: Array(repeating: 0, count: n), count: n)
        var queensPlaced = 0
        solve(&board, &queensPlaced, &solutions, 0)
        return solutions
    }

    private func solve(_ board: inout [[Int]], _ queensPlaced: inout Int, _ solutions: inout Int, _ jj: Int) {
        for i in 0..<board.count {
            for j in jj..<board.count {
                if board[i][j] == 0 {
                    board[i][j] = 1
                    updateHitCells(&board, i, j, true)
                    queensPlaced += 1

                    solve(&board, &queensPlaced, &solutions, j + 1)

                    board[i][j] = 0
                    queensPlaced -= 1
                    updateHitCells(&board, i, j, false)
                }
            }
        }

        if queensPlaced == board.count {
            solutions += 1
        }
    }

    func updateHitCells(_ board: inout [[Int]], _ y: Int, _ x: Int, _ shouldHit: Bool) {
        for j in 0..<x {
            board[y][j] = !shouldHit && canRemoveHit(&board, y, j) ? 0 : -1
        }

        for j in x+1..<board.count {
            board[y][j] = !shouldHit && canRemoveHit(&board, y, j) ? 0 : -1
        }

        for i in 0..<y {
            board[i][x] = !shouldHit && canRemoveHit(&board, i, x) ? 0 : -1
        }

        for i in y+1..<board.count {
            board[i][x] = !shouldHit && canRemoveHit(&board, i, x) ? 0 : -1
        }

        for (i, j) in zip((0..<y).reversed(), (0..<x).reversed()) {
            board[i][j] = !shouldHit && canRemoveHit(&board, i, j) ? 0 : -1
        }

        for (i, j) in zip(y+1..<board.count, x+1..<board.count) {
            board[i][j] = !shouldHit && canRemoveHit(&board, i, j) ? 0 : -1
        }

        for (i, j) in zip((0..<y).reversed(), x+1..<board.count) {
            board[i][j] = !shouldHit && canRemoveHit(&board, i, j) ? 0 : -1
        }

        for (i, j) in zip(y+1..<board.count, (0..<x).reversed()) {
            board[i][j] = !shouldHit && canRemoveHit(&board, i, j) ? 0 : -1
        }
    }

    func canRemoveHit(_ board: inout [[Int]], _ y: Int, _ x: Int) -> Bool {
        for j in 0..<x where board[y][j] == 1 {
            return false
        }

        for j in x+1..<board.count where board[y][j] == 1 {
            return false
        }

        for i in 0..<y where board[i][x] == 1 {
            return false
        }

        for i in y+1..<board.count where board[i][x] == 1 {
            return false
        }

        for (i, j) in zip((0..<y).reversed(), (0..<x).reversed()) where board[i][j] == 1 {
            return false
        }

        for (i, j) in zip(y+1..<board.count, x+1..<board.count) where board[i][j] == 1 {
            return false
        }

        for (i, j) in zip((0..<y).reversed(), x+1..<board.count) where board[i][j] == 1 {
            return false
        }

        for (i, j) in zip(y+1..<board.count, (0..<x).reversed()) where board[i][j] == 1 {
            return false
        }

        return true
    }
}
