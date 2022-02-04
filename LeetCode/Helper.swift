//
//  Helper.swift
//  LeetCode
//
//  Created by Nihad on 1/16/22.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

struct Helper {
    static func printMatrix(_ matrix: inout [[Int]]) {
        guard !matrix.isEmpty else {
            return
        }

        var spaces: [Int: Int] = [:]

        for j in 0..<matrix[0].count {
            spaces[j] = 1
        }

        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                spaces[j] = String(matrix[i][j]).count > spaces[j]! ? String(matrix[i][j]).count + 1 : spaces[j]
            }
        }

        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                let spacesCount = String(matrix[i][j]).count < spaces[j]! ? spaces[j]! - String(matrix[i][j]).count : 1
                print(matrix[i][j], terminator: String(repeating: " ", count: spacesCount))
            }
            print()
        }
    }

    static func makeList(fromArray array: [Int]) -> ListNode? {
        if array.isEmpty { return nil }

        var head = ListNode(array[0])
        let origin = head
        for i in 1..<array.count {
            let newNode = ListNode(array[i])
            head.next = newNode
            head = newNode
        }

        return origin
    }

    static func printList(_ root: ListNode?) {
        if root == nil { print("Empty list"); return }
        var head = root
        while head != nil {
            print("\(head!.val)", terminator: " ")
            head = head?.next
        }
        print()
    }
}
