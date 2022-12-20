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

    func testSolution_canJump_1() {
        // given
        let nums = [2, 3, 1, 1, 4]

        // when
        let result = sut.canJump(nums)

        // then
        let expected = true

        XCTAssertEqual(result, expected)
    }

    func testSolution_canJump_2() {
        // given
        let nums = [3, 2, 1, 0, 4]

        // when
        let result = sut.canJump(nums)

        // then
        let expected = false

        XCTAssertEqual(result, expected)
    }
}
