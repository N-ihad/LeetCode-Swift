//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Node<T: Hashable> {
    var children: [T: Node<T>]
    var isCompleteWord = false

    init(children: [T: Node<T>] = [:]) {
        self.children = children
    }
}

class Trie {

    private var startingPoint: [Character: Node<Character>] = [:]
    
    func insert(_ word: String) {
        let firstChar = word[word.startIndex]

        if startingPoint[firstChar] == nil {
            startingPoint[firstChar] = Node<Character>()
        }

        _insert(word)
    }
    
    func search(_ word: String) -> Bool {
        find(word, shouldFindFullWord: true)
    }
    
    func startsWith(_ prefix: String) -> Bool {
        find(prefix, shouldFindFullWord: false)
    }

    private func _insert(_ word: String) {
        var prevNode = startingPoint[word[word.startIndex]]!
        var index = word.index(after: word.startIndex)
        
        while index < word.endIndex {
            if prevNode.children[word[index]] == nil {
                let node = Node<Character>()
                prevNode.children[word[index]] = node
                prevNode = node
            } else {
                prevNode = prevNode.children[word[index]]!
            }

            index = word.index(after: index)
        }

        prevNode.isCompleteWord = true
    }

    private func find(_ word: String, shouldFindFullWord: Bool) -> Bool {
        if startingPoint[word[word.startIndex]] == nil {
            return false
        }

        var prevNode = startingPoint[word[word.startIndex]]!
        var index = word.index(after: word.startIndex)

        while index < word.endIndex {
            if prevNode.children[word[index]] == nil {
                return false
            }

            prevNode = prevNode.children[word[index]]!
            index = word.index(after: index)
        }

        if shouldFindFullWord {
            return prevNode.isCompleteWord
        }

        return true
    }
}

