//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func numberOfMatches(_ n: Int) -> Int {
        n-1
    }
}

/*
// MARK: - Iterative solution via simulation
class Solution {
    func numberOfMatches(_ n: Int) -> Int {
        var matches = 0
        var teams = n
        
        while teams != 1 {
            matches += teams / 2
            teams = Int(ceil(Double(teams) / 2))
        }
        
        return matches
    }
}
*/
