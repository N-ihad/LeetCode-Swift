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

    func testSolution_isHappyNumber() {
        // given
        let n1 = 19
        let n2 = 2

        // when
        let result1 = sut.isHappy(n1)
        let result2 = sut.isHappy(n2)

        // then
        let expected1 = true
        let expected2 = false

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
