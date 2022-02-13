//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var _headA = headA
        var _headB = headB
        while _headA !== _headB {
            _headA = _headA != nil ? _headA!.next : headB
            _headB = _headB != nil ? _headB!.next : headA
        }
        return _headA
    }
}
