//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        return _sumNumbers(root, 0)
    }

    private func _sumNumbers(_ root: TreeNode?, _ path: Int) -> Int {
        if root == nil { return 0 }

        let path = path * 10 + root!.val

        if root!.left == nil && root!.right == nil {
            return path
        }

        return _sumNumbers(root!.left, path) + _sumNumbers(root!.right, path)
    }
}
