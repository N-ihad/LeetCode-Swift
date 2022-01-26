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

    func testSolution_rob() {
        // given
        let nums1 = [1,2,3,1]
        let nums2 = [2,7,9,3,1]

        // when
        let result1 = sut.rob(nums1)
        let result2 = sut.rob(nums2)

        // then
        let expected1 = 4
        let expected2 = 12

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
