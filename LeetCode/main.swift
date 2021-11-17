//
//  main.swift
//  LeetCode
//
//  Created by Nihad on 11/17/21.
//

import Foundation

// MARK: - O(n)
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()

    for i in 0..<nums.count {
        let complement = target - nums[i]

        if dict.keys.contains(complement) {
            return [dict[complement]!, i]
        }

        dict[nums[i]] = i
    }

    return []
}

// MARK: - O(nLogn)
//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    let sortedNums = nums.sorted()
//    var leftCaretIndex = 0
//    var rightCaretIndex = sortedNums.count - 1
//
//    if leftCaretIndex == rightCaretIndex {
//        return [leftCaretIndex, rightCaretIndex]
//    }
//
//    for _ in 0..<sortedNums.count {
//        guard leftCaretIndex != rightCaretIndex else {
//            return []
//        }
//
//        if sortedNums[leftCaretIndex] + sortedNums[rightCaretIndex] == target {
//            return [leftCaretIndex, rightCaretIndex]
//        }
//
//        if sortedNums[leftCaretIndex] + sortedNums[rightCaretIndex] < target {
//            leftCaretIndex += 1
//        } else {
//            rightCaretIndex -= 1
//        }
//    }
//
//    return []
//}

// MARK: - O^2
//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    for i in 0..<nums.count {
//        for j in i+1..<nums.count {
//            if nums[i] + nums[j] == target {
//                return [i, j]
//            }
//        }
//    }
//    return []
//}
