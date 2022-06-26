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
        let n1 = 1
        let n2 = 2
        let n3 = 3
        let n4 = 4
        let n5 = 5
        let n6 = 6
//        let n7 = 7
//        let n8 = 8
//        let n9 = 9

        // when
        let result1 = sut.totalNQueens(n1)
        let result2 = sut.totalNQueens(n2)
        let result3 = sut.totalNQueens(n3)
        let result4 = sut.totalNQueens(n4)
        let result5 = sut.totalNQueens(n5)
        let result6 = sut.totalNQueens(n6)
//        let result7 = sut.totalNQueens(n7)
//        let result8 = sut.totalNQueens(n8)
//        let result9 = sut.totalNQueens(n9)

        // then
        let expected1 = 1
        let expected2 = 0
        let expected3 = 0
        let expected4 = 2
        let expected5 = 10
        let expected6 = 4
//        let expected7 = 40
//        let expected8 = 92
//        let expected9 = 352

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
        XCTAssertEqual(result4, expected4)
        XCTAssertEqual(result5, expected5)
        XCTAssertEqual(result6, expected6)
//        XCTAssertEqual(result7, expected7)
//        XCTAssertEqual(result8, expected8)
//        XCTAssertEqual(result9, expected9)
    }

    func test_updateHitCells() {
        // given
        var board1 = Array(repeating: Array(repeating: 0, count: 1), count: 1)
        var board2 = Array(repeating: Array(repeating: 0, count: 2), count: 2)
        var board3 = Array(repeating: Array(repeating: 0, count: 3), count: 3)
        var board4 = Array(repeating: Array(repeating: 0, count: 4), count: 4)
        var board5 = Array(repeating: Array(repeating: 0, count: 4), count: 4)

        // when
        sut.updateHitCells(&board1, 0, 0, true)
        sut.updateHitCells(&board2, 1, 1, true)
        sut.updateHitCells(&board3, 0, 1, true)
        sut.updateHitCells(&board4, 3, 2, true)
        sut.updateHitCells(&board5, 3, 2, true)
        sut.updateHitCells(&board5, 3, 2, false)

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

    func testPerformanceExample() throws {
        measure {
            
        }
    }
}
