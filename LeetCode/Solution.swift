//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ val: Int = 0, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        func isMirror(left: TreeNode?, right: TreeNode?) -> Bool {
            if left == nil && right == nil { return true }
            guard let left = left,
                  let right = right else {
                return false
            }

            return left.val == right.val && isMirror(left: left.left, right: right.right) && isMirror(left: left.right, right: right.left)
        }
        return isMirror(left: root, right: root)
    }
}
