//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        _invertTree(root)
        return root
    }

    private func _invertTree(_ node: TreeNode?) {
        if node == nil { return }

        _invertTree(node?.left)
        _invertTree(node?.right)

        if node?.left != nil && node?.right == nil {
            node?.right = node?.left
            node?.left = nil
        } else if node?.left == nil && node?.right != nil {
            node?.left = node?.right
            node?.right = nil
        } else if node?.left != nil && node?.right != nil {
            let temp = node?.left
            node?.left = node?.right
            node?.right = temp
        }
    }
}
