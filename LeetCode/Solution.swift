//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = -1002
        dfs(root, &maxSum)
        return maxSum
    }

    @discardableResult
    private func dfs(_ node: TreeNode?, _ maxSum: inout Int) -> Int {
        guard let node = node else {
            return 0
        }
        let (left, right) = (max(dfs(node.left, &maxSum), 0), max(dfs(node.right, &maxSum), 0))

        maxSum = max(maxSum, left + right + node.val)

        return max(left, right) + node.val
    }
}
