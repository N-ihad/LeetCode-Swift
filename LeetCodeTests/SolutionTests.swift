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

    func testSolution_sortColors() {
        // given
        var colors1 = [2, 0, 2, 0, 1, 0]
        var colors2 = [2, 0, 1]
        var colors3 = [0]
        var colors4 = [1]

        // when
        sut.sortColors(&colors1)
        sut.sortColors(&colors2)
        sut.sortColors(&colors3)
        sut.sortColors(&colors4)

        // then
        let expectedResult1 = [0, 0, 0, 1, 2, 2]
        let expectedResult2 = [0, 1, 2]
        let expectedResult3 = [0]
        let expectedResult4 = [1]

        XCTAssertEqual(colors1, expectedResult1)
        XCTAssertEqual(colors2, expectedResult2)
        XCTAssertEqual(colors3, expectedResult3)
        XCTAssertEqual(colors4, expectedResult4)
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
}
