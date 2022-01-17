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

    func testSolution_plusOne() {
        // given
        let digits1 = [1,2,3]
        let digits2 = [4,3,2,1]
        let digits3 = [9]

        // when
        let result1 = sut.plusOne(digits1)
        let result2 = sut.plusOne(digits2)
        let result3 = sut.plusOne(digits3)

        // then
        let expected1 = [1,2,4]
        let expected2 = [4,3,2,2]
        let expected3 = [1,0]

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
    }
}
