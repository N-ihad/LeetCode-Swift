//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var hashMap: [String: Int] = [:]
        var result: [[String]] = []
        var bucketIndex = 0

        for str in strs {
            let newStr = String(str.sorted())
            if hashMap[newStr] == nil {
                hashMap[newStr] = bucketIndex
                result.append([str])
                bucketIndex += 1
            } else {
                result[hashMap[newStr]!].append(str)
            }
        }

        return result
    }

    // MARK: - Attempt to do without sorting
//    func groupAnagrams2(_ strs: [String]) -> [[String]] {
//        var hashMap: [String: Int] = [:]
//        var result: [[String]] = []
//        var bucketIndex = 0
//
//        for str in strs {
//            var _key: Double = 0
//            for c in str {
//                _key += Int(c.asciiValue!) + Double(c.asciiValue!)/(Double(c.asciiValue!)/10)%10 + Int(c.asciiValue!)%10
//            }
//            let key = String(_key)
////            let key = String(str.reduce(0) {
////                $0 + Int($1.asciiValue!)/100 + (Int($1.asciiValue!)/10)%10 + Int($1.asciiValue!)%10
////            })
//            if hashMap[key] == nil {
//                hashMap[key] = bucketIndex
//                result.append([str])
//                bucketIndex += 1
//            } else {
//                result[hashMap[key]!].append(str)
//            }
//        }
//
//        return result
//    }
}
