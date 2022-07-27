//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil || head?.next?.next == nil {
            return head
        }

        let evenBegin = head!.next
        var odd = head
        var even = head!.next
        while even != nil && even?.next != nil {
            let oddNextNext = odd?.next?.next
            let evenNextNext = even?.next?.next
            odd?.next = oddNextNext
            even?.next = evenNextNext
            odd = oddNextNext
            even = evenNextNext
        }

        odd?.next = evenBegin

        return head
    }

    // Second solution
    func oddEvenList2(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil || head?.next?.next == nil {
            return head
        }

        var count = 1
        var end = head
        while end?.next != nil {
            end = end?.next
            count += 1
        }

        let n = count % 2 == 0 ? (count - 1) / 2 + 1 : (count - 1) / 2
        var start = head
        for _ in 0..<n {
            let next = start?.next
            let nextNext = start?.next?.next
            start?.next = nextNext
            next?.next = nil
            end?.next = next

            start = start?.next
            end = end?.next
        }

        return head
    }
}
