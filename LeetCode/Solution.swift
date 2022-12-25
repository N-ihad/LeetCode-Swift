//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    var (maxLevel, maxValue) = (0, -1)

    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        DFS(root, 1)
        return maxValue
    }

    func DFS(_ root: TreeNode?, _ currentLevel: Int) {
        if root == nil { return }

        if currentLevel > maxLevel {
            maxLevel = currentLevel
            maxValue = root!.val
        }

        DFS(root!.left, currentLevel + 1)
        DFS(root!.right, currentLevel + 1)
    }
}
