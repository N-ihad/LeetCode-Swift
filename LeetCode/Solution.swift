//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func countSubTrees(_ n: Int, _ edges: [[Int]], _ labels: String) -> [Int] {
        let labels = Array(labels)
        var adjacencyList: [[Int]] = Array(repeating: [], count: n)

        for edge in edges {
            adjacencyList[edge[0]].append(edge[1])
            adjacencyList[edge[1]].append(edge[0])
        }

        var result = Array(repeating: 0, count: n)
        dfs(adjacencyList, labels, 0, -1, &result)

        return result
    }

    @discardableResult
    private func dfs(_ adjacencyList: [[Int]], _ labels: [Character], _ current: Int, _ parent: Int, _ result: inout [Int]) -> [Int] {
        var nodeCounts = Array(repeating: 0, count: 26)
        nodeCounts[Int(labels[current].asciiValue!) - 97] = 1

        for vertex in adjacencyList[current] {
            if vertex == parent { continue }

            let childCounts = dfs(adjacencyList, labels, vertex, current, &result)
            for i in 0..<26 {
                nodeCounts[i] += childCounts[i]
            }
        }

        result[current] = nodeCounts[Int(labels[current].asciiValue!) - 97]
        return nodeCounts
    }
}
