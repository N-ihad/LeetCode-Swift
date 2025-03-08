//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/minimum-recolors-to-get-k-consecutive-black-blocks/solutions/6514972/swift-solution-on-sliding-window-by-niha-goes/

    Solution finds the minimum number of recoloring operations needed to get k consecutive black blocks using a sliding window approach. 
    It first converts the input string into an array for easy indexing (because of strings and indexing them in Swift duh). 
    l is the left edge of the window and r is the right edge of the window. We initialize a sliding window of size k and 
    counts the number of white "W" blocks in this window. It's essentially the current number of recoloring operations needed for
    window (of length k) to satisfy k. The initial count of white blocks is stored in whites, and result is set to k as the worst case. 
    As the window slides across the string, the algorithm removes the leftmost block from the count (whites -= 1 if it was "W") and 
    adds the new rightmost block (whites += 1 if it is "W"). The result is updated with the minimum number of recolors required at each step.
*/

class Solution {
    func minimumRecolors(_ blocks: String, _ k: Int) -> Int {
        let blocks = Array(blocks)
        var result = k
        var (l, r) = (0, k - 1)
        var whites = 0

        for i in 0...r where blocks[i] == "W" {
            whites += 1
        }

        result = min(result, whites)

        while r < blocks.count && r + 1 < blocks.count {
            if blocks[l] == "W" {
                whites -= 1
            }

            if blocks[r+1] == "W" {
                whites += 1
            }

            result = min(result, whites)
            (l, r) = (l + 1, r + 1)
        }

        return result        
    }
}

/*
https://leetcode.com/problems/minimum-recolors-to-get-k-consecutive-black-blocks/solutions/6515010/swift-solution-onk-by-nihad_s-96s0/

Solution uses a brute-force sliding window approach to determine the minimum number of recoloring operations required to obtain k consecutive 
black blocks. It first converts the input string into an array for easy indexing (because of strings and indexing them in Swift duh) and initializes 
min to the total number of blocks as the worst case. The algorithm then iterates over all possible contiguous subarrays of length k within blocks. 
For each window, it counts the number of white "W" blocks using a nested loop. If the count of white blocks in the current window is lower than min, 
it updates min. After checking all possible windows, the function returns the smallest count found.

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
*/
