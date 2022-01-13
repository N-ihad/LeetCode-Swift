//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var res = 0

        func BFS(_ mm: Int, _ nn: Int) {
            if mm == m && nn == n { res += 1; return }
            if mm == m { res += 1; return }
            if nn == n { res += 1; return }
            
            BFS(mm + 1, nn)
            BFS(mm, nn + 1)
        }
        BFS(1, 1)

        return res
    }
}
