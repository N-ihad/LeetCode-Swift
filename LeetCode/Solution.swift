//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {
        var _min: (node: Int, count: Int) = (Int.max, Int.max)
        var node1DfsDistances: [Int: Int] = Dictionary(minimumCapacity: edges.count + 1)
        var node2DfsDistances: [Int: Int] = Dictionary(minimumCapacity: edges.count + 1)
        var (curr, count) = (node1, 0)
        
        while curr != -1 && node1DfsDistances[curr] == nil {
            node1DfsDistances[curr] = count
            curr = edges[curr]
            count += 1
        }

        (curr, count) = (node2, 0)
        while curr != -1 && node2DfsDistances[curr] == nil {
            node2DfsDistances[curr] = count
            curr = edges[curr]
            count += 1
        }

        for node in node1DfsDistances.keys {
            if node2DfsDistances[node] != nil {
                if max(node1DfsDistances[node]!, node2DfsDistances[node]!) == _min.count {
                    _min.node = min(_min.node, node)
                    _min.count = max(node1DfsDistances[node]!, node2DfsDistances[node]!)
                } else if max(node1DfsDistances[node]!, node2DfsDistances[node]!) < _min.count {
                    _min.node = node
                    _min.count = max(node1DfsDistances[node]!, node2DfsDistances[node]!)
                }
            }
        }

        return _min.node == Int.max ? -1 : _min.node
    }
}
