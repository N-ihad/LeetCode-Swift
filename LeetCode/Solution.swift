//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    Top-down O(n^2) approach:
    https://leetcode.com/problems/balanced-binary-tree/solutions/7564177/swift-solution-top-down-approach-with-ex-bnsa

    Bottom-up O(n) approach:
    https://leetcode.com/problems/balanced-binary-tree/solutions/7564188/swift-solution-on-bottom-up-approach-wit-qlvs
*/

class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil { return true }
        return abs(height(root!.left) - height(root!.right)) <= 1 && isBalanced(root!.left) && isBalanced(root!.right)
    }

    private func height(_ node: TreeNode?) -> Int {
        if node == nil { return 0 }
        return 1 + max(height(node!.left), height(node!.right))
    }
}
