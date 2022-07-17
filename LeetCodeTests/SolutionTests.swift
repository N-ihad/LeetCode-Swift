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

    func testSolution_isMatch() {
        // given
        let s1 = "xaylmz"
        let p1 = "x?y*z"

        let s2 = "aa"
        let p2 = "a"

        let s3 = "aa"
        let p3 = "*"

        let s4 = "cb"
        let p4 = "?a"

        // when
        let result1 = sut.isMatch(s1, p1)
        let result2 = sut.isMatch(s2, p2)
        let result3 = sut.isMatch(s3, p3)
        let result4 = sut.isMatch(s4, p4)

        // then
        let expected1 = true
        let expected2 = false
        let expected3 = true
        let expected4 = false

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
        XCTAssertEqual(result4, expected4)
    }
}
