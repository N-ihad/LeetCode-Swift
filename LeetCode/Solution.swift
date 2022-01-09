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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var result: [String] = []
        var stack: [String] = []

        func dfs(_ node: TreeNode?) {
            guard let node = node else {
                return
            }
            stack.append(String(node.val))
            dfs(node.left)
            dfs(node.right)
            if node.left == nil && node.right == nil {
                result.append(stack.joined(separator: "->"))
            }
            stack.removeLast()
        }

        dfs(root)
        return result
    }
}
