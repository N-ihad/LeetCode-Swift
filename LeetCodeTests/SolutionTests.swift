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

    func testSolution_rotate_1() {
        // given
        var nums = [1,2,3,4,5,6,7]
        let k = 3

        // when
        sut.rotate(&nums, k)

        // then
        let expected = [5,6,7,1,2,3,4]

        XCTAssertEqual(nums, expected)
    }

    func testSolution_rotate_2() {
        // given
        var nums = [-1,-100,3,99]
        let k = 2

        // when
        sut.rotate(&nums, k)

        // then
        let expected = [3,99,-1,-100]

        XCTAssertEqual(nums, expected)
    }
}
