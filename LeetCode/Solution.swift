//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/balance-a-binary-search-tree/solutions/7566830/swift-solution-with-explanation-by-nihad-0l3i
*/

class Solution {
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        var values: [Int] = []
        inorder(root, &values)
        return buildBalancedBST(from: values, start: 0, end: values.count - 1)
    }

    private func inorder(_ node: TreeNode?, _ result: inout [Int]) {
        guard let node else { return }
        inorder(node.left, &result)
        result.append(node.val)
        inorder(node.right, &result)
    }

    private func buildBalancedBST(from values: [Int], start: Int, end: Int) -> TreeNode? {
        guard start <= end else { return nil }
        let mid = start + (end - start) / 2
        let root = TreeNode(values[mid])
        root.left  = buildBalancedBST(from: values, start: start, end: mid - 1)
        root.right = buildBalancedBST(from: values, start: mid + 1, end: end)
        return root
    }
}
