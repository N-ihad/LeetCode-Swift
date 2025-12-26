//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/minimum-penalty-for-a-shop/solutions/7441832/swift-solution-with-explanation-by-nihad-uazz

    Solution models the penalty dynamically by simulating the shop’s closing time hour by hour in a single pass. 
    First, it initializes the penalty as the number of 'Y' characters in the string, which represents the penalty if 
    the shop closes at hour 0 (all customer visits happen while the shop is closed). Then, as it iterates through each hour, 
    it treats the current index as a potential closing time and updates the minimum penalty seen so far. 
    Moving the closing time one hour later has a simple effect: if the current hour has a customer ('Y'), 
    the penalty decreases by 1 because that customer is now served; if there is no customer ('N'), 
    the penalty increases by 1 because the shop is open with no customers. 
    By updating the penalty incrementally and always keeping the earliest index that achieves the 
    minimum penalty we find the optimal closing time.

    Time complexity: O(n)
    Space complexity: O(1)
*/

class Solution {
    func bestClosingTime(_ customers: String) -> Int {
        var penalty = 0
        for customer in customers {
            if customer == "Y" {
                penalty += 1
            }
        }

        var minPenalty = penalty
        var (i, result) = (0, 0)
        for customer in customers {
            if penalty < minPenalty {
                minPenalty = penalty
                result = i
            }

            if customer == "Y" {
                penalty -= 1
            } else {
                penalty += 1
            }

            i += 1
        }

        return penalty < minPenalty ? i : result
    }
}
