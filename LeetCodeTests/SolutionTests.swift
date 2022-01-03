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

    func testSolution_majorityElement() {
        // given
        let nums1 = [3, 2, 3]
        let nums2 = [2, 2, 1, 1, 1, 2, 2]

        // when
        let result1 = sut.majorityElement(nums1)
        let result2 = sut.majorityElement(nums2)

        // then
        let expected1 = 3
        let expected2 = 2

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
