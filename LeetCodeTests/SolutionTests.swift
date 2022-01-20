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

    func testSolution_trapWater() {
        // given
        let heights1 = [0,1,0,2,1,0,1,3,2,1,2,1]
        let heights2 = [4,2,0,3,2,5]

        // when
        let result1 = sut.trap(heights1)
        let result2 = sut.trap(heights2)

        // then
        let expected1 = 6
        let expected2 = 9

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
