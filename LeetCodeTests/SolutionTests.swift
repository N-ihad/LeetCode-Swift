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

    func testSolution_() {
        // given
        var board1: [[Int]] = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]
        var board2: [[Int]] = [[1,1],[1,0]]

        // where
        sut.gameOfLife(&board1)
        sut.gameOfLife(&board2)

        // then
        let expected1: [[Int]] = [[0,0,0],[1,0,1],[0,1,1],[0,1,0]]
        let expected2: [[Int]] = [[1,1],[1,1]]

        XCTAssertEqual(board1, expected1)
        XCTAssertEqual(board2, expected2)
    }
}
