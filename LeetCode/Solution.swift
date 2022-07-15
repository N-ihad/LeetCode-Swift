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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var diameter = 0
        dfs(root, &diameter)
        return diameter
    }

    @discardableResult
    private func dfs(_ node: TreeNode?, _ diameter: inout Int) -> Int {
        guard let node = node else {
            return 0
        }

        let (left, right) = (dfs(node.left, &diameter), dfs(node.right, &diameter))

        diameter = max(diameter, left + right)

        return max(left, right) + 1
    }
}
