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

    func testSolution_NQueens() {
        // given
        let n1 = 4
        let n2 = 1
        let n3 = 2

        // when
        let result1 = sut.solveNQueens(n1)
        let result2 = sut.solveNQueens(n2)
        let result3 = sut.solveNQueens(n3)

        // then
        let expected1 = [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
        let expected2 = [["Q"]]
        let expected3: [[String]] = []

        XCTAssertEqual(Set<[String]>(result1), Set<[String]>(expected1))
        XCTAssertEqual(Set<[String]>(result2), Set<[String]>(expected2))
        XCTAssertEqual(Set<[String]>(result3), Set<[String]>(expected3))
    }

    func test_updateHitCells() {
        // given
        var board1 = Array(repeating: Array(repeating: 0, count: 1), count: 1)
        var board2 = Array(repeating: Array(repeating: 0, count: 2), count: 2)
        var board3 = Array(repeating: Array(repeating: 0, count: 3), count: 3)
        var board4 = Array(repeating: Array(repeating: 0, count: 4), count: 4)
        var board5 = Array(repeating: Array(repeating: 0, count: 4), count: 4)

        // when
        sut.updateHitCells(&board1, 1, 0, 0, true)
        sut.updateHitCells(&board2, 2, 1, 1, true)
        sut.updateHitCells(&board3, 3, 0, 1, true)
        sut.updateHitCells(&board4, 4, 3, 2, true)
        sut.updateHitCells(&board5, 4, 3, 2, true)
        sut.updateHitCells(&board5, 4, 3, 2, false)

        // then
        let expected1 = [
            [0]
        ]
        let expected2 = [
            [-1, -1],
            [-1, 0]
        ]
        let expected3 = [
            [-1, 0, -1],
            [-1, -1, -1],
            [0, -1, 0]
        ]
        let expected4 = [
            [0, 0, -1, 0],
            [-1, 0, -1, 0],
            [0, -1, -1, -1],
            [-1, -1, 0, -1]
        ]
        let expected5 = Array(repeating: Array(repeating: 0, count: 4), count: 4)

        XCTAssertEqual(board1, expected1)
        XCTAssertEqual(board2, expected2)
        XCTAssertEqual(board3, expected3)
        XCTAssertEqual(board4, expected4)
        XCTAssertEqual(board5, expected5)
    }
}
