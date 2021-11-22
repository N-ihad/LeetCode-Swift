//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Node {
    var val: Int
    var next: Node?
    var random: Node?

    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var node: Node? = head
        while node != nil {
            let newNode = Node(node!.val)
            newNode.next = node!.next
            newNode.random = node
            node!.next = newNode
            node = newNode.next
        }

        node = head
        while node != nil {
            node!.next?.random = node!.next!.random?.random?.next
            node = node?.next?.next
        }

        node = head
        let origin: Node? = head?.next
        var newHead: Node? = origin
        while node != nil {
            node?.next = node?.next?.next
            newHead?.next = node?.next?.next
            newHead = newHead?.next
            node = node?.next
        }

        return origin
    }
}
