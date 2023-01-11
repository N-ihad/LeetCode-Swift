//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
        var adjacencyList: [[Int]] = Array(repeating: [], count: n)
        
        for edge in edges {
            let currentNode = edge[0]
            let neighbour = edge[1]
            
            adjacencyList[currentNode].append(neighbour)
            adjacencyList[neighbour].append(currentNode)
        }
        
        return dfs(adjacencyList, hasApple, 0, -1)
    }
    
    private func dfs(_ adjacencyList: [[Int]], _ hasApple: [Bool], _ currentNode: Int, _ parentNode: Int) -> Int {
        var time = 0
        
        for child in adjacencyList[currentNode] {
            if child == parentNode { continue }
            
            let childTime = dfs(adjacencyList, hasApple, child, currentNode)
            
            if childTime != 0 || hasApple[child] {
                time += 2 + childTime
            }
        }
        return time
    }
}
