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

    func testSolution_() {
        // given
        let m1 = 3
        let n1 = 7

        let m2 = 3
        let n2 = 2

        let m3 = 23
        let n3 = 12

        // when
        let result1 = sut.uniquePaths(m1, n1)
        let result2 = sut.uniquePaths(m2, n2)
        let result3 = sut.uniquePaths(m3, n3)

        // then
        let expected1 = 28
        let expected2 = 3
        let expected3 = 193536720

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
    }
}
