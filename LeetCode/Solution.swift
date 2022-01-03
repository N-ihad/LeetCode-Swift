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

    init(_ val: Int, next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow: ListNode? = head
        var fast: ListNode? = head?.next

        while slow != nil {
            if slow === fast {
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }

        return false
    }
}
