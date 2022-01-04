//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

func printList(_ root: ListNode?) {
    var head = root
    if head == nil {
        print("[]")
        return
    } else {
        print("[ ", terminator: "")
    }
    while head != nil {
        print(head!.val, terminator: " ")
        head = head?.next
    }
    print("]")
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let originalHead = head
        var counter = 0
        var hashMap: [Int: ListNode?] = [:]

        var head = head
        while head != nil {
            counter += 1
            hashMap[counter] = head
            head = head?.next
        }

        let elementToRemove = counter + 1 - n

        if n == counter {
            return hashMap[elementToRemove]??.next
        }

        hashMap[elementToRemove-1]??.next = hashMap[elementToRemove+1] as? ListNode

        return originalHead
    }
}
