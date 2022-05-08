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

    func testSolution_removeDuplicates() {
        // given
        let s1 = "abcd"
        let k1 = 2

        let s2 = "deeedbbcccbdaa"
        let k2 = 3

        let s3 = "pbbcggttciiippooaais"
        let k3 = 2

        // when
        let result1 = sut.removeDuplicates(s1, k1)
        let result2 = sut.removeDuplicates(s2, k2)
        let result3 = sut.removeDuplicates(s3, k3)

        // then
        let expected1 = "abcd"
        let expected2 = "aa"
        let expected3 = "ps"

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
    }
}
