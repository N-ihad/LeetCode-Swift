//
//  Helper.swift
//  LeetCode
//
//  Created by Nihad on 1/16/22.
//

import Foundation

class Queue {
    private var val: [TreeNode?] = []
    var isEmpty: Bool {
        val.isEmpty
    }

    func enqueue(_ element: TreeNode?) {
        val.append(element)
    }

    @discardableResult
    func dequeue() -> TreeNode? {
        if !val.isEmpty {
            return val.removeFirst()
        } else {
            return nil
        }
    }
}

struct Helper {
    static func printMatrix(_ matrix: inout [[Int]]) {
        guard !matrix.isEmpty else {
            return
        }

        var spaces: [Int: Int] = [:]

        for j in 0..<matrix[0].count {
            spaces[j] = 1
        }

        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                spaces[j] = String(matrix[i][j]).count > spaces[j]! ? String(matrix[i][j]).count + 1 : spaces[j]
            }
        }

        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                let spacesCount = String(matrix[i][j]).count < spaces[j]! ? spaces[j]! - String(matrix[i][j]).count : 1
                print(matrix[i][j], terminator: String(repeating: " ", count: spacesCount))
            }
            print()
        }
    }

    static func printTree(_ root: TreeNode?) {
        let queue = Queue()
        queue.enqueue(root)
        while !queue.isEmpty {
            let currentNode = queue.dequeue()
            print(currentNode?.val ?? "nil", terminator: " ")

            if let currentNode = currentNode {
                queue.enqueue(currentNode.left)
                queue.enqueue(currentNode.right)
            }
        }
        print()
    }
}
