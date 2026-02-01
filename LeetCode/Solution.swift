//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/divide-an-array-into-subarrays-with-minimum-cost-i/solutions/7540938/swift-solution-with-explanation-by-nihad-c3sz

    # Intuition
    ![Screenshot 2026-02-01 at 4.56.33 AM.png](https://assets.leetcode.com/users/images/12cd1eb0-3dbd-4513-880e-301ffcafe1cf_1769910999.4543002.png)


    # Approach
    Since we must divide the array into exactly 3 **contiguous** subarrays, the total cost is the sum of the first element of each subarray. 
    The first subarray must always start at index `0`, so its cost is `nums[0]`. To minimize the total cost, we want the first elements of the second and 
    third subarrays to be as small as possible. Because subarrays are contiguous and non-overlapping, we can simply choose two different indices after index `0` to 
    start the remaining two subarrays. Therefore, the problem reduces to finding the two smallest elements in `nums[1...]` and adding them to `nums[0]`.

    ## Main Key Ideas
    - The cost of each subarray is its **first element**.
    - The first subarray always starts at index `0`, so we must include `nums[0]`.
    - We need two additional starting points for the other two subarrays.
    - To minimize total cost, we choose the **two smallest elements** from indices `1` to `n-1`.
    - The result is: `nums[0] + min1 + min2`, where `min1` and `min2` are the two smallest values in `nums[1...]`.

    # Complexity
    - Time complexity: $O(n)$, since we scan the array once to find the two smallest elements.
    - Space complexity: $O(1)$
*/

class Solution {
    func minimumCost(_ nums: [Int]) -> Int {
        var (min1, min2) = (Int.max, Int.max)
        for i in 1..<nums.count {
            if nums[i] < min1 {
                min2 = min1
                min1 = nums[i]
            } else if nums[i] < min2 {
                min2 = nums[i]
            }
        }
        return nums[0] + min1 + min2
    }
}
