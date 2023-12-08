//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func tree2str(_ root: TreeNode?) -> String {
        var result = "\(root!.val)"
        dfs(root, &result)
        return result
    }

    private func dfs(_ node: TreeNode?, _ result: inout String) {
        if node == nil || (node!.left == nil && node!.right == nil) {
            return
        }

        if node!.left != nil && node!.right != nil {
            result += "(" + String(node!.left!.val)
            dfs(node!.left, &result)
            result += ")(" + String(node!.right!.val)
            dfs(node!.right, &result)
            result += ")"
        } else if node!.left == nil && node!.right != nil {
            result += "()(" + String(node!.right!.val)
            dfs(node!.right, &result)
            result += ")"
        } else if node!.left != nil && node!.right == nil {
            result += "(" + String(node!.left!.val)
            dfs(node!.left, &result)
            result += ")"
        }
    }
}
