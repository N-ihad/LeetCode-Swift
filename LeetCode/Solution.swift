//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func minimumRecolors(_ blocks: String, _ k: Int) -> Int {
        let blocks = Array(blocks)
        var min = blocks.count

        for i in 0...blocks.count - k {
            var counter = 0

            for j in 0..<k where blocks[i + j] == "W" {
                counter += 1
            }

            if counter < min {
                min = counter
            }
        }

        return min
    }
}
