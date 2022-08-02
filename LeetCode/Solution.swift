//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        inorderTraversal(root, &result)
        return result
    }

    private func inorderTraversal(_ root: TreeNode?, _ result: inout [Int]) {
        if root == nil {
            return
        }

        if root!.left != nil {
            inorderTraversal(root!.left, &result)
        }

        result.append(root!.val)
        inorderTraversal(root!.right, &result)
    }

    // Another solution without a need of a parameter, plain recursion
//    func inorderTraversal(_ root: TreeNode?) -> [Int] {
//        if root == nil {
//            return []
//        }
//
//        if root!.left == nil {
//            return [root!.val] + inorderTraversal1(root!.right)
//        }
//
//        return inorderTraversal(root!.left) + [root!.val] + inorderTraversal(root!.right)
//    }
}
