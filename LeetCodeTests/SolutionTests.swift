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

    func testSolution_climbStairs() {
        // given
        let n1 = 2
        let n2 = 3

        // when
        let result1 = sut.climbStairs(n1)
        let result2 = sut.climbStairs(n2)

        // then
        let expected1 = 2
        let expected2 = 3

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
