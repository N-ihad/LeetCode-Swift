//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?

    init() {
        val = 0
        next = nil
    }

    init(_ val: Int) {
        self.val = val
        next = nil
    }

    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        var n = 0
        var node: ListNode? = head
        while node != nil {
            n += 1
            node = node!.next
        }

        if n == k || k == 0 || head == nil || n == 1 {
            return head
        }

        let k = k < n ? n - k : n - (k % n == 0 ? n : k % n)

        node = head
        for i in 0..<k {
            if i == k - 1 {
                let newHead = node!.next
                node!.next = nil
                node = newHead
                while node?.next != nil {
                    node = node?.next
                }
                node?.next = head
                return newHead
            }
            node = node?.next
        }

        return node
    }
}
