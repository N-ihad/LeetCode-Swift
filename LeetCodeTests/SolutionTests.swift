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

    func testSolution_maxSlidingWindow() {
        // given
        let nums1 = [1, 3, -1, -3, 5, 3, 6, 7]
        let k1 = 3

        let nums2 = [1]
        let k2 = 1

        // when
        let result1 = sut.maxSlidingWindow(nums1, k1)
        let result2 = sut.maxSlidingWindow(nums2, k2)

        // then
        let expected1 = [3, 3, 5, 5, 6, 7]
        let expected2 = [1]

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
