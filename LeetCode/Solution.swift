//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/spiral-matrix/solutions/7470448/swift-solution-with-explanation-by-nihad-4nz6

    # Approach
    In our solution, we simulate walking through the matrix in a spiral by moving step by step while keeping track of direction and visited cells. 
    We start at the top-left corner and initially move to the right, storing each visited value in the result array and marking its position as visited. 
    At every step, we check whether the next cell in the current direction is either out of bounds or already visited; if so, we change direction in the 
    spiral order (right → down → left → up) and continue moving. This process repeats until we have visited exactly `m × n` cells, ensuring every element is 
    added once in spiral order.

    **Key ideas:**
    - Simulate spiral movement by maintaining a current direction.
    - Change direction when the next cell is invalid or already visited.
    - Use a visited set to ensure each cell is processed exactly once.
    - Stop when all matrix elements have been added to the result.
    
    # Complexity
    - Time complexity: $O(nm)$
    - Space complexity: $O(nm)$
*/

class Solution {
    enum Direction { case right, down, left, up }

    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let numberOfElements = matrix.count * matrix[0].count
        var result: [Int] = []; result.reserveCapacity(numberOfElements)
        var visited: Set<[Int]> = []
        var (i, j) = (0, 0)
        var direction: Direction = .right

        while visited.count != numberOfElements {
            visited.insert([i, j])
            result.append(matrix[i][j])
            switch direction {
            case .right:
                if j == matrix[0].count - 1 || visited.contains([i, j+1]) {
                    direction = .down
                    i += 1
                } else {
                    j += 1
                }
            case .down:
                if i == matrix.count - 1 || visited.contains([i+1, j]) {
                    direction = .left
                    j -= 1
                } else {
                    i += 1
                }
            case .left:
                if j == 0 || visited.contains([i, j-1]) {
                    direction = .up
                    i -= 1
                } else {
                    j -= 1
                }
            case .up:
                if visited.contains([i-1, j]) {
                    direction = .right
                    j += 1
                } else {
                    i -= 1
                }
            }
        }

        return result
    }
}
