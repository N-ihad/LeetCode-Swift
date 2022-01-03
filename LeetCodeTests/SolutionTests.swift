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

    func testSolution_maxProfit() {
        // given
        let prices1 = [7, 1, 5, 3, 6, 4]
        let prices2 = [7, 6, 4, 3, 1]

        // when
        let result1 = sut.maxProfit(prices1)
        let result2 = sut.maxProfit(prices2)

        // then
        let expected1 = 5
        let expected2 = 0

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
