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

    func testSolution_doesWordExist() {
        // given
        let board: [[Character]] = [["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]]
        let word1 = "ABCCED"
        let word2 = "SEE"
        let word3 = "ABCB"

        // when
        let result1 = sut.exist(board, word1)
        let result2 = sut.exist(board, word2)
        let result3 = sut.exist(board, word3)

        // then
        let expectedResult1 = true
        let expectedResult2 = true
        let expectedResult3 = false

        XCTAssertEqual(result1, expectedResult1)
        XCTAssertEqual(result2, expectedResult2)
        XCTAssertEqual(result3, expectedResult3)
    }
}
