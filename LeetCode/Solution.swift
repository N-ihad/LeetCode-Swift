//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        func BFS(_ mm: Int, _ nn: Int) -> Int {
            if mm == m && nn == n { return 1 }
            if mm == m { return 1 }
            if nn == n { return 1 }

            return BFS(mm + 1, nn) + BFS(mm, nn + 1)
        }

        return BFS(1, 1)
    }
}
