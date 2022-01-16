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

    func testSolution_rotateImage() {
        // given
        var matrix2 = [[1,2,3],[4,5,6],[7,8,9]]
        var matrix3 = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]

        // when
        sut.rotate(&matrix2)
        sut.rotate(&matrix3)

        // then
        let expected2 = [[7,4,1],[8,5,2],[9,6,3]]
        let expected3 = [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]

        XCTAssertEqual(matrix2, expected2)
        XCTAssertEqual(matrix3, expected3)
    }
}
