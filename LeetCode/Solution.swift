//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/maximum-matrix-sum/solutions/7470437/swift-solution-with-explanation-by-nihad-l1xd

    In our solution, we iterate through the entire matrix once and focus on maximizing the contribution of each cell to the total sum. 
    We add the absolute value of every element to `sum`, count how many elements are negative, and track the smallest absolute value in the matrix. 
    The key idea is that flipping two adjacent elements preserves whether the total number of negatives is even or odd. 
    If the number of negative values is even, we can always eliminate all negatives through a sequence of valid operations, so 
    the maximum sum is simply the sum of all absolute values. If the number of negatives is odd, one element must remain negative, and the 
    optimal choice is to keep the smallest absolute value negative, which is why we subtract twice that minimum value from the total.

    **Key ideas:**
    - Flipping two adjacent elements does not change the parity (even/odd) of the number of negative values.
    - If the number of negatives is even, all values can be made positive.
    - If the number of negatives is odd, exactly one value must stay negative.
    - Keeping the smallest absolute value negative minimizes the loss in the total sum.
    - Summing absolute values gives the maximum possible contribution from each cell.

    # Complexity
    - Time complexity: $O(n^2)$
    - Space complexity: $O(1)$
*/

class Solution {
    func maxMatrixSum(_ matrix: [[Int]]) -> Int {
        var (sum, min, negativesCount) = (0, 100000, 0)
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                if matrix[i][j] < 0 {
                    negativesCount += 1
                }
                let unsignedElement = abs(matrix[i][j])
                if unsignedElement < min {
                    min = unsignedElement
                }
                sum += unsignedElement
            }
        }

        sum = negativesCount % 2 == 0 ? sum : sum - min - min

        return sum
    }
}
