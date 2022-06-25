//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var boards = Set<[[Int]]>()
        var result: [[String]] = []
        for j in 0..<n {
            var board = Array(repeating: Array(repeating: 0, count: n), count: n)
            var queensPlaced = 0
            var indices: [Int] = []
            solve(&board, n, &queensPlaced, &indices, j)
            if !indices.isEmpty {
                boards.insert(board)
            }
        }

        let _boards = Array(boards)
        for k in 0..<_boards.count {
            var strs: [String] = []
            for i in 0..<_boards[0].count {
                var str = ""
                for j in 0..<_boards[0][0].count {
                    if _boards[k][i][j] != 1 {
                        str.append(".")
                    } else {
                        str.append("Q")
                    }
                }
                strs.append(str)
            }
            result.append(strs)
        }
//        result.enu .forEach { result[$0][indices[$0]] = Q }

        return result
    }

    @discardableResult
    private func solve(_ board: inout [[Int]], _ n: Int, _ queensPlaced: inout Int, _ indices: inout [Int], _ jStart: Int = 0) -> Bool {
        for i in 0..<n {
            for j in jStart..<n {
                if board[i][j] == 0 {
                    board[i][j] = 1
                    updateHitCells(&board, n, i, j, true)
                    indices.append(j)
                    queensPlaced += 1
                    if !solve(&board, n, &queensPlaced, &indices) {
                        board[i][j] = 0
                        queensPlaced -= 1
                        updateHitCells(&board, n, i, j, false)
                        indices.removeLast()
                    }
                }
            }
        }
        return queensPlaced == n
    }

    func updateHitCells(_ board: inout [[Int]], _ n: Int, _ y: Int, _ x: Int, _ shouldHit: Bool) {
        for j in 0..<x {
            board[y][j] = !shouldHit && canRemoveHit(&board, n, y, j) ? 0 : -1
        }

        for j in x+1..<n {
            board[y][j] = !shouldHit && canRemoveHit(&board, n, y, j) ? 0 : -1
        }

        for i in 0..<y {
            board[i][x] = !shouldHit && canRemoveHit(&board, n, i, x) ? 0 : -1
        }

        for i in y+1..<n {
            board[i][x] = !shouldHit && canRemoveHit(&board, n, i, x) ? 0 : -1
        }

        for (i, j) in zip((0..<y).reversed(), (0..<x).reversed()) {
            board[i][j] = !shouldHit && canRemoveHit(&board, n, i, j) ? 0 : -1
        }

        for (i, j) in zip(y+1..<n, x+1..<n) {
            board[i][j] = !shouldHit && canRemoveHit(&board, n, i, j) ? 0 : -1
        }

        for (i, j) in zip((0..<y).reversed(), x+1..<n) {
            board[i][j] = !shouldHit && canRemoveHit(&board, n, i, j) ? 0 : -1
        }

        for (i, j) in zip(y+1..<n, (0..<x).reversed()) {
            board[i][j] = !shouldHit && canRemoveHit(&board, n, i, j) ? 0 : -1
        }
    }

    func canRemoveHit(_ board: inout [[Int]], _ n: Int, _ y: Int, _ x: Int) -> Bool {
        for j in 0..<x where board[y][j] == 1 {
            return false
        }

        for j in x+1..<n where board[y][j] == 1 {
            return false
        }

        for i in 0..<y where board[i][x] == 1 {
            return false
        }

        for i in y+1..<n where board[i][x] == 1 {
            return false
        }

        for (i, j) in zip((0..<y).reversed(), (0..<x).reversed()) where board[i][j] == 1 {
            return false
        }

        for (i, j) in zip(y+1..<n, x+1..<n) where board[i][j] == 1 {
            return false
        }

        for (i, j) in zip((0..<y).reversed(), x+1..<n) where board[i][j] == 1 {
            return false
        }

        for (i, j) in zip(y+1..<n, (0..<x).reversed()) where board[i][j] == 1 {
            return false
        }

        return true
    }
}
