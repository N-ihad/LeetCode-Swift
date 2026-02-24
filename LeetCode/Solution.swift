//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/solutions/7606495/swift-solution-using-left-bit-shift-with-funz
*/

class Solution {
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        return dfs(root, 0)
    }

    private func dfs(_ node: TreeNode?, _ current: Int) -> Int {
        guard let node else {
            return 0
        }

        let value = (current << 1) | node.val

        if node.left == nil && node.right == nil {
            return value
        }

        return dfs(node.left, value) + dfs(node.right, value)
    }
}
