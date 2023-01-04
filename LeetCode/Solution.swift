//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func minimumRounds(_ tasks: [Int]) -> Int {
        var hashMap: [Int: Int] = [:]
        var rounds = 0

        tasks.forEach {
            hashMap[$0] = hashMap[$0] != nil ? hashMap[$0]! + 1 : 1
        }

        for (_, numberOfTasks) in hashMap {
            if numberOfTasks == 1 { return -1 }
            rounds += Int(ceil(Double(numberOfTasks)/3))
        }

        return rounds
    }
}
