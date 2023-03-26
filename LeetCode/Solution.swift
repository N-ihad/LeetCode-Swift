//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func tictactoe(_ moves: [[Int]]) -> String {
        var hashTable: [String: [[Character]]] = {
            var hashTable: [String: [[Character]]] = [:]
            hashTable["LD"] = [[],[]]
            hashTable["RD"] = [[],[]]

            for i in 0..<3 {
                hashTable["?\(i)"] = [[], []]
                hashTable["\(i)?"] = [[], []]
            }

            return hashTable
        }()

        var isTic = true
        for move in moves {
            let mark: Character = isTic ? "x" : "o"
            let bucket: Int = isTic ? 0 : 1

            if move == [1, 1] {
                hashTable["LD"]![bucket].append(mark)
                hashTable["RD"]![bucket].append(mark)
            } else if move[0] == move[1] {
                hashTable["LD"]![bucket].append(mark)
            } else if move == [0, 2] || move == [2, 0] {
                hashTable["RD"]![bucket].append(mark)
            }

            hashTable["?\(move[1])"]![bucket].append(mark)
            hashTable["\(move[0])?"]![bucket].append(mark)

            if hashTable["LD"]![bucket].count == 3 ||
               hashTable["RD"]![bucket].count == 3 ||
               hashTable["?\(move[1])"]![bucket].count == 3 ||
               hashTable["\(move[0])?"]![bucket].count == 3 {
                return isTic ? "A" : "B"
            }

            isTic = !isTic
        }

        return moves.count == 9 ? "Draw" : "Pending"
    }
}
