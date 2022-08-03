//
//  SolutionTests.swift
//  LeetCodeTests
//
//  Created by Nihad on 11/20/21.
//

import XCTest
@testable import LeetCode

class SolutionTests: XCTestCase {

    var sut: Solution.MyCalendar!

    override func setUp() {
        super.setUp()
        sut = Solution.MyCalendar()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSolution_MyCalendar_1() {
        // when
        let result = sut.book(10, 20)

        // then
        let expected = true

        XCTAssertEqual(result, expected)
    }

    func testSolution_MyCalendar_2() {
        // when
        let result1 = sut.book(10, 20)
        let result2 = sut.book(15, 25)

        // then
        let expected1 = true
        let expected2 = false

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }

    func testSolution_MyCalendar_3() {
        // when
        let result1 = sut.book(10, 20)
        let result2 = sut.book(15, 25)
        let result3 = sut.book(20, 30)

        // then
        let expected1 = true
        let expected2 = false
        let expected3 = true

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
    }
}
