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

    init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return dfs(root, nil, nil)
    }

    private func dfs(_ node: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        if node == nil {
            return true
        }

        if let min = min, node!.val <= min {
            return false
        }

        if let max = max, node!.val >= max {
            return false
        }

        return dfs(node!.left, min, node!.val) && dfs(node!.right, node!.val, max)
    }
}
