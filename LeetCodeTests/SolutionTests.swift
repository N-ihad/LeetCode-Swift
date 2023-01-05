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

    func testSolution_findMinArrowShots_1() {
        // given
        let points = [[10,16],[2,8],[1,6],[7,12]]

        // when
        let result = sut.findMinArrowShots(points)

        // then
        let expected = 2

        XCTAssertEqual(result, expected)
    }

    func testSolution_findMinArrowShots_2() {
        // given
        let points = [[1,2],[3,4],[5,6],[7,8]]

        // when
        let result = sut.findMinArrowShots(points)

        // then
        let expected = 4

        XCTAssertEqual(result, expected)
    }

    func testSolution_findMinArrowShots_3() {
        // given
        let points = [[1,2],[2,3],[3,4],[4,5]]

        // when
        let result = sut.findMinArrowShots(points)

        // then
        let expected = 2

        XCTAssertEqual(result, expected)
    }
}
