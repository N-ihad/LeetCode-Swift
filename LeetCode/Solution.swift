//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        _levelOrderBottom(root, &result, 0)
        return result.reversed()
    }

    private func _levelOrderBottom(_ root: TreeNode?, _ result: inout [[Int]], _ level: Int) {
        if root == nil { return }
        let isIndexExists = result.indices.contains(level)

        if isIndexExists {
            result[level].append(root!.val)
        } else {
            result.append([root!.val])
        }

        _levelOrderBottom(root!.left, &result, level + 1)
        _levelOrderBottom(root!.right, &result, level + 1)
    }
}
