//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Node {
    let key: Int
    var value: Int

    var prev: Node?
    var next: Node?

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

    func insert(_ node: Node) {
        if head == nil {
            head = node
        } else if tail == nil {
            node.prev = head
            head!.next = node
            tail = node
        } else {
            tail!.next = node
            node.prev = tail
            tail = node
        }
    }

    func updateList(withNode node: Node) {
        if node.prev == nil {
            tail?.next = node
            head = head?.next
            head?.prev = nil
            node.next = nil
            node.prev = tail
            tail = node
        } else {
            tail!.next = node
            node.prev?.next = node.next
            node.next?.prev = node.prev
            node.next = nil
            node.prev = tail
            tail = node
        }
    }

    func updateListWithOnlyOneNode(_ node: Node) {
        head = node
    }
}


class LRUCache {
    private let capacity: Int
    let list = LinkedList()
    private var listHashMap: [Int: Node] = [:]

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    @discardableResult
    func get(_ key: Int) -> Int {
        if listHashMap.count == 0 ||
           listHashMap.count == 1 ||
           listHashMap[key] == nil  {
            return listHashMap[key]?.value ?? -1
        }

        if let node = listHashMap[key] {

            if node.next == nil { return node.value }

            list.updateList(withNode: node)
            return node.value
        }

        return -999
    }

    func put(_ key: Int, _ value: Int) {
        if capacity == 1,
           listHashMap.count == 1 {
            let node = Node(key: key, value: value)
            listHashMap[list.head!.key] = nil
            listHashMap[node.key] = node
            list.updateListWithOnlyOneNode(node)
            return
        }

        if listHashMap.count < capacity,
           let node = listHashMap[key] {
            node.value = value
            if node.next == nil { return }
            list.updateList(withNode: node)
            return
        }

        if listHashMap.count >= capacity,
           let node = listHashMap[key] {
            node.value = value
            if node.next == nil { return }
            list.updateList(withNode: node)
            return
        }

        if listHashMap.count >= capacity,
           listHashMap[key] == nil {
            let node = Node(key: key, value: value)
            listHashMap[list.head!.key] = nil
            listHashMap[key] = node
            list.updateList(withNode: node)
            return
        }

        if listHashMap.count < capacity {
            let node = Node(key: key, value: value)
            listHashMap[key] = node
            list.insert(node)
            return
        }
    }
}
