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

    func testSolution_missingNumber() {
        // given
        let nums1 = [3,0,1]
        let nums2 = [0,1]
        let nums3 = [9,6,4,2,3,5,7,0,1]

        // when
        let result1 = sut.missingNumber(nums1)
        let result2 = sut.missingNumber(nums2)
        let result3 = sut.missingNumber(nums3)

        // then
        let expected1 = 2
        let expected2 = 2
        let expected3 = 8

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
    }
}
