//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Node {
    var next: Node?
    var value: Triplet

    init(value: Triplet) {
        self.value = value
    }
}

class LinkedList {
    var head: Node
    var tail: Node

    init(head: Node) {
        self.head = head
        tail = head
    }

    func insert(_ node: Node) {
        tail.next = node
        tail = node
    }
}

class Triplet {
    let key: Int
    var value: Int
    var usedCount: Int

    init() {
        key = -2
        value = -2
        usedCount = 0
    }

    init(key: Int, value: Int) {
        self.key = key
        self.value = value
        usedCount = 0
    }
}

class LRUCache {

    let capacity: Int
    var elements: [Triplet?]
    var minUsedKey: Int
    var minUsedTimes: Int

    init(_ capacity: Int) {
        self.capacity = capacity
        elements = Array<Triplet?>(repeating: nil, count: capacity)
        minUsedKey = -2
        minUsedTimes = -2
    }

    func get(_ key: Int) -> Int {
        let i = index(hash(key))

        if let element = elements[i] {
            element.usedCount += 1
            
            return element.value
        } else {
            return -1
        }
    }

    func put(_ key: Int, _ value: Int) {
        let i = index(hash(key))

        if let element = elements[i] {
            element.value = value
        } else {
            elements[i] = Triplet(key: key, value: value)
        }
    }

    func hash(_ key: Int) -> Int {
        return key
    }

    func index(_ hash: Int) -> Int {
        return hash % capacity
    }
}
