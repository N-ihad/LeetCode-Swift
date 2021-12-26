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

    func testSolution_longestIncreasingSubsequence() {
        // given
        let nums1 = [10, 9, 2, 5, 3, 7, 101, 18]
        let nums2 = [0, 1, 0, 3, 2, 3]
        let nums3 = [7, 7, 7, 7, 7, 7, 7]

        // when
        let result1 = sut.lengthOfLIS(nums1)
        let result2 = sut.lengthOfLIS(nums2)
        let result3 = sut.lengthOfLIS(nums3)

        // then
        let expected1 = 4
        let expected2 = 4
        let expected3 = 1

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
    }
}
