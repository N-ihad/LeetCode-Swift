//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/decode-the-slanted-ciphertext/solutions/7780811/swift-solution-constant-space-with-expla-7yjo

    Matrix simulation solution:
    https://leetcode.com/problems/decode-the-slanted-ciphertext/solutions/7780562/swift-solution-using-matrix-simulation-w-yq3z
*/

class Solution {
    func decodeCiphertext(_ encodedText: String, _ rows: Int) -> String {
        let encodedText = Array(encodedText)
        let cols = encodedText.count / rows

        var result: [Character] = []
        for j in 0..<cols {
            for i in 0..<rows {
                if (i + j) < cols {
                    result.append(encodedText[i*cols+j+i])
                }
            }
        }

        while !result.isEmpty && result[result.count-1] == " " {
            result.removeLast()
        }

        return String(result)
    }
}
