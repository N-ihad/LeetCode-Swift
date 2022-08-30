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

    func testSolution_nthPersonGetsNthSeat_1() {
        // given
        let n = 1

        // when
        let result = sut.nthPersonGetsNthSeat(n)

        // then
        let expected: Double = 1

        XCTAssertEqual(result, expected)
    }

    func testSolution_nthPersonGetsNthSeat_2() {
        // given
        let n = 2

        // when
        let result = sut.nthPersonGetsNthSeat(n)

        // then
        let expected: Double = 0.5

        XCTAssertEqual(result, expected)
    }
}
