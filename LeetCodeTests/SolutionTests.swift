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

    func testSolution_searchMatrix() {
        // given
        let matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]]
        let target1 = 5
        let target2 = 20

        // when
        let result1 = sut.searchMatrix(matrix, target1)
        let result2 = sut.searchMatrix(matrix, target2)

        // then
        let expected1 = true
        let expected2 = false

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
