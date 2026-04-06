//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/walking-robot-simulation/solutions/7794996/swift-solution-with-explanation-by-nihad-nb0u
*/

class Solution {
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        var (x, y) = (0, 0)
        var facing = Direction.north
        var maxDistSq = 0

        let obstacles: Set<[Int]> = Set(obstacles)

        for command in commands {
            switch command {
            case -2:
                facing.turnLeft()
            case -1:
                facing.turnRight()
            default:
                let (dx, dy) = (facing.dx, facing.dy)

                for _ in 1...command {
                    let (nextX, nextY) = (x + dx, y + dy)

                    if obstacles.contains([nextX, nextY]) {
                        break
                    }

                    (x, y) = (nextX, nextY)

                    let distSq = x * x + y * y
                    if distSq > maxDistSq {
                        maxDistSq = distSq
                    }
                }
            }
        }

        return maxDistSq
    }

    private enum Direction {
        case north, east, south, west

        mutating func turnLeft() {
            switch self {
            case .north: self = .west
            case .east:  self = .north
            case .south: self = .east
            case .west:  self = .south
            }
        }

        mutating func turnRight() {
            switch self {
            case .north: self = .east
            case .east:  self = .south
            case .south: self = .west
            case .west:  self = .north
            }
        }

        var dx: Int {
            switch self {
            case .north, .south: return 0
            case .east: return 1
            case .west: return -1
            }
        }

        var dy: Int {
            switch self {
            case .north: return 1
            case .south: return -1
            case .east, .west: return 0
            }
        }
    }
}
