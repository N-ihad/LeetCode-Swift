//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode(-1, head)
        
        var prev: ListNode? = dummy
        var curr: ListNode? = head
        while curr != nil {
            let next = curr!.next

            if curr!.val == val {
                curr!.next = nil
                prev!.next = next
            } else {
                prev = curr
            }

            curr = next
        }

        return dummy.next
    }
}
