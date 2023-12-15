//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/destination-city/solutions/4410104/swift-solution-with-explanation/

    Iterate through an array inserting into sources hash set source of path (source is path[0]). 
    Then iterate through an array again and check if our sources set doesn't have destination
    of a path (destination is path[1]), then it means this destination is not a source and we
    return that destination. It is guaranteed that we will have a solution.
*/

class Solution {
    func destCity(_ paths: [[String]]) -> String {
        var sources: Set<String> = []

        for path in paths {
            sources.insert(path[0])
        }

        for path in paths {
            if !sources.contains(path[1]) {
                return path[1]
            }
        }

        return ""
    }
}
