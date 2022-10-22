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

    func testSolution_maxArea_1() {
        // given
        let height = [1,8,6,2,5,4,8,3,7]

        // when
        let result = sut.maxArea(height)

        // then
        let expected = 49

        XCTAssertEqual(result, expected)
    }

    func testSolution_maxArea_2() {
        // given
        let height = [1,1]

        // when
        let result = sut.maxArea(height)

        // then
        let expected = 1

        XCTAssertEqual(result, expected)
    }

    func testSolution_maxArea_3() {
        // given
        let height = [2,3,4,5,18,17,6]

        // when
        let result = sut.maxArea(height)

        // then
        let expected = 17

        XCTAssertEqual(result, expected)
    }
}
