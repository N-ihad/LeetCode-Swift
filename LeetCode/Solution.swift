//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/spiral-matrix-iii/solutions/7475928/swift-solution-with-explanation-by-nihad-8xki

    # Approach
    We simulate the spiral movement starting from `(rStart, cStart)` by walking in fixed directions (right, down, left, up) while 
    gradually increasing the number of steps taken in each direction. Even when we move outside the grid boundaries, we continue the spiral pattern, but 
    we only record positions that are within bounds. By increasing the step length after completing two directions, we ensure the spiral expands correctly until 
    all `rows * cols` valid cells are visited.

    ### Main Key Ideas
    - Start from the given cell and follow a clockwise spiral pattern.
    - Move in four directions in order: right → down → left → up.
    - Increase the number of steps after every two direction changes to expand the spiral.
    - Continue moving even outside the grid, but only record coordinates that are within bounds.
    - Stop once we have collected exactly `rows * cols` positions.

    # Complexity
    - Time complexity: $O(rows \times cols)$, because each valid cell in the grid is added to the result exactly once.
    - Space complexity: $O(1)$, (output array which we should return doesn't count as extra space)
*/

class Solution {
    func spiralMatrixIII(_ rows: Int, _ cols: Int, _ rStart: Int, _ cStart: Int) -> [[Int]] {
        let numberOfElements = rows * cols

        var result: [[Int]] = []
        var (i, j) = (rStart, cStart)
        var steps = 1

        while result.count != numberOfElements {

            for k in 0..<steps {
                addToResultIfWithinBounds(i, j, rows, cols, &result)
                j += 1
            }

            for k in 0..<steps {
                addToResultIfWithinBounds(i, j, rows, cols, &result)
                i += 1
            }

            steps += 1

            for k in 0..<steps {
                addToResultIfWithinBounds(i, j, rows, cols, &result)
                j -= 1
            }

            for k in 0..<steps {
                addToResultIfWithinBounds(i, j, rows, cols, &result)
                i -= 1
            }

            steps += 1
        }

        return result
    }

    private func addToResultIfWithinBounds(_ i: Int, _ j: Int, _ rows: Int, _ cols: Int, _ result: inout [[Int]]) {
        if i >= 0 && i < rows && j >= 0 && j < cols {
            result.append([i, j])
        }
    }
}
