//
//  main.swift
//  LeetCode
//
//  Created by Nihad on 11/17/21.
//

import Foundation

let head1: ListNode? = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
let n1 = 2

let head2: ListNode? = ListNode(1)
let n2 = 1

let head3: ListNode? = ListNode(1, ListNode(2))
let n3 = 1

let s = Solution()
printList(s.removeNthFromEnd2(head1, n1))
printList(s.removeNthFromEnd2(head2, n2))
printList(s.removeNthFromEnd2(head3, n3))
