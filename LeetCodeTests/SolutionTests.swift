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

    func testSolution_detectCapitalUse_1() {
        // given
        let word = "USA"

        // when
        let result = sut.detectCapitalUse(word)

        // then
        let expected = true

        XCTAssertEqual(result, expected)
    }

    func testSolution_detectCapitalUse_2() {
        // given
        let word = "FlaG"

        // when
        let result = sut.detectCapitalUse(word)

        // then
        let expected = false

        XCTAssertEqual(result, expected)
    }
}
