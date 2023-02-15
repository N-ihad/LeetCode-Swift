//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var (L, R) = (0, numbers.count-1)
        
        while L < R {
            let sum = numbers[L] + numbers[R]

            if sum == target {
                return [L+1, R+1]
            }

            if sum > target {
                R -= 1
            } else {
                L += 1
            }
        }

        return []
    }
}
