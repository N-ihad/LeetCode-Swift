//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        if n == 1 {
            return [0]
        }

        var n = n
        var graph: [Int: Set<Int>] = [:]

        for edge in edges {
            graph[edge[0], default: []].insert(edge[1])
            graph[edge[1], default: []].insert(edge[0])
        }

        var leaves: [Int] = []

        for (node, neighbors) in graph where neighbors.count == 1 {
            leaves.append(node)
        }

        while n > 2 {
            var newLeaves: [Int] = []

            for leaf in leaves {
                if let neighbor = graph[leaf]?.first {
                    graph[neighbor]?.remove(leaf)
                    if graph[neighbor]?.count == 1 {
                        newLeaves.append(neighbor)
                    }
                }
            }

            n -= leaves.count
            leaves = newLeaves
        }

        return leaves
    }

    // BFS solution but Time Limit Exceeded, perhaps needs some optimization
    // func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {

    //     var graph: [Int: Set<Int>] = [:]

    //     for node in 0..<n {
    //         graph[node] = []
    //     }

    //     for edge in edges {
    //         graph[edge[0]]!.insert(edge[1])
    //         graph[edge[1]]!.insert(edge[0])
    //     }

    //     while graph.count > 2 {
    //         for (parent, children) in graph where children.count == 1 {
    //             for child in children {
    //                 graph[child]!.remove(parent)
    //             }
    //             graph[parent] = nil
    //         }
    //     }
        
    //     return Array(graph.keys)
    // }

    // func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
    //     var graph: [Int: Set<Int>] = [:]

    //     for i in 0..<n {
    //         graph[i] = []
    //     }

    //     for edge in edges {
    //         graph[edge[0]]!.insert(edge[1])
    //         graph[edge[1]]!.insert(edge[0])
    //     }

    //     var result: [Int] = []
    //     var minimumHeight = n
    //     for i in 0..<n {
    //         var visited: Set<Int> = []
    //         var height = -1
    //         let queue = Queue(i) // Definition of Queue is below
    //         visited.insert(i)
    //         while !queue.isEmpty {
    //             for i in 0..<queue.count {
    //                 let node = queue.dequeue()

    //                 for child in graph[node]! where !visited.contains(child) {
    //                     visited.insert(child)
    //                     queue.enqueue(child)
    //                 }
    //             }

    //             height += 1
    //         }

    //         if height < minimumHeight {
    //             result = [i]
    //             minimumHeight = height
    //         } else if height == minimumHeight {
    //             result.append(i)
    //         }
    //     }

    //     return result
    // }
}

class Queue<T> {

    class Node<T> {
        var val: T
        var next: Node?

        init(_ val: T) {
            self.val = val
        }
    }

    var head: Node<T>?
    var tail: Node<T>?

    var last: T? {
        tail?.val
    }

    var count = 0

    var isEmpty: Bool {
        head == nil
    }

    init() {

    }

    init(_ startingElement: T) {
        let node = Node(startingElement)
        head = node
        tail = node
        count += 1
    }

    func enqueue(_ element: T) {
        count += 1
        let node = Node(element)
        if head == nil {
            head = node
        } else {
            tail!.next = node
        }
        tail = node
    }

    func dequeue() -> T {
        count -= 1
        if head!.next == nil {
            let val = head!.val
            head = nil
            tail = nil
            return val
        } else {
            let newHead = head!.next
            head!.next = nil
            let val = head!.val
            head = newHead
            return val
        }
    }
}
