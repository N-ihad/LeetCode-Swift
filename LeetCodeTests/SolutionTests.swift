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

    func testSolution_pivotIndex() {
        // given
        let nums1 = [1,7,3,6,5,6]
        let nums2 = [1,2,3]
        let nums3 = [2,1,-1]

        // when
        let result1 = sut.pivotIndex(nums1)
        let result2 = sut.pivotIndex(nums2)
        let result3 = sut.pivotIndex(nums3)

        // then
        let expected1 = 3
        let expected2 = -1
        let expected3 = 0

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
    }
}
