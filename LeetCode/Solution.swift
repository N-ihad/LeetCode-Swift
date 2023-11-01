//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Node<T> {

    var val: T
    var next: Node?

    init(_ val: T) {
        self.val = val
    }
}

class Queue<T> {

    var head: Node<T>?
    var tail: Node<T>?

    var isEmpty: Bool {
        head == nil
    }

    init(_ startingElement: T) {
        let node = Node(startingElement)
        head = node
        tail = node
    }

    func enqueue(_ element: T) {
        let node = Node(element)
        if head == nil {
            head = node
        } else {
            tail!.next = node
        }
        tail = node
    }

    func dequeue() -> T {
        if head!.next == nil {
            let val = head!.val
            head = nil
            tail = nil
            return val
        } else {
            let newHead = head!.next
            head!.next = nil
            let val = head!.val
            head = newHead
            return val
        }
    }
}

class Solution {
    func solve(_ board: inout [[Character]]) {
        for j in 0..<board[0].count {
            dfs(0, j, &board)
            dfs(board.count-1, board[0].count-1-j, &board)
        }

        for i in 0..<board.count {
            dfs(i, 0, &board)
            dfs(board.count-1-i, board[0].count-1, &board)
        }

        for i in 0..<board.count {
            for j in 0..<board[0].count {
                board[i][j] = board[i][j] == "T" ? "O" : "X"
            }
        }
    }

    private func dfs(_ i: Int, _ j: Int, _ board: inout [[Character]]) {
        if i < 0 || j < 0 || i >= board.count || j >= board[0].count || board[i][j] != "O" {
            return
        }

        board[i][j] = "T"

        dfs(i-1, j, &board)
        dfs(i+1, j, &board)
        dfs(i, j-1, &board)
        dfs(i, j+1, &board)
    }

    private func bfs(_ i: Int, _ j: Int, _ board: inout [[Character]]) {
        if board[i][j] != "O" {
            return
        }

        var queue = Queue((i, j))
        while !queue.isEmpty {
            let (i, j) = queue.dequeue()
            if i >= 0, i < board.count, j >= 0, j < board[0].count, board[i][j] == "O" {
                board[i][j] = "T"
                queue.enqueue((i-1, j))
                queue.enqueue((i+1, j))
                queue.enqueue((i, j-1))
                queue.enqueue((i, j+1))
            }
        }
    }
}
