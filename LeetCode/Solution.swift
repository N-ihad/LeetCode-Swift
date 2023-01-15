//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
        let s1 = Array(s1)
        let s2 = Array(s2)

        var hashMapIdAttachedToLetters: [Int: Set<Character>] = [:]
        var hashMapLetterAttachedToId: [Character: Int] = [:]

        for i in 0..<s1.count {
            let idS1 = hashMapLetterAttachedToId[s1[i]]
            let idS2 = hashMapLetterAttachedToId[s2[i]]

            switch (idS1, idS2) {
            case (nil, nil):
                hashMapLetterAttachedToId[s1[i]] = i
                hashMapLetterAttachedToId[s2[i]] = i
                hashMapIdAttachedToLetters[i] = [s1[i], s2[i]]
            case (let idS1?, nil):
                hashMapLetterAttachedToId[s2[i]] = idS1
                hashMapIdAttachedToLetters[idS1]!.insert(s2[i])
            case (nil, let idS2?):
                hashMapLetterAttachedToId[s1[i]] = idS2
                hashMapIdAttachedToLetters[idS2]!.insert(s1[i])
            case (let idS1?, let idS2?):
                if idS1 == idS2 { continue }

                let (idFrom, idTo) = hashMapIdAttachedToLetters[idS1]!.count < hashMapIdAttachedToLetters[idS2]!.count ? (idS1, idS2) : (idS2, idS1)

                for letter in hashMapIdAttachedToLetters[idFrom]! {
                    hashMapIdAttachedToLetters[idTo]!.insert(letter)
                    hashMapLetterAttachedToId[letter] = idTo
                }

                hashMapIdAttachedToLetters[idFrom] = nil
            }
        }

        var sortedHashMap: [Int: [Character]] = [:]
        hashMapIdAttachedToLetters.forEach { id, letters in
            sortedHashMap[id] = Array(letters).sorted()
        }

        var result = ""
        for c in baseStr {
            let id = hashMapLetterAttachedToId[c]

            if id == nil {
                result += String(c)
            } else {
                result += String(sortedHashMap[id!]!.first!)
            }
        }

        return result
    }
}
