//
//  main.swift
//  LeetCode
//
//  Created by Nihad on 11/17/21.
//

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        if root == nil { return "" }

        var res = ""
        let queue = Queue()
        queue.enqueue(root!)

        while !queue.isEmpty {
            let currentNode = queue.dequeue()

            if let val = currentNode?.val {
                res.append("\(val) ")
            } else {
                res.append("nil ")
            }

            if currentNode != nil {
                queue.enqueue(currentNode?.left)
                queue.enqueue(currentNode?.right)
            }
        }

        return res
    }

    func deserialize(_ data: String) -> TreeNode? {
        if data.isEmpty { return nil }

        var data = data.components(separatedBy: " ")
        data.removeLast()

        let root = TreeNode(Int(data[0])!)
        let queue = Queue()
        queue.enqueue(root)
        var head: TreeNode? = root

        for i in 0..<data.count {

            head = queue.dequeue()

            if i*2+1 < data.count, let val = Int(data[i*2+1]) { head?.left = TreeNode(val) }
            if i*2+2 < data.count, let val = Int(data[i*2+2]) { head?.right = TreeNode(val) }

            if head?.left != nil {
                queue.enqueue(head?.left)
            }

            if head?.right != nil {
                queue.enqueue(head!.right)
            }
        }

        return root
    }
}

let codec = Codec()
//Helper.printTree(codec.deserialize("1 2 3 nil nil 4 5 6 7 "))
print(codec.serialize(codec.deserialize("1 2 3 nil nil 4 5 6 7 ")))

