//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }

        let origin = head
        var buff = head
        var head = head
        let evenListHeadOrigin = head!.next

        while head?.next != nil {
            let temp = head?.next
            buff?.next = head?.next?.next
            temp?.next = head?.next?.next
            buff = buff?.next
            buff?.next = evenListHeadOrigin
            head = temp
        }

        return origin
    }
}
