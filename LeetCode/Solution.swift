//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Node {
    var next: Node?
    var value: Int
    var key: Int

    init(key: Int, value: Int) {
        self.value = value
        self.key = key
    }
}

class LinkedList {
    var head: Node?
    var tail: Node?

    init() {
        head = nil
        tail = nil
    }

    init(head: Node) {
        self.head = head
        tail = head
    }

    func insert(_ node: Node) {
        if head == nil {
            head = node
            tail = head
        } else {
            tail?.next = node
            tail = node
        }
    }

    func findNode(withKey key: Int) -> Node? {
        var head = head
        while head != nil {
            if head!.key == key {
                return head
            }
            head = head?.next
        }
        return nil
    }
}

class LRUCache {

    let capacity: Int
    var elements: [LinkedList]

    init(_ capacity: Int) {
        self.capacity = capacity
        elements = []
        for _ in 0..<capacity {
            elements.append(LinkedList())
        }
    }

    func get(_ key: Int) -> Int {
        let i = index(hash(key))

        if let element = elements[i].findNode(withKey: key) {
            return element.value
        } else {
            return -1
        }
    }

    func put(_ key: Int, _ value: Int) {
        let i = index(hash(key))

        if let element = elements[i].findNode(withKey: key) {
            element.value = value
        } else {
            elements[i].insert(Node(key: key, value: value))
        }
    }

    func hash(_ key: Int) -> Int {
        return key
    }

    func index(_ hash: Int) -> Int {
        return hash % capacity
    }
}
