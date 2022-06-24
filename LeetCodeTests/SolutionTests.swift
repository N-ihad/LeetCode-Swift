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
    var board: [[Character]]!

    override func setUp() {
        super.setUp()
        sut = Solution()
        board = [["5","3",".",".","7",".",".",".","."],
                 ["6",".",".","1","9","5",".",".","."],
                 [".","9","8",".",".",".",".","6","."],
                 ["8",".",".",".","6",".",".",".","3"],
                 ["4",".",".","8",".","3",".",".","1"],
                 ["7",".",".",".","2",".",".",".","6"],
                 [".","6",".",".",".",".","2","8","."],
                 [".",".",".","4","1","9",".",".","5"],
                 [".",".",".",".","8",".",".","7","9"]]
    }

    override func tearDown() {
        sut = nil
        board = nil
        super.tearDown()
    }

    func testSolution_sudokuSolver() {
        // when
        sut.solveSudoku(&board)

        // then
        let expected: [[Character]] = [["5","3","4","6","7","8","9","1","2"],
                                       ["6","7","2","1","9","5","3","4","8"],
                                       ["1","9","8","3","4","2","5","6","7"],
                                       ["8","5","9","7","6","1","4","2","3"],
                                       ["4","2","6","8","5","3","7","9","1"],
                                       ["7","1","3","9","2","4","8","5","6"],
                                       ["9","6","1","5","3","7","2","8","4"],
                                       ["2","8","7","4","1","9","6","3","5"],
                                       ["3","4","5","2","8","6","1","7","9"]]

        XCTAssertEqual(board, expected)
    }

    func test_isValidCharInSudokuBoard() {
        // given
        let char1: Character = "4" // valid
        let char2: Character = "1" // square
        let char3: Character = "7" // row
        let char4: Character = "9" // column

        // when
        let result1 = sut.isValid(&board, 0, 5, char1)
        let result2 = sut.isValid(&board, 0, 5, char2)
        let result3 = sut.isValid(&board, 0, 5, char3)
        let result4 = sut.isValid(&board, 0, 5, char4)

        // then
        let expected1 = true
        let expected2 = false
        let expected3 = false
        let expected4 = false

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
        XCTAssertEqual(result4, expected4)
    }
}
