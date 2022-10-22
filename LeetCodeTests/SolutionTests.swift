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

    func testSolution_reverseInteger_1() {
        // given
        let x = 123

        // when
        let result = sut.reverse(x)

        // then
        let expected = 321

        XCTAssertEqual(result, expected)
    }

    func testSolution_reverseInteger_2() {
        // given
        let x = -123

        // when
        let result = sut.reverse(x)

        // then
        let expected = -321

        XCTAssertEqual(result, expected)
    }

    func testSolution_reverseInteger_3() {
        // given
        let x = 120

        // when
        let result = sut.reverse(x)

        // then
        let expected = 21

        XCTAssertEqual(result, expected)
    }
}
