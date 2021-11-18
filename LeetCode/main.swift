//
//  main.swift
//  LeetCode
//
//  Created by Nihad on 11/17/21.
//

import Foundation

// MARK: - Helpful stuff
class ListNode {

    var val: Int
    var next: ListNode?

    init() {
        val = 0
        next = nil
    }

    init(_ val: Int) {
        self.val = val
        next = nil
    }

    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

func printAllNodes(startingNode: ListNode?) {
    if startingNode == nil {
        print()
        return
    }

    print(startingNode!.val, terminator: ", ")
    printAllNodes(startingNode: startingNode?.next)
}

// MARK: - Solution O(n)
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
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

    if l1 == nil {
        dummy?.next = l2
    } else {
        dummy?.next = l1
    }

    return beginNode?.next
}

// MARK: - Testing
// [1, 2, 4]
// [1, 3, 4]
// [1, 1, 2, 3, 4, 4]

let l01 = ListNode(1)
let l02 = ListNode(2)
let l03 = ListNode(4)
l01.next = l02
l02.next = l03

let l11 = ListNode(1)
let l12 = ListNode(3)
let l13 = ListNode(4)
l11.next = l12
l12.next = l13

let node = mergeTwoLists(l01, l11)
printAllNodes(startingNode: node)
