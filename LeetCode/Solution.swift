//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func connect(_ root: Node?) -> Node? {
        var levelHead = root
        while levelHead != nil {
            var head = levelHead
            while head != nil {
                head?.left?.next = head?.right
                head?.right?.next = head?.next?.left
                head = head?.next
            }
            levelHead = levelHead?.left
        }

        return root
    }
}

// BFS solution
/*
class Solution {
    func connect(_ root: Node?) -> Node? {
        let queue = root == nil ? Queue<Node>() : Queue<Node>(root!)
        
        while !queue.isEmpty {
            var prev: Node?
            for _ in 0..<queue.count {
                let node = queue.dequeue()
                prev?.next = node
                prev = node

                if let left = node.left {
                    queue.enqueue(left)
                }

                if let right = node.right {
                    queue.enqueue(right)
                }
            }
        }

        return root
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
*/
