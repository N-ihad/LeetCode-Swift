//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }

        let dummy = ListNode(-1)

        var prev: ListNode? = dummy
        var curr: ListNode? = head
        while curr != nil && curr!.next != nil {
            let nextPair = curr!.next!.next
            let next = curr!.next
            prev!.next = next
            curr!.next = nextPair
            next!.next = curr
            prev = curr
            curr = nextPair
        }
        
        return dummy.next
    }
}
