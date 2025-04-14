//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/count-good-triplets/solutions/6651316/swift-solution-on3-by-nihad_s-3q6l/

    Solution uses a brute-force triple-nested loop to iterate over all possible triplets (i, j, k) such 
    that 0 <= i < j < k < arr.count. For each triplet, it checks the three given conditions: |arr[i] - arr[j]| <= a, 
    |arr[j] - arr[k]| <= b, and |arr[i] - arr[k]| <= c. For i we start from 0, since it's first element of triplet, 
    for j we start from i+1 since we shouldn't violate i < j constraint and for k we start from j+1 since we shouldn't violate j < k constraint. 
    If all conditions are satisfied, it increments the result counter. The final result is returned after checking all valid triplet combinations.
*/

class Solution {
    func countGoodTriplets(_ arr: [Int], _ a: Int, _ b: Int, _ c: Int) -> Int {
        var result = 0

        for i in 0..<arr.count {
            for j in i+1..<arr.count {
                for k in j+1..<arr.count {
                    if abs(arr[i] - arr[j]) <= a && abs(arr[j] - arr[k]) <= b && abs(arr[i] - arr[k]) <= c {
                        result += 1
                    }
                }
            }
        }

        return result
    }
}
