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

    func testSolution_minDeletionSize_1() {
        // given
        let strs = ["cba","daf","ghi"]

        // when
        let result = sut.minDeletionSize(strs)

        // then
        let expected = 1

        XCTAssertEqual(result, expected)
    }

    func testSolution_minDeletionSize_2() {
        // given
        let strs = ["a","b"]

        // when
        let result = sut.minDeletionSize(strs)

        // then
        let expected = 0

        XCTAssertEqual(result, expected)
    }

    func testSolution_minDeletionSize_3() {
        // given
        let strs = ["zyx","wvu","tsr"]

        // when
        let result = sut.minDeletionSize(strs)

        // then
        let expected = 3

        XCTAssertEqual(result, expected)
    }
}
