//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil { return [] }
        var queue: [TreeNode?] = [root]
        var result: [[Int]] = [[root!.val]]
        var turnAround = false

        while !queue.isEmpty {
            var tempQueue: [TreeNode?] = []
            var tempResult: [Int] = []
            for _ in 0..<queue.count {
                let popped = queue.removeLast()!
                if turnAround {
                    if popped.left != nil {
                        tempQueue.append(popped.left)
                        tempResult.append(popped.left!.val)
                    }
                    if popped.right != nil {
                        tempQueue.append(popped.right)
                        tempResult.append(popped.right!.val)
                    }
                } else {
                    if popped.right != nil {
                        tempQueue.append(popped.right)
                        tempResult.append(popped.right!.val)
                    }
                    if popped.left != nil {
                        tempQueue.append(popped.left)
                        tempResult.append(popped.left!.val)
                    }
                }
            }
            queue = tempQueue
            turnAround = !turnAround
            if !tempResult.isEmpty { result.append(tempResult) }
        }

        return result
    }
}
