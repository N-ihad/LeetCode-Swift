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

    init() {
        val = 0
        left = nil
        right = nil
    }

    init(_ val: Int) {
        self.val = val
        left = nil
        right = nil
    }

    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func dfs(_ node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }

        return max(1 + dfs(node?.left), 1 + dfs(node?.right))
    }

    func maxDepth(_ root: TreeNode?) -> Int {
        return dfs(root)
    }
}
