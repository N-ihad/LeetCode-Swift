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
        var prevHead: ListNode? = nil
        var currentHead = head
        while currentHead?.next != nil {
            let nextHead = currentHead?.next
            currentHead?.next = prevHead
            prevHead = currentHead
            currentHead = nextHead
        }
        currentHead?.next = prevHead
        return currentHead
    }
}
