//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func calculate(_ s: String) -> Int {
        var operandsStack: [Int] = []
        var operatorsStack: [Character] = []
        var num = 0
        var sign = 1

        for c in s where c != " " {
            if c.isNumber {
                num = num * 10 + c.wholeNumberValue!
            } else {
                num = num * sign

                if operatorsStack.last == "*" {
                    operatorsStack.removeLast()
                    operandsStack.append(operandsStack.removeLast() * num)
                } else if operatorsStack.last == "/" {
                    operatorsStack.removeLast()
                    operandsStack.append(operandsStack.removeLast() / num)
                } else {
                    operandsStack.append(num)
                }

                sign = c == "-" ? -1 : 1

                operatorsStack.append(c)
                num = 0
            }
        }
        
        operandsStack.append(num * sign)

        while !operatorsStack.isEmpty {
            let op = operatorsStack.removeLast()
            let (num2, num1) = (operandsStack.removeLast(), operandsStack.removeLast())

            if op == "*" {
                operandsStack.append(num1 * num2)
            } else if op == "/" {
                operandsStack.append(num1 / num2)
            } else {
                operandsStack.append(num1 + num2)
            }
        }

        return operandsStack.last!
    }
}
