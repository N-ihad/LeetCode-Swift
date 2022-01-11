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

    init(_ val: Int, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy: ListNode? = ListNode(-1)
        var head1 = l1
        var head2 = l2
        var head3: ListNode? = dummy
        var remainder = 0

        while head1 != nil || head2 != nil || remainder == 1 {
            let sum = (head1?.val ?? 0) + (head2?.val ?? 0)
            head3?.next = ListNode((sum+remainder)%10)
            remainder = (sum + remainder) >= 10 ? 1 : 0

            head1 = head1?.next
            head2 = head2?.next
            head3 = head3?.next
        }

        return dummy?.next
    }
}
