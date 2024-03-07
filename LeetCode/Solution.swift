//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/middle-of-the-linked-list/solutions/4839284/swift-solution-fast-and-slow-pointer-with-explanation/

    We create 2 pointers fast and slow. fast is jumping 2 nodes and slow is jumping 1 node on each iteration.
    If slow = i, where i is i-th node (zero based), then fast = i * 2. So if we reach
    the end (fast's next is nil or fast itself is nil) it means i is oni = slow = n / 2 index, 
    exactly in the middle, because if we multiple 2 sides of equation, we get i * 2 = fast = n exactly 2 times from middle,
    so math checks out.
*/

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var (slow, fast) = (head, head)

        while fast != nil && fast!.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
        }

        return slow
    }
}
