//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/find-minimum-operations-to-make-all-elements-divisible-by-three/solutions/7368136/swift-solution-by-nihad_s-qo6n

    To make any integer divisible by 3, we only need to adjust it by at most 1: if the remainder when divided by 3 is 1, 
    subtract 1; if it is 2, add 1; if it is 0, do nothing. Since every non-multiple of 3 requires exactly one operation (adjusting by 2 in 
    one direction is always worse than adjusting by 1 in the other), the minimum number of operations is simply the count of elements whose remainder modulo 3 is not 0. 

    For example, with input [1,2,3,4,0]: 
    step 1, check 1 % 3 = 1 (needs 1 op: subtract 1 to 0)
    step 2, 2 % 3 = 2 (needs 1 op: add 1 to 3)
    step 3, 3 % 3 = 0 (nothing to be done, already divisible by 3)
    step 4, 4 % 3 = 1 (needs 1 op: subtract 1 to 3)
    step 5, 0 % 3 = 0 (nothing to be done, 0 is divisible by any number)

    total operations = 3.
*/

class Solution {
    func minimumOperations(_ nums: [Int]) -> Int {
        var result = 0
        for i in 0..<nums.count {
            if nums[i] % 3 == 0 { continue }
            result += 1
        }
        return result
    }
}
