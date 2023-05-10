//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var prereqMap: [Int: Set<Int>] = [:]

        for prereq in prerequisites {
            prereqMap[prereq[0], default: []].insert(prereq[1])
        }

        var visited: Set<Int> = []
        for course in 0..<numCourses {
            if !canFinish(fromCourse: course, &visited, &prereqMap) {
                return false
            }
        }

        return true
    }

    private func canFinish(fromCourse course: Int, _ visited: inout Set<Int>, _ prereqMap: inout [Int: Set<Int>]) -> Bool {
        if visited.contains(course) {
            return false
        }

        visited.insert(course)

        guard let courses = prereqMap[course] else {
            visited.remove(course)
            prereqMap.removeValue(forKey: course)
            return true
        }

        for course in courses {
            if !canFinish(fromCourse: course, &visited, &prereqMap) {
                return false
            }
        }

        visited.remove(course)
        prereqMap.removeValue(forKey: course)
        return true
    }
}
