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

    func testSolution_maxIceCream_1() {
        // given
        let costs = [1,3,2,4,1]
        let coins = 7

        // when
        let result = sut.maxIceCream(costs, coins)

        // then
        let expected = 4

        XCTAssertEqual(result, expected)
    }

    func testSolution_maxIceCream_2() {
        // given
        let costs = [10,6,8,7,7,8]
        let coins = 5

        // when
        let result = sut.maxIceCream(costs, coins)

        // then
        let expected = 0

        XCTAssertEqual(result, expected)
    }

    func testSolution_maxIceCream_3() {
        // given
        let costs = [1,6,3,1,2,5]
        let coins = 20

        // when
        let result = sut.maxIceCream(costs, coins)

        // then
        let expected = 6

        XCTAssertEqual(result, expected)
    }
}
