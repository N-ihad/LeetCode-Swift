//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/reverse-linked-list-ii/solutions/7369344/swift-solution-with-explanation-by-nihad-igfn

    # Approach
    The idea is to walk through the list until we reach the **left** position, mark the boundaries of the section to reverse, 
    reverse that portion, then reconnect everything.

    #### Key Steps

    1. **Traverse the list** while keeping track of:
       - `prev` — the node before `current`
       - `nodeBeforeSubHead` — the node right before the reversing segment
       - `subHead` — the first node of the segment to reverse
       - `subTail` — the last node of the segment to reverse

    2. When `counter == left`  
       → Mark `nodeBeforeSubHead` and `subHead`.

    3. When `counter == right`  
       → Mark `subTail`, save the node after it, call `reverseList` to reverse the segment, then reconnect:
       - `subHead.next` → node after the reversed segment  
       - `nodeBeforeSubHead.next` → `subTail`  
       - If reversing starts at the head, return `subTail` as the new head.

    4. **reverseList(startNode:endNode:)**  
       Reverses pointers from `startNode` up to `endNode`.  
       It iteratively flips `next` pointers until reaching `endNode`.

    5. Finally, return the (possibly new) head of the list.
    
    # Complexity
    - Time complexity: $O(n)$
    - Space complexity: $O(1)$
*/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var prev: ListNode?
        var current: ListNode? = head
        var nodeBeforeSubHead: ListNode?
        var subHead: ListNode!
        var subTail: ListNode!
        var counter = 1
        while current != nil {
            if counter == left {
                nodeBeforeSubHead = prev
                subHead = current
            } else if counter == right {
                let nodeAfterSubTail = current?.next
                subTail = current
                reverseList(startNode: subHead, endNode: subTail)
                subHead.next = nodeAfterSubTail
                nodeBeforeSubHead?.next = subTail
                return nodeBeforeSubHead == nil ? subTail : head
            }

            prev = current
            current = current?.next
            counter += 1
        }
        return head
    }

    private func reverseList(startNode: ListNode, endNode: ListNode) {
        var prev: ListNode?
        var current: ListNode? = startNode
        while current != nil {
            let next = current?.next
            current?.next = prev

            if next == nil || current === endNode {
                break
            }

            prev = current
            current = next
        }
    }
}

