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

    func testSolution_wordPattern_1() {
        // given
        let pattern = "abba"
        let s = "dog cat cat dog"

        // when
        let result = sut.wordPattern(pattern, s)

        // then
        let expected = true

        XCTAssertEqual(result, expected)
    }

    func testSolution_wordPattern_2() {
        // given
        let pattern = "abba"
        let s = "dog cat cat fish"

        // when
        let result = sut.wordPattern(pattern, s)

        // then
        let expected = false

        XCTAssertEqual(result, expected)
    }

    func testSolution_wordPattern_3() {
        // given
        let pattern = "aaaa"
        let s = "dog cat cat dog"

        // when
        let result = sut.wordPattern(pattern, s)

        // then
        let expected = false

        XCTAssertEqual(result, expected)
    }

    func testSolution_wordPattern_4() {
        // given
        let pattern = "abba"
        let s = "dog dog dog dog"

        // when
        let result = sut.wordPattern(pattern, s)

        // then
        let expected = false

        XCTAssertEqual(result, expected)
    }
}
