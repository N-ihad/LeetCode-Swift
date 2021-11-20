//
//  main.swift
//  LeetCode
//
//  Created by Nihad on 11/17/21.
//

import Foundation

extension String {
    subscript(_ index: Int) -> Self {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }

    subscript(from a: Int, to b: Int) -> Self {
        return substring(with: self.index(self.startIndex, offsetBy: a)..<self.index(self.startIndex, offsetBy: b))
    }
}

// MARK: - Solution Swift
func longestPalindrome(_ s: String) -> String {
    var a = 0
    var b = 0

    for i in 0..<s.count {
        var leftCaret = i - 1
        var rightCaret = i + 1

        while rightCaret < s.count && s[i] == s[rightCaret] {
            rightCaret += 1
        }

        while leftCaret >= 0 && rightCaret < s.count && s[leftCaret] == s[rightCaret] {
            leftCaret -= 1
            rightCaret += 1
        }

        if rightCaret - leftCaret > b - a {
            a = leftCaret
            b = rightCaret
        }
    }

    return s[from: a + 1, to: b]
}

// MARK: - Testing
// Input: s = "babad"
// Output: "bab"
// Note: "aba" is also a valid answer.

// Input: s = "cbbd"
// Output: "bb"

// Input: s = "a"
// Output: "a"

// Input: s = "a c"
// Output: "a"

print(longestPalindrome("ffffffffffffffffqwerterzxcvasdf"))

// MARK: - Solution C++ (since Swift sucks ass: retrieving character from a string by index takes fucking O(n))
/*
string longestPalindrome(string s) {
    int a = 0;
    int b = 0;

    for(int i=0; i<s.length(); ++i) {
        int L = i - 1;
        int R = i + 1;

        while(R < s.length() && s[i] == s[R]) {
            ++R;
        }

        while(L >= 0 && R < s.length() && s[L] == s[R]) {
            --L;
            ++R;
        }

        if(R - L > b - a) {
            a = L + 1;
            b = R;
        }
    }

    return s.substr(a, b - a);
}
*/
