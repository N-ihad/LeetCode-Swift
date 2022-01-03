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

    func testSolution_moveZeroes() {
        // given
        var nums1 = [0, 1, 0, 3, 12]
        var nums2 = [0]

        // when
        sut.moveZeroes(&nums1)
        sut.moveZeroes(&nums2)

        // then
        let expected1 = [1, 3, 12, 0, 0]
        let expected2 = [0]

        XCTAssertEqual(nums1, expected1)
        XCTAssertEqual(nums2, expected2)
    }
}
