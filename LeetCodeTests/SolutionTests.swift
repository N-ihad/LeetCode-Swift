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

    func testSolution_minDistance() {
        // given
        let word11 = "horse"
        let word12 = "ros"

        let word21 = "intention"
        let word22 = "execution"

        // when
        let result1 = sut.minDistance(word11, word12)
        let result2 = sut.minDistance(word21, word22)

        // then
        let expected1 = 3
        let expected2 = 5

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
