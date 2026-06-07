//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/create-binary-tree-from-descriptions/solutions/8319579/swift-solution-with-explanation-by-nihad-eh3v
*/

class Solution {
    func createBinaryTree(_ descriptions: [[Int]]) -> TreeNode? {
        var nodes: [Int: TreeNode] = [:]
        var children: Set<Int> = []

        for desc in descriptions {
            let (parentVal, childVal, isLeft) = (desc[0], desc[1], desc[2] == 1)
            let parent = nodes[parentVal] ?? TreeNode(parentVal)
            let child = nodes[childVal] ?? TreeNode(childVal)

            if isLeft {
                parent.left = child
            } else {
                parent.right = child
            }

            nodes[parentVal] = parent
            nodes[childVal] = child
            children.insert(childVal)
        }

        // finding root (the only node that is not a child)
        for (val, node) in nodes {
            if !children.contains(val) {
                return node
            }
        }

        return nil
    }
}
