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

    func testSolution_maxSubArray() {
        // given
        let nums1 = [-2,1,-3,4,-1,2,1,-5,4]
        let nums2 = [1]
        let nums3 = [5,4,-1,7,8]

        // when
        let result1 = sut.maxSubArray(nums1)
        let result2 = sut.maxSubArray(nums2)
        let result3 = sut.maxSubArray(nums3)

        // then
        let expected1 = 6
        let expected2 = 1
        let expected3 = 23

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
    }
}
