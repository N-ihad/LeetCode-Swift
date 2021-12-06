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
    }

    init(_ val: Int) {
        self.val = val
    }

    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
//   5
// 4  6
//   3 7
// [5,4,6,-1,-1,3,7]
//  1 2 3  4  5 6 7
// 6 -> 3
// 7 -> 3
// log(n)


class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        func isValidBST(_ root: TreeNode?, visitedNodesLeftTree: inout [Int], visitedNodesRightTree: inout [Int]) -> Bool {

            if root == nil {
                return true
            }

            if root!.left != nil {
                visitedNodesLeftTree.append(root!.left!.val)
            }

            if root!.right != nil {
                visitedNodesLeftTree.append(root!.right!.val)
            }



            if root!.left != nil && root!.left!.val >= root!.val {
                return false
            }

            if root!.right != nil && root!.right!.val <= root!.val {
                return false
            }

            return isValidBST(root?.left, visited: visited) && isValidBST(root?.right, visited: visited)
        }

        var left = [Int]()
        var right = [Int]()
        return isValidBST(root, visitedNodesLeftTree: &left, visitedNodesRightTree: &right)
    }
}
