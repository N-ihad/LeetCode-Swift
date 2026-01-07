//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/spiral-matrix-ii/solutions/7475219/swift-solution-with-explanation-by-nihad-fh17

    # Approach
    In our solution, we generate the matrix by simulating a spiral walk while filling numbers from `1` to `n²`. 
    We start at the top-left corner and move in the current direction (initially to the right), placing the next number into the matrix and
    marking the position as visited. At each step, we check whether the next cell in the current direction is out of bounds or already visited; 
    if so, we rotate the direction in spiral order (right → down → left → up) and continue. This process repeats until all `n²` positions are filled.

    We need checks like `visited.contains([i, j+1])`, `visited.contains([i+1, j])`, `visited.contains([i, j-1])`, and `visited.contains([i-1, j])` to detect when 
    continuing in the current direction would cause us to revisit a cell that has already been filled. Without these checks, the traversal would 
    overwrite previously written values or move in an incorrect loop. These conditions allow us to know exactly when to turn to the next direction in the spiral, 
    ensuring we always move along the current unfilled boundary of the matrix and maintain the correct spiral shape.

    **Key ideas:**
    - Simulate spiral traversal using a direction state.
    - Fill numbers incrementally from `1` to `n²`.
    - Track visited cells to avoid overwriting values.
    - Change direction when the next cell is invalid or already visited.
    - Stop once all matrix cells have been filled.

    # Complexity
    - Time complexity: $O(n^2)$, since each cell in the matrix is visited exactly once.
    - Space complexity: $O(n^2)$, due to the `visited` set used to track filled positions.
*/

class Solution {
    enum Direction { case right, down, left, up }

    func generateMatrix(_ n: Int) -> [[Int]] {
        let numberOfElements = n * n

        var result: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
        var visited: Set<[Int]> = []; visited.reserveCapacity(numberOfElements)
        var (i, j, num) = (0, 0, 1)
        var direction: Direction = .right

        while visited.count != numberOfElements {
            visited.insert([i, j])
            result[i][j] = num
            switch direction {
            case .right:
                if j == n - 1 || visited.contains([i, j+1]) {
                    direction = .down
                    i += 1
                } else {
                    j += 1
                }
            case .down:
                if i == n - 1 || visited.contains([i+1, j]) {
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
            num += 1
        }

        return result
    }
}
