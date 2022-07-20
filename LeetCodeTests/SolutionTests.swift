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

    func testSolution_wordBreak() {
        // given
        let nums1 = [1,2,0]
        let nums2 = [3,4,-1,1]
        let nums3 = [7,8,9,11,12]
        let nums4 = [1,1]
        let nums5 = [1]

        // when
        let result1 = sut.firstMissingPositive(nums1)
        let result2 = sut.firstMissingPositive(nums2)
        let result3 = sut.firstMissingPositive(nums3)
        let result4 = sut.firstMissingPositive(nums4)
        let result5 = sut.firstMissingPositive(nums5)

        // then
        let expected1 = 3
        let expected2 = 2
        let expected3 = 1
        let expected4 = 2
        let expected5 = 2

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
        XCTAssertEqual(result4, expected4)
        XCTAssertEqual(result5, expected5)
    }
}
