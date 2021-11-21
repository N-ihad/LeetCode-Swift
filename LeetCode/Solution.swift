//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

extension String {
    subscript(_ index: Int) -> Self {
        return String(self[self.index(startIndex, offsetBy: index)])
    }
}

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var R = s.count - 1
        var counter = 0

        while R >= 0 {
            if s[R] == " " {
                R -= 1
                continue
            }

            while R >= 0 && s[R] != " " {
                counter += 1
                R -= 1
            }

            return counter
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
