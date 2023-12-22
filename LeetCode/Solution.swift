//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/maximum-score-after-splitting-a-string/solutions/4441278/swift-solution-with-explanation/

    Iterate through an array, first time to count 1s, second time to find the best score while keeping track of 0s as well.
    If we encounter 1 we would just decrement our onesCount variable by one (since it is the quantity we are left with on the right side),
    if we encounter 0 we would just increment our zerosCount variable (since it is the quantity we have so far), 
    and then calculate maxScore as: maxScore = max(maxScore, zerosCount + onesCount), 
    where zerosCount is count of zeros we have on the left side and onesCount is count of ones we
    have on the right side on each iteration. At the end just return maxScore result.
*/

class Solution {
    func maxScore(_ s: String) -> Int {
        var (onesCount, zerosCount) = (0, 0)
        var maxScore = 0

        for c in s where c == "1" {
            onesCount += 1
        }

        var i = s.startIndex
        while i < s.index(before: s.endIndex) {

            if s[i] == "0" {
                zerosCount += 1
            } else {
                onesCount -= 1
            }

            maxScore = max(maxScore, zerosCount + onesCount)
            i = s.index(after: i)
        }

        return maxScore
    }
}

