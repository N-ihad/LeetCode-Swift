//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/construct-the-minimum-bitwise-array-ii/solutions/7513890/swift-solution-with-explanation-by-nihad-kskd

    # Approach
    For each prime number `p = nums[i]`, we want to find the **smallest** integer `x` such that `x OR (x + 1) = p`. 
    By analyzing how bitwise OR behaves between a number and its successor, we can derive `x` directly from the binary representation of `p`. 
    If no such `x` exists, we return `-1`.

    ## Main Key Ideas
    - If `p = 2`, it is impossible to satisfy the condition, so the answer is `-1`.
    - If `p + 1` is a power of two, then `p` has the form `111...111` in binary:
      - In this case, the smallest valid `x` is simply `p >> 1`.
    - Otherwise, we manipulate bits of `p` to construct the minimum valid `x`:
      - We locate the rightmost `0` bit **before** the trailing `1`s.
      - We unset that bit to ensure `x OR (x + 1)` recreates `p`.
    - Each element is processed independently, so the logic applies per number.

    ### Important lines
    - `let trailingOnesCount = (~p).trailingZeroBitCount`  
      - We invert `p` so that trailing `1`s in `p` become trailing `0`s.
      - `trailingZeroBitCount` then tells us how many consecutive `1`s `p` has at the end.
    
    - `let bitToUnset = trailingOnesCount - 1`  
      - The bit we need to unset is the `0` bit **just before** the trailing `1`s.
      - Subtracting 1 moves us to that exact bit position.
    
    - `let mask = ~(1 << bitToUnset)`  
      - We create a mask that has `0` at `bitToUnset` and `1`s everywhere else.
      - This mask will clear exactly one bit.
    
    - `let x = p & mask`  
      - Applying the mask unsets the chosen bit in `p`.
      - The resulting `x` is the smallest number such that `x OR (x + 1) = p`.
    
    # Complexity
    - Time complexity: $O(n)$, since each number is processed in constant time.
    - Space complexity: $O(1)$, as only a few variables are used per element (excluding the output array).
*/

class Solution {
    func minBitwiseArray(_ nums: [Int]) -> [Int] {
        var result: [Int] = []

        for p in nums {
            if p == 2 {
                result.append(-1)
                continue
            }

            if isPowerOfTwo(p + 1) {
                result.append(p >> 1)
                continue
            }

            let trailingOnesCount = (~p).trailingZeroBitCount
            let bitToUnset = trailingOnesCount - 1
            let mask = ~(1 << bitToUnset)
            let x = p & mask

            result.append(x)
        }

        return result
    }

    private func isPowerOfTwo(_ num: Int) -> Bool {
        num > 0 && (num & (num - 1)) == 0
    }
}
