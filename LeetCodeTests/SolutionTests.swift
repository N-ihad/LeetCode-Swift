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

    func testSolution_numTrees_1() {
        // given
        let n = 3

        // when
        let result = sut.numTrees(n)

        // then
        let expected = 5

        XCTAssertEqual(result, expected)
    }

    func testSolution_numTrees_2() {
        // given
        let n = 1

        // when
        let result = sut.numTrees(n)

        // then
        let expected = 1

        XCTAssertEqual(result, expected)
    }

    func testSolution_numTrees_3() {
        // given
        let n = 2

        // when
        let result = sut.numTrees(n)

        // then
        let expected = 2

        XCTAssertEqual(result, expected)
    }
}
