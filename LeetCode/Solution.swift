//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

struct Pair: Hashable{
    var r: Int = 0
    var c: Int = 0

    var hashValue: Int {
        "(\(r),\(c))".hashValue
    }

    init(_ r: Int, _ c: Int) {
        self.r = r
        self.c = c
    }

    static func == (lhs: Pair, rhs: Pair) -> Bool {
        return lhs.r == rhs.r && lhs.c == rhs.c
    }
}

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = [Int: Character]()
        var cols = [Int: Character]()
        var squares = [Pair: Character]()

        for r in 0..<9 {
            for c in 0..<9 {
                if board[r][c] == "." {
                    continue
                }

                if board[r][c] == rows[r] ||
                   board[r][c] == cols[c] ||
                   board[r][c] == squares[Pair(r / 3, c / 3)] {
                    return false
                }

                rows[r] = board[r][c]
                cols[c] = board[r][c]
                squares[Pair(r / 3, c / 3)] = board[r][c]
            }
        }

        return true
    }
}
