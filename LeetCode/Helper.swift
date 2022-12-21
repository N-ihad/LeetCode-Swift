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

    static func printPrettyTree<T>(_ node: T, nodeInfo: ((T) -> (String, T?, T?))? = nil) {
        if let nodeInfo = nodeInfo {
            print(treeString(node, using: nodeInfo))
        } else {
            let nodeInfo: (TreeNode) -> (String, TreeNode?, TreeNode?) = { node in
                return (String(node.val), node.left, node.right)
            }
            guard let node = node as? TreeNode else { return }
            print(treeString(node, using: nodeInfo))
        }
        print()
    }

    static func treeString(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }
        let nodeInfo: (TreeNode) -> (String, TreeNode?, TreeNode?) = { root in
            return (String(root.val), root.left, root.right)
        }
        return treeString(root, using: nodeInfo)
    }

    private static func treeString<T>(_ node: T,
                                      reversed: Bool = false,
                                      isTop: Bool = true,
                                      using nodeInfo: (T) -> (String, T?, T?)) -> String {
        let (stringValue, leftNode, rightNode) = nodeInfo(node)
        let stringValueWidth = stringValue.count
        let leftTextBlock = leftNode  == nil ? [] : treeString(leftNode!, reversed: reversed, isTop: false, using: nodeInfo).components(separatedBy: "\n")
        let rightTextBlock = rightNode == nil ? [] : treeString(rightNode!, reversed: reversed, isTop: false, using: nodeInfo).components(separatedBy:"\n")
        let commonLines = min(leftTextBlock.count,rightTextBlock.count)
        let subLevelLines = max(rightTextBlock.count,leftTextBlock.count)
        let leftSubLines = leftTextBlock + Array(repeating: "", count: subLevelLines - leftTextBlock.count)
        let rightSubLines = rightTextBlock + Array(repeating: "", count: subLevelLines - rightTextBlock.count)
        let leftLineWidths = leftSubLines.map{ $0.count }
        let rightLineIndents = rightSubLines.map{ $0.prefix { $0 == " " }.count }
        let firstLeftWidth = leftLineWidths.first ?? 0
        let firstRightIndent = rightLineIndents.first ?? 0
        let linkSpacing = min(stringValueWidth, 2 - stringValueWidth % 2)
        let leftLinkBar = leftNode == nil ? 0 : 1
        let rightLinkBar = rightNode == nil ? 0 : 1
        let minLinkWidth = leftLinkBar + linkSpacing + rightLinkBar
        let valueOffset = (stringValueWidth - linkSpacing) / 2
        let minSpacing = 2
        let rightNodePosition = zip(leftLineWidths, rightLineIndents[0..<commonLines]).reduce(firstLeftWidth + minLinkWidth) { max($0, $1.0 + minSpacing + firstRightIndent - $1.1) }
        let linkExtraWidth = max(0, rightNodePosition - firstLeftWidth - minLinkWidth )
        let rightLinkExtra = linkExtraWidth / 2
        let leftLinkExtra = linkExtraWidth - rightLinkExtra
        let valueIndent = max(0, firstLeftWidth + leftLinkExtra + leftLinkBar - valueOffset)
        let valueLine = String(repeating: " ", count: max(0, valueIndent)) + stringValue
        let slash = reversed ? "\\" : "/"
        let backSlash = reversed ? "/"  : "\\"
        let uLine = reversed ? "¯"  : "_"
        let leftLink = leftNode == nil ? "" : String(repeating: " ", count: firstLeftWidth) + String(repeating: uLine, count: leftLinkExtra) + slash
        let rightLinkOffset = linkSpacing + valueOffset * (1 - leftLinkBar)
        let rightLink = rightNode == nil ? "" : String(repeating:  " ", count: rightLinkOffset) + backSlash + String(repeating:  uLine, count: rightLinkExtra)
        let linkLine = leftLink + rightLink
        let leftIndentWidth = max(0,firstRightIndent - rightNodePosition)
        let leftIndent = String(repeating: " ", count: leftIndentWidth)
        let indentedLeftLines = leftSubLines.map{ $0.isEmpty ? $0 : (leftIndent + $0) }
        let mergeOffsets = indentedLeftLines.map{$0.count}.map{leftIndentWidth + rightNodePosition - firstRightIndent - $0 }.enumerated().map{ rightSubLines[$0].isEmpty ? 0  : $1 }
        let mergedSubLines = zip(mergeOffsets.enumerated(), indentedLeftLines).map{ ($0.0, $0.1, $1 + String(repeating: " ", count: max(0,$0.1))) }.map{ $2 + String(rightSubLines[$0].dropFirst(max(0, -$1))) }
        let treeLines = [leftIndent + valueLine] + (linkLine.isEmpty ? [] : [leftIndent + linkLine]) + mergedSubLines
        return (reversed && isTop ? treeLines.reversed() : treeLines).joined(separator: "\n")
    }
}
