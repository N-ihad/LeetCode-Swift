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

    init() {
        val = 0
        left = nil
        right = nil
    }

    init(_ val: Int) {
        self.val = val
        left = nil
        right = nil
    }

    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
// [4,-7,-3,null,null,-9,-3,9,-7,-4,null,6,null,-6,-6,null,null,0,6,5,null,9,null,null,-1,-4,null,null,null,-2]
class Solution {
    func dfs(_ node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }

        return max(1 + dfs(node?.left), 1 + dfs(node?.right))
    }

    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        return dfs(root?.right) + dfs(root?.left)
    }
}
