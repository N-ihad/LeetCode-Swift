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

    func testSolution_pascalsTriangle() {
        // given
        let numRows1 = 5
        let numRows2 = 1

        // when
        let result1 = sut.generate(numRows1)
        let result2 = sut.generate(numRows2)

        // then
        let expected1 = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
        let expected2 = [[1]]

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
