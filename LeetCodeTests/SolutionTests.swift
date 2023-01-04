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

    func testSolution_minimumRounds_1() {
        // given
        let tasks = [2,2,3,3,2,4,4,4,4,4]

        // when
        let result = sut.minimumRounds(tasks)

        // then
        let expected = 4

        XCTAssertEqual(result, expected)
    }

    func testSolution_minimumRounds_2() {
        // given
        let tasks = [2,3,3]

        // when
        let result = sut.minimumRounds(tasks)

        // then
        let expected = -1

        XCTAssertEqual(result, expected)
    }
}
