//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/maximum-product-of-splitted-binary-tree/solutions/7473687/swift-solution-with-explanation-by-nihad-axja

    # Approach
    In our solution, we use depth-first search to compute subtree sums and evaluate every possible way to split the tree by removing a single edge. 
    We first traverse the tree to compute the total sum of all node values, since every valid split divides this total into two subtree sums. 
    Then, during a second traversal, we compute the sum of each subtree and treat the edge connecting it to its parent as a potential split. 
    For each such split, we calculate the product of the subtree sum and the remaining sum (`totalSum - subtreeSum`) and keep track of the maximum product found. 
    By evaluating all possible subtree splits while computing sums in one recursive process, we ensure that the maximum product is found before applying the modulo operation.

    **Key ideas:**
    - Use DFS to compute the sum of every subtree.
    - The total sum of the tree is needed to evaluate all splits.
    - Removing an edge splits the tree into `subtreeSum` and `totalSum - subtreeSum`.
    - Evaluate the product for every possible subtree split.
    - Track the maximum product before applying the modulo.

    # Complexity
    - Time complexity: $O(n)$, where $n$ is the number of nodes in the tree, because each node is visited a constant number of times during the depth-first traversals.
    - Space complexity: $O(n)$, due to the recursion stack in the worst case (a skewed tree).
*/

class Solution {
    private var totalSum: Int = 0
    private var maxProduct: Int = 0
    private let MOD = 1_000_000_007
    
    func maxProduct(_ root: TreeNode?) -> Int {
        guard let root else { 
            return 0
        }
        
        totalSum = subtreeSum(root)
        _ = subtreeSum(root)

        return maxProduct % MOD
    }

    private func subtreeSum(_ node: TreeNode?) -> Int {
        guard let node else { 
            return 0
        }

        let leftSum = subtreeSum(node.left)
        let rightSum = subtreeSum(node.right)
        let currentSum = node.val + leftSum + rightSum

        if leftSum > 0 {
            let product = leftSum * (totalSum - leftSum)
            maxProduct = max(maxProduct, product)
        }

        if rightSum > 0 {
            let product = rightSum * (totalSum - rightSum)
            maxProduct = max(maxProduct, product)
        }

        return currentSum
    }
}
