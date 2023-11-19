//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func preorder(_ root: Node?) -> [Int] {
        var stack = root == nil ? [] : [root!]
        var result: [Int] = []

        while !stack.isEmpty {
            let node = stack.removeLast()
            result.append(node.val)

            let n = node.children.count
            for i in 0..<n {
                stack.append(node.children[n-1-i])
            }
        }

        return result
    }
}
