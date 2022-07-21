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

    func testSolution_maxPoints() {
        // given
        let points1 = [[1,1],[2,2,],[3,3]]
        let points2 = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
        let points3 = [[0,0]]
        let points4 = [[0,0],[4,5],[7,8],[8,9],[5,6],[3,4],[1,1]]

        // when
        let result1 = sut.maxPoints(points1)
        let result2 = sut.maxPoints(points2)
        let result3 = sut.maxPoints(points3)
        let result4 = sut.maxPoints(points4)

        // then
        let expected1 = 3
        let expected2 = 4
        let expected3 = 1
        let expected4 = 5

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
        XCTAssertEqual(result4, expected4)
    }
}
