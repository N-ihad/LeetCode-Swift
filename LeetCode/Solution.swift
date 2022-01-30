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
        var flag = false
        while head?.next != nil && !flag {
            print(head!.val)
            Helper.printList(origin)
            let temp = head?.next
            buff?.next = head?.next?.next
            temp?.next = head?.next?.next
            buff = buff?.next
            buff?.next = evenListHeadOrigin
            head = temp
            Helper.printList(origin)
        }
        return origin
    }
}
