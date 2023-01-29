//
//  main.swift
//  LeetCode
//
//  Created by Nihad on 11/17/21.
//

import Foundation

class MyStack {

    private var queue: Queue

    init() {
        queue = Queue()
    }
    
    func push(_ x: Int) {
        let n = queue.count
        queue.enqueue(x)
        for i in 0..<n {
            queue.enqueue(queue.dequeue())
        }
    }

    func pop() -> Int {
        queue.dequeue()
    }
    
    func top() -> Int {
        return queue.peek()
    }
    
    func empty() -> Bool {
        return queue.isEmpty
    }
}

final class Queue {

    private var queue: [Int] = []

    var count: Int {
        queue.count
    }

    var isEmpty: Bool {
        return queue.isEmpty
    }

    func peek() -> Int {
        return queue[0]
    }

    func enqueue(_ element: Int) {
        queue.append(element)
    }

    func dequeue() -> Int {
        return queue.removeFirst()
    }
}
