//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head?.next == nil || k == 1 { return head }
        
        let dummy = ListNode(-1)
        var prev: ListNode? = nil
        var groupHeadCurr: ListNode? = dummy
        var groupHeadPrev: ListNode? = nil
        var curr = head
        var kCount = 1
        
        while curr != nil {
            if kCount == k {
                let next = curr?.next
                curr?.next = prev
                groupHeadPrev?.next = curr
                groupHeadCurr?.next = next
                curr = next
                prev = nil
                kCount = 1
                continue
            } else if kCount == 1 {
                groupHeadPrev = groupHeadCurr
                groupHeadCurr = curr
            }
            
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
            kCount += 1
        }
        
        if kCount <= k && kCount != 1 {
            var curr: ListNode? = prev
            var prev: ListNode? = nil
            while curr != nil && kCount > 0 {
                let next = curr?.next
                curr?.next = prev
                prev = curr
                curr = next
                kCount -= 1
            }
            
            groupHeadPrev?.next = groupHeadCurr
        }
        
        return dummy.next
    }
}
