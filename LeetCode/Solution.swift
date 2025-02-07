//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/find-the-number-of-distinct-colors-among-the-balls/solutions/6389804/swift-solution-2-hashmaps-by-nihad_s-yin8/

    The queryResults function processes a series of queries where each query assigns a color to a ball and
    keeps track of how many distinct colors are in use. It uses a dictionary hashMapBallToColor to map each
    ball to its assigned color and another dictionary hashMapColorToBalls to track sets of balls 
    associated with each color. If a ball was previously assigned a different color, 
    it is removed from the old color's set, and if the set becomes empty, the color is deleted from the dictionary.
    The ball is then assigned its new color, and the updated color count is recorded in the result array. 
    The function iterates through all queries, updating the mappings efficiently, and returns a list of the distinct color counts at each step
*/

class Solution {
    func queryResults(_ limit: Int, _ queries: [[Int]]) -> [Int] {
        var hashMapBallToColor: [Int: Int] = [:]
        var hashMapColorToBalls: [Int: Set<Int>] = [:]
        var result: [Int] = []
        result.reserveCapacity(queries.count)

        for query in queries {
            let (ball, color) = (query[0], query[1])

            if let oldColor = hashMapBallToColor[ball] {
                hashMapColorToBalls[oldColor]?.remove(ball)
                if hashMapColorToBalls[oldColor]?.isEmpty == true {
                    hashMapColorToBalls[oldColor] = nil
                }
            }

            hashMapBallToColor[ball] = color
            hashMapColorToBalls[color, default: []].insert(ball)

            result.append(hashMapColorToBalls.count)
        }

        return result
    }
}
