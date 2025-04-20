//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/rabbits-in-forest/solutions/6670739/swift-solution-with-explanation-beats-10-m0wv

    Solution calculates the minimum number of rabbits in a forest based on the answers given by n rabbits, where each 
    rabbit is asked how many rabbits have the same color as them. We use hash table hashMap to count the occurrences of 
    each unique answer in the answers array. For each unique answer (let's say key), the number of rabbits with that answer value is 
    used to determine how many groups of rabbits with that answer are needed. The _ceil function computes the ceiling of the division value / (key + 1), 
    ensuring that the number of rabbits in each group is accounted for correctly. It is based on formula:
    ⌈ answer+1frequencyOfAnswer⌉⋅(answer+1), where ⌈  ⌉ mean ceiling (rounding to the nearest bigger integer),
    frequencyOfAnswer is the number of occurences of certain answer and answer in the answer number itself, i. e.:
    [2,2,2], answer=2 and frequencyOfAnswer=3

    For example, if a rabbit says "2," this implies that there are at least 3 rabbits in that group, so the number of rabbits in the forest is 
    incremented by the necessary number of groups, each containing key + 1 rabbits. The solution then returns the total number of 
    rabbits required to meet all the given answers.
*/

class Solution {
    func numRabbits(_ answers: [Int]) -> Int {
        var rabitsCounter = 0
        var hashMap: [Int: Int] = [:]

        for answer in answers {
            hashMap[answer, default: 0] += 1
        }

        for (answer, frequency) in hashMap {
            rabitsCounter += _ceil(frequency, answer) * (answer + 1)
        }

        return rabitsCounter
    }

    @inline(__always)
    private func _ceil(_ frequency: Int, _ answer: Int) -> Int {
        Int(ceil(Double(frequency) / Double(answer + 1)))
    }
}
