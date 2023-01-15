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

    func testSolution_smallestEquivalentString_1() {
        // given
        let s1 = "parker"
        let s2 = "morris"
        let baseStr = "parser"

        // when
        let result = sut.smallestEquivalentString(s1, s2, baseStr)

        // then
        let expected = "makkek"

        XCTAssertEqual(result, expected)
    }

    func testSolution_smallestEquivalentString_2() {
        // given
        let s1 = "hello"
        let s2 = "world"
        let baseStr = "hold"

        // when
        let result = sut.smallestEquivalentString(s1, s2, baseStr)

        // then
        let expected = "hdld"

        XCTAssertEqual(result, expected)
    }

    func testSolution_smallestEquivalentString_3() {
        // given
        let s1 = "leetcode"
        let s2 = "programs"
        let baseStr = "sourcecode"

        // when
        let result = sut.smallestEquivalentString(s1, s2, baseStr)

        // then
        let expected = "aauaaaaada"

        XCTAssertEqual(result, expected)
    }
}
