//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/walking-robot-simulation-ii/solutions/7807968/swift-solution-with-explanation-by-nihad-paht
*/

class Robot {
    private enum Direction: Int {
        case east = 0, north, west, south

        var name: String {
            switch self {
            case .east:  return "East"
            case .north: return "North"
            case .west:  return "West"
            case .south: return "South"
            }
        }

        mutating func turnLeft() {
            self = Direction(rawValue: (rawValue + 1) % 4)!
        }
    }

    private let width: Int
    private let height: Int
    private let perimeter: Int

    private var (x, y) = (0, 0)
    private var direction = Direction.east

    init(_ width: Int, _ height: Int) {
        self.width = width
        self.height = height
        self.perimeter = 2 * (width + height) - 4
    }

    func step(_ num: Int) {
        var steps = num % perimeter
        if steps == 0 {
            steps = perimeter
        }

        while steps > 0 {
            let moved: Int

            switch direction {
            case .east:
                moved = min(steps, width - 1 - x)
                x += moved
            case .north:
                moved = min(steps, height - 1 - y)
                y += moved
            case .west:
                moved = min(steps, x)
                x -= moved
            case .south:
                moved = min(steps, y)
                y -= moved
            }

            steps -= moved

            // If we hit a boundary and still have steps left, turn left (counter-clockwise)
            if steps > 0 {
                direction.turnLeft()
            }
        }
    }

    func getPos() -> [Int] {
        [x, y]
    }

    func getDir() -> String {
        direction.name
    }
}
