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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var head = head
        var newHead: ListNode? = head
        while head != nil {
            if head!.next == nil {
                newHead = head
            }
            let curHead = head
            head = head?.next?.next
            curHead?.next = nil
        }

        return newHead
    }
}
