//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/find-the-largest-area-of-square-inside-two-rectangles/solutions/7501274/swift-solution-with-explanation-by-nihad-ianz

    # Intuition
    ![Screenshot 2026-01-17 at 9.49.42 AM.png](https://assets.leetcode.com/users/images/7713933c-8942-475e-af57-bd2db659a175_1768632589.0760338.png)

    # Approach
    We iterate over every pair of rectangles and compute their intersecting region. 
    If two rectangles intersect, their overlap forms another rectangle. 
    The largest square that can fit inside this intersection has a side length equal to the minimum of the overlap’s width and height. 
    We compute this square area for every valid pair and keep track of the maximum one found.

    ## Main Key Ideas
    - Only intersections of **at least two rectangles** matter, so we check all rectangle pairs.
    - The intersection rectangle is defined by:
      - `left = max(x₁_left, x₂_left)`
      - `right = min(x₁_right, x₂_right)`
      - `bottom = max(y₁_bottom, y₂_bottom)`
      - `top = min(y₁_top, y₂_top)`
    - If `left >= right` or `bottom >= top`, the rectangles do not intersect.
    - For a valid intersection, the largest possible square inside it has:
      - `side = min(right - left, top - bottom)`
    - The square’s area is `side × side`.
    - We track the maximum such area across all rectangle pairs.

    # Complexity
    - Time complexity: $O(n^2)$, since we check all pairs of rectangles.
    - Space complexity: $O(1)$, as we only use a constant amount of extra space (excluding input).
*/

class Solution {
    
}
