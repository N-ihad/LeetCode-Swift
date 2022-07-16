//
//  SolutionTests.swift
//  LeetCodeTests
//
//  Created by Nihad on 11/20/21.
//

import XCTest
@testable import LeetCode

class SolutionTests: XCTestCase {

    var sut: Solution!

    override func setUp() {
        super.setUp()
        sut = Solution()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSolution_findMedianSortedArrays() {
        // given
        let nums11 = [1,3]
        let nums12 = [2]

        let nums21 = [1,2]
        let nums22 = [3,4]

        let nums31 = [1,3,8,9,15]
        let nums32 = [7,11,18,19,21,25]

        let nums41 = [23,26,31,35]
        let nums42 = [3,5,7,9,11,16]

        // when
        let result1 = sut.findMedianSortedArrays(nums11, nums12)
        let result2 = sut.findMedianSortedArrays(nums21, nums22)
        let result3 = sut.findMedianSortedArrays(nums31, nums32)
        let result4 = sut.findMedianSortedArrays(nums41, nums42)

        // then
        let expected1 = 2.0
        let expected2 = 2.5
        let expected3 = 11.0
        let expected4 = 13.5

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
        XCTAssertEqual(result4, expected4)
    }
}
