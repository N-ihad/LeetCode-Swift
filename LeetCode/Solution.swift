//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

extension String {
    var isPalindrome: Bool {
        var (i, j, str) = (0, count - 1, Array(self))
        while i <= j {
            if str[i] != str[j] { return false }
            i += 1
            j -= 1
        }
        return true
    }
}

class Solution {
    func partition(_ s: String) -> [[String]] {
        var paths = [[String]](), path = [String](), s = Array(s)
        dfs(&paths, &path, &s, 0)
        return paths
    }

    private func dfs(_ paths: inout [[String]], _ path: inout [String], _ s: inout [Character], _ index: Int) {
        if index == s.count {
            paths.append(path)
            return
        }

        for i in index..<s.count {
            let substr = String(s[index...i])

            if substr.isPalindrome {
                path.append(substr)
                dfs(&paths, &path, &s, i + 1)
                path.removeLast()
            }
        }
    }
}
