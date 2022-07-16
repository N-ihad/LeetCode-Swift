//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

extension ArraySlice where Element == Int {
    var rightBound: Int {
        self.last ?? Int.min
    }

    var leftBound: Int {
        self.first ?? Int.max
    }
}

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var arr1: [Int]
        var arr2: [Int]

        if nums1.count <= nums2.count {
            arr1 = nums1
            arr2 = nums2
        } else {
            arr1 = nums2
            arr2 = nums1
        }

        var arr1LeftHalf: ArraySlice<Int> = []
        var arr1RightHalf: ArraySlice<Int> = []
        var arr2LeftHalf: ArraySlice<Int> = []
        var arr2RightHalf: ArraySlice<Int> = []
        var start = 0
        var end = arr1.count

        repeat {
            let partitionX = (start + end) / 2
            let partitionY = (arr1.count + arr2.count + 1) / 2 - partitionX

            arr1LeftHalf = arr1[0..<partitionX]
            arr1RightHalf = arr1[partitionX..<arr1.count]

            arr2LeftHalf = arr2[0..<partitionY]
            arr2RightHalf = arr2[partitionY..<arr2.count]

            if arr1LeftHalf.rightBound > arr2RightHalf.leftBound {
                end = partitionX - 1
            } else if arr2LeftHalf.rightBound > arr1RightHalf.leftBound {
                start = partitionX + 1
            }

        } while !(arr1LeftHalf.rightBound <= arr2RightHalf.leftBound && arr2LeftHalf.rightBound <= arr1RightHalf.leftBound)

        let isEven = (arr1.count + arr2.count) % 2 == 0

        if isEven {
            return (Double(max(arr1LeftHalf.rightBound, arr2LeftHalf.rightBound) + min(arr1RightHalf.leftBound, arr2RightHalf.leftBound))) / 2
        } else {
            return Double(max(arr1LeftHalf.rightBound, arr2LeftHalf.rightBound))
        }
    }
}
