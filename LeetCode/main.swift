//
//  main.swift
//  LeetCode
//
//  Created by Nihad on 11/17/21.
//

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

let root = TreeNode(1)
let node1_3 = TreeNode(3)
root.left = TreeNode(2)
root.right = node1_3
node1_3.left = TreeNode(4)
node1_3.right = TreeNode(5)

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        return ""
    }

    func deserialize(_ data: String) -> TreeNode? {
        return nil
    }
}

