//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil { return false }
        if root!.left == nil && root!.right == nil && targetSum - root!.val == 0 { return true }

        return hasPathSum(root!.left, targetSum - root!.val) || hasPathSum(root!.right, targetSum - root!.val)
    }
}
