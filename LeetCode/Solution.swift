//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var paths: [[Int]] = []
        _pathSum(root, targetSum, [], &paths)
        return paths
    }

    private func _pathSum(_ root: TreeNode?, _ targetSum: Int, _ path: [Int], _ paths: inout [[Int]]) {
        if root == nil { return }

        var path = path
        path.append(root!.val)

        if root!.left == nil && root!.right == nil && targetSum - root!.val == 0 {
            paths.append(path)
            return
        }
        
        _pathSum(root!.left, targetSum - root!.val, path, &paths)
        _pathSum(root!.right, targetSum - root!.val, path, &paths)
    }
}
