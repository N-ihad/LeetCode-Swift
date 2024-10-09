//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    Using 2 pointers left: `L` and right: `R` we can calculate current running sum in a following way: if our `sum`
    is greater than or equal to given `target` then it means we have found **possible** solution (not the only one), 
    we then proceed to remove elements from left side and see if we can reduce our count, which can be calculates as `R - L + 1`. 
    We remove elements from left side of our window because there's no point in removing elements from right side of window since
    we need to move forward, besides we already took into account new elements from the right side, 
    so what's left is to see what's gonna happen if we remove 1 element by 1 from the left side of the window. 
    Once we reached the point where our `sum` is less than `target`, we proceed further iterating to the right with `R`. 
    In the end we just compare if our `result` was modified at all, if not, we return `0` since no solution was found,
    otherwise we return the `result`.
*/

class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var result = Int.max
        var sum = 0
        var L = 0

        for R in 0..<nums.count {
            sum += nums[R]

            while sum >= target {
                result = min(result, R - L + 1)
                sum -= nums[L]
                L += 1
            }
        }

        return result == Int.max ? 0 : result
    }
}
