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

    func testSolution_diagonalSort_1() {
        // given
        let mat = [[3,3,1,1],
                   [2,2,1,2],
                   [1,1,1,2]]

        // when
        let result = sut.diagonalSort(mat)

        // then
        let expected = [[1,1,1,1],[1,2,2,2],[1,2,3,3]]

        XCTAssertEqual(result, expected)
    }

    func testSolution_diagonalSort_2() {
        // given
        let mat = [[11,25,66,1,69,7],
                   [23,55,17,45,15,52],
                   [75,31,36,44,58,8],
                   [22,27,33,25,68,4],
                   [84,28,14,11,5,50]]

        // when
        let result = sut.diagonalSort(mat)

        // then
        let expected = [[5,17,4,1,52,7],[11,11,25,45,8,69],[14,23,25,44,58,15],[22,27,31,36,50,66],[84,28,75,33,55,68]]

        XCTAssertEqual(result, expected)
    }
}
