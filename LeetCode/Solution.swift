//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }

        let queue = Queue<TreeNode>(root!) // Definition of Queue is below
        var result: [Int] = [root!.val]
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let node = queue.dequeue()

                if let left = node.left {
                    queue.enqueue(left)
                }

                if let right = node.right {
                    queue.enqueue(right)
                }
            }

            if let last = queue.last?.val {
                result.append(last)
            }
        }

        return result
    }
}

class Queue<T> {

    class Node<T> {
        var val: T
        var next: Node?

        init(_ val: T) {
            self.val = val
        }
    }

    var head: Node<T>?
    var tail: Node<T>?

    var last: T? {
        tail?.val
    }

    var count = 0

    var isEmpty: Bool {
        head == nil
    }

    init() {

    }

    init(_ startingElement: T) {
        let node = Node(startingElement)
        head = node
        tail = node
        count += 1
    }

    func enqueue(_ element: T) {
        count += 1
        let node = Node(element)
        if head == nil {
            head = node
        } else {
            tail!.next = node
        }
        tail = node
    }

    func dequeue() -> T {
        count -= 1
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
