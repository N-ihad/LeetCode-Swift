//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/solutions/4420690/swift-solution-with-explanation/

    Recursively call LCA method passing left and right children of root, 
    if root equals to either p, p or nil, then it means we found at least one of descendents p or q, 
    we whould return root, otherwise keep DFS'ing. If result of a call for left child is not nil, 
    but for the right is nil (and vice-versa) it means the other descendent is in either subtree,
    meaning LCA is either left or right child (in vice-versa case). 
    And if both left and right child calls are not nil, then it means the current node itself is LCA, which is root.
*/

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || root === p || root === q {
            return root
        }

        let left = lowestCommonAncestor(root!.left, p, q)
        let right = lowestCommonAncestor(root!.right, p, q)

        if left != nil && right == nil {
            return left
        } else if left == nil && right != nil {
            return right
        } else if left != nil && right != nil {
            return root
        }

        return nil
    }
}
