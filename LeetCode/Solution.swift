//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count <= 1 {
            return lists.first?.flatMap { $0 }
        }

        var lists = lists
        while lists.count != 1 {
            lists.append(mergeTwoLists(lists[0], lists[1]))
            lists.removeFirst(2)
        }

        return lists.first?.flatMap { $0 }
    }

    private func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var dummy: ListNode? = ListNode(-10)
        let beginNode = dummy
        var l1 = l1
        var l2 = l2

        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val {
                dummy?.next = l1
                l1 = l1?.next
            } else {
                dummy?.next = l2
                l2 = l2?.next
            }
            dummy = dummy?.next
        }

        dummy?.next = l1 == nil ? l2 : l1

        return beginNode?.next
    }
}
