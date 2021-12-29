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

class LRUStack {
    var keys: [Int]
    var bottom: Int

    init() {
        keys = []
        bottom = -2
    }

    func push(_ key: Int) {
        keys.append(key)
    }
}

class LRUCache {

    let capacity: Int
    var elements: [LinkedList]
    private let lruStack: LRUStack
    private var numberOfKeys: Int

    init(_ capacity: Int) {
        self.capacity = capacity
        elements = []
        lruStack = LRUStack()
        numberOfKeys = 0

        for _ in 0..<capacity {
            elements.append(LinkedList())
        }
    }

    func get(_ key: Int) -> Int {
        let i = index(hash(key))

        if let element = elements[i].findNode(withKey: key) {
            updatePriorityList()
            return element.value
        } else {
            return -1
        }
    }

    func put(_ key: Int, _ value: Int) {
        let i = index(hash(key))

        if let element = elements[i].findNode(withKey: key) {
            element.value = value
            updatePriorityList()
        } else {
            if numberOfKeys > capacity {
                doTheMagic()
            } else {
                numberOfKeys += 1
                elements[i].insert(Node(key: key, value: value))
            }
        }
    }

    // Rearrange the list so that it satisfies LRU list
    private func updatePriorityList() {

    }

    // If number of keys exceeds the capacity replace LRU element by a new one
    private func doTheMagic() {
        updatePriorityList()
    }

    private func hash(_ key: Int) -> Int {
        return key
    }

    private func index(_ hash: Int) -> Int {
        return hash % capacity
    }
}
