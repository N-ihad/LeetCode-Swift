//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        let root = sortedArrayToBST(nums, 0, nums.count - 1)
        return root
    }

    private func sortedArrayToBST(_ nums: [Int], _ L: Int, _ R: Int) -> TreeNode? {
        if L > R {
            return nil
        }

        let mid = (L + R) / 2
        
        let node = TreeNode(nums[mid])
        node.left = sortedArrayToBST(nums, L, mid - 1)
        node.right = sortedArrayToBST(nums, mid + 1, R)

        return node
    }
}
