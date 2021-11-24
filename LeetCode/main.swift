//
//  main.swift
//  LeetCode
//
//  Created by Nihad on 11/17/21.
//

import Foundation

// MARK: - Testing
let sut = Solution()

let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)
let k = 2

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

//let node1 = ListNode(0)
//let node2 = ListNode(1)
//let k = 3

node1.next = node2

var node: ListNode? = sut.rotateRight(node1, k)
while node != nil {
    print(node!.val)
    node = node!.next
}
