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

    func testSolution_spiralOrder() {
        // given
        let matrix1: [[Int]] = [[1,2,3],[4,5,6],[7,8,9]]
        let matrix2: [[Int]] = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]

        // when
        let result2 = sut.spiralOrder(matrix2)
        let result1 = sut.spiralOrder(matrix1)

        // then
        let expected1 = [1,2,3,6,9,8,7,4,5]
        let expected2 = [1,2,3,4,8,12,11,10,9,5,6,7]

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
