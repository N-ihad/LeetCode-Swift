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
    // MARK: - Iterative
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil

        var head = head
        while head != nil {
            let next = head?.next
            head?.next = prev
            prev = head
            head = next
        }

        return prev
    }

    // MARK: - Recursive
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        var head: ListNode? = head
//        func reverseRecursively(_ prev: ListNode?, _ curr: ListNode?) {
//            if curr?.next == nil {
//                curr?.next = prev
//                head = curr
//                return
//            }
//            reverseRecursively(curr, curr?.next)
//            curr?.next = prev
//        }
//        reverseRecursively(nil, head)
//        return head
//    }
}
