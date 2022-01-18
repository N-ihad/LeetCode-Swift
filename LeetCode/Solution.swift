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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var counter = 0
        var val = 0

        func inorderTraversal(_ node: TreeNode?) {
            if node == nil || counter == k {
                return
            }
            inorderTraversal(node?.left)
            counter += 1
            if counter == k { val = node!.val; return }
            inorderTraversal(node?.right)
        }

        inorderTraversal(root)
        return val
    }
}
