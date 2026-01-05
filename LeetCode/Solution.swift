//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/maximum-matrix-sum/solutions/7470060/swift-solution-with-explanation-by-nihad-v1n1

    In our solution, we rely on the key observation that the main operation (multiplying 2 elements by -1) preserves the 
    parity of the number of negative values in the matrix. If the total number of negatives is even, we can always eliminate all 
    negative signs and make every element positive: even if two negative cells are far apart, we can gradually move their negative signs across 
    the grid by repeatedly flipping adjacent pairs until the two negatives meet along a horizontal or vertical path, at which point they cancel out. 
    If the total number of negatives is odd, then one element must remain negative no matter what operations we apply; in this case, the most 
    profitable choice is to keep the smallest absolute value negative and turn all other elements positive. That is why we sum the absolute values of all 
    elements and, when the negative count is odd, subtract twice the minimum absolute value—effectively leaving only that smallest element negative while 
    ensuring all remaining negatives are canceled as described above.

    So, we just collect the absolute sum and then if the negative number of elements is even, we can 100% cancel out all of them (as discussed above), and 
    if it's odd, then we need to subtract 2 times the smallest (minimum) number since that number was included in sum as absolute and since we are leaving it with
    minus then we need to subtract that number from the sum again, since it decreases our sum with that minus sign.

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
