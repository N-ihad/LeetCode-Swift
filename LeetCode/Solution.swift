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

/*
    https://leetcode.com/problems/lexicographically-smallest-equivalent-string/solutions/6814037/swift-simple-solution-using-hash-table-a-qyym

    The function smallestEquivalentString takes two strings s1 and s2 of equal length, and a baseStr, and returns the 
    lexicographically smallest string equivalent to baseStr using equivalency relationships defined by corresponding characters in s1 and s2. 
    For each i, s1[i] is considered equivalent to s2[i]. The equivalency is symmetric and transitive, meaning equivalence groups can 
    grow as more character relationships are discovered.

    We use a dictionary charsEquivalenceMap to track these equivalence groups, where each key is a character, and the 
    value is a set of characters that are equivalent to it. For each character pair (s1[i], s2[i]), it inserts both into 
    each other's equivalence sets. To ensure transitivity, it also updates all characters already equivalent to either character, 
    merging their sets using formUnion.

    Once all equivalence groups are built, the function constructs the final answer by scanning each character in baseStr. 
    If the character is part of any equivalence group, the lexicographically smallest character from that group is chosen. 
    If not, the character is used as is. This ensures the resulting string is the smallest possible under the equivalency rules.

    Time Complexity: The worst-case time complexity is approximately O(n^2), where n is the number of equivalence 
    relationships (i.e., the length of s1). This is due to the repeated merging of character sets which can lead to 
    redundant and overlapping operations.

    class Solution {
        func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
            var charsEquivalenceMap: [Character: Set<Character>] = [:]
    
            for i in s1.indices {
                charsEquivalenceMap[s1[i], default: []].insert(s2[i])
                charsEquivalenceMap[s2[i], default: []].insert(s1[i])
    
                for char in charsEquivalenceMap[s1[i]]! {
                    charsEquivalenceMap[char, default: []].formUnion(charsEquivalenceMap[s1[i]]!)
                }
    
                for char in charsEquivalenceMap[s2[i]]! {
                    charsEquivalenceMap[char, default: []].formUnion(charsEquivalenceMap[s2[i]]!)
                }
            }
    
            var smallestEquivalentString = ""
            for char in baseStr {
                if let minChar = charsEquivalenceMap[char]?.min() {
                    smallestEquivalentString += String(minChar)
                } else {
                    smallestEquivalentString += String(char)
                }
            }
    
            return smallestEquivalentString
        }
    }
*/
