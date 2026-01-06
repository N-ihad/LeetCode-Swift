//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/maximum-level-sum-of-a-binary-tree/solutions/7470424/swift-solution-with-explanation-by-nihad-gnmi

    In our solution, we perform a level-order traversal (BFS) of the binary tree to compute the sum of values at each level. 
    We start with the root in a queue and treat each iteration of the outer loop as one tree level. For every level, we 
    process all nodes currently in the queue, accumulate their values into a running sum, and collect their children into a temporary queue for 
    the next level. After computing the sum for a level, we compare it with the maximum sum seen so far and update the result if the 
    current level has a larger sum, keeping the smallest level index in case of ties by updating only when the sum is strictly greater.
    By moving level by level in order, we solve the problem.

    # Complexity
    - Time complexity: $O(n)$
    - Space complexity: $O(n)$
*/

class Solution {
    func maxLevelSum(_ root: TreeNode?) -> Int {
        var queue = [root!]
        var (maxSum, level, minLevel) = (Int.min, 1, 1)
        while !queue.isEmpty {
            var tempQueue: [TreeNode] = []
            var sum = 0
            while let popped = queue.popLast() {
                sum += popped.val
                if let left = popped.left {
                    tempQueue.append(left)
                }
                if let right = popped.right {
                    tempQueue.append(right)
                }
            }

            if sum > maxSum {
                maxSum = sum
                minLevel = level
            }

            queue = tempQueue
            level += 1
        }

        return minLevel
    }
}
