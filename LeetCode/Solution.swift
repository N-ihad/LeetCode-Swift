//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func trap(_ height: [Int]) -> Int {
        var maxL = height[0]
        var maxR = height[height.count-1]
        var L = 0
        var R = height.count-1
        var res = 0

        while L != R {
            while maxL <= maxR && L != R {
                res = maxL - height[L] > 0 ? res + maxL - height[L] : res
                if height[L] > maxL {
                    maxL = height[L]
                    break
                } else {
                    L += 1
                }
            }
            while maxR <= maxL && L != R {
                res = maxR - height[R] > 0 ? res + maxR - height[R] : res
                if height[R] > maxR {
                    maxR = height[R]
                    break
                } else {
                    R -= 1
                }
            }
        }

        return res
    }
}
