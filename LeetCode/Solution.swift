//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
        var velocities: [Double] = []
        velocities.reserveCapacity(speed.count)

        for i in 0..<speed.count {
            velocities.append(Double(dist[i]) / Double(speed[i]))
        }

        velocities.sort()

        var maxNumberOfMonstersCanBiKilled = 1
        
        for i in 1..<dist.count {
            if velocities[i] - Double(i) <= 0 {
                break
            }

            maxNumberOfMonstersCanBiKilled += 1
        }

        return maxNumberOfMonstersCanBiKilled
    }
}
