//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

extension String {
    subscript(_ index: Int) -> Self {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

struct Stack<T> {
    private var elements: [T] = []

    var peek: T? {
        elements.last
    }

    var isEmpty: Bool {
        elements.isEmpty
    }

    mutating func push(_ newElement: T) {
        elements.append(newElement)
    }

    mutating func pop() {
        elements.removeLast()
    }
}

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = Stack<String>()

        for i in 0..<s.count {
            if stack.isEmpty {
                stack.push(s[i])
                continue
            }

            let last = stack.peek!

            switch s[i] {
            case ")" where last == "(", "]" where last == "[", "}" where last ==  "{":
                stack.pop()
            case ")", "]", "}" where last == ")" || last == "]" || last == "}":
                return false
            default:
                stack.push(s[i])
            }
        }

        return stack.isEmpty ? true : false
    }
}

// MARK: - Solution C++ (since Swift sucks ass: retrieving character from a string by index takes fucking O(n))
/*
bool isValid(string s) {
    stack<char> stack;

    for(int i=0; i<s.length(); ++i) {
        if (stack.empty()) {
            stack.push(s[i]);
            continue;
        }

        if ((s[i] == ')' && stack.top() == '(') ||
            (s[i] == ']' && stack.top() == '[') ||
            (s[i] == '}' && stack.top() == '{')) {
            stack.pop();
        } else if (s [i] == '(' || s[i] == '[' || s[i] == '{') {
            stack.push(s[i]);
        } else {
            return false;
        }
    }

    return stack.empty() ? true : false;
}
*/
