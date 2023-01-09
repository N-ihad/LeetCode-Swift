//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        
        var stack = Stack(root!)
        
        while !stack.isEmpty {
            let poppedElement = stack.pop()
            stack.push(poppedElement?.left)
            stack.push(poppedElement?.right)
        }
        
        return stack.popHistory
    }
}

struct Stack {
    
    private var elements: [TreeNode] = []
    private(set) var popHistory: [Int] = []
    
    init(_ element: TreeNode) {
        elements = [element]
    }
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    var top: TreeNode? {
        elements.last
    }
    
    mutating func push(_ newElement: TreeNode?) {
        if newElement != nil {
            elements.append(newElement!)
        }
    }
    
    mutating func pop() -> TreeNode? {
        if elements.isEmpty { return nil }
        let poppedElement = elements.removeLast()
        popHistory.append(poppedElement.val)
        return poppedElement
    }
}
