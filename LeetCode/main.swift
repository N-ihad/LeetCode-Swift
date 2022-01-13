//
//  main.swift
//  LeetCode
//
//  Created by Nihad on 11/17/21.
//

import Foundation

class MinStack {
    var min = Int.max
    var stack: [Int] = []

    init() {}

    func push(_ val: Int) {
        min = val < min ? val : min
        stack.append(val)
    }

    func pop() {
        stack.removeLast()
        min = stack.isEmpty ? Int.max : stack.min()!
    }

    func top() -> Int {
        return stack.last!
    }

    func getMin() -> Int {
        return min
    }
}
