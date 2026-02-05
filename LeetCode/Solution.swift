//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/transformed-array/solutions/7556164/swift-solution-with-explanation-by-nihad-i5a1

    # Intuition
    ![Screenshot 2026-02-06 at 1.10.52 AM.png](https://assets.leetcode.com/users/images/9736ce74-48fd-4e73-b600-1cf474a4312c_1770329458.2205212.png)

    # Approach
    Instead of simulating step-by-step movement, we directly compute the final index using modular arithmetic:
    $\text{tempIndex} = (i + nums[i]) \bmod n$

    However, modulo of a negative number can be negative. So we normalize it by adding `n` and taking modulo again:
    $ \text{finalIndex} = (\text{tempIndex} + n)\bmod  n $

    This guarantees the index is always in the range `[0, n-1]`.

    ## Main Key Ideas
    - The array is circular → we use modulo `% n`.
    - Moving right = positive steps.
    - Moving left = negative steps.
    - Handle negative modulo properly:
      - `(index % n + n) % n`

    # Complexity
    - Time complexity: $O(n)$, since we iterate through the array once.
    - Space complexity: $O(n)$, because we create a new result array.
*/

class Solution {
    func constructTransformedArray(_ nums: [Int]) -> [Int] {
        var result: [Int] = []; result.reserveCapacity(nums.count)
        for i in 0..<nums.count {
            let steps = nums[i]
            let tempIndex = (i + steps) % nums.count
            let finalIndex = (tempIndex + nums.count) % nums.count
            let num = nums[finalIndex]
            result.append(num)
        }
        return result
    }
}
