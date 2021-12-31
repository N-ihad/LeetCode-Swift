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

    func testSolution_singleNumber() {
        // given
        let nums1 = [2,2,1]
        let nums2 = [4,1,2,1,2]
        let nums3 = [1]

        // when
        let result1 = sut.singleNumber(nums1)
        let result2 = sut.singleNumber(nums2)
        let result3 = sut.singleNumber(nums3)

        // then
        let expected1 = 1
        let expected2 = 4
        let expected3 = 1

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
    }
}
