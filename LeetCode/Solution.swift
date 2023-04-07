//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack: [Int] = []

        for i in 0..<tokens.count {
            if let num = Int(tokens[i]) {
                stack.append(num)
            } else {
                let (num2, num1) = (stack.removeLast(), stack.removeLast())
                let operation = tokens[i]
                let newNum = calculate(operation, num1, num2)
                stack.append(newNum)
            }
        }

        return stack[0]
    }

    @inline(__always)
    private func calculate(_ operation: String, _ num1: Int, _ num2: Int) -> Int {
        switch operation {
        case "+":
            return num1 + num2
        case "-":
            return num1 - num2
        case "*":
            return num1 * num2
        case "/":
            return num1 / num2
        default:
            fatalError("unexpected character encountered")
        }
    }
}
