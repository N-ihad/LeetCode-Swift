//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    var prev: TreeNode? = nil
    func flatten(_ root: TreeNode?) {
        if root == nil { return }

        flatten(root!.right)
        flatten(root!.left)
        root!.right = prev
        root!.left = nil
        prev = root!
    }
}
