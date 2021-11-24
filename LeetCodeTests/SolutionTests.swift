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

    func testSolution_mergeIntervals() {
        // given
        let intervals1 = [[1, 3], [2, 6], [8, 10], [15, 18]]
        let intervals2 = [[1, 4], [4, 5]]
        let intervals3 = [[1, 4], [0, 4]]
        let intervals4 = [[1, 4], [0, 0]]
        let intervals5 = [[1, 4], [0, 2], [3, 5]]

        // when
        let result1 = sut.merge(intervals1)
        let result2 = sut.merge(intervals2)
        let result3 = sut.merge(intervals3)
        let result4 = sut.merge(intervals4)
        let result5 = sut.merge(intervals5)

        // then
        let expected1 = [[1, 6], [8, 10], [15, 18]]
        let expected2 = [[1, 5]]
        let expected3 = [[0, 4]]
        let expected4 = [[0, 0], [1, 4]]
        let expected5 = [[0, 5]]

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
        XCTAssertEqual(result4, expected4)
        XCTAssertEqual(result5, expected5)
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
}
