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

    func testSolution_setZeroes() {
        // given
        var matrix1 = [[1,1,1],[1,0,1],[1,1,1]]
        var matrix2 = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
        var matrix3 = [[1,0,3]]
        var matrix4 = [[-4,-2147483648,6,-7,0],[-8,6,-8,-6,0],[2147483647,2,-9,-6,-10]]

        // when
        sut.setZeroes(&matrix1)
        sut.setZeroes(&matrix2)
        sut.setZeroes(&matrix3)
        sut.setZeroes(&matrix4)

        // then
        let expected1 = [[1,0,1],[0,0,0],[1,0,1]]
        let expected2 = [[0,0,0,0],[0,4,5,0],[0,3,1,0]]
        let expected3 = [[0,0,0]]
        let expected4 = [[0,0,0,0,0],[0,0,0,0,0],[2147483647,2,-9,-6,0]]

        XCTAssertTrue(compareMatrices(matrix1, expected1))
        XCTAssertTrue(compareMatrices(matrix2, expected2))
        XCTAssertTrue(compareMatrices(matrix3, expected3))
        XCTAssertTrue(compareMatrices(matrix4, expected4))
    }

    func compareMatrices(_ m1: [[Int]], _ m2: [[Int]]) -> Bool {
        if (m1.count != m2.count) || (m1.isEmpty && !m2.isEmpty) || (!m1.isEmpty && m2.isEmpty) {
            return false
        }

        for i in 0..<m1.count {
            for j in 0..<m1[0].count {
                if m1[i][j] != m2[i][j] { return false }
            }
        }

        return true
    }
}
