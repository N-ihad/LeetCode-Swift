//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        return dfs(root!.left, isLeft: true) + dfs(root!.right, isLeft: false)
    }

    private func dfs(_ node: TreeNode?, isLeft: Bool) -> Int {
        if node == nil { return 0 }
        if node!.left == nil && node!.right == nil && isLeft {
            return node!.val
        }
        return dfs(node!.left, isLeft: true) + dfs(node!.right, isLeft: false)
    }
}
