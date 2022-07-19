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

    func testSolution_longestIncreasingPath() {
        // given
        let matrix1 = [[9,9,4],[6,6,8],[2,1,1]]
        let matrix2 = [[3,4,5],[3,2,6],[2,2,1]]
        let matrix3 = [[1]]
        let matrix4 = [[1,2]]
        let matrix5 = [[7,8,9],[9,7,6],[7,2,3]]
        let matrix6 = [[8,13,11,18,14,16,16,4,4,8,10,11,1,19,7],
                       [2,9,15,16,14,5,8,15,9,5,14,6,10,15,5],
                       [15,16,17,10,3,6,3,4,2,17,0,12,4,1,3],
                       [13,6,13,15,15,16,4,10,7,4,19,19,4,9,13],
                       [7,1,9,14,9,11,5,4,15,19,6,0,0,13,5],
                       [9,9,15,12,15,5,1,1,18,1,2,16,15,18,9],
                       [13,0,4,18,12,0,11,0,1,15,1,15,4,2,0],
                       [11,13,12,16,9,18,6,8,18,1,5,12,17,13,5],
                       [7,17,2,5,0,17,9,18,4,13,6,13,7,2,1],
                       [2,3,9,0,19,6,6,15,14,4,8,1,19,5,9],
                       [3,10,5,11,7,14,1,5,3,19,12,5,2,13,16],
                       [0,8,10,18,17,5,5,8,2,11,5,16,4,9,14],
                       [15,9,16,18,9,5,2,5,13,3,10,19,9,14,3],
                       [12,11,16,1,10,12,6,18,6,6,18,10,9,5,2],
                       [17,9,6,6,14,9,2,2,13,13,15,17,15,3,14],
                       [18,14,12,6,18,16,4,10,19,5,6,8,9,1,6]]

        // when
        let result1 = sut.longestIncreasingPath(matrix1)
        let result2 = sut.longestIncreasingPath(matrix2)
        let result3 = sut.longestIncreasingPath(matrix3)
        let result4 = sut.longestIncreasingPath(matrix4)
        let result5 = sut.longestIncreasingPath(matrix5)
        let result6 = sut.longestIncreasingPath(matrix6)

        // then
        let expected1 = 4
        let expected2 = 4
        let expected3 = 1
        let expected4 = 2
        let expected5 = 6
        let expected6 = 7

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
        XCTAssertEqual(result4, expected4)
        XCTAssertEqual(result5, expected5)
        XCTAssertEqual(result6, expected6)
    }
}
