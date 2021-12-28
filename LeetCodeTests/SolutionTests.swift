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

    func testSolution_numberOfIslands() {
        // given
        let grid1: [[Character]] = [
          ["1","1","1","1","0"],
          ["1","1","0","1","0"],
          ["1","1","0","0","0"],
          ["0","0","0","0","0"]
        ]

        let grid2: [[Character]] = [
          ["1","1","0","0","0"],
          ["1","1","0","0","0"],
          ["0","0","1","0","0"],
          ["0","0","0","1","1"]
        ]

        // when
        let result1 = sut.numIslands(grid1)
        let result2 = sut.numIslands(grid2)

        // then
        let expected1 = 1
        let expected2 = 3

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
