//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var graph: [Int: Set<Int>] = [:]
        var inDegree = Array(repeating: 0, count: numCourses)

        for course in 0..<numCourses {
            graph[course] = []
        }

        for prerequisite in prerequisites {
            graph[prerequisite[1]]!.insert(prerequisite[0])
        }

        for i in 0..<numCourses {
            for course in graph[i]! {
                inDegree[course] += 1
            }
        }

        var queue = Queue<Int>() // Definition of Queue type is below
        for course in 0..<numCourses where inDegree[course] == 0 {
            queue.enqueue(course)
        }

        var order: [Int] = []
        order.reserveCapacity(numCourses)
        while !queue.isEmpty {
            let course = queue.dequeue()
            order.append(course)
            for child in graph[course]! {
                inDegree[child] -= 1
                if inDegree[child] == 0 {
                    queue.enqueue(child)
                }
            }
        }

        if order.count != numCourses {
            return []
        }

        return order
    }
}

class Node<T> {

    var val: T
    var next: Node?

    init(_ val: T) {
        self.val = val
    }
}

class Queue<T> {

    var head: Node<T>?
    var tail: Node<T>?

    var isEmpty: Bool {
        head == nil
    }

    init() {

    }

    init(_ startingElement: T) {
        let node = Node(startingElement)
        head = node
        tail = node
    }

    func enqueue(_ element: T) {
        let node = Node(element)
        if head == nil {
            head = node
        } else {
            tail!.next = node
        }
        tail = node
    }

    func dequeue() -> T {
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

// MARK: - DFS solution
/*
class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var graph: [Int: Set<Int>] = [:]
        var result: [Int] = []
        var i = numCourses - 1

        for course in 0..<numCourses {
            graph[course] = []
            result.append(0)
        }

        for prerequisite in prerequisites {
            graph[prerequisite[1]]!.insert(prerequisite[0])
        }

        var visited: Set<Int> = []
        for course in 0..<numCourses {
            if visited.contains(course) {
                continue
            }

            var path: [Int] = []
            var visiting: Set<Int> = []

            if !dfs(course, graph, &path, &visiting, &visited) {
                return []
            }

            for node in path {
                result[i] = node
                i -= 1
            }
        }

        return result
    }

    private func dfs(_ node: Int, _ graph: [Int: Set<Int>], _ path: inout [Int], _ visiting: inout Set<Int>, _ visited: inout Set<Int>) -> Bool {

        if visiting.contains(node) {
            return false
        }

        if visited.contains(node) {
            return true
        }

        visited.insert(node)
        visiting.insert(node)

        for child in graph[node]! {
            if !dfs(child, graph, &path, &visiting, &visited) {
                return false
            } else {
                visiting.remove(child)
            }
        }

        path.append(node)
        return true
    }
}
*/
