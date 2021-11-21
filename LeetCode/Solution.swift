//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var counter = 0

        for char in s.reversed() {
            if char != " " {
                counter += 1
            }

            if char == " " && counter > 0 {
                return counter
            }
        }

        return counter
    }
}

// MARK: - C++ solution
/*
int lengthOfLastWord(string s) {
    int R = (int)s.size() - 1;
    int counter = 0;

    while (R >= 0) {
        if (s[R] == ' ') {
            --R;
            continue;
        }

        while (R >= 0 && s[R] != ' ') {
            ++counter;
            --R;
        }

        return counter;
    }

    return counter;
}
*/
