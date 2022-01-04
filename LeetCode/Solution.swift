//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Vertex: Hashable {

    var id: Int
    var adjacentVertices: [Vertex]

    init(_ id: Int, pointsToVertex vertex: Vertex? = nil) {
        self.id = id
        adjacentVertices = []
    }

    static func == (lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var hashMap: [Vertex: Bool] = [:]
        let vertices = (0..<numCourses).map { vertex -> Vertex in
            let vertex = Vertex(vertex)
            hashMap[vertex] = false
            return vertex
        }

        for i in 0..<prerequisites.count {
            vertices[prerequisites[i][0]].adjacentVertices.append(vertices[prerequisites[i][1]])
        }



        return true
    }
}
