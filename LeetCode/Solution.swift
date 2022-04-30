//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        let boardCopy = board
        var aliveCellsCounter = 0

        for i in 0..<boardCopy.count {
            for j in 0..<boardCopy[0].count {
                aliveCellsCounter = 0

                if i-1 >= 0 && j-1 >= 0 && boardCopy[i-1][j-1] == 1 {
                    aliveCellsCounter += 1
                }
                if i-1 >= 0 && boardCopy[i-1][j] == 1 {
                    aliveCellsCounter += 1
                }
                if i-1 >= 0 && j+1 < boardCopy[0].count && boardCopy[i-1][j+1] == 1 {
                    aliveCellsCounter += 1
                }
                if j-1 >= 0 && boardCopy[i][j-1] == 1 {
                    aliveCellsCounter += 1
                }
                if j+1 < boardCopy[0].count && boardCopy[i][j+1] == 1 {
                    aliveCellsCounter += 1
                }
                if i+1 < boardCopy.count && j-1 >= 0 && boardCopy[i+1][j-1] == 1 {
                    aliveCellsCounter += 1
                }
                if i+1 < boardCopy.count && boardCopy[i+1][j] == 1 {
                    aliveCellsCounter += 1
                }
                if i+1 < boardCopy.count && j+1 < boardCopy[0].count && boardCopy[i+1][j+1] == 1{
                    aliveCellsCounter += 1
                }

                if boardCopy[i][j] == 1 {
                    if aliveCellsCounter < 2 {
                        board[i][j] = 0
                    } else if aliveCellsCounter == 2 || aliveCellsCounter == 3 {
                        board[i][j] = 1
                    } else {
                        board[i][j] = 0
                    }
                } else {
                    if aliveCellsCounter == 3 {
                        board[i][j] = 1
                    }
                }
            }
        }
    }
}
