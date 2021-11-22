//
//  main.swift
//  LeetCode
//
//  Created by Nihad on 11/17/21.
//

import Foundation

let s = Solution()

let node0 = Node(7)
let node1 = Node(13)
let node2 = Node(11)
let node3 = Node(10)
let node4 = Node(1)
node0.next = node1
node1.next = node2
node2.next = node3
node3.next = node4
node1.random = node0
node2.random = node4
node3.random = node2
node4.random = node0

// MARK: - Printing all nodes -
//var h: Node? = node0
//while h != nil {
//    print("\(h!.val), \(h!.random?.val)")
//    h = h!.next
//}

let _ = s.copyRandomList(node0)
