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

    func testSolution_canCompleteCircuit_1() {
        // given
        let gas = [1,2,3,4,5]
        let cost = [3,4,5,1,2]

        // when
        let result = sut.canCompleteCircuit(gas, cost)

        // then
        let expected = 3

        XCTAssertEqual(result, expected)
    }

    func testSolution_canCompleteCircuit_2() {
        // given
        let gas = [2,3,4]
        let cost = [3,4,3]

        // when
        let result = sut.canCompleteCircuit(gas, cost)

        // then
        let expected = -1

        XCTAssertEqual(result, expected)
    }
}
