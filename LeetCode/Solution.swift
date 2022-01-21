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

    init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil { return [] }
        var res: [[Int]] = Array(repeating: [], count: 2000)
        var lastIndex = -1

        func fill(_ node: TreeNode?, _ counter: Int) {
            if node == nil {
                return
            }
            let counter = counter + 1
            fill(node?.left, counter)
            fill(node?.right, counter)
            res[counter].append(node!.val)
            lastIndex = counter > lastIndex ? counter : lastIndex
        }

        fill(root, -1)
        return Array(res[0...lastIndex])
    }
}
