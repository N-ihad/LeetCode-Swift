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

    func DFS(_ root: TreeNode?, _ counter: Int) {
        if root == nil { return }

        if counter > maxLevel {
            maxLevel = counter
            maxValue = root!.val
        }

        DFS(root!.left, counter + 1)
        DFS(root!.right, counter + 1)
    }
}
