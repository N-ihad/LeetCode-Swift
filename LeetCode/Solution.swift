//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {

    class Stack {
        var val: [[Character: Int]] = []

        var top: [Character: Int]? {
            val.last
        }

        func pop() {
            val.removeLast()
        }

        func add(_ pair: [Character: Int]) {
            val.append(pair)
        }

        func increment() {
            guard !val.isEmpty else { return }
            val[val.count-1][val[val.count-1].keys.first!]! += 1
        }
    }

    func removeDuplicates(_ s: String, _ k: Int) -> String {
        let stack = Stack()

        for c in s {
            if let top = stack.top, top.keys.first! == c {
                stack.increment()
            } else {
                stack.add([c: 1])
            }

            if let top = stack.top, top.values.first! == k {
                stack.pop()
            }
        }

        var result = ""
        stack.val.forEach { result.append(String(repeating: $0.keys.first!, count: $0.values.first!)) }
        return result
    }
}
