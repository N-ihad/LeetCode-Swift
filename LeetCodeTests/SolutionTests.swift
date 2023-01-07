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

    func testSolution_convert_1() {
        // given
        let s = "PAYPALISHIRING"
        let numRows = 3

        // when
        let result = sut.convert(s, numRows)

        // then
        let expected = "PAHNAPLSIIGYIR"

        XCTAssertEqual(result, expected)
    }

    func testSolution_convert_2() {
        // given
        let s = "PAYPALISHIRING"
        let numRows = 4

        // when
        let result = sut.convert(s, numRows)

        // then
        let expected = "PINALSIGYAHRPI"

        XCTAssertEqual(result, expected)
    }

    func testSolution_convert_3() {
        // given
        let s = "A"
        let numRows = 1

        // when
        let result = sut.convert(s, numRows)

        // then
        let expected = "A"

        XCTAssertEqual(result, expected)
    }
}
