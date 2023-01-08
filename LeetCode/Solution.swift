//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation
class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        if head?.next == nil { return head }
        
        var slow = head
        var fast = head?.next
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        let leftHalf = head
        let rightHalf = slow?.next
        
        slow?.next = nil
        
        var currLeft = sortList(leftHalf)
        var currRight = sortList(rightHalf)
        
        let dummy = ListNode(-1)
        var curr: ListNode? = dummy
        
        while currLeft != nil || currRight != nil {
            if currLeft?.val ?? Int.max <= currRight?.val ?? Int.max {
                curr?.next = currLeft
                currLeft = currLeft?.next
            } else {
                curr?.next = currRight
                currRight = currRight?.next
            }
            
            curr = curr?.next
        }
        
        return dummy.next
    }
}
