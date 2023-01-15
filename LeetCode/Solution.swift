//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil { return true }
        return abs(height(root!.left) - height(root!.right)) <= 1 && isBalanced(root!.left) && isBalanced(root!.right)
    }

    private func height(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        return 1 + max(height(root!.left), height(root!.right))
    }
}
