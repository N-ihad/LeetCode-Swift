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

    func testSolution_intersectionOfTwoArrays() {
        // given
        let nums11 = [1,2,2,1]
        let nums12 = [2,2]

        let nums21 = [4,9,5]
        let nums22 = [9,4,9,8,4]

        // when
        let result1 = sut.intersect(nums11, nums12)
        let result2 = sut.intersect(nums21, nums22)

        // then
        let expected1 = [2,2]
        let expected2 = [4,9]

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
