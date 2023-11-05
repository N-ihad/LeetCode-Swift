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
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }

        let newHead = Node(node.val)
        var hashTable: [Int: Node] = [newHead.val: newHead]
        let queue = Queue<Node>(node) // Definition of Queue type is below
        
        while !queue.isEmpty {
            let node = queue.dequeue()
            
            if hashTable[node.val] == nil {
                hashTable[node.val] = Node(node.val)
            }

            for child in node.neighbors where child != nil {
                let child = child!

                if hashTable[child.val] == nil {
                    hashTable[child.val] = Node(child.val)
                    queue.enqueue(child)
                }

                hashTable[node.val]!.neighbors.append(hashTable[child.val]!)
            }
        }

        return newHead
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

    var isEmpty: Bool {
        head == nil
    }

    init() {

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
